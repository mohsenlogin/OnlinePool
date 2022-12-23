<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="PollTypesList.aspx.cs" Inherits="RoozbehExtension.Admin.PollTypesList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
     
    <table >
        <tr>
            <td  style="width:100px;" >نوع نظر سنجی:</td>
            <td >
                <asp:TextBox ID="txtTitle" runat="server" TextMode="MultiLine" CssClass="bigControls"></asp:TextBox>
            </td>
          
        </tr>
        <tr>
            <td >
                <a href="">:مخاطب</a></td>
            <td>
                <asp:SqlDataSource ID="sdsAudiences" runat="server" ConnectionString="<%$ ConnectionStrings:dbRoozbehExtensionConnectionString %>" SelectCommand="SELECT [Id], [Title] FROM [jAudiences]"></asp:SqlDataSource>
                <asp:DropDownList ID="ddlAudiences" runat="server" DataSourceID="sdsPollQuestions" DataTextField="Title" DataValueField="Id" CssClass="bigControls">
                </asp:DropDownList>
            </td>
            
        </tr>
        <tr>            
            <td colspan="2">
                <asp:Button ID="btnSave" runat="server" Text="ثبت نوع نظر سنجی" OnClick="btnSave_Click"  CssClass="largStyle"/>
                <asp:Button ID="btNewPollType" runat="server" Text="ایجاد نوع جدید" OnClick="btNewPollType_Click"  CssClass="largStyle"/>
                <asp:SqlDataSource ID="sdsQuestions" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:dbRoozbehExtensionConnectionString %>" DeleteCommand="DELETE FROM [jPollQuestions] WHERE [Id] = @original_Id AND [Question] = @original_Question AND [IsRequired] = @original_IsRequired AND [PollRef] = @original_PollRef AND [Priority] = @original_Priority AND [ChoiceTypeRef] = @original_ChoiceTypeRef AND (([CheckDuplicateAnswer] = @original_CheckDuplicateAnswer) OR ([CheckDuplicateAnswer] IS NULL AND @original_CheckDuplicateAnswer IS NULL)) AND (([Status] = @original_Status) OR ([Status] IS NULL AND @original_Status IS NULL))" InsertCommand="INSERT INTO [jPollQuestions] ([Question], [IsRequired], [PollRef], [Priority], [ChoiceTypeRef], [CheckDuplicateAnswer], [Status]) VALUES (@Question, @IsRequired, @PollRef, @Priority, @ChoiceTypeRef, @CheckDuplicateAnswer, @Status)" OldValuesParameterFormatString="original_{0}" SelectCommand="usp_Poll_GetAllQuestions" UpdateCommand="UPDATE [jPollQuestions] SET [Question] = @Question, [IsRequired] = @IsRequired, [PollRef] = @PollRef, [Priority] = @Priority, [ChoiceTypeRef] = @ChoiceTypeRef, [CheckDuplicateAnswer] = @CheckDuplicateAnswer, [Status] = @Status WHERE [Id] = @original_Id AND [Question] = @original_Question AND [IsRequired] = @original_IsRequired AND [PollRef] = @original_PollRef AND [Priority] = @original_Priority AND [ChoiceTypeRef] = @original_ChoiceTypeRef AND (([CheckDuplicateAnswer] = @original_CheckDuplicateAnswer) OR ([CheckDuplicateAnswer] IS NULL AND @original_CheckDuplicateAnswer IS NULL)) AND (([Status] = @original_Status) OR ([Status] IS NULL AND @original_Status IS NULL))" SelectCommandType="StoredProcedure">
                    <DeleteParameters>
                        <asp:Parameter Name="original_Id" Type="Int32" />
                        <asp:Parameter Name="original_Question" Type="String" />
                        <asp:Parameter Name="original_IsRequired" Type="Boolean" />
                        <asp:Parameter Name="original_PollRef" Type="Int32" />
                        <asp:Parameter Name="original_Priority" Type="Byte" />
                        <asp:Parameter Name="original_ChoiceTypeRef" Type="Int32" />
                        <asp:Parameter Name="original_CheckDuplicateAnswer" Type="Boolean" />
                        <asp:Parameter Name="original_Status" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Question" Type="String" />
                        <asp:Parameter Name="IsRequired" Type="Boolean" />
                        <asp:Parameter Name="PollRef" Type="Int32" />
                        <asp:Parameter Name="Priority" Type="Byte" />
                        <asp:Parameter Name="ChoiceTypeRef" Type="Int32" />
                        <asp:Parameter Name="CheckDuplicateAnswer" Type="Boolean" />
                        <asp:Parameter Name="Status" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Question" Type="String" />
                        <asp:Parameter Name="IsRequired" Type="Boolean" />
                        <asp:Parameter Name="PollRef" Type="Int32" />
                        <asp:Parameter Name="Priority" Type="Byte" />
                        <asp:Parameter Name="ChoiceTypeRef" Type="Int32" />
                        <asp:Parameter Name="CheckDuplicateAnswer" Type="Boolean" />
                        <asp:Parameter Name="Status" Type="String" />
                        <asp:Parameter Name="original_Id" Type="Int32" />
                        <asp:Parameter Name="original_Question" Type="String" />
                        <asp:Parameter Name="original_IsRequired" Type="Boolean" />
                        <asp:Parameter Name="original_PollRef" Type="Int32" />
                        <asp:Parameter Name="original_Priority" Type="Byte" />
                        <asp:Parameter Name="original_ChoiceTypeRef" Type="Int32" />
                        <asp:Parameter Name="original_CheckDuplicateAnswer" Type="Boolean" />
                        <asp:Parameter Name="original_Status" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
           
        </tr>
        <tr>            
            <td colspan="2">
                لیست انواع نظرسنجی موجود</td>           
        </tr>
        <tr>            
            <td colspan="2">
                &nbsp;</td>
           
        </tr>
    </table>

 
    <br />
    <asp:GridView ID="gvPolls" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="sdsPolls" GridLines="Horizontal" Width="100%" OnSelectedIndexChanged="gvPolls_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="#F7F7F7" />
        <Columns>
            <asp:CommandField CancelText="لغو" DeleteText="حذف" EditText="ویرایش" SelectText="انتخاب" ShowDeleteButton="True" ShowSelectButton="True" />
            <asp:BoundField DataField="Title" HeaderText="نوع نظر سنجی" SortExpression="Title" />
            <asp:BoundField DataField="AudienceTitle" HeaderText="مخاطب" SortExpression="AudienceTitle" />
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
    <br />
    <asp:SqlDataSource ID="sdsPolls" runat="server" ConnectionString="<%$ ConnectionStrings:dbRoozbehExtensionConnectionString %>" DeleteCommand="usp_PollTypeDelete" DeleteCommandType="StoredProcedure" SelectCommand="SELECT Title, AudienceTitle FROM viw_PollAll" InsertCommand="usp_pollInsertPollType" InsertCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Title" Type="String" />
            <asp:Parameter Name="AudienceRef" Type="Int32" />
        </InsertParameters>
    </asp:SqlDataSource>



</asp:Content>
