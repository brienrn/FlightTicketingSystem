<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="MenuMaintenancePage.aspx.cs" Inherits="Saslad.MaintenanceModule.MenuMaintenancePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Css/IngredientMaintenancePage.css" rel="stylesheet" />
    <link href="../Css/PromotionMaintenancePage.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.0.7/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%--Header--%>
    <h1>Salad</h1>
    <br />
    <br />
    <asp:Button ID="AddButton" runat="server" CssClass="btn btn-primary" Text="Add" CommandName="MyAdd" OnClick="AddButton_Click" CauseValidation="false" />
    <br />
    <br />

    <%--Grid View--%>
    <div id="IngredientsContainer">
        <asp:GridView ID="SaladGridView" runat="server" CssClass="IngredientsGridView-Css"
            OnRowDataBound="SaladGridView_RowDataBound" OnRowCommand="SaladGridView_RowCommand"
            Style="width: 100%" PageSize="20" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False"
            CellPadding="4" DataKeyNames="saladId" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None"
            OnSelectedIndexChanged="SaladGridView_SelectedIndexChanged" OnRowUpdating="SaladGridView_RowUpdating">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="saladId" HeaderText="saladId" InsertVisible="False" ReadOnly="True" SortExpression="saladId" />
                <asp:BoundField DataField="saladName" HeaderText="saladName" SortExpression="saladName" />
                <asp:BoundField DataField="saladDescription" HeaderText="saladDescription" SortExpression="saladDescription" />
                <asp:BoundField DataField="saladIngredients" HeaderText="saladIngredients" SortExpression="saladIngredients" />
                <asp:BoundField DataField="saladPrice" HeaderText="saladPrice" SortExpression="saladPrice" />
                <asp:BoundField DataField="saladTotalCarbs" HeaderText="saladTotalCarbs" SortExpression="saladTotalCarbs" />
                <asp:BoundField DataField="saladTotalFat" HeaderText="saladTotalFat" SortExpression="saladTotalFat" />
                <asp:BoundField DataField="saladTotalProtein" HeaderText="saladTotalProtein" SortExpression="saladTotalProtein" />
                <asp:BoundField DataField="saladTotalCalories" HeaderText="saladTotalCalories" SortExpression="saladTotalCalories" />
                <asp:BoundField DataField="saladImage" HeaderText="saladImage" SortExpression="saladImage">
                    <ItemStyle CssClass="ImageColumn" />
                </asp:BoundField>
                <asp:BoundField DataField="saladStatus" HeaderText="saladStatus" SortExpression="saladStatus" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="EditButton" CssClass="btn btn-primary" runat="server" Text="Edit" CommandName="MyEdit" CommandArgument='<%# Container.DataItemIndex %>' CauseValidation="false" />
                    </ItemTemplate>
                </asp:TemplateField>
                <%--<asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="DeleteButton" runat="server" Text="Delete" CommandName="MyDelete" CommandArgument='<%# Container.DataItemIndex %>' OnClientClick="return confirm('Are you sure you want to delete this item?');" />
                    </ItemTemplate>
                </asp:TemplateField>--%>
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
    </div>

    <%--Data Source--%>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>
        " DeleteCommand="DELETE FROM [Salad] WHERE [saladId] = @saladId" InsertCommand="INSERT INTO [Saald] ([saladName],
        [saladDescription], [saladIngredients], [saladPrice], [saladTotalCarbs], [saladTotalFat], [saladTotalProtein], 
        [saladTotalCalories], [saladImage], [saladStatus]) VALUES (@saladName, @saladDescription, @saladIngredients,
        @saladPrice, @saladTotalCarbs, @saladTotalFat, @saladTotalProtein, @saladTotalCalories, @saladImage, @saladStatus)
        " SelectCommand="SELECT * FROM [Salad]" UpdateCommand="UPDATE [Salad] SET [saladName] = @saladName, 
        [saladDescription] = @saladDescription, [saladIngredients] = @saladIngredients, [saladPrice] = @saladPrice,
        [saladTotalCarbs] = @saladTotalCarbs, [saladTotalFat] = @saladTotalFat, [saladTotalProtein] = @saladTotalProtein,
        [saladTotalCalories] = @saladTotalCalories, [saladImage] = @saladImage, [saladStatus] = @saladStatus WHERE [saladId]
        = @saladId">
        <DeleteParameters>
            <asp:Parameter Name="saladId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="saladName" Type="String" />
            <asp:Parameter Name="saladDescription" Type="String" />
            <asp:Parameter Name="saladIngredients" Type="String" />
            <asp:Parameter Name="saladPrice" Type="Decimal" />
            <asp:Parameter Name="saladTotalCarbs" Type="Decimal" />
            <asp:Parameter Name="saladTotalFat" Type="Decimal" />
            <asp:Parameter Name="saladTotalProtein" Type="Decimal" />
            <asp:Parameter Name="saladTotalCalories" Type="Decimal" />
            <asp:Parameter Name="saladImage" Type="String" />
            <asp:Parameter Name="saladStatus" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="saladName" Type="String" />
            <asp:Parameter Name="saladDescription" Type="String" />
            <asp:Parameter Name="saladIngredients" Type="String" />
            <asp:Parameter Name="saladPrice" Type="Decimal" />
            <asp:Parameter Name="saladTotalCarbs" Type="Decimal" />
            <asp:Parameter Name="saladTotalFat" Type="Decimal" />
            <asp:Parameter Name="saladTotalProtein" Type="Decimal" />
            <asp:Parameter Name="saladTotalCalories" Type="Decimal" />
            <asp:Parameter Name="saladImage" Type="String" />
            <asp:Parameter Name="saladStatus" Type="String" />
            <asp:Parameter Name="saladId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <!-- Edit Modal -->
    <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editModalLabel">Edit Salad</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <label for="editSaladNameTextBox">Salad Name:</label>
                    <asp:TextBox ID="editSaladNameTextBox" runat="server" CssClass="form-control" />
                    <asp:RequiredFieldValidator ID="editSaladNameValidator" runat="server" ControlToValidate="editSaladNameTextBox"
                        ErrorMessage="Salad Name is required." CssClass="text-danger" Display="Dynamic" ValidationGroup="Save" />
                    <br />
                    <br />
                    <label for="editSaladDescTextBox">Salad Description:</label>
                    <asp:TextBox ID="editSaladDescTextBox" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="5" />
                    <asp:RequiredFieldValidator ID="editSaladDescValidator" runat="server" ControlToValidate="editSaladDescTextBox"
                        ErrorMessage="Salad Description is required." CssClass="text-danger" Display="Dynamic" ValidationGroup="Save" />
                    <br />
                    <br />
                    <label for="editSaladProteinDDL">Protein:</label>
                    <asp:DropDownList ID="editSaladProteinDDL" runat="server" CssClass="form-control" DataSourceID="SqlDataSourceProtein" DataTextField="itemName" DataValueField="itemName">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceProtein" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Item] WHERE ([itemCategory] = @itemCategory AND [itemStatus] = @itemStatus)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="Protein" Name="itemCategory" Type="String" />
                            <asp:Parameter DefaultValue="Active" Name="itemStatus" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <br />
                    <br />
                    <label for="editSaladVegetablesDDL">Vegetables:</label>
                    <asp:DropDownList ID="editSaladVegetablesDDL" runat="server" CssClass="form-control" DataSourceID="SqlDataSourceProtein" DataTextField="itemName" DataValueField="itemName">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceVegetables" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Item] WHERE ([itemCategory] = @itemCategory AND [itemStatus] = @itemStatus)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="Vegetables" Name="itemCategory" Type="String" />
                            <asp:Parameter DefaultValue="Active" Name="itemStatus" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <br />
                    <br />
                    <label for="editSaladSauceDDL">Sauce:</label>
                    <asp:DropDownList ID="editSaladSauceDDL" runat="server" CssClass="form-control" DataSourceID="SqlDataSourceSauce" DataTextField="itemName" DataValueField="itemName">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceSauce" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Item] WHERE ([itemCategory] = @itemCategory AND [itemStatus] = @itemStatus)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="Sauce" Name="itemCategory" Type="String" />
                            <asp:Parameter DefaultValue="Active" Name="itemStatus" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <br />
                    <br />
                    <label for="editSaladFruit1DDL">Fruit 1:</label>
                    <asp:DropDownList ID="editSaladFruit1DDL" runat="server" CssClass="form-control" DataSourceID="SqlDataSourceFruit" DataTextField="itemName" DataValueField="itemName" onchange="updateDropdowns(this)">
                    </asp:DropDownList>
                    <br />
                    <br />
                    <label for="editSaladFruit2DDL">Fruit 2:</label>
                    <asp:DropDownList ID="editSaladFruit2DDL" runat="server" CssClass="form-control" DataSourceID="SqlDataSourceFruit" DataTextField="itemName" DataValueField="itemName" onchange="updateDropdowns(this)">
                    </asp:DropDownList>
                    <br />
                    <br />
                    <label for="editSaladFruit3DDL">Fruit 3:</label>
                    <asp:DropDownList ID="editSaladFruit3DDL" runat="server" CssClass="form-control" DataSourceID="SqlDataSourceFruit" DataTextField="itemName" DataValueField="itemName" onchange="updateDropdowns(this)">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceFruit" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Item] WHERE ([itemCategory] = @itemCategory AND [itemStatus] = @itemStatus)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="Fruit" Name="itemCategory" Type="String" />
                            <asp:Parameter DefaultValue="Active" Name="itemStatus" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                    <br />
                    <br />
                    <label for="editSaladToppings1DDL">Nut/Seeds 1:</label>
                    <asp:DropDownList ID="editSaladToppings1DDL" runat="server" CssClass="form-control" DataSourceID="SqlDataSourceToppings" DataTextField="itemName" DataValueField="itemName">
                    </asp:DropDownList>
                    <br />
                    <br />
                    <label for="editSaladToppings2DDL">Nut/Seeds 2:</label>
                    <asp:DropDownList ID="editSaladToppings2DDL" runat="server" CssClass="form-control" DataSourceID="SqlDataSourceToppings" DataTextField="itemName" DataValueField="itemName">
                    </asp:DropDownList>
                    <br />
                    <br />
                    <label for="editSaladToppings3DDL">Nut/Seeds 3:</label>
                    <asp:DropDownList ID="editSaladToppings3DDL" runat="server" CssClass="form-control" DataSourceID="SqlDataSourceToppings" DataTextField="itemName" DataValueField="itemName">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceToppings" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Item] WHERE ([itemCategory] = @itemCategory AND [itemStatus] = @itemStatus)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="Topping" Name="itemCategory" Type="String" />
                            <asp:Parameter DefaultValue="Active" Name="itemStatus" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <br />
                    <br />
                    <label for="editSaladImageUpload">Salad Image:</label>
                    <asp:FileUpload ID="editSaladImageUpload" runat="server" CssClass="form-control" />
                    <asp:RequiredFieldValidator ID="editSaladImageRFV" runat="server" ControlToValidate="editSaladImageUpload"
                        ErrorMessage="Salad Image is required." CssClass="text-danger" Display="Dynamic" ForeColor="Red" ValidationGroup="Save" />
                    <br />
                    <br />
                    <label for="editSaladStatusDDL">Salad Status:</label>
                    <asp:DropDownList ID="editSaladStatusDDL" runat="server" CssClass="form-control" ValidationGroup="Save">
                        <asp:ListItem>Active</asp:ListItem>
                        <asp:ListItem>Inactive</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <asp:Button runat="server" Text="Save changes" OnClick="SaveChanges_Click" CssClass="btn btn-primary" ValidationGroup="Save" />
                </div>
            </div>
        </div>
    </div>

    <!-- Add Modal -->
    <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="addModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addModalLabel">Add Salad</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <label for="addSaladNameTextBox">Salad Name:</label>
                    <asp:TextBox ID="addSaladNameTextBox" runat="server" CssClass="form-control" />
                    <asp:RequiredFieldValidator ID="addSaladNameValidator" runat="server" ControlToValidate="addSaladNameTextBox"
                        ErrorMessage="Salad Name is required." CssClass="text-danger" Display="Dynamic" ValidationGroup="Add" />
                    <br />
                    <br />
                    <label for="addSaaldDescTextBox">Salad Desciption:</label>
                    <asp:TextBox ID="addSaladDescTextBox" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="5" />
                    <asp:RequiredFieldValidator ID="addSaladDescValidator" runat="server" ControlToValidate="addSaladDescTextBox"
                        ErrorMessage="Salad Description is required." CssClass="text-danger" Display="Dynamic" ValidationGroup="Add" />
                    <br />
                    <br />
                    <label for="addSaladProteinDDL">Protien:</label>
                    <asp:DropDownList ID="addSaladProteinDDL" runat="server" CssClass="form-control" DataSourceID="SqlDataSource1" DataTextField="itemName" DataValueField="itemName">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Item] WHERE ([itemCategory] = @itemCategory AND [itemStatus] = @itemStatus)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="Protein" Name="itemCategory" Type="String" />
                            <asp:Parameter DefaultValue="Active" Name="itemStatus" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <br />
                    <br />
                    <label for="addSaladVegetablesDDL">Vegetables:</label>
                    <asp:DropDownList ID="addSaladVegetablesDDL" runat="server" CssClass="form-control" DataSourceID="SqlDataSource3" DataTextField="itemName" DataValueField="itemName">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Item] WHERE ([itemCategory] = @itemCategory AND [itemStatus] = @itemStatus)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="Vegetables" Name="itemCategory" Type="String" />
                            <asp:Parameter DefaultValue="Active" Name="itemStatus" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <br />
                    <br />
                    <label for="addSaladSauceDDL">Sauce:</label>
                    <asp:DropDownList ID="addSaladSauceDDL" runat="server" CssClass="form-control" DataSourceID="SqlDataSource4" DataTextField="itemName" DataValueField="itemName">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Item] WHERE ([itemCategory] = @itemCategory AND [itemStatus] = @itemStatus)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="Sauce" Name="itemCategory" Type="String" />
                            <asp:Parameter DefaultValue="Active" Name="itemStatus" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <br />
                    <br />
                    <label for="addSaladFruit1DDL">Fruit 1:</label>
                    <asp:DropDownList ID="addSaladFruit1DDL" runat="server" CssClass="form-control" DataSourceID="SqlDataSource5" DataTextField="itemName" DataValueField="itemName">
                    </asp:DropDownList>
                    <br />
                    <br />
                    <label for="addSaladFruit2DDL">Fruit 2:</label>
                    <asp:DropDownList ID="addSaladFruit2DDL" runat="server" CssClass="form-control" DataSourceID="SqlDataSource5" DataTextField="itemName" DataValueField="itemName">
                    </asp:DropDownList>
                    <br />
                    <br />
                    <label for="addSaladFruit3DDL">Fruit 3:</label>
                    <asp:DropDownList ID="addSaladFruit3DDL" runat="server" CssClass="form-control" DataSourceID="SqlDataSource5" DataTextField="itemName" DataValueField="itemName">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Item] WHERE ([itemCategory] = @itemCategory AND [itemStatus] = @itemStatus)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="Fruit" Name="itemCategory" Type="String" />
                            <asp:Parameter DefaultValue="Active" Name="itemStatus" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <br />
                    <br />
                    <label for="addSaladToppings1DDL">Nut/Seeds 1:</label>
                    <asp:DropDownList ID="addSaladToppings1DDL" runat="server" CssClass="form-control" DataSourceID="SqlDataSource6" DataTextField="itemName" DataValueField="itemName">
                    </asp:DropDownList>
                    <br />
                    <br />
                    <label for="addSaladToppings2DDL">Nut/Seeds 2:</label>
                    <asp:DropDownList ID="addSaladToppings2DDL" runat="server" CssClass="form-control" DataSourceID="SqlDataSource6" DataTextField="itemName" DataValueField="itemName">
                    </asp:DropDownList>
                    <br />
                    <br />
                    <label for="addSaladToppings3DDL">Nut/Seeds 3:</label>
                    <asp:DropDownList ID="addSaladToppings3DDL" runat="server" CssClass="form-control" DataSourceID="SqlDataSource6" DataTextField="itemName" DataValueField="itemName">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Item] WHERE ([itemCategory] = @itemCategory AND [itemStatus] = @itemStatus)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="Topping" Name="itemCategory" Type="String" />
                            <asp:Parameter DefaultValue="Active" Name="itemStatus" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <br />
                    <br />
                    <label for="addSaladImageUpload">Salad Image:</label>
                    <asp:FileUpload ID="addSaladImageUpload" runat="server" CssClass="form-control" />
                    <asp:RequiredFieldValidator ID="addSaladImageRFV" runat="server" ControlToValidate="addSaladImageUpload"
                        ErrorMessage="Salad Image is required." CssClass="text-danger" Display="Dynamic" ForeColor="Red" ValidationGroup="Add" />
                    <br />
                    <br />
                    <label for="addSaladStatusDDL">Salad Status:</label>
                    <asp:DropDownList ID="addSaladStatusDDL" runat="server" CssClass="form-control">
                        <asp:ListItem>Active</asp:ListItem>
                        <asp:ListItem>Inactive</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                </div>
                <div class="modal-footer">
                    <asp:Button runat="server" Text="Dismiss" OnClick="ResetModal" CssClass="btn btn-secondary" />
                    <asp:Button runat="server" Text="Add Salad" OnClick="SaveAdd_Click" CssClass="btn btn-primary" ValidationGroup="Add" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>

