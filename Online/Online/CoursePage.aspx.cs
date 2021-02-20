using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CoursePage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string CourseId = null;
        if (Request.QueryString["id"] == null)
        {
            Response.Redirect("./Courses");
        } else {
            CourseId = Request.QueryString["id"];
        }


        SqlDb sqlUser = new SqlDb();
        DataSet dsUser = new DataSet();
        string stUser = "SELECT * FROM Courses WHERE CourseID=(" + CourseId +");";
        dsUser = sqlUser.chkData(stUser);
        if (dsUser.Tables[0].Rows.Count > 0)
        {
            Lable1.Text = dsUser.Tables[0].Rows[0][1].ToString();
//            CoursersList.DataSource = dsUser;
//            CoursersList.DataBind();

        }




    }
}
