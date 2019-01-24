<%@ Page Language="C#" AutoEventWireup="true" CodeFile="branch_organize.aspx.cs"
    Inherits="branch_organize" %>

<%@ Assembly Name="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<asp:content id="Content0" contentplaceholderid="PlaceHolderAdditionalPageHead" runat="server">
    <link rel="stylesheet" type="text/css" href="css/all.css">
    <link rel="stylesheet" type="text/css" href="css/branch_organize.css">
    <link rel="stylesheet" type="text/css" href="js/swiper/swiper.min.css">
    <script type="text/javascript" src="./js/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="./js/vue.min.js"></script>
    <script type="text/javascript" src="./js/swiper/swiper.min.js"></script>
    <script type="text/javascript" src="./js/commons.js"></script>
    <script type="text/javascript" src="./js/sg-common-v0.1.js"></script>
    <script type="text/javascript">
        var webUrl = "";
        var querys = " ";
        querys = "<View Scope=\'RecursiveAll\'>" +
                "<Query>" +
                "<OrderBy><FieldRef Name=\'ordernumber\' Ascending =\'True\'/></OrderBy>" +
                "</Query>" +
                "</View>";

        $(document).ready(function(){
            webUrl = _spPageContextInfo.webServerRelativeUrl;
            //上海党总支信息数据
            GetItems(webUrl, "上海党总支信息", querys, "shpartysumf");
     
            




        $(".float_father").find("img").on("click",function(){
            //操作的是不是自己
            if($(this).parents(".float_father").hasClass("self")){
                if($(".float_detail").is(":hidden")){
                    box_same_show(this);
                }else{
                    var float_detail_html=$(this).parents(".float_father").find(".float_detail");
                    $(".content_box").append(float_detail_html);
                    $(this).parents(".float_father").find(".float_detail").remove();
                    $(this).parents(".float_father").css("position","none");
                    $(".float_detail").hide();
                }
            }else{
                //第一种情况，同类的已经存在，自己第一次
                if($(".float_father").find(".float_detail").length>=1){
                    var float_detail_html=$(".float_detail").parents(".float_father").find(".float_detail");
                    $(".content_box").append(float_detail_html);

                    //清除同类的
                    //$(".float_detail").parents(".float_father").removeClass("self");
                    $(".self").removeClass("self");
                    $(".float_detail").parents(".float_father").find(".float_detail").remove();
                    //自己添加
                    $(this).parents(".float_father").addClass("self");
                    box_same_show(this);
                //第二种情况，全局第一次，以自己为起点
                }else{
                    $(this).parents(".float_father").addClass("self");
                    box_same_show(this);
                }
            }   
            function box_same_show(obj){
                //判断左右大小
                var float_detail_left=$(obj).offset().left;
                var float_detail_right=$(window).width()-float_detail_left;
                if(float_detail_right>700){
                    $(obj).parents(".float_father").append($(".float_detail"));
                    $(".float_detail").show();
                    $(obj).parents(".float_father").css("position","relative");
                    $(".float_detail").css({"position":"absolute","top":"-20px","left":"126px","right":"auto"});
                }else{
                    $(obj).parents(".float_father").append($(".float_detail"));
                    $(".float_detail").show();
                    $(obj).parents(".float_father").css("position","relative");
                    $(".float_detail").css({"position":"absolute","top":"-20px","right":"126px","left":"auto"});
                }
            }
        })//onclick结束

    }) //ready结束   
    

    //定义四个数组，初始化两个模块四个小模块数据
    var shpartysum = [];
    var shpartysumobj = {};
    var shpartygeneral = [];
    var shpartygeneralobj = {};
    var hzpartysum = [];
    var hzpartysumobj = {};
    var hzpartygeneral = [];
    var hzpartygeneralobj = {};

   //上海党总支
   function shpartysumf (arr) {
        for (var i = 0; i < arr.length; i++) {
            var vals = arr[i].get_fieldValues();
            //console.log(vals);

             //头像
            var FileRef = $.trim(vals.FileRef);
            shpartysumobj.FileRef = FileRef;
            //姓名
            var name = $.trim(vals.name);
            shpartysumobj.name = name;
            //所在支部
            var locatedbranch = $.trim(vals.locatedbranch);
            shpartysumobj.locatedbranch = locatedbranch;
            //公司职务
            var companyposition = $.trim(vals.companyposition);
            shpartysumobj.companyposition = companyposition;
            //支部职务
            var branchposition = $.trim(vals.branchposition);
            shpartysumobj.branchposition = branchposition;
            //兴趣爱好
            var hobby = $.trim(vals.hobby);
            shpartysumobj.hobby = hobby;
            //特长
            var specialty = $.trim(vals.specialty);
            shpartysumobj.specialty = specialty;
            //入党时间
            var joinTime = ormatDate(vals.joinTime);
            shpartysumobj.joinTime = joinTime;

            shpartysum.push(shpartysumobj)
            shpartysumobj = {};
        }
        //获取上海党员数据
        GetItems(webUrl, "上海党总支党员", querys, "shpartygeneralf");
   }
   console.log(shpartysum);
    //上海一般党员
   function shpartygeneralf(arr){
        for (var i = 0; i < arr.length; i++) {
            var vals = arr[i].get_fieldValues();
            //console.log(vals);

            //头像
            var FileRef = $.trim(vals.FileRef);
            shpartygeneralobj.FileRef = FileRef;
            //姓名
            var name = $.trim(vals.name);
            shpartygeneralobj.name = name;
            //所在支部
            var locatedbranch = $.trim(vals.locatedbranch);
            shpartygeneralobj.locatedbranch = locatedbranch;
            //公司职务
            var companyposition = $.trim(vals.companyposition);
            shpartygeneralobj.companyposition = companyposition;
            //支部职务
            var branchposition = $.trim(vals.branchposition);
            shpartygeneralobj.branchposition = branchposition;
            //兴趣爱好
            var hobby = $.trim(vals.hobby);
            shpartygeneralobj.hobby = hobby;
            //特长
            var specialty = $.trim(vals.specialty);
            shpartygeneralobj.specialty = specialty;
            //入党时间
            var joinTime = ormatDate(vals.joinTime);
            shpartygeneralobj.joinTime = joinTime;

            shpartygeneral.push(shpartygeneralobj)
            shpartygeneralobj = {};
        }
        //获取杭州党总支信息数据
        GetItems(webUrl, "杭州党总支信息", querys, "hzpartysumf");
   } 
    console.log(shpartygeneral);

   //杭州党总支信息
   function hzpartysumf(arr){
        for (var i = 0; i < arr.length; i++) {
            var vals = arr[i].get_fieldValues();
            //console.log(vals);

            //头像
            var FileRef = $.trim(vals.FileRef);
            hzpartysumobj.FileRef = FileRef;
            //姓名
            var name = $.trim(vals.name);
            hzpartysumobj.name = name;
            //所在支部
            var locatedbranch = $.trim(vals.locatedbranch);
            hzpartysumobj.locatedbranch = locatedbranch;
            //公司职务
            var companyposition = $.trim(vals.companyposition);
            hzpartysumobj.companyposition = companyposition;
            //支部职务
            var branchposition = $.trim(vals.branchposition);
            hzpartysumobj.branchposition = branchposition;
            //兴趣爱好
            var hobby = $.trim(vals.hobby);
            hzpartysumobj.hobby = hobby;
            //特长
            var specialty = $.trim(vals.specialty);
            hzpartysumobj.specialty = specialty;
            //入党时间
            var joinTime = ormatDate(vals.joinTime);
            hzpartysumobj.joinTime = joinTime;

            hzpartysum.push(hzpartysumobj)
            hzpartysumobj = {};
        }
        //获取杭州党员数据
        GetItems(webUrl, "杭州党总支党员", querys, "hzpartygeneralf");
   } 
    console.log(hzpartysum);

   //杭州一般党员信息
    function hzpartygeneralf(arr){
        for (var i = 0; i < arr.length; i++) {
            var vals = arr[i].get_fieldValues();
            //console.log(vals);

            //头像
            var FileRef = $.trim(vals.FileRef);
            hzpartygeneralobj.FileRef = FileRef;
            //姓名
            var name = $.trim(vals.name);
            hzpartygeneralobj.name = name;
            //所在支部
            var locatedbranch = $.trim(vals.locatedbranch);
            hzpartygeneralobj.locatedbranch = locatedbranch;
            //公司职务
            var companyposition = $.trim(vals.companyposition);
            hzpartygeneralobj.companyposition = companyposition;
            //支部职务
            var branchposition = $.trim(vals.branchposition);
            hzpartygeneralobj.branchposition = branchposition;
            //兴趣爱好
            var hobby = $.trim(vals.hobby);
            hzpartygeneralobj.hobby = hobby;
            //特长
            var specialty = $.trim(vals.specialty);
            hzpartygeneralobj.specialty = specialty;
            //入党时间
            var joinTime = ormatDate(vals.joinTime);
            hzpartygeneralobj.joinTime = joinTime;

            hzpartygeneral.push(hzpartygeneralobj)
            hzpartygeneralobj = {};
        }

      //两个模块数据全部读取完毕，得到四个数组，
     //开始构建vue,渲染数据
     new Vue({
            el: '#vuedataparty',
            data: {
                shpartysumv: shpartysum,
                shpartygeneralv: shpartygeneral,
                hzpartysumv: hzpartysum,
                hzpartygeneralv: hzpartygeneral
            },
            methods: {
//                firstlocationhref: function (thedex) {
//                    window.location.href = datafirst[thedex].FileRef;
//                },
//                secondlocationhref: function (thedex) {
//                    window.location.href = datasecond[thedex].FileRef;
//                }
            }
        }) //vue结束

        //上海
        var mySwiper = new Swiper ('.swiper-container-sh', {
            autoplay: true,
            speed:100,
            slidesPerView:6,
            spaceBetween:0,
            //loop: true,
            loopFillGroupWithBlank: true,
            observer:true,//修改swiper自己或子元素时，自动初始化swiper
            observeParents:true,//修改swiper的父元素时，自动初始化swiper
            navigation: {
                nextEl: '.swiper-button-next-sh',
                prevEl: '.swiper-button-prev-sh',
            },
            breakpoints: {
                2100: {
                    slidesPerView: 8,
                },
                1900: {
                    slidesPerView: 8,
                },
                1366: {
                    slidesPerView:6,
                }
            }
        })

         $(".tip").on("click",function(){
            $(this).addClass("current_color").siblings(".tip").removeClass("current_color");
            if($(this).html().indexOf("上海党总支")>0){
                $(".sh").show().siblings(".content_organize_box").hide();
                $(".change_img_sh").show();
                $(".change_img_hz").hide();
            }else if($(this).html().indexOf("杭州党总支")>0){
                $(".hz").show().siblings(".content_organize_box").hide();
                $(".change_img_sh").hide();
                $(".change_img_hz").show();
                //杭州必须放这个位置，一个页面两个轮播，第二个隐藏，没有宽度，轮播加载就有问题，放在这个位置，显示了区域，有了宽度，加载就没问题了
                var mySwiper = new Swiper ('.swiper-container-hz', {
                    autoplay: true,
                    speed:100,
                    slidesPerView:6,
                    spaceBetween:0,
                    //loop: true,
                    loopFillGroupWithBlank: true,
                    //observer:true, //修改swiper自己或子元素时，自动初始化swiper
                    //observeParents:true,//修改swiper的父元素时，自动初始化swiper
                    navigation: {
                        nextEl: '.swiper-button-next-hz',
                        prevEl: '.swiper-button-prev-hz',
                    },
                    breakpoints: {
                        2100: {
                            slidesPerView: 8,
                        },
                        1900: {
                            slidesPerView: 8,
                        },
                        1366: {
                            slidesPerView: 6,
                        }
                    }
                })
            }
        })


     } //最后一个求取数据的函数结束
     console.log(hzpartygeneral);
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
    <div class="content_box" id="vuedataparty">
        <!-- Icon -->
        <div class="content_icon_box">
            <div class="content_icon">
                <img src="img/organize/66.png" alt=""></div>
            <div class="content_menu">
                <div class="content_menu_text">
                    <div class="tip current_color">
                        上海党总支</div>
                    <div class="tip">
                        杭州党总支</div>
                </div>
            </div>
        </div>
        <!-- 中间架构部分 -->
        <div class="content_organize">
            <div class="cont content_organize_box sh" >
                <div class="content_organize_one">
                    <ul class="content_organize_oneul">
                        <li class="line1">
                            <img src="img/organize/73.png" class="line1_img">
                            <span class="mlk_personal float_father">
                                <img v-bind:src="shpartysumv[0].FileRef" class="img_people">
                                <div class="mlk_name">
                                    {{shpartysumv[0].name}}
                                </div>
                                <div class="mlk_name_ziwei">
                                    {{shpartysumv[0].branchposition}}
                                </div>
                                <div class="hidediv">
                                    <div class="locatedbranch">{{shpartysumv[0].locatedbranch}}</div>
                                    <div class="companyposition">{{shpartysumv[0].companyposition}}</div>
                                    <div class="joinTime">{{shpartysumv[0].joinTime}}</div>
                                    <div class="hobby">{{shpartysumv[0].hobby}}</div>
                                    <div class="specialty">{{shpartysumv[0].specialty}}</div>
                                </div>
                            </span>
                            <img src="img/organize/74.png" class="line1_img">
                        </li>
                    </ul>
                </div>
                <div class="content_organize_two">
                    <ul class="content_organize_twoul">
                        <li class="line2" v-for="i in 4">
                            <img src="img/organize/71.png" class="line2_img">
                            <span class="mlk_personal float_father">
                                <img v-bind:src="shpartysumv[i].FileRef" class="img_people_2">
                                <div class="mlk_name">
                                    {{shpartysumv[i].name}}
                                </div>
                                <div class="mlk_name_ziwei">
                                   {{shpartysumv[i].branchposition}}
                                </div>
                                <div class="hidediv">
                                    <div class="locatedbranch">{{shpartysum[i].locatedbranch}}</div>
                                    <div class="companyposition">{{shpartysum[i].companyposition}}</div>
                                    <div class="joinTime">{{shpartysum[i].joinTime}}</div>
                                    <div class="hobby">{{shpartysum[i].hobby}}</div>
                                    <div class="specialty">{{shpartysum[i].specialty}}</div>
                                </div>
                            </span>
                            <img src="img/organize/72.png" class="line2_img">
                        </li>
                    </ul>
                </div>
                <div class="content_organize_three">
                    <ul class="content_organize_threeul">
                        <li class="img_people_3" v-for="m in 8">
                            <span class="mlk_personal float_father">
                                <img v-bind:src="shpartysumv[m+4].FileRef">
                                <div class="mlk_name">
                                    {{shpartysumv[m+4].name}}
                                </div>
                                <div class="mlk_name_ziwei">
                                    {{shpartysumv[m+4].branchposition}}
                                </div>
                                 <div class="hidediv">
                                    <div class="locatedbranch">{{shpartysum[m+4].locatedbranch}}</div>
                                    <div class="companyposition">{{shpartysum[m+4].companyposition}}</div>
                                    <div class="joinTime">{{shpartysum[m+4].joinTime}}</div>
                                    <div class="hobby">{{shpartysum[m+4].hobby}}</div>
                                    <div class="specialty">{{shpartysum[m+4].specialty}}</div>
                                </div>
                            </span>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="cont content_organize_box hz" id="hz_sumparty">
                <div class="content_organize_one">
                    <ul class="content_organize_oneul">
                        <li class="line1">
                            <img src="img/organize/73.png" class="line1_img">
                            <span class="mlk_personal float_father">
                                <img v-bind:src="hzpartysum[0].FileRef" class="img_people">
                                <div class="mlk_name">
                                    {{hzpartysum[0].name}}
                                </div>
                                <div class="mlk_name_ziwei">
                                    {{hzpartysum[0].branchposition}}
                                </div>
                                <div class="hidediv">
                                    <div class="locatedbranch">{{hzpartysum[0].locatedbranch}}</div>
                                    <div class="companyposition">{{hzpartysum[0].companyposition}}</div>
                                    <div class="joinTime">{{hzpartysum[0].joinTime}}</div>
                                    <div class="hobby">{{hzpartysum[0].hobby}}</div>
                                    <div class="specialty">{{hzpartysum[0].specialty}}</div>
                                </div>
                            </span>
                            <img src="img/organize/74.png" class="line1_img">
                        </li>
                    </ul>
                </div>
                <div class="content_organize_two">
                    <ul class="content_organize_twoul">
                        <li class="line2" v-for="n in 4">
                            <img src="img/organize/71.png" class="line2_img">
                            <span class="mlk_personal float_father">
                                <img v-bind:src="hzpartysum[n].FileRef" class="img_people_2">
                                <div class="mlk_name">
                                    {{hzpartysum[n].name}}
                                </div>
                                <div class="mlk_name_ziwei">
                                   {{hzpartysum[n].branchposition}}
                                </div>
                                <div class="hidediv">
                                    <div class="locatedbranch">{{hzpartysum[n].locatedbranch}}</div>
                                    <div class="companyposition">{{hzpartysum[n].companyposition}}</div>
                                    <div class="joinTime">{{hzpartysum[n].joinTime}}</div>
                                    <div class="hobby">{{hzpartysum[n].hobby}}</div>
                                    <div class="specialty">{{hzpartysum[n].specialty}}</div>
                                </div>
                            </span>
                            <img src="img/organize/72.png" class="line2_img">
                        </li>
                    </ul>
                </div>
                <div class="content_organize_three">
                    <ul class="content_organize_threeul">
                        <li class="img_people_3" v-for="t in 8">
                            <span class="mlk_personal float_father">
                                <img v-bind:src="shpartysumv[t+4].FileRef">
                                <div class="mlk_name">
                                    {{hzpartysum[t+4].name}}
                                </div>
                                <div class="mlk_name_ziwei">
                                    {{hzpartysum[t+4].branchposition}}
                                </div>
                                 <div class="hidediv">
                                    <div class="locatedbranch">{{hzpartysum[t+4].locatedbranch}}</div>
                                    <div class="companyposition">{{hzpartysum[t+4].companyposition}}</div>
                                    <div class="joinTime">{{hzpartysum[t+4].joinTime}}</div>
                                    <div class="hobby">{{hzpartysum[t+4].hobby}}</div>
                                    <div class="specialty">{{hzpartysum[t+4].specialty}}</div>
                                </div>
                            </span>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- 底部轮播 -->
        <div class="people_photo">
            <img src="img/20.png"><span>党员照片</span></div>
        <div class="line">
        </div>
        <div class="change_img change_img_sh">
            <div class="swiper-container swiper-container-sh">
                <div class="swiper-wrapper">

                    <div class="swiper-slide swiper-no-swiping" v-for="x in shpartygeneral.length">
                        <div class="float_father">
                            <img v-bind:src="shpartygeneral[x-1].FileRef" >
                            <div class="mlk_swiper_name">
                                {{shpartygeneral[x-1].name}}
                            </div>
                            <div class="hidediv">
                                    <div class="branchposition">{{shpartygeneral[x-1].branchposition}}</div>
                                    <div class="locatedbranch">{{shpartygeneral[x-1].locatedbranch}}</div>
                                    <div class="companyposition">{{shpartygeneral[x-1].companyposition}}</div>
                                    <div class="joinTime">{{shpartygeneral[x-1].joinTime}}</div>
                                    <div class="hobby">{{shpartygeneral[x-1].hobby}}</div>
                                    <div class="specialty">{{shpartygeneral[x-1].specialty}}</div>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- 如果需要分页器 -->
                <!-- <div class="swiper-pagination"></div> -->
                <!-- 如果需要滚动条 -->
                <!-- <div class="swiper-scrollbar"></div> -->
            </div>
            <!-- 如果需要导航按钮 -->
            <div class="swiper-button-prev swiper-button-prev-sh">
            </div>
            <div class="swiper-button-next swiper-button-next-sh">
            </div>
        </div>
        <div class="change_img change_img_hz">
            <div class="swiper-container swiper-container-hz">
                <div class="swiper-wrapper">
                    <div class="swiper-slide swiper-no-swiping" v-for="y in hzpartygeneral.length">
                        <div class="float_father">
                            <img v-bind:src="hzpartygeneral[y-1].FileRef" >
                            <div class="mlk_swiper_name">
                                {{hzpartygeneral[y-1].name}}
                            </div>
                            <div class="hidediv">
                                    <div class="branchposition">{{hzpartygeneral[y-1].branchposition}}</div>
                                    <div class="locatedbranch">{{hzpartygeneral[y-1].locatedbranch}}</div>
                                    <div class="companyposition">{{hzpartygeneral[y-1].companyposition}}</div>
                                    <div class="joinTime">{{hzpartygeneral[y-1].joinTime}}</div>
                                    <div class="hobby">{{hzpartygeneral[y-1].hobby}}</div>
                                    <div class="specialty">{{hzpartygeneral[y-1].specialty}}</div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 如果需要分页器 -->
                <!-- <div class="swiper-pagination"></div> -->
                <!-- 如果需要滚动条 -->
                <!-- <div class="swiper-scrollbar"></div> -->
            </div>
            <!-- 如果需要导航按钮 -->
            <div class="swiper-button-prev swiper-button-prev-hz">
            </div>
            <div class="swiper-button-next swiper-button-next-hz">
            </div>
        </div>
        <div class="float_detail">
            <div class="float_detail_name">
                徐文</div>
            <ul>
                <li>
                <span class="detail_title">入党时间:</span> <span class="detail_date detail_content">
                    2005-12</span> </li>
                <li><span class="detail_title">所在支部:</span> <span class="detail_branch detail_content">
                    玫琳凯第一支部</span> </li>
                <li><span class="detail_title">公司职务:</span> <span class="detail_comjob detail_content">
                    高级系统整合业务分析员</span> </li>
                <li><span class="detail_title">支部职务:</span> <span class="detail_branjob detail_content">
                    组织委员 </span></li>
                <li><span class="detail_title">兴趣爱好:</span> <span class="detail_hobby detail_content">
                    旅游 运动 </span></li>
                <li><span class="detail_title">特&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;长:</span> <span
                    class="detail_skill detail_content">摄影 </span></li>
            </ul>
        </div>
    </div>
</asp:content>
<asp:content id="Content2" contentplaceholderid="PlaceHolderPageTitle" runat="Server">
组织机构
</asp:content>