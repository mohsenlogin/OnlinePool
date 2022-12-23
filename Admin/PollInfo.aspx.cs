using RoozbehExtension.BL;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace RoozbehExtension.Admin
{
    public partial class PollInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var now = PersianDateTime.Now;
            var today = now.ToString(PersianDateTimeFormat.Date);

            txtValidFrom.Attributes["onclick"] = "PersianDatePicker.Show(this,'" + today + "');";
            txtValidTo.Attributes["onclick"] = "PersianDatePicker.Show(this,'" + today + "');";
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {                       
            //sdsPoll.InsertParameters.
            //sdsPoll.Insert();
            RoozbehExtension.BL.Polls poll = new RoozbehExtension.BL.Polls();
            poll.Title = txtTitle.Text;
            string[] shamsiDate =  txtValidFrom.Text.Split(new char[]{'/'});
            
            poll.ValidFrom = new PersianDateTime(int.Parse(shamsiDate[0]),int.Parse(shamsiDate[1]),int.Parse(shamsiDate[2])).ToDateTime();
            shamsiDate = txtValidTo.Text.Split(new char[] { '/' });
            poll.ValidTo = new PersianDateTime(int.Parse(shamsiDate[0]), int.Parse(shamsiDate[1]), int.Parse(shamsiDate[2])).ToDateTime(); 
            poll.Status = "Active";
            poll.PollTypeRef = int.Parse( ddlPollType.SelectedValue);
            poll.IsManadatory = chkIsMandatory.Checked;            
            PollBL.InsertPoll(poll);
        }
    }
}