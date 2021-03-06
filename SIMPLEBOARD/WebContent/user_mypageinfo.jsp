<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/custom.css">
    
</head>
<body>
<%@ include file="/include/header.jsp" %>
<section>
        <div class="container">
            <div class="row join-wrap">
                <!--join-form을 적용한다 float해제 margin:0 auto-->
                <div class="col-xs-12 col-md-9 join-form">
                    <form action="updateForm.user" method="post" name="updateForm" id="updateForm">
                    <div class="titlebox">
                        MEMBER INFO                    
                    </div>
                    <p>*표시는 필수 입력 표시입니다</p>
                    <table class="table">
                        <tbody class="m-control">
                            <tr>
                                <td class="m-title">*ID</td>
                                <td><input class="form-control input-sm" type="text" id="id" name="id" placeholder="아이디를 (영문포함 4~12자 이상)" value="${vo.id}" readonly></td>
                            </tr>
                            <tr>
                                <td class="m-title">*이름</td>
                                <td><input class="form-control input-sm" type="text" id="name" name="name" placeholder="이름을 입력하세요." value="${vo.name}"></td>
                            </tr>
                            <tr>
                                <td class="m-title">*비밀번호</td>
                                <td><input class="form-control input-sm" type="password" id="password" name="password" placeholder="비밀번호 (영 대/소문자, 숫자, 특수문자 3종류 이상 조합 8자 이상)" value=""></td>
                            </tr>
                            <tr>
                                <td class="m-title">*비밀번호확인</td>
                                <td><input class="form-control input-sm" type="password" id="passwordConfirm" name="passwordConfirm" placeholder="비밀번호를 확인해주세요." value=""></td>
                            </tr>
                            <tr>
                                <td class="m-title">*E-mail</td>
                                <td>
                                    <input class="form-control input-sm" type="text" id="email1" name="email1" placeholder="" value="${vo.email1}">@
                                    <select class="form-control input-sm sel" id="email2" name="email2">
                                        <option value="naver.com" ${vo.email2=='naver.com'?'selected':''}>naver.com</option>
                                        <option value="gmail.com" ${vo.email2=='gmail.com'?'selected':''}>gmail.com</option>
                                        <option value="daum.net" ${vo.email2=='daum.net'?'selected':''}>daum.net</option>
                                    </select>
                                    <button class="btn btn-info" onclick="alert('중복확인완료')">중복확인</button>
                                </td>
                            </tr>
                            <tr>
                                <td class="m-title">*휴대폰</td>
                                <td>
                                    <input class="form-control input-sm sel" type="text" id="hp1" name="hp1" placeholder="010" value="${vo.hp1}"> -
                                    <input class="form-control input-sm sel" type="text" id="hp2" name="hp2" placeholder="xxxx" value="${vo.hp2}"> -
                                    <input class="form-control input-sm sel" type="text" id="hp3" name="hp3" placeholder="xxxx" value="${vo.hp3}">
                                </td>
                            </tr>
                            <tr>
                                <td class="m-title">*주소</td>
                                <td><input class="form-control input-sm add" type="text" id="addrbasic" name="addrbasic" placeholder="기본주소" value="${vo.addrbasic}"></td>
                            </tr>
                            <tr>
                                <td class="m-title">*상세주소</td>
                                <td><input class="form-control input-sm add" type="text" id="addrdetail" name="addrdetail" placeholder="상세주소" value="${vo.addrdetail}"></td>
                            </tr>
                        </tbody>
                    </table>
                    
                    <div class="titlefoot">
                        <button class="btn" type="button" onclick="check()">수정</button>
                        <button class="btn" type="button" onclick="location.href='mypage.user'">목록</button>
                    </div>
                    </form>
                </div>


            </div>

        </div>

    </section>
<%@ include file="/include/footer.jsp" %>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <script>
		function check() {
			if(document.updateForm.id.value == 0) {
				alert('아이디는 필수사항 입니다');
				document.updateForm.id.focus();
				return;
			} else if(document.updateForm.password.value == 0) {
				alert('비밀번호는 필수사항 입니다');
				document.updateForm.password.focus();
				return;
			} else if(document.updateForm.name.value == 0) {
				alert('이름은 필수사항 입니다');
				document.updateForm.name.focus();
				return;
			} else if(document.updateForm.id.value.length < 4) {
				alert('아이디는 4글자 이상이어야 합니다');
				document.updateForm.id.focus();
				return;
			} else if(document.updateForm.password.value.length < 8) {
				alert('비밀번호는 8글자 이상이어야 합니다');
				document.updateForm.id.focus();
				return;
			} else if(document.updateForm.password.value != document.updateForm.passwordConfirm.value) {
				alert('비밀번호 확인란을 확인하세요');
				document.updateForm.passwordConfirm.focus();
				return;
			} else if( confirm('회원정보를 수정 하시겠습니까?') ) {
				document.updateForm.submit();
			}
		}
	
	</script>
</body>
</html>