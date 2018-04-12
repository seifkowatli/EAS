using Microsoft.Owin;
using Owin;
using OES_Services.Models;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;


[assembly: OwinStartup(typeof(OES_Services.Startup))]

namespace OES_Services
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
           // createRolesandUsers();

        }


        private void createRolesandUsers()
        {

            ApplicationDbContext context = new ApplicationDbContext();

            var roleManager = new RoleManager<IdentityRole>(new RoleStore<IdentityRole>(context));
            var UserManager = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(context));



            IdentityResult roleResult;

            string[] RoleNames = { "Admin", "Student", "teacher" };

            foreach (var item in RoleNames)
                if (!roleManager.RoleExists("RoleNames"))
                    roleResult = roleManager.Create(new IdentityRole(item));

        }

    }
}
