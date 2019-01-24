'use strick';

var setupWebUrl = "/";
var setupEntity = {};
var tempParas = {};

function GetItems(dataWebUrl, dataListTitile, dataQuery, callFunc) {
    var querys = dataQuery;
    SP.SOD.executeFunc("sp.js", 'SP.ClientContext', function () {
        var clientContext = new SP.ClientContext(dataWebUrl);
        setupEntity.callFunc = callFunc;
        if (clientContext != undefined && clientContext != null) {
            var webSite = clientContext.get_web();
            var oList = webSite.get_lists().getByTitle(dataListTitile);
            var camlQuery = new SP.CamlQuery();
            camlQuery.set_viewXml(querys);
            setupEntity.collListItem = oList.getItems(camlQuery);
            clientContext.load(setupEntity.collListItem);
            clientContext.executeQueryAsync(function onQuerySucceeded(sender, args) {
                var listItemEnumerator = setupEntity.collListItem.getEnumerator();
                var listItems = [];
                while (listItemEnumerator.moveNext()) {
                    var oListItem = listItemEnumerator.get_current();
                    listItems.push(oListItem);
                }

                if (callFunc != null && callFunc != "") {
                    var fn = window[callFunc];
                    fn(listItems);
                }
            }, function onQueryFailed(sender, args) {
                if (callFunc != null && callFunc != "") {
                    var fn = window[callFunc];
                    fn(null);
                }
            });
        }
    });
}

/*****************************************************************
 * 获取配置表数据
 * setupListTitle: 配置库名称 
 * dataWebUrl: 查询条件，数据WebUrl
 * dataListTitle: 查询条件，数据ListTitle
 * dataQuery: Query XML语句
 * callFunc: 异步执行完成后的回调函数名，方法中的参数数量为1个
 *           如：InitPageItems(val)，则传入"InitPageItems"
 *           如callFunc=null或空，则表示不需要回调
 *****************************************************************/
function GetListItemsByQuery(setupListTitle, dataWebUrl, dataListTitle, dataQuery, callFunc) {
    var querys = dataQuery;
    SP.SOD.executeFunc("sp.js", 'SP.ClientContext', function () {
        var clientContext = new SP.ClientContext(setupWebUrl);
        setupEntity.callFunc = callFunc;
        if (clientContext != undefined && clientContext != null) {
            var webSite = clientContext.get_web();
            var oList = webSite.get_lists().getByTitle(setupListTitle);
            var camlQuery = new SP.CamlQuery();
            camlQuery.set_viewXml(querys);
            setupEntity.collListItem = oList.getItems(camlQuery);
            clientContext.load(setupEntity.collListItem);
            clientContext.executeQueryAsync(function onQuerySucceeded(sender, args) {
                var listItemEnumerator = setupEntity.collListItem.getEnumerator();
                var listItems = [];
                while (listItemEnumerator.moveNext()) {
                    var oListItem = listItemEnumerator.get_current();
                    listItems.push(oListItem);
                }

                if (callFunc != null && callFunc != "") {
                    var fn = window[callFunc];
                    fn(listItems);
                }
            }, function onQueryFailed(sender, args) {
                if (callFunc != null && callFunc != "") {
                    var fn = window[callFunc];
                    fn(null);
                }
            });
        }
    });
}

/*****************************************************************
 * 获取配置表数据
 * setupListTitle: 配置库名称 
 * dataWebUrl: 查询条件，数据WebUrl
 * dataListTitle: 查询条件，数据ListTitle
 * callFunc: 使用默认Query XML语句
 *           异步执行完成后的回调函数名，方法中的参数数量为1个
 *           如：InitPageItems(val)，则传入"InitPageItems"
 *           如callFunc=null或空，则表示不需要回调
 *****************************************************************/
function GetListItems(setupListTitle, dataWebUrl, dataListTitle, orderXml, callFunc) {
    var querys = "";
    querys = "<View Scope=\'RecursiveAll\'>" +
        "<Query>" +
        "<Where>" +
        "<And>" +
        "<Eq><FieldRef Name=\'WebUrl\'/><Value Type=\'Text\'>" + dataWebUrl + "</Value></Eq>" +
        "<Eq><FieldRef Name=\'ListTitle\'/><Value Type=\'Text\'>" + dataListTitle + "</Value></Eq>" +
        "</And>" +
        "</Where>" +
        orderXml +
        "</Query>" +
        "</View>";
    GetListItemsByQuery(setupListTitle, dataWebUrl, dataListTitle, querys, callFunc);
}

/*****************************************************************
 * 根据List的Guid获取列表标题
 * dataWebUrl: 列表所属的WebUrl
 * dataListId: 列表的Guid
 * callFunc: 异步执行完成后的回调函数名，方法中的参数数量为1个
 *           如：InitPageItems(val)，则传入"InitPageItems"
 *           如callFunc=null或空，则表示不需要回调
 *****************************************************************/
function GetListTitle(dataWebUrl, dataListId, callFunc) {
    SP.SOD.executeFunc("sp.js", 'SP.ClientContext', function () {
        var context = new SP.ClientContext(dataWebUrl);
        var oList = context.get_web().get_lists().getById(dataListId);
        context.load(oList);
        context.executeQueryAsync(function onQuerySucceeded(sender, args) {
            var ListTitle = oList.get_title();
            if (callFunc != null && callFunc != "") {
                var fn = window[callFunc];
                fn(ListTitle);
            }
        }, function onQueryFailed(sender, args) {
            if (callFunc != null && callFunc != "") {
                var fn = window[callFunc];
                fn(null);
            }
        });
    });
}

/*****************************************************************
 * 获取列表的所有内容类型
 * dataWebUrl: 列表所属的WebUrl
 * dataListTitle: 列表的Title
 * callFunc: 异步执行完成后的回调函数名，方法中的参数数量为1个
 *           如：InitPageItems(val)，则传入"InitPageItems"
 *           如callFunc=null或空，则表示不需要回调
 *****************************************************************/
function GetListContentTypes(dataWebUrl, dataListTitle, callFunc) {
    SP.SOD.executeFunc("sp.js", 'SP.ClientContext', function () {
        var context = new SP.ClientContext(dataWebUrl);
        var oList = context.get_web().get_lists().getByTitle(dataListTitle);
        context.load(oList);
        var contentTypeColl = oList.get_contentTypes();
        context.load(contentTypeColl);
        context.executeQueryAsync(function onQuerySucceeded(sender, args) {
            var CtTypes = [];
            for (var i = 0; i < contentTypeColl.length; i++) {
                CtTypes.push(contentTypeColl[i]);
            }
            if (callFunc != null && callFunc != "") {
                var fn = window[callFunc];
                fn(CtTypes);
            }
        }, function onQueryFailed(sender, args) {
            if (callFunc != null && callFunc != "") {
                var fn = window[callFunc];
                fn(null);
            }
        });
    });
}

/*****************************************************************
 * 获取工作流配置信息
 * dataWebUrl: 列表所属的WebUrl
 * dataListId: 列表的Guid
 * callFunc: 异步执行完成后的回调函数名，方法中的参数数量为1个
 *           如：InitPageItems(val)，则传入"InitPageItems"
 *           如callFunc=null或空，则表示不需要回调
 *****************************************************************/
function GetWorkflow(dataWebUrl, dataListId, callFunc) {
    SP.SOD.executeFunc("sp.js", 'SP.ClientContext', function () {
        var context = new SP.ClientContext(dataWebUrl);
        var web = context.get_web();

        var sMgr = SP.WorkflowServices.WorkflowServicesManager.newObject(context, web);
        var wSS = sMgr.getWorkflowSubscriptionService();
        var wDS = sMgr.getWorkflowDeploymentService();
        var wfSubs = wSS.enumerateSubscriptionsByList(dataListId);
        console.log(sMgr);
        console.log(wSS);
        console.log(wfSubs);
        context.load(wfSubs);

        var entity = {};
        context.executeQueryAsync(function onQuerySucceeded(sender, args) {
            var wfsEnum = wfSubs.getEnumerator();
            // Get First
            console.log(wfsEnum);
            console.log(wfsEnum.moveNext());
            while (wfsEnum.moveNext()) {
                console.log(222);
                var wfSub = wfsEnum.get_current();
                var wDef = wDS.getDefinition(wfSub.get_definitionId());
                
                context.load(wDef);
                context.executeQueryAsync(function onQuerySucceeded(sender, args) {
                    entity.sub = wfSub;
                    entity.def = wDef;
                    
                    if (callFunc != null && callFunc != "") {
                        var fn = window[callFunc];
                        fn(entity);
                    }
                }, function onQueryFailed(sender, args) {
                    if (callFunc != null && callFunc != "") {
                        var fn = window[callFunc];
                        fn(null);
                    }
                });
                break;
            }
        }, function onQueryFailed(sender, args) {
            if (callFunc != null && callFunc != "") {
                var fn = window[callFunc];
                fn(null);
            }
        });
    });
}

$(document).ready(function () {
    InitPage();
});

function InitPage() {
    var curWebUrl = _spPageContextInfo.siteServerRelativeUrl;
    var curListId = _spPageContextInfo.pageListId;

    var btns = $("#" + mainId).find('input[type="button"]');
    var ibollayouts = document.URL.toLowerCase().indexOf("/_layouts/");

    var bolHasSub = false;
    if (ibollayouts < 0 && btns != null && btns.length > 0) {
        GetListTitle(curWebUrl, curListId, "InitPage_S1");
    } else {
        ShowPage(true);
    }
}

function InitPage_S1(val) {
    if (val != null) {
        var curWebUrl = _spPageContextInfo.siteServerRelativeUrl;
        var curListId = _spPageContextInfo.pageListId;
        var curListTitle = val;

        tempParas.curListTitle = val;
        GetListItems("OptimizedLayouts", curWebUrl, curListTitle, "<OrderBy><FieldRef Name=\'AreaNum\' Ascending =\'True\'/><FieldRef Name=\'RowNum\' Ascending =\'True\'/></OrderBy>", "InitPage_S2");
    } else {
        ShowPage(true);
    }
}

function InitPage_S2(val) {
    if (val != null && val.length > 0) {
        var curWebUrl = _spPageContextInfo.siteServerRelativeUrl;
        InitOptLayouts(val);

        GetListItems("SubRecords", curWebUrl, tempParas.curListTitle, "<OrderBy><FieldRef Name=\'SubColumnOrder\' Ascending =\'True\'/></OrderBy>", "InitPage_S3");
    } else {
        ShowPage(true);
    }

    //// Linkage Data
    //var fieldInterns = ["Level1", "Level2", "Level1Title", "Level2Title"];
    //var pro = appService.GetListItems("DropdownLinkage", curWebUrl, curListTitle, fieldInterns, "");
    //pro.then(function (val) {
    //    if (val != null && val.length > 0) {
    //        InitDdlLinkage(val);
    //    }

    //    // Sub Records
    //    var fieldInterns3 = ["FieldTitle", "SubColumnName", "SubColumnType", "SubColumnWidth", "SubColumnOrder", "SubColumnNotes"];
    //    var pro3 = appService.GetListItems("SubRecords", curWebUrl, curListTitle, fieldInterns3, "<OrderBy><FieldRef Name=\'SubColumnOrder\' Ascending =\'True\'/></OrderBy>");
    //    pro3.then(function (val3) {
    //        if (val3 != null && val3.length > 0) {
    //            InitSubRecords(val3);
    //            bolHasSub = true;
    //        }

    //        var pro4 = appService.GetWorkflow(curWebUrl, curListId);
    //        pro4.then(function (val4) {
    //            GetWorkflow(val4);
    //        }, function (error) {

    //        });
    //        ShowPage(true);
    //    }, function (error) {
    //        ShowPage(true);
    //    });
    //}, function (error) {
    //    ShowPage(true);
    //});
}

function InitPage_S3(val) {
    if (val != null && val.length > 0) {
        InitSubRecords(val);
        tempParas.bolHasSub = true;
    }

    ShowPage(true);
}

var fldTitles = null;
var fldCtls = null;
var resizeable = false;

function ShowPage(bol) {
    if ($("#" + pageId).length > 0) {
        if (bol) {
            $("#" + pageId).show();
        } else {
            $("#" + pageId).hide();
        }
    }

    if ($("#" + mainId).length > 0) {
        if (bol) {
            $("#" + mainId).css("position", "relative");
            SetLayouts(true);
            if (!resizeable) {
                $(window).resize(function () {
                    SetLayouts(true);
                });
                resizeable = true;
            }
        }
    }
}

function CalMainWidth() {
    mainWidth = $(window).width();
    if ($("#" + leftSideId).length > 0) {
        mainWidth = mainWidth - $("#" + leftSideId).outerWidth(true);
    }
}
//初始化数组，把原始页面的td的内容和tr的序号进数组， 一个标题一个tr
function InitControls() {
    fldTitles = [];
    fldCtls = [];
    var objtrs = $("#" + layoutsId).find("tr");
    for (var i = 0; i < objtrs.length; i++) {
        var objs = $(objtrs[i]).find("td");
        var obj = null;
        if (objs.length > 0) {
            obj = objs[0];
        } else {
            continue;
        }
        var strTitle = $(obj).text().trim();
        if (strTitle != "") {
            fldTitles.push(strTitle.replace("*"," ").trim());
            fldCtls.push(objtrs[i]);
        }
    }
}

function InitControlsOpt() {
    fldTitles = [];
    fldCtls = [];
    var objtbls = $("#" + layoutsId).find(".innertable");
    for (var z = 0; z < objtbls.length; z++) {
        var objtrs = $(objtbls[z]).find("tr");
        for (var i = 0; i < objtrs.length; i++) {
            var objs = $(objtrs[i]).find("td");
            var obj = null;
            if (objs.length > 0) {
                obj = objs[0];
            } else {
                continue;
            }
            var strTitle = $(obj).text().trim();
            if (strTitle != "") {
                fldTitles.push(strTitle.replace("*", "").trim());
                fldCtls.push(objtrs[i]);
            }
        }
    }
}

//通过标题找到tr
function FindTrByTitle(strTitle) {
    //标题数组为空，就初始化下
    if (fldTitles == null) {
        InitControls();
    }
    //数组不为空，返回原始tr数组中的对应位置
    var idx = fldTitles.indexOf(strTitle);
    if (idx >= 0) {
        return fldCtls[idx];
    } else {
        return null;
    }
}

//通过标题找到容器
function FindContainerByTitle(strTitle) {
    //标题数组为空，就初始化下
    if (fldTitles == null) {
        InitControls();
    }
    var tr = FindTrByTitle(strTitle);

    if (tr != null) {
        var tds = $(tr).find("td");
        if (tds.length > 1) {
                //非查看页面返回td内的span
                if (!IsDispForm()) {
                    var span = $(tds[1]).find("span");
                    if ($(span).length > 0) {
                        return span[0];
                    }
                } else {
                    //查看页面返回td内的第一个div
                    var span = $(tds[1]).find("div");
                    for (var i = 0; i < span.length; i++) {
                        if ($(span[i]).attr("id") != null && typeof ($(span[i]).attr("id") != "undefined")) {
                            if ($(span[i]).attr("id").indexOf("Pos_") == 0) {
                                return span[i];
                            }
                        }
                    }
                }
        }
    }

    return null;
}

//
function FindTextContainerByTitle(strTitle) {
    if (fldTitles == null) {
        InitControls();
    }
    var tr = FindTrByTitle(strTitle);
    if (tr != null) {
        var tds = $(tr).find("td");
        if (tds.length > 1) {
            if (!IsDispForm()) {
                // Do nothing
            } else {
                //是查看页面返回td内第一个div标签
                var span = $(tds[1]).find("div");
                for (var i = 0; i < span.length; i++) {
                    if ($(span[i]).attr("id") != null && typeof ($(span[i]).attr("id") != "undefined")) {
                        // Do nothing
                    } else {
                        return span[i];
                    }
                }
            }
        }
    }

    return null;
}

//通过title寻找输入器
function FindControlsByTitle(strTitle) {
    if (fldTitles == null) {
        InitControls();
    }
    //查看字段是否在原始的字段数组中
    var idx = fldTitles.indexOf(strTitle);
    //如果在，返回该字段在原始字段数组中对应位置的所有input框，类数组
    if (idx >= 0) {
        var ctlscontainer = fldCtls[idx];
        var ctls = $(ctlscontainer).find(":input");
        return ctls;
    } else {
        return null;
    }
}

function FindFirstControlByTitle(strTitle) {
    var ctls = FindControlsByTitle(strTitle);
    if (ctls.length > 0) {
        return ctls[0];
    } else {
        return null;
    }
}

function HideControlsByTitle(strTitle) {
    if (fldTitles == null) {
        InitControls();
    }
    
    var tr = FindTrByTitle(strTitle);
    if (tr != null) {
        $(tr.hide());
    }
}