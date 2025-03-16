<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="h-full bg-white p-4 mt-4">
    <div class="text-xl text-gray-600 mb-2">사용자 등록</div>
    <hr class="mb-4">

    <form action="/admin/insertUser" method="post">
        <!-- Username 입력 -->
        <div class="mb-4">
            <label for="username" class="block text-sm font-medium text-gray-700">아이디</label>
            <input type="text" id="username" name="username" class="mt-1 p-2 w-1/2 border border-gray-300 rounded-md" required maxlength="50" placeholder="아이디 입력">
            <button type="button" id="checkUsername" class="mt-2 py-1 px-3 bg-gray-400 text-white rounded-md hover:bg-gray-500">중복 확인</button>
            <span id="usernameError" class="text-red-500 text-sm hidden">이미 존재하는 아이디입니다.</span>
        </div>

        <!-- Password 입력 -->
        <div class="mb-4">
            <label for="password" class="block text-sm font-medium text-gray-700">비밀번호</label>
            <input type="password" id="password" name="password" class="mt-1 p-2 w-1/2 border border-gray-300 rounded-md" required maxlength="255" placeholder="비밀번호 입력">
        </div>

        <!-- Password Confirm 입력 -->
        <div class="mb-4">
            <label for="passwordConfirm" class="block text-sm font-medium text-gray-700">비밀번호 확인</label>
            <input type="password" id="passwordConfirm" name="passwordConfirm" class="mt-1 p-2 w-1/2 border border-gray-300 rounded-md" required maxlength="255" placeholder="비밀번호 확인">
            <span id="passwordError" class="text-red-500 text-sm hidden pl-4">비밀번호가 일치하지 않습니다.</span>
        </div>

        <!-- Name 입력 -->
        <div class="mb-4">
            <label for="name" class="block text-sm font-medium text-gray-700">이름</label>
            <input type="text" id="name" name="name" class="mt-1 p-2 w-1/2 border border-gray-300 rounded-md" required maxlength="45" placeholder="이름 입력">
        </div>

        <!-- Email 입력 -->
        <div class="mb-4">
            <label for="email" class="block text-sm font-medium text-gray-700">이메일</label>
            <input type="email" id="email" name="email" class="mt-1 p-2 w-1/2 border border-gray-300 rounded-md" required maxlength="100" placeholder="이메일 입력">
        </div>

        <!-- Role 선택 -->
        <div class="mb-4">
            <label for="role" class="block text-sm font-medium text-gray-700">권한</label>
            <select id="role" name="role" class="mt-1 p-2 w-1/2 border border-gray-300 rounded-md" required>
                <option value="ADMIN">관리자</option>
                <option value="USER">사용자</option>
            </select>
        </div>

        <!-- Status 선택 -->
        <div class="mb-4">
            <label for="status" class="block text-sm font-medium text-gray-700">상태</label>
            <select id="status" name="status" class="mt-1 p-2 w-1/2 border border-gray-300 rounded-md" required>
                <option value="ACTIVE">활성</option>
                <option value="INACTIVE">비활성</option>
            </select>
        </div>

        <!-- Submit 버튼 -->
        <div class="mt-4">
            <button id="resister_btn" type="submit" class="py-2 px-4 bg-gray-400 text-white rounded-md hover:bg-gray-500 ml-auto">등록</button>
        </div>
    </form>
</div>

<script>

$(document).ready(function() {
    // 중복 아이디 확인
    $("#checkUsername").click(function() {
        var username = $("#username").val();

        if (username === "") {
            alert("아이디를 입력해주세요.");
            return;
        }

        // Ajax 요청을 보내서 중복 아이디 체크 (여기서는 예시로 1초 뒤에 성공/실패 처리)
        $.ajax({
            url: '/admin/checkUsername', // 중복 체크 API URL
            type: 'POST',
            data: { username: username },
            success: function(response) {
                if (response.exists) {
                    $("#usernameError").removeClass("hidden");
                } else {
                    $("#usernameError").addClass("hidden");
                }
            },
            error: function() {
                alert("서버 오류가 발생했습니다.");
            }
        });
    });

    // 비밀번호 확인
    $("#passwordConfirm").on("keyup", function() {
        var password = $("#password").val();
        var passwordConfirm = $("#passwordConfirm").val();

        if (password !== passwordConfirm) {
            $("#passwordError").removeClass("hidden");
        } else {
            $("#passwordError").addClass("hidden");
        }
    });

    // 폼 제출 시 처리
    $("form").submit(function(event) {
        // 아이디 중복 체크가 안 됐거나 비밀번호가 일치하지 않으면 폼 제출을 막음
        var usernameErrorVisible = $("#usernameError").is(":visible");
        var passwordErrorVisible = $("#passwordError").is(":visible");

        if (usernameErrorVisible || passwordErrorVisible) {
            event.preventDefault(); // 폼 제출을 막음
            alert("모든 입력 필드를 올바르게 입력해주세요.");
        } else {
            // 제출 전에 추가로 다른 검증 로직을 여기에 추가할 수 있습니다.
        }
    });
});
</script>