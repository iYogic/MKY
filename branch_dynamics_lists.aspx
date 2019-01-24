<%@ Page Language="C#" AutoEventWireup="true" CodeFile="branch_dynamics_lists.aspx.cs" Inherits="branch_dynamics_lists" %>

<%@ Assembly Name="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>

<asp:content id="Content0" contentplaceholderid="PlaceHolderAdditionalPageHead" runat="server">
    <link rel="stylesheet" type="text/css" href="./css/all.css">
    <link rel="stylesheet" type="text/css" href="./css/branch_dynamics_lists2.css">
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
            GetItems(webUrl, "支部动态信息", querys, "branchdynamicslist");
        })

        function branchdynamicslist(arr){
            var datas = [];
            var datasobj = {};
            for (var i = 0; i <arr.length; i++) {
                var vals = arr[i].get_fieldValues();
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

            var dynamics_list_html = "";
            for (var i = 0; i < datas.length; i++) {
                dynamics_list_html += '<li onclick="window.location.href=\'' + datas[i].FileRef + '\'"><span class="con_show_txt">' + datas[i].title + '</span><span class="con_show_date">' + datas[i].date.substring(5) + '</span></li>'
            }
            $(".dynamics_list_html").html(dynamics_list_html);

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
        <div class="content_show_sum">
            <div class="content_show">
                <div class="con_show_list">
                    <ul class="con_show_box dynamics_list_html">
                        
                    </ul>
                </div>
            </div>
        </div>
       <!--列表结束-->

    </div>
</asp:content>
<asp:content id="Content2" contentplaceholderid="PlaceHolderPageTitle" runat="Server">
支部动态列表
</asp:content>
