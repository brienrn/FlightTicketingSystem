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
            text-align: left;
        }

        .auto-style11 {
            width: 400px;

            padding: 10px;
            padding-left:70px;
            
        }

        .auto-style12 {
            width:auto;
            text-align:center;
        }
    </style>


    <div class="container" style="padding-top:20px; background-color:#423F3E; width:100%;" >
        <h1 style="color:ghostwhite;">Flight Schedule</h1>
        <br />
    </div>
    <div class="container">
        <table class="custom-dropdown">
            <tr>
                <td class="auto-style12">
                    Departure Date
                </td>
                <td class="auto-style12">
                    From
                </td>
                <td class="auto-style12">
                    Destination
                </td>
            </tr>
            <tr>
                <td class="auto-style7">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" Width="350px">
                        <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                        <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                        <OtherMonthDayStyle ForeColor="#999999" />
                        <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                        <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                        <TodayDayStyle BackColor="#CCCCCC" />
                    </asp:Calendar>
                </td>
                <td class="auto-style11">
                    <asp:DropDownList ID="ddlDeptLocation" runat="server" Width="192px" CssClass="custom-dropdown" DataTextField="deptLocation" DataValueField="deptLocation" DataSourceID="sdsDeptLocation">

                    </asp:DropDownList>
                </td>
                <td class="auto-style11">

                    <asp:DropDownList ID="ddlDestination" runat="server" Width="192px" CssClass="custom-dropdown" DataTextField="destination" DataValueField="destination" DataSourceID="sdsDestination">
                    </asp:DropDownList>
                    </td>

            </tr>
            <tr>
                <td class="auto-style9">
                    <br />
                    <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="button" OnClick="btnSearch_Click" />
   
                    
                   <%-- <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="button" />--%>
                </td>
            </tr>
        </table>
    </div>
    <div class="container">
        <asp:SqlDataSource ID="sdsDeptLocation" runat="server" ConnectionString="<%$ ConnectionStrings:AtasAnginDB %>" SelectCommand="SELECT DISTINCT deptLocation FROM Schedule ORDER BY deptLocation"></asp:SqlDataSource>
        <asp:SqlDataSource ID="sdsDestination" runat="server" ConnectionString="<%$ ConnectionStrings:AtasAnginDB %>" SelectCommand="SELECT DISTINCT destination FROM Schedule ORDER BY destination"></asp:SqlDataSource>
        <asp:SqlDataSource ID="sdsSchedule" runat="server" ConnectionString="<%$ ConnectionStrings:AtasAnginDB %>" SelectCommand="SELECT planeID AS [Plane Number], deptTime AS [Departure Time], deptLocation AS [From], destination AS [To], gateNumber AS Gate FROM Schedule WHERE (deptLocation = @deptLocation) AND (destination = @destination) AND (deptDate = @deptDate) ORDER BY [Departure Time]">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlDeptLocation" PropertyName="SelectedValue" DefaultValue="Departure Location" Name="deptLocation"></asp:ControlParameter>
                <asp:ControlParameter ControlID="ddlDestination" PropertyName="SelectedValue" DefaultValue="Destination" Name="destination"></asp:ControlParameter>
                <asp:ControlParameter ControlID="Calendar1" PropertyName="SelectedDate" DefaultValue="" Name="deptDate"></asp:ControlParameter>
            </SelectParameters>
        </asp:SqlDataSource>
       
        <br />
        <asp:GridView ID="GridView1" runat="server" Width="100%" CssClass="gridview" AllowPaging="True" DataSourceID="sdsSchedule" AllowSorting="True"></asp:GridView>
        <br />
        <br />
        <asp:Button ID="btnNextPage" runat="server" Text="Next Page" PostBackUrl="~/adminSchedule/adminSchedule.aspx" />
    </div>

</asp:Content>


