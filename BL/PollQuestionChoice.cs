using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RoozbehExtension.BL
{
    public class PollQuestionChoice
    {
        public int Id
        {
            get;
            set;
        }
        public int PollQuestionRef
        {
            get;
            set;
        }
        public string Title
        {
            get;
            set;
        }
        public string DefaultValue
        {
            get;
            set;
        }
        public string Status
        {
            get;
            set;
        }

    }
}