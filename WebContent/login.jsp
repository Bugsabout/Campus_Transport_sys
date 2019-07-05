<!-- 这个是网页模版，经过修改可以一看 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>登陆界面</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //for-mobile-apps -->
<link href="CSS/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="CSS/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- js -->
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<!-- //js -->
<link href='http://fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
</head>
	
<body>
<!-- header -->
	<div class="header">
		<div class="container">
	
			<div class="w3l_header_left"> 
				<ul>
					<li><span class="glyphicon glyphicon-earphone" aria-hidden="true"></span>联系电话：177xxxxxxxx</li>
					<li><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span><a href="mailto:994232444@qq.com">994232444@qq.com</a></li>
				</ul>
			</div>
			<!-- //OK -->
			
			<div id="example2">	
				<div class="wrapper2">
					<div class="content-wrapper2">
						<div class="search-button2">
							<span></span>
						</div>
						
						
						<div class="search-box2">
							<form action="#" method="post">
								<input type="text" name="Search" placeholder="Search Here..." required="">
								<input type="submit" value="Send"> <img src="Image/close.png" alt=" " />
								<!-- 搜索栏不能打开，要修改 -->
							</form>
						</div>
					</div>
				</div>
			</div>
			
			<div class="w3l_header_right">
				<ul>
					<li><a href="login.jsp"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>登陆</a></li>
					<li><a href="Register.jsp"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>注册</a></li>
					<li><a href="Adminlogin.jsp"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>管理员登陆</a></li>
					
					<!-- 删除了sign-up栏目 -->
				</ul>
			</div>
			
			<div class="clearfix"> </div>
			<script type="text/javascript" src="js/demo.js"></script>
		</div>
	</div>
	
	
	<div class="logo_nav">
		<div class="container">
			<nav class="navbar navbar-default">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
				  <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				  </button>
					<div class="logo">
						<h1><a class="navbar-brand" href="Index.jsp">城市公交线路信息查询系统</a></h1>
					</div>
				</div>

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse nav-wil" id="bs-example-navbar-collapse-1">
					<nav class="link-effect-2" id="link-effect-2">
						<ul class="nav navbar-nav">
							<li class="active"><a href="Index.jsp"><span data-hover="主页">主页</span></a></li>
							<li><a href="services.html"><span data-hover="服务">服务</span></a></li>
							<li><a href="about.html"><span data-hover="关于">关于</span></a></li>
							<li><a href="mail.html"><span data-hover="联系我们">联系我们</span></a></li>
						</ul>
					</nav>
				</div>
				<!-- /.navbar-collapse -->
			</nav>
		</div>
	</div>
<!-- //header -->


<!-- banner1 -->
	<div class="banner1">
		<div class="container">
		</div>
	</div>

	<div class="services-breadcrumb">
		<div class="container">
			<ul>
				<li><a href="Index.jsp">主页</a><i>|</i></li>
				<li>登陆</li>
			</ul>
		</div>
	</div>
<!-- //banner1 -->


<!-- login -->
	<div class="login">
		<div class="container">
			<h6>登陆</h6>
			<h3>欢迎登陆本系统 
				请点击<a href="login.jsp">登陆</a> 相关，或者 <a href="Register.jsp">
				注册</a> here.</h3>

			<form id="userlogin" name="userlogin" action="Ulogin.jsp" method="post">
				<input type="text" name="username" value="User Name" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'User Name';}">
				<input type="password" name="password" class="lock" value="Password" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Password';}">
				<div class="remember">
					 <div class="w3agile_checkbox1">
						   <label class="checkbox"><input type="checkbox" name="Checkbox" checked=""><i> </i>记住我</label>
					 </div>
					 <div class="w3agile_forgot">
						<h4><a href="#">忘记密码?</a></h4>
					 </div>
					<div class="clearfix"> </div>
				</div>
				<input type="submit" value="登陆">
			</form>
			<div class="agileits_social">
				<h5>使用你的 <a href="#">Fackbook</a> or <a href="#">Twitter</a>登陆</h5>
				<a href="#" class="face">Facebook</a>
				<a href="#" class="twitt">Twitter</a>
				<div class="clearfix"> </div>
			</div>		
			<div class="agile_back_home">
				<a href="Index.jsp">返回</a>
			</div>
		</div>
	</div>
<!-- //login -->




<!-- footer -->
	<div class="footer">
		<div class="container">
			<div class="col-md-3 w3agile_footer_grid">
				<h3>关于我们</h3>
				<p>一大堆介绍</p>
				<h2><a href="Index.jsp">城市公交线路信息查询系统</a></h2>
			</div>
			<div class="col-md-2 w3agile_footer_grid">	
				<h3>链接</h3>
				<ul>
					<li><a href="Index.jsp">主页</a></li>
					<li><a href="#">服务</a></li>
					<li><a href="#">关于</a></li>
					<li><a href="#">联系我们</a></li>
				</ul>
			</div>
			<div class="col-md-4 w3agile_footer_grid">
				<h3>推特帖子评价</h3>
				<ul class="w3agile_footer_grid_list">
					<li>一般般
						<span>02 days ago</span></li>
					<li>还可以<span>03 days ago</span></li>
				</ul>
			</div>
			<div class="col-md-3 w3agile_footer_grid">
				<h3>一些图片分享</h3>
				<div class="w3agile_footer_grid_left">
					<a href="#"><img src="Image/1.jpg" alt=" " class="img-responsive" /></a>
				</div>
				<div class="w3agile_footer_grid_left">
					<a href="#"><img src="Image/4.jpg" alt=" " class="img-responsive" /></a>
				</div>
				<div class="w3agile_footer_grid_left">
					<a href="#"><img src="Image/15.jpg" alt=" " class="img-responsive" /></a>
				</div>
				<div class="w3agile_footer_grid_left">
					<a href="#"><img src="Image/17.jpg" alt=" " class="img-responsive" /></a>
				</div>
				<div class="w3agile_footer_grid_left">
					<a href="#"><img src="Image/18.jpg" alt=" " class="img-responsive" /></a>
				</div>
				<div class="w3agile_footer_grid_left">
					<a href="#"><img src="Image/19.jpg" alt=" " class="img-responsive" /></a>
				</div>
				<div class="clearfix"> </div>
			</div>
			<div class="clearfix"> </div>
		</div>
	</div>
	<div class="agileinfo_copy_right">
		<div class="container">
			<div class="agileinfo_copy_right_left">
				<p>Copyright &copy; 2017.Company name All rights reserved.</p>
			</div>
			<div class="agileinfo_copy_right_right">
				<ul class="social">
					<li><a class="social-linkedin" href="#">
						<i></i>
						<div class="tooltip"><span>Facebook</span></div>
						</a></li>
					<li><a class="social-twitter" href="#">
						<i></i>
						<div class="tooltip"><span>Twitter</span></div>
						</a></li>
					<li><a class="social-google" href="#">
						<i></i>
						<div class="tooltip"><span>Google+</span></div>
						</a></li>
					<li><a class="social-facebook" href="#">
						<i></i>
						<div class="tooltip"><span>Pinterest</span></div>
						</a></li>
					<li><a class="social-instagram" href="#">
						<i></i>
						<div class="tooltip"><span>Instagram</span></div>
						</a></li>
				</ul>
			</div>
			<div class="clearfix"> </div>
		</div>
	</div>
<!-- //footer -->
<!-- for bootstrap working -->
	<script src="js/bootstrap.js"></script>
<!-- //for bootstrap working -->
</body>
</html>