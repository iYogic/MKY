<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<%@ Assembly Name="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>

<asp:content id="Content0" contentplaceholderid="PlaceHolderAdditionalPageHead" runat="server">
    <link rel="stylesheet" href="css/all.css" type="text/css">
	<link rel="stylesheet" type="text/css" href="css/probity_culture.css">
    <style>
		.head_nav_indeximg{
			width: 150px;
			height: 100%;
		}
		
		.no_content{
			width: 20%;
			position: absolute;
			top: 10%;
			right: 10%;
		}
		/*css3 media开始*/
		/*1920像素,触摸屏*/
		@media screen and (min-width:200px){
			.content_indexbox{
				width: 98%;
				height: 94%;
				margin: 0 auto;
				background-image: url(img/index/bg.jpg);
				background-size: 100% 100%;
				position: relative;
			}
			.content_first{
				text-align: center;
				width: 1366px;
				margin: 0 auto;
				position: relative;
				padding-top:200px;
			}
			.content_first a{
				width: 11%;
				position: absolute;
			}
			.content_first a:nth-of-type(1){
				top:291px;
				left:79px;
			}
			.content_first a:nth-of-type(2){
				top:464px;
				left:265px;
			}
			.content_first a:nth-of-type(3){
				top:641px;
				left:419px;
			}
			.content_first a:nth-of-type(4){
				top:291px;
				left:446px;
			}
			.content_first a:nth-of-type(5){
				top:464px;
				left:608px;
			}
			.content_first a:nth-of-type(6){
				top:641px;
				left:767px;
			}
			.content_first a:nth-of-type(7){
				top:291px;
				left:789px;
			}
			.content_first a:nth-of-type(8){
				top:464px;
				left:960px;
			}
			.content_first a:nth-of-type(9){
				top:641px;
				left:1141px;
			}
		}

		/*小于1920像素*/
		@media screen and (max-width:200px){
			.content_indexbox{
				width: 98%;
				height: 93%;
				margin: 0 auto;
				background-image: url(img/index/bg.jpg);
				background-size: 100% 100%;
				position: relative;
			}
			.content_first{
				text-align: center;
				width: 60%;
				margin: 0 auto;
				position: relative;
				padding-top:20%;
			}
			.content_first a{
				width: 11%;
				position: absolute;
			}
			.content_first a:nth-of-type(1){
				top:50%;
				left:6%;
			}
			.content_first a:nth-of-type(2){
				top:64%;
				left:20%;
			}
			.content_first a:nth-of-type(3){
				top:80%;
				left:31%;
			}
			.content_first a:nth-of-type(4){
				top:50%;
				left:33%;
			}
			.content_first a:nth-of-type(5){
				top:64%;
				left:45%;
			}
			.content_first a:nth-of-type(6){
				top:80%;
				left:57%;
			}
			.content_first a:nth-of-type(7){
				top:50%;
				left:58%;
			}
			.content_first a:nth-of-type(8){
				top:65%;
				left:71%;
			}
			.content_first a:nth-of-type(9){
				top:80%;
				left:84%;
			}
		}

	</style>
    <script type="text/javascript" src="./js/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="./js/commons.js"></script>
    <script type="text/javascript" src="./js/sg-common-v0.1.js"></script>
    <script type="text/javascript">
    
    </script>
</asp:content>
<asp:content id="Content1" contentplaceholderid="PlaceHolderMain" runat="Server">
<!-- Head -->
	<div class="head_box">
		<div class="head_nav">
			<div class="head_nav_indeximg"><img src="img/b.png" alt=""></div>
		</div>
	</div>
	<!-- Content -->
	<div class="content_indexbox">
		<div class="content_first">
			<img src="img/index/E.png" alt="">
			<a href="/organization/_layouts/MLK/branch_organize.aspx"><img src="img/index/1.png" alt="组织机构"></a>
			<a href="branch_manage_one.aspx"><img src="img/index/2.png" alt="支部管理"></a>
			<a href="/culture_List/_layouts/MLK/probity_culture.aspx"><img src="img/index/3.png" alt="廉洁文化"></a>
			<a href="#"><img src="img/index/4.png" alt="情景党课"></a>
			<a href="/party_knowledge/_layouts/MLK/Party_knowledge.aspx"><img src="img/index/5.png" alt="党建知识"></a>
			<a href="#"><img src="img/index/6.png" alt="两新互动"></a>
			<a href="/branchdynamics/_layouts/MLK/branch_dynamics.aspx"><img src="img/index/7.png" alt="支部动态"></a>
			<a href="/party_building/_layouts/MLK/party_building.aspx"><img src="img/index/8.png" alt="区域化党建"></a>
			<a href="/buildinghonor/_layouts/MLK/party_building_honor.aspx"><img src="img/index/9.png" alt="党建荣誉墙"></a>
		</div>
		<div  class="no_content"><img src="img/index/D.png" alt=""></div>
	</div>
</asp:content>

<asp:content id="Content2" contentplaceholderid="PlaceHolderPageTitle" runat="Server">
玫琳凯
</asp:content>
