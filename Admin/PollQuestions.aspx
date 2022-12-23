<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="PollQuestions.aspx.cs" Inherits="RoozbehExtension.Admin.PollQuestions" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <table >
        <tr>
            <td  style="width:100px;" >عنوان سوال:</td>
            <td >
                <asp:TextBox ID="txtTitle" runat="server" TextMode="MultiLine" CssClass="bigControls"></asp:TextBox>
            </td>
          
        </tr>
        <tr>
            <td >
                <a href="PollInfo.aspx">:مربوط به نظر سنجی</a></td>
            <td>
                <asp:SqlDataSource ID="sdsPollQuestions" runat="server" ConnectionString="<%$ ConnectionStrings:dbRoozbehExtensionConnectionString %>" SelectCommand="SELECT [Id], [Title] FROM [jPolls]"></asp:SqlDataSource>
                <asp:DropDownList ID="ddlPollQuestion" runat="server" DataSourceID="sdsPollQuestions" DataTextField="Title" DataValueField="Id" CssClass="bigControls">
                </asp:DropDownList>
            </td>
            
        </tr>
        <tr>
            <td >اولویت:</td>
            <td>
                <asp:TextBox ID="txtPriority" runat="server" CssClass="bigControls" ></asp:TextBox>
            </td>
           
        </tr>
        <tr>
            <td>نوع پاسخ:</td>
            <td>
                <asp:DropDownList ID="ddlAnswerType" runat="server" DataSourceID="sdsAnswerType" DataTextField="Title" DataValueField="Id" CssClass="bigControls" >
                </asp:DropDownList>
                <asp:SqlDataSource ID="sdsAnswerType" runat="server" ConnectionString="<%$ ConnectionStrings:dbRoozbehExtensionConnectionString %>" SelectCommand="SELECT [Id], [Title] FROM [jChoiceTypes]"></asp:SqlDataSource>
            </td>
           
        </tr>
        <tr>
            <td >تکمیل اجباری است؟:</td>
            <td >
                <asp:CheckBox ID="chkIsMandatory" runat="server" Text="آری"  />
            </td>           
        </tr>
        <tr>
            <td >بررسی پاسخ دهی تکراری؟</td>
            <td >
                <asp:CheckBox ID="chkIsDuplicateAnswer" runat="server" Text="آری" />
            </td>           
        </tr>
        <tr>            
            <td colspan="2">
                <asp:Button ID="btnSave" runat="server" Text="ثبت نظر سنجی" OnClick="btnSave_Click"  CssClass="largStyle"/>
                <asp:Button ID="btNewQuestion" runat="server" Text="ایجاد سوال جدید" OnClick="btNewQuestion_Click"  CssClass="largStyle"/>
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
                لیست سوالات موجود</td>           
        </tr>
        <tr>            
            <td colspan="2">
                <asp:GridView ID="gvPollQuestions" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="Id" DataSourceID="sdsQuestions" OnSelectedIndexChanged="gvPollQuestions_SelectedIndexChanged">
                    <Columns>
                        <asp:CommandField CancelText="لغو" DeleteText="حذف" EditText="ویرایش" InsertText="درج" NewText="جدید" SelectText="انتخاب" ShowDeleteButton="True" ShowSelectButton="True" UpdateText="به روز رسانی" />
                        <asp:BoundField DataField="Question" HeaderText="سوال" SortExpression="Question" />
                        <asp:CheckBoxField DataField="IsRequired" HeaderText="پاسخدهی اجباری است؟" SortExpression="IsRequired" />
                        <asp:BoundField DataField="Priority" HeaderText="اولویت" SortExpression="Question" />
                        <asp:CheckBoxField DataField="CheckDuplicateAnswer" HeaderText="بررسی پاسخ تکراری؟" SortExpression="CheckDuplicateAnswer" />
                        <asp:BoundField DataField="Status" HeaderText="وضعیت" SortExpression="Status" />
                        <asp:BoundField DataField="ChoiceTypeTitle" HeaderText="نوع پاسخها" SortExpression="ChoiceTypeTitle" />
                        <asp:BoundField DataField="PollTitle" HeaderText="مربوط به نظر سنجی" SortExpression="PollTitle" />
                    </Columns>
                    <EmptyDataTemplate>
                        هیچ سوالی تعریف نشده است.
                    </EmptyDataTemplate>
                    <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                    <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                    <RowStyle BackColor="White" ForeColor="#330099" Height="30px" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                    <SortedAscendingCellStyle BackColor="#FEFCEB" />
                    <SortedAscendingHeaderStyle BackColor="#AF0101" />
                    <SortedDescendingCellStyle BackColor="#F6F0C0" />
                    <SortedDescendingHeaderStyle BackColor="#7E0000" />
                </asp:GridView>
            </td>
           
        </tr>
    </table>
    </asp:Content>
