using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Configuration;

using DataModel.Infrastructure;
using DataModel.Models;
using System.Web.Security;
using ClientMVC.Tools;

namespace ClientMVC.Controllers
{
    public class HomeController : Controller
    {
        private string connection_str =
            ConfigurationManager.ConnectionStrings["BooksConnection"].ConnectionString;
        private IdataRepository homeRepo;
        public HomeController(IdataRepository injectedHomeRepo)
        {
            homeRepo = injectedHomeRepo;
        }
        public ActionResult Login(string login, string password)
        {
            // поиск пользователя в бд
            Customer user = null;
            homeRepo.OpenConnection(connection_str);
            user = homeRepo.getAuthorizedClient(login: login, password: password);
            homeRepo.CloseConnection();
            if (user != null)
            {
                FormsAuthentication.SetAuthCookie(user.first_name + user.last_name, true);

                AuthorizedInfo.setAuthorized(user);
                string response = user.first_name + user.last_name + " is authorized";
                ViewBag.customer_id = user.customer_id;
                //return RedirectToAction("BooksOnHand", "Customer", new { customer_id = user.customer_id });
                return PartialView(model: response);
            }
            else
            {
                //    return RedirectToRoute("Default");
                return PartialView(model: login + "is not authorized");
            }
        }
        public ActionResult Index()
        {
            homeRepo.OpenConnection(connection_str);
            var model = homeRepo.AllBooksAsList();
            homeRepo.CloseConnection();
            return View(model);
        }
        public ActionResult BookSearching(string SearchBook, string seeking_str)
        {
            homeRepo.OpenConnection(connection_str);
            var model = homeRepo.WantedBooksByCriterion(new SearchPackage { criterion = SearchBook, value = seeking_str });
            homeRepo.CloseConnection();
            return PartialView(model);
        }
    }
}