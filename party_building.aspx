<%@ Page Language="C#" AutoEventWireup="true" CodeFile="party_building.aspx.cs" Inherits="party_building" %>

<%@ Assembly Name="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<asp:content id="Content0" contentplaceholderid="PlaceHolderAdditionalPageHead" runat="server">
<link rel="stylesheet" type="text/css" href="css/swiper-3.4.2.min.css">
<link rel="stylesheet" type="text/css" href="css/all.css">
<link rel="stylesheet" type="text/css" href="css/party_building.css">
<script type="text/javascript" src="./js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="./js/swiper-3.4.2.min.js"></script>
<script type="text/javascript" src="./js/commons.js"></script>
<script type="text/javascript" src="./js/sg-common-v0.1.js"></script>
<script type="text/javascript">
 var webUrl = "";
var querys = " ";
querys = "<View Scope=\'RecursiveAll\'>" +
        "<Query>" +
        "<OrderBy><FieldRef Name=\'date\' Ascending =\'False\'/></OrderBy>" +
        "</Query>" +
        "</View>";
$("document").ready(function(){
    webUrl = _spPageContextInfo.webServerRelativeUrl;
    //左边轮播数据
    GetItems(webUrl, "区域化党建图集", querys, "party_building_atlas"); 
})

function party_building_atlas(arr) {
    var party_building_atlas = "";
    for (var i = 0; i <4; i++) {
        var vals = arr[i].get_fieldValues();
        party_building_atlas +='<div class="swiper-slide"><a href="#"><img src="'+ vals.FileRef +'"></a></div>'; 
    }
    $(".swiper-wrapper").html(party_building_atlas);

    //必须放在这个位置，加载配置图片，再轮播，否则浏览器轮播失效
    var swiper = new Swiper('.index_swiper', {
        pagination: '.swiper-pagination',
        nextButton: '.swiper-button-next',
        prevButton: '.swiper-button-prev',

        paginationClickable: true,

        loop: true,
        autoplay: 4000,
        autoplayDisableOnInteraction: false
    });
    //轮播其他配置
    // Show or Hide
    // $(".index_swiper").hover(function () {
    // 	$(".swiper-button-prev,.swiper-button-next").stop().fadeIn()
    // },function () {
    // 	$(".swiper-button-prev,.swiper-button-next").stop().fadeOut()
    // })
    //滑过悬停
    //	$(".index_swiper").mouseenter(function () {
    //		swiper.stopAutoplay();
    //	}).mouseleave(function(){
    //		swiper.startAutoplay();
    //	});

    //获取右侧第一个库结对共建数据
    GetItems(webUrl, "结对共建", querys, "pair_construction");
}

function pair_construction(arr) {
    var pair_construction = "";
    for (var i = 0; i <3; i++) {
        var vals = arr[i].get_fieldValues();
        console.log(vals);
        pair_construction += '<li onclick="window.location.href=\'' + vals.FileRef + '\'' + '"><span class="con_show_txt">' + vals.title0 + '</span><span class="con_show_date">' + ormatDate(vals.date) + '</span></li>';
    }
    $(".pair_construction").html(pair_construction);
    //获取右侧第二个库志愿者数据
    GetItems(webUrl, "志愿者", querys, "postulant");
}

function postulant(arr) {
    var postulant = "";
    for (var i = 0; i <3; i++) {
        var vals = arr[i].get_fieldValues();
        console.log(vals);
        postulant += '<li onclick="window.location.href=\'' + vals.FileRef + '\'' + '"><span class="con_show_txt">' + vals.title0 + '</span><span class="con_show_date">' + ormatDate(vals.date) + '</span></li>';
    }
    $(".postulant").html(postulant);
    //获取右侧第三个库区域化建设数据
    GetItems(webUrl, "区域化建设", querys, "regionalization_construction");
}

function regionalization_construction(arr) {
    var regionalization_construction = "";
    for (var i = 0; i <3; i++) {
        var vals = arr[i].get_fieldValues();
        console.log(vals);
        regionalization_construction += '<li onclick="window.location.href=\'' + vals.FileRef + '\'' + '"><span class="con_show_txt">' + vals.title0 + '</span><span class="con_show_date">' + ormatDate(vals.date) + '</span></li>';
    }
    $(".regionalization_construction").html(regionalization_construction);
}
</script>
</asp:content>
<asp:content id="Content1" contentplaceholderid="PlaceHolderMain" runat="Server">
	<!-- Head -->
	<div class="head_box">
		<div class="head_nav">
			<div class="head_nav_img" onclick="window.location.href='index.aspx'"><img src="img/b.png" alt=""></div>
		</div>
	</div>
	<!-- Content -->
	<div class="content_box">
		<!-- Icon -->
		<div class="content_icon_box">
			<div class="content_icon"><img src="img/50.png" alt=""></div>
		</div>
		<!-- Info -->
		<div class="content_info">
			<div class="con_left_box">
				<div class="swiper-container index_swiper">
					<div class="swiper-wrapper">
							
					</div>
					<!-- Add Pagination 添加分割点 -->
					<!-- <div class="swiper-pagination"></div> -->
					<!-- Add Arrows  添加左右点 -->
					<div class="swiper-button-next"></div>
					<div class="swiper-button-prev"></div>
				</div>
			</div>
			<div class="con_right_box">
				<div class="con_show_box">
					<!-- First -->
					<div class="con_info_title">
						<div class="con_info_title_img"><img src="img/51.png" alt=""></div>
					</div>
					<ul class="info_show_box pair_construction">
							
					</ul>
					<!-- Two -->
					<div class="con_info_title">
						<div class="con_info_title_img"><img src="img/52.png" alt=""></div>
					</div>
					<ul class="info_show_box postulant">
						
					</ul>
					<!-- three -->
					<div class="con_info_title">
						<div class="con_info_title_img"><img src="img/53.png" alt=""></div>
					</div>
					<ul class="info_show_box regionalization_construction">
						
					</ul>
				</div>
			</div>
		</div>
	</div>
</asp:content>
<asp:content id="Content2" contentplaceholderid="PlaceHolderPageTitle" runat="Server">
区域化党建
</asp:content>
