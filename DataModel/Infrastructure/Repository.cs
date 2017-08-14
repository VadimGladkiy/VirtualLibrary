using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DataModel.Models;

namespace DataModel.Infrastructure
{
    public struct SearchPackage { public string criterion; public string value; }
    public class Repository : IdataRepository
    {
        //for database access
        private SqlConnection SqlConn = null;
        public virtual void OpenConnection(string connection_string)
        {
            SqlConn = new SqlConnection();
            SqlConn.ConnectionString = connection_string;
            SqlConn.Open();
        }
        public virtual void CloseConnection()
        {
            SqlConn.Close();
        }
        public virtual SqlConnection getConnection() { return SqlConn; }

        // for Customer
        public List<Customer> SeekCustomersByParams(string cust_property, string seeking_str)
        {
            string sql_expression = string.Format("select * from Customers where ");
            switch (cust_property)
            {
                case "customer_id":
                    sql_expression += ("customer_id =" + seeking_str );
                    break;
                default : sql_expression += ( cust_property +"="+ "'" + seeking_str + "'" );
                    break;
            }
            return DataReaderCustomerIteration(sql_expression);
        }
        public List<Customer> DataReaderCustomerIteration(string sql_expression)
        {
            List<Customer> list_c = new List<Customer>();
            try
            {
                using (SqlCommand select_command = new SqlCommand(sql_expression, getConnection()))
                {
                    SqlDataReader CustomersReader = select_command.ExecuteReader();
                    Customer toList;
                    while (CustomersReader.Read())
                    {
                        toList = new Customer()
                        {
                            customer_id = Int32.Parse(CustomersReader["customer_id"].ToString()),
                            first_name = CustomersReader["first_name"].ToString(),
                            last_name = CustomersReader["last_name"].ToString(),
                            login = CustomersReader["login"].ToString(),
                            email = CustomersReader["email"].ToString(),
                            password = CustomersReader["password"].ToString()
                        };
                        list_c.Add(toList);
                    }
                    CustomersReader.Close();
                }
            }
            catch (Exception e) 
            {
                return null;
            }
            return list_c;
        }
    
        public void AddCustomer(Customer customer)
        {
            string sql_expression = string.Format(" Insert into Customers " +
                "( first_name, last_name, login, password, email)" +
                "Values,{0},{1},{2},{3},{4}",
                customer.first_name,
                customer.last_name,
                customer.login,
                customer.password,
                customer.email
                );

            using (SqlCommand insert_command = new SqlCommand(sql_expression, getConnection()))
            {
                insert_command.ExecuteNonQuery();
            }
        }
        public void DeleteCustomer(int customer_id)
        {
            string sql_expression = string.Format(
                " Delete from Customers Where customer_id = {0}",
                 customer_id);

            using (SqlCommand delete_command = new SqlCommand(sql_expression, getConnection()))
            {
                delete_command.ExecuteNonQuery();
            }
        }

        public Customer getAuthorizedClient(string login, string password)
        {
            var customer = new Customer();
            string sql_expression = string.Format(" select * from Customers " +
                "where login= '{0}' AND password = '{1}'", login, password);
            using (SqlCommand select_command = new SqlCommand(sql_expression, getConnection()))
            {
                SqlDataReader dataReader = select_command.ExecuteReader();
                while (dataReader.Read())
                {
                    customer.customer_id = Int32.Parse(dataReader["customer_id"].ToString());

                    customer.first_name = dataReader["first_name"].ToString();
                    customer.last_name = dataReader["last_name"].ToString();
                    customer.login = dataReader["login"].ToString();
                    customer.password = dataReader["password"].ToString();
                    customer.email = dataReader["email"].ToString();
                }
            }
            return customer;
        }
        
        // for books
        public List<Book> AllBooksAsList()
        {
            string sql_expression = string.Format(" select * from Books ");
            return DataReaderBookIteration(sql_expression);
        }
        public List<Book> OnHandBooks(int customer_id)
        {
            string sql_expression = string.Format(" select * from Books "+
                "where owner_id = {0}", customer_id);
            return DataReaderBookIteration(sql_expression);
        }
        public List<Book> WantedBooksByCriterion(SearchPackage packet)
        {
            string sql_expression = string.Format("select * from Books where");
            switch (packet.criterion)
            {
                case "BookAuthor" : sql_expression += (" author_name = " + "'"+ packet.value +"'" );
                    break;
                case "BookName": sql_expression += (" book_name = " + "'"+ packet.value + "'" );
                    break;
                case "BookISBN": sql_expression += (" ISBN = " + "'" + packet.value + "'" );
                    break;
                case "BookOwnerId" :
                    sql_expression += (" owner_id = "  + packet.value );
                    break;
            }
            return DataReaderBookIteration(sql_expression);
        }
        public List<Book> DataReaderBookIteration(string sql_expression)
        {
            List<Book> list = new List<Book>();
            try
            {
                using (SqlCommand select_command = new SqlCommand(sql_expression, getConnection()))
                {
                Book toList;
                string client_id;
               
                    SqlDataReader BooksReader = select_command.ExecuteReader();
                    while (BooksReader.Read())
                    {
                        toList = new Book()
                        {
                            book_id = Int32.Parse(BooksReader["book_id"].ToString()),
                            author_name = BooksReader["author_name"].ToString(),
                            book_name = BooksReader["book_name"].ToString(),
                            ISBN = BooksReader["ISBN"].ToString(),
                            genre = BooksReader["genre"].ToString()

                        };
                        client_id = BooksReader["owner_id"].ToString();
                        if (!String.IsNullOrEmpty(client_id))
                        {
                            toList.owner_id = Int32.Parse(client_id);
                        }
                        list.Add(toList);
                    }
                    BooksReader.Close();
                }
                
            }
            catch (Exception e)
            {
                return null;
            }
            return list;
        }
        public void takeABook(int book_id, int customer_id)
        {
            string sql_expression = string.Format(" UPDATE Books SET owner_id = {0} " +
               "WHERE book_id = {1}",customer_id, book_id);
            Book transfer = new Book();
            using (SqlCommand update_command = new SqlCommand(sql_expression, getConnection()))
            {
                update_command.ExecuteNonQuery();
            }
        }
        public void giveABook(int book_id)
        {
            string sql_expression = string.Format(" UPDATE Books SET owner_id = NULL " +
               "WHERE book_id = {0}", book_id);
            Book transfer = new Book();
            using (SqlCommand update_command = new SqlCommand(sql_expression, getConnection()))
            {
                update_command.ExecuteNonQuery();
            }
        }
    }
}