<%@ Page Language="C#" %>

<%@ Import Namespace="Ext.Net.Utilities" %>
<%@ Import Namespace="System.Collections.Generic" %>
<%@ Import Namespace="Corp.Tool.Web" %>

<script runat="server">
    protected string mobileVersion = "4.1";
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!X.IsAjaxRequest)
        {
            this.ResourceManager1.DirectEventUrl = "/";

            this.TriggerField1.Focus();

            ResourceManager.RegisterControlResources<TagLabel>();

            if (this.Request.QueryString["clearExamplesCache"] != null)
            {
                this.Page.Cache.Remove("ExamplesTreeNodes");
                X.Msg.Alert("Cache clear", "Tree nodes cache cleared.").Show();
            }

            // Makes dynamic data to server controls be bound to the page (like version on title).
            DataBind();
        }

        this.exampleTree.ExpandAll();
    }

    protected void GetExamplesNodes(object sender, NodeLoadEventArgs e)
    {
        if (e.NodeID == "Root")
        {
            Ext.Net.NodeCollection nodes = this.Page.Cache["ExamplesTreeNodes"] as Ext.Net.NodeCollection;

            if (nodes == null)
            {
                nodes = UIHelpers.BuildTreeNodes(false);
                this.Page.Cache.Add("ExamplesTreeNodes", nodes, null, DateTime.Now.AddHours(1), System.Web.Caching.Cache.NoSlidingExpiration, CacheItemPriority.Default, null);
            }

            e.Nodes = nodes;
        }
    }

    [DirectMethod]
    public static int GetHashCode(string s)
    {
        return Math.Abs("/Webforms".ConcatWith(s).ToLower().GetHashCode());
    }
</script>

<!DOCTYPE html>

<html>
<head runat="server">


	
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Test Tool Online</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="<%= "resources/css/main.css?" + ExtNetVersion.Full %>" />
    <link rel="shortcut icon" href="favicon.ico" />

   <link rel="stylesheet" href="Build.Ext.Net.extnet.unlicensed.css.un-embedded.css" />
       <link rel="stylesheet" href="Build.Ext.Net.extnet.unlicensed.css.un-embedded2.css" />

	<%--<script src="Build.Ext.Net.extnet.unlicensed.un.js"></script>--%>

    <script>
        //alert('Starting1');

        $(document).ready(function () {
            $("#unlicensed").destroy();
        });

    </script>

    
     <script>
         Ext.onReady(function () {
             Ext.Function.defer(function () {
                 var el = Ext.DomHelper.append(document.body, {
                     tag: "div",
                     id: "unlicensed2",
                     children: [{
                         tag: "div",
                         class: "ul-title-icon",
                         children: [{
                             tag: "img",
                             width: 48,
                             height: 48,
                             src: Ext.net.ResourceMgr.resolveUrl("~/extnet/unlicensed/images/attention-png/ext.axd")
                         }]
                     }, {
                         tag: "div",
                         class: "ul-title",
                         html: "UNLICENSEDXXXXX!"
                     }]
                 }, true);



                 el.hide();

                 el.alignTo(document, "br-br", [-20, -20]);

                 //el.alignTo(document, "br-br", [-600, -600]);
                 el.slideIn("b", {
                     listeners: {
                         afteranimate: function () {
                             Ext.Function.defer(function () {
                                 el.slideOut("b", {
                                     listeners: {
                                         afteranimate: function () {
                                             Ext.Function.defer(el.destroy, 100, el);
                                         }
                                     }
                                 });
                             }, 20000);
                         }
                     }
                 });
                 el.hide();

             }, 500, window);
         });
    </script>


     <script>
         Ext.onReady(function () {
             Ext.Function.defer(function () {
                 var el = Ext.DomHelper.append(document.body, {
                     tag: "div",
                     id: "unlicensed",
                     children: [{
                         tag: "div",
                         class: "ul-title-icon",
                         children: [{
                             tag: "img",
                             width: 48,
                             height: 48,
                             src: Ext.net.ResourceMgr.resolveUrl("~/extnet/unlicensed/images/attention-png/ext.axd")
                         }]
                     }, {
                         tag: "div",
                         class: "ul-title",
                         html: "UNLICENSED!"
                     }, {
                         tag: "hr",
                         class: "ul-hr"
                     }, {
                         tag: "div",
                         class: "ul-body",
                         html: "Your copy of Ext.NET is unlicensed!<br />Ext.NET can be used without a license only on a local development environment."
                     }, {
                         tag: "a",
                         class: "ul-btn",
                         href: "http://ext.net/store/",
                         target: "_blank",
                         html: "PURCHASE LICENSE"
                     }, {
                         tag: "div",
                         class: "ul-footer",
                         html: "Free Minor Version Upgrades Included!"
                     }]
                 }, true);

                 //el.show();

                 //el.hide();

                 el.alignTo(document, "br-br", [-20, -20]);
                 el.slideIn("b", {
                     listeners: {
                         afteranimate: function () {
                             Ext.Function.defer(function () {
                                 el.slideOut("b", {
                                     listeners: {
                                         afteranimate: function () {
                                             Ext.Function.defer(el.destroy, 100, el);
                                         }
                                     }
                                 });
                             }, 20000);
                         }
                     }
                 });
            

             }, 500, window);
         });
    </script>
 

        <script src="<%= "resources/js/main.js?" + ExtNetVersion.Full %>"></script>

    <script>
        // A workaround for the GitHub issue #915
        Ext.data.TreeModel.override({
            expand: function () {
                if (this.data.visible) {
                    this.callParent(arguments);
                }
            }
        });
    </script>
     <script>
         //alert('Starting2');

        
         $(function () {

             var clearAd = {
                 //由于manifest文件匹配规则只有通配没有非功能，所以可在此处添加不想删除广告的页面
                 checkUrl: function () {
                     var Checkflag = 0,
                         url = window.location.href;

                     //手动添加不需要清除广告的域
                     var notDel = [
                         "www.baidu.com",
                         "taobao.com",
                         "tmall.com",
                         "jd.com"
                     ];

                     //正则匹配
                     for (var i = 0; i < notDel.length; i++) {
                         var reg = new RegExp(notDel[i], "g");

                         if (reg.test(url)) {
                             console.log('This page does not clear ads.');
                             break;
                         } else {
                             if (i == notDel.length - 1) {
                                 Checkflag = 1;
                             }
                         }
                     }

                     if (Checkflag == 1) {
                         this.clear();
                         this.findSomeAdPossible();
                     }
                 },
                 clear: function () {
                     console.log('Clear Start');
                     //此处可手动添加广告框id名，去除顽疾ad必备
                     var ad_id_name = [
                         "unlicensed",
                         "layerd"
                     ];

                     //此处添加广告框类名
                     var ad_css_name = [
                         "cproIframe_u410704_3",
                         "el",
                         "hover_btn"
                     ];

                     for (var i = 0; i < ad_id_name.length; i++) {
                         //使用remove删除节点，提升性能
                         $('#' + ad_id_name[i]).remove();
                     }

                     for (var i = 0; i < ad_css_name.length; i++) {
                         $('.' + ad_css_name[i]).remove();
                     }
                 },
                 //简单的智能算法
                 findSomeAdPossible: function () {
                     var sap = $('div iframe'),
                         ad_img = $('div script').parent().find('img,embed'),
                         float_img = $('div object').parent().find('img,embed');

                     this.arrayDel(sap, 360, 200);
                     this.arrayDel(ad_img, 350, 150);
                     this.arrayDel(float_img, 350, 150);
                 },
                 arrayDel: function (arr, conWidth, conHeight) {
                     var len = arr.length;

                     for (var i = 0; i < len; i++) {
                         var self = arr.eq(i);

                         if (self.width() <= conWidth || self.height() <= conHeight) {
                             self.remove();
                         }

                     }
                 },
                 init: function () {
                     this.checkUrl();
                 }
             }

             $(document).ready(function () {
                 clearAd.init();

                 //为防止ajax异步延时加载的广告隔4s再清除一次
                 setTimeout(function () {
                     clearAd.init();
                 }, 10000)
             });
         })

</script>
</head>
<body>
    <ext:ResourceManager ID="ResourceManager1" runat="server" Theme="Triton" />

    <ext:History runat="server">
        <Listeners>
            <Change Fn="change" />
        </Listeners>
    </ext:History>

    <ext:Viewport runat="server" Layout="BorderLayout">
        <Items>
            <ext:Container
                ID="RedirectOverlay"
                runat="server"
                Cls="redirect-overlay"
                WidthSpec="80%"
                Modal="true"
                Floating="true">
                <LayoutConfig>
                    <ext:VBoxLayoutConfig Align="Stretch" />
                </LayoutConfig>
                <Items>
                    <ext:Component
                        Cls="redirect-overlay-body"
                        runat="server"
                        Html="<p>Looks like you are browsing from a phone or a tablet device. Would you like to redirect to Ext.NET Mobile examples?</p>"/>

                    <ext:Button
                        runat="server"
                        Text="Redirect"
                        Flex="1"
                        Handler="onRedirect" />

                    <ext:Button
                        runat="server"
                        Text="Stay here"
                        Flex="1"
                        Handler="onStay" />

                    <ext:Checkbox
                        ID="RememberCheckbox"
                        Cls="remember-me"
                        runat="server"
                        BoxLabel="Remember my choice" />
                </Items>
            </ext:Container>

            <ext:Panel
                runat="server"
                Header="false"
                Region="North"
                Border="false"
                Height="70">
                <Content>
                    <header class="site-header" role="banner">
                        <nav class="top-navigation">
                            <div class="logo-container">
                                <img src="resources/images/testlogo.png" />
                            </div>
                            <div class="navigation-bar">
                          <%--      <label id="menu-button" for="menu-button-checkbox">
                                    <span></span>
                                </label>--%>
                            </div>
                        </nav>
                    </header>
                </Content>
            </ext:Panel>
            <ext:Panel
                ID="rightnav"
                runat="server"
                Region="East"
                Width="270"
                Header="false"
                MarginSpec="0"
                Hidden="true"
                Border="false"
                BodyCls="right-nav-menu">
                <Content>
                    <ul id="nav-menu" class="nav-menu">
                        <li><a href="http://examples.ext.net/">Web Forms Examples</a></li>
                        <li><a href="http://mvc.ext.net/">MVC Examples</a></li>
                        <li><a href="http://mobile.ext.net/">Mobile Examples</a></li>
                        <li><a href="http://mvc.mobile.ext.net/">MVC Mobile Examples</a></li>
                        <li class="separator"></li>
                        <li><a href="https://docs.sencha.com/extjs/6.5.2/classic/Ext.html">EXT JS Documentation</a></li>
                        <li><a href="http://docs.ext.net/">Ext.NET Documentation</a></li>
                        <li class="separator"></li>
                        <li><a href="http://forums.ext.net/">Community Forums</a></li>
                        <li><a href="http://ext.net/faq/">FAQ</a></li>
                        <li><a href="http://ext.net/contact/">Contact</a></li>
                        <li><a href="http://ext.net/">Ext.NET Home</a></li>
                        <li class="separator"></li>
                        <li>
                            <a href="#" data-toggle="collapse" data-target="#archives"><i class="fa collapse-icon"></i> Archives</a>
                            <ul class="collapse" id="archives">
                                <li class="section-title">Ext.NET 3</li>
                                <li><a href="http://examples3.ext.net/">Web Forms Examples (3.3)</a></li>
                                <li><a href="http://mvc3.ext.net/">MVC Examples (3.3)</a></li>
                                <li class="separator"></li>
                                <li class="section-title">Ext.NET 2</li>
                                <li><a href="http://examples2.ext.net/">Web Forms Examples (2.5)</a></li>
                                <li><a href="http://mvc2.ext.net/">MVC Examples (2.5)</a></li>
                                <li class="separator"></li>
                                <li class="section-title">Ext.NET 1</li>
                                <li><a href="http://examples1.ext.net/">Web Forms Examples (1.7)</a></li>
                            </ul>
                        </li>
                    </ul>
                    <a href="http://ext.net/store/" class="button button-success button-block button-sidebar-right">Get Ext.NET</a>
                </Content>
            </ext:Panel>
            <ext:Panel
                runat="server"
                Region="West"
                Layout="Fit"
                Width="270"
                Header="false"
                MarginSpec="0"
                Border="false">
                <Items>
                    <ext:TreePanel
                        ID="exampleTree"
                        runat="server"
                        Header="false"
                        AutoScroll="true"
                        Lines="false"
                        UseArrows="true"
                        CollapseFirst="false"
                        RootVisible="false"
                        Animate="false"
                        HideHeaders="true">
                        <TopBar>
                            <ext:Toolbar runat="server" Cls="left-header">
                                <Items>
                                    <ext:TextField
                                        ID="TriggerField1"
                                        runat="server"
                                        EnableKeyEvents="true"
                                        Flex="1"
                                        EmptyText="过滤菜单..."
                                        RemoveClearTrigger="true">
                                        <Triggers>
                                            <ext:FieldTrigger Icon="Clear" Hidden="true" />
                                        </Triggers>
                                        <Listeners>
                                            <KeyUp Fn="keyUp" Buffer="500" />
                                            <TriggerClick Fn="clearFilter" />
                                            <SpecialKey Fn="filterSpecialKey" Delay="1" />
                                        </Listeners>
                                    </ext:TextField>

                                    <ext:Button runat="server" id="OptionsButton" IconCls="fa fa-cog" ToolTip="Options" ArrowVisible="false">
                                        <Menu>
                                            <ext:Menu runat="server" MinWidth="200">
                                                <Items>
                                                    <ext:MenuItem runat="server" Text="展开菜单" IconCls="icon-expand-all">
                                                        <Listeners>
                                                            <Click Handler="#{exampleTree}.expandAll(false);" />
                                                        </Listeners>
                                                    </ext:MenuItem>

                                                    <ext:MenuItem runat="server" Text="收起菜单" IconCls="icon-collapse-all">
                                                        <Listeners>
                                                            <Click Handler="#{exampleTree}.collapseAll(false);" />
                                                        </Listeners>
                                                    </ext:MenuItem>
                                                    
                                                  <%-- 
                                                         <ext:MenuSeparator runat="server" />

                                                  <ext:MenuItem runat="server" Text="Search by" Icon="Find">
                                                        <Menu>
                                                            <ext:Menu runat="server" MinWidth="200">
                                                                <Items>
                                                                    <ext:CheckMenuItem
                                                                        ID="SearchByTitles"
                                                                        runat="server"
                                                                        Checked="true"
                                                                        Text="Titles" />

                                                                    <ext:CheckMenuItem
                                                                        ID="SearchByTags"
                                                                        runat="server"
                                                                        Checked="true"
                                                                        Text="Tags" />
                                                                </Items>
                                                            </ext:Menu>
                                                        </Menu>
                                                    </ext:MenuItem>--%>

                                                    <%--<ext:MenuItem runat="server" Text="Tag Cloud" Icon="WeatherClouds">
                                                        <Listeners>
                                                            <Click Fn="showTagCloud" />
                                                        </Listeners>
                                                    </ext:MenuItem>--%>
                                                </Items>
                                            </ext:Menu>
                                        </Menu>
                                    </ext:Button>
                                </Items>
                            </ext:Toolbar>
                        </TopBar>

                        <Store>
                            <ext:TreeStore runat="server" OnReadData="GetExamplesNodes">
                                <Proxy>
                                    <ext:PageProxy>
                                        <RequestConfig Method="GET" Type="Load" />
                                    </ext:PageProxy>
                                </Proxy>
                                <Root>
                                    <ext:Node NodeID="Root" Expanded="true" />
                                </Root>
                                <Fields>
                                    <ext:ModelField Name="tags" />
                                    <ext:ModelField Name="flags" />
                                </Fields>
                            </ext:TreeStore>
                        </Store>
                        <ColumnModel>
                            <Columns>
                                <ext:TreeColumn runat="server" DataIndex="text" Flex="1">
                                    <Renderer Fn="treeRenderer" />
                                </ext:TreeColumn>
                            </Columns>
                        </ColumnModel>
                        <Listeners>
                            <ItemClick Handler="onTreeItemClick(record, e);" />
                            <AfterRender Fn="onTreeAfterRender" />
                        </Listeners>
                    </ext:TreePanel>
                </Items>
            </ext:Panel>
            <ext:TabPanel
                ID="ExampleTabs"
                runat="server"
                Region="Center"
                MarginSpec="0"
                Cls="tabs"
                MinTabWidth="115">
                <Items>
                    <ext:Panel
                        ID="tabHome"
                        runat="server"
                        Title="首页"
                        HideMode="Offsets"
                        IconCls="fa fa-home">
                        <Loader runat="server" Mode="Frame" Url="Home/">
                            <LoadMask ShowMask="true" />
                        </Loader>
                    </ext:Panel>
                </Items>
                <Listeners>
                    <TabChange Fn="addToken" />
                </Listeners>
                <Plugins>
                    <ext:TabCloseMenu runat="server" />
                </Plugins>
            </ext:TabPanel>
        </Items>
    </ext:Viewport>

</body>
</html>
