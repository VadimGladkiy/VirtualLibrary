using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using DataModel.Models;
namespace ClientMVC.Tools
{
    public static class AuthorizedInfo
    {
        private static Customer authorized;
        public static void setAuthorized(Customer customer) { authorized = customer; }
        public static Customer getAuthorized() { return authorized; }
        public static bool IsAuthorized()
        {
            if (authorized != null) return true;
            else return false;  
        }
    }
}