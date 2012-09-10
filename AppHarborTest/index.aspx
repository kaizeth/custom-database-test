<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="AppHarborTest.login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="Label1" runat="server" Text="Username"></asp:Label><asp:TextBox ID="TextBox1"
            runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>
        <asp:TextBox ID="TextBox2"
            runat="server" TextMode="Password"></asp:TextBox>
        <br />
        <asp:Button ID="Button1" runat="server" Text="Login" onclick="Button1_Click" />
        <asp:Button ID="Button2" runat="server" Text="Register" 
            onclick="Button2_Click" />
        <br />
        <asp:Label ID="Label3" runat="server" Text="Incorrect login!" Visible="False"></asp:Label>
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:cs %>" 
            DeleteCommand="DELETE FROM [users] WHERE [username] = @username" 
            InsertCommand="INSERT INTO [users] ([username], [password]) VALUES (@username, @password)" 
            SelectCommand="SELECT [username], [password] FROM [users] WHERE (username=@id) AND (password=@pass)" 
            UpdateCommand="UPDATE [users] SET [password] = @password WHERE [username] = @username">
            <DeleteParameters>
                <asp:Parameter Name="username" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="username" Type="String" />
                <asp:Parameter Name="password" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" Name="id" PropertyName="Text" />
                <asp:ControlParameter ControlID="TextBox2" Name="pass" PropertyName="Text" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="password" Type="String" />
                <asp:Parameter Name="username" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
