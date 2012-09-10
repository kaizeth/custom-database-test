<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="manage.aspx.cs" Inherits="AppHarborTest.manage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    Welcome 
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        &nbsp;
        <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">Logout</asp:LinkButton>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:cs %>" 
            DeleteCommand="DELETE FROM [users] WHERE [username] = @username" 
            InsertCommand="INSERT INTO [users] ([username], [password], [e-mail]) VALUES (@username, @password, @column1)" 
            SelectCommand="SELECT * FROM [users]" 
            UpdateCommand="UPDATE [users] SET [password] = @password, [e-mail] = @column1 WHERE [username] = @username">
            <DeleteParameters>
                <asp:Parameter Name="username" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="username" Type="String" />
                <asp:Parameter Name="password" Type="String" />
                <asp:Parameter Name="column1" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="password" Type="String" />
                <asp:Parameter Name="column1" Type="String" />
                <asp:Parameter Name="username" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="username" DataSourceID="SqlDataSource1" 
            onselectedindexchanged="GridView1_SelectedIndexChanged">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="username" HeaderText="username" ReadOnly="True" 
                    SortExpression="username" />
                <asp:BoundField DataField="password" HeaderText="password" 
                    SortExpression="password" />
                <asp:BoundField DataField="e-mail" HeaderText="e-mail" 
                    SortExpression="e-mail" />
            </Columns>
        </asp:GridView>
        <br />
        <br />
        Username:<asp:TextBox ID="TextBox1" runat="server" ReadOnly="True"></asp:TextBox>
        <br />
        Password:<asp:TextBox ID="TextBox2" 
            runat="server"></asp:TextBox>
        <br />
        E-mail:
        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
        <br />
        <asp:Button ID="btn_update" runat="server" Text="Confirm changes" 
            onclick="btn_update_Click" />
    </div>
    </form>
</body>
</html>
