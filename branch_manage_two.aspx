<%@ Page Language="C#" AutoEventWireup="true" CodeFile="branch_manage_two.aspx.cs" Inherits="branch_manage_two" %>

<%@ Assembly Name="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>

<asp:content id="Content0" contentplaceholderid="PlaceHolderAdditionalPageHead" runat="server">
    <link rel="stylesheet" type="text/css" href="css/all.css" />
	<link rel="stylesheet" type="text/css" href="css/branch_manage_two.css" />

    <script type="text/javascript" src="./js/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="./js/commons.js"></script>
    <script type="text/javascript" src="./js/sg-common-v0.1.js"></script>

    <script type="text/javascript">
        var webUrl = "";
        var querys = "";
        querys = "<View Scope=\'RecursiveAll\'>" +
                "<Query>" +
                "<OrderBy><FieldRef Name=\'date\' Ascending =\'False\'/></OrderBy>" +
                "</Query>" +
                "</View>";
        $(document).ready(function () {
            webUrl = _spPageContextInfo.webServerRelativeUrl;
            //组织生活数据
            GetItems(webUrl, "组织生活", querys, "loadDatalife");
            

            $(".switch_right span").on("click", function () {
                $(this).addClass("switch_sign").siblings("span").removeClass("switch_sign");
                if ($(this).html() == "组织生活") {
                    $(".content_info_zuzi").show().siblings("div").hide();
                } else if ($(this).html() == "党员感言") {
                    $(".content_info_ganyan").show().siblings("div").hide();
                } else if ($(this).html() == "支部活动") {
                    $(".content_info_zhibu").show().siblings("div").hide();
                }
            });

            var tlocal = GetQueryStringParameter("local");
            if (tlocal == "shangfirst") {
                $(".switch_txt").html("上海一支部")
            } else if (tlocal == "shangsed") {
                $(".switch_txt").html("上海二支部")
            } else if (tlocal == "shangthree") {
                $(".switch_txt").html("上海三支部")
            } else if (tlocal == "shangfour") {
                $(".switch_txt").html("上海党总支")
            } else if (tlocal == "zhoufirst") {
                $(".switch_txt").html("杭州一支部")
            } else if (tlocal == "zhoused") {
                $(".switch_txt").html("杭州二支部")
            } else if (tlocal == "zhouthree") {
                $(".switch_txt").html("杭州三总支")
            } else if (tlocal == "zhoufour") {
                $(".switch_txt").html("杭州党总支")
            }
        })

        function loadDatalife(arr) {
            con_show_box("content_info_zuzi",arr);
            //党员感言数据
            GetItems(webUrl, "党员感言", querys, "loadDataword");
        }
        function loadDataword(arr) {
            con_show_box("content_info_ganyan", arr);
            //支部活动数据
            GetItems(webUrl, "支部活动", querys, "loadDatahuo");
        }
        function loadDatahuo(arr) {
            con_show_box("content_info_zhibu", arr); 
        }
        //展示
        function con_show_box(content, arr) {
            for (var i = 0; i < arr.length; i++) {
                var vals = arr[i].get_fieldValues();
                console.log(vals);
                //console.log(vals.FileRef); 
            }

            var cont_line_one = "";
            var cont_line_two = "";
            for (var i = 0; i < 4; i++) {
                var vals = arr[i].get_fieldValues();
                cont_line_one += '<li onclick="window.location.href=\'' + vals.FileRef + '\''+'"><div class="con_show_img"><img src="' + vals.abbreimg.get_url() + '" alt=""></div><span class="con_show_txt">' + vals.title0 + '</span></li>';
            }
            for (var i = 4; i < 8; i++) {
                var vals = arr[i].get_fieldValues();
                cont_line_two += '<li onclick="window.location.href=\"' + vals.FileRef + '\"' + '"><div class="con_show_img"><img src="' + vals.abbreimg.get_url() + '" alt=""></div><span class="con_show_txt">' + vals.title0 + '</span></li>';
            }
            $("." + content + " " + ".con_show_info:first").html(cont_line_one);
            $("." + content + " " + ".con_show_info:last").html(cont_line_two);
        }

    </script>
</asp:content>

<asp:content id="Content1" contentplaceholderid="PlaceHolderMain" runat="Server">
    <!-- Head -->
	<div class="head_box">
		<div class="head_nav">
			<div class="head_nav_img"><img src="img/b.png" alt="" onclick="window.location.href='index.aspx'"></div>
		</div>
	</div>
	<!-- Content -->
	<div class="content_box">
		<!-- Icon -->
		<div class="content_icon_box">
			<div class="content_icon"><img src="img/18.png" alt="" ></div>
		</div>
		<!-- Switch -->
		<div class="switch_box">
			<div class="switch_left">
				<img src="img/20.png" alt="" class="switch_img">
				<div class="switch_txt">上海一支部</div>
			</div>
			<div class="switch_right">
				<span class="switch_sign">组织生活</span>
				<span>党员感言</span>
				<span>支部活动</span>
			</div>
		</div>
		<!-- Info -->
        <div class="content_info">
            <div class="content_info_zuzi">
                <div class="content_min_info">
                    <ul class="con_show_info con_show_info_first">
                        
                    </ul>
                </div>
                <div class="content_min_info">
                    <ul class="con_show_info con_show_info_last">
                        
                    </ul>
                </div>
            </div>
            <div class="content_info_ganyan">
                <div class="content_min_info">
                    <ul class="con_show_info con_show_info_first">
                        
                    </ul>
                </div>
                <div class="content_min_info">
                    <ul class="con_show_info con_show_info_last">
                        
                    </ul>
                </div>
            </div>
            <div class="content_info_zhibu">
                <div class="content_min_info">
                    <ul class="con_show_info con_show_info_first">
                       
                    </ul>
                </div>
                <div class="content_min_info">
                    <ul class="con_show_info con_show_info_last">
                      
                    </ul>
                </div>
            </div>
        </div>
	</div>
</asp:content>

<asp:content id="Content2" contentplaceholderid="PlaceHolderPageTitle" runat="Server">
支部管理
</asp:content>
