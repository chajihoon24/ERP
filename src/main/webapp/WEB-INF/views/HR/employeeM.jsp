<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="flex flex-col">

<div class="bg-white py-2">
    <nav class="flex flex-col sm:flex-row">
        <button class="text-gray-600 block hover:text-gray-500 focus:outline-none text-gray-500 border-b-2 font-medium border-gray-500">
           <a href="/HR/employee_m" class="py-3 px-4">직원 관리</a>
        </button>
        <button class="text-gray-600 block hover:text-blue-500 focus:outline-none">
     		<a href="/HR/department_m" class="py-3 px-4">부서 관리</a>
        </button>
    </nav>
</div>



<div class="my-2 mx-1 p-2">
  		<div class="text-xl text-gray-700">직원 목록</div>
  		<hr>
</div>

<div class="flex items-center space-x-6 bg-gray-100 pl-3 py-1 rounded-lg mt-2">
    <!-- 부서 선택 -->


<label for="name" class="text-gray-700 font-medium">이름:</label>
<input id="name" class="w-32 bg-white border border-gray-300 rounded-lg pl-3 py-2 shadow-sm focus:ring focus:ring-blue-200 focus:border-blue-400 outline-none">
    
    
    <div class="flex items-center space-x-2">
        <label for="department" class="text-gray-700 font-medium">부서:</label>
        <select id="department" name="department" class="bg-white border border-gray-300 rounded-lg px-3 py-2 shadow-sm focus:ring focus:ring-blue-200 focus:border-blue-400">
            <option value="option1">전체</option>
            <option value="option1">인사부</option>
            <option value="option2">개발부</option>
            <option value="option3">경영부</option>
        </select>
    </div>

    <div class="flex items-center space-x-2">
        <label for="department" class="text-gray-700 font-medium">직급:</label>
        <select id="department" name="department" class="bg-white border border-gray-300 rounded-lg px-3 py-2 shadow-sm focus:ring focus:ring-blue-200 focus:border-blue-400">
            <option value="option1">전체</option>
            <option value="option1">사원</option>
            <option value="option2">대리</option>
            <option value="option3">과장</option>
            <option value="option3">차장</option>
            <option value="option3">부장</option>
            <option value="option3">사장</option>
            <option value="option3">임원</option>
        </select>
    </div>
    <!-- 근무지 선택 -->
    <div class="flex items-center space-x-2">
        <label for="location" class="text-gray-700 font-medium">근무지:</label>
        <select id="location" name="location" class="bg-white border border-gray-300 rounded-lg px-3 py-2 shadow-sm focus:ring focus:ring-blue-200 focus:border-blue-400">
            <option value="option1">전체</option>
            <option value="option1">본사(강남)</option>
            <option value="option2">판교</option>
            <option value="option3">수원</option>
        </select>
    </div>
    
<button class="bg-gray-500 text-white py-2 px-4 font-semibold rounded-lg shadow-md hover:bg-gray-400 active:bg-gray-600 focus:outline-none focus:ring-2 focus:ring-gray-400 focus:ring-opacity-75">
  검색
</button>
</div>




<div class="flex flex-col h-full">
  <div class="overflow-x-auto" style="min-height: 452px">
    <div id="employee_list" class="py-2 inline-block min-w-full">
      <div class="overflow-hidden">
        <table class="min-w-full">
          <thead class="bg-white border-b">
            <tr>
              <th scope="col" class="text-sm font-medium text-gray-900 px-6 py-4 text-left">
                No.
              </th>
              <th scope="col" class="text-sm font-medium text-gray-900 px-6 py-4 text-left">
                	이름	
              </th>
              <th scope="col" class="text-sm font-medium text-gray-900 px-6 py-4 text-left">
                부서
              </th>
                            <th scope="col" class="text-sm font-medium text-gray-900 px-6 py-4 text-left">
               직급
              </th>
                            <th scope="col" class="text-sm font-medium text-gray-900 px-6 py-4 text-left">
                재직여부
              </th>
                            <th scope="col" class="text-sm font-medium text-gray-900 px-6 py-4 text-left">
                근무지
              </th>
                                          <th scope="col" class="text-sm font-medium text-gray-900 px-6 py-4 text-left">
                입사일
              </th>
            </tr>
          </thead>
          <tbody>
          <c:forEach var="Employee" items="${EmployeeList}" varStatus="status">
            <tr class="${status.index % 2 != 0 ? 'bg-white' : ''} border-b" onClick="location.href='/HR/employee_m/detail/${Employee.id}?page=${currentPage}'" style="cursor:pointer;">
              <td class="px-6 py-2 whitespace-nowrap text-sm font-medium text-gray-900">${status.index}</td>
              <td class="text-sm text-gray-900 font-light px-6 py-2 whitespace-nowrap">
               ${Employee.name}
              </td>
              <td class="text-sm text-gray-900 font-light px-6 py-2 whitespace-nowrap">
                	경영부
              </td>
              <td class="text-sm text-gray-900 font-light px-6 py-2 whitespace-nowrap">
                ${Employee.position}
              </td>
              <td class="text-sm text-gray-900 font-light px-6 py-2 whitespace-nowrap">
                ${Employee.status == 'ACTIVE'?'재직중':'휴직'}
              </td>
              <td class="text-sm text-gray-900 font-light px-6 py-2 whitespace-nowrap">
               ${Employee.workLocation}
              </td>
               <td class="text-sm text-gray-900 font-light px-6 py-2 whitespace-nowrap">
               ${Employee.hireDate}
              </td>
            </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>
    </div>
    
    <div class="flex-grow flex justify-center items-center mt-4 space-x-2 text-gray-700 min-h-[50px] underline">
    <!-- 처음 페이지 -->
    <a href="?page=1" class="px-3 py-1 border rounded-lg bg-gray-100 hover:bg-gray-200">
        First
    </a>

    <!-- 페이지 번호 -->
    <c:forEach var="i" begin="1" end="${totalPages}" varStatus="status">
        <a href="?page=${i}" 
           class="px-3 py-1 border rounded-lg 
                  <c:if test='${currentPage == i}'>bg-gray-300 font-bold</c:if> 
                  hover:bg-gray-200">
            ${i}
        </a>
    </c:forEach>

    <!-- 끝 페이지 -->
    <a href="?page=${totalPages}" class="px-3 py-1 border rounded-lg bg-gray-100 hover:bg-gray-200">
      End  
    </a>
</div>
    
    
    
    
    
  </div>
  
  
 <!-- 아래 컴포넌트 ===================================================================== -->
<div class="flex mt-4 flex-grow w-full" style="height: 50vh ">

<!-- 상세 보기 -->
	<div class="bg-white p-4 w-full h-full mr-4 rounded shadow-md">
	    <div class="mx-1 p-2">
	        <div class="text-xl font-semibold text-gray-700">직원 상세 정보</div>
	        <hr class="my-2">
	
	        <div class="grid grid-cols-2 gap-10 text-gray-700 mt-2">
	            <!-- 왼쪽 정보 -->
	            <div class="space-y-5">
	                <div><span class="font-medium">이름:</span> ${employee.name}</div>
	                <div><span class="font-medium">직급:</span> ${employee.position}</div>
	                <div><span class="font-medium">주민번호:</span> ${employee.rrn}</div>
	                <div><span class="font-medium">연락처:</span> ${employee.tel}</div>
	                <div><span class="font-medium">이메일:</span> ${employee.email}</div>
	            </div>
	
	            <!-- 오른쪽 정보 -->
	            <div class="space-y-5">
	                <div><span class="font-medium">주소:</span> ${employee.address}</div>
	                <div><span class="font-medium">입사일:</span> ${employee.hireDate}</div>
	                <div><span class="font-medium">퇴사일:</span> ${employee.resignationDate != null ? Employee.resignationDate : '재직중'}</div>
	                <div><span class="font-medium">근무지:</span> ${employee.workLocation}</div>
	            </div>
	        </div>
	    </div>
	</div>
	
	<div class="bg-white p-2 w-full h-full rounded">
		<div class="mx-1 p-2">
	  		<div class="text-xl text-gray-700">직원 등록</div>
	  	    <hr>
	</div>

</div>
 <!-- =============================================================================== -->
      

  	
</div>  	

</div>


  
  
  
  
