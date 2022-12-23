using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RoozbehExtension.BL
{
    public class Polls
    {
        public int Id
        {
            get;
            set;
        }
        public int PollTypeRef
        {
            get;
            set;
        }
        public string Title
        {
            get;
            set;
        }
        public DateTime ValidFrom
        {
            get;
            set;
        }
        public DateTime ValidTo
        {
            get;
            set;
        }
        public string Status
        {
            get;
            set;
        }
        public bool IsManadatory
        {
            get;
            set;
        }
        public DateTime Date
        {
            get;
            set;
        }
        public DateTime InsertDate
        {
            get;
            set;
        }
    }
}