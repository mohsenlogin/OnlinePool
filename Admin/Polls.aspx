<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Polls.aspx.cs" Inherits="RoozbehExtension.Admin.Polls" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display.">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="PollTypeRef" HeaderText="PollTypeRef" SortExpression="PollTypeRef" />
            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
            <asp:BoundField DataField="ValidFrom" HeaderText="ValidFrom" SortExpression="ValidFrom" />
            <asp:BoundField DataField="ValidTo" HeaderText="ValidTo" SortExpression="ValidTo" />
            <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
            <asp:CheckBoxField DataField="IsMandatory" HeaderText="IsMandatory" SortExpression="IsMandatory" />
            <asp:BoundField DataField="InsertDate" HeaderText="InsertDate" SortExpression="InsertDate" />
            <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbRoozbehExtensionConnectionString %>" DeleteCommand="DELETE FROM [jPolls] WHERE [Id] = @Id" InsertCommand="INSERT INTO [jPolls] ([PollTypeRef], [Title], [ValidFrom], [ValidTo], [Status], [IsMandatory], [InsertDate], [Date]) VALUES (@PollTypeRef, @Title, @ValidFrom, @ValidTo, @Status, @IsMandatory, @InsertDate, @Date)" ProviderName="<%$ ConnectionStrings:dbRoozbehExtensionConnectionString.ProviderName %>" SelectCommand="SELECT [Id], [PollTypeRef], [Title], [ValidFrom], [ValidTo], [Status], [IsMandatory], [InsertDate], [Date] FROM [jPolls]" UpdateCommand="UPDATE [jPolls] SET [PollTypeRef] = @PollTypeRef, [Title] = @Title, [ValidFrom] = @ValidFrom, [ValidTo] = @ValidTo, [Status] = @Status, [IsMandatory] = @IsMandatory, [InsertDate] = @InsertDate, [Date] = @Date WHERE [Id] = @Id">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="PollTypeRef" Type="Int32" />
            <asp:Parameter Name="Title" Type="String" />
            <asp:Parameter Name="ValidFrom" Type="DateTime" />
            <asp:Parameter Name="ValidTo" Type="DateTime" />
            <asp:Parameter Name="Status" Type="String" />
            <asp:Parameter Name="IsMandatory" Type="Boolean" />
            <asp:Parameter DbType="Date" Name="InsertDate" />
            <asp:Parameter DbType="Date" Name="Date" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="PollTypeRef" Type="Int32" />
            <asp:Parameter Name="Title" Type="String" />
            <asp:Parameter Name="ValidFrom" Type="DateTime" />
            <asp:Parameter Name="ValidTo" Type="DateTime" />
            <asp:Parameter Name="Status" Type="String" />
            <asp:Parameter Name="IsMandatory" Type="Boolean" />
            <asp:Parameter DbType="Date" Name="InsertDate" />
            <asp:Parameter DbType="Date" Name="Date" />
            <asp:Parameter Name="Id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>
