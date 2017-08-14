using DataModel.Infrastructure;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AdminWebForms
{
    public partial class BookAdding : System.Web.UI.Page
    {
        private string connection_str =
            ConfigurationManager.ConnectionStrings["VirtualLibraryConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }
        protected void Insert_link_btn_Click(object sender, EventArgs e)
        {
            /*[author_name], [book_name], [ISBN], [genre], [owner_id]*/

            SqlDataSource2.InsertParameters["author_name"].DefaultValue =
             ((TextBox)GridView1.FooterRow.FindControl("auth_n_txt")).Text;

            SqlDataSource2.InsertParameters["book_name"].DefaultValue =
             ((TextBox)GridView1.FooterRow.FindControl("book_n_txt")).Text;

            SqlDataSource2.InsertParameters["ISBN"].DefaultValue =
             ((TextBox)GridView1.FooterRow.FindControl("ISBN_txt")).Text;

            SqlDataSource2.InsertParameters["genre"].DefaultValue =
             ((TextBox)GridView1.FooterRow.FindControl("genre_txt")).Text;

            SqlDataSource2.InsertParameters["owner_id"].DefaultValue =
             ((TextBox)GridView1.FooterRow.FindControl("owner_txt")).Text;

            SqlDataSource2.Insert();
        }
        protected void Search_btn_Click(object sender, EventArgs e)
        {
            string column = SearchByProperty.SelectedValue;
            string seeking = Seeking_str.Text;

            var adminRepo = new Repository();
            adminRepo.OpenConnection(connection_str);
            SearchPackage paket = new SearchPackage();
            paket.criterion = column;
            paket.value = seeking;

            var books = adminRepo.WantedBooksByCriterion(paket);
            adminRepo.CloseConnection();

            SearchGrid.DataSource = books;
            SearchGrid.DataBind();
        }
    }
}