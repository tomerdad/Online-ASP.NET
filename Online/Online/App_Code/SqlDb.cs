using System.Data;
using System.Data.OleDb;

/// <summary>
/// Summary description for SqlDb
/// </summary>
public class SqlDb
{
    public SqlDb()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    //  פעולה המקבלת מחרוזת שהיא שאילתא,ןמחזירה נתונים בהתאם לתוצאות השאילתא
    public DataSet chkData(string sqlstr)
    {

        string connString = Connect.GetConnectionString();
        OleDbConnection conn = new OleDbConnection(connString);
        OleDbDataAdapter da = new OleDbDataAdapter(sqlstr, conn);
        DataSet ds = new DataSet();
        da.Fill(ds);
        return ds;
    }
    // פעולה המבצעת עדכון,מחיקה והכנסה על בסיס הנתונים
    public void udi(string sqlstr)
    {

        string connString = Connect.GetConnectionString();
        OleDbConnection conn = new OleDbConnection(connString);
        OleDbCommand build = new OleDbCommand(sqlstr, conn);
        conn.Open();
        build.ExecuteNonQuery();
        conn.Close();
    }
}