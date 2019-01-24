<%@ Page Language="C#" AutoEventWireup="true" CodeFile="branch_manage_one.aspx.cs" Inherits="branch_manage_one" %>

<%@ Assembly Name="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>


<asp:content id="Content0" contentplaceholderid="PlaceHolderAdditionalPageHead" runat="server">
<link rel="stylesheet" type="text/css" href="css/all.css">
<link rel="stylesheet" type="text/css" href="css/branch_manage_one.css">

<script type="text/javascript" src="./js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="./js/commons.js"></script>
<script type="text/javascript" src="./js/sg-common-v0.1.js"></script>
</asp:content>

<asp:content id="Content1" contentplaceholderid="PlaceHolderMain" runat="Server">
	<!-- Head -->
	<div class="head_box">
		<div class="head_nav">
			<div class="head_nav_img" onclick="window.location.href='index.aspx'">
				<img src="img/b.png" alt="">
			</div>
		</div>
	</div>
	<!-- Content -->
	<div class="content_box">
		<!-- Icon -->
		<div class="content_icon_box">
			<div class="content_icon"><img src="img/18.png" alt=""></div>
		</div>
		<!-- Info -->
		<div class="content_info">
			<div class="content_min_info info_side">
				<div class="con_txt_box">
					<span class="con_info_txt">上海支部</span>
					<img src="img/19.png" alt="" class="con_info_img">
				</div>
				<ul class="con_show_info">
                	<li onclick="window.location.href='/shGeneralBranch/_layouts/MLK/branch_manage_two.aspx?local=shangfour'">
						<img src="img/13.png" alt="">
					</li>
					<li onclick="window.location.href='/shOneBranch/_layouts/MLK/branch_manage_two.aspx?local=shangfirst'">
						<img src="img/10.png" alt="">
					</li>
					<li onclick="window.location.href='/shTwoBranch/_layouts/MLK/branch_manage_two.aspx?local=shangsed'">
						<img src="img/11.png" alt="">
					</li>
					<li onclick="window.location.href='/shThreeBranch/_layouts/MLK/branch_manage_two.aspx?local=shangthree'">
						<img src="img/12.png" alt="">
					</li>
				</ul>
			</div>
			<div class="content_min_info">
				<div class="con_txt_box">
					<span class="con_info_txt">杭州支部</span>
					<img src="img/19.png" alt="" class="con_info_img">
				</div>
				<ul class="con_show_info">
                    <li onclick="window.location.href='/hzGeneralBranch/_layouts/MLK/branch_manage_two.aspx?local=zhoufour'">
						<img src="img/17.png" alt="">
					</li>
					<li onclick="window.location.href='/hzOneBranch/_layouts/MLK/branch_manage_two.aspx?local=zhoufirst'">
						<img src="img/14.png" alt="">
					</li>
					<li onclick="window.location.href='/hzTwoBranch/_layouts/MLK/branch_manage_two.aspx?local=zhoused'">
						<img src="img/15.png" alt="">
					</li>
					<li onclick="window.location.href='/hzThreeBranch/_layouts/MLK/branch_manage_two.aspx?local=zhouthree'">
						<img src="img/16.png" alt="">
					</li>
				</ul>
			</div>
		</div>
	</div>
</asp:content>

<asp:content id="Content2" contentplaceholderid="PlaceHolderPageTitle" runat="Server">
支部管理
</asp:content>
