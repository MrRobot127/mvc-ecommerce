using Autofac;
using Autofac.Integration.Mvc;
using Khareedo.Models;
using System.Data.Entity;
using System.Reflection;

namespace Khareedo.Configuration
{
    public class AutofacConfig
    {
        public static void RegisterDependencies()
        {
            var builder = new ContainerBuilder();

            // Register MVC controllers.
            builder.RegisterControllers(Assembly.GetExecutingAssembly());

            builder.RegisterType<KhareedoEntities>().InstancePerRequest();

            var container = builder.Build();

            // Set the MVC DependencyResolver to use Autofac.
            System.Web.Mvc.DependencyResolver.SetResolver(new AutofacDependencyResolver(container));
        }
    }
}