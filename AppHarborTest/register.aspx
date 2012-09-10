<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="AppHarborTest.register" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    Username:<asp:TextBox ID="txt_user" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
            ErrorMessage="*Required" ControlToValidate="txt_user" ForeColor="Red"></asp:RequiredFieldValidator>
         <br />

    Password:<asp:TextBox ID="txt_pass" runat="server" 
            TextMode="Password"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
            ErrorMessage="*Required" ControlToValidate="txt_pass" ForeColor="Red"></asp:RequiredFieldValidator>
    <br />
    E-mail:<asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>*Optional 
        <br />
        <asp:Label ID="Label1" runat="server" Text="User already exists!" 
            Visible="False"></asp:Label>
        <br />

        <asp:Button ID="Button1" runat="server" Text="Register" 
            onclick="Button1_Click" />
        <br />
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
                <asp:ControlParameter ControlID="txt_user" Name="username" PropertyName="Text" 
                    Type="String" />
                <asp:ControlParameter ControlID="txt_pass" Name="password" PropertyName="Text" 
                    Type="String" />
                <asp:ControlParameter ControlID="TextBox3" Name="column1" PropertyName="Text" 
                    Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="password" Type="String" />
                <asp:Parameter Name="column1" Type="String" />
                <asp:Parameter Name="username" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
