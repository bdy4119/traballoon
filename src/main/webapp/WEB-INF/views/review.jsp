<%@page import="java.util.List"%>
<%@page import="mul.cam.a.util.Utility"%>
<%@page import="mul.cam.a.dto.BbsDto"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>SemiProject</title>

    <%--BootStrap--%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">

    <style>
        .b-example-divider {
            height: 3rem;
            background-color: rgba(0, 0, 0, .1);
            border: solid rgba(0, 0, 0, .15);
            border-width: 1px 0;
            box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
        }
    </style>

</head>

<body>
<%--container--%>
<div class="container">
    <main>

        <%--헤더--%>
        <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
            <a href="/" class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none">
                <img src="images/logo.png">
            </a>

            <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
                <li><a href="/localtravel.do" class="nav-link px-2 link-dark">지역별 여행</a></li>
                <li><a href="/hotel.do" class="nav-link px-2 link-dark">숙소 추천</a></li>
                <li><a href="/review.do" class="nav-link px-2 link-dark">여행 리뷰</a></li>
                <li><a href="/community.do" class="nav-link px-2 link-dark">커뮤니티</a></li>
            </ul>


            <div class="col-md-3 text-end">
                <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
                    <li><a href="/mypage.do" class="nav-link px-2 link-dark">마이페이지</a></li>
                    <li>
                        <button type="button" class="btn btn-outline-primary me-2">Login</button>
                    </li>
                    <li>
                        <button type="button" class="btn btn-primary">Sign-up</button>
                    </li>
                </ul>
            </div>
        </header>
        <%--헤더--%>

        <%--공백--%>
        <div class="b-example-divider"></div>

        <%--내용--%>
        <h1>여행리뷰 내용</h1>
        <%
		/* String choice = request.getParameter("choice");
		String search = request.getParameter("search");
		int pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		
		if(choice == null) {
			choice = "";
		}
		if(search == null) {
			search = "";
		} */
		
		
	//	Bbsdao dao = Bbsdao.getInstance();
		
	//	List<bbsDTO> list = dao.getBbsList();
	//	List<bbsDTO> list = dao.getBbsSearchList(choice, search);
		
		List<BbsDto> list = (List<BbsDto>)request.getAttribute("bbsList");
		int pageBbs = (Integer)request.getAttribute("pageBbs");
		int pageNumber = (Integer)request.getAttribute("pageNumber");
		String choice = (String)request.getAttribute("choice");
		String search = (String)request.getAttribute("search");
		%>
	
		
		
		<div align="center">
		<!-- 검색 -->
			<select id="choice">
				<option value="">검색</option>
				<option value="title">제목</option>
				<option value="content">내용</option>
				<option value="writer">작성자</option>
			</select>
			
			<input type="text" id="search" value="<%=search %>">
			
			<button type="button" onclick="searchBtn()">검색</button>
		<!-- 검색 끝 -->
		
		<br>
		<br>
			<table border="1">
				<col width="70">
				<col width="600">
				<col width="100">
				<col width="150">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>조회수</th>
						<th>작성자</th>
					</tr>
				</thead>
				<tbody>
					<%
					if(list == null || list.size() == 0) {
						%>
						<tr>
							<td colspan="4">작성된 글이 없습니다.</td>
						</tr>
						<%
					} else {
						for(int i = 0; i < list.size(); i++) {
							BbsDto dto = list.get(i);
						%>
						<tr>
							<th><%=i + 1 + (pageNumber * 10) %></th>
						<%
						if(dto.getDel() == 0){
							%>			
							<td>
								<%=Utility.arrow(dto.getDepth()) %>
								<a href="bbsdetail.do?seq=<%=dto.getSeq() %>">
									<%=dto.getTitle() %>
								</a>
							</td>			
							<%
						}else if(dto.getDel() == 1){
							%>
							<td>
								<%=Utility.arrow(dto.getDepth()) %>
								<font color="#ff0000">*** 이 글은 작성자에 의해서 삭제되었습니다 ***</font>	
							</td>
							<%
						}	
						%>
						
						<td><%=dto.getReadcount() %></td>
						<td><%=dto.getId() %></td>
					</tr>
							<%
						}
					}
					%>
				</tbody>
			</table>
			<br>
			<br>
		</div>
        
        <%--내용--%>

    </main>

    <%--공백--%>
    <div class="b-example-divider"></div>

    <%--푸터--%>
    <footer class="d-flex flex-wrap justify-content-between align-items-center py-3 my-4 border-top">
        <div class="col-md-4 d-flex align-items-center">
            <span class="mb-3 mb-md-0 text-muted">&copy; 2023 Multi campus, Semi project</span>
        </div>
    </footer>
    <%--푸터--%>

</div>
<%--container--%>

<%--BootStrap--%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous">
</script>
<%--BootStrap--%>

</body>
</html>
