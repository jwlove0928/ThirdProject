<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url var="home" value="/" />

<script type="text/javascript">
<!--
function detailView(no){
	document.getElementById('writeNo').value=no;
	document.getElementById('frm').submit();
}

function getSelectValue(){
	document.getElementById('hiddenSelOpt').value = document.getElementById('selectOpt').value;
}
function chkBoxSelect(){
	var chkBox = document.getElementsByName('chkBox');
	var chkAll = document.getElementById('chkAll');
	for (var i = 0; i < chkBox.length; i++) {
		chkBox[i].checked = chkAll.checked;
	}
}
function deleteBoard(home){
	var chkbox = document.getElementsByName('chkBox');
	var deleteNo="";

	for(var i=0;i<chkbox.length;i++){
		if(chkbox[i].checked)
			deleteNo+=chkbox[i].value+" ";
	}
	document.getElementById('deleteNo').value = deleteNo;
	document.getElementById('frm').action=home+"board/deleteBoard";
	document.getElementById('frm').submit();
}
function writeFrm(home){
	document.getElementById('frm').action=home+"writeForm";
	document.getElementById('frm').submit();
}
//-->
</script>
<style>
<!--
.title {
	cursor: pointer;
}
-->
</style>
<form id='frm' action="${home }board/detailRead">
	<input type="hidden" name="writeNo" id="writeNo" />
	<input type="hidden" name="deleteNo" id="deleteNo" />
</form>
<center>
	<table style="width: 650px;">
		<thead>
			<tr>
				<th style="width: 40px; height: 20px;" align="center">선택</th>
				<th style="width: 330px; height: 20px;" align="center">제 목</th>
				<th style="width: 80px; height: 20px;" align="center">작성자</th>
				<th style="width: 120px; height: 20px;" align="center">작성일</th>
				<th style="width: 80px; height: 20px;" align="center">조회수</th>
			</tr>
		</thead>

		<tr>
			<td style="width: 40px; height: 20px;" align="center"><hr /></td>
			<td style="width: 330px; height: 20px;" align="center"><hr /></td>
			<td style="width: 80px; height: 20px;" align="center"><hr /></td>
			<td style="width: 120px; height: 20px;" align="center"><hr /></td>
			<td style="width: 80px; height: 20px;" align="center"><hr /></td>
		</tr>
		<c:forEach var="board" items="${boardLst }">
			<tr>
				<td style="width: 40px; height: 40px;" align="center"><input
					type="checkbox" name="chkBox" value="${board.no}"/></td>
				<td style="width: 330px; height: 40px;" align="center"><div
						class="title" onclick="detailView('${board.no}')">${board.title }</div></td>
				<td style="width: 80px; height: 40px;" align="center">${board.id }</td>
				<td style="width: 120px; height: 40px;" align="center">${board.writedate }</td>
				<td style="width: 80px; height: 40px;" align="center">${board.hit }</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan=5><hr /></td>
		</tr>
		<tr>
			<td colspan=2><input type="checkbox" id='chkAll' onclick="chkBoxSelect()"/>전체선택</td>
			<td colspan=3 align="right"><input type="button" onclick="deleteBoard('${home }')" value='삭제'
				style="width: 100px;" /> <input type="button" onclick="writeFrm('${home }')" value='글쓰기'
				style="width: 100px;" /></td>
		</tr>
		<tr>
			<td colspan=5><hr /></td>
		</tr>
	</table>
	${navi }
	<table>
		<tr>
			<td>
				<form id='selectFrm' action="${home }board/selectBoard">
					<input type="hidden" id='hiddenSelOpt' name='selectOpt' value='all'/> 
					<select id="selectOpt" onchange="getSelectValue()">
						<option value="all">전체</option>
						<option value="title">제목</option>
						<option value="id">작성자</option>
					</select> 
					<input type=text name='searchWord' /> 
					<input type=submit name='searchBtn' value='검색' style="width: 80px;" />
				</form>
			</td>
		</tr>
	</table>
</center>