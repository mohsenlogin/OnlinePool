using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RoozbehExtension.BL
{
    public class PollQuestion
    {
        public int Id
        {
            get;
            set;
        }
        public string Question
        {
            get;
            set;
        }
        public bool IsRequired
        {
            get;
            set;
        }
        public int PollRef
        {
            get;
            set;
        }
        public byte Priority
        {
            get;
            set;
        }
        public int ChoiceTypeRef
        {
            get;
            set;
        }
        public bool CheckDuplicateAnswer
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