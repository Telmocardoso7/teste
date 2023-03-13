using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eBankit.FE.Simulators.Areas.EmailSender.Clients.MailChimp.DTO
{
    public class Schedule
    {
        public int? hour { get; set; }
        public DailySend daily_send { get; set; }
        public string weekly_send_day { get; set; }
        public int? monthly_send_date { get; set; }

        public Schedule()
        {
            this.daily_send = new DailySend();
            this.weekly_send_day = string.Empty;
        }
    }

}
