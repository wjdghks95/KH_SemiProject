<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="or.com.board.*, java.util.*" %>
<jsp:useBean id="bMgr" class="or.com.board.BoardMgr" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta author="JeongHwanLee">
    <meta description="점심시간 전까지 각자 먹고 싶은 메뉴를 취합하고 투표를 통해 점심 메뉴를 정할 수 있는 웹 어플리케이션">
    <link rel="shortcut icon" href="resource/icon/favicon.png">
    <link rel="stylesheet" href="resource/css/style.css">
    <link rel="stylesheet" href="resource/css/pop-up.css">
    <script src="https://code.jquery.com/jquery-3.6.2.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            if(document.URL.indexOf("#")==-1){
                url = document.URL+"#";
                location = "#";
                location.reload(true);
            }
        });
        </script>
    <title>투표 현황</title>
</head>
<body>
    <main>
        <section class="pop-up">
            <div class="container">
                <table class="pop-up__content">
                    <caption class="section__heading"> 투표 현황 </caption>
                    <thead>
                        <tr>
                            <th width="30%"> 메뉴 </th>
                            <th width="70%"> 득표수 </th>
                        </tr>
                    </thead>
                    <tbody>
                	<%
						ArrayList<BoardBean> bList = bMgr.getBoardList();
						int listSize = bList.size();
						int sum = bMgr.sumCount();
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
                <div class="pop-up__content__close">
                    <a href="javascript:window.close();" class="pop-up__content__close-link">닫기</a>
                </div>
            </div>
        </section>
        <!-- pop-up -->
    </main>
</body>
</html>