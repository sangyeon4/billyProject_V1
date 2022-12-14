<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
    </head>
    <style>
        #pwdChangeArea {
            width: 500px;
            height: 400px;
            margin: 0 auto;
        }

        h5 {
            text-align: center;
        }

        #pwdChange {
            margin-left: 150px;
        }

        #emailChk {
            margin-left: 150px;
        }
    </style>

    <body>
        <%@ include file="../bbs/bootstrap.jsp" %>
            <%@ include file="../bbs/header.jsp" %>
                <%@ include file="../bbs/nav.jsp" %>
                    <section id="pwdChangeArea">
                        <h5>비밀번호를 변경해 주세요</h5>
                        <h5>billy 아이디 : ${id}</h5>
                        <form name="frm" action="pwdModAction" method="POST">
                            <div id="pwdChange">
                                <input type="hidden" value="${id}" name="id" id="id">
                                <input type="password" name="pwd" id="pwd" class="form-control"
                                    aria-describedby="pwdHelpInline" placeholder="비밀번호는 8-20자 영문,숫자,특수문자를 포함하여야 합니다"
                                    maxlength="20">
                                <span id="pwdHelpInline" class="form-text"></span>
                                <input type="password" name="pwdChk" id="pwdChk" class="form-control"
                                    aria-describedby="pwdChkHelpInline" maxlength="20">
                                <span id="pwdChkHelpInline" class="form-text"></span>
                                <br>
                                <input type="button" onclick="pwdformChk()" class="btn btn-primary" value="비밀번호 변경하기">
                            </div>
                        </form>
                    </section>




                    <%@ include file="../bbs/footer.jsp" %>

    </body>
    <script>
        function pwdformChk() {
            //--비밀번호
            var inPwd = document.getElementById('pwd').value;
            if (inPwd == "") {   //비밀번호값이 없다면 넘어가지않게
                document.getElementById('pwdHelpInline').innerHTML = "<span style='color: red;'>비밀번호를 입력해주세요.</span>";
                return false;
            }
            var chkPwd = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$!@#$%/^&*?<>|+=}{])[A-Za-z\d$!@#$%/^&*?<>|+=}{]{8,20}$/;
            if (!chkPwd.test(inPwd)) {   //유효성 어긋나면 넘어가지않게
                document.getElementById('pwdHelpInline').innerHTML = "<span style='color: red;'>비밀번호형식이 맞지않습니다.</span>";
                return false;
            }

            //--비밀번호확인
            var inPwdChk = document.getElementById('pwdChk').value;
            if (inPwdChk == "") {   //비밀번호확인값이 없다면 넘어가지않게
                document.getElementById('pwdChkHelpInline').innerHTML = "<span style='color: red;'>비밀번호를 한번 더 입력해주세요.</span>";
                return false;
            }
            if (inPwd != inPwd) {   //일치하지않는다면 넘어가지않게
                document.getElementById('pwdChkHelpInline').innerHTML = "<span style='color: red;'>비밀번호가 일치하지 않습니다!</span>";
                return false;
            }

            //--모든게 만족하면 submit해라
            document.frm.submit();
        }


    </script>

    </html>