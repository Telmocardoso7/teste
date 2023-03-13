using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eBankit.FE.Simulators.Areas.EmailSender.Clients.MailChimp.DTO
{

    public class VariateSettings
    {
        public string winning_combination_id { get; set; }
        public string winning_campaign_id { get; set; }
        public string winner_criteria { get; set; }
        public int? wait_time { get; set; }
        public int? test_size { get; set; }
        public List<string> subject_lines { get; set; }
        public List<DateTime?> send_times { get; set; }
        public List<string> from_names { get; set; }
        public List<string> reply_to_addresses { get; set; }
        public List<string> contents { get; set; }
        public List<Combination> combinations { get; set; }

        public VariateSettings()
        {
            this.winning_combination_id = string.Empty;
            this.winning_campaign_id = string.Empty;
            this.winner_criteria= string.Empty;
            this.subject_lines = new List<string>();
            this.from_names = new List<string>();
            this.reply_to_addresses = new List<string>();
            this.contents = new List<string>();
            this.combinations = new List<Combination>();

        }
    }
}
