<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BookList.aspx.cs" Inherits="AdminWebForms.BookAdding" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>BookList</title>
</head>
<body>
    <a href="Default.aspx">return to the home view</a> 
    <form id="form1" runat="server">
    <div>
    
    </div>
        <p>Критерий поиска</p>
        &nbsp;<asp:DropDownList ID="SearchByProperty" runat="server" DataTextField="customer_id" DataValueField="book_id">
            <asp:ListItem>book_id</asp:ListItem>
            <asp:ListItem>author_name</asp:ListItem>
            <asp:ListItem>book_name</asp:ListItem>
            <asp:ListItem>ISBN</asp:ListItem>
            <asp:ListItem>genre</asp:ListItem>
            <asp:ListItem>owner_id</asp:ListItem>
        </asp:DropDownList>
        <p>строка поиска</p>
        <asp:TextBox ID="Seeking_str" runat="server"></asp:TextBox>
        <asp:Button ID="Search_btn" runat="server" Text="Search" OnClick="Search_btn_Click" />
        <br />
        <p>таблица поиска</p>
        <asp:GridView ID="SearchGrid" runat="server"></asp:GridView>
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" 
            AutoGenerateColumns="False" CellPadding="4" DataKeyNames="book_id" 
            DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" ShowFooter="True">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                <asp:TemplateField HeaderText="book_id" InsertVisible="False" SortExpression="book_id">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("book_id") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("book_id") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:LinkButton ValidationGroup="INSERT" ID="Insert_link_btn" OnClick="Insert_link_btn_Click" runat="server">Insert</asp:LinkButton>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="author_name" SortExpression="author_name">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("author_name") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RFV_auth_n" runat="server"
                            ErrorMessage="author_name is a required field"
                            ControlToValidate="TextBox1" Text="*" ForeColor="Red">
                        </asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("author_name") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="auth_n_txt" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RFV_Insert_auth_n" runat="server" ValidationGroup="INSERT"
                            ErrorMessage="author_name is a required field"
                            ControlToValidate="auth_n_txt" Text="*" ForeColor="Red">
                        </asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="book_name" SortExpression="book_name">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("book_name") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RFV_book_n" runat="server"
                            ErrorMessage="book_name is a required field"
                            ControlToValidate="TextBox2" Text="*" ForeColor="Red">
                        </asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("book_name") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="book_n_txt" runat="server"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RFV_Insert_book_n" runat="server" ValidationGroup="INSERT"
                            ErrorMessage="book_name is a required field"
                            ControlToValidate="book_n_txt" Text="*" ForeColor="Red">
                        </asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="ISBN" SortExpression="ISBN">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("ISBN") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RFV_ISBN" runat="server"
                            ErrorMessage="ISBN is a required field"
                            ControlToValidate="TextBox3" Text="*" ForeColor="Red">
                        </asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("ISBN") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="ISBN_txt" runat="server"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RFV_Insert_ISBN" runat="server" ValidationGroup="INSERT"
                            ErrorMessage="ISBN is a required field"
                            ControlToValidate="ISBN_txt" Text="*" ForeColor="Red">
                        </asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="genre" SortExpression="genre">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("genre") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RFV_genre" runat="server" 
                            ErrorMessage="genre is a required field"
                            ControlToValidate="TextBox4" Text="*" ForeColor="Red">
                        </asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("genre") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="genre_txt" runat="server"></asp:TextBox>
                          <asp:RequiredFieldValidator ID="RFV_Insert_genre" runat="server" ValidationGroup="INSERT"
                            ErrorMessage="genre is a required field"
                            ControlToValidate="genre_txt" Text="*" ForeColor="Red">
                        </asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="owner_id" SortExpression="owner_id">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("owner_id") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RFV_owner" runat="server"
                            ErrorMessage="owner_id is a required field"
                            ControlToValidate="TextBox5" Text="*" ForeColor="Red">
                        </asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("owner_id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
        </asp:GridView>
        <asp:ValidationSummary ValidationGroup="INSERT" ID="ValidationSummary1" ForeColor="Red" runat="server" />
        <asp:ValidationSummary ID="ValidationSummary2" ForeColor="Red" runat="server" />
        <br />
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:VirtualLibraryConnectionString %>" 
            DeleteCommand="DELETE FROM [Books] WHERE [book_id] = @original_book_id AND [author_name] = @original_author_name AND [book_name] = @original_book_name AND [ISBN] = @original_ISBN AND (([genre] = @original_genre) OR ([genre] IS NULL AND @original_genre IS NULL)) AND (([owner_id] = @original_owner_id) OR ([owner_id] IS NULL AND @original_owner_id IS NULL))" 
            InsertCommand="INSERT INTO [Books] ([author_name], [book_name], [ISBN], [genre], [owner_id]) VALUES (@author_name, @book_name, @ISBN, @genre, @owner_id)" 
            OldValuesParameterFormatString="original_{0}" 
            SelectCommand="SELECT * FROM [Books] ORDER BY [author_name]" 
            UpdateCommand="UPDATE [Books] SET [author_name] = @author_name, [book_name] = @book_name, [ISBN] = @ISBN, [genre] = @genre, [owner_id] = @owner_id WHERE [book_id] = @original_book_id AND [author_name] = @original_author_name AND [book_name] = @original_book_name AND [ISBN] = @original_ISBN AND (([genre] = @original_genre) OR ([genre] IS NULL AND @original_genre IS NULL)) AND (([owner_id] = @original_owner_id) OR ([owner_id] IS NULL AND @original_owner_id IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_book_id" Type="Int32" />
                <asp:Parameter Name="original_author_name" Type="String" />
                <asp:Parameter Name="original_book_name" Type="String" />
                <asp:Parameter Name="original_ISBN" Type="String" />
                <asp:Parameter Name="original_genre" Type="String" />
                <asp:Parameter Name="original_owner_id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="author_name" Type="String" />
                <asp:Parameter Name="book_name" Type="String" />
                <asp:Parameter Name="ISBN" Type="String" />
                <asp:Parameter Name="genre" Type="String" />
                <asp:Parameter Name="owner_id" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="author_name" Type="String" />
                <asp:Parameter Name="book_name" Type="String" />
                <asp:Parameter Name="ISBN" Type="String" />
                <asp:Parameter Name="genre" Type="String" />
                <asp:Parameter Name="owner_id" Type="Int32" />
                <asp:Parameter Name="original_book_id" Type="Int32" />
                <asp:Parameter Name="original_author_name" Type="String" />
                <asp:Parameter Name="original_book_name" Type="String" />
                <asp:Parameter Name="original_ISBN" Type="String" />
                <asp:Parameter Name="original_genre" Type="String" />
                <asp:Parameter Name="original_owner_id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
    
</body>
</html>
