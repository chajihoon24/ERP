<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="bg-white py-2">
    <nav class="flex flex-col sm:flex-row">
        <button class="text-gray-600 block hover:text-blue-500 focus:outline-none">
           <a href="/HR/employee_m" class="py-3 px-4">직원 관리</a>
        </button>
        <button class="text-gray-600 block hover:text-blue-500 focus:outline-none text-gray-500 border-b-2 font-medium border-gray-500">
     <a href="/HR/department_m" class="py-3 px-4">부서 관리</a>
        </button>

    </nav>
</div>

<div class="my-4 mx-1 p-2">
    <div class="text-xl text-gray-700">부서 목록</div>
    <hr>

    <div class="flex">
        <div class="w-1/2 h-screen">
            <div class="m-2 bg-white h-full flex shadow-lg">
    <div class="block w-full overflow-x-auto">
      <table class="items-center bg-transparent w-full border-collapse ">
        <thead>
          <tr>
            <th class="px-6 bg-blueGray-50 text-blueGray-500 align-middle border border-solid border-blueGray-100 py-3 text-xs uppercase border-l-0 border-r-0 whitespace-nowrap font-semibold text-left">
                         일련번호
                        </th>
                      <th class="px-6 bg-blueGray-50 text-blueGray-500 align-middle border border-solid border-blueGray-100 py-3 text-xs uppercase border-l-0 border-r-0 whitespace-nowrap font-semibold text-left">
                         부서명
                        </th>
          <th class="px-6 bg-blueGray-50 text-blueGray-500 align-middle border border-solid border-blueGray-100 py-3 text-xs uppercase border-l-0 border-r-0 whitespace-nowrap font-semibold text-left">
                          생성일자
                        </th>
                    <th class="px-6 bg-blueGray-50 text-blueGray-500 align-middle border border-solid border-blueGray-100 py-3 text-xs uppercase border-l-0 border-r-0 whitespace-nowrap font-semibold text-left">
                          
                        </th>
          </tr>
        </thead>

        <tbody>
			<c:forEach var="n" items="${data}" varStatus="status">
			    <tr class="${status.index % 2 == 0 ? 'bg-gray-100' : ''}">
			        <th class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4 text-left text-blueGray-700">
			            ${n.id}
			        </th>
			        <td class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4">
			            ${n.name}
			        </td>
			        <td class="border-t-0 px-6 align-center border-l-0 border-r-0 text-xs whitespace-nowrap p-4 underline">
			            ${n.createdAt}
			        </td>
			        <td class="border-t-0 px-6 align-center border-l-0 border-r-0 text-xs whitespace-nowrap p-4 hover:underline hover:text-red-500">
			            <a id="deleteDepartment_btn" href="/HR/department_m/delete/${n.id}" class="p-1">X</a>
			        </td>
			    </tr>
			</c:forEach>
        </tbody>
      </table>
    </div>
            </div>
        </div>
<div class="w-1/2 h-screen flex bg-gray-100">
    <div class="m-4 bg-white h-60 w-full max-w-md p-6 rounded-2xl shadow-lg">
        <div class="mb-4">
            <label for="name" class="block text-lg font-medium text-gray-700 mb-2">부서명</label>
            <input 
                type="text" 
                id="name" 
                placeholder="부서명을 입력하세요" 
                class="w-full p-3 border border-gray-300 rounded-lg shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
            />
        </div>

        <!-- 버튼 추가 -->
        <button id="insert_btn"
            type="submit"
            class="w-full bg-gray-500 text-white font-medium py-3 rounded-lg shadow-sm hover:bg-gray-600 focus:outline-none focus:ring-2 focus:ring-gray-500 focus:ring-offset-2 transition duration-200"
        >
            등록
        </button>
    </div>
</div>
    </div>
</div>


<script>
$(document).ready(function() {
    // 삭제 버튼 클릭 시 확인 메시지 표시
    $("#deleteDepartment_btn").click(function(e) {
        e.preventDefault(); // 링크 기본 동작 방지
        
        if (confirm("삭제 하시겠습니까?")) {
            window.location.href = $(this).attr('href'); // 확인 시 삭제 수행
        }
    });
    
    
    $("#insert_btn").click(function(e){
    	e.preventDefault();
    	
    	let department = $("#name").val();
    	
    	
    	
    	$.ajax({
    	    url: '/HR/department_m/insert',
    	    type: 'POST',
    	    contentType: 'application/json',
    	    data: JSON.stringify({ name: department }),  // JSON.stringify로 JSON 문자열 변환
    	    success: function (response) {
    	        alert("부서가 추가되었습니다.");
    	        location.href = "/HR/department_m";  // 페이지 새로고침
    	    },
    	    error: function (xhr, status, error) {
    	        alert("부서 추가에 실패했습니다: " + xhr.responseText);
    	    }
    	});
    	
    })
    
    
    
    
    
});




</script>

