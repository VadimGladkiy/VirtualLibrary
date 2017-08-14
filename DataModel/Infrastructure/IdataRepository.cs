using DataModel.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataModel.Infrastructure
{
    public interface IdataRepository
    {
        void OpenConnection(string connection_string);
        void CloseConnection();
        SqlConnection getConnection();
        void AddCustomer(Customer customer);
        void DeleteCustomer(int customer_id);
        List<Customer> SeekCustomersByParams(string cust_property, string seeking_str);
        List<Customer> DataReaderCustomerIteration(string sql_expression);
        Customer getAuthorizedClient(string login, string password);
        List<Book> AllBooksAsList();
        List<Book> OnHandBooks(int customer_id);
        List<Book> WantedBooksByCriterion(SearchPackage packet);
        List<Book> DataReaderBookIteration(string sql_expression);
        void takeABook(int book_id, int customer_id);
        void giveABook(int book_id);
    }
}
