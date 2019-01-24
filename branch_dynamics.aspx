<%@ Page Language="C#" AutoEventWireup="true" CodeFile="branch_dynamics.aspx.cs"
    Inherits="branch_dynamics" %>

<%@ Assembly Name="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>

<asp:content id="Content0" contentplaceholderid="PlaceHolderAdditionalPageHead" runat="server">
    <link rel="stylesheet" type="text/css" href="css/swiper-3.4.2.min.css">
    <link rel="stylesheet" type="text/css" href="css/all.css">
    <link rel="stylesheet" type="text/css" href="css/branch_dynamics.css">
    <script type="text/javascript" src="js/swiper-3.4.2.min.js"></script>
    <script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
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
            GetItems(webUrl, "支部动态信息", querys, "branchdynamics");
        })

        function branchdynamics(arr){
            var datas = [];
            var datasobj = {};
            for (var i = 0; i <arr.length; i++) {
                var vals = arr[i].get_fieldValues();
                //console.log(vals);
                //页面地址
                var FileRef = vals.FileRef;
                datasobj.FileRef = FileRef;
                //缩略图地址
                var abbreurl = vals.abbreimg.get_url();
                datasobj.abbreurl = abbreurl;
                //标题
                var title = vals.title0;
                datasobj.title = title;
                //简介
                var synopsis = vals.synopsis;
                datasobj.synopsis = synopsis;
                //日期
                var datep = ormatDate(vals.date);
                datasobj.date = datep;
                datas.push(datasobj)
                datasobj = {};
            }
            //得到总的数据数组，下一步绑定数据渲染

             //轮播渲染绑数据 
            var swiperhtml="";         
            for(var i=0;i<5;i++){
                swiperhtml+='<div class="swiper-slide"><a href="'+datas[i].FileRef+'"><img src="'+ datas[i].abbreurl+'"></a></div>' 
            }
            $(".swiper-wrapper").html(swiperhtml);
            //轮播帮完数据，构建轮播器

            var swiper=new Swiper('.index_swiper', {
		        pagination: '.swiper-pagination',
		        nextButton: '.swiper-button-next',
		        prevButton: '.swiper-button-prev',

		        paginationClickable: true,

		        loop: true,
		        autoplay:2000,
		        autoplayDisableOnInteraction: false,
	        });
	        // Show or Hide
	        $(".index_swiper").hover(function () {
		        $(".swiper-button-prev,.swiper-button-next").stop().fadeIn()
	        },function () {
		        $(".swiper-button-prev,.swiper-button-next").stop().fadeOut()
	        })
        
            //渲染绑定顶部最新一条数据
            $(".top_left_dytitle").html(datas[0].title);
            $(".top_left_dydate").html(datas[0].date.substring(5));
            $(".top_left_dycont").html(datas[0].synopsis);
            $(".top_left_dytitle,.top_left_dydate,.top_left_dycont").on("click",function(){
                window.location.href=datas[0].FileRef;
            })

            //下部数据左
            var bottom_left_html="";         
            for(var i=5;i<13;i++){  
                bottom_left_html +='<li onclick="window.location.href=\''+datas[i].FileRef+'\'"><span class="con_show_txt">'+datas[i].title+'</span><span class="con_show_date">'+datas[i].date.substring(5)+'</span></li>'
            }
            $(".bottom_left_html").html(bottom_left_html);

             //下部数据右
            var bottom_right_html="";         
            for(var i=13;i<21;i++){  
                bottom_right_html+='<li onclick="window.location.href=\''+datas[i].FileRef+'\'"><span class="con_show_txt">'+datas[i].title+'</span><span class="con_show_date">'+datas[i].date.substring(5)+'</span></li>'
            }
            $(".bottom_right_html").html(bottom_right_html);
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
            <div class="content_icon">
                <img src="img/49.png" alt=""></div>
        </div>
        <!-- Info -->
        <div class="content_info">
            <!-- 顶部左边轮播 -->
            <div class="con_info_img_box">
                <div class="swiper-container index_swiper">
                    <div class="swiper-wrapper">
                        
                    </div>
                    <!-- Add Pagination 添加分割点 -->
                    <div class="swiper-pagination">
                    </div>
                    <!-- Add Arrows  添加左右点 -->
                    <div class="swiper-button-next">
                    </div>
                    <div class="swiper-button-prev">
                    </div>
                </div>
            </div>
             <!-- 顶部右边最新一条 -->
            <div class="con_info_txt_box">
                <div class="con_info_title">
                    <span class="con_info_title_txt top_left_dytitle"></span> 
                    <span class="con_info_title_date top_left_dydate"></span>
                </div>
                <div class="con_info_show top_left_dycont">

                </div>
            </div>
        </div>
        <div class="line">
        </div>
        <!--下部列表开始-->
        <div class="content_show_sum">
            <div class="content_show">
                <div class="con_show_left">
                    <ul class="con_show_box bottom_left_html">
                        
                    </ul>
                </div>
                <div class="con_show_right">
                    <ul class="con_show_box con_show_right_box bottom_right_html">
                        
                    </ul>
                </div>
            </div>
            <div class="load_more_box">
               <a href="branch_dynamics_lists.aspx"><span>【更多新闻】</span></a>
            </div>
        </div>
       <!--下部列表结束-->

    </div>
</asp:content>
<asp:content id="Content2" contentplaceholderid="PlaceHolderPageTitle" runat="Server">
支部动态
</asp:content>
