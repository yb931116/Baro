<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript"
	src="<c:url value='/resources/sass/ready/components/_tables.scss'/>"></script>
<style>
.customContent {
	background-color: white;
}

.customTable tr {
	height: 50px;
}

.table>tbody>tr>td, .table>tbody>tr>th {
	height: 150px;
}

.colPro {
	width: 300px;
}

.colAns {
	width: 300px;
}

.colNum {
	width: 30px;
}
</style>


<div class="main-panel">
	<div class="content customContent">
		<div class="container-fluid">
			<table class="table customTable">
				<thead>
					<tr>
						<th class="colNum">고유번호</th>
						<th class="colPro">목적 또는 문제점</th>
						<th class="colAns">해결책</th>
						<th class="colNum">원인 고유 번호</th>
						<th class="colPro">부정적 파생 문제점</th>
						<th class="colAns">2차 해결책</th>
						<th class="colNum">행선 고유 번호</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="row" class="colNum">1</th>
						<td class="colPro">R&D기획사업 실적에 대한 사후 실적 관리</td>
						<td class="colAns">R&D 기획사업 실적에 대한 DB수록관리로 공유 조회가 해결된다</td>
						<th scope="row" class="colNum"></th>
						<td class="colPro">R&D기획사업 실적에 대한 요약된 핵심 내용의 부재로 공개비교 및 타분야
							프로젝트 관리DB와의 통합 공유가 되지 않는다</td>
						<td class="colAns">R&D기획사업의 문제점과 해결책만 발췌 실명 DB화 수록</td>
						<th scope="row" class="colNum">5</th>
					</tr>
					<tr>
						<th scope="row" class="colNum">2</th>
						<td class="colPro">경영/행정기획사업 실적에 대한 사후 실적 관리</td>
						<td class="colAns">경영/행정기획사업 실적에 대한 DB수록관리로 공유/조회가 해결된다</td>
						<th scope="row" class="colNum">
						</td>
						<td class="colPro">경영/행정 분야 기획사업실적에 대한 요약된 핵심내용의 부재로 공개비교 및
							타분야 프로젝트 관리 DB와의 통합 공유가 되지 않는다</td>
						<td class="colAns">경영/행정기획사업 의 문제점과 해결책만 발췌 실명 DB화 수록</td>
						<th scope="row" class="colNum">6
						</td>
					</tr>
					<tr>
						<th scope="row">3</th>
						<td class="colPro">산출주체의 특허출원등록 실적의 비교 및 공유</td>
						<td class="colAns">산출주체의 특허출원 내용 중의 문제점과 해결책만 발췌 실명 DB화 수록</td>
						<th scope="row" class="colNum">
						</td>
						<td class="colPro">산출주체의 특허 출원등록 실적에 대한 요약된 핵심내용의 부재로 공개 비교 및
							타분야</td>
						<td class="colAns">산출주체의 특허 출원 내용중 의 문제점과 해결책 만 발췌 실명 DB화 수록</td>
						<th scope="row" class="colNum">7
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>

<script>
	$(function() {
		$("td").hover(function() {
			$(this).css('background-color', '#ebedf2')
		}, function() {
			$(this).css('background-color', 'white')
		});
	});
</script>