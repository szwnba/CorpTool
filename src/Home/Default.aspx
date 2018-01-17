<%@ Page Language="C#" %>

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
                            <img src="../resources/images/extnet-mobile-final.svg">
                        </div>
                        <div class="notification-text">
                           Web Test Tool是一个<strong>在线测试工具系统</strong>，集合了一些常用的测试工具.
                        </div>
                    </div>
                </div>

                <h1> 更新日志： 
                    <span> 2018-01-02<span class="blue">神盾加密解密工具</span></span>
                    <span>2018-01-01<span class="blue">Redis值读取工具</span></span>
                </h1>
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
                <h2></h2>

                <h3>常用工具网站连接</h3>
                <ul class="popular-links">
                    <li><a href="/#/GridPanel/ArrayGrid/ArrayWithPaging/">商旅一站式测试系统</a></li>
                    <li><a href="/#/Events/DirectEvents/Overview/">DirectEvents</a></li>
                    <li><a href="/#/Events/DirectMethods/Overview/">DirectMethods</a></li>
                    <li><a href="/#/Viewport/Basic/Built_in_Markup/">Viewport</a></li>
                    <li><a href="/#/XRender/Basic/Add_Items/">XRender</a></li>
                    <li><a href="/#/Chart/Area/Basic/">Chart</a></li>
                </ul>

            </div>
        </Content>
    </ext:Container>

</body>
</html>
