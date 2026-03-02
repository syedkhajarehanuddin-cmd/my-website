<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Ramnivas Sweets and Namkeens | Official Store</title>

<meta name="description" content="Buy fresh sweets and namkeens online from Ramnivas Sweets and Namkeens, Hanamkonda. Order online, pay via UPI, Razorpay, or Cash on Delivery.">

<script src="https://checkout.razorpay.com/v1/checkout.js"></script>

<style>

:root{
--primary:#800000;
--secondary:#ff6a00;
--accent:#008000;
--bg:#fff8f0;
}

body{
margin:0;
font-family:Arial, Helvetica, sans-serif;
background:var(--bg);
}

header{
background:var(--primary);
color:white;
padding:20px;
text-align:center;
}

header h1{
margin:5px;
}

nav{
background:var(--secondary);
padding:10px;
text-align:center;
}

nav button{
background:white;
border:none;
padding:10px 18px;
margin:5px;
font-weight:bold;
cursor:pointer;
border-radius:5px;
}

nav button:hover{
background:#ffe0cc;
}

.container{
padding:20px;
max-width:1200px;
margin:auto;
}

.products{
display:flex;
flex-wrap:wrap;
justify-content:center;
}

.product{
background:white;
width:240px;
margin:15px;
padding:15px;
border-radius:10px;
box-shadow:0 4px 10px rgba(0,0,0,0.2);
text-align:center;
}

.product img{
width:100%;
height:160px;
object-fit:cover;
border-radius:10px;
}

.product button{
background:var(--accent);
color:white;
border:none;
padding:10px;
margin-top:8px;
cursor:pointer;
border-radius:5px;
width:100%;
}

.product button:hover{
background:#006400;
}

.cart-box{
background:white;
padding:20px;
border-radius:10px;
box-shadow:0 4px 10px rgba(0,0,0,0.2);
}

input, textarea, select{
width:100%;
padding:10px;
margin:6px 0;
border-radius:5px;
border:1px solid #ccc;
}

.checkout-buttons button{
width:100%;
margin-top:8px;
}

footer{
background:var(--primary);
color:white;
text-align:center;
padding:20px;
margin-top:30px;
}

iframe{
border:0;
border-radius:10px;
}

@media(max-width:600px){
.product{
width:90%;
}
}

</style>

</head>

<body>

<header>

<h1>Ramnivas Sweets and Namkeens</h1>

<p>
📞 070329 76159<br>
Hanamkonda, Telangana<br>
Open Daily: 10 AM – 10 PM
</p>

</header>

<nav>

<button onclick="showShop()">Shop</button>

<button onclick="showCart()">
Cart (<span id="cartCount">0</span>)
</button>

</nav>

<div class="container">

<!-- SHOP -->

<div id="shopSection">

<h2>Our Products</h2>

<div class="products">

<div class="product">
<img src="https://images.unsplash.com/photo-1631452180519-c014fe946bc7">
<h3>Kaju Katli</h3>
<p>₹900 / kg</p>
<button onclick="addToCart('Kaju Katli',900)">Add to Cart</button>
</div>

<div class="product">
<img src="https://images.unsplash.com/photo-1626082927389-6cd097cdc6ec">
<h3>Ladoo</h3>
<p>₹380 / kg</p>
<button onclick="addToCart('Ladoo',380)">Add to Cart</button>
</div>

<div class="product">
<img src="https://images.unsplash.com/photo-1590080877777-95b9e5d5b68b">
<h3>Jalebi</h3>
<p>₹300 / kg</p>
<button onclick="addToCart('Jalebi',300)">Add to Cart</button>
</div>

<div class="product">
<img src="https://images.unsplash.com/photo-1605197161470-5c1b5b6b4e7a">
<h3>Gulab Jamun</h3>
<p>₹400 / kg</p>
<button onclick="addToCart('Gulab Jamun',400)">Add to Cart</button>
</div>

</div>

</div>

<!-- CART -->

<div id="cartSection" style="display:none;">

<h2>Your Cart</h2>

<div id="cartItems"></div>

<h3>Total: ₹<span id="totalPrice">0</span></h3>

<div class="cart-box">

<h3>Customer Details</h3>

<input id="customerName" placeholder="Full Name">

<input id="customerPhone" placeholder="Phone Number">

<textarea id="customerAddress" placeholder="Delivery Address"></textarea>

<select id="paymentMethod">
<option>Cash on Delivery</option>
<option>UPI</option>
<option>Online Payment (Razorpay)</option>
</select>

<div class="checkout-buttons">

<button onclick="orderWhatsApp()">Place Order via WhatsApp</button>

<button onclick="payOnline()">Pay Online via Razorpay</button>

<a href="upi://pay?pa=ramnivassweets@upi&pn=Ramnivas Sweets and Namkeens&cu=INR">
<button>Pay via UPI</button>
</a>

</div>

</div>

</div>

</div>

<div class="container">

<h2>Our Location</h2>

<iframe
src="https://maps.google.com/maps?q=Hanamkonda&t=&z=13&ie=UTF8&iwloc=&output=embed"
width="100%"
height="300">
</iframe>

</div>

<footer>

© 2026 Ramnivas Sweets and Namkeens<br>

Official Website: ramnivassweets.com

</footer>

<script>

let cart=[];

function addToCart(name, price){

cart.push({name,price});

updateCart();

alert(name+" added to cart");

}

function updateCart(){

document.getElementById("cartCount").innerText=cart.length;

let html="";
let total=0;

cart.forEach((item,index)=>{

html+=`${item.name} - ₹${item.price}
<button onclick="removeItem(${index})">Remove</button><br>`;

total+=item.price;

});

document.getElementById("cartItems").innerHTML=html;

document.getElementById("totalPrice").innerText=total;

}

function removeItem(index){

cart.splice(index,1);

updateCart();

}

function showCart(){

document.getElementById("shopSection").style.display="none";
document.getElementById("cartSection").style.display="block";

}

function showShop(){

document.getElementById("shopSection").style.display="block";
document.getElementById("cartSection").style.display="none";

}

function orderWhatsApp(){

let name=document.getElementById("customerName").value;
let phone=document.getElementById("customerPhone").value;
let address=document.getElementById("customerAddress").value;
let payment=document.getElementById("paymentMethod").value;
let total=document.getElementById("totalPrice").innerText;

let message="Order Details:%0A";

cart.forEach(item=>{
message+=`${item.name} ₹${item.price}%0A`;
});

message+=`Total: ₹${total}%0AName: ${name}%0APhone: ${phone}%0AAddress: ${address}%0APayment: ${payment}`;

window.open(`https://wa.me/917032976159?text=${message}`);

}

function payOnline(){

let total=document.getElementById("totalPrice").innerText;

let options={
"key":"YOUR_RAZORPAY_KEY",
"amount":total*100,
"currency":"INR",
"name":"Ramnivas Sweets and Namkeens",
"description":"Order Payment",
"handler":function(){
alert("Payment Successful");
orderWhatsApp();
}
};

let rzp=new Razorpay(options);

rzp.open();

}

</script>

</body>
</html>
