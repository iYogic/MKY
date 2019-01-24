<%@ Page Language="C#" AutoEventWireup="true" CodeFile="party_building_honor.aspx.cs"
    Inherits="party_building_honor" %>

<%@ Assembly Name="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<asp:content id="Content0" contentplaceholderid="PlaceHolderAdditionalPageHead" runat="server">
<link rel="stylesheet" type="text/css" href="css/party_building_honor.css">
<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="js/vue.min.js"></script>
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
        //获取数据
        GetItems(webUrl, "荣誉墙信息", querys, "honor_information");
    })

    function honor_information(arr) {
        var datafirst = [];
        var datafirstobj = {};
        var datasecond = [];
        var datasecondobj = {};
        //第一个
        for (var i = 0; i <4; i++) {
            var vals = arr[i].get_fieldValues();
            //console.log(vals);
            //页面地址
            var FileRef = vals.FileRef;
            datafirstobj.FileRef = FileRef;
            //缩略图地址
            var abbreurl = vals.abbreimg.get_url();
            datafirstobj.abbreurl = abbreurl;
            //简介
            var synopsis = vals.synopsis;
            datafirstobj.synopsis = synopsis;
            //日期
            var datep = ormatDate(vals.date);
            datafirstobj.date = datep;
            datafirst.push(datafirstobj)
            datafirstobj = {};
        }
        //后面的循环
        for (var i = 4; i <arr.length; i++) {
            var vals = arr[i].get_fieldValues();
           
            //页面地址
            var FileRef = vals.FileRef;
            datasecondobj.FileRef = FileRef;
            //缩略图地址
            var abbreurl = vals.abbreimg.get_url();
            datasecondobj.abbreurl = abbreurl;
            //简介
            var synopsis = vals.synopsis;
            datasecondobj.synopsis = synopsis;
            //日期
            var datep = ormatDate(vals.date);
            datasecondobj.date = datep;
            datasecond.push(datasecondobj)
            datasecondobj = {};
        }
        //第二个数组的向上取整，得到循环次数
        var datasecond_length = datasecond.length;
        var cyclei = Math.ceil(datasecond_length / 4);
        //console.log(cyclei);
        //console.log(datafirst);
        //console.log(datasecond);
        //执行完，拿到两个数组datafirst、datasecond，第一个长度4，第二个未知，
        //注册vue,绑定数据开始
        new Vue({
            el: '#honor_app',
            data: {
                datafirstp: datafirst,
                datasecondp: datasecond,
                datasecondp_length: datasecond_length,
                cyclei: cyclei
            },
            methods: {
                firstlocationhref: function (thedex) {
                    window.location.href = datafirst[thedex].FileRef;
                },
                secondlocationhref: function (thedex) {
                    window.location.href = datasecond[thedex].FileRef;
                }
            }
        })
        //vue结束
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
			<div class="content_icon"><img src="img/58.png" alt="" ></div>
		</div>
		<div class="content_info">
             <!-- vue视图构建开始 -->
			<div class="content_info_child" id="honor_app">
                <!-- 第一个顶部模块之间绑定数据 -->
				<div class="content_tab_div">
					<div class="info_childone">
						<ul class="con_show_min con_show_min_l">
							<li class="con_top con_left_first">
								<div class="title_icon">
									<img src="img/61.png" alt="">
									<span class="title_txt">{{datafirstp[0].date}}</span>
								</div>
								<div class="show_info_min" v-on:click="firstlocationhref(0)">
									<div class="show_info_tetx">
										{{datafirstp[0].synopsis}}
									</div>
									<div class="show_info_head">
										<img v-bind:src="datafirstp[0].abbreurl" alt="">
									</div>
								</div>
							</li>
							<li class="con_bot  con_left_second">
								<div class="title_icon">
									<img src="img/61.png" alt="">
									<span class="title_txt">{{datafirstp[1].date}}</span>
								</div>
								<div class="show_info_min" v-on:click="firstlocationhref(1)">
									<div class="show_info_tetx">
										{{datafirstp[1].synopsis}}
									</div>
									<div class="show_info_head">
										<img v-bind:src="datafirstp[1].abbreurl" alt="">
									</div>
								</div>
							</li>	
						</ul>
					</div>
					<div class="info_childtwo"><img src="img/party_building_honor/5.png" alt=""></div>
					<div class="info_childthree">
						<ul class="con_show_min con_show_min_l">
							<li class="con_top  con_right_first">
								<div class="title_icon">
									<img src="img/61.png" alt="">
									<span class="title_txt">{{datafirstp[2].date}}</span>
								</div>
								<div class="show_info_min" v-on:click="firstlocationhref(2)">
									<div class="show_info_tetx">
										{{datafirstp[2].synopsis}}
									</div>
									<div class="show_info_head">
										<img v-bind:src="datafirstp[2].abbreurl" alt="">
									</div>
								</div>
							</li>
							<li class="con_bot  con_right_second">
								<div class="title_icon">
									<img src="img/61.png" alt="">
									<span class="title_txt">{{datafirstp[3].date}}</span>
								</div>
								<div class="show_info_min" v-on:click="firstlocationhref(3)">
									<div class="show_info_tetx">
										{{datafirstp[3].synopsis}}
									</div>
									<div class="show_info_head">
										<img v-bind:src="datafirstp[3].abbreurl" alt="">
									</div>
								</div>
							</li>	
						</ul>
					</div>
				</div>

                <!-- 后面个数位置数据绑定采用循环 -->
				<div class="content_tab_div" v-for="i in cyclei">
					<div class="info_childone">
						<ul class="con_show_min con_show_min_l">
							<li class="con_top  con_left_first" v-if="(4*i-3)<=datasecondp_length">
								<div class="title_icon">
									<img src="img/61.png" alt="">
									<span class="title_txt">{{datasecondp[4*i-4].date}}</span>
								</div>
								<div class="show_info_min" v-on:click="secondlocationhref(4*i-4)">
									<div class="show_info_tetx">
                                        {{datasecondp[4*i-4].synopsis}}
									</div>
									<div class="show_info_head">
										<img v-bind:src="datasecondp[4*i-4].abbreurl" alt="">
									</div>
								</div>
							</li>
							<li class="con_bot  con_left_second" v-if="(4*i-2)<=datasecondp_length">
								<div class="title_icon">
									<img src="img/61.png" alt="">
									<span class="title_txt">{{datasecondp[4*i-3].date}}</span>
								</div>
								<div class="show_info_min" v-on:click="secondlocationhref(4*i-3)">
									<div class="show_info_tetx">
										{{datasecondp[4*i-3].synopsis}}
									</div>
									<div class="show_info_head">
										<img v-bind:src="datasecondp[4*i-3].abbreurl" alt="">
									</div>
								</div>
							</li>	
						</ul>
					</div>
					<div class="info_childtwo "><img src="img/party_building_honor/7.png" alt="" class="info_midsed_img"></div>
					<div class="info_childthree">
						<ul class="con_show_min con_show_min_l">
							<li class="con_top  con_right_firstb" v-if="(4*i-1)<=datasecondp_length">
								<div class="title_icon">
									<img src="img/61.png" alt="">
									<span class="title_txt">{{datasecondp[4*i-2].date}}</span>
								</div>
								<div class="show_info_min" v-on:click="secondlocationhref(4*i-2)">
									<div class="show_info_tetx">
										{{datasecondp[4*i-2].synopsis}}
									</div>
									<div class="show_info_head">
										<img v-bind:src="datasecondp[4*i-2].abbreurl"  alt="">
									</div>
								</div>
							</li>
							<li class="con_bot  con_right_secondb" v-if="(4*i)<=datasecondp_length">
								<div class="title_icon">
									<img src="img/61.png" alt="">
									<span class="title_txt">{{datasecondp[4*i-1].date}}</span>
								</div>
								<div class="show_info_min" v-on:click="secondlocationhref(4*i-1)">
									<div class="show_info_tetx">
										{{datasecondp[4*i-1].synopsis}}
									</div>
									<div class="show_info_head">
										<img v-bind:src="datasecondp[4*i-1].abbreurl" alt="">
									</div>
								</div>
							</li>	
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</asp:content>
<asp:content id="Content2" contentplaceholderid="PlaceHolderPageTitle" runat="Server">
党建荣誉墙
</asp:content>
