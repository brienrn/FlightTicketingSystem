using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace FlightTicketingSystem
{
    public partial class FlightSchedule : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            // Retrieve the user inputs
            string deptLocation = ddlDeptLocation.SelectedValue;
            string destination = ddlDestination.SelectedValue;
            DateTime deptDate = Calendar1.SelectedDate;

            // Validate user inputs
            if (deptLocation != "Departure Location" && destination != "Destination" && deptDate != DateTime.MinValue)
            {
                // Set the parameters and rebind the GridView
                sdsSchedule.SelectParameters["deptLocation"].DefaultValue = deptLocation;
                sdsSchedule.SelectParameters["destination"].DefaultValue = destination;
                sdsSchedule.SelectParameters["deptDate"].DefaultValue = deptDate.ToString("yyyy-MM-dd");

                // Rebind the GridView
                GridView1.DataBind();
            }
            else
            {
                // Display a message to the user indicating missing or invalid inputs
                // You can use a label or another suitable way to display messages.
                // For simplicity, an alert is shown here.
                ClientScript.RegisterStartupScript(this.GetType(), "InvalidInput", "alert('Please select valid Departure Location, Destination, and Departure Date.');", true);
            }
        }
    }
}