<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="PollList.aspx.cs" Inherits="RoozbehExtension.Admin.PollList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">

    <asp:GridView ID="gvPolls" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="sdsPolls" GridLines="Horizontal" Width="100%">
        <AlternatingRowStyle BackColor="#F7F7F7" />
        <Columns>
            <asp:CommandField CancelText="لغو" DeleteText="حذف" EditText="ویرایش" SelectText="انتخاب" ShowDeleteButton="True" ShowSelectButton="True" />
            <asp:BoundField DataField="Title" HeaderText="عنوان" SortExpression="Title" />
            <asp:BoundField DataField="ValidFrom" HeaderText="معتبر از" SortExpression="ValidFrom" />
            <asp:BoundField DataField="ValidTo" HeaderText="معتبر تا" SortExpression="ValidTo" />
            <asp:CheckBoxField DataField="IsMandatory" HeaderText="تکمیل الزامی است؟" SortExpression="IsMandatory" />
            <asp:BoundField DataField="PollTypeTitle" HeaderText="نوع نظر سنجی" SortExpression="PollTypeTitle" />
            <asp:BoundField DataField="PollAudienceTitle" HeaderText="مخاطب" SortExpression="PollAudienceTitle" />
        </Columns>
        <EmptyDataTemplate>
            هیچ نظر سنجی تعریف نشده است.
            <br />
            برای
            <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/Admin/PollInfo.aspx">تعریف نظر سنجی جدید کلیک</asp:LinkButton>
            &nbsp;نمایید
        </EmptyDataTemplate>
        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
        <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
        <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
        <SortedAscendingCellStyle BackColor="#F4F4FD" />
        <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
        <SortedDescendingCellStyle BackColor="#D8D8F0" />
        <SortedDescendingHeaderStyle BackColor="#3E3277" />
    </asp:GridView>
    <asp:SqlDataSource ID="sdsPolls" runat="server" ConnectionString="<%$ ConnectionStrings:dbRoozbehExtensionConnectionString %>" DeleteCommand="usp_PollDelete" DeleteCommandType="StoredProcedure" SelectCommand="usp_PollGetAllPollInfo" SelectCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
    </asp:SqlDataSource>

</asp:Content>
