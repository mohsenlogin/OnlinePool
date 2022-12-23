<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="PollResults.aspx.cs" Inherits="RoozbehExtension.Admin.PollResults" %>

<%@ Register Src="~/UserControls/uc_piechart.ascx" TagPrefix="uc1" TagName="uc_piechart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <center>
    <div dir="rtl">
                                  <asp:DropDownList ID="ddlQuestions" runat="server" AutoPostBack="True" DataSourceID="sdsPollQuestion" DataTextField="Question" DataValueField="Id">
                </asp:DropDownList>
                                  <asp:GridView ID="gnPollQuestions" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="Id" DataSourceID="sdsPollQuestion" OnSelectedIndexChanged="gnPollQuestions_SelectedIndexChanged">
                                      <Columns>
                                          <asp:CommandField ShowSelectButton="True" />
                                          <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                                          <asp:BoundField DataField="Question" HeaderText="Question" SortExpression="Question" />
                                      </Columns>
                                      <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                                      <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                                      <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                                      <RowStyle BackColor="White" ForeColor="#330099" />
                                      <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                                      <SortedAscendingCellStyle BackColor="#FEFCEB" />
                                      <SortedAscendingHeaderStyle BackColor="#AF0101" />
                                      <SortedDescendingCellStyle BackColor="#F6F0C0" />
                                      <SortedDescendingHeaderStyle BackColor="#7E0000" />
                                  </asp:GridView>
                <center>  <div style="font-family:byekan">نتایج رای دانشجویان</div>
                <uc1:uc_piechart runat="server" id="uc_piechart"  />
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" Width="70%" Font-Names="BYekan,Tahoma">
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
                <asp:SqlDataSource ID="sdsPollQuestion" runat="server" ConnectionString="<%$ ConnectionStrings:dbRoozbehExtensionConnectionString %>" SelectCommand="usp_getFirstQuestionOfFirstPoll" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                </center>
            
    <asp:MultiView ID="mvViewResults" runat="server" >
        <asp:View ID="viwLogin" runat="server">

            <%--<table style="width:100%;" dir="rtl">
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
            </table>--%>

        </asp:View>

        <asp:View ID="viwResults" runat="server">
                
            
        </asp:View>
    </asp:MultiView>
    </div>
        </center>
        
</asp:Content>
