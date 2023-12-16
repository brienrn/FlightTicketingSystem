<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FlightSchedule.aspx.cs" Inherits="FlightTicketingSystem.FlightSchedule" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <link href="flightScheduleStyles.css" type="text/css" rel="stylesheet" />
    <style type="text/css">
        .container {
            width: 80%;
            margin: 0 auto;
        }

        h1 {
            text-align: center;
        }

        /* Add any additional styles here */

        .auto-style3 {
            width: 43px;
        }
        .auto-style4{
            width: 800px;
            padding-left: 60px;
        }

        .auto-style7 {
            width: 212px;
            height: 29px;
        }

        .auto-style8 {
            width: 410px;
            height: 29px;
        }

        .auto-style9 {
            height: 29px;
        }

        .auto-style11 {
            width: 388px;
            height: 29px;
        }
        </style>
</head>
<body >
    <form id="form1" runat="server">
        <div class="container">
            <h1>Flight Schedule</h1>
            <br />

            <table class="custom-dropdown" style="width:100%;">
                <tr>
                    <td>
                        <asp:DropDownList ID="ddlSearchFor" runat="server" Width="126px" CssClass="custom-dropdown">
                            <asp:ListItem>Search for...</asp:ListItem>
                            <asp:ListItem>Flight No</asp:ListItem>
                            <asp:ListItem>Airline</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style4">
                        <asp:TextBox ID="txtSearchFor" runat="server" Width="373px" placeholder="Flight No / Airline" class="textbox"></asp:TextBox>
                    </td>
                    <td class="auto-style3">
                        <asp:ImageButton ID="btnSearchFor" runat="server" Width="30px" Height="30px" ImageUrl="~/Schedule/imgSearch.png" />
                    </td>
                    <td>
                        <asp:ImageButton ID="btnClear" runat="server" Height="30px" ImageUrl="~/Schedule/redo-arrow-symbol_44650.png" Width="30px" />
                    </td>
                </tr>
            </table>
        </div>
        <div class="container">
            <table class="custom-dropdown">
                <tr>
                    <td class="auto-style7">
                        <asp:DropDownList ID="ddlDay" runat="server" Width="118px" CssClass="custom-dropdown">
                            <asp:ListItem>Yesterday</asp:ListItem>
                            <asp:ListItem>Today</asp:ListItem>
                            <asp:ListItem>Tommorow</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style8">
                        <asp:DropDownList ID="ddlTime" runat="server" Width="238px" CssClass="custom-dropdown">
                            <asp:ListItem>Time</asp:ListItem>
                            <asp:ListItem>1PM</asp:ListItem>
                            <asp:ListItem>1400</asp:ListItem>
                            <asp:ListItem>1500</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style11">
                        <asp:DropDownList ID="ddlDestination" runat="server"  Width="192px" CssClass="custom-dropdown">
                            <asp:ListItem>All destinations</asp:ListItem>
                            <asp:ListItem>Domestic</asp:ListItem>
                            <asp:ListItem>International</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style9">
                        <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="button" />
                    </td>
                </tr>
            </table>
        </div>
        <div class="container">
            <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server"></asp:SqlDataSource>
            <br />
            <asp:GridView ID="GridView1" runat="server" Width="100%" CssClass="gridview"></asp:GridView>
            <br />
            <asp:GridView ID="GridView2" runat="server" Width="100%"></asp:GridView>
        </div>
    </form>
</body>
</html>
