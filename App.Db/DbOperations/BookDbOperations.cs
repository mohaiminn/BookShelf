using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MyApp.Models;
using System.Configuration;

namespace App.Db.DbOperations
{
    public class BookDbOperations
    {
        public int AddBook(BooksModel model)
        {
            using (var context = new EbookWebEntities())
            {
                Books obj = new Books()
                {
                    Name = model.Name,
                    Writer = model.Writer,
                    BookDetail = model.BookDetail,
                    Price = model.Price
                };

                context.Books.Add(obj);
                context.SaveChanges();
                return obj.Id;
            }
        }
        public List<BooksModel> GetBooks()
        {
            using (var context = new EbookWebEntities())
            {
                var result = context.Books.Select(x => new BooksModel()
                {
                    Id = x.Id,
                    Name = x.Name,
                    Writer = x.Writer,
                    BookDetail = x.BookDetail,
                    Price = x.Price
                }).ToList();

                return result;
            }
        }
        public BooksModel UpdateBook(int id)
        {
            using (var context = new EbookWebEntities())
            {
                var result = context.Books
                    .Where(x => x.Id == id)
                    .Select(x => new BooksModel()
                    {
                        Id = x.Id,
                        Name = x.Name,
                        Writer = x.Writer,
                        BookDetail = x.BookDetail,
                        Price = x.Price

                    }).FirstOrDefault();

                return result;
            }
        }
        public bool SaveEdit(int id,BooksModel model)
        {
            using (var context = new EbookWebEntities())
            {
                var book = context.Books.FirstOrDefault(x => x.Id == id);
                if (book!= null)
                {
                    book.Name = model.Name;
                    book.Writer = model.Writer;
                    book.BookDetail = model.BookDetail;
                    book.Price = model.Price;

                }
                context.SaveChanges();
                return true;
            }
        }
        public bool DeleteBook(int id)
        {
            using (var context = new EbookWebEntities())
            {
                var book = context.Books.FirstOrDefault(x => x.Id == id);
                if (book != null) 
                {
                    context.Books.Remove(book);
                    context.SaveChanges();
                    return true;
                }
                return false;
            }
        }
    }
    
}
