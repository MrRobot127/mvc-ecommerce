using Khareedo.Models;
using System.Linq;
using System.Web.Mvc;


namespace Khareedo.Controllers
{
    public class HomeController : Controller
    {
        private readonly KhareedoEntities dbContext;
        public HomeController(KhareedoEntities dbContext)
        {
            this.dbContext = dbContext;
        }

        // GET: Home
        public ActionResult Index()
        {
            ViewBag.MenProduct = dbContext.Products.Where(x => x.Category.Name.Equals("Men")).ToList();
            ViewBag.WomenProduct = dbContext.Products.Where(x => x.Category.Name.Equals("Women")).ToList();
            ViewBag.SportsProduct = dbContext.Products.Where(x => x.Category.Name.Equals("Sports")).ToList();
            ViewBag.ElectronicsProduct = dbContext.Products.Where(x => x.Category.Name.Equals("Phones")).ToList();
            ViewBag.Slider = dbContext.genMainSliders.ToList();
            ViewBag.PromoRight = dbContext.genPromoRights.ToList();

            this.GetDefaultData();

            return View();
        }

    }
}