<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="RoozbehExtension.Admin.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <center>
    <table style="width:70%; vertical-align:middle" dir="rtl">
        <tr>
            <td class="BigTitle"><a class="noUnderLine" href="PollList.aspx" ><img src="../Images/poll_topic.png" style="width:120px;height:120px;"  /><br />مدیریت نظرسنجی ها</a> </td>
             <td class="BigTitle"><a class="noUnderLine" href="PollTypesList.aspx" ><img src="../Images/hand130.png" style="width:120px;height:120px;"  /><br />مدیریت انواع نظر سنجی</a> </td>
              <td class="BigTitle"><a class="noUnderLine" href="PollQuestions.aspx" ><img src="../Images/question53.png" style="width:120px;height:120px;"  /><br />مدیریت سوالات نظر سنجی</a> </td>
        </tr>
        <tr>
                <td class="BigTitle"><a class="noUnderLine" href="PollInfo.aspx" ><img src="../Images/add139.png" style="width:120px;height:120px;"  /><br />افزودن نظر سنجی</a> </td>
             <td class="BigTitle"><a class="noUnderLine" href="ViewPollResults.aspx" ><img src="../Images/statistics.png" style="width:120px;height:120px;"  /><br />مشاهده نتایج نظر سنجی</a> </td>
           
             <td class="BigTitle"><a class="noUnderLine" href="PollQuestionChoices.aspx" ><img src="../Images/education31.png" style="width:120px;height:120px;"  /><br />مدیریت پاسخ های نظر  سنجی ها</a> </td>
        </tr>
          
    </table>
        </center>
</asp:Content>
