using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RoozbehExtension.BL
{
    public class Poll
    {
        public int pollTypeRef
        {
            get;
            set;
        }
        public string ip
        {
            get;
            set;

        }
        public DateTime insertDate
        {
            get;
            set;
        }
    }
}