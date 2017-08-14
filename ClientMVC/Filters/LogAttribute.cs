using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ClientMVC.Tools;
namespace ClientMVC.Filters
{
    public class LogAttribute : ActionFilterAttribute, IActionFilter
    {
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            var request = filterContext.HttpContext.Request;
            if (!AuthorizedInfo.IsAuthorized()) return;
            base.OnActionExecuting(filterContext);
        }
    }
}