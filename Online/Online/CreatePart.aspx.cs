using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CreatePart : System.Web.UI.Page
{
    string CourseName;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["UserID"] == null)
                Response.Redirect("/index");

            int id = int.Parse(Request.QueryString["id"]);

            SqlDb sqlUser = new SqlDb();
            DataSet dsUser = new DataSet();
            string stUser = "SELECT CourseName FROM Courses WHERE CourseID=(" + id + ") AND UserOwnerID=(" + Session["UserID"] + ");";
            dsUser = sqlUser.chkData(stUser);
            if (dsUser.Tables[0].Rows.Count > 0)
            {
                CourseName = dsUser.Tables[0].Rows[0][0].ToString();
                CourseNameLbl.Text = CourseName;
            }
            else
            {
                Response.Redirect("../createcourse");
            }
        }
    }

    protected void CreatePartClick(object sender, EventArgs e)
    {
        int id = int.Parse(Request.QueryString["id"]);

        SqlDb sqlUser = new SqlDb();
        DataSet dsUser = new DataSet();
        string stUser = "SELECT * FROM CourseContent WHERE CourseID=(" + id + ")";
        dsUser = sqlUser.chkData(stUser);
        int newPartId = dsUser.Tables[0].Rows.Count+1;
        string CheckPartExits = "SELECT CourseName FROM CourseContent WHERE CourseID=(" + Request.QueryString["id"] + ") AND Part=(" + newPartId + ");";
        dsUser = sqlUser.chkData(CheckPartExits);
        if (dsUser.Tables[0].Rows.Count <= 0)
        {
            string PartContent = null;
            object html = Request["htmlEditor"];
            string test = htmlEditor.Attributes["EditMode"];
            PartContent = Editor.Text;

            /*if (htmlEditor.Attributes["EditMode"].ToLower() == "richtext")
            {
                PartContent = Editor.Text;
            } else if (htmlEditor.Attributes["EditMode"].ToLower() == "html")
            {
                PartContent = htmlEditor.Attributes["innerHTML"];
            }*/
            string CreateCourseQuery = "INSERT INTO CourseContent(CourseID,CourseName,PartName,Part,CourseContent) VALUES ((" + Request.QueryString["id"] + "), '" + CourseName + "', '" + PartNameTxt.Text + "', (" + newPartId + "), '" + PartContent + "');";
            sqlUser.udi(CreateCourseQuery);
            //Response.Redirect("/index");
        }
        //        <!--//<asp:RequiredFieldValidator runat="server" ControlToValidate="Category" ErrorMessage="Please Choose Category" ForeColor="Red"></asp:RequiredFieldValidator>--> 

    }
}