
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Sign up</title>
</head>
<body>
<div class="container">
    <form action="userSignupServlet" method="post">
        <h1>Sign in</h1>
        <div class="inner-container">
            <div>
                <label>First Name</label>
                <input type="text" placeholder="Enter First Name*" name="firstname" required autofocus>
            </div>
            <div>
                <label>Last Name</label>
                <input type="text" placeholder="Enter Last Name *" name="lastname" required autofocus>
            </div>
            <div>
                <label>Email Address</label>
                <input type="email" placeholder="Enter Email *" name="email" required autofocus>
            </div>
            <div>
                <label>Phone Number</label>
                <input type="tel" placeholder="Enter Mobile No. *" name="phone" required autofocus>
            </div>
            <div>
                <label>Password</label>
                <input type="password" placeholder="Enter Password" name="password" required autofocus>
                <a href="/account/signup?showPassword=true" tabindex="-1" type="button">Show</a>
            </div>
            <div class="item">
                <label>Confirm Password</label>
                <input type="password" placeholder="Confirm Password" name="Cpassword" required autofocus>
                <a href="/account/signup?showPassword=true" tabindex="-1" type="button">Show</a>
            </div>
            <div>
                <input type="checkbox" name="remember-me" id="remember-me"/>
                <label>Remember me</label>
            </div>
            <div class="account_creation">
                <button type="submit">Register</button>
            </div>
            <div class="t&c">
                <span>By signing up you accept our </span>
                <a href="/content/terms-and-conditions" target="_blank">terms and conditions</a>
                <div><a href="/content/privacy-policy" target="_blank">&amp; privacy policy</a></div>
            </div>
        </div>
    </form>
    <div>
        <span> Already have an Account? </span>
        <a href="userLogin.jsp"> Login </a>
    </div>
</div>

</body>
</html>
