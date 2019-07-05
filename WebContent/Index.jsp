<!-- 这个是网页模版，经过修改可以一看 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>主页</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />

<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //for-mobile-apps -->

<link href="CSS/bootstrap.css" rel="stylesheet" type="text/css" media="all" />       
<link href="CSS/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- css修饰文件 -->
 
<!-- js -->
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<!-- //js -->


<!-- load-more -->
<script>
	$(document).ready(function () {
		size_li = $("#myList li").size();
		x=1;
		$('#myList li:lt('+x+')').show();
		$('#loadMore').click(function () {
			x= (x+1 <= size_li) ? x+1 : size_li;
			$('#myList li:lt('+x+')').show();
		});
		$('#showLess').click(function () {
			x=(x-1<0) ? 1 : x-1;
			$('#myList li').not(':lt('+x+')').hide();
		});
	});
</script>
<!-- //load-more -->


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
							<li><a href="#"><span data-hover="服务">服务</span></a></li>
							<li><a href="#"><span data-hover="关于">关于</span></a></li>
							<li><a href="#"><span data-hover="联系我们">联系我们</span></a></li>
						</ul>
					</nav>
				</div>
				<!-- /.navbar-collapse -->
			</nav>
		</div>
	</div>
<!-- //header完成 -->


<!-- banner -->
	<div class="banner">
		<div class="container">
			<div class="w3ls_banner_info">
				<h2>information</h2>
				<p>城市公交线路信息查询系统是基于JSP技术，集合html，sql，js，java设计而成的查询软件。帮助人们在出行时更方便的获取信息</p>
				<div class="wthree_more">
					<a href="single.html" class="button--wayra button--border-thick button--text-upper button--size-s">了解更多</a>
				</div>
			</div>
		</div>
	</div>
<!-- //banner -->


<!-- banner-bottom -->
	<div class="banner-bottom">
		<div class="container">
			<div class="col-md-6 banner_bottom_left">
				<h3>优势</h3>
				<p><i>简介</i> 巴拉巴拉一大堆，就是这个系统的由什么特色和优点</p>
				<div class="wthree_more wthree_more1">
					<a href="single.html" class="button--wayra button--border-thick button--text-upper button--size-s">了解更多</a>
				</div>
			</div>
			
			<div class="col-md-6 banner_bottom_right">
				<div class="wthree_banner_bottom_right_grids">
					<div class="col-md-6 banner_bottom_right_grid">
						<div class="view view-tenth">
							<div class="agile_text_box">
								<i></i>
								<h3>系统</h3>
								<p>车辆信息经过专人整理，分类，方便查阅</p>
							</div>
							<div class="mask">
								<img src="Image/7.jpg" class="img-responsive" alt="" />
							</div>
						</div>
					</div>
					
					<div class="col-md-6 banner_bottom_right_grid">
						<div class="view view-tenth">
							<div class="agile_text_box">
								<i class="men"></i>
								<h3>准确</h3>
								<p>Lorem ipsum dolor sit amet, consectetur adip.</p>
							</div>
							<div class="mask">
								<img src="Image/7.jpg" class="img-responsive" alt="" />
							</div>
						</div>
					</div>
					
					<div class="clearfix"> </div>
				</div>
				<div class="wthree_banner_bottom_right_grids">
					<div class="col-md-6 banner_bottom_right_grid">
						<div class="view view-tenth">
							<div class="agile_text_box">
								<i class="shipping"></i>
								<h3>直观</h3>
								<p>Lorem ipsum dolor sit amet, consectetur adip.</p>
							</div>
							<div class="mask">
								<img src="Image/7.jpg" class="img-responsive" alt="" />
							</div>
						</div>
					</div>
					
					<div class="col-md-6 banner_bottom_right_grid">
						<div class="view view-tenth">
							<div class="agile_text_box">
								<i class="clock"></i>
								<h3>快速</h3>
								<p>Lorem ipsum dolor sit amet, consectetur adip.</p>
							</div>
							<div class="mask">
								<img src="Image/7.jpg" class="img-responsive" alt="" />
							</div>
						</div>
					</div>
					
					<div class="clearfix"> </div>
				</div>
			</div>
			
			<div class="clearfix"> </div>
		</div>
	</div>
<!-- banner-bottom -->


<!-- 删除了banner bottom1部分 -->
<div class="tlinks">Collect from <a href="http://www.cssmoban.com/" >网页模板</a></div>


<!-- news -->

<!-- //news -->

<!-- 删除了TESTIMONIALS部分 -->



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