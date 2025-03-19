<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="GroceryStore.Cart" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shopping Cart</title>

    <!-- Font Awesome CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">

    <!-- Custom CSS file -->
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <form runat="server">
        <!-- Header Section -->
        <header class="header">
            <div class="flex">
                <!-- Logo -->
                <a href="admin_page.aspx" class="logo">Groco<span>.</span></a>

                <!-- Navbar -->
                <nav class="navbar">
                    <a href="home.aspx">Home</a>
                    <a href="shop.aspx">Shop</a>
                    <a href="orders.aspx">Orders</a>
                    <a href="about.aspx">About</a>
                    <a href="contact.aspx">Contact</a>
                </nav>

                <!-- Icons Section -->
                <div class="icons">
                    <div id="menu-btn" class="fas fa-bars"></div>
                    <div id="user-btn" class="fas fa-user"></div>
                    <a href="search_page.aspx" class="fas fa-search"></a>

                    <!-- Wishlist and Cart Counts -->
                    <a href="wishlist.aspx"><i class="fas fa-heart"></i><span id="wishlistCount">(0)</span></a>
                    <a href="cart.aspx"><i class="fas fa-shopping-cart"></i><span id="cartCount">(0)</span></a>
                </div>
                <!-- User Details (inside repeater) -->
                <asp:Repeater runat="server" ID="userdetails">
                    <ItemTemplate>
                        <div class="profile">
                            <asp:Image ID="userImage" runat="server" CssClass="profile-img" ImageUrl='<%# "~/Admin/upload/" + Eval("image") %>' />
                            <h1><%# Eval("name") %></h1>
                            <asp:Button runat="server" Width="285px" Text="Log Out" href="logout.aspx" class="delete-btn" />
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </header>



        <!-- Shopping Cart Section -->
        <section class="shopping-cart">
            <h1 class="title">Products Added</h1>

            <!-- Cart Items -->
            <div class="box-container">
                <asp:Repeater ID="CartRepeater" runat="server">
                    <ItemTemplate>
                        <div class="box">
                            <!-- Remove from Cart -->
                            <a href="#" class="fas fa-times"
                                onclick='<%# "return confirm(\'delete this from cart?\');" %>'></a>
                            <!-- View Product -->
                            <a href='<%# "view_page.aspx?pid=" + Eval("pid") %>' class="fas fa-eye"></a>
                            <img src='<%# "uploaded_img/" + Eval("image") %>' alt="" />
                            <div class="name"><%# Eval("name") %></div>
                            <div class="price">$<%# Eval("price") %>/-</div>

                            <asp:HiddenField ID="CartId" runat="server" Value='<%# Eval("id") %>' />
                            <div class="flex-btn">
                                <asp:TextBox ID="Quantity" runat="server" Text='<%# Eval("quantity") %>' CssClass="qty"
                                    TextMode="Number" MinLength="1" />
                                <asp:Button ID="btnUpdateQuantity" runat="server" Text="Update" CssClass="option-btn"
                                    CommandArgument='<%# Eval("id") %>' />
                            </div>

                            <!-- Subtotal -->
                            <div class="sub-total">Sub Total: <span>$<%# Eval("price") %> * <%# Eval("quantity") %>/-</span></div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>

            <!-- Cart Total -->
            <div class="cart-total">
                <p>Grand Total: $<asp:Label ID="lblGrandTotal" runat="server" Text="0" />/-</p>
                <a href="shop.aspx" class="option-btn">Continue Shopping</a>
                <a href="cart.aspx?delete_all" class="delete-btn" <%# (Convert.ToDouble(lblGrandTotal.Text) > 0 ? "" : "disabled") %>>Delete All</a>
                <a href="checkout.aspx" class="btn" <%# (Convert.ToDouble(lblGrandTotal.Text) > 0 ? "" : "disabled") %>>Proceed to Checkout</a>
            </div>
        </section>

        <!-- Footer Section -->
        <footer class="footer">
            <section class="box-container">
                <!-- Quick Links Section -->
                <div class="box">
                    <h3>Quick Links</h3>
                    <a href="home.aspx"><i class="fas fa-angle-right"></i>Home</a>
                    <a href="shop.aspx"><i class="fas fa-angle-right"></i>Shop</a>
                    <a href="about.aspx"><i class="fas fa-angle-right"></i>About</a>
                    <a href="contact.aspx"><i class="fas fa-angle-right"></i>Contact</a>
                </div>

                <!-- Extra Links Section -->
                <div class="box">
                    <h3>Extra Links</h3>
                    <a href="cart.aspx"><i class="fas fa-angle-right"></i>Cart</a>
                    <a href="wishlist.aspx"><i class="fas fa-angle-right"></i>Wishlist</a>
                    <a href="login.aspx"><i class="fas fa-angle-right"></i>Login</a>
                    <a href="register.aspx"><i class="fas fa-angle-right"></i>Register</a>
                </div>

                <!-- Contact Info Section -->
                <div class="box">
                    <h3>Contact Info</h3>
                    <p><i class="fas fa-phone"></i>+123-456-7890</p>
                    <p><i class="fas fa-envelope"></i>example@domain.com</p>
                    <p><i class="fas fa-map-marker-alt"></i>City, Country</p>
                </div>

                <!-- Follow Us Section -->
                <div class="box">
                    <h3>Follow Us</h3>
                    <a href="#"><i class="fab fa-facebook-f"></i>Facebook</a>
                    <a href="#"><i class="fab fa-twitter"></i>Twitter</a>
                    <a href="#"><i class="fab fa-instagram"></i>Instagram</a>
                    <a href="#"><i class="fab fa-linkedin"></i>LinkedIn</a>
                </div>
            </section>

            <!-- Credit Section with Dynamic Copyright Year -->
            <p class="credit">&copy;
                <asp:Literal ID="litYear" runat="server"></asp:Literal>
                by <span>Grocery Store</span> | All Rights Reserved</p>
        </footer>

        <script src="js/script.js"></script>
    </form>
</body>
</html>
