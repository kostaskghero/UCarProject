<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="carousel slide" id="fullcarousel-example" data-interval="500" data-ride="carousel">
	<div class="carousel-inner">
		<!-- slide image 1 -->
		<div class="item" id="img_slide">
			<img src="${initParam.root }img/up.png" style="height: 550x">
			<div class="carousel-caption">
				<h2>Title</h2>
				<p>Description</p>
			</div>
		</div>
		<!-- slide image 2 -->
		<div class="active item" id="img_slide" style="height: 550px">
			<img src="${initParam.root }img/up2.png">
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