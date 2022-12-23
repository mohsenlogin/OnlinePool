using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RoozbehExtension.BL
{
    public class PollQuestionAnswer
    {
        public int Id
        {
            get;
            set;

        }
        public int PollQuestionChoiceRef
        {
            get;
            set;
        }
        public string answer
        {
            get;
            set;
        }
        public DateTime InsertDate
        {
            get;
            set;
        }
        public string IdentityNo
        {
            get;
            set;
        }
        public string IpAddress
        {
            get;
            set;

        }
        public string Notes
        {
            get;
            set;

        }
    }
}