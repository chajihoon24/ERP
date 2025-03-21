<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="flex flex-col h-full bg-white p-6">
    <div class="flex flex-col w-full h-full">
        <!-- 제목 -->
        <div class="font-semibold text-2xl text-gray-600 mb-4">직원 등록</div>
        <hr class="mb-6">

        <!-- 폼 -->
<form class="space-y-4 h-full" id="employeeForm">
    <!-- 이름 -->
    <div class="flex items-center">
        <label for="name" class="w-32 font-medium text-gray-700">이름</label>
        <input id="name" value="${employee.name}"
            class="border-b border-gray-300 focus:border-b-2 focus:border-blue-500 p-2 w-64 transition-all duration-300 focus:outline-none"
            placeholder="이름을 입력하세요" required>
    </div>

    <!-- 이메일 -->
    <div class="flex items-center">
        <label for="email" class="w-32 font-medium text-gray-700">이메일</label>
        <input id="email" type="email" value="${employee.email}"
            class="border-b border-gray-300 focus:border-b-2 focus:border-blue-500 p-2 w-64 transition-all duration-300 focus:outline-none"
            placeholder="이메일을 입력하세요" required>
    </div>

    <!-- 주민등록번호 -->
    <div class="flex items-center">
        <label for="rrn" class="w-32 font-medium text-gray-700">주민등록번호</label>
        <input id="rrn" value="${employee.rrn}"
            class="border-b border-gray-300 focus:border-b-2 focus:border-blue-500 p-2 w-64 transition-all duration-300 focus:outline-none"
            placeholder="주민등록번호를 입력하세요">
    </div>

    <!-- 상태 -->
	<div class="flex items-center">
	    <label for="status" class="w-32 font-medium text-gray-700">상태</label>
	    <select id="status"
	        class="border-b border-gray-300 focus:border-b-2 focus:border-blue-500 p-2 w-40 transition-all duration-300 focus:outline-none"
	        onchange="toggleResignationDate()">
	        <option value="ACTIVE" ${employee.status == 'ACTIVE' ? 'selected' : ''}>재직중</option>
	        <option value="INACTIVE" ${employee.status == 'INACTIVE' ? 'selected' : ''}>퇴사</option>
	        <option value="ON_LEAVE" ${employee.status == 'ON_LEAVE' ? 'selected' : ''}>휴직</option>
	    </select>
	</div>

<!-- 퇴사일 입력란 (숨겨짐) -->

    <!-- 입사일 -->
    <div class="flex items-center">
        <label for="hireDate" class="w-32 font-medium text-gray-700">입사일</label>
        <input id="hireDate" type="text" value="${employee.hireDate}"
            class="border-b border-gray-300 focus:border-3 focus:border-black p-2 w-40 transition-all duration-300 focus:outline-none"
            required>
    </div>
    
	<div class="flex items-center" id="resignationDateContainer" style="display: none;">
	    <label for="resignationDate" class="w-32 font-medium text-gray-700">퇴사일</label>
	    <input id="resignationDate" type="text" value="${employee.resignationDate}"
	        class="border-b border-gray-300 focus:border-3 focus:border-black p-2 w-40 transition-all duration-300 focus:outline-none"
	        required>
	</div>

    <!-- 근무 위치 -->
    <div class="flex items-center">
        <label for="workLocation" class="w-32 font-medium text-gray-700">근무지</label>
             <select id="workLocation"
            class="border-b border-gray-300 focus:border-b-2 focus:border-blue-500 p-2 w-40 transition-all duration-300 focus:outline-none">
            <option value="강남(본사)" ${employee.status == '강남(본사)' ? 'selected' : ''}>강남(본사)</option>
            <option value="판교" ${employee.status == '판교' ? 'selected' : ''}>판교</option>

        </select>
    </div>

    <!-- 직책 -->
    <div class="flex items-center">
        <label for="position" class="w-32 font-medium text-gray-700">직책</label>
        <select id="position"
            class="border-b border-gray-300 focus:border-b-2 focus:border-blue-500 p-2 w-40 transition-all duration-300 focus:outline-none">
            <option value="INTERN" ${employee.position == 'INTERN' ? 'selected' : ''}>인턴</option>
            <option value="JUNIOR" ${employee.position == 'JUNIOR' ? 'selected' : ''}>사원</option>
            <option value="ASSOCIATE" ${employee.position == 'ASSOCIATE' ? 'selected' : ''}>대리</option>
            <option value="SENIOR" ${employee.position == 'SENIOR' ? 'selected' : ''}>과장</option>
            <option value="MANAGER" ${employee.position == 'MANAGER' ? 'selected' : ''}>차장</option>
            <option value="DIRECTOR" ${employee.position == 'DIRECTOR' ? 'selected' : ''}>부장</option>
            <option value="EXECUTIVE" ${employee.position == 'EXECUTIVE' ? 'selected' : ''}>임원</option>
            <option value="CEO" ${employee.position == 'CEO' ? 'selected' : ''}>사장</option>
        </select>
    </div>

    <!-- 주소 -->
    <div class="flex items-center">
        <label for="address" class="w-32 font-medium text-gray-700">주소</label>
        <input id="address" value="${employee.address}"
            class="border-b border-gray-300 focus:border-b-2 focus:border-blue-500 p-2 w-1/2 transition-all duration-300 focus:outline-none"
            placeholder="주소를 입력하세요">
    </div>

    <!-- 전화번호 -->
    <div class="flex items-center">
        <label for="tel" class="w-32 font-medium text-gray-700">전화번호</label>
        <input id="tel" value="${employee.tel}"
            class="border-b border-gray-300 focus:border-b-2 focus:border-blue-500 p-2 w-64 transition-all duration-300 focus:outline-none"
            placeholder="전화번호를 입력하세요">
    </div>

    <!-- 비고 -->
    <div class="flex">
        <label for="notes" class="w-32 font-medium text-gray-700">비고</label>
        <textarea id="notes"
            class="border border-gray-300 focus:border-b-2 focus:border-blue-500 p-2 w-1/2 h-80 transition-all duration-300 focus:outline-none"
            placeholder="비고를 입력하세요">${employee.notes}
    </textarea>
    </div>

    <!-- Submit 버튼 -->
    <div class="flex justify-end">
    	<div class="w-1/2">
	        <button id="submit_btn" type="submit"
	            class="bg-gray-500 text-white py-2 px-4 rounded-lg hover:bg-gray-600 focus:outline-none focus:ring-2 focus:ring-gray-500 ml-32 mt-3">
	           	 등록
	        </button>
        </div>
    </div>
</form>




    </div>
</div>

<script>
window.onload = function() {
    toggleResignationDate(); // 페이지 로드 시 상태에 따라 퇴사일 입력란을 표시하거나 숨김
}

$(document).ready(function() {
    $("#submit_btn").click(function(event) {
        event.preventDefault(); // 폼 제출 기본 동작 방지

        let employee = {
        	    id: ${employee.id},
        	    name: $('#name').val(),
        	    email: $('#email').val(),
        	    age: ${employee.age},
        	    rrn: $('#rrn').val(),
        	    status: $('#status').val(),
        	    hireDate: $('#hireDate').val() ? $('#hireDate').val() : null,
        	   /*  resignationDate: $('#status').val() === 'INACTIVE' ? ($('#resignationDate').val() ? $('#resignationDate').val() : null) : null, */
        	    workLocation: $('#workLocation').val(),
        	    position: $('#position').val(),
        	    address: $('#address').val(),
        	    tel: $('#tel').val(),
        	    notes: $('#notes').val()
        	};
        
        
        
		console.log(JSON.stringify(employee))
        

        // 필드 유효성 검사
        if (!employee.name || !employee.email) {
            alert("이름과 이메일을 입력하세요.");
            return;
        }
        // 추가 유효성 검사 예시: 이메일 형식 검사

        // 데이터 전송
        $.ajax({
            url: '/HR/employee_m/update', // 엔드포인트 URL 설정
            type: 'PATCH',
            contentType: 'application/json', // 서버로 JSON 형식의 데이터를 보냄
            data: JSON.stringify(employee), // JSON 형식으로 데이터를 전송
            success: function(response) {
                alert("수정되었습니다.");
                location.href = "/HR/employee_m"; // 성공 시 페이지 리다이렉션
            },
            error: function(xhr) {
                alert("직원 등록 중 오류가 발생했습니다. 다시 시도해주세요."+xhr.responseText);
            }
        });
    });
});

function toggleResignationDate() {
    const status = document.getElementById('status').value; // 상태 선택값 가져오기
    const resignationDateContainer = document.getElementById('resignationDateContainer');

    // 상태가 'INACTIVE'일 때만 퇴사일 입력란을 표시
    if (status === 'INACTIVE') {
        resignationDateContainer.style.display = 'flex'; // 퇴사일 입력란 표시
    } else {
        resignationDateContainer.style.display = 'none'; // 퇴사일 입력란 숨김
    }
}

</script>
