<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="inputSchedule.aspx.cs" Inherits="FlightTicketingSystem.inputSchedule" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="adminflightScheduleStyles.css" type="text/css" rel="stylesheet" />
    <style>

        .input {
            width: 60%;
            padding: 5px;
            margin-bottom: 10px;
        }

        .txtBoxSize {
            width: 100px;
        }

        .button-primary {
            background-color: #464d46;
            color: white;
            padding: 10px;
            cursor: pointer;
        }
        .container {
            width: 100%;
            padding: 20px;
            text-align: center;
        }
        .button-container {
            text-align: center;
        }
        .auto-style11 {
        width: 200px;

        padding: 10px;
        padding-left:450px;
    
        }
        .auto-style10{
            width:400px;
            padding:10px;
        }
    </style>
    <script>
        function clearForm() {
            document.getElementById('<%=txtScheduleID.ClientID%>').value = '';
                    document.getElementById('<%=txtPlaneID.ClientID%>').value = '';
                    document.getElementById('<%=txtDeptTime.ClientID%>').value = '';
                    document.getElementById('<%=txtDeptDate.ClientID%>').value = '';
                    document.getElementById('<%=txtDeptLocation.ClientID%>').value = '';
                    document.getElementById('<%=txtDestination.ClientID%>').value = '';
                    document.getElementById('<%=txtGateNumber.ClientID%>').value = '';
                    document.getElementById('<%=txtFlightStatus.ClientID%>').value = '';
                    document.getElementById('<%=txtPrice.ClientID%>').value = '';
                    document.getElementById('<%=txtAdminID.ClientID%>').value = '';
        }
    </script>
    <div class="container">
        <h2 style="text-align: center;">Add New Schedule</h2>

        <table>
            <tr>
                <td class="auto-style11">
                    <asp:Label ID="lblScheduleID" runat="server" Text="Schedule ID"></asp:Label>
                </td>
                <td class="auto-style10">
                    <asp:TextBox ID="txtScheduleID" runat="server" CssClass="input" MaxLength="10"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="revScheduleID" runat="server" ErrorMessage="Format S100????" ForeColor="Red" ControlToValidate="txtScheduleID" ValidationExpression="^S100\w{3}$">*</asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="rfvScheduleID" runat="server" ControlToValidate="txtScheduleID" ErrorMessage="Schedule ID required" ForeColor="Red">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style11">
                    <asp:Label ID="lblPlaneID" runat="server" Text="Plane ID"></asp:Label>
                </td>
                <td class="auto-style10">
                    <asp:TextBox ID="txtPlaneID" runat="server" CssClass="input" MaxLength="10"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="revPlaneID" runat="server" ErrorMessage="Format P100001-P100010" ForeColor="Red" ControlToValidate="txtPlaneID" ValidationExpression="^P10000[1-9]|10$">*</asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="rfvPlaneID" runat="server" ControlToValidate="txtPlaneID" ErrorMessage="Plane ID Required" ForeColor="Red">*</asp:RequiredFieldValidator>

                </td>
            </tr>
            <tr>
                <td class="auto-style11">
                    <asp:Label ID="lblDeptTime" runat="server" Text="Departure Time"></asp:Label>
                </td>
                <td class="auto-style10">
                    <asp:TextBox ID="txtDeptTime" runat="server" CssClass="input" TextMode="DateTimeLocal"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvDeptTime" runat="server" ControlToValidate="txtDeptTime" ErrorMessage="Departure Time Required" ForeColor="Red">*</asp:RequiredFieldValidator>

                </td>
            </tr>
            <tr>
                <td class="auto-style11">
                    <asp:Label ID="lblDeptDate" runat="server" Text="Departure Date"></asp:Label>
                </td>
                <td class="auto-style10">
                    <asp:TextBox ID="txtDeptDate" runat="server" CssClass="input" TextMode="Date"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvDeptDate" runat="server" ControlToValidate="txtDeptDate" ErrorMessage="Departure Date Required" ForeColor="Red">*</asp:RequiredFieldValidator>

                </td>
            </tr>
            <tr>
                <td class="auto-style11">
                    <asp:Label ID="lblDeptLocation" runat="server" Text="Departure Location"></asp:Label>
                </td>
                <td class="auto-style10">
                    <asp:TextBox ID="txtDeptLocation" runat="server" CssClass="input"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvDeptLocation" runat="server" ControlToValidate="txtDeptLocation" ErrorMessage="Departure Location Required" ForeColor="Red">*</asp:RequiredFieldValidator>

                </td>
            </tr>
            <tr>
                <td class="auto-style11">
                    <asp:Label ID="lblDestination" runat="server" Text="Destination"></asp:Label>
                </td>
                <td class="auto-style10">
                    <asp:TextBox ID="txtDestination" runat="server" CssClass="input"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvTxtDestination" runat="server" ControlToValidate="txtDestination" ErrorMessage="Arrival Destination Required" ForeColor="Red">*</asp:RequiredFieldValidator>

                </td>
            </tr>
            <tr>
                <td class="auto-style11">
                    <asp:Label ID="lblGateNumber" runat="server" Text="Gate Number"></asp:Label>
                </td>
                <td class="auto-style10">
                    <asp:TextBox ID="txtGateNumber" runat="server" CssClass="input"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="revGateNumber" runat="server" ErrorMessage="'Gate' followed by one or two uppercase letters and one or more digits." ForeColor="Red" ControlToValidate="txtGateNumber" ValidationExpression="^Gate [A-Z]{1}[A-Z]?[0-9]+$">*</asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="rfvGateNumber" runat="server" ControlToValidate="txtGateNumber" ErrorMessage="Gate Number Required" ForeColor="Red">*</asp:RequiredFieldValidator>

                </td>
            </tr>
            <tr>
                <td class="auto-style11">
                    <asp:Label ID="lblFlightStatus" runat="server" Text="Flight Status"></asp:Label>
                </td>
                <td class="auto-style10">
                    <asp:TextBox ID="txtFlightStatus" runat="server" CssClass="input"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvFlightStatus" runat="server" ControlToValidate="txtFlightStatus" ErrorMessage="Flight Status Required" ForeColor="Red">*</asp:RequiredFieldValidator>

                </td>
            </tr>
            <tr>
                <td class="auto-style11">
                    <asp:Label ID="lblPrice" runat="server" Text="Price"></asp:Label>
                </td>
                <td class="auto-style10">
                    <asp:TextBox ID="txtPrice" runat="server" CssClass="input"></asp:TextBox>
<%--                    <asp:RegularExpressionValidator ID="revPrice" runat="server" ErrorMessage="one or more digits, optionally followed by a decimal part,ends with  'MYR'" ForeColor="Red" ControlToValidate="txtPrice" ValidationExpression="^\d+(\.\d{1,2})? MYR$">*</asp:RegularExpressionValidator>--%>
                    <asp:RequiredFieldValidator ID="rfvPrice" runat="server" ControlToValidate="txtPrice" ErrorMessage="Price Required" ForeColor="Red">*</asp:RequiredFieldValidator>

                </td>
            </tr>
            <tr>
                <td class="auto-style11">
                    <asp:Label ID="lblAdminID" runat="server" Text="Admin ID"></asp:Label>
                </td>
                <td class="auto-style10">
                    <asp:TextBox ID="txtAdminID" runat="server" CssClass="input" MaxLength="10"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="revAdminID" runat="server" ErrorMessage="A100001-A100010 Only" ForeColor="Red" ControlToValidate="txtAdminID" ValidationExpression="^A10000[1-9]|A100010$
">*</asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="rfvAdminID" runat="server" ControlToValidate="txtAdminID" ErrorMessage="Admin ID required" ForeColor="Red">*</asp:RequiredFieldValidator>

                </td>
            </tr>
            <tr >
                <td class="auto-style11">
                    <br />
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" />
                </td>
            </tr>
            <tr>
                <td class="auto-style11" style="text-align:right;">
                    <asp:Button ID="btnConfirm" runat="server" Text="Confirm" CssClass="button " OnClick="btnConfirm_Click" />
                </td>
                <td class="auto-style10" style="text-align:left;">
                    <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="button button-primary" OnClientClick="clearForm(); return false;" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnPrevPage" runat="server" Text="Previous Page" CssClass="button button-primary" PostBackUrl="~/adminSchedule/adminSchedule.aspx" />
                </td>
            </tr>
        </table>

    </div>
</asp:Content>
