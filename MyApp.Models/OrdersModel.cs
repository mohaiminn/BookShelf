using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace MyApp.Models
{
    public class OrdersModel
    {
        
        public int Id { get; set; }
        [Required]
        [Display(Name ="Book Name")]
        public string BookName { get; set; }
        [Required]
        public string Format { get; set; }
        [Required]
        [Display(Name = "Customer Name")]
        public string CustomerName { get; set; }
        [EmailAddress]
        public string Email { get; set; }
        public Nullable<int> Phone { get; set; }
        [Required]
        public string Address { get; set; }
        [Required]
        public string City { get; set; }
        [Required]
        public string Country { get; set; }
    }
}
