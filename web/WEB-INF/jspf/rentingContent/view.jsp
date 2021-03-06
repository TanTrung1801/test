<%-- 
    Document   : view
    Created on : Jun 20, 2022, 5:21:39 PM
    Author     : nguye
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<jsp:useBean id='HostelDAO' class='daos.HostelDAO' scope='page'/>


<c:set var="HostelList" value="${HostelDAO.getList('owner_id', sessionScope.loginId.toString())}"/>
    
    
<c:choose>
    <c:when test="${(HostelList != null) and (not empty HostelList)}">
        <div>
            <c:forEach var="hostel" items="${HostelList}">
                <div onclick="window.location = '${pageContext.request.contextPath}/home/owning/hostels/${hostel.hostelSlug}'">
                    <h3>${hostel.name}</h3>
                    <p>${hostel.street} - ${hostel.ward} - ${hostel.district} - ${hostel.city}</p>
                </div>
                <div class ="line"></div>
            </c:forEach>
        </div>
    </c:when>
    <c:otherwise>
        <span><c:out value="you don't renting any rooms"/></span>
    </c:otherwise>
</c:choose>
