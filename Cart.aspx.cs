using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GroceryStore
{
    public partial class Cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if the session variable 'user' is not null
            if (Session["user"] != null)
            {
                string user = Session["user"].ToString();

                // Ensure that the connection object is initialized and not null
                if (config.con != null)
                {
                    string select = "SELECT * FROM user_info WHERE name=@user";
                    SqlDataAdapter da = new SqlDataAdapter(select, config.con);
                    da.SelectCommand.Parameters.AddWithValue("@user", user);  // Use parameterized queries to avoid SQL injection
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    // Check if the 'userdetails' control is not null
                    if (userdetails != null)
                    {
                        userdetails.DataSource = dt;
                        userdetails.DataBind();
                    }
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }

            // Check if 'Session["user"]' is not null before using it for cart retrieval
            if (Session["user"] != null)
            {
                string cartuser = Session["user"].ToString();

                // Ensure that the connection object is initialized and not null
                if (config.con != null)
                {
                    string selectcartuser = "SELECT * FROM user_info WHERE name=@cartuser";
                    SqlDataAdapter sda = new SqlDataAdapter(selectcartuser, config.con);
                    sda.SelectCommand.Parameters.AddWithValue("@cartuser", cartuser);
                    DataTable sdt = new DataTable();
                    sda.Fill(sdt);

                    if (sdt.Rows.Count > 0)
                    {
                        string cuid = sdt.Rows[0]["u_id"].ToString();

                        // Query the cart items for the specific user
                        string cartproduct = "SELECT * FROM cart WHERE user_id=@cuid";
                        SqlDataAdapter cda = new SqlDataAdapter(cartproduct, config.con);
                        cda.SelectCommand.Parameters.AddWithValue("@cuid", cuid);
                        DataTable cdt = new DataTable();
                        cda.Fill(cdt);

                        // Check if CartRepeater is not null before binding the data
                        if (CartRepeater != null)
                        {
                            CartRepeater.DataSource = cdt;
                            CartRepeater.DataBind();
                        }
                    }
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

    }
}