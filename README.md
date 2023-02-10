# 오늘 점심 뭐 먹지?

### 🤔아이디어 선정 동기

다수의 인원이 다 같이 점심을 먹게 되면 서로 좋아하고 먹고 싶은 메뉴가 다르기 때문에 의견이 충돌하거나 서로 배려하다가 소중한 점심시간을 다 보내게 된다.
그럴 때 필요한 건 언제나 다수결의 원칙이다. 점심시간 전까지 점심 메뉴를 취합하여 투표를 진행하고 점심시간을 맞이한다면 우리의 소중한 점심시간은 메뉴정하는 데 허비되지 않지 않을까?

### 🚩목표
점심시간 전까지 각자 먹고 싶은 메뉴를 취합하고 투표를 통해 점심 메뉴를 정할 수 있는 웹 어플리케이션 개발

### ✏️요구사항
| NO | 요구사항명 | 요구사항 상세설명 | 비고 |
| --- | --- | --- | --- |
| 1 | 남은시간 계산 | - 점심시간까지 남은시간을 계산하여 홈 화면에 표시 <br>※ 점심시간 12시 20분 |  |
| 2 | 투표 시간 | - 투표 시간은 아침 6시부터 점심시간 시작 전까지 가능 <br> → 투표 시간이 지나면 투표를 할 수 없고 아침 6시가 되면 모두 초기화 되어 다시 투표를 진행 |  |
| 3 | 메뉴 리스트 | - 점심시간 이전에는 홈 화면에 메뉴 리스트를 표시 |  |
| 4 | 당첨 메뉴 | - 점심시간 이후에는 홈 화면에 당첨 메뉴를 표시 |  |
| 5 | 메뉴 검색 | - 검색창에 키워드를 입력하여 등록되어 있는 메뉴를 검색 가능 |  |
| 6 | 메뉴 등록 | - 점심시간 전까지 원하는 메뉴를 한 계정당 한 개씩 등록 가능 <br> - 점심시간이 지나면 등록할 수 없음 |  |
| 7 | 투표 | - 점심시간 전까지 원하는 메뉴를 선택하여 투표 (2개 까지 선택 가능) <br> - 점심시간이 지나면 투표할 수 없음 |  |
| 8 | 투표 현황 | - 투표 완료 후 투표 현황을 보여주는 창을 띄움 <br> - 투표 시간이 지나면 홈 화면에 투표 현황 표시 |  |
| 9 | 메뉴 수정 | - 로그인 한 계정이 메뉴를 등록한 계정인 경우 메뉴를 수정할 수 있음 <br> ※ 메뉴 수정 시 득표수는 초기화 |  |
| 10 | 댓글 | - 로그인 한 계정은 메뉴 상세 페이지에 댓글을 작성할 수 있음 <br> - 댓글에 대댓글을 무한으로 작성 가능 |  |
| 11 | 음식점 위치 | - 메뉴를 등록하면서 음식점 위치를 같이 등록 <br> - 메뉴 상세페이지에서 음식점 위치를 볼 수 있음 | 카카오 map API https://apis.map.kakao.com/web/ |
| 12 | 로그인 | - 이메일 아이디와 비밀번호로 로그인할 수 있도록 함 |  |
| 13 | 회원가입 | - 회원가입시 아이디, 비밀번호, 이름, 생년월일, 성별, 이메일을 입력해야함 <br> - 비밀번호는 특수문자를 포함한 문자와 숫자 8~12자로 구성 <br> - 비밀번호를 한번 더 입력하여 확인하고 일치해야 회원가입 가능 <br> - 이메일 입력 후 이메일 인증 필요 (인증을 완료하지 않으면 가입 불가능) |  |
| 14 | 어점뭐 | - 캘린더에 날짜별로 당첨된 메뉴를 표시하여 보여주는 어점뭐(어제 점심은 뭐였지?) 페이지 |  |


### 💡주요 기능
- ✅ 메뉴 등록 및 검색
- ✅ 위치 등록 (카카오 map API)
- ✅ 투표하기
- ✅ 점심 메뉴 캘린더 (어점뭐?)

### ✔️ERD
<img src=/erd/오점뭐_ERD.png>

### 🔨사용기술
<div style="display: flex; align-items: center; margin-bottom: 12px;">
<strong style="display: inline-block; margin-right: 6px;">Frontend: </strong> 
<img src="https://img.shields.io/badge/HTML-E34F26?style=for-the-badge&logo=HTML5&logoColor=white" style="display: inline-block; margin-right: 6px;">
<img src="https://img.shields.io/badge/CSS-1572B6?style=for-the-badge&logo=CSS3&logoColor=white" style="display: inline-block; margin-right: 6px;">
<img src="https://img.shields.io/badge/JAVASCRIPT-F7DF1E?style=for-the-badge&logo=JavaScript&logoColor=white" style="display: inline-block; margin-right: 6px;">
<img src="https://img.shields.io/badge/jQUERY-0769AD?style=for-the-badge&logo=jQuery&logoColor=white" style="display: inline-block; margin-right: 6px;">
</div>

<div style="display: flex; align-items: center; margin-bottom: 12px;">
<strong style="display: inline-block; margin-right: 6px;">Backend: </strong> 
<img src="https://img.shields.io/badge/JAVA-5283a3?style=for-the-badge&logo=data:image/svg+xml;base64,PHN2ZyBzdHlsZT0iY29sb3I6IHdoaXRlIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAzODQgNTEyIj48IS0tISBGb250IEF3ZXNvbWUgRnJlZSA2LjEuMSBieSBAZm9udGF3ZXNvbWUgLSBodHRwczovL2ZvbnRhd2Vzb21lLmNvbSBMaWNlbnNlIC0gaHR0cHM6Ly9mb250YXdlc29tZS5jb20vbGljZW5zZS9mcmVlIChJY29uczogQ0MgQlkgNC4wLCBGb250czogU0lMIE9GTCAxLjEsIENvZGU6IE1JVCBMaWNlbnNlKSBDb3B5cmlnaHQgMjAyMiBGb250aWNvbnMsIEluYy4gLS0+PHBhdGggZD0iTTI3Ny43NCAzMTIuOWM5LjgtNi43IDIzLjQtMTIuNSAyMy40LTEyLjVzLTM4LjcgNy03Ny4yIDEwLjJjLTQ3LjEgMy45LTk3LjcgNC43LTEyMy4xIDEuMy02MC4xLTggMzMtMzAuMSAzMy0zMC4xcy0zNi4xLTIuNC04MC42IDE5Yy01Mi41IDI1LjQgMTMwIDM3IDIyNC41IDEyLjF6bS04NS40LTMyLjFjLTE5LTQyLjctODMuMS04MC4yIDAtMTQ1LjhDMjk2IDUzLjIgMjQyLjg0IDAgMjQyLjg0IDBjMjEuNSA4NC41LTc1LjYgMTEwLjEtMTEwLjcgMTYyLjYtMjMuOSAzNS45IDExLjcgNzQuNCA2MC4yIDExOC4yem0xMTQuNi0xNzYuMmMuMSAwLTE3NS4yIDQzLjgtOTEuNSAxNDAuMiAyNC43IDI4LjQtNi41IDU0LTYuNSA1NHM2Mi43LTMyLjQgMzMuOS03Mi45Yy0yNi45LTM3LjgtNDcuNS01Ni42IDY0LjEtMTIxLjN6bS02LjEgMjcwLjVhMTIuMTkgMTIuMTkgMCAwIDEtMiAyLjZjMTI4LjMtMzMuNyA4MS4xLTExOC45IDE5LjgtOTcuM2ExNy4zMyAxNy4zMyAwIDAgMC04LjIgNi4zIDcwLjQ1IDcwLjQ1IDAgMCAxIDExLTNjMzEtNi41IDc1LjUgNDEuNS0yMC42IDkxLjR6TTM0OCA0MzcuNHMxNC41IDExLjktMTUuOSAyMS4yYy01Ny45IDE3LjUtMjQwLjggMjIuOC0yOTEuNi43LTE4LjMtNy45IDE2LTE5IDI2LjgtMjEuMyAxMS4yLTIuNCAxNy43LTIgMTcuNy0yLTIwLjMtMTQuMy0xMzEuMyAyOC4xLTU2LjQgNDAuMkMyMzIuODQgNTA5LjQgNDAxIDQ2MS4zIDM0OCA0MzcuNHpNMTI0LjQ0IDM5NmMtNzguNyAyMiA0Ny45IDY3LjQgMTQ4LjEgMjQuNWExODUuODkgMTg1Ljg5IDAgMCAxLTI4LjItMTMuOGMtNDQuNyA4LjUtNjUuNCA5LjEtMTA2IDQuNS0zMy41LTMuOC0xMy45LTE1LjItMTMuOS0xNS4yem0xNzkuOCA5Ny4yYy03OC43IDE0LjgtMTc1LjggMTMuMS0yMzMuMyAzLjYgMC0uMSAxMS44IDkuNyA3Mi40IDEzLjYgOTIuMiA1LjkgMjMzLjgtMy4zIDIzNy4xLTQ2LjkgMCAwLTYuNCAxNi41LTc2LjIgMjkuN3pNMjYwLjY0IDM1M2MtNTkuMiAxMS40LTkzLjUgMTEuMS0xMzYuOCA2LjYtMzMuNS0zLjUtMTEuNi0xOS43LTExLjYtMTkuNy04Ni44IDI4LjggNDguMiA2MS40IDE2OS41IDI1LjlhNjAuMzcgNjAuMzcgMCAwIDEtMjEuMS0xMi44eiIgZmlsbD0id2hpdGUiPjwvcGF0aD48L3N2Zz4=&logoColor=white" style="display: inline-block; margin-right: 6px;">
<img src="https://img.shields.io/badge/JSP-000000?style=for-the-badge&logo=&logoColor=white" style="display: inline-block; margin-right: 6px;">
<img src="https://img.shields.io/badge/SERVELT-ba4d4b?style=for-the-badge&logo=&logoColor=white" style="display: inline-block; margin-right: 6px;">
<img src="https://img.shields.io/badge/JDBC-0073b3?style=for-the-badge&logo=&logoColor=white" style="display: inline-block; margin-right: 6px;">
</div>


<div style="display: flex; align-items: center; margin-bottom: 12px;">
<strong style="display: inline-block; margin-right: 6px;">Database: </strong> 
<img src="https://img.shields.io/badge/ORACLE-F80000?style=for-the-badge&logo=Oracle&logoColor=white" style="display: inline-block; margin-right: 6px;">
</div>

### ⚡Advanced Feature
#### 메뉴 목록 페이징
- index.jsp
```java
<%
request.setCharacterEncoding("UTF-8");
Long id = session.getAttribute("key") != null ? (Long) session.getAttribute("key") : null;

int totalRecord = 0; // 전체 레코드 수
int numPerPage = 10; // 1페이지당 레코드 수
int pagePerBlock = 5; // 블록당 페이지 수

int totalPage = 0; // 전체 페이지 수
int totalBlock = 0; // 전체 블록 수

int nowPage = 1; // 현재 해당하는 페이지

if(request.getParameter("nowPage") != null) {
    nowPage = Integer.parseInt(request.getParameter("nowPage")); 
}
int nowBlock = 1; // 현재 해당하는 블록

int start = 0; // DB테이블의 select 시작번호(페이지에 해당하는 레코드수만 가져오기)
int end = 0; // 10개씩 가져오기
int listSize = 0; // 현재 읽어온 게시물의 수

String keyword = "";
ArrayList<BoardBean> bList = null;
if(request.getParameter("keyword") != null) {
    keyword = request.getParameter("keyword"); // 검색 키워드
}

start = (nowPage * numPerPage)-numPerPage + 1; // 각 페이지당 시작번호
end = nowPage * numPerPage; // 각 페이지의 끝 번호
totalRecord = bMgr.getTotalCount(keyword); // 전체 레코드 수
totalPage = (int) Math.ceil((double)totalRecord / numPerPage); // 전체 페이지 수
nowBlock = (int) Math.ceil((double)nowPage / pagePerBlock); // 현재 블록
totalBlock = (int) Math.ceil((double)totalPage / pagePerBlock); // 전체 블록수
%>

...

<tbody class="menu__list-body">
    <%
    bList = bMgr.pagingBoardList(keyword, start, end); // 게시글 목록 페이징
        listSize =  bList.size();
            // 게시글이 없는 경우
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
                    <td><%=totalRecord-(nowPage-1)*numPerPage -i %></td> // no
                    <td><a href="board.jsp?id=<%=board_id %>"><%=menu %></a></td> // 제목
                    <td><%=created_date %></td> // 작성시간
                    <td><%=views %></td> // 조회수
                </tr>
    <%
            }
        }
%>
</tbody>

...

<div class="pagination">
    <%
        int pageStart = (nowBlock-1) * pagePerBlock + 1; // 페이지 시작 번호 = (현재 블록 - 1) * 블록당 페이지 수 + 1
        int pageEnd = (pageStart + pagePerBlock <= totalPage) ? (pageStart + pagePerBlock) : totalPage + 1; // 페이지 끝 번호 = (페이지 시작 번호 + 블록당 페이지 수 <= 전체 페이지수) ? (페이지 시작 번호 + 블록당 페이지 수) : 전체 페이지수 + 1
        
        if(totalPage != 0) {
            if(nowBlock > 1) { %>
                <button class="pagination__prev" onClick="location.href='index.jsp?keyword=<%=keyword %>&nowPage=<%=pagePerBlock*((nowBlock-1)-1)+1%>'">
                    <img src="resource/icon/arrow-left.png" alt="left">
                </button>
        <%  }
            for(;pageStart < pageEnd; pageStart++) {	%>
                <%if(pageStart == nowPage) { %>
                    <button class="pagination__btn active" onClick="location.href='index.jsp?keyword=<%=keyword %>&nowPage=<%=pageStart %>'"></button>
                <%} else { %>
                    <button class="pagination__btn" onClick="location.href='index.jsp?keyword=<%=keyword %>&nowPage=<%=pageStart %>'"></button>
                <%} %>
        <%  }
            if(totalBlock > nowBlock) { %>
                <button class="pagination__next" onClick="location.href='index.jsp?keyword=<%=keyword %>&nowPage=<%=pagePerBlock*((nowBlock+1)-1)+1%>'">
                    <img src="resource/icon/arrow-right.png" alt="next">
                </button>
    <%      }
        }
    %>            
</div>
```

### 🔥개선사항
- 보안, 예외 처리