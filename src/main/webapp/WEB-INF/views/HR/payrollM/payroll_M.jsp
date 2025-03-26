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
    <div class="pt-1 ml-60 text-gray-600">지급년월:</div>
    
<select id="reportYear" class="ml-4 focus:outline-none border">
    <c:set var="currentYear" value="<%= java.util.Calendar.getInstance().get(java.util.Calendar.YEAR) %>" />
    <c:forEach begin="2015" end="${currentYear}" var="year">
        <option value="${year}" ${year == currentYear ? 'selected' : ''}>${year}년</option>
    </c:forEach>
</select>
    
    
    <select id="reportMonth" class="ml-4 focus:outline-none border">
    <c:forEach begin="1" end="12" varStatus="n">
    	<option>${n.index}월</option>
    </c:forEach>
    </select>
    
    
    <button  id="sendPayroll" class="ml-auto pt-1 text-gray-500 hover:underline hover:text-black">
    	급여신고
    </button>
    
    <button class="pt-1 ml-4 mr-32 text-gray-500 hover:underline hover:text-black">
    	명세서 출력
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
                <th class="px-2 py-1 text-left border-b bg-blue-50 border-l">사원명</th>
            </tr>
        </thead>
        <tbody>
        <c:forEach var="n" items="${employeeList}">
            <tr class="border-t border-b" >
                <td class="px-2 py-1">${n.id}</td>
                <td class="px-2 py-1 border-l hover:underline" onClick="getDetail('${n.id}')" style="cursor:pointer;">${n.name} </td>
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
                <th class="px-4 py-2 text-left border-b bg-blue-50" style="width: 450px;">항목</th>
                <th class="px-4 py-2 text-left border-b bg-blue-50 border-l">금액</th>
            </tr>
        </thead>
        <tbody>
            <tr class="border-t border-b">
                <td class="px-4 py-2">기본급</td>
                <td class="px-4 py-2 border-l" id="basicSalary">
                	<input id="basicSalaryI" class=" w-full focus:outline-none salaryT" value="0" oninput="updateTotal(this)">
                </td>
            </tr>
            <tr class="border-b">
                <td class="px-4 py-2">상여</td>
                <td class="px-4 py-2 border-l" id="bonus">
                	<input id="bonusI" class=" w-full focus:outline-none salaryT" value="0" oninput="updateTotal(this)">
                </td>
            </tr>
            <tr class="border-t border-b">
                <td class="px-4 py-2">직책수당</td>
                <td class="px-4 py-2 border-l" id="positionAllowance">
                	<input id="positionAllowanceI" class=" w-full focus:outline-none salaryT" value="0" oninput="updateTotal(this)">
                </td>
            </tr>
            <tr class="border-b">
                <td class="px-4 py-2">야간근로시간</td>
                <td class="px-4 py-2 border-l" id="nightWorkHours">
                	<input id="nightWorkHoursI" class=" w-full focus:outline-none salaryT" value="0" oninput="updateTotal(this)">
                </td>
            </tr>
            <tr class="border-t border-b">
                <td class="px-4 py-2">특별수당</td>
                <td class="px-4 py-2 border-l" id="specialAllowance">
                	<input id="specialAllowanceI" class=" w-full focus:outline-none salaryT" value="0" oninput="updateTotal(this)" >
                </td>
            </tr>
        </tbody>
    </table>

    <!-- 지급 총액 항목 -->
    <div class="p-2 border-t-2 font-bold flex justify-between bg-gray-50 mt-auto">
        <span class="border-r pr-8">지급 총액</span>
        <span id="totalAmount1">0</span>
    </div>
</div>

<!--  공제란=========================================================================================================-->	
<div class="bg-white w-2/6 shadow-lg flex flex-col">
    <div class="p-2 text-gray-600 text-lg">공제</div>
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
        <span class="text-gray-500">본인 부담금:<span class="text-black pl-2" id="totalDeduction">0</span></span>
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
		<div id="realTotal" class="p-2 text-gray-600 text-lg">
				실수령액 : 0
		</div>
		<hr>
	</div>


</div>

<script>

function updateTotal(input) {
	
	let tmp;
	let tmp2;
    let value = input.value.replace(/[^\d]/g, '');
    
    // 3자리마다 쉼표 추가
    value = value.replace(/\B(?=(\d{3})+(?!\d))/g, ',');

    // 값을 다시 입력 필드에 반영
    input.value = value;
    let total = 0;

    // 모든 금액 input 필드 값을 가져와서 총액을 계산
    let inputs = document.querySelectorAll('.salaryT');
    inputs.forEach(function(input) {
    	
    	
    	
        let value = parseFloat(input.value.replace(/,/g, '')) || 0; // 입력값이 비어있거나 NaN이면 0으로 처리
        total += value;
    });

    // 총액을 화면에 업데이트
    document.getElementById('totalAmount1').innerText = total.toLocaleString(); // 3자리마다 쉼표 추가
    
    $('#NPS').html(
    		Math.floor(((total) * ${tax.NPS})).toLocaleString()		
    );
    $('#NHI').html(
    		Math.floor(((total) * ${tax.NHI})).toLocaleString()		
    );
    $('#LTCI').html(
    		Math.floor(((total) * ${tax.LTCI})).toLocaleString()		
    );                
    $('#EI').html(
    		Math.floor(((total) * ${tax.EI})).toLocaleString()		
    );               
    $('#incomeTax').html(
    		Math.floor(((total-1000000) * ${tax.incomeTax})).toLocaleString()		
    );                
    $('#localIncomeTax').html(
    		Math.floor(((total-1000000) * ${tax.localIncomeTax})).toLocaleString()		
    );                            
           
            Gvalue = Math.floor(((total-1000000) * ${tax.NPS} +
            ((total) * ${tax.NHI}) +
            ((total) * ${tax.LTCI}) +
            ((total) * ${tax.EI}))/2 +
            ((total-1000000) * ${tax.incomeTax}) +	
            ((total-1000000) * ${tax.localIncomeTax}))
            
            
            document.getElementById('totalDeduction').innerText = Gvalue.toLocaleString('ko-KR'); 
    
    
    
    
}

    // 함수가 DOMContentLoaded 이전에 호출될 수 있도록 전역에서 정의합니다.
    function getDetail(id){
    	tmp2=id
        $('#employeeDetail').empty();  // 기존 내용을 비우고 새로 추가
        $('#basicSalary').empty();
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
                    '<tr class="border-b overflow-x-auto">' +
                    '<td class="px-4 py-2">사원번호</td>' +
                    '<td class="px-4 py-2 border-l " id="employeeId">' + (data.id || 'N/A') + '</td>' +
                    '</tr>' +
                    '<tr class="border-t border-b">' +
                    '<td class="px-4 py-2" style="width: 150px;">성함</td>' +
                    '<td class="px-4 py-2 border-l" id="employeeName">' + (data.name || 'N/A') + '</td>' +
                    '</tr>' +
                    '<tr class="border-b">' +
                    '<td class="px-4 py-2" style="width: 150px;">주민번호</td>' +
                    '<td class="px-4 py-2 border-l" id="rrn">' + (data.rrn || 'N/A') + '</td>' +
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
                    '<td class="px-4 py-2 border-l" id="tel">' + (data.tel || 'N/A') + '</td>' +
                    '</tr>' +
                    '<tr class="border-b overflow-x-auto">' +
                    '<td class="px-4 py-2">은행/계좌번호</td>' +
                    '<td class="px-4 py-2 border-l " id="bankAndAcount">' + (data.bank+" "+data.acount || 'N/A') + '</td>' +
                    '</tr>' +
                    '</tbody>' +
                    '</table>'
                );
                
                $('#basicSalary').html(
                		'<input id="basicSalaryI" class=" w-full focus:outline-none salaryT" value="'+(Math.ceil(data.salary / 1200) * 100).toLocaleString('ko-KR')+'" oninput="updateTotal()">'		
                );
                $('#bonus').html(
                		'<input id="bonusI" class=" w-full focus:outline-none salaryT" value="0" oninput="updateTotal(this)">'
                )
                $('#positionAllowance').html(
                		'<input id="positionAllowanceI" class=" w-full focus:outline-none salaryT" value="0" oninput="updateTotal(this)">'		
                )
              	$('#nightWorkHours').html(
                		'<input id="nightWorkHoursI" class=" w-full focus:outline-none salaryT" value="0" oninput="updateTotal(this)">'		
                )
              	$('#specialAllowance').html(
                		'<input id="specialAllowanceI"  class=" w-full focus:outline-none salaryT" value="0" oninput="updateTotal(this)">'		
                )                
                
                
                
                let total = 0;
                let Gvalue = 0;

                // 모든 금액 input 필드 값을 가져와서 총액을 계산
                let inputs = document.querySelectorAll('.salaryT');
                inputs.forEach(function(input) {
                	
                	
                	
                    let value = parseFloat(input.value.replace(/,/g, '')) || 0; // 입력값이 비어있거나 NaN이면 0으로 처리
                    total += value;
                    
                    
                    document.getElementById('totalAmount1').innerText = total.toLocaleString('ko-KR');
                });
                $('#NPS').html(
                		Math.floor(((total) * ${tax.NPS})).toLocaleString()		
                );
                $('#NHI').html(
                		Math.floor(((total) * ${tax.NHI})).toLocaleString()		
                );
                $('#LTCI').html(
                		Math.floor(((total) * ${tax.LTCI})).toLocaleString()		
                );                
                $('#EI').html(
                		Math.floor(((total) * ${tax.EI})).toLocaleString()		
                );               
                $('#incomeTax').html(
                		Math.floor(((total-1000000) * ${tax.incomeTax})).toLocaleString()		
                );                
                $('#localIncomeTax').html(
                		Math.floor(((total-1000000) * ${tax.localIncomeTax})).toLocaleString()		
                );                  
                
                 Gvalue = Math.floor(((total-1000000) * ${tax.NPS} +
                 ((total) * ${tax.NHI}) +
                 ((total) * ${tax.LTCI}) +
                 ((total) * ${tax.EI}))/2 +
                 ((total-1000000) * ${tax.incomeTax}) +	
                 ((total-1000000) * ${tax.localIncomeTax}))
                 
                 
                 document.getElementById('totalDeduction').innerText = Gvalue.toLocaleString('ko-KR'); 
                 
                tmp=(total-Gvalue)
                 document.getElementById('realTotal').innerText =" 실수령액 : " + (total-Gvalue).toLocaleString('ko-KR');
                 
                 
                 
            },
            error: function(xhr, status, error) {
                console.error("Ajax Error: ", error);
                alert("직원 정보를 불러오는데 실패했습니다.");
            }
        });
    }
//===============================================================

    $('#sendPayroll').click(function() {
        if (!confirm('신고하시겠습니까?')) {
            return; // 사용자가 취소했을 경우 처리 중단
        }
        // 입력된 값 가져오기
       /*  const employeeId = $('#employeeId').val() */
        const basicSalary = parseFloat($('#basicSalaryI').val().replace(/,/g, '')) || 0;
        const bonus = parseFloat($('#bonusI').val().replace(/,/g, '')) || 0;
        const positionAllowance = parseFloat($('#positionAllowanceI').val().replace(/,/g, '')) || 0;
        const nightWorkHours = parseFloat($('#nightWorkHoursI').val().replace(/,/g, '')) || 0;
        const specialAllowance = parseFloat($('#specialAllowanceI').val().replace(/,/g, '')) || 0;
        const reportYear = $('#reportYear').val();
        const reportMonth = $('#reportMonth').val();
        const realTotal = parseFloat($('#realTotal').val().replace(/,/g, '')) || 0;

        
        console.log($('#employeeId').val())
        // 데이터 객체 생성
        const data = {
        	employeeId: tmp2,
            basicSalary: parseInt(basicSalary) || 0,
            bonus: parseInt(bonus) || 0,
            positionAllowance: parseInt(positionAllowance) || 0,
            nightWorkHours: parseInt(nightWorkHours) || 0,
            specialAllowance: parseInt(specialAllowance) || 0,
            reportYear: parseInt(reportYear) || 0,
            reportMonth: parseInt(reportMonth) || 0,
            realTotal: tmp
        };

        // AJAX POST 요청
        $.ajax({
            url: '/HR/payroll/main/insert', // 서버에서 처리할 경로 설정
            type: 'POST',
            contentType: 'application/json', // JSON 데이터로 전송
            data: JSON.stringify(data),
            success: function(response) {
                alert('급여 정보가 성공적으로 전송되었습니다!');
                console.log(response); // 응답 확인
            },
            error: function(xhr, status, error) {
                alert('급여 정보 전송에 실패했습니다. 다시 시도해 주세요.');
                console.error(error);
            }
        });
    });	
	
	
	
	
//===============================================================

    document.addEventListener("DOMContentLoaded", function () {
        // DOM이 완전히 로드된 후의 추가 작업을 이곳에 작성할 수 있습니다.
    });
</script>

  
  
  
