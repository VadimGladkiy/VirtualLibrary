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

            List<Book> bksOnSeekingHands = new List<Book>();
            List<Book> bksInOneHand;
            SearchPackage paket;

            foreach (var pt in customers)
            {
                paket.criterion = "BookOwnerId";
                paket.value = pt.customer_id.ToString();

                bksInOneHand = adminRepo.WantedBooksByCriterion(paket);
                if (bksOnSeekingHands.Count == 0)
                    bksOnSeekingHands = bksInOneHand;
                else 
                bksOnSeekingHands.Concat(bksInOneHand);
            }
            adminRepo.CloseConnection();

            SearchGrid1.DataSource = customers;
            SearchGrid1.DataBind();

            SearchGrid2.DataSource = bksOnSeekingHands;
            SearchGrid2.DataBind();
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