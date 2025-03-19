<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="flex flex-col h-full bg-white p-6">
    <div class="flex flex-col w-full h-full">
        <!-- 제목 -->
        <div class="font-semibold text-2xl text-gray-600 mb-4">게시판 상세</div>
        <hr class="mb-6">
        <!-- 제목 -->
        <div class="flex py-2 border-b border-gray-300">
            <div class="font-medium text-gray-700">제목 :</div>
            <div class="text-gray-600 ml-4">${data.title}</div>
        </div>

        <!-- 작성자 -->
        <div class="flex py-2 border-b border-gray-300">
            <div class="font-medium text-gray-700">작성자 :</div>
            <div class="text-gray-600  ml-4">${data.author}</div>
        </div>

        <!-- 구분 -->
        <div class="flex py-2 border-b border-gray-300">
            <div class="font-medium text-gray-700 my-auto">구분 :</div>
            <div class="text-gray-600 ml-4 bg-gray-200 py-1 px-2 rounded">${data.type == "NOTICE" ? '공지' : '일반' }</div>
        </div>

        <!-- 작성일자 -->
        <div class="flex py-2 border-b border-gray-300">
            <div class="font-medium text-gray-700">작성일자 :</div>
            <div class="text-gray-600 ml-4">${data.createdAt}</div>
        </div>

        <!-- 내용 -->
        <div class="flex flex-col py-2">
            <div class="font-medium text-gray-700 mb-2">내용</div>
            <div class="border border-gray-300 p-4 rounded bg-gray-50 h-80">
                ${data.content}
            </div>
        </div>
        <div class="ml-auto flex">
        
			<c:if test="${loginUsername == data.author}">
	        	<div id="update_btn" class="underline text-gray-500 hover:text-black p-3">
					<i class="mr-3 fas fa-info-circle" style="color: #9e9e9e;"></i><a href="/main/notice/update_form/${data.id}">수정</a>
				</div>
				<div id="delete_btn" class="underline text-gray-500 hover:text-red-600 p-3">
					<a href="/main/notice/delete/${data.id}">삭제</a>
				</div>
			</c:if>
			<div class="underline text-gray-500 hover:text-black p-3"><a href="/main">목록 으로</a></div>
		</div>
    </div>
</div>


<script>
    $(document).ready(function() {
        $('#delete_btn').on('click', function(event) {
            // 확인 메시지 표시
            var isConfirmed = confirm("정말로 삭제하시겠습니까?");
            
            // 사용자가 '취소'를 클릭한 경우 기본 링크 동작을 취소
            if (!isConfirmed) {
                event.preventDefault();  // 링크 클릭 기본 동작 방지
            }
        });
    });
</script>