using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FlightTicketingSystem
{
    public partial class inputSchedule : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            // Get values from input fields
            string scheduleID = txtScheduleID.Text;
            string planeID = txtPlaneID.Text;
            DateTime deptTime = DateTime.Parse(txtDeptTime.Text);
            DateTime deptDate = DateTime.Parse(txtDeptDate.Text);
            string deptLocation = txtDeptLocation.Text;
            string destination = txtDestination.Text;
            string gateNumber = txtGateNumber.Text;
            string flightStatus = txtFlightStatus.Text;
            string price = txtPrice.Text;
            string adminID = txtAdminID.Text;

           
            // Adjust connection String
            string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\AtasAnginDB.mdf;Integrated Security=True;Connect Timeout=30";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                // INSERT query
                string insertQuery = @"INSERT INTO [dbo].[Schedule] (
                                [scheduleID], [planeID], [deptTime], [deptDate], [deptLocation],
                                [destination], [gateNumber], [flightStatus], [price], [adminID]
                            )
                            VALUES (
                                @scheduleID, @planeID, @deptTime, @deptDate, @deptLocation,
                                @destination, @gateNumber, @flightStatus, @price, @adminID
                            )";

                using (SqlCommand sqlCommand = new SqlCommand(insertQuery, connection))
                {
                    sqlCommand.Parameters.AddWithValue("@scheduleID", scheduleID);
                    sqlCommand.Parameters.AddWithValue("@planeID", planeID);
                    sqlCommand.Parameters.AddWithValue("@deptTime", deptTime);
                    sqlCommand.Parameters.AddWithValue("@deptDate", deptDate);
                    sqlCommand.Parameters.AddWithValue("@deptLocation", deptLocation);
                    sqlCommand.Parameters.AddWithValue("@destination", destination);
                    sqlCommand.Parameters.AddWithValue("@gateNumber", gateNumber);
                    sqlCommand.Parameters.AddWithValue("@flightStatus", flightStatus);
                    sqlCommand.Parameters.AddWithValue("@price", price);
                    sqlCommand.Parameters.AddWithValue("@adminID", adminID);

                    sqlCommand.ExecuteNonQuery();
                }

                //Show success script pop up dialog
                // JavaScript code to display a confirmation alert
                string script = "alert('Data successfully added!\\n" +
                                "ScheduleID: " + scheduleID + "\\n" +
                                "PlaneID: " + planeID + "\\n" +
                                "DeptTime: " + deptTime.ToString("yyyy-MM-dd HH:mm:ss") + "\\n" +
                                "DeptDate: " + deptDate.ToString("yyyy-MM-dd") + "\\n" +
                                "DeptLocation: " + deptLocation + "\\n" +
                                "Destination: " + destination + "\\n" +
                                "GateNumber: " + gateNumber + "\\n" +
                                "FlightStatus: " + flightStatus + "\\n" +
                                "Price: " + price + "\\n" +
                                "AdminID: " + adminID + "');";

                // RegisterStartupScript is used to execute the JavaScript code on the client side
                ClientScript.RegisterStartupScript(this.GetType(), "confirmScript", script, true);

                // Clear the input fields after successful insertion
                ClearInputFields();
            }
        }

        private void ClearInputFields()
        {
            
            txtScheduleID.Text = string.Empty;
            txtPlaneID.Text = string.Empty;
            txtDeptTime.Text = string.Empty;
            txtDeptDate.Text = string.Empty;
            txtDeptLocation.Text = string.Empty;
            txtDestination.Text = string.Empty;
            txtGateNumber.Text = string.Empty;  
            txtFlightStatus .Text = string.Empty;   
            txtPrice .Text = string.Empty;  
            txtAdminID .Text = string.Empty;
            
        }
    }
}