<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="FlightSchedule.aspx.cs" Inherits="FlightTicketingSystem.FlightSchedule" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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

        .auto-style4 {
            width: 765px;
            padding-left: 20px;
        }

        .auto-style7 {
            width: 242px;
            height: 29px;
        }

        .auto-style9 {
            height: 29px;
        }

        .auto-style11 {
            width: 577px;
            height: 29px;
            padding-left: 150px;
        }

        .auto-style12 {
            width: 161px;
        }
    </style>


    <div class="container">
        <h1>Flight Schedule</h1>
        <br />

        <table class="custom-dropdown" style="width: 100%;">
            <tr>
                <td class="auto-style12">Airplane Number:</td>
                <td class="auto-style4">
                    <asp:TextBox ID="txtSearchFor" runat="server" Width="373px" placeholder="Flight No" class="textbox"></asp:TextBox>
                </td>
                <td class="auto-style3">
                    <asp:ImageButton ID="btnSearchFor" runat="server" Width="30px" Height="30px" ImageUrl="~/Schedule/imgSearch.png" />
                </td>

            </tr>
        </table>
    </div>
    <div class="container">
        <table class="custom-dropdown">
            <tr>
                <td class="auto-style7">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    Departure Date<asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" Width="350px">
                        <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                        <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                        <OtherMonthDayStyle ForeColor="#999999" />
                        <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                        <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                        <TodayDayStyle BackColor="#CCCCCC" />
                    </asp:Calendar>
                </td>
                <td class="auto-style11">
                    <asp:DropDownList ID="ddlDestination" runat="server" Width="192px" CssClass="custom-dropdown">
                        <asp:ListItem>All destinations</asp:ListItem>
                        <asp:ListItem>Domestic</asp:ListItem>
                        <asp:ListItem>International</asp:ListItem>
                    </asp:DropDownList>
                    &nbsp;</td>
                <td class="auto-style9">
                    <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="button" />
                    <br />
                    <br />
                    <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="button" />
                </td>
            </tr>
        </table>
    </div>
    <div class="container">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server"></asp:SqlDataSource>
        <br />
        <asp:GridView ID="GridView1" runat="server" Width="100%" CssClass="gridview">
        </asp:GridView>
        <br />
    </div>

</asp:Content>


