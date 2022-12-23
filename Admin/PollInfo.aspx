<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="PollInfo.aspx.cs" Inherits="RoozbehExtension.Admin.PollInfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <table >
        <tr>
            <td  style="width:100px;" ><nbr> نام نظر سنجی:</nbr></td>
            <td >
                <asp:TextBox ID="txtTitle" runat="server" CssClass="bigControls" Width="100%"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtTitle" ErrorMessage="تعیین نام ضروری است">*</asp:RequiredFieldValidator>
            </td>
          
        </tr>
        <tr>
            <td >
                <asp:LinkButton ID="lbtnPollType" runat="server">نوع نظر سنجی:</asp:LinkButton>
                :</td>
            <td>
                <asp:SqlDataSource ID="sdsPollTypes" runat="server" ConnectionString="<%$ ConnectionStrings:dbRoozbehExtensionConnectionString %>" SelectCommand="SELECT [Id], [Title] FROM [jPollTypes] ORDER BY [Title]"></asp:SqlDataSource>
                <asp:DropDownList ID="ddlPollType" runat="server" DataSourceID="sdsPollTypes" DataTextField="Title" DataValueField="Id" CssClass="bigControls" Width="100%">
                </asp:DropDownList>
            </td>
            
        </tr>
        <tr>
            <td >تاریخ اعتبار از:</td>
            <td>
               
            <asp:TextBox  runat="server" ID="txtValidFrom" CssClass="bigControls" Width="100%"></asp:TextBox>
            </td>
           
        </tr>
        <tr>
            <td>تاریخ اعتبار تا:</td>
            <td>               
            <asp:TextBox  runat="server" ID="txtValidTo" CssClass="bigControls" Width="100%"></asp:TextBox>
            </td>
           
        </tr>
        <tr>
            <td >تکمیل اجباری است؟:</td>
            <td >
                <asp:CheckBox ID="chkIsMandatory" runat="server" Text="آری" CssClass="bigControls" Width="100%" />
            </td>
           
        </tr>
        <tr>
            
            <td colspan="2">
                <asp:Button ID="btnSave" runat="server" Text="ثبت نظر سنجی" OnClick="btnSave_Click"  CssClass="largStyle"/>
            </td>
           
        </tr>
    </table>
</asp:Content>
