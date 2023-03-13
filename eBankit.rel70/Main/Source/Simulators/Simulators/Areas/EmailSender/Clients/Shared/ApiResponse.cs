namespace eBankit.FE.Simulators.Areas.EmailSender.Clients.Shared
{
    public class ApiResponse<TError>
    {
        public TError Error { get; set; }

        public bool Success { get; set; }
    }

    public class ApiResponse<TSuccess, TError> : ApiResponse<TError>
    {
        public TSuccess Result { get; set; }
    }
}