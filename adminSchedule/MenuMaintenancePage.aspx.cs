using Saslad.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Saslad.MaintenanceModule
{
    public partial class MenuMaintenancePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SaladGridView.DataBind();
            }
        }

        protected void SaladGridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Button editButton = e.Row.FindControl("EditButton") as Button;
                if (editButton != null)
                {
                    editButton.CommandName = "MyEdit";
                    editButton.CommandArgument = e.Row.RowIndex.ToString();
                }
                // Get the value of the saladStatus column
                string itemStatus = DataBinder.Eval(e.Row.DataItem, "saladStatus").ToString();

                // Find the cell that contains the saladStatus value
                TableCell statusCell = e.Row.Cells[10];

                // Set the CSS class based on the saladStatus value
                if (itemStatus == "Active")
                {
                    statusCell.CssClass = "active-status";
                }
                else if (itemStatus == "Inactive")
                {
                    statusCell.CssClass = "inactive-status";
                }
            }
        }

        protected void SaladGridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "MyEdit")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                // Retrieve data from the GridView using the row index
                SaladGridView.SelectedIndex = rowIndex;
                // Populate your custom form fields with the data
                editSaladNameTextBox.Text = SaladGridView.Rows[rowIndex].Cells[1].Text;
                editSaladDescTextBox.Text = SaladGridView.Rows[rowIndex].Cells[2].Text;
                string data = SaladGridView.Rows[rowIndex].Cells[3].Text;

                // Split the string into individual items
                string[] items = data.Split(',');

                // Trim whitespace for each item
                for (int i = 0; i < items.Length; i++)
                {
                    items[i] = items[i].Trim();
                }

                // Assign the items to their respective categories
                
                editSaladStatusDDL.Text = SaladGridView.Rows[rowIndex].Cells[10].Text;

                // Show your custom edit form
                ScriptManager.RegisterStartupScript(this, this.GetType(), "editModalScript", "$('#editModal').modal('show');", true);

            }
            //if (e.CommandName == "MyDelete")
            //{
            //    int rowIndex = Convert.ToInt32(e.CommandArgument);
            //    IngredientsGridView.SelectedIndex = rowIndex;
            //    string itemId = IngredientsGridView.Rows[rowIndex].Cells[0].Text;

            //    string deleteQuery = "DELETE FROM Item WHERE itemId = @itemId";

            //    using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            //    {
            //        using (SqlCommand command = new SqlCommand(deleteQuery, connection))
            //        {
            //            command.Parameters.AddWithValue("@itemId", itemId);
            //            connection.Open();
            //            command.ExecuteNonQuery();
            //        }
            //    }

            //    IngredientsGridView.DataBind();
            //}
        }

        protected void AddButton_Click(object sender, EventArgs e)
        {
            // Show your custom add form
            ScriptManager.RegisterStartupScript(this, this.GetType(), "addModalScript", "$('#addModal').modal('show');", true);
        }

        protected void SaveChanges_Click(object sender, EventArgs e)
        {
            // Get the updated values from the input fields
            string newName = editSaladNameTextBox.Text;
            string newDesc = editSaladDescTextBox.Text;
            string newProtein = editSaladProteinDDL.Text;
            string newVegetables = editSaladVegetablesDDL.Text;
            string newSauce = editSaladSauceDDL.Text;
            string newFruit1 = editSaladFruit1DDL.Text;
            string newFruit2 = editSaladFruit2DDL.Text;
            string newFruit3 = editSaladFruit3DDL.Text;
            string newToppings1 = editSaladToppings1DDL.Text;
            string newToppings2 = editSaladToppings2DDL.Text;
            string newToppings3 = editSaladToppings3DDL.Text;
            decimal newPrice = 0;
            decimal newTotalCarbs = 0;
            decimal newTotalFat = 0;
            decimal newTotalProtein = 0;
            decimal newTotalCalories = 0;
            string newIngredients = newProtein + ", " + newProtein + ", " + newSauce + ", " + newFruit1 + ", " + newFruit2 + ", " +
                                    newFruit3 + ", " + newToppings1 + ", " + newToppings2 + ", " + newToppings3;
            string savePath = "";
            string fileName = "";
            if (editSaladImageUpload.HasFile)
            {
                // Get the file name and extension
                fileName = editSaladImageUpload.FileName;

                // Specify the directory to save the file
                savePath = "../Imgs/Menu/";
            }
            string newStatus = editSaladStatusDDL.Text;

            string saladId = SaladGridView.SelectedDataKey.Value.ToString();

            SqlConnection con;
            string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con = new SqlConnection(strCon);
            con.Open();

            string strSelectItems = "SELECT * FROM Item";
            SqlCommand cmdSelectItems = new SqlCommand(strSelectItems, con);

            using (SqlDataReader reader = cmdSelectItems.ExecuteReader())
            {
                while (reader.Read())
                {
                    string itemName = Convert.ToString(reader["itemName"]);
                    string itemCategory = Convert.ToString(reader["itemCategory"]);

                    if (itemName == newProtein || itemName == newVegetables || itemName == newSauce ||
                        itemName == newFruit1 || itemName == newFruit2 || itemName == newFruit3 ||
                        itemName == newToppings1 || itemName == newToppings2 || itemName == newToppings3)
                    {
                        newPrice += Convert.ToDecimal(reader["itemPrice"]);
                        newTotalCarbs += Convert.ToDecimal(reader["itemCarbs"]);
                        newTotalFat += Convert.ToDecimal(reader["itemFat"]);
                        newTotalProtein += Convert.ToDecimal(reader["itemProtein"]);
                        newTotalCalories += Convert.ToDecimal(reader["itemCalories"]);
                    }
                }
            }
            string updateQuery = "UPDATE Salad SET saladName = @newName, saladDescription = @newDesc, saladIngredients = @newIngredients, saladPrice = @newPrice, " +
                                 "saladTotalCarbs = @newCarbs, saladTotalFat = @newFat, saladTotalProtein = @newProtein, saladTotalCalories = @newCalories, " +
                                 "saladImage = @filePath, saladStatus = @newStatus WHERE saladId = @saladId";

            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            {
                using (SqlCommand command = new SqlCommand(updateQuery, connection))
                {
                    command.Parameters.AddWithValue("@newName", newName);
                    command.Parameters.AddWithValue("@newDesc", newDesc);
                    command.Parameters.AddWithValue("@newIngredients", newIngredients);
                    command.Parameters.AddWithValue("@newPrice", newPrice);
                    command.Parameters.AddWithValue("@newCarbs", newTotalCarbs);
                    command.Parameters.AddWithValue("@newFat", newTotalFat);
                    command.Parameters.AddWithValue("@newProtein", newTotalProtein);
                    command.Parameters.AddWithValue("@newCalories", newTotalCalories);
                    command.Parameters.AddWithValue("@filePath", savePath + fileName);
                    command.Parameters.AddWithValue("@newStatus", newStatus);
                    command.Parameters.AddWithValue("@saladId", saladId);
                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }

            SaladGridView.DataBind();
            // Hide the modal after saving the changes
            ScriptManager.RegisterStartupScript(this, GetType(), "hideModalScript", "$('#editModal').modal('hide');", true);
        }

        protected void SaveAdd_Click(object sender, EventArgs e)
        {
            // Get the updated values from the input fields
            string newName = addSaladNameTextBox.Text;
            string newDesc = addSaladDescTextBox.Text;
            string newProtein = addSaladProteinDDL.Text;
            string newVegetables = addSaladVegetablesDDL.Text;
            string newSauce = addSaladSauceDDL.Text;
            string newFruit1 = addSaladFruit1DDL.Text;
            string newFruit2 = addSaladFruit2DDL.Text;
            string newFruit3 = addSaladFruit3DDL.Text;
            string newToppings1 = addSaladToppings1DDL.Text;
            string newToppings2 = addSaladToppings2DDL.Text;
            string newToppings3 = addSaladToppings3DDL.Text;
            decimal newPrice = 0;
            decimal newTotalCarbs = 0;
            decimal newTotalFat = 0;
            decimal newTotalProtein = 0;
            decimal newTotalCalories = 0;
            string newIngredients = newProtein + ", " + newVegetables + ", " + newSauce + ", " + newFruit1 + ", " + newFruit2 + ", " +
                                    newFruit3 + ", " + newToppings1 + ", " + newToppings2 + ", " + newToppings3;
            string savePath = "";
            string fileName = "";
            if (addSaladImageUpload.HasFile)
            {
                // Get the file name and extension
                fileName = addSaladImageUpload.FileName;

                // Specify the directory to save the file
                savePath = "../Imgs/Menu/";
            }
            string newStatus = addSaladStatusDDL.Text;

            SqlConnection con;
            string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con = new SqlConnection(strCon);
            con.Open();

            string strSelectItems = "SELECT * FROM Item";
            SqlCommand cmdSelectItems = new SqlCommand(strSelectItems, con);

            using (SqlDataReader reader = cmdSelectItems.ExecuteReader())
            {
                while (reader.Read())
                {
                    string itemName = Convert.ToString(reader["itemName"]);
                    string itemCategory = Convert.ToString(reader["itemCategory"]);

                    if (itemName == newProtein || itemName == newVegetables || itemName == newSauce ||
                        itemName == newFruit1 || itemName == newFruit2 || itemName == newFruit3 ||
                        itemName == newToppings1 || itemName == newToppings2 || itemName == newToppings3)
                    {
                        newPrice += Convert.ToDecimal(reader["itemPrice"]);
                        newTotalCarbs += Convert.ToDecimal(reader["itemCarbs"]);
                        newTotalFat += Convert.ToDecimal(reader["itemFat"]);
                        newTotalProtein += Convert.ToDecimal(reader["itemProtein"]);
                        newTotalCalories += Convert.ToDecimal(reader["itemCalories"]);
                    }
                }
            }
            string insertQuery = "INSERT INTO Salad (saladName, saladDescription, saladIngredients, saladPrice, saladTotalCarbs, saladTotalFat, saladTotalProtein, saladTotalCalories, saladImage, saladStatus) " +
                                 "VALUES (@newName, @newDesc, @newIngredients, @newPrice, @newCarbs, @newFat, @newProtein, @newCalories, @filePath, @newStatus)";

            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            {
                using (SqlCommand command = new SqlCommand(insertQuery, connection))
                {
                    command.Parameters.AddWithValue("@newName", newName);
                    command.Parameters.AddWithValue("@newDesc", newDesc);
                    command.Parameters.AddWithValue("@newIngredients", newIngredients);
                    command.Parameters.AddWithValue("@newPrice", newPrice);
                    command.Parameters.AddWithValue("@newCarbs", newTotalCarbs);
                    command.Parameters.AddWithValue("@newFat", newTotalFat);
                    command.Parameters.AddWithValue("@newProtein", newTotalProtein);
                    command.Parameters.AddWithValue("@newCalories", newTotalCalories);
                    command.Parameters.AddWithValue("@filePath", savePath + fileName);
                    command.Parameters.AddWithValue("@newStatus", newStatus);
                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }

            SaladGridView.DataBind();
            // Hide the modal after adding the new item
            ScriptManager.RegisterStartupScript(this, GetType(), "hideAddModalScript", "$('#addModal').modal('hide');", true);
            addSaladNameTextBox.Text = "";
            addSaladDescTextBox.Text = "";
            addSaladProteinDDL.Text = "White Rice";
            addSaladVegetablesDDL.Text = "Grilled Chicken Breast";
            addSaladSauceDDL.Text = "Lime Aioli";
            addSaladFruit1DDL.Text = "Japanese Cucumber";
            addSaladFruit2DDL.Text = "Japanese Cucumber";
            addSaladFruit3DDL.Text = "Japanese Cucumber";
            addSaladToppings1DDL.Text = "Sesame Seeds";
            addSaladToppings2DDL.Text = "Sesame Seeds";
            addSaladToppings3DDL.Text = "Sesame Seeds";
            addSaladStatusDDL.Text = "Active";
        }

        protected void ResetModal(object sender, EventArgs e)
        {
            addSaladNameTextBox.Text = "";
            addSaladDescTextBox.Text = "";
            addSaladProteinDDL.Text = "White Rice";
            addSaladVegetablesDDL.Text = "Grilled Chicken Breast";
            addSaladSauceDDL.Text = "Lime Aioli";
            addSaladFruit1DDL.Text = "Japanese Cucumber";
            addSaladFruit2DDL.Text = "Japanese Cucumber";
            addSaladFruit3DDL.Text = "Japanese Cucumber";
            addSaladToppings1DDL.Text = "Sesame Seeds";
            addSaladToppings2DDL.Text = "Sesame Seeds";
            addSaladToppings3DDL.Text = "Sesame Seeds";
            addSaladStatusDDL.Text = "Active";
        }

        protected void SaladGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = SaladGridView.Rows[e.RowIndex];
        }

        protected void SaladGridView_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Get the selected row index
            int selectedIndex = SaladGridView.SelectedIndex;

            // Check if a row is selected
            if (selectedIndex >= 0)
            {
                // Retrieve the selected data key
                string itemId = SaladGridView.DataKeys[selectedIndex].Value.ToString();

                // Show the edit modal
                ScriptManager.RegisterStartupScript(this, GetType(), "showModalScript", "$('#editModal').modal('show');", true);
            }
        }
    }
}
