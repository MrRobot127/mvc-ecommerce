using System.Linq;
using System.Web.Mvc;
using Khareedo.Models;
using System.Data;

namespace Khareedo.Controllers
{
    public class AccountController : Controller
    {
        private readonly KhareedoEntities dbContext;
        public AccountController(KhareedoEntities dbContext)
        {
            this.dbContext = dbContext;
        }

        // GET: Account
        public ActionResult Index()
        {
            this.GetDefaultData();

            var usr = dbContext.Customers.Find(TempShpData.UserID);
            return View(usr);

        }


        //REGISTER CUSTOMER
        [HttpPost]
        public ActionResult Register(Customer cust)
        {
            if (ModelState.IsValid)
            {
                dbContext.Customers.Add(cust);
                dbContext.SaveChanges();

                Session["username"] = cust.UserName;
                TempShpData.UserID = GetUser(cust.UserName).CustomerID;          
                return RedirectToAction("Index","Home");
            }
            return View();
        }

       
       
        //LOG IN
        public ActionResult Login()
        {
            return View();
        }

         [HttpPost]
        public ActionResult Login(FormCollection formColl)
        {
            string usrName = formColl["UserName"];
            string Pass = formColl["Password"];

            if (ModelState.IsValid)
            {
                var cust = (from m in dbContext.Customers
                            where (m.UserName == usrName && m.Password == Pass)
                            select m).SingleOrDefault();

                if (cust !=null )
                {
                    TempShpData.UserID = cust.CustomerID;
                    Session["username"] = cust.UserName;
                    return RedirectToAction("Index", "Home");
                }
                      
            }
            return View();
        }

        //LOG OUT
         public ActionResult Logout()
         {
             Session["username"] = null;
             TempShpData.UserID = 0;
             TempShpData.items = null;
             return RedirectToAction("Index", "Home");
         }

       

        public Customer GetUser(string _usrName)
        {
            var cust = (from c in dbContext.Customers
                        where c.UserName == _usrName
                        select c).FirstOrDefault();
            return cust;
        }

        //UPDATE CUSTOMER DATA
        [HttpPost]
        public ActionResult Update(Customer cust)
        {
            if (ModelState.IsValid)
            {
                dbContext.Entry(cust).State = (System.Data.Entity.EntityState)EntityState.Modified;
                dbContext.SaveChanges();
                Session["username"] = cust.UserName;
                return RedirectToAction("Index", "Home");
            }
            return View();
        }
    }
}