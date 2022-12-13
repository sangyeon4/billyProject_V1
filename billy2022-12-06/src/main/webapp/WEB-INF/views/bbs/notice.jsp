<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
 <style>
        html, body{
            padding: 0;
            margin: 0;
        }
        .container{
            display: flex;
            height: 100%;
            justify-content: center;
            align-items: center;
        }

        /* 배너 컨테이너 */
        .rollingbanner{
            position: relative;
            width: 500px;
            height: 30px;
            font-size: 15px;
            letter-spacing: 1px;
            padding: 5px 15px;
            box-sizing: border-box;
            background-color: #f0f0f0;
            border-radius: 16px;
        }
        /* 타이틀 */
        .rollingbanner > .title{
            font-weight: bold;
            float: left;
            padding-right: 10px;
        }
        /* 롤링 배너 */
        .rollingbanner > .wrap{
            position: relative;
            width: auto;
            height: 100%;
            box-sizing: border-box;
            overflow: hidden;
        }        
        .rollingbanner ul{
            list-style: none;
        }
        .rollingbanner li{
            position: absolute;
            top: -36px;
            left: 0;
        }
        /* 이전, 현재, 다음 롤링 배너 표시 */
        .rollingbanner li.prev{
            top: 36px;
            transition: top 0.5s ease;
        }
        .rollingbanner li.current{
            top: 0;
            transition: top 0.5s ease;
        }
        .rollingbanner li.next{
            top: -36px;
        }
        .rollingbanner a{
            display: block;
            display: -webkit-box;
            text-decoration: none;
            -webkit-line-clamp: 1;
            -webkit-box-orient:vertical;
            overflow: hidden;
            color: #000;
        }
        /* 반대 방향으로 진행 */
        .rollingbanner.reverse li.prev{
            top: -36px;
            transition: top 0.5s ease;
        }
        .rollingbanner.reverse li.next{
            top: 36px;
        }
    </style>
    <script>
        document.addEventListener('DOMContentLoaded', ()=>{
            var interval = window.setInterval(rollingCallback, 3000);
        })
        function rollingCallback(){
            //.prev 클래스 삭제
            document.querySelector('.rollingbanner .prev').classList.remove('prev');

            //.current -> .prev
            let current = document.querySelector('.rollingbanner .current');
            current.classList.remove('current');
            current.classList.add('prev');

            //.next -> .current
            let next = document.querySelector('.rollingbanner .next');
            //다음 목록 요소가 널인지 체크
            if(next.nextElementSibling == null){
                document.querySelector('.rollingbanner ul li:first-child').classList.add('next');
            }else{
                //목록 처음 요소를 다음 요소로 선택
                next.nextElementSibling.classList.add('next');
            }
            next.classList.remove('next');
            next.classList.add('current');
        }
    </script>
</head>
<body>
	<%@ page import="com.billy.VO.*"%>
    <div class="container">
        <div class="rollingbanner">
            <div class="title">공지사항 > </div>
            <div class="wrap">            
                <ul>
                <%
                	out.print("<li><a href='billyNoticeView?bnNum="+5+"'>billy 가족이 되신 것을 환영합니다!</a></li>");
                	out.print("<li class='next'><a href='billyNoticeView?bnNum="+4+"'>들린다 들려 합격의 소리</a></li>");
                	out.print("<li class='current'><a href='billyNoticeView?bnNum="+3+"'>billy 가족에게 폭언을 하지마세요</a></li>");
                	out.print("<li><a href='billyNoticeView?bnNum="+2+"'>대여기간을 준수합니다</a></li>");
                	out.print("<li class='prev'><a href='billyNoticeView?bnNum="+1+"'>공사중~</a></li>");
                 %>
             	</ul>
            </div>
        </div>
    </div>
</body>
</html>