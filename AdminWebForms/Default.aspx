<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="AdminWebForms.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h1>Привет админ !</h1>
        <a href="BookList.aspx">Show library's items</a>
        <p>Здесь данные о пользователях</p>
    </div>
        <p>Критерий поиска</p>
        &nbsp;<asp:DropDownList ID="SearchByProperty" runat="server" DataTextField="customer_id" DataValueField="customer_id">
            <asp:ListItem>customer_id</asp:ListItem>
            <asp:ListItem>first_name</asp:ListItem>
            <asp:ListItem>last_name</asp:ListItem>
            <asp:ListItem>email</asp:ListItem>
            <asp:ListItem>login</asp:ListItem>
            <asp:ListItem>password</asp:ListItem>
        </asp:DropDownList>
        <p>строка поиска</p>
        <asp:TextBox ID="Seeking_str" runat="server"></asp:TextBox>
        <asp:Button ID="Search_btn" runat="server" Text="Search" OnClick="Search_btn_Click" />
        <br />
        <p>таблица поиска</p>
        <asp:GridView ID="SearchGrid" runat="server"></asp:GridView>
        <br />
&nbsp;<asp:GridView ID="CustomersGrid" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" DataKeyNames="customer_id" DataSourceID="SqlDataSource1" GridLines="Horizontal" Height="160px" Width="710px" AllowPaging="True" AllowSorting="True" ShowFooter="True">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                <asp:TemplateField HeaderText="customer_id" InsertVisible="False" SortExpression="customer_id">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("customer_id") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("customer_id") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:LinkButton ID="Insert_link_btn" ValidationGroup="INSERT" runat="server" OnClick="Insert_link_btn_Click">LinkButton</asp:LinkButton>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="first_name" SortExpression="first_name">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("first_name") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RFV_first_n" runat="server"
                            ErrorMessage="first_name is a required field"
                            ControlToValidate="TextBox1" Text="*" ForeColor="Red">
                        </asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("first_name") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="first_n_txt" runat="server"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RFV_Insert_first_n" ValidationGroup="INSERT" runat="server"
                            ErrorMessage="first_name is a required field"
                            ControlToValidate="first_n_txt" Text="*" ForeColor="Red">
                        </asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="last_name" SortExpression="last_name">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("last_name") %>'></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RFV_last_n" runat="server"
                            ErrorMessage="last_name is a required field"
                            ControlToValidate="TextBox2" Text="*" ForeColor="Red">
                        </asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("last_name") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="last_n_txt" runat="server"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RFV_Insert_last_n" runat="server" ValidationGroup="INSERT"
                            ErrorMessage="last_name is a required field"
                            ControlToValidate="last_n_txt" Text="*" ForeColor="Red">
                        </asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="login" SortExpression="login">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("login") %>'></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RFV_login" runat="server"
                            ErrorMessage="login is a required field"
                            ControlToValidate="TextBox3" Text="*" ForeColor="Red">
                        </asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("login") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="login_txt" runat="server"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RFV_Insert_login" runat="server" ValidationGroup="INSERT"
                            ErrorMessage="login is a required field"
                            ControlToValidate="login_txt" Text="*" ForeColor="Red">
                        </asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="password" SortExpression="password">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("password") %>'></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RFV_password" runat="server"
                            ErrorMessage="password is a required field"
                            ControlToValidate="TextBox4" Text="*" ForeColor="Red">
                        </asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("password") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="pass_txt" runat="server"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RFV_Insert_password" runat="server" ValidationGroup="INSERT"
                            ErrorMessage="password is a required field"
                            ControlToValidate="pass_txt" Text="*" ForeColor="Red">
                        </asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="email" SortExpression="email">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("email") %>'></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RFV_email" runat="server"
                            ErrorMessage="email is a required field"
                            ControlToValidate="TextBox5" Text="*" ForeColor="Red">
                        </asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("email") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="email_txt"  runat="server"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RFV_Insert_email" runat="server" ValidationGroup="INSERT"
                            ErrorMessage="email is a required field"
                            ControlToValidate="email_txt" Text="*" ForeColor="Red">
                        </asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#333333" />
            <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="White" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#487575" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#275353" />
        </asp:GridView>
        <asp:ValidationSummary ID="ValidationSummary1" ValidationGroup="INSERT" runat="server" ForeColor="Red" />
        <asp:ValidationSummary ID="ValidationSummary2" runat="server" ForeColor="Red" />
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" 
            ConnectionString="<%$ ConnectionStrings:VirtualLibraryConnectionString %>" 
            DeleteCommand="DELETE FROM [Customers] WHERE [customer_id] = @original_customer_id AND [first_name] = @original_first_name AND [last_name] = @original_last_name AND [login] = @original_login AND [password] = @original_password AND [email] = @original_email" 
            InsertCommand="INSERT INTO [Customers] ([first_name], [last_name], [login], [password], [email]) VALUES (@first_name, @last_name, @login, @password, @email)" 
            OldValuesParameterFormatString="original_{0}" 
            SelectCommand="SELECT * FROM [Customers] ORDER BY [customer_id]" 
            UpdateCommand="UPDATE [Customers] SET [first_name] = @first_name, [last_name] = @last_name, [login] = @login, [password] = @password, [email] = @email WHERE [customer_id] = @original_customer_id AND [first_name] = @original_first_name AND [last_name] = @original_last_name AND [login] = @original_login AND [password] = @original_password AND [email] = @original_email">
            <DeleteParameters>
                <asp:Parameter Name="original_customer_id" Type="Int32" />
                <asp:Parameter Name="original_first_name" Type="String" />
                <asp:Parameter Name="original_last_name" Type="String" />
                <asp:Parameter Name="original_login" Type="String" />
                <asp:Parameter Name="original_password" Type="String" />
                <asp:Parameter Name="original_email" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="first_name" Type="String" />
                <asp:Parameter Name="last_name" Type="String" />
                <asp:Parameter Name="login" Type="String" />
                <asp:Parameter Name="password" Type="String" />
                <asp:Parameter Name="email" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="first_name" Type="String" />
                <asp:Parameter Name="last_name" Type="String" />
                <asp:Parameter Name="login" Type="String" />
                <asp:Parameter Name="password" Type="String" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="original_customer_id" Type="Int32" />
                <asp:Parameter Name="original_first_name" Type="String" />
                <asp:Parameter Name="original_last_name" Type="String" />
                <asp:Parameter Name="original_login" Type="String" />
                <asp:Parameter Name="original_password" Type="String" />
                <asp:Parameter Name="original_email" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
