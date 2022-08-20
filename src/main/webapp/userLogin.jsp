
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en" >
<head>
    <meta charset="UTF-8">
    <title>Sign Up Signin Form Template Example</title>
    <link rel="stylesheet" href="design/style.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
</head>
<body>
<div id="form">
    <div class="container"><br>
        <h2 class="text-uppercase text-center"> Nuello<a href="adminPage.jsp"> </a>Supreme Clothings</h2>
        <div class="col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3 col-md-8 col-md-offset-2">
            <div id="userform">
                <ul class="nav nav-tabs nav-justified" role="tablist">
                    <li class="active"><a href="#login" role="tab" data-toggle="tab">Log in</a></li>
                    <li><a href="#signup" role="tab" data-toggle="tab">Sign up</a></li>
                </ul>
                <div class="tab-content">

                    <!-- Log in section -->

                    <div class="tab-pane fade active in" id="login">
                        <h2 class="text-uppercase text-center"> Log in</h2>
                        <form id="login" action="userLoginServlet" method="post"                                        >
                            <div class="form-group">
                                <label> Your Email<span class="req">*</span> </label>
                                <input type="email" class="form-control" id="email" name="email" required autofocus required data-validation-required-message="Please enter your email address." autocomplete="off">
                                <p class="help-block text-danger"></p>
                            </div>
                            <div class="form-group">
                                <label> Password<span class="req">*</span> </label>
                                <input type="password" class="form-control" id="password" name="password"required data-validation-required-message="Please enter your password" autocomplete="off">
                                <p class="help-block text-danger"></p>
                            </div>
                            <div class="mrgn-30-top">
                                <button type="submit" class="btn btn-larger btn-block"/>
                                Log in
                                </button>
                            </div>
                            <div class="w-50 text-left">
                                <label class="checkbox-wrap checkbox-primary mb-0">Remember Me
                                    <input type="checkbox" checked>
                                    <span class="checkmark"></span>
                                </label>
                            </div>
                            <div class="w-50 text-md-right">
                                <a href="#">Forgot Password</a>
                            </div>
                        </form>
                    </div>

                    <!-- Sign up Section -->

                    <div class="tab-pane fade in" id="signup">
                        <form id="signup" action="userSignupServlet" method="post">
                            <div class="row">
                                <div class="col-xs-12 col-sm-6">
                                    <div class="form-group">
                                        <label>First Name<span class="req">*</span> </label>
                                        <input type="text" class="form-control" id="first_name" name="firstname" required data-validation-required-message="Please enter your name." autocomplete="off">
                                        <p class="help-block text-danger"></p>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6">
                                    <div class="form-group">
                                        <label> Last Name<span class="req">*</span> </label>
                                        <input type="text" class="form-control" id="last_name" name="lastname" required data-validation-required-message="Please enter your name." autocomplete="off">
                                        <p class="help-block text-danger"></p>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label> Your Email<span class="req">*</span> </label>
                                <input type="email" class="form-control" id="email" name="email" required data-validation-required-message="Please enter your email address." autocomplete="off">
                                <p class="help-block text-danger"></p>
                            </div>
                            <div class="form-group">
                                <label> Your Phone<span class="req">*</span> </label>
                                <input type="tel" class="form-control" id="phone" name="phone" required data-validation-required-message="Please enter your phone number." autocomplete="off">
                                <p class="help-block text-danger"></p>
                            </div>
                            <div class="form-group">
                                <label> Password<span class="req">*</span> </label>
                                <input type="password" class="form-control" id="password" name="password" required data-validation-required-message="Please enter your password" autocomplete="off">
                                <a href="/account/signup?showPassword=true" tabindex="-1" type="button">Show</a>
                                <p class="help-block text-danger"></p>
                            </div>
                            <div class="form-group">
                                <label> Confirm Password<span class="req">*</span> </label>
                                <input type="password" class="form-control" id="password" name="Cpassword" required data-validation-required-message="Please enter your password" autocomplete="off">
                                <a href="/account/signup?showPassword=true" tabindex="-1" type="button">Show</a>
                                <p class="help-block text-danger"></p>
                            </div>
                            <div class="mrgn-30-top">
                                <button type="submit" class="btn btn-larger btn-block"/>
                                Sign up
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /.container -->
</div>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="design/script.js"></script>
</body>
</html>
