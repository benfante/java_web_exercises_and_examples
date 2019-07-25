<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="title" type="java.lang.String" description="The title of the page" rtexprvalue="true" %>
<!doctype html>
<html class="no-js" lang="en">

<head>
<%@ include file="/WEB-INF/frags/head.jspf" %>
</head>

<body>
	<%@ include file="/WEB-INF/frags/preload.jspf" %>
    <!-- page container area start -->
    <div class="page-container">
        <!-- main content area start -->
        <div class="main-content">
			<div class="main-content-inner">
                        
                <!-- MAIN CONTENT GOES HERE -->
				<jsp:doBody/>                
            </div>
        </div>
        <!-- main content area end -->
		<%@ include file="/WEB-INF/frags/footer.jspf" %>
    </div>
    <!-- page container area end -->
    <%@ include file="/WEB-INF/frags/offsetarea.jspf" %>
    <%@ include file="/WEB-INF/frags/javascripts.jspf" %>
</body>
</html>
