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
    <div class="container">
        <div class="rollingbanner">
            <div class="title">공지사항 > </div>
            <div class="wrap">            
                <ul>		              
                    <li><a href="http://www.naver.com"></a></li>
                    <li class="next"><a href="http://www.google.com">공사중~ 구글</a></li>
                    <li class="current"><a href="https://www.google.com/search?q=휴먼교육센터">"일본 정부, 사도광산 세계유산 추천 방침 굳혀, 일본과 갈등 첨예화 예상"</a></li>
                    <li><a href="#">"공법변경 구조검토 요구, 현산 측이 묵살했다"</a></li>
                    <li class="prev"><a href="#">12월 주담대 금리 연 3.63%…7년7개월 만에 최고</a></li>
                </ul>
            </div>
        </div>
    </div>
</body>
</html>