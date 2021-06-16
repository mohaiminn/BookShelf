using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MyApp.Models;
using System.Configuration;

namespace App.Db.DbOperations
{
    public class OrdersDbOperations
    {
        public int NewOrder(OrdersModel model)
        {
            using (var context = new EbookWebEntities())
            {
                Orders obj = new Orders()
                {
                    BookName = model.BookName,
                    Format = model.Format,
                    CustomerName = model.CustomerName,
                    Email = model.Email,
                    Phone = model.Phone,
                    Address = model.Address,
                    City = model.City,
                    Country = model.Country
                };

                context.Orders.Add(obj);
                context.SaveChanges();
                return obj.Id;
            }
        }
        public List<OrdersModel> GetOrders()
        {
            using (var context = new EbookWebEntities())
            {
                var result = context.Orders.Select(x => new OrdersModel()
                {
                    Id = x.Id,
                    BookName = x.BookName,
                    Format = x.Format,
                    CustomerName = x.CustomerName,
                    Email = x.Email,
                    Phone= x.Phone,
                    Address = x.Address,
                    City = x.City,
                    Country= x.Country
                }).ToList();

                return result;
            }
        }
    }
}
