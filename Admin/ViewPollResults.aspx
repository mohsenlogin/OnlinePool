<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ViewPollResults.aspx.cs" Inherits="RoozbehExtension.Admin.ViewPollResults" %>

<%@ Register Src="~/UserControls/uc_piechart.ascx" TagPrefix="uc1" TagName="uc_piechart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <center>
    <div dir="rtl">
    <asp:MultiView ID="mvViewResults" runat="server" >
        <asp:View ID="viwLogin" runat="server">

            <table style="width:100%;" dir="rtl">
                <tr>
                    <td>نام کاربری</td>
                    <td>
                        <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>کلمه عبور</td>
                    <td>
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="btnLogin" runat="server" OnClick="btnLogin_Click" PostBackUrl="~/Admin/ViewPollResults.aspx" Text="ورود به سیستم" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>

        </asp:View>

        <asp:View ID="viwResults" runat="server">
          
            <center>  <div style="font-family:byekan">نتایج رای دانشجویان</div>
                <uc1:uc_piechart runat="server" id="uc_piechart"  />
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="sdsPollResults" Width="70%" Font-Names="BYekan,Tahoma">
        <Columns>
            <asp:BoundField DataField="Title" HeaderText="طریقه آشنایی" SortExpression="Title" />
            <asp:BoundField DataField="PollCount" HeaderText="تعداد رای" ReadOnly="True" SortExpression="PollCount" />
        </Columns>
        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
        <RowStyle BackColor="White" ForeColor="#003399" />
        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
        <SortedAscendingCellStyle BackColor="#EDF6F6" />
        <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
        <SortedDescendingCellStyle BackColor="#D6DFDF" />
        <SortedDescendingHeaderStyle BackColor="#002876" />
    </asp:GridView>
                </center>
        </asp:View>
    </asp:MultiView>
    </div>
        </center>
    <asp:SqlDataSource ID="sdsPollResults" runat="server" ConnectionString="<%$ ConnectionStrings:dbRoozbehExtensionConnectionString %>" SelectCommand="usp_ViewPollResults" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    
</asp:Content>
