<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="flex flex-col">
<!--상단 네브바===============================================================================-->
<div class="bg-white py-2">
    <nav class="flex flex-col sm:flex-row">
        <button class="text-gray-600 block hover:text-blue-500 focus:outline-none">
           <a href="/HR/payroll/main" class="py-3 px-4">급여 관리</a>
        </button>
        <button class="text-gray-600 block hover:text-gray-500 focus:outline-none text-gray-500 border-b-2 font-medium border-gray-500">
     		<a href="/HR/payroll/record" class="py-3 px-4">급여 기록</a>
        </button>
    </nav>
</div>
<!--상단 네브바===============================================================================-->

<div class="flex mt-4 gap-3 flex-grow">

	<div class="bg-white w-full shadow-lg" style="height:1200px">
		<div class="p-2 text-lg text-gray-600">신고 목록</div>
<div class="block w-full overflow-x-auto">
  <table class="items-center bg-transparent w-full border-collapse">
    <thead>
      <tr>

        <th class="px-6 bg-blueGray-50 text-blueGray-500 align-middle border border-solid border-blueGray-100 py-3 text-xs uppercase border-l-0 border-r-0 whitespace-nowrap font-semibold text-left">
          귀속 연도/월
        </th>
        <th class="px-6 bg-blueGray-50 text-blueGray-500 align-middle border border-solid border-blueGray-100 py-3 text-xs uppercase border-l-0 border-r-0 whitespace-nowrap font-semibold text-left">
          직원 이름
        </th>
        <th class="px-6 bg-blueGray-50 text-blueGray-500 align-middle border border-solid border-blueGray-100 py-3 text-xs uppercase border-l-0 border-r-0 whitespace-nowrap font-semibold text-left">
     주민번호
        </th>
        <th class="px-6 bg-blueGray-50 text-blueGray-500 align-middle border border-solid border-blueGray-100 py-3 text-xs uppercase border-l-0 border-r-0 whitespace-nowrap font-semibold text-left">
          은행
        </th>
        <th class="px-6 bg-blueGray-50 text-blueGray-500 align-middle border border-solid border-blueGray-100 py-3 text-xs uppercase border-l-0 border-r-0 whitespace-nowrap font-semibold text-left">
          계좌번호
        </th>
        <th class="px-6 bg-blueGray-50 text-blueGray-500 align-middle border border-solid border-blueGray-100 py-3 text-xs uppercase border-l-0 border-r-0 whitespace-nowrap font-semibold text-left">
          급여 총액
        </th>
        <th class="px-6 bg-blueGray-50 text-blueGray-500 align-middle border border-solid border-blueGray-100 py-3 text-xs uppercase border-l-0 border-r-0 whitespace-nowrap font-semibold text-left">
          이체 여부
        </th>
        <th class="px-6 bg-blueGray-50 text-blueGray-500 align-middle border border-solid border-blueGray-100 py-3 text-xs uppercase border-l-0 border-r-0 whitespace-nowrap font-semibold text-left">
          
        </th>
      </tr>
    </thead>

    <tbody>
      <c:forEach var="n" items="${data}" varStatus="status">
        <tr class="${status.index % 2 == 0 ? 'bg-gray-100' : ''}">
          <td class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4">
            ${n.reportYear}년 ${n.reportMonth}월
          </td>
                    <td class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4">
            ${n.name}
          </td>
          <td class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4">
            ${n.rrn}
          </td>
          <td class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4">
            ${n.bank}
          </td>
          <td class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4">
            ${n.acount}
          </td>
			<td class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4">
			  <fmt:formatNumber value="${n.realTotal}" type="number" />
			  원
			</td>
          <td class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4">
            ${n.transferStatus ? '이체 완료' : '미이체'}
          </td>
                    <td class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4">
            <button onClick="deleteRecord(${n.id})" class="hover:underline text-gray-500">X</button>
          </td>
        </tr>
      </c:forEach>
    </tbody>
  </table>
		<hr>
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

</div>



		
	

</div>

</div>


<script>
function deleteRecord(id) {
    if (confirm("정말로 삭제하시겠습니까?")) {
        fetch('/HR/payroll/record/delete/'+id, {
            method: 'DELETE' // HTTP DELETE 메서드 사용
        })
        .then(response => {
            if (response.ok) {
                alert("삭제되었습니다.");
                location.href= "/HR/payroll/record"; // 삭제 후 페이지 새로고침
            } else {
                alert("삭제에 실패했습니다.");
            }
        })
        .catch(error => {
            console.error('Error:', error);
            alert("에러가 발생했습니다.");
        });
    }
}</script>