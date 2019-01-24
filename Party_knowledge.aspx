<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Party_knowledge.aspx.cs" Inherits="Party_knowledge" %>

<%@ Assembly Name="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>

<asp:content id="Content0" contentplaceholderid="PlaceHolderAdditionalPageHead" runat="server">
<link rel="stylesheet" type="text/css" href="css/all.css">
<link rel="stylesheet" type="text/css" href="css/Party_knowledge.css">
<script type="text/javascript" src="./js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="./js/commons.js"></script>
<script type="text/javascript" src="./js/sg-common-v0.1.js"></script>
    <script type="text/javascript">
        var webUrl = "";
        var querys = " ";
        querys = "<View Scope=\'RecursiveAll\'>" +
                "<Query>" +
                "<OrderBy><FieldRef Name=\'ID\' Ascending =\'False\'/></OrderBy>" +
                "</Query>" +
                "</View>";

        $(document).ready(function () {
            webUrl = _spPageContextInfo.webServerRelativeUrl;
            //如何入党数据
            GetItems(webUrl, "如何入党", querys, "joinparty");


            $(".content_info span").on("click", function () {
                $(this).addClass("current").siblings("span").removeClass("current");
                if ($(this).hasClass("rudang")) {
                    $(".textarea_box_rudang").show().siblings(".textarea_boxdiv").hide();
                } else if ($(this).hasClass("dangzhang")) {
                    $(".textarea_box_dangzhang").show().siblings(".textarea_boxdiv").hide();
                } else if ($(this).hasClass("xuexi")) {
                    $(".textarea_box_xuexi").show().siblings(".textarea_boxdiv").hide();
                }
            })

            $(".more_min_box").on("click", function () {
                window.location.href = $(".current").attr("locationhref");
            })
        })
         function joinparty(arr) {
             var joinparty = "";
             var joinpartyurl = "";
             for (var i = 0; i < arr.length; i++) {
                var vals = arr[i].get_fieldValues();
                joinparty = vals.WikiField;
                joinpartyurl = vals.FileRef;
                //console.log(vals);
                //console.log(joinparty);
            }
            var indexa = joinparty.indexOf('<td style=\"width:100%\">');
            var indexb = joinparty.lastIndexOf("</td>");
            //console.log(indexa);
            //console.log(indexb);
            joinparty = joinparty.substring(indexa + 23, indexb - 1)
            $(".textarea_box_rudang").html(joinparty);
            $(".rudang").attr("locationhref", joinpartyurl);
            //党章2017数据
            GetItems(webUrl, "党章2017", querys, "partyconstitution");
        }

        function partyconstitution(arr) {
            var partyconstitution = "";
            var partyconstitutionurl = "";
            for (var i = 0; i < arr.length; i++) {
                var vals = arr[i].get_fieldValues();
                partyconstitution = vals.WikiField;
                partyconstitutionurl = vals.FileRef;
                //console.log(vals);
                //console.log(joinparty);
            }
            var indexa = partyconstitution.indexOf('<td style=\"width:100%\">');
            var indexb = partyconstitution.lastIndexOf("</td>");
            //console.log(('<td style=\"width:100%\">').length);
            //console.log(indexb);
            partyconstitution = partyconstitution.substring(indexa+23, indexb-1)
            $(".textarea_box_dangzhang").html(partyconstitution);
            $(".dangzhang").attr("locationhref", partyconstitutionurl);

            //支部学习制度
            GetItems(webUrl, "支部学习制度", querys, "branchstudy");
        }

        function branchstudy(arr) {
            var branchstudy = "";
            var branchstudyurl = "";
            for (var i = 0; i < arr.length; i++) {
                var vals = arr[i].get_fieldValues();
                branchstudy = vals.WikiField;
                branchstudyurl = vals.FileRef;
                //console.log(vals);
                //console.log(joinparty);
            }
            var indexa = branchstudy.indexOf('<td style=\"width:100%\">');
            var indexb = branchstudy.lastIndexOf("</td>");
            //console.log(indexa);
            //console.log(indexb);
            branchstudy = branchstudy.substring(indexa + 23, indexb - 1)
            $(".textarea_box_xuexi").html(branchstudy);
            $(".xuexi").attr("locationhref", branchstudyurl);
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
			<div class="content_icon"><img src="img/44.png" alt=""></div>
		</div>
		<!-- Info -->
		<div class="content_info">
			<span class="current rudang" locationhref=""><img src="img/47.png" alt=""></span>
			<span class="dangzhang" locationhref=""><img src="img/46.png" alt=""></span>
			<span class="del_side xuexi" locationhref=""><img src="img/45.png" alt=""></span>
		</div>
		<div class="textarea_box">
			<div class="textarea_boxdiv textarea_box_rudang">

            </div>
            <div class="textarea_boxdiv textarea_box_dangzhang">

            </div>
            <div class="textarea_boxdiv textarea_box_xuexi">

            </div>
		 </div>
		<!-- More -->
		<div class="more_box">
			<div class="more_min_box"><img src="img/43.png" alt=""></div>
		</div>
	 </div>
</asp:content>
<asp:content id="Content2" contentplaceholderid="PlaceHolderPageTitle" runat="Server">
党建知识
</asp:content>
