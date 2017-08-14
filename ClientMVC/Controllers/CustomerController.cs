using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Configuration;
using DataModel.Infrastructure;
using DataModel.Models;
using ClientMVC.Filters;
using ClientMVC.Tools;

namespace ClientMVC.Controllers
{
    public class CustomerController : Controller
    {
        private int customer;
        private string connection_str = 
            ConfigurationManager.ConnectionStrings["BooksConnection"].ConnectionString;
        private IdataRepository clientRepo;
        public CustomerController(IdataRepository repository)
        {
            clientRepo = repository;
        }
        [LogAttribute]
        public ActionResult BooksOnHand(int customer_id)
        {
            clientRepo.OpenConnection(connection_str);
            List<Book> models = clientRepo.OnHandBooks(customer_id);
            clientRepo.CloseConnection();
            return View(models);
        }
        public ActionResult takeABook(int book_id, int customer_id)
        {
            clientRepo.OpenConnection(connection_str);
            clientRepo.takeABook(book_id: book_id, customer_id: customer_id);
            clientRepo.CloseConnection();
            return Redirect("/Home/Index");
        }
        public ActionResult giveABook(int book_id)
        {
            clientRepo.OpenConnection(connection_str);
            clientRepo.giveABook(book_id: book_id);
            clientRepo.CloseConnection();
            customer = Tools.AuthorizedInfo.getAuthorized().customer_id;
            return Redirect("/Customer/BooksOnHand/"+ customer);
        }
    }
}