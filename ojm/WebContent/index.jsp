<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="or.com.board.*, or.com.member.*, java.util.*" %>
<jsp:useBean id="bMgr" class="or.com.board.BoardMgr" />
<jsp:useBean id="mMgr" class="or.com.member.MemberMgr" />
<%
	request.setCharacterEncoding("UTF-8");
	Long id = session.getAttribute("key") != null ? (Long) session.getAttribute("key") : null;
	
	int totalRecord = 0; 	// 전체 레코드 수
	int numPerPage = 10; 	// 1페이지당 레코드 수
	int pagePerBlock = 5; 	// 블록당 페이지 수
	
	int totalPage = 0; 		// 전체 페이지 수
	int totalBlock = 0;		// 전체 블록 수
	
	int nowPage = 1; // 현재 해당하는 페이지
	
	if(request.getParameter("nowPage") != null) {
		nowPage = Integer.parseInt(request.getParameter("nowPage")); 
	}
	int nowBlock = 1; 		// 현재 해당하는 블록
	
	int start = 0; 			// DB테이블의 select 시작번호(페이지에 해당하는 레코드수만 가져오기)
	int end = 0; 			// 10개씩 가져오기
	int listSize = 0;		// 현재 읽어온 게시물의 수
	
	String keyword = "";
	ArrayList<BoardBean> bList = null;
	if(request.getParameter("keyword") != null) {
		keyword = request.getParameter("keyword");
	}
	
	start = (nowPage * numPerPage)-numPerPage + 1; 					// 각 페이지당 시작번호
	end = nowPage * numPerPage; 									// 각 페이지의 끝 번호
	totalRecord = bMgr.getTotalCount(keyword); 						// 전체 레코드 수
	totalPage = (int) Math.ceil((double)totalRecord / numPerPage);  // 전체 페이지 수
	nowBlock = (int) Math.ceil((double)nowPage / pagePerBlock); 	// 현재 블록
	totalBlock = (int) Math.ceil((double)totalPage / pagePerBlock); // 전체 블록수
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="resource/icon/favicon.png">
    <link rel="stylesheet" href="resource/css/style.css">
    <link rel="stylesheet" href="resource/css/index.css">
    <script src="https://code.jquery.com/jquery-3.6.2.min.js"></script>
    <script src="resource/js/index.js?ver=2"></script>
    <title>오점뭐?</title>
</head>
<body>
    <%@ include file="common/header.jsp" %>
    <!-- header -->
    
    <nav class="nav">
	    <div class="container">
	        <ul class="nav__menu">
	            <li class="nav__item">
	                <a href="index.jsp" class="nav__link active">오점뭐</a>
	            </li>
	            <li class="nav__item">
	                <a href="calendar.jsp" class="nav__link">어점뭐</a>
	            </li>
	        </ul>
	    </div>
	</nav>
	<!-- nav -->
    
    <main class="home">
        <div class="container">
            <section class="timer">
                <header class="section__headings">
                    <h2 class="section__heading--big timer__heding"></h2>
                    <p class="timer__timer">
                        <span class="timer__hours"></span>
                        <span class="timer__minutes"></span>
                        <span class="timer__seconds"></span>
                        <span class="timer__millisecond"></span>
                    </p>
                    <p class="timer__menu"></p>
                </header>
            </section>
            <!-- timer -->
    
            <section class="menu">
                <h2 class="section__heading">오늘의 메뉴</h2>
                <article class="section__content">
                    <table class="menu__list">
                        <thead class="menu__list-head">
                            <tr>
                                <th width="10%">No</th>
                                <th width="60%">제목</th>
                                <th width="20%">작성시간</th>
                                <th width="10%">조회수</th>
                            </tr>
                        </thead>
                        <tbody class="menu__list-body">
                            <%
                            	
	                            bList = bMgr.pagingBoardList(keyword, start, end);
	                        	listSize =  bList.size();
                            	if(bList.isEmpty()) {
                            		out.print("<tr><td colspan='4'>등록된 게시물이 없습니다</td></tr>");	
                            	} else {
                            		for(int i=0; i<listSize; i++) {
                            			if(i == listSize)
                            				break;
                            			
                            			BoardBean bean = bList.get(i);
                            			Long board_id = bean.getBoard_id();
                            			String menu = bean.getMenu();
                            			String content = bean.getContent();
                            			String created_date = bean.getCreated_date().substring(11, bean.getCreated_date().length()-3);
                            			int views = bean.getViews();
                         	%>
                         				<tr>
			                                <td><%=totalRecord-(nowPage-1)*numPerPage -i %></td>
			                                <td><a href="board.jsp?id=<%=board_id %>"><%=menu %></a></td>
			                                <td><%=created_date %></td>
			                                <td><%=views %></td>
                           				 </tr>
                         	<%
                            		}
                            	}
                            %>
                        </tbody>
                    </table>
                </article>
                <div class="search">
                    <form action="index.jsp" method="get" class="search__form">
                        <input type="search" name="keyword">
                        <button type="submit" class="search__btn">
                            <img src="resource/icon/search.png" alt="search">
                        </button>
                    </form>
                </div>
                <div class="pagination">
                <%
					int pageStart = (nowBlock-1) * pagePerBlock + 1;
					int pageEnd = (pageStart + pagePerBlock <= totalPage) ? (pageStart + pagePerBlock) : totalPage + 1;
					
					if(totalPage != 0) {
						if(nowBlock > 1) { %>
							<button class="pagination__prev" onClick="location.href='index.jsp?keyword=<%=keyword %>&nowPage=<%=pagePerBlock*((nowBlock-1)-1)+1%>'">
	                        	<img src="resource/icon/arrow-left.png" alt="left">
	                    	</button>
					<%	}
						for(;pageStart < pageEnd; pageStart++) {	%>
							<%if(pageStart == nowPage) { %>
								<button class="pagination__btn active" onClick="location.href='index.jsp?keyword=<%=keyword %>&nowPage=<%=pageStart %>'"></button>
							<%} else { %>
								<button class="pagination__btn" onClick="location.href='index.jsp?keyword=<%=keyword %>&nowPage=<%=pageStart %>'"></button>
							<%} %>
					<%	}
						if(totalBlock > nowBlock) { %>
							<button class="pagination__next" onClick="location.href='index.jsp?keyword=<%=keyword %>&nowPage=<%=pagePerBlock*((nowBlock+1)-1)+1%>'">
		                        <img src="resource/icon/arrow-right.png" alt="next">
		                    </button>
				<%  	}
					}
				%>            
                </div>
			<%
              	if(id != null) {
           	%>
	           		<div class="menu__links">
	           			<button onClick="location.href='vote.jsp'" class="link-btn">투표하기</button>
	           			<button onClick="location.href='boardForm.jsp'" class="link-btn">메뉴등록</button>
	                </div>
	           	<%
		           	MemberBean member = mMgr.findById(id);
	           		if(member.getBoard_chk() == '1') {
	          	%>
	          			<script type="text/javascript">
		    				$('.menu__links > .link-btn:last-child').on('click', function() {
								alert('메뉴는 한가지만 등록할 수 있습니다.');
							});
		    			</script>
	          	<%		
	           		}
	           		if(member.getVote_chk() == '1') {
        		%>
        				<script type="text/javascript">
		    				$('.menu__links > .link-btn:first-child').on('click', function() {
		    					alert('투표는 한 번만 가능합니다.');
		    				});
		    			</script>
	           	<%
	           		}
             	}
             %>
                <input type="hidden" name="menu" value="">
            </section>
        </div>
    </main>
    <!-- menu -->

    <section class="vote-rs">
        <div class="container">
            <table class="vote-rs__content">
                <caption class="section__heading"> 투표 결과 </caption>
                <thead>
                    <tr>
                        <th width="30%"> 메뉴 </th>
                        <th width="70%"> 득표수 </th>
                    </tr>
                </thead>
                <tbody>
                    <%
						int sum = bMgr.sumCount();
                    	bList = bMgr.getBoardList();
                    	listSize = bList.size();
						for(int i=0; i<listSize; i++) {
							if(i == listSize)
								break;
							
							BoardBean bean = bList.get(i);
							String menu = bean.getMenu();
							
							Random r = new Random();
							int rgb = r.nextInt(255*255*255);
							String rgbt = Integer.toHexString(rgb);
							String hRGB = "#" + rgbt;
							
							int count = bean.getCount();
							int ratio = (int) Math.ceil((double) count / sum * 100);
					%>
							<tr>
	                            <th> <%=menu %> </th>
	                            <td>
	                                <table class="ratio" width="100%">
	                                    <tr>
	                                    	<td bgcolor="<%=hRGB %>" width="<%=ratio %>%"></td>
	                                    	<td width="100%" align="right"><%=ratio %>%</td>
                                    	</tr>
	                                </table>
	                            </td>
                        	</tr>
					<%
						}
					%>
                </tbody>
            </table>
        </div>
    </section>
    <!-- vote-rs -->

	<%@ include file="common/footer.jsp" %>
    <!-- footer -->
</body>
</html>