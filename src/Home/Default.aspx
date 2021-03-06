﻿<%@ Page Language="C#" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="<%= "../resources/css/main.css?" + Corp.Tool.Web.ExtNetVersion.Full %>" />

    <script>
        Ext.onReady(function () {
            if (top !== self) {
                Ext.select("a", true).on("click", function (e, el) {
                    if (!Ext.fly(el).hasCls("exclude")) {
                        parent.location = el.href;
                    }
                }, null, { preventDefault: true });
            }
        });
    </script>
</head>
<body class="welcome">
    <ext:ResourceManager runat="server" Theme="Triton" />

    <ext:Container runat="server">
        <Content>
            <div class="container">
                <div class="extnet-notification">
                    <div class="notification-container">
                        <div class="notification-img">
                            <img src="../resources/images/banner.png">
                        </div>
                        <div class="notification-text" id="TestCL">
                           <strong>Test Tool Online</strong>是一个在线测试工具系统，集合了一些常用的测试工具.
                        </div>
                    </div>
                </div>

                <h2> 最近更新： <br />
                    <span> 2018-02-02<span class="blue">桌面端工具迁移至网页版</span></span><br />

                </h2>
            <%--    <div class="welcome-cards">

                    <div class="welcome-card">
                        <div class="welcome-card-icon">
                            <img src="../resources/icons/docs.svg" />
                        </div>
                        <div class="welcome-card-title">Getting Started</div>
                        <div class="welcome-card-body">
                            <p>
                                Learning Ext.NET is very easy. <a href="/#/Getting_Started/Introduction/Installation/">Watch these videos</a>
                                to learn how to install Ext.NET or start browsing the <a href="http://docs.ext.net/">Ext.NET API documentation</a>.
                            </p>
                        </div>
                    </div>

                    <div class="welcome-card">
                        <div class="welcome-card-icon">
                            <img src="../resources/icons/support.svg" />
                        </div>
                        <div class="welcome-card-title">Support</div>
                        <div class="welcome-card-body">
                            <p>
                                We are proud to have a large <a href="http://forums.ext.net/">developer community</a> for exchanging information as well
                                as <a href="http://ext.net/store/#benefits">Premium Support</a> with a maximum 24h response time.
                            </p>
                        </div>
                    </div>

                    <div class="welcome-card">
                        <div class="welcome-card-icon">
                            <img src="../resources/icons/download.svg" />
                        </div>
                        <div class="welcome-card-title">Download</div>
                        <div class="welcome-card-body">
                            <p>
                                You can <a href="http://ext.net/download/">download</a> Ext.NET and start testing it locally right away. In order to deploy and use it
                                for commercial projects, you will need to <a href="http://ext.net/store/">get a license</a>.
                            </p>
                        </div>
                    </div>

                </div>--%>
                 <br />
                <h3>其它常用网站连接</h3>
                <ul class="popular-links">
                    <li><a href="http://ct.uat.qa.nt.ctripcorp.com/apitroubleshootingsys/">商旅一站式测试系统</a></li>
                    <li><a href="http://ws.soa.dev.nt.ctripcorp.com/test-tool/">SOA 2.0服务测试工具</a></li>
                    <li><a href="http://soa.dev.sh.ctriptravel.com/SOA.TESTTOOL/default.aspx">WebService Test Tool</a></li>
                </ul>

            </div>
        </Content>
    </ext:Container>

</body>
</html>
