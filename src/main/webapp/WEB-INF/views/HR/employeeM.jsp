<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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


<div class="my-4 mx-1 p-2">
  		<div class="text-xl text-gray-700">직원 목록</div>
  		<hr>
</div>

<div class="flex items-center space-x-6 bg-gray-100 pl-3 py-1 rounded-lg mt-7">
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
    
<button class="bg-gray-500 text-white py-2 px-4 text-lg font-semibold rounded-lg shadow-md hover:bg-gray-400 active:bg-gray-600 focus:outline-none focus:ring-2 focus:ring-gray-400 focus:ring-opacity-75">
  검색
</button>
</div>




<div class="flex flex-col">
  <div class="overflow-x-auto">
    <div class="py-2 inline-block min-w-full">
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
                나이
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
            <tr class="bg-gray-100 border-b">
              <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">${status.index}</td>
              <td class="text-sm text-gray-900 font-light px-6 py-4 whitespace-nowrap">
               ${Employee.name}
              </td>
              <td class="text-sm text-gray-900 font-light px-6 py-4 whitespace-nowrap">
                ${Employee.age}
              </td>
              <td class="text-sm text-gray-900 font-light px-6 py-4 whitespace-nowrap">
                경영부
              </td>
              <td class="text-sm text-gray-900 font-light px-6 py-4 whitespace-nowrap">
                ${Employee.position}
              </td>
              <td class="text-sm text-gray-900 font-light px-6 py-4 whitespace-nowrap">
                ${Employee.status}
              </td>
              <td class="text-sm text-gray-900 font-light px-6 py-4 whitespace-nowrap">
               ${Employee.workLocation}
              </td>
               <td class="text-sm text-gray-900 font-light px-6 py-4 whitespace-nowrap">
               ${Employee.hireDate}
              </td>
            </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>
    </div>
  </div>
  
  <div class="flex">
  <div class="flex flex-col mr-4">
  	<div class="w-full h-full my-4 mx-1 bg-white shadow-md p-2">
  		<div class="text-xl text-gray-600">상세보기</div>
  		<hr>
    <div class="flex flex-wrap">
      <div class="w-1/2 flex items-center py-2">
        <span class="font-semibold w-24">이름:</span>
        <span>홍길동</span>
      </div>
      <div class="w-1/2 flex items-center py-2 border-l pl-4">
        <span class="font-semibold w-24">나이:</span>
        <span>30</span>
      </div>

      <div class="w-1/2 flex items-center py-2 border-t">
        <span class="font-semibold w-24">성별:</span>
        <span>남성</span>
      </div>
      <div class="w-1/2 flex items-center py-2 border-l border-t pl-4">
        <span class="font-semibold w-24">직책:</span>
        <span>팀장</span>
      </div>

      <div class="w-1/2 flex items-center py-2 border-t">
        <span class="font-semibold w-24">재직 여부:</span>
        <span>재직중</span>
      </div>
      <div class="w-1/2 flex items-center py-2 border-l border-t pl-4">
        <span class="font-semibold w-24">부서:</span>
        <span>개발팀</span>
      </div>

      <div class="w-1/2 flex items-center py-2 border-t">
        <span class="font-semibold w-24">이메일:</span>
        <span>hong@example.com</span>
      </div>
      <div class="w-1/2 flex items-center py-2 border-l border-t pl-4">
        <span class="font-semibold w-24">주소:</span>
        <span>서울특별시 강남구</span>
      </div>

      <div class="w-1/2 flex items-center py-2 border-t">
        <span class="font-semibold w-24">근무지:</span>
        <span>본사</span>
      </div>
      <div class="w-1/2 flex items-center py-2 border-l border-t pl-4">
        <span class="font-semibold w-24">비고:</span>
        <span>없음</span>
      </div>

      <div class="w-1/2 flex items-center py-2 border-t">
        <span class="font-semibold w-24">입사일:</span>
        <span>2020-03-01</span>
      </div>
      <div class="w-1/2 flex items-center py-2 border-l border-t pl-4">
        <span class="font-semibold w-24">퇴사일:</span>
        <span>-</span>
      </div>
      
      
      
      <div class="ml-auto">
		<button class="bg-gray-500 text-white py-2 px-4 text-l font-semibold rounded-lg shadow-md hover:bg-gray-400 active:bg-gray-600 focus:outline-none focus:ring-2 focus:ring-gray-400 focus:ring-opacity-75">
		  수정
		</button>
      </div>
      </div>
      <DIV class="rounded mt-3">
      <div class="p-2">
  		<div class="text-xl text-gray-600">임직원 동향</div>
  		<hr class="mb-4 border-t-2 border-white opacity-50">
  		</div>
<div class="w-full h-64 border">
    <canvas id="employeeLineChart" class="px-32 mx-auto"></canvas>
</div>
      </DIV>
    </div>	 		
  	</div>
  	
  	
<div class="w-full h-full my-4 mx-1 bg-white shadow-md p-4">
  <div class="text-xl text-gray-600 mb-2">직원 등록</div>
  <hr class="mb-4">

  <form class="flex flex-col space-y-3">
    <!-- 이름, 나이, 성별 한 줄 -->
    <div class="flex space-x-4">
      <div class="flex items-center">
        <label class="w-20 font-semibold text-gray-700">이름:</label>
        <input type="text" class="w-32 p-2 border rounded-md focus:ring-2 focus:ring-blue-300">
      </div>
      <div class="flex items-center">
        <label class="w-16 font-semibold text-gray-700">나이:</label>
        <input type="number" class="w-20 p-2 border rounded-md focus:ring-2 focus:ring-blue-300">
      </div>
      <div class="flex items-center">
        <label class="w-16 font-semibold text-gray-700">성별:</label>
        <select class="w-24 p-2 border rounded-md focus:ring-2 focus:ring-blue-300">
          <option>남성</option>
          <option>여성</option>
        </select>
      </div>
    </div>

    <div class="flex items-center">
      <label class="w-24 font-semibold text-gray-700">직책:</label>
      <input type="text" class="w-40 p-2 border rounded-md focus:ring-2 focus:ring-blue-300">
    </div>

    <div class="flex items-center">
      <label class="w-24 font-semibold text-gray-700">재직 여부:</label>
      <select class="w-28 p-2 border rounded-md focus:ring-2 focus:ring-blue-300">
        <option>재직중</option>
        <option>퇴사</option>
      </select>
    </div>

    <div class="flex items-center">
      <label class="w-24 font-semibold text-gray-700">부서:</label>
      <input type="text" class="w-40 p-2 border rounded-md focus:ring-2 focus:ring-blue-300">
    </div>

    <div class="flex items-center">
      <label class="w-24 font-semibold text-gray-700">이메일:</label>
      <input type="email" class="w-64 p-2 border rounded-md focus:ring-2 focus:ring-blue-300">
    </div>

    <div class="flex items-center">
      <label class="w-24 font-semibold text-gray-700">주소:</label>
      <input type="text" class="w-80 p-2 border rounded-md focus:ring-2 focus:ring-blue-300">
    </div>

    <div class="flex items-center">
      <label class="w-24 font-semibold text-gray-700">근무지:</label>
      <input type="text" class="w-40 p-2 border rounded-md focus:ring-2 focus:ring-blue-300">
    </div>

    <div class="flex items-start">
      <label class="w-24 font-semibold text-gray-700 mt-2">비고:</label>
      <textarea class="w-80 h-24 p-2 border rounded-md focus:ring-2 focus:ring-blue-300"></textarea>
    </div>

    <!-- 입사일, 퇴사일 한 줄 -->
    <div class="flex space-x-4">
      <div class="flex items-center">
        <label class="w-24 font-semibold text-gray-700">입사일:</label>
        <input type="date" class="w-40 p-2 border rounded-md focus:ring-2 focus:ring-blue-300">
      </div>
      <div class="flex items-center">
        <label class="w-24 font-semibold text-gray-700">퇴사일:</label>
        <input type="date" class="w-40 p-2 border rounded-md focus:ring-2 focus:ring-blue-300">
      </div>
    </div>

    <div class="flex justify-end mt-4">
      <button class="bg-gray-500 text-white py-2 px-4 text-l font-semibold rounded-lg shadow-md hover:bg-gray-400 active:bg-gray-600 focus:outline-none focus:ring-2 focus:ring-gray-400 focus:ring-opacity-75">등록</button>
    </div>
  </form>
</div>


  
  
  
  
  </div>
  
  
  
  
  
  
  
  
  
  
</div>