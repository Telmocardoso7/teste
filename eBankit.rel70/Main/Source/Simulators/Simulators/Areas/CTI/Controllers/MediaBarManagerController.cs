using eBankit.FE.Common.Entities.Models;
using eBankit.FE.Common.Entities.Service;
using eBankit.FE.Simulators.CTI.Context.Interfaces;
using eBankit.FE.Simulators.CTI.Signals;
using eBankit.FE.Simulators.CTI.Signals.Interfaces;
using eBankit.LIB.ApiModel.ContactCenter;
using Ebankit.Core.MultiTenancy.Common.Retriever.Interfaces;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.SignalR;
using System;
using System.Linq;

namespace eBankit.FE.Simulators.CTI.Controllers
{
    [Route("{area}/{controller}")]
    public class MediaBarManagerController : BaseCTIController
    {
        private readonly ICtiContext _context;
        private readonly ISimulatorInteractions _hubInteractions;

        public MediaBarManagerController(ITenantRetriever tenantRetriever, ICtiContext context, IHubContext<SimulatorHub> connectionManager, ISimulatorInteractions hubInteractions)
            : base(tenantRetriever)
        {
            _context = context;
            _hubInteractions = hubInteractions;
            _hubInteractions.SetClients(connectionManager.Clients);
        }

        [HttpGet("RegisterAuthUser/{id}")]
        public IActionResult RegisterAuthUserCti(string id)
        {
            var userConnection = new UserConnection
            {
                UserId = "SimulatorUser" + Environment.MachineName
               ,
                UserSession = HttpContext.Request.Cookies[".eBankit.Session.Simulator"]
               ,
                ConnectionId = id

            };

            var connection = HubsConnections.GetConnectionMapping(_tenantRetriever);
            connection.Add(userConnection.UserId, userConnection);
            HubsConnections.SetConnectionMapping(_tenantRetriever, connection);

            return Ok(userConnection.UserId);
        }

        /// <summary>
        /// Transfer a call from one extension to another
        /// </summary>
        /// <param name="callToTransfer">Call</param>
        /// <returns></returns>
        [HttpPost("TransferCall")]
        public IActionResult TransferCall([FromBody] TransferCall callToTransfer)
        {
            try
            {
                var originUser = _context.GetUserByExtension(callToTransfer.Origin);
                _context.TransferCall(callToTransfer.InteractionId, originUser.Username, callToTransfer.Destination, callToTransfer.Route);
                _hubInteractions.TransferCall(callToTransfer.Origin, callToTransfer.Destination, callToTransfer.InteractionId);
                return Ok(new ServiceResult<bool>(true));
            }
            catch (Exception)
            {
                return BadRequest(new ServiceResult<bool>(false));
            }
        }

        /// <summary>
        /// Add a incoming call from contact center
        /// </summary>
        /// <param name="incommingCall">Call</param>
        /// <returns></returns>
        [HttpPost("CallIncoming")]
        public IActionResult CallIncoming([FromBody] IncommingCall incommingCall)
        {
            try
            {
                if (!_hubInteractions.CheckIfUserIsOnline())
                {
                    return BadRequest(new ServiceResult<bool>(false));
                }
                _context.AddIncomingCall(incommingCall);
                _hubInteractions.CallIncoming(incommingCall.Origin, incommingCall.InteractionId, incommingCall.Destination);

                return Ok(new ServiceResult<bool>(true));
            }
            catch (Exception)
            {
                return BadRequest(new ServiceResult<bool>(false));
            }
        }

        /// <summary>
        /// Add a answered call on contact center, to context
        /// </summary>
        /// <param name="callAnswer">Call</param>
        /// <returns></returns>
        [HttpPost("Call/Answered")]
        public IActionResult CallAnswer([FromBody] IncommingCall callAnswer)
        {
            try
            {
                var user = _context.GetUserByExtension(callAnswer.Destination);
                _context.CallAnswer(user.Username, callAnswer.InteractionId);
                _hubInteractions.CallAnswered(callAnswer.InteractionId);

                return Ok(new ServiceResult<bool>(true));
            }
            catch (Exception)
            {
                return BadRequest(new ServiceResult<bool>(false));
            }

        }

        /// <summary>
        /// Hangup a call
        /// </summary>
        /// <param name="callToHangUp">Call</param>
        /// <returns></returns>
        [HttpPost("Call/HangUp")]
        public IActionResult CallHangUp([FromForm] IncommingCall callToHangUp)
        {
            try
            {
                var user = _context.GetUserByExtension(callToHangUp.Destination);
                _context.CallHangUp(user.Username, callToHangUp.InteractionId);
                _hubInteractions.UpdateSimulator();
                return Ok(new ServiceResult<bool>(true));
            }
            catch (Exception)
            {
                return BadRequest(new ServiceResult<bool>(false));
            }

        }

        /// <summary>
        /// Answer a incoming call from contact center 
        /// </summary>
        /// <param name="identifier">The interaction id of call</param>
        /// <returns></returns>
        [HttpPost("ConfirmAnswerCall")]
        public IActionResult ConfirmAnswerCall(Guid identifier)
        {
            try
            {
                var interaction = _context.Managment.IncomingCalls.First(x => x.Identifier == identifier);
                var user = _context.GetUserByExtension(interaction.ClientNumber);
                _context.AssignIncomingInteraction(interaction.ClientNumber, identifier, "", "", "");
                _context.StartCall(user.Username, identifier, null, null);
                return Ok(new ServiceResult<bool>(true));
            }
            catch (Exception)
            {
                return BadRequest(new ServiceResult<bool>(false));
            }
        }

        /// <summary>
        /// Ignore the incoming call from contact center
        /// </summary>
        /// <param name="identifier"></param>
        /// <returns></returns>
        [HttpPost("IgnoreCall")]
        public IActionResult IgnoreCall(Guid identifier)
        {
            try
            {
                _context.IgnoreCall(identifier);
                return Ok(new ServiceResult<bool>(true));
            }
            catch (Exception)
            {
                return BadRequest(new ServiceResult<bool>(false));
            }
        }

        [HttpPost("FreeAgentExtension")]
        public IActionResult FreeAgentExtension([FromBody] IncommingCall call)
        {
            if (call == null || string.IsNullOrEmpty(call.Destination))
                return Ok(new ServiceResult<bool>(true));

            try
            {
                var user = _context.GetUserByExtension(call.Destination);

                if (user != null)
                    _context.FreeUserExtension(user.Username);

                _hubInteractions.UpdateSimulator();
                return Ok(new ServiceResult<bool>(true));
            }
            catch (Exception)
            {
                return BadRequest(new ServiceResult<bool>(false));
            }
        }

        [HttpPost("EndInteractionByAgent")]
        public IActionResult EndInteractionByAgent([FromBody] IncommingCall call)
        {
            if (call == null || call.InteractionId == Guid.Empty)
                return Ok(new ServiceResult<bool>(true));

            try
            {
                Models.UserManagement user = null;
                if (!string.IsNullOrEmpty(call.Destination))
                    user = _context.GetUserByExtension(call.Destination);

                _context.RemoveInteraction(call.InteractionId, user?.Username);
                _hubInteractions.EndCallByAgent(call.Destination, call.InteractionId);
                return Ok(new ServiceResult<bool>(true));
            }
            catch (Exception)
            {
                return BadRequest(new ServiceResult<bool>(false));
            }
        }

        [HttpDelete("LogoutUserByAgent/{username}")]
        public IActionResult LogoutUserByAgent(string username)
        {
            if (string.IsNullOrEmpty(username))
                return Ok();

            try
            {
                _context.LogoutUser(username, false);
                _hubInteractions.LogoutByAgent(username);
                return Ok(new ServiceResult<bool>(true));
            }
            catch (Exception)
            {
                return BadRequest(new ServiceResult<bool>(false));
            }
        }

        [HttpPost("Call/Pause")]
        public IActionResult CallPause([FromBody] IncommingCall call)
        {
            if (call == null || call.InteractionId == Guid.Empty)
                return Ok(new ServiceResult<bool>(false));

            try
            {
                Models.UserManagement user = null;
                if (!string.IsNullOrEmpty(call.Destination))
                    user = _context.GetUserByExtension(call.Destination);

                _context.TransferCallToIvr(call.InteractionId, user.Username);
                _hubInteractions.CallPausedByAgent(user.Username, call.InteractionId);

                return Ok(new ServiceResult<bool>(true));
            }
            catch (Exception)
            {
                return BadRequest(new ServiceResult<bool>(false));
            }
        }

        [HttpPost("Call/BlindTransfer")]
        public IActionResult BlindTransferCall([FromBody] IncommingCall call)
        {
            if (call == null || call.InteractionId == Guid.Empty)
                return Ok(new ServiceResult<bool>(false));

            try
            {
                Models.UserManagement user = null;
                if (!string.IsNullOrEmpty(call.Origin))
                    user = _context.GetUserByExtension(call.Origin);

                _context.BlindTransferCallFromAgent(user?.Username, call.InteractionId);
                _hubInteractions.BlindTransferedCall(user?.Extension, call.InteractionId);
                return Ok(new ServiceResult<bool>(true));
            }
            catch (Exception)
            {
                return BadRequest(new ServiceResult<bool>(false));
            }
        }

        [HttpPost("Call/AnsweredByOperator")]
        public IActionResult AnswerCallByOperator([FromBody] IncomingCall call)
        {
            try
            {
                var user = _context.GetUserByExtension(call.Destination);
                _context.StartCall(user.Username, call.InteractionId, null, null);
                _hubInteractions.CallAnswered(call.InteractionId);

                return Ok(new ServiceResult<bool>(true));
            }
            catch (Exception)
            {
                return BadRequest(new ServiceResult<bool>(false));
            }
        }

    }
}
