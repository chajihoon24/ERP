<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="flex flex-col h-full bg-white p-6">
    <div class="flex flex-col w-full h-full">
        <!-- 제목 -->
        <div class="font-semibold text-2xl text-gray-600 mb-4">게시판 등록</div>
        <hr class="mb-6">

        <!-- 폼 -->
        <form class="space-y-4 h-full" id="form">
            <!-- Title 입력 -->
            <div class="flex flex-col">
                <label for="title" class="font-medium text-gray-700 mb-2">Title</label>
                <input id="title" class="border border-gray-300 p-2 w-64 focus:outline-none focus:ring-2 focus:ring-blue-500" placeholder="제목을 입력하세요" required>
            </div>

            <!-- Author 입력 -->
            <div class="flex flex-col">
                <div class="font-medium text-gray-700 mb-2">Author</div>
                <div id="author" class="p-2 bg-gray-300 rounded inline-block w-full sm:w-64">ckwlgns24</div>
            </div>

            <!-- Category 선택 -->
            <div class="flex flex-col">
                <label for="type" class="font-medium text-gray-700 mb-2">Category</label>
                <select id="type" class="border border-gray-300 p-2 w-32 focus:outline-none focus:ring-2 focus:ring-blue-500">
                    <option value="NOTICE">공지</option>
                    <option value="GENERAL">일반</option>
                </select>
            </div>

            <!-- Content 입력 -->
            <div class="flex flex-col">
                <label for="content" class="font-medium text-gray-700 mb-2">Content</label>
                <textarea id="content" class="border border-gray-300 rounded-lg p-2 w-full h-80 focus:outline-none focus:ring-2 focus:ring-blue-500" placeholder="내용을 입력하세요" required></textarea>
            </div>

            <!-- Submit 버튼 -->
            <div class="flex justify-end">
                <button id="insert_btn" type="submit" class="bg-blue-500 text-white py-2 px-4 rounded-lg hover:bg-blue-600 focus:outline-none focus:ring-2 focus:ring-blue-500">
                    등록
                </button>
            </div>
        </form>
    </div>
</div>
<script>
$(document).ready(function() {
    $("#insert_btn").click(function(event) {
        event.preventDefault(); // 폼 제출 기본 동작을 막음

        const title = $("#title").val();
        const author = $("#author").text();  // 텍스트로 author 가져오기
        const type = $("#type").val();
        const content = $("#content").val();

        // 유효성 검사
        if (!title || !content) {
            alert("제목과 내용을 입력해주세요.");
            return;
        }

        // 데이터 확인 (콘솔에 출력)
        console.log("Title:", title);
        console.log("Author:", author);
        console.log("Category:", type);
        console.log("Content:", content);

        // 일반 폼 데이터 형식으로 전송
        $.ajax({
            url: '/main/notice/perform',  // 데이터 전송할 URL
            type: 'POST',
            contentType: 'application/x-www-form-urlencoded',  // 전송할 데이터 형식
            data: {
                title: title,
                author: author,
                type: type,
                content: content
            },
            success: function(response) {
                alert("게시물이 등록되었습니다.");
                location.href = "/main"; 
                // 등록 후 필요한 작업
            },
            error: function(xhr, status, error) {
                alert("게시물 등록에 실패했습니다. 다시 시도해주세요.");
            }
        });
    });
});	
</script>
