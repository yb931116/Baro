<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<html>
<head>
<tiles:insertAttribute name="layout.header" />
</head>
<body>
 <div id="wrapper">
			<tiles:insertAttribute name="layout.top" />
			<tiles:insertAttribute name="layout.sidebar" />
		<tiles:insertAttribute name="layout.body" />
		<tiles:insertAttribute name="layout.footer" />
    </div>
    

</body>
</html>