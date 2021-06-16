﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace MyApp.Models
{
    public class BooksModel
    {
        [Required]
        public int Id { get; set; }
        [Required]
        public string Name { get; set; }
        [Required]
        public string Writer { get; set; }
        [Required]
        [Display (Name ="Details")]
        public string BookDetail { get; set; }
        [Required]
        public int Price { get; set; }
        
    }
}
