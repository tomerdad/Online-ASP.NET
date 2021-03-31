using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CreateCourse : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
            Response.Redirect("./index");
    }

    protected void CreateCourseClick(object sender, EventArgs e)
    {
        SqlDb sqlUser = new SqlDb();
        DataSet dsUser = new DataSet();
        string stUser = "SELECT CourseName FROM Courses WHERE CourseName='" + CourseNameTxt.Text + "';";
        dsUser = sqlUser.chkData(stUser);
        if (dsUser.Tables[0].Rows.Count <= 0)
        {

            string CreateCourseQuery = "INSERT INTO Courses(UserOwnerId,CourseName,DateUpload,Category,Description,Skill) VALUES ((" + Session["UserID"] + "), '" + CourseNameTxt.Text + "', DATE(), '" + Category.SelectedItem.Value + "', '" + DescriptionTxt.Text + "', '" + Skill.SelectedItem.Value + "');";
            sqlUser.udi(CreateCourseQuery);

            string courseIdSql = "SELECT CourseID FROM Courses WHERE CourseName='" + CourseNameTxt.Text + "';";
            dsUser = sqlUser.chkData(courseIdSql);

            string savePath = Server.MapPath("~/style/images/courses/") + dsUser.Tables[0].Rows[0][0] + ".png";
            DescriptionTxt.Text = savePath;
            imgUpload.SaveAs(savePath);


            Response.Redirect("/createpart/" + dsUser.Tables[0].Rows[0][0]);
        }
        //        <!--//<asp:RequiredFieldValidator runat="server" ControlToValidate="Category" ErrorMessage="Please Choose Category" ForeColor="Red"></asp:RequiredFieldValidator>--> 

    }
}