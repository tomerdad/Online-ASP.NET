using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Reflection;

public partial class Courses : System.Web.UI.Page
{
    private Filters Filters = new Filters();

    protected void Page_Load(object sender, EventArgs e)
    {
        Filters.Reset();

        //check for filters and change url.
        if (Request["skill"] != null)
        {
            foreach (string value in Request["Skill"].Split('|'))
            {
                Filters.AddFilter("Skill", value);
            }
        }

        if (Request["category"] != null)
        {
            foreach (string value in Request["Category"].Split('|'))
            Filters.AddFilter("Category", value);
        }

        foreach (char item in Filters.GetFilters("Skill"))
        {

        }
        


        //get data from db
        SqlDb sqlUser = new SqlDb();
        DataSet dsUser = new DataSet();
        string stUser = "SELECT * FROM Courses;";
        dsUser = sqlUser.chkData(stUser);


        CoursersList.DataSource = dsUser;
        CoursersList.DataBind();
    }

    protected void FiltersCheckBoxListChange(object sender, EventArgs e)
    {
        string url = Request.Url.ToString();
        CheckBoxList List = (CheckBoxList)sender;
        Filters.RemoveCategoryFilter(List.ID);
        string query = null;
        bool first = true;
        foreach (ListItem item in List.Items)
        {
            if (item.Selected)
            {
                Filters.AddFilter(List.ID, item.Value);
                if (first)
                {
                    query = item.Value;
                    first = false;
                }
                else
                    query += "|" + item.Value;
            }
        }
        string va = "";
        foreach (string hi1 in Request.QueryString)
        {
            if (hi1 != List.ID && Request[hi1] != "")
            {
                if (query == null)
                    query += hi1 + "=" + Request[hi1];
                else
                {
                    va = List.ID + "=";
                    query += "&" + hi1 + "=" + Request[hi1];
                }
            }
        }

        if (Request.QueryString.Count == 0)
            va = List.ID + "=";

        Context.RewritePath("~/Courses?"+ va + string.Join(",", query));
        ScriptManager.RegisterStartupScript(this, this.GetType(), "updateUrl", "history.pushState(null, '', '"+Request.Url.PathAndQuery+"');", true);
    }

}
//list part
public class Part
{
    public string filter { get; set; }

    public string values { get; set; }
}
//Filters Class
class Filters
{

    public List<Part> parts = new List<Part>();
    public string Url;

    public void Reset()
    {
        //reset
        this.parts = new List<Part>();
    }

    public void RemoveCategoryFilter(string filterCategory)
    {
        //reset
        this.parts.RemoveAll(x => x.filter == filterCategory);
    }

    public void AddFilter(string filter, string value)
    {
        //add filter to list
        this.parts.Add(new Part() { filter = filter, values = value });
        //change url
    }

    public string GetFilters(string filter, string value = null)
    {
        //
        string gdg = "g";
        int go = -1;
        bool hi = this.parts.Exists(x => x.filter == filter);
        if (hi) {
            go = this.parts.FindIndex(x => x.filter == filter);
            gdg = this.parts[go].values;
        }
        //this.filters.TryGetValue("XML_File", out filter)
        return gdg.ToString();
    }

    public DataSet apply()
    {
        //sort list by filter
        this.parts.OrderBy(x => x.filter);
        //connect database
        DataSet dsUser = new DataSet();
        SqlDb sqlUser = new SqlDb();
        bool first = true;
        //create sql
        string stUser = "SELECT * FROM Courses";
        string filter = null;
        foreach (Part item in this.parts)
        {
            if (first)
            {
                filter = item.filter;
                stUser += " WHERE (" + item.filter + "='" + item.values + "'";
                first = false;
            }
            else
            {
                if (filter == item.filter)
                {
                    stUser += " OR " + item.filter + "='" + item.values + "'";
                }
                else
                {
                    filter = item.filter;
                    stUser += ") AND (" + item.filter + "='" + item.values + "'";
                }
            }
        }
        if (this.parts.Count != 0)
        {
            stUser += ");";
        }
        else
        {
            stUser += ";";
        }
        dsUser = sqlUser.chkData(stUser);
        return dsUser;
    }

}