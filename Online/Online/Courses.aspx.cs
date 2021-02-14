using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Courses : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        //get data from db

        SqlDb sqlUser = new SqlDb();
        DataSet dsUser = new DataSet();
        string stUser = "SELECT * FROM Courses;";
        dsUser = sqlUser.chkData(stUser);


        CoursersList.DataSource = dsUser;
        CoursersList.DataBind();
    }

}