using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace ClientMVC
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                name: "",
                url: "Home/Index",
                defaults: new {
                    controller = "Home",
                    action = "Index"
                }
            );
            routes.MapRoute(
                name: "",
                url: "Home/Index/{id}",
                defaults: new
                {
                    controller = "Home",
                    action = "Index",
                    id = UrlParameter.Optional
                }
            );
            routes.MapRoute(
               name: "",
               url: "Header/GetHeader",
               defaults: new
               {
                   controller = "Header",
                   action = "GetHeader"
               }
           );
            routes.MapRoute(
                name: "",
                url: "Home/Login/{login}/{password}",
                defaults: new {
                    controller = "Home",
                    action = "Login",
                    login = UrlParameter.Optional,
                    password = UrlParameter.Optional
                }
            );
            routes.MapRoute(
               name: "",
               url: "Home/BookSearching/{crit}/{seeking_str}",
               defaults: new
               {
                   controller = "Home",
                   action = "BookSearching",
                   crit = UrlParameter.Optional,
                   seeking_str = UrlParameter.Optional
               }
           );
            routes.MapRoute(
               name: "",
               url: "Customer/BooksOnHand/{customer_id}",
               defaults: new
               {
                   controller = "Customer",
                   action = "BooksOnHand",
                   customer_id = UrlParameter.Optional
               }
           );
           routes.MapRoute(
              name: "",
              url: "Customer/takeABook/{book_id}/{customer_id}",
              defaults: new
              {
                  controller = "Customer",
                  action = "takeABook",
                  book_id = UrlParameter.Optional,
                  customer_id = UrlParameter.Optional
              }
          );
            routes.MapRoute(
             name: "",
             url: "Customer/giveABook/{book_id}",
             defaults: new
             {
                 controller = "Customer",
                 action = "giveABook",
                 book_id = UrlParameter.Optional
             }
         );
            routes.MapRoute(
               name: "Default",
               url: "{Controller}/{action}/{id}",
               defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }
           );
        }
    }
}
