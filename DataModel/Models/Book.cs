using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace DataModel.Models
{
    public class Book
    {
        [Key, DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int book_id { set; get; }

        [Required]
        [MaxLength(50)]
        public string author_name { set; get; }

        [Required]
        [MaxLength(100)]
        public string book_name { set; get; }

        [Required]
        [RegularExpression(@"[\d\-]{11,17}")]
        public string ISBN { set; get; }

        public string genre { set; get;}

        public int? owner_id { set; get;} 
        public virtual Customer owner { set; get; }
    }
}