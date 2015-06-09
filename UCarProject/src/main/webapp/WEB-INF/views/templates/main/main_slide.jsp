<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="carousel slide" id="fullcarousel-example" data-interval="3000" data-ride="carousel">
	<ol class="carousel-indicators">
		<li class="active" data-slide-to="0" data-target="#fullcarousel-example"></li>
		<li data-slide-to="1" data-target="#fullcarousel-example"></li>
		<li data-slide-to="2" data-target="#fullcarousel-example"></li>
	</ol>
	<div class="carousel-inner">		
		<!-- slide image 1 -->
		<div class="active item" id="img_slide" align="center">
			<img src="${initParam.root }img/up.jpg" width="500">
			<div class="carousel-caption">
				<h2>Title</h2>
				<p>Description</p>
			</div>
		</div>
		<!-- slide image 2 -->
		<div class="item" id="img_slide" align="center">
			<img src="${initParam.root }img/up1.jpg" width="500">
			<div class="carousel-caption">
				<h2>Title</h2>
				<p>Description</p>
			</div>
		</div>
		<!-- slide image 3 -->
		<div class="item" id="img_slide" align="center">
			<img src="${initParam.root }img/up2.jpg" width="500">
			<div class="carousel-caption">
				<h2>Title</h2>
				<p>Description</p>
			</div>
		</div>
	</div>
	<a class="left carousel-control" href="#fullcarousel-example" data-slide="prev">
		<i class="icon-prev fa fa-angle-left"></i>
	</a>
	<a class="right carousel-control" href="#fullcarousel-example" data-slide="next">
		<i class="icon-next fa fa-angle-right"></i>
	</a>
</div>