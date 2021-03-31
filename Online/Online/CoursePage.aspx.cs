using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CoursePage : System.Web.UI.Page
{
    public int PnextPartId = 0;
    public int PprevPartId = 0;
    public int PCourseId;
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            if (Session["UserId"] == null)
                Response.Redirect("/login");

            string CourseId = null;
            if (Request.QueryString["id"] == null)
            {
                Response.Redirect("./Courses");
            }
            else
            {
                CourseId = Request.QueryString["id"];
                PCourseId = int.Parse(Request.QueryString["id"]);
            }

            SqlDb sqlUser = new SqlDb();
            DataSet dsUser = new DataSet();
            string stUser = "SELECT * FROM CourseContent WHERE CourseID=(" + CourseId + ")";
            int partId = 1;
            if (Request.QueryString["part"] != null)
            {
                partId = int.Parse(Request.QueryString["part"]);
            }
            stUser += " AND Part=(" + partId + ")";
            dsUser = sqlUser.chkData(stUser + ";");
            if (dsUser.Tables[0].Rows.Count > 0)
            {
                //  Lable1.Text = dsUser.Tables[0].Rows[0][1].ToString();
                // CoursersList.DataSource = dsUser;
                // CoursersList.DataBind();
                CourseTitle.InnerText = dsUser.Tables[0].Rows[0]["CourseName"].ToString();
                PartTitle.InnerText = dsUser.Tables[0].Rows[0]["PartName"].ToString();
                CourseContent.Text = dsUser.Tables[0].Rows[0]["CourseContent"].ToString();

            }

            int prevPartId = partId - 1;
            string prevPart = "SELECT * FROM CourseContent WHERE CourseID=(" + CourseId + ") AND Part=(" + prevPartId + ");";
            dsUser = sqlUser.chkData(prevPart);
            if (dsUser.Tables[0].Rows.Count > 0)
            {
                PprevPartId = prevPartId;

            }

            int nextPartId = partId + 1;
            string nextPart = "SELECT * FROM CourseContent WHERE CourseID=(" + CourseId + ") AND Part=(" + nextPartId + ");";
            dsUser = sqlUser.chkData(nextPart);
            if (dsUser.Tables[0].Rows.Count > 0)
            {
                PnextPartId = nextPartId;

            }
        }
    }
}
