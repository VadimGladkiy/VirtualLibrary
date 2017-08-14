using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;

namespace DataModel.Models
{
    public class Customer
    {
        [Key, DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int customer_id { set; get; }

        [Required]
        [MaxLength(30)]
        public string first_name { set; get; }

        [Required]
        [MaxLength(30)]
        public string last_name { set; get; }

        [Required]
        [MaxLength(20)]
        public string login { set; get; }

        [Required]
        [StringLength(10)]
        public string password { set; get; }

        [Required]
        [RegularExpression(@"^([\w\.\-] +)@([\w\-(@)]+)((\.(\w){2,3})+)$")]
        public string email { set; get; }

        public virtual List<Book> books_on_hand { set; get; } 
    }
}