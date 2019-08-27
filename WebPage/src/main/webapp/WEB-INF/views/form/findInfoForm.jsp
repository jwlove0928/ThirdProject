<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="home" value="/"/>
<!-- findInfoForm -->

<html>
<form action="${home }member/findInfoProc" method="post">
<div align="center">
<table>
	<c:set var="btnName" value="아이디 검색"/>
	<c:if test='${path eq "/member/searchPW"}'>
		<c:set var="btnName" value="패스워드 검색"/>
		<tr>
		<td align="right">ID : </td>
		<td><input type="text" name="id"/><br/></td>
		</tr>
	</c:if>
		<tr>
			<td>이메일 : </td>
			<td> <input type="text" name="email"/><br/></td>
		</tr>
		<tr>
			<td colspan="2" align="center"><input type="submit" value="${btnName }"/></td>
		</tr>
</table>
</div>
</form>

</body>
</html>








