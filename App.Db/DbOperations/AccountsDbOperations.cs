using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MyApp.Models;

namespace App.Db.DbOperations
{
    public class AccountsDbOperations
    {
        public int Signup(UsersModel model)
        {
            using (var context =  new EbookWebEntities())
            {
                Users obj = new Users()
                {
                    Username = model.Username,
                    Email = model.Email,
                    Password = model.Password
                };
                context.Users.Add(obj);
                context.SaveChanges();
                return obj.Id;
            }
        }
    }
}
