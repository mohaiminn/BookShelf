using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Web.Mvc;
using MyApp.Models;
using App.Db.DbOperations;
using System.Web.Security;

namespace EbookWebApp.Controllers
{
    [Authorize]
    public class AdminController : Controller
    {
        BookDbOperations Book = null;
        OrdersDbOperations Order = null;
        public AdminController()
        {
            Book = new BookDbOperations();
            Order = new OrdersDbOperations();
        }

        public ActionResult AddBook()
        {
            return View();
        }

        
        [HttpPost]
        public ActionResult AddBook(BooksModel model)
        {
            if (ModelState.IsValid)
            {
                int id = Book.AddBook(model);
                if (id > 0)
                {
                    ModelState.Clear();
                }
            }
            return RedirectToAction("GetAllBooks");
        }
        public ActionResult GetAllBooks()
        {
            var result = Book.GetBooks();
            return View(result);
        }

        
        public ActionResult Update(int id)
        {
            var result = Book.UpdateBook(id);
            return View(result);
        }
       
        [HttpPost]
        public ActionResult Update(BooksModel model)
        {
            if (ModelState.IsValid)
            {
                Book.SaveEdit(model.Id, model);
                return RedirectToAction("GetAllBooks");
            }
            return View();
        }

        
        public ActionResult Delete(int id)
        {
            Book.DeleteBook(id);
            return RedirectToAction("GetAllBooks");
        }

        public ActionResult Buy(int id)
        {
            var result = Book.UpdateBook(id);
            return View(result);
        }
        public ActionResult ConfirmOrder()
        {
            return View();
        }
        [HttpPost]
        public ActionResult ConfirmOrder(OrdersModel model)
        {
            if (ModelState.IsValid)
            {
                int id = Order.NewOrder(model);
                if (id > 0)
                {
                    ModelState.Clear();
                }
                ViewBag.OrderStatus = "Order has been Placed!";
            }
            return View();
        }

        
        public ActionResult GetOrders()
        {
            var result = Order.GetOrders();
            return View(result);
            
        }
    }
}