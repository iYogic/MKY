'use strick';

// Data Split Character
var data_split = "~";
// Container ID
var layoutsId = "part1";
// Top Container ID
var pageId = "contentBox";
// Main Place Holder ID
var mainId = "DeltaPlaceHolderMain";
// Left Bar ID
var leftSideId = "sideNavBox";
// Form Table Class Name
var mainTableClassName = "ms-formtable";
// Window Width (Global)
var mainWidth = 0;
// Message for confirm
var DEL_CONFIRM_MSG = "确认删除？";
// Container table outer ID
var tableOuterId = "WebPartWPQ2";

var MAX_HEIGHT = 0;
var lineHeight = 32; // 每行高度
var titlewidth = 100; // 标题文字宽度

String.prototype.replaceAll = function (s1, s2) {
    return this.replace(new RegExp(s1, "gm"), s2);
}

String.prototype.startWith = function (str) {
    var reg = new RegExp("^" + str);
    return reg.test(this);
}

String.prototype.endWith = function (str) {
    var reg = new RegExp(str + "$");
    return reg.test(this);
}

Date.prototype.toString = function (fmt) {
    if (!fmt)
        return Object(this);
    var o = {
        "M+": this.getMonth() + 1,
        "d+": this.getDate(),
        "H+": this.getHours(),
        "m+": this.getMinutes(),
        "s+": this.getSeconds(),
        "q+": Math.floor((this.getMonth() + 3) / 3),
        "S": this.getMilliseconds()
    };
    if (/(y+)/.test(fmt)) {
        fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length))
    }
    for (var k in o) {
        if (new RegExp("(" + k + ")").test(fmt)) { fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length))) }
    }
    return fmt;
};
//获取url参数
function GetQueryStringParameter(paramToRetrieve) {
    try {
        var params = document.URL.split("?")[1].split("&");
        var strParams = "";
        for (var i = 0; i < params.length; i = i + 1) {
            var singleParam = params[i].split("=");
            if (singleParam[0] == paramToRetrieve)
                return singleParam[1];
        }
        return "";
    } catch (e) {
        return "";
    }
}
//判断是不是查看
function IsDispForm() {
    if (document.URL.toLowerCase().indexOf("/dispform.aspx?id=") > 0) {
        return true;
    } else {
        return false;
    }
}

function GetMainHeight() {
    return $("." + mainTableClassName).height();
}

function SetMainHeight(h) {

    $("." + mainTableClassName).height(h);
    // $("." + mainTableClassName).attr("border","")

    //同步区域标题和下方区域内容的table一样宽,转移到css处理
    //$(".areatitle").outerWidth($("." + mainTableClassName).outerWidth())

    //去除#part1的父级的同级td的占位
    if ($("#part1").parent("td").siblings("td")) {
        $("#part1").parent("td").siblings("td").remove();
    }

    //var objTrs = $("." + mainTableClassName).find("tr");
    //var maxTop = 0;
    //var maxHeight = 0;
    //for (var i = 0; i < objTrs.length - 1; i++) {
    //    var tmpSpans = $(objTrs[i]).find("span");
    //    for (var j = 0; j < tmpSpans.length; j++) {
    //        var tmpId = $(tmpSpans[j]).attr("id");
    //        if (tmpId.indexOf("Pos_") == 0) {
    //            var tmpPos = tmpId.replace("Pos_", "").split(data_split)[0];
    //            if (parseInt(tmpPos) > maxTop) {
    //                maxTop = parseInt(tmpPos);
    //                maxTopSpan = $(tmpSpans[j]);
    //            }
    //        }
    //    }
    //}
}

function GetListItemValue(item, fldTitle) {
    return item.get_item(fldTitle);
}

function ormatDate(dateNum) {
    var date = new Date(dateNum);
    return (date.getFullYear() + "-" + fixZero(date.getMonth() + 1, 2) + "-" + fixZero(date.getDate(), 2) + " " + fixZero(date.getHours(), 2) + ":" + fixZero(date.getMinutes(), 2) + ":" + fixZero(date.getSeconds(), 2)).substring(0, 10);
    function fixZero(num, length) {
        var str = "" + num;
        var len = str.length;
        var s = "";
        for (var i = length; i-- > len; ) {
            s += "0";
        }
        return s + str;
    }
}
