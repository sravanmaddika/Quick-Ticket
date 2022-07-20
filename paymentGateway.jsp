<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta
      name="viewport"
      content="width=device-width,
               initial-scale=1.0"/>
    <link rel="stylesheet" href="style_1.css" 
          class="css" />
  </head>
  <body bgcolor="pink">
    <div class="container">
      <div class="main-content">
        <p class="text"></p>
      </div>
  
      <div class="centre-content">
        <h1 class="price">Payment Checkout</h1>
        
      </div>
  
      
  <form action="paymentprocess.jsp" method="post">
      <div class="card-details">
        <p>Pay using Credit or Debit card</p>
        <div class="card-number">
          <label> Ticket Number </label>
          <input
            type="text"
            class="card-number-field" name="tid"
            value="<%=(String)session.getAttribute("tid")%>" readonly/>
        </div>
        <div class="card-number">
          <label> Card Number </label>
         &nbsp; <input
            type="text" name="cnumber"
            class="card-number-field"
            placeholder="####-####-####"/>
        </div>
        
        <div class="date-number">
          <label> Expiry Date </label>
        &nbsp;&nbsp;&nbsp;&nbsp;  <input type="text" class="date-number-field" name="exdate" placeholder="MM/YY" />
        </div>
  
        <div class="cvv-number">
          <label> CVV number </label>
          &nbsp;&nbsp;&nbsp;<input type="text" class="cvv-number-field" name="cvv"
                 placeholder="xxx" />
        </div>
        <div class="nameholder-number">
          <label>Holder Name </label>
          &nbsp;&nbsp;<input
            type="text"
            class="card-name-field" name="cname"
            placeholder="Enter your Name"/>
        </div>
        <div class="nameholder-number">
          <label>Total Amount </label>
          &nbsp;&nbsp;<input
            type="text"
            class="card-name-field" name="tamount"
            value="<%=(String)session.getAttribute("tamount")%>" readonly/>
        </div>
        <input type="submit" value="proceed"
                class="submit-now-btn">
          
        
      </div>
    </div>
  </form>
  </body>
</html>