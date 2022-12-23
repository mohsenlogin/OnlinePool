<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="PollQuestionChoiceList.aspx.cs" Inherits="RoozbehExtension.Admin.PollQuestionChoiceList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <asp:GridView ID="gvPollQuestions" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="sdsPollQuestions" GridLines="Horizontal" Width="100%">
        <AlternatingRowStyle BackColor="#F7F7F7" />
        <Columns>
            <asp:CommandField CancelText="لغو" DeleteText="حذف" EditText="ویرایش" SelectText="انتخاب" ShowDeleteButton="True" ShowSelectButton="True" UpdateText="بروز رسانی" />
            <asp:CheckBoxField DataField="IsRequired" HeaderText="تکمیل الزامی است؟" SortExpression="IsRequired" />
            <asp:BoundField DataField="PollTitle" HeaderText="عنوان نظر سنجی" SortExpression="PollTitle" />
            <asp:BoundField DataField="Priority" HeaderText="اولویت" SortExpression="Priority" />
            <asp:CheckBoxField DataField="CheckDuplicateAnswer" HeaderText="بررسی پاسخ تکراری؟" SortExpression="CheckDuplicateAnswer" />
            <asp:BoundField DataField="ChoiceTypeTitle" HeaderText="نوع پاسخ ها" SortExpression="ChoiceTypeTitle" />
        </Columns>
        <EditRowStyle Height="30px" />
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
    <asp:SqlDataSource ID="sdsPollQuestions" runat="server" ConnectionString="<%$ ConnectionStrings:dbRoozbehExtensionConnectionString %>" DeleteCommand="DELETE FROM jPollQuestions WHERE (Id = @Id)" SelectCommand="usp_Poll_SelectAllQuestions" SelectCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
    </asp:SqlDataSource>

</asp:Content>
