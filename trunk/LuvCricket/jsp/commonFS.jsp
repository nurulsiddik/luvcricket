<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="content-type" content="text/html;charset=utf-8" />
		<title>Welcome to Luv Cricket</title>
	</head>
        <%
            String jsp_name = request.getParameter("jspname");
            jsp_name = "/LuvCricket"+jsp_name;
        %>
	<frameset rows="52,*" border="0" frameborder="no" framespacing="0">
		<frame name="banner"  src="/LuvCricket/jsp/banner.jsp" noresize="noresize" scrolling="no" />
		<frame name="main" src="<%=jsp_name%>" />
		<noframes>
			<body>Browser does not support frames</body>
		</noframes>
	</frameset>

</html>