using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RoozbehExtension.Admin
{
    public partial class PollList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            sdsPolls.DataBind();
        }
    }
}