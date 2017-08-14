using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;

using DataModel.Models;
using DataModel.Infrastructure;


namespace AdminWebForms
{
    public partial class Default : System.Web.UI.Page
    {
        private string connection_str =
            ConfigurationManager.ConnectionStrings["VirtualLibraryConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }
        protected void Search_btn_Click(object sender, EventArgs e)
        {
            string column = SearchByProperty.SelectedValue;
            string seeking = Seeking_str.Text;

            var adminRepo = new Repository();
            adminRepo.OpenConnection(connection_str);
            var customers = adminRepo.SeekCustomersByParams(column, seeking);
            adminRepo.CloseConnection();

            SearchGrid.DataSource = customers;
            SearchGrid.DataBind();
        }
        protected void Insert_link_btn_Click(object sender, EventArgs e)
        {
            /*[first_name], [last_name], [login], [password], [email]*/
            SqlDataSource1.InsertParameters["first_name"].DefaultValue =
            ((TextBox)CustomersGrid.FooterRow.FindControl("first_n_txt")).Text;

            SqlDataSource1.InsertParameters["last_name"].DefaultValue =
            ((TextBox)CustomersGrid.FooterRow.FindControl("last_n_txt")).Text;

            SqlDataSource1.InsertParameters["login"].DefaultValue =
            ((TextBox)CustomersGrid.FooterRow.FindControl("login")).Text;

            SqlDataSource1.InsertParameters["password"].DefaultValue =
            ((TextBox)CustomersGrid.FooterRow.FindControl("pass")).Text;

            SqlDataSource1.InsertParameters["email"].DefaultValue =
            ((TextBox)CustomersGrid.FooterRow.FindControl("email")).Text;

            SqlDataSource1.Insert();
        }
    }
}