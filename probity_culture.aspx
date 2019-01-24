<%@ Page Language="C#" AutoEventWireup="true" CodeFile="probity_culture.aspx.cs"
    Inherits="probity_culture" %>

<%@ Assembly Name="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<asp:content id="Content0" contentplaceholderid="PlaceHolderAdditionalPageHead" runat="server">
    <link rel="stylesheet" type="text/css" href="css/all.css">
	<link rel="stylesheet" type="text/css" href="css/probity_culture.css">

    <script type="text/javascript" src="./js/jquery-1.11.3.min.js"></script>
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

        $(document).ready(function () {
            webUrl = _spPageContextInfo.webServerRelativeUrl;
            //左边规则数据
            GetItems(webUrl, "cultretreefiles", querys, "cultreprobity");
        })

        function cultreprobity(arr) {
            for (var i = 0; i < arr.length; i++) {
                var vals = arr[i].get_fieldValues();
                console.log(vals.FileRef);
                if (vals.FileRef.indexOf("业务招待") > 0) {
                    $(".first_row_box1").on("click", function () {
                        window.location.href = "/culture_List/cultretreefiles/业务招待.pdf"
                    })
                } else if (vals.FileRef.indexOf("第三方管理") > 0) {
                    $(".first_row_box2").on("click", function () {
                        window.location.href = "/culture_List/cultretreefiles/第三方管理.pdf"
                    })
                } else if (vals.FileRef.indexOf("访问招待") > 0) {
                    $(".first_row_box3").on("click", function () {
                        window.location.href = "/culture_List/cultretreefiles/访问招待.pdf"
                    })
                } else if (vals.FileRef.indexOf("商业馈赠") > 0) {
                    $(".two_row_box1").on("click", function () {
                        window.location.href = "/culture_List/cultretreefiles/商业馈赠.pdf"
                    })
                } else if (vals.FileRef.indexOf("账簿和记录") > 0) {
                    $(".two_row_box2").on("click", function () {
                        window.location.href = "/culture_List/cultretreefiles/账簿和记录.pdf"
                    })
                } else if (vals.FileRef.indexOf("慈善捐赠") > 0) {
                    $(".two_row_box3").on("click", function () {
                        window.location.href = "/culture_List/cultretreefiles/慈善捐赠.pdf"
                    })
                } else if (vals.FileRef.indexOf("会员费") > 0) {
                    $(".three_row_box1").on("click", function () {
                        window.location.href = "/culture_List/cultretreefiles/会员费.pdf"
                    })
                } else if (vals.FileRef.indexOf("活动支持") > 0) {
                    $(".three_row_box2").on("click", function () {
                        window.location.href = "/culture_List/cultretreefiles/活动支持.pdf"
                    })
                }
            }
            //获取右侧第一个库沟通数据
            GetItems(webUrl, "沟通", querys, "cultruecommuni");
        }

        function cultruecommuni(arr) {
            var con_right_communi = "";
            for (var i = 0; i < 3; i++) {
                var vals = arr[i].get_fieldValues();
                con_right_communi += '<li onclick="window.location.href=\'' + vals.FileRef + '\'' + '"><div class="con_show_img"><img src="' + vals.abbreimg.get_url() + '" alt=""></div><span class="con_show_txt">' + vals.title0 + '</span></li>';
            }
            $(".con_right_communi").html(con_right_communi);
            //获取右侧第二个库认可数据
            GetItems(webUrl, "认可", querys, "cultrueaccept");
        }
        	
        function cultrueaccept(arr) {
            var con_right_accept = "";
            for (var i = 0; i < 1; i++) {
                var vals = arr[i].get_fieldValues();
                con_right_accept += '<li onclick="window.location.href=\'' + vals.FileRef + '\'' + '"><span class="con_right_show_txt">' + vals.title0 + '</span><span class="con_right_show_date">' + ormatDate(vals.date) + '</span></li>';
            }
            $(".con_right_accept").html(con_right_accept);

            //获取右侧第三个库教育数据
            GetItems(webUrl, "教育", querys, "cultrueteach");
        }

        function cultrueteach(arr) {
            var con_right_teach = "";
            for (var i = 0; i <2; i++) {
                var vals = arr[i].get_fieldValues();
                con_right_teach += '<li onclick="window.location.href=\'' + vals.FileRef + '\'' + '"><span class="con_right_show_txt">' + vals.title0 + '</span><span class="con_right_show_date">' + ormatDate(vals.date) + '</span></li>';
            }
            $(".con_right_teach").html(con_right_teach);

            //获取右侧第四个库活动数据
            GetItems(webUrl, "活动", querys, "cultrueactive");
        }
        function cultrueactive(arr) {
            var con_right_active = "";
            for (var i = 0; i < 3; i++) {
                var vals = arr[i].get_fieldValues();
                con_right_active += '<li onclick="window.location.href=\'' + vals.FileRef + '\'' + '"><span class="con_right_show_txt">' + vals.title0 + '</span><span class="con_right_show_date">' + ormatDate(vals.date) + '</span></li>';
            }
            $(".con_right_active").html(con_right_active);

            //获取右侧第五个库激励数据
            GetItems(webUrl, "激励", querys, "cultrueexcit");
        }
        function cultrueexcit(arr) {
            var con_right_excit= "";
            for (var i = 0; i <1; i++) {
                var vals = arr[i].get_fieldValues();
                con_right_excit += '<li onclick="window.location.href=\'' + vals.FileRef + '\'' + '"><span class="con_right_show_txt">' + vals.title0 + '</span><span class="con_right_show_date">' + ormatDate(vals.date) + '</span></li>';
            }
            $(".con_right_excit").html(con_right_excit);
        }
    </script>
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
			<div class="content_icon"><img src="img/41.png" alt=""></div>
		</div>
		<!-- Info -->
		<div class="content_info">
			<div class="content_left">
				<div class="con_left_nav">
					<img src="img/20.png" alt="" class="con_left_nav_img">
					<span class="con_left_nav_txt">玫琳凯（中国）反腐败合规政策操作指南</span>
				</div>
				<div class="con_left_info">
					<div class="first_row row">
						<div class="first_row_box1"><img src="img/35.png" alt=""></div>
						<div class="first_row_box2"><img src="img/34.png" alt=""></div>
						<div class="first_row_box3"><img src="img/29.png" alt=""></div>
					</div>
					<div class="two_row row">
						<div class="two_row_box1"><img src="img/36.png" alt=""></div>
						<div class="two_row_box2"><img src="img/33.png" alt=""></div>
						<div class="two_row_box3"><img src="img/30.png" alt=""></div>
					</div>
					<div class="three_row row">
						<div class="three_row_box1"><img src="img/32.png" alt=""></div>
						<div class="three_row_box2"><img src="img/31.png" alt=""></div>
					</div>
				</div>
			</div>
			<div class="content_right">
				<div class="con_right_nav">
					<div class="con_right_nav_img"><img src="img/37.png" alt=""></div>
				</div>
				<ul class="con_right_info">
					<li>
						<div class="con_right_txt_box">
							<span class="con_right_info_txt">沟通</span>
							<div class="con_right_info_img"><img src="img/19.png" alt=""></div>
						</div>
						<ul class="con_right_showimg_box con_right_communi">
						
						</ul>
					</li>
					<li>
						<div class="con_right_txt_box">
							<span class="con_right_info_txt">认可</span>
							<div class="con_right_info_img"><img src="img/19.png" alt=""></div>
						</div>
						<ul class="con_right_show_box con_right_accept">
							
						</ul>
					</li>
					<li>
						<div class="con_right_txt_box">
							<span class="con_right_info_txt">教育</span>
							<div class="con_right_info_img"><img src="img/19.png" alt=""></div>
						</div>
						<ul class="con_right_show_box con_right_teach">
							
						</ul>
					</li>
					<li>
						<div class="con_right_txt_box">
							<span class="con_right_info_txt">活动</span>
							<div class="con_right_info_img"><img src="img/19.png" alt=""></div>
						</div>
						<ul class="con_right_show_box con_right_active">
							
						</ul>
					</li>
					<li>
						<div class="con_right_txt_box">
							<span class="con_right_info_txt">激励</span>
							<div class="con_right_info_img"><img src="img/19.png" alt=""></div>
						</div>
						<ul class="con_right_show_box con_right_excit">
							
						</ul>
					</li>
				</ul>
			</div>
		</div>
	</div>

</asp:content>
<asp:content id="Content2" contentplaceholderid="PlaceHolderPageTitle" runat="Server">
廉洁文化
</asp:content>
