<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminSchedule.aspx.cs" Inherits="FlightTicketingSystem.adminSchedule.adminSchedule" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <link href="adminflightScheduleStyles.css" type="text/css" rel="stylesheet" />
    <style type="text/css">
        .container {
            width: 80%;
            margin: 0 auto;
        }

        h1 {
            text-align: center;
        }

        s
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
            padding-left: 70px;
        }

        .auto-style12 {
            width: auto;
            text-align: center;
        }
    </style>
   
        
        <div class="container">
                    <asp:Button ID="btnAddSchedule" runat="server" Text="Add Schedule" CssClass="button" Style="text-align: right;"  PostBackUrl="~/adminSchedule/inputSchedule.aspx" />
                    <br />
                    <asp:GridView ID="gvSchedule" runat="server" Width="100%" CssClass="gridview" AllowPaging="True" AllowSorting="True" DataSourceID="sdsViewSchedule">
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ></asp:CommandField>
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource runat="server" ID="sdsViewSchedule" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:AtasAnginDB %>" DeleteCommand="DELETE FROM [Schedule] WHERE [scheduleID] = @original_scheduleID AND (([planeID] = @original_planeID) OR ([planeID] IS NULL AND @original_planeID IS NULL)) AND (([deptTime] = @original_deptTime) OR ([deptTime] IS NULL AND @original_deptTime IS NULL)) AND (([deptDate] = @original_deptDate) OR ([deptDate] IS NULL AND @original_deptDate IS NULL)) AND (([deptLocation] = @original_deptLocation) OR ([deptLocation] IS NULL AND @original_deptLocation IS NULL)) AND (([destination] = @original_destination) OR ([destination] IS NULL AND @original_destination IS NULL)) AND (([gateNumber] = @original_gateNumber) OR ([gateNumber] IS NULL AND @original_gateNumber IS NULL)) AND (([flightStatus] = @original_flightStatus) OR ([flightStatus] IS NULL AND @original_flightStatus IS NULL)) AND (([price] = @original_price) OR ([price] IS NULL AND @original_price IS NULL)) AND (([adminID] = @original_adminID) OR ([adminID] IS NULL AND @original_adminID IS NULL))" InsertCommand="INSERT INTO [Schedule] ([scheduleID], [planeID], [deptTime], [deptDate], [deptLocation], [destination], [gateNumber], [flightStatus], [price], [adminID]) VALUES (@scheduleID, @planeID, @deptTime, @deptDate, @deptLocation, @destination, @gateNumber, @flightStatus, @price, @adminID)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Schedule]" UpdateCommand="UPDATE [Schedule] SET [planeID] = @planeID, [deptTime] = @deptTime, [deptDate] = @deptDate, [deptLocation] = @deptLocation, [destination] = @destination, [gateNumber] = @gateNumber, [flightStatus] = @flightStatus, [price] = @price, [adminID] = @adminID WHERE [scheduleID] = @original_scheduleID AND (([planeID] = @original_planeID) OR ([planeID] IS NULL AND @original_planeID IS NULL)) AND (([deptTime] = @original_deptTime) OR ([deptTime] IS NULL AND @original_deptTime IS NULL)) AND (([deptDate] = @original_deptDate) OR ([deptDate] IS NULL AND @original_deptDate IS NULL)) AND (([deptLocation] = @original_deptLocation) OR ([deptLocation] IS NULL AND @original_deptLocation IS NULL)) AND (([destination] = @original_destination) OR ([destination] IS NULL AND @original_destination IS NULL)) AND (([gateNumber] = @original_gateNumber) OR ([gateNumber] IS NULL AND @original_gateNumber IS NULL)) AND (([flightStatus] = @original_flightStatus) OR ([flightStatus] IS NULL AND @original_flightStatus IS NULL)) AND (([price] = @original_price) OR ([price] IS NULL AND @original_price IS NULL)) AND (([adminID] = @original_adminID) OR ([adminID] IS NULL AND @original_adminID IS NULL))">
                        <DeleteParameters>
                            <asp:Parameter Name="original_scheduleID" Type="String"></asp:Parameter>
                            <asp:Parameter Name="original_planeID" Type="String"></asp:Parameter>
                            <asp:Parameter Name="original_deptTime" Type="DateTime"></asp:Parameter>
                            <asp:Parameter DbType="Date" Name="original_deptDate"></asp:Parameter>
                            <asp:Parameter Name="original_deptLocation" Type="String"></asp:Parameter>
                            <asp:Parameter Name="original_destination" Type="String"></asp:Parameter>
                            <asp:Parameter Name="original_gateNumber" Type="String"></asp:Parameter>
                            <asp:Parameter Name="original_flightStatus" Type="String"></asp:Parameter>
                            <asp:Parameter Name="original_price" Type="String"></asp:Parameter>
                            <asp:Parameter Name="original_adminID" Type="String"></asp:Parameter>
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="scheduleID" Type="String"></asp:Parameter>
                            <asp:Parameter Name="planeID" Type="String"></asp:Parameter>
                            <asp:Parameter Name="deptTime" Type="DateTime"></asp:Parameter>
                            <asp:Parameter DbType="Date" Name="deptDate"></asp:Parameter>
                            <asp:Parameter Name="deptLocation" Type="String"></asp:Parameter>
                            <asp:Parameter Name="destination" Type="String"></asp:Parameter>
                            <asp:Parameter Name="gateNumber" Type="String"></asp:Parameter>
                            <asp:Parameter Name="flightStatus" Type="String"></asp:Parameter>
                            <asp:Parameter Name="price" Type="String"></asp:Parameter>
                            <asp:Parameter Name="adminID" Type="String"></asp:Parameter>
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="planeID" Type="String"></asp:Parameter>
                            <asp:Parameter Name="deptTime" Type="DateTime"></asp:Parameter>
                            <asp:Parameter DbType="Date" Name="deptDate"></asp:Parameter>
                            <asp:Parameter Name="deptLocation" Type="String"></asp:Parameter>
                            <asp:Parameter Name="destination" Type="String"></asp:Parameter>
                            <asp:Parameter Name="gateNumber" Type="String"></asp:Parameter>
                            <asp:Parameter Name="flightStatus" Type="String"></asp:Parameter>
                            <asp:Parameter Name="price" Type="String"></asp:Parameter>
                            <asp:Parameter Name="adminID" Type="String"></asp:Parameter>
                            <asp:Parameter Name="original_scheduleID" Type="String"></asp:Parameter>
                            <asp:Parameter Name="original_planeID" Type="String"></asp:Parameter>
                            <asp:Parameter Name="original_deptTime" Type="DateTime"></asp:Parameter>
                            <asp:Parameter DbType="Date" Name="original_deptDate"></asp:Parameter>
                            <asp:Parameter Name="original_deptLocation" Type="String"></asp:Parameter>
                            <asp:Parameter Name="original_destination" Type="String"></asp:Parameter>
                            <asp:Parameter Name="original_gateNumber" Type="String"></asp:Parameter>
                            <asp:Parameter Name="original_flightStatus" Type="String"></asp:Parameter>
                            <asp:Parameter Name="original_price" Type="String"></asp:Parameter>
                            <asp:Parameter Name="original_adminID" Type="String"></asp:Parameter>
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <br />
            <br />
        </div>
</asp:Content>
