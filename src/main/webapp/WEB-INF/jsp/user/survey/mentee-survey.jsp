<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE HTML>
<html>
<!-- Head -->
<c:import url="../../common/head.jsp"/>

<body class="no-sidebar">
	<div id="page-wrapper">

		<!-- Header -->
		<div id="header-wrapper">
			<div id="header">

				<!-- Menu -->
				<c:import url="../../common/menu.jsp"/>

			</div>
		</div>

		<!-- Main -->
		<div id="main-wrapper">
			<div class="container">

				<!--멘티 설문조사-->
				<article id="mentee_survey">
					<a href="#" class="image featured">
                        <img src="../../../res/images/mentee.png" alt="" />
                    </a>

					<header>
						<h2>멘티 설문조사</h2>
					</header>
					<form:form method="post" modelAttribute="menteeSurveyResultList">
                        <c:forEach var="s2" items="${s2}" varStatus="status">
                            <input type="hidden" value="${s2.s2_id}" name="menteeSurveyResultList[${status.index}].s2_id"/>
                            <div>
                                <label>${s2.s2_id}번 항목</label>
                                    ${s2.s2_title}<br>
                                <input type="radio" value="5" name="menteeSurveyResultList[${status.index}].s2_value"/>매우만족&nbsp;&nbsp;
                                <input type="radio" value="4" name="menteeSurveyResultList[${status.index}].s2_value"/>만족&nbsp;&nbsp;
                                <input type="radio" value="3" name="menteeSurveyResultList[${status.index}].s2_value"/>보통&nbsp;&nbsp;
                                <input type="radio" value="2" name="menteeSurveyResultList[${status.index}].s2_value"/>만족하지않음&nbsp;&nbsp;
                                <input type="radio" value="1" name="menteeSurveyResultList[${status.index}].s2_value"/>매우만족하지않음
                                <br><br>
                            </div>
                        </c:forEach>

						<sec:authorize access="hasRole('ROLE_USER')">
							<center>
								<button type="submit" class="button">제출</button>
							</center>
						</sec:authorize>

						<sec:authorize access="hasRole('ROLE_ADMIN')">
							<center>
								<a href="mentee-change" class="button">수정</a>
								<a href="survey" class="button alt">목록으로</a>
							</center>
						</sec:authorize>

						<br/>
					</form:form>
				</article>
			</div>
		</div>

		<!-- Footer -->
		<c:import url="../../common/footer.jsp"/>

	</div>

	<!-- Scripts -->
	<c:import url="../../common/scripts.jsp"/>

</body>

</html>
