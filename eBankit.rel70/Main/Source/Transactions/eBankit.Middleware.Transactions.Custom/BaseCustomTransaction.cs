using eBankit.Business.Entities;
using eBankit.Business.Entities.Interaction;
using eBankit.Middleware.Core.Transaction;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eBankit.Middleware.Transactions.Custom
{
	public class BaseCustomTransaction : CoreTransaction
	{
		public BaseCustomTransaction(ServiceInputHeader header, BankingInteractionContext context, string transactionId)
            : base(header, context, transactionId, null)
        {

		}

		private int LanguageNo
		{
			get
			{
				/*  LanguageNo:
                     1	English
                     2	German
                     3	French
                     4	Italian
                     5	Romansche
                     6	Portuguese
                 */
				switch (Header.Language)
				{
					case "en":
					case "en-GB":
						return 1;
					case "de":
					case "de-DE":
						return 2;
					case "fr":
					case "fr-FR":
						return 3;
					case "it":
					case "it-IT":
						return 4;
					default:
						return 1;

				}
			}
		}
	}
}
