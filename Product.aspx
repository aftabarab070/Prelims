<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="GroceryStore.Product" %>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Category</title>

   <!-- Font Awesome CDN link -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">

   <!-- Custom CSS file link -->
   <link rel="stylesheet" href="css/style.css">

</head>
<body>

   <%-- Include header --%>
   <header class="header">
     <div class="flex">

         <!-- Logo -->
         <a href="admin_page.aspx" class="logo">Groco<span>.</span></a>

         <!-- Navbar -->
         <nav class="navbar">
             <a href="home.aspx">home</a>
             <a href="shop.aspx">shop</a>
             <a href="orders.aspx">orders</a>
             <a href="about.aspx">about</a>
             <a href="contact.aspx">contact</a>
         </nav>

         <!-- Icons -->
         <div class="icons">
             <div id="menu-btn" class="fas fa-bars"></div>
             <div id="user-btn" class="fas fa-user"></div>
             <a href="search_page.aspx" class="fas fa-search"></a>

             <!-- Wishlist and Cart Counts -->
             <a href="wishlist.aspx"><i class="fas fa-heart"></i><span id="wishlistCount">(0)</span></a>
             <a href="cart.aspx"><i class="fas fa-shopping-cart"></i><span id="cartCount">(0)</span></a>
         </div>

         <!-- User Profile -->
         <div class="profile">
             <asp:Image ID="userImage" runat="server" CssClass="profile-img" />
             <asp:Label ID="userNameLabel" runat="server" CssClass="user-name" />
             <a href="user_profile_update.aspx" class="btn">update profile</a>
             <a href="logout.aspx" class="delete-btn">logout</a>

             <div class="flex-btn">
                 <a href="login.aspx" class="option-btn">login</a>
                 <a href="register.aspx" class="option-btn">register</a>
             </div>
         </div>

     </div>
 </header>
   
   <section class="products">

      <h1 class="title">Products Categories</h1>

      <div class="box-container">
            <form runat="server" class="box">
         <asp:Repeater ID="rptProducts" runat="server" >
            <ItemTemplate>
              
                  <div class="price">₹<%# Eval("p_price") %>/-</div>
                  <a href="view_page.aspx?pid=<%# Eval("p_id") %>" class="fas fa-eye"></a>
                 <asp:Image runat="server" ImageUrl='<%# "~/Admin/upload/" + Eval("p_image") %>' class="img-size-64" alt="Car Image" />
                  <div class="name"><%# Eval("p_name") %></div>

                  <input type="hidden" name="pid" value="<%# Eval("p_id") %>" />
                  <input type="hidden" name="p_name" value="<%# Eval("p_name") %>" />
                  <input type="hidden" name="p_price" value="<%# Eval("p_price") %>" />
            
                  <asp:TextBox ID="txtQuantity" runat="server" CssClass="qty" Text="1" type="number" Min="1"></asp:TextBox>                 
                  <asp:Button ID="btnAddToCart" runat="server" CssClass="btn" Text="Add to Cart" OnClick="btnAddToCart_Click"/>
              
            </ItemTemplate>
         </asp:Repeater>
           </form>
      </div>

   </section>

   <%-- Include footer --%>
  <footer class="footer">

    <section class="box-container">

        <!-- Quick Links Section -->
        <div class="box">
            <h3>quick links</h3>
            <a href="home.aspx"><i class="fas fa-angle-right"></i>home</a>
            <a href="shop.aspx"><i class="fas fa-angle-right"></i>shop</a>
            <a href="about.aspx"><i class="fas fa-angle-right"></i>about</a>
            <a href="contact.aspx"><i class="fas fa-angle-right"></i>contact</a>
        </div>

        <!-- Extra Links Section -->
        <div class="box">
            <h3>extra links</h3>
            <a href="cart.aspx"><i class="fas fa-angle-right"></i>cart</a>
            <a href="wishlist.aspx"><i class="fas fa-angle-right"></i>wishlist</a>
            <a href="login.aspx"><i class="fas fa-angle-right"></i>login</a>
            <a href="register.aspx"><i class="fas fa-angle-right"></i>register</a>
        </div>

        <!-- Contact Info Section -->
        <div class="box">
            <h3>contact info</h3>
            <p><i class="fas fa-phone"></i>+123-456-7890 </p>
            <p><i class="fas fa-phone"></i>+111-222-3333 </p>
            <p><i class="fas fa-envelope"></i>shaikhanas@gmail.com </p>
            <p><i class="fas fa-map-marker-alt"></i>mumbai, india - 400104 </p>
        </div>

        <!-- Follow Us Section -->
        <div class="box">
            <h3>follow us</h3>
            <a href="#"><i class="fab fa-facebook-f"></i>facebook </a>
            <a href="#"><i class="fab fa-twitter"></i>twitter </a>
            <a href="#"><i class="fab fa-instagram"></i>instagram </a>
            <a href="#"><i class="fab fa-linkedin"></i>linkedin </a>
        </div>

    </section>

    <!-- Credit Section with Dynamic Copyright Year -->
    <p class="credit">
        &copy; copyright @
        <asp:Literal ID="litYear" runat="server"></asp:Literal>
        by <span>mr. web designer</span> | all rights reserved!
    </p>

</footer>


   <script src="js/script.js"></script>

</body>
</html>
