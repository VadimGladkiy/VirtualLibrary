using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ClientMVC.Tools;

namespace ClientMVC.Controllers
{
    public class HeaderController : Controller
    {
        // GET: Header
        public ActionResult GetHeader()
        {
            if (Tools.AuthorizedInfo.IsAuthorized()) {
                string str = AuthorizedInfo.getAuthorized().first_name +
                    AuthorizedInfo.getAuthorized().last_name + " is authorized";
                return PartialView("~/Views/Shared/Login.cshtml", str);
            } else
                return PartialView("~/Views/Header/GetHeader.cshtml");
        }
    }
}