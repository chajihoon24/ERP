<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="flex flex-col h-full">
<!--상단 네브바===============================================================================-->
<div class="bg-white py-2">
    <nav class="flex flex-col sm:flex-row">
        <button class="text-gray-600 block hover:text-gray-500 focus:outline-none text-gray-500 border-b-2 font-medium border-gray-500">
           <a href="/HR/payroll/main" class="py-3 px-4">급여 관리</a>
        </button>
        <button class="text-gray-600 block hover:text-blue-500 focus:outline-none">
     		<a href="/HR/payroll/record" class="py-3 px-4">급여 기록</a>
        </button>
    </nav>
</div>
<!--상단 네브바===============================================================================-->
<div class="flex mt-4 gap-3 h-1/2">

<div class="bg-white w-1/6 shadow-lg flex flex-col">
    <div class="p-2 text-gray-600 text-lg">직원 목록</div>
    <hr>

    <!-- 직원 정보 표 -->
    <table class="w-full table-auto border-collapse flex-col">
        <thead>
            <tr>
                <th class="px-2 py-1 text-left border-b bg-blue-50">ID</th>
                <th class="px-2 py-1 text-left border-b bg-blue-50">사원명</th>
            </tr>
        </thead>
        <tbody>
        <c:forEach var="n" items="${employeeList}">
            <tr class="border-t border-b" >
                <td class="px-2 py-1">${n.id}</td>
                <td class="px-2 py-1 border-l hover:underline" onClick="getDetail('${n.id}')" style="cursor:pointer;">${n.name}</td>
            </tr>
        </c:forEach>    
        </tbody>
    </table>
    
    <div class="p-2 border-t-2 font-bold flex justify-between bg-gray-50 mt-auto">
        <span class="border-r pr-8">직원 수</span>
        <span id="totalAmount">${count}</span>
    </div>
    
</div>

<!--================================================================================================  -->
	
<div class="bg-white w-2/6 shadow-lg flex flex-col">
    <div class="p-2 text-gray-600 text-lg">급여 정보</div>
    <hr>

    <!-- 급여 항목 표 -->
    <table class="w-full table-auto border-collapse flex-col">
        <thead>
            <tr>
                <th class="px-4 py-2 text-left border-b bg-blue-50">항목</th>
                <th class="px-4 py-2 text-left border-b bg-blue-50 border-l">금액</th>
            </tr>
        </thead>
        <tbody>
            <tr class="border-t border-b">
                <td class="px-4 py-2">기본급</td>
                <td class="px-4 py-2 border-l" id="basicSalary">0</td>
            </tr>
            <tr class="border-b">
                <td class="px-4 py-2">상여</td>
                <td class="px-4 py-2 border-l" id="bonus">0</td>
            </tr>
            <tr class="border-t border-b">
                <td class="px-4 py-2">직책수당</td>
                <td class="px-4 py-2 border-l" id="positionAllowance">0</td>
            </tr>
            <tr class="border-b">
                <td class="px-4 py-2">야간근로시간</td>
                <td class="px-4 py-2 border-l" id="nightWorkHours">0</td>
            </tr>
            <tr class="border-t border-b">
                <td class="px-4 py-2">특별수당</td>
                <td class="px-4 py-2 border-l" id="specialAllowance">0</td>
            </tr>
        </tbody>
    </table>

    <!-- 지급 총액 항목 -->
    <div class="p-2 border-t-2 font-bold flex justify-between bg-gray-50 mt-auto">
        <span class="border-r pr-8">지급 총액</span>
        <span id="totalAmount">0</span>
    </div>
</div>

<!--  공제란=========================================================================================================-->	
<div class="bg-white w-2/6 shadow-lg flex flex-col">
    <div class="p-2 text-gray-600 text-lg">공제란</div>
    <hr>

    <!-- 공제 항목 표 -->
    <table class="w-full table-auto border-collapse flex-col">
        <thead>
            <tr>
                <th class="px-4 py-2 text-left border-b bg-blue-50">항목</th>
                <th class="px-4 py-2 text-left border-b bg-blue-50 border-l">금액</th>
            </tr>
        </thead>
        <tbody>
            <tr class="border-t border-b">
                <td class="px-4 py-2">국민연금</td>
                <td class="px-4 py-2 border-l" id="NPS">0</td>
            </tr>
            <tr class="border-b">
                <td class="px-4 py-2">건강보험</td>
                <td class="px-4 py-2 border-l" id="NHI">0</td>
            </tr>
            <tr class="border-t border-b">
                <td class="px-4 py-2">장기요양보험</td>
                <td class="px-4 py-2 border-l" id="LTCI">0</td>
            </tr>
            <tr class="border-b">
                <td class="px-4 py-2">고용보험</td>
                <td class="px-4 py-2 border-l" id="EI">0</td>
            </tr>
            <tr class="border-t border-b">
                <td class="px-4 py-2">소득세</td>
                <td class="px-4 py-2 border-l" id="incomeTax">0</td>
            </tr>
            <tr class="border-b">
                <td class="px-4 py-2">지방소득세</td>
                <td class="px-4 py-2 border-l" id="localIncomeTax">0</td>
            </tr>
        </tbody>
    </table>

    <!-- 총 공제액 항목 -->
    <div class="p-2 border-t-2 font-bold flex justify-between bg-gray-50 mt-auto">
        <span class="border-r pr-8">총 공제액</span>
        <span id="totalDeduction">0</span>
    </div>
</div>
	<!--4대 보험 공제율 컴포넌트=================================================================================  -->
<div class="bg-white w-1/6 shadow-lg">
    <div class="p-2 text-gray-600 text-lg">4대 보험 공제율</div>
    <hr>

    <!-- 테이블 형식으로 변경 -->
    <table class="w-full table-auto">
        <thead>
            <tr>
                <th class="px-4 py-2 text-left bg-blue-50 border-r">항목</th>
                <th class="px-4 py-2 text-left bg-blue-50">비율</th>
            </tr>
        </thead>
        <tbody>
            <tr class="border-t">
                <td class="px-4 py-2 border-r">국민연금</td>
                <td class="px-4 py-2">${tax.NPS}%</td>
            </tr>
            <tr>
                <td class="px-4 py-2 border-r">건강보험</td>
                <td class="px-4 py-2">${tax.NHI}%</td>
            </tr>
            <tr class="border-t">
                <td class="px-4 py-2 border-r">장기요양보험</td>
                <td class="px-4 py-2">${tax.LTCI}%</td>
            </tr>
            <tr>
                <td class="px-4 py-2 border-r">고용보험</td>
                <td class="px-4 py-2">${tax.EI}%</td>
            </tr>
            <tr class="border-t">
                <td class="px-4 py-2 border-r">소득세</td>
                <td class="px-4 py-2">${tax.incomeTax}%</td>
            </tr>
            <tr class="border-b">
                <td class="px-4 py-2 border-r">지방소득세</td>
                <td class="px-4 py-2">${tax.localIncomeTax}%</td>
            </tr>
        </tbody>
    </table>
    <div class="pl-2 pt-2 text-gray-500">※고정요율인 것으로 가정합니다.</div>
</div>
<!--4대 보험 공제율 컴포넌트=================================================================================  -->	

</div>


<!-- ======================================================================================= -->

<div class="flex flex-grow mt-4 gap-3">

<div class="bg-white w-1/6 shadow-lg flex flex-col">
    <div class="p-2 text-gray-600 text-lg">직원 상세/요약</div>
    <hr>

    <!-- 직원 정보 표 -->
    <table id="employeeDetail" class="w-full table-auto border-collapse flex-col">
        <thead>
            <tr>
                <th class="px-4 py-2 text-left border-b bg-blue-50">항목</th>
                <th class="px-4 py-2 text-left border-b bg-blue-50 border-l">정보</th>
            </tr>
        </thead>
        <tbody>

        </tbody>
    </table>
</div>

<!--===========================================================================================================-->
	
	<div class="bg-white w-5/6 shadow-lg">
		<div class="p-2 text-gray-600 text-2xl">컴포넌트2</div>
		<hr>
	</div>


</div>

<script>
    // 함수가 DOMContentLoaded 이전에 호출될 수 있도록 전역에서 정의합니다.
    function getDetail(id){
        $('#employeeDetail').empty();  // 기존 내용을 비우고 새로 추가
        
        const url = "/HR/payroll/main/detail/" + id;
        
        $.ajax({
            url: url,
            type: "GET",
            success: function(data) {
                $('#employeeDetail').html( // 한 번만 호출하여 테이블을 추가
                    '<table id="employeeTable" class="w-full table-auto border-collapse flex-col">' +
                    '<thead>' +
                    '<tr>' +
                    '<th class="px-4 py-2 text-left border-b bg-blue-50">항목</th>' +
                    '<th class="px-4 py-2 text-left border-b bg-blue-50 border-l">정보</th>' +
                    '</tr>' +
                    '</thead>' +
                    '<tbody>' +
                    '<tr class="border-t border-b">' +
                    '<td class="px-4 py-2">성함</td>' +
                    '<td class="px-4 py-2 border-l" id="employeeName">' + (data.name || 'N/A') + '</td>' +
                    '</tr>' +
                    '<tr class="border-b">' +
                    '<td class="px-4 py-2">주민번호</td>' +
                    '<td class="px-4 py-2 border-l" id="socialSecurityNumber">' + (data.rrn || 'N/A') + '</td>' +
                    '</tr>' +
                    '<tr class="border-t border-b">' +
                    '<td class="px-4 py-2">부서</td>' +
                    '<td class="px-4 py-2 border-l" id="department">' + (data.departmentName || 'N/A') + '</td>' +
                    '</tr>' +
                    '<tr class="border-b">' +
                    '<td class="px-4 py-2">직급</td>' +
                    '<td class="px-4 py-2 border-l" id="position">' + (data.position || 'N/A') + '</td>' +
                    '</tr>' +
                    '<tr class="border-t border-b">' +
                    '<td class="px-4 py-2">연봉</td>' +
                    '<td class="px-4 py-2 border-l" id="salary">' + (data.salary || 'N/A').toLocaleString('ko-KR') + '</td>' +
                    '</tr>' +
                    '<tr class="border-b">' +
                    '<td class="px-4 py-2">연락처</td>' +
                    '<td class="px-4 py-2 border-l" id="contact">' + (data.tel || 'N/A') + '</td>' +
                    '</tr>' +
                    '</tbody>' +
                    '</table>'
                );
            },
            error: function(xhr, status, error) {
                console.error("Ajax Error: ", error);
                alert("직원 정보를 불러오는데 실패했습니다.");
            }
        });
    }

    document.addEventListener("DOMContentLoaded", function () {
        // DOM이 완전히 로드된 후의 추가 작업을 이곳에 작성할 수 있습니다.
    });
</script>

  
  
  
