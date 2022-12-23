<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="PollQuestionChoices.aspx.cs" Inherits="RoozbehExtension.Admin.PollQuestionChoices" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <table >
        <tr>
            <td  style="width:100px;" >عنوان پاسخ:</td>
            <td >
                <asp:TextBox ID="txtTitle" runat="server" TextMode="MultiLine" Width="100%"></asp:TextBox>
            </td>
          
        </tr>
        <tr>
            <td >
                <a href="javascript:__doPostBack('lbtnPollType','')">:مربوط به سوال</a></td>
            <td>
                <asp:SqlDataSource ID="sdsPollQuestions" runat="server" ConnectionString="<%$ ConnectionStrings:dbRoozbehExtensionConnectionString %>" SelectCommand="SELECT [Id], [Question], [Status] FROM [jPollQuestions] WHERE ([Status] = @Status)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="Active" Name="Status" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:DropDownList ID="ddlPollQuestion" runat="server" DataSourceID="sdsPollQuestions" DataTextField="Question" DataValueField="Id" Width="100%" CssClass="bigControls">
                </asp:DropDownList>
            </td>
            
        </tr>
        <tr>
            <td >مقدار پیش فرض:</td>
            <td>
                <asp:TextBox ID="txtDefaultValue" runat="server" Width="100%" CssClass="bigControls"></asp:TextBox>
            </td>
           
        </tr>
        <tr>
            
            <td colspan="2">
                <asp:Button ID="btnSave" runat="server" Text="ثبت پاسخ" OnClick="btnSave_Click"  CssClass="largStyle" Height="27px"/>
            </td>
           
        </tr>
    </table>
</asp:Content>
