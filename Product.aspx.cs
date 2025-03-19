using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GroceryStore
{
    public partial class Product : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["user"] != null)
                {
                    string user = Session["user"].ToString();
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
                string catogory = Request.QueryString["catagory_name"];
                string sql = "SELECT * FROM products WHERE catagory_name='" + catogory + "'";
                SqlDataAdapter adapter = new SqlDataAdapter(sql, config.con);
                DataTable dataTable = new DataTable();
                adapter.Fill(dataTable);
                if (dataTable.Rows.Count > 0)
                {
                    rptProducts.DataSource = dataTable;
                    rptProducts.DataBind();
                }
            }
        }

        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            RepeaterItem item = (sender as Button).NamingContainer as RepeaterItem;
            TextBox txtQuantity = item.FindControl("txtQuantity") as TextBox;
            string quantity = txtQuantity.Text;
            string user = Session["user"].ToString();
            string category = Request.QueryString["catagory_name"]; 

           
            string sql = "SELECT u_id FROM user_info WHERE name='" + user + "'";  
            SqlDataAdapter da = new SqlDataAdapter(sql, config.con);
            DataTable dt = new DataTable();
            da.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                string userId = dt.Rows[0]["u_id"].ToString();

               
                string select = "SELECT p_id, p_name, p_price, p_image FROM products WHERE catagory_name='" + category + "'";
                SqlDataAdapter adapter = new SqlDataAdapter(select, config.con);
                DataTable productTable = new DataTable();
                adapter.Fill(productTable);

                if (productTable.Rows.Count > 0)
                {
                    string productId = productTable.Rows[0]["p_id"].ToString();
                    string productName = productTable.Rows[0]["p_name"].ToString();
                    string productPrice = productTable.Rows[0]["p_price"].ToString();
                    string productImage = productTable.Rows[0]["p_image"].ToString();

                    
                    string insert = "INSERT INTO cart (user_id, pid, name, price, quantity, image) " +
                                    "VALUES ('" + userId + "','" + productId + "','" + productName + "','" + productPrice + "','" + quantity + "','" + productImage + "')";
                    SqlDataAdapter insertAdapter = new SqlDataAdapter(insert, config.con);
                    DataTable insertTable = new DataTable();
                    insertAdapter.Fill(insertTable);

                    Response.Write("<script>alert('Product added to cart.')</script>");
                }
                else
                {
                    Response.Write("<script>alert('Product not found in the selected category.')</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('User not found.')</script>");
            }
        }

    }
}