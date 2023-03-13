using eBankit.FE.Simulators.CTI.Context.Interfaces;
using eBankit.FE.Simulators.CTI.ViewModels;
using eBankit.LIB.ApiModel.Interaction.Enums;
using Ebankit.Core.MultiTenancy.Common.Retriever.Interfaces;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;

namespace eBankit.FE.Simulators.CTI.Controllers
{
    public class SilenceManagerController : BaseCTIController
    {
        private readonly ICtiContext _context;

        public SilenceManagerController(ITenantRetriever tenantRetriever, ICtiContext context) : base(tenantRetriever)
        {
            _context = context;
        }

        public IActionResult Index()
        {
            var viewModel = new ResumeViewModel
            {
                Users = _context.Managment.Users,
                PendingInteractions = _context.Managment.PendingInteractions,
                IncomingInteractions = _context.Managment.IncomingCalls,
                SelectUser = _context.Managment.Users.FirstOrDefault(x => x.Username == _context.SelectUsername),
                HasUsers = _context.Managment.Users.Any(),
                HasMoreThanUser = _context.Managment.Users.Any(x => x.Username != _context.SelectUsername)
            };

            return View("Index", viewModel);
        }

        public IActionResult NewCall()
        {
            var viewModel = new NewCallViewModel()
            {
                InteractionDirection = EbankitInteractionDirection.Inbound
            };

            return PartialView("NewCall", viewModel);
        }

        public IActionResult ConfirmNewCall(NewCallViewModel viewModel)
        {
            if (viewModel.InteractionDirection == EbankitInteractionDirection.Inbound)
            {
                _context.NewCall(EbankitInteractionType.Voice, true);
            }
            else if (viewModel.InteractionDirection == EbankitInteractionDirection.Outbound)
            {
                _context.NewCall(EbankitInteractionType.Voice_Outbound, false);

                var authViewModel = new AutenticateCallViewModel()
                {
                    InteractionId = viewModel.InteractionId,
                    ShowAccessCode = false,
                    InteractionType = (int)EbankitInteractionType.Voice_Outbound
                };

                return View("IdentifyCall", authViewModel);
            }

            return RedirectToAction("Index");
        }

        public IActionResult NewEmail()
        {
            _context.NewEmail();

            return Ok(true);
        }

        public IActionResult CloseCall(Guid identifier)
        {
            _context.CloseInteraction(identifier);

            return Ok(true);
        }

        public IActionResult Assign(Guid identifier)
        {
            var viewModel = new AssignViewModel
            {
                InteractionId = identifier,
                InteractionType = _context.Managment.PendingInteractions.First(x => x.Identifier == identifier).InteractionType,
                Users = _context.Managment.Users
            };

            return PartialView("Assign", viewModel);
        }

        public IActionResult ConfirmAssign(string extension, Guid identifier, string emailFrom = "", string emailSubject = "", string emailBody = "")
        {
            if (!string.IsNullOrEmpty(emailBody))
            {
                emailBody = emailBody.Replace("\n", "<br/>");
            }

            _context.AssignInteraction(extension, identifier, emailFrom, emailSubject, emailBody);

            return Ok(true);
        }


        public IActionResult IdentifyCall(Guid identifier)
        {
            var viewModel = new AutenticateCallViewModel { InteractionId = identifier };

            return PartialView("IdentifyCall", viewModel);
        }

        public IActionResult ConfirmIdentifyCall(string identifier, string clientNumber, int interactionType)
        {
            if (interactionType == (int)EbankitInteractionType.Voice_Outbound)
                identifier = _context.NewInteraction(EbankitInteractionType.Voice_Outbound).ToString();

            _context.IdentifyCall(Guid.Parse(identifier), clientNumber);

            return RedirectToAction("Index");
        }


        public IActionResult AuthenticateCall(Guid identifier)
        {
            var viewModel = new AutenticateCallViewModel { InteractionId = identifier, ShowAccessCode = true };

            return PartialView("AuthenticateCall", viewModel);
        }

        public IActionResult ImpersonateCall(Guid identifier)
        {
            var viewModel = new AutenticateCallViewModel { InteractionId = identifier, ShowAccessCode = false };

            return PartialView("AuthenticateCall", viewModel);
        }

        public IActionResult ConfirmAuthenticateCall(Guid identifier, string clientNumber, string accessCode, EbankitInteractionType interactionType)
        {
            _context.AuthenticateCall(identifier, clientNumber, accessCode);

            return Ok(true);
        }

        public IActionResult DoTransferMoney(Guid identifier)
        {
            var viewModel = new AutenticateCallViewModel { InteractionId = identifier };

            return PartialView("DoTransferMoney", viewModel);
        }

        public IActionResult CofirmDoTransferMoney(TransferMoney transferMoney)
        {
            _context.DoTransferMoney(transferMoney);
            return Ok(true);
        }

        public IActionResult AutenticateUser(string username)
        {
            var extension = DateTime.Now.ToString("hhmmss");
            _context.AddUser(username, extension);

            return Ok(true);
        }

        public IActionResult LogoutUser(string username, bool forceLogout)
        {
            _context.LogoutUser(username, forceLogout);
            return Ok(true);
        }

        public IActionResult SelectUser(string username)
        {
            _context.SetUser(username);
            return Ok(true);
        }

        public IActionResult StartCall(IFormCollection formItems)
        {
            var username = string.Empty;
            var identifier = Guid.Empty;
            string route = null;
            string navigation = null;
            var extraParams = new Dictionary<string, string>();
            foreach (var item in formItems)
            {
                if (item.Key.Equals("interactionid", StringComparison.InvariantCultureIgnoreCase))
                {
                    identifier = new Guid(item.Value);
                }
                else if (item.Key.Equals("username", StringComparison.InvariantCultureIgnoreCase))
                {
                    username = item.Value;
                }
                else if (item.Key.Equals("Route") && !string.IsNullOrEmpty(item.Value.ToString()))
                {
                    route = item.Value;
                }
                else if (item.Key.Equals("ProcessId") && !string.IsNullOrEmpty(item.Value.ToString()))
                {
                    navigation = $"/Processes/{item.Value.ToString().Trim()}/Details?dashboardLink=/Processes/Search?recoverFilters=True";
                }
                else if (!item.Key.Equals("destination", StringComparison.InvariantCultureIgnoreCase)
                        && !item.Key.Equals("interactionid", StringComparison.InvariantCultureIgnoreCase)
                        && !item.Key.Equals("origin", StringComparison.InvariantCultureIgnoreCase)
                        && !item.Key.Equals("isinbound", StringComparison.InvariantCultureIgnoreCase)
                        && !item.Key.Equals("__RequestVerificationToken", StringComparison.InvariantCultureIgnoreCase)
                        && !item.Key.Equals("Route", StringComparison.InvariantCultureIgnoreCase)
                        && !item.Key.Equals("ProcessId", StringComparison.InvariantCultureIgnoreCase)
                        && !string.IsNullOrEmpty(item.Value)
                    )
                {
                    extraParams.Add(item.Key, item.Value);
                }
            }

            _context.StartCall(username, identifier, extraParams, route, navigation);

            return RedirectToAction("Index");
        }

        public IActionResult EndCall(IFormCollection formItems)
        {
            var username = string.Empty;
            var identifier = Guid.Empty;
            var reason = string.Empty;
            var closeAutomatic = false;
            var extraParams = new Dictionary<string, string>();
            bool forceEndCall = false;

            foreach (var item in formItems)
            {
                if (item.Key.Equals("interactionid", StringComparison.InvariantCultureIgnoreCase))
                {
                    identifier = new Guid(item.Value);
                }
                else if (item.Key.Equals("username", StringComparison.InvariantCultureIgnoreCase))
                {
                    username = item.Value;
                }
                else if (item.Key.Equals("Reason"))
                {
                    reason = item.Value;
                }
                else if (item.Key.Equals("AutomaticClose"))
                {
                    closeAutomatic = bool.Parse(item.Value.ToString().Split(',')[0]);
                }
                else if (item.Key.Equals("forceEndCall", StringComparison.InvariantCultureIgnoreCase))
                {
                    forceEndCall = item.Value.ToString().Equals("S", StringComparison.InvariantCultureIgnoreCase);
                }
            }

            _context.EndCall(username, identifier, closeAutomatic, reason, forceEndCall);
            return RedirectToAction("Index");
        }

        public IActionResult TransferCall(Guid identifier, string username)
        {
            _context.SetUser(username);

            var viewModel = new TransferCallViewModel
            {
                InteractionId = identifier,
                Users = _context.Managment.Users.Where(x => x.Username != _context.SelectUsername).ToList(),
                SelectUser = _context.Managment.Users.FirstOrDefault(x => x.Username == _context.SelectUsername)
            };

            return PartialView("TransferCall", viewModel);
        }

        public IActionResult ConfirmTransferCall(Guid identifier, string username, string toExtension)
        {
            _context.TransferCall(identifier, username, toExtension, null);
            return Ok(true);
        }

        public IActionResult TransferToIvr(string username, Guid identifier)
        {
            _context.TransferCallToIvr(identifier, username);

            return Ok(true);
        }

        public IActionResult TransferFromIvr(Guid identifier)
        {
            _context.TransferCallFromIvr(identifier);

            return Ok(true);
        }

        public IActionResult CloseEmail(Guid identifier)
        {
            _context.CloseEmailOnExtension(identifier);

            return Ok(true);
        }
    }
}
