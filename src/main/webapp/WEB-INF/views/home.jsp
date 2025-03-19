<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<div class="flex flex-col h-full">
<div class="flex h-full mb-4">
	<section class="py-1 bg-white w-2/3 " style="min-width: 66.6667%;">
  <div class="relative flex flex-col min-w-0 break-words bg-white w-full mb-6 rounded ">
    <div class="rounded-t mb-0 px-4 py-3 border-0">
      <div class="flex flex-wrap items-center">
        <div class="relative w-full px-4 max-w-full flex-grow flex-1 flex">
          <h3 class="font-semibold text-base  text-gray-600 text-2xl">공지 사항<i class="ml-3 fas fa-info-circle fa-sm" style="color: #9e9e9e;"></i></h3>
          <div class="ml-auto mr-3 mt-1">
				<input id="name" class="w-32 bg-white border border-gray-300 pl-3 py-1 shadow-sm focus:ring focus:ring-blue-200 focus:border-blue-400 outline-none">
				<span class="px-2 text-gray-500 underline hover:font-bold hover:text-black cursor-pointer">검색</span>
			</div>
			<sec:authorize access="hasRole('ROLE_ADMIN')">
			<a href="main/notice/perform">
                    <button class="py-1 px-2 bg-gray-400 text-white rounded-md hover:bg-gray-500 mt-1">
        공지사항 등록
    </button>
    </a>
    </sec:authorize>
        </div>
      </div>

    </div>

    <div class="block w-full overflow-x-auto">
      <table class="items-center bg-transparent w-full border-collapse ">
        <thead>
          <tr>
            <th class="px-6 bg-blueGray-50 text-blueGray-500 align-middle border border-solid border-blueGray-100 py-3 text-xs uppercase border-l-0 border-r-0 whitespace-nowrap font-semibold text-left">
                         no.
                        </th>
                      <th class="px-6 bg-blueGray-50 text-blueGray-500 align-middle border border-solid border-blueGray-100 py-3 text-xs uppercase border-l-0 border-r-0 whitespace-nowrap font-semibold text-left">
                         구분
                        </th>
          <th class="px-6 bg-blueGray-50 text-blueGray-500 align-middle border border-solid border-blueGray-100 py-3 text-xs uppercase border-l-0 border-r-0 whitespace-nowrap font-semibold text-left">
                          제목
                        </th>
           <th class="px-6 bg-blueGray-50 text-blueGray-500 align-middle border border-solid border-blueGray-100 py-3 text-xs uppercase border-l-0 border-r-0 whitespace-nowrap font-semibold text-left">
                          작성자
                        </th>
          <th class="px-6 bg-blueGray-50 text-blueGray-500 align-middle border border-solid border-blueGray-100 py-3 text-xs uppercase border-l-0 border-r-0 whitespace-nowrap font-semibold text-left">
                          작성일
                        </th>
          </tr>
        </thead>

        <tbody>
			<c:forEach var="n" items="${data}" varStatus="status">
			    <tr class="${status.index % 2 == 0 ? 'bg-gray-100' : ''}">
			        <th class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4 text-left text-blueGray-700">
			         ${((currentPage-1)*8) + (status.index+1)}
			        </th>
			        <td class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4">
			            ${n.type eq 'NOTICE' ? '공지' : '일반'}
			        </td>
			        <td class="border-t-0 px-6 align-center border-l-0 border-r-0 text-xs whitespace-nowrap p-4 underline">
			            <a class="p-2" href="/main/notice/detail/${n.id}">${n.title}</a>
			        </td>
			        <td class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4">
			            ${n.author}
			        </td>
			        <td class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4">
			            ${n.createdAt}
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
</section>

<div class="w-full h-full">
	<div class="w-full h-full">
		<div class="ml-4  bg-white w-full h-full">
        <div class="flex flex-col relative w-full px-4 max-w-full flex-grow flex-1 p-2 h-full">
          <h3 class="font-semibold text-base text-gray-600 text-2xl mb-2 flex items-center">
    알림
    <div class="relative">
        <i class="far fa-bell fa-sm ml-3 text-gray-500"></i>
        <div class="absolute -top-1 -right-2 bg-red-500 text-white text-xs w-4 h-4 flex items-center justify-center rounded-full">
            ${notificationTotal}
        </div>
    </div>
    <div class="text-gray-400 hover:text-red-500 ml-auto text-base font-semibold underline pt-2"><a href="#">모두 지우기</a></div>
</h3>
			<hr class="mb-2">
			
<c:if test="${notifications != null && notifications.size() > 0}">
    <!-- 실제 알림 목록이 있을 때 표시 -->
    <div class="space-y-4">
        <c:forEach var="n" items="${notifications}">
            <div class="bg-white p-2 rounded-lg shadow-md hover:shadow-lg transition-shadow duration-300">
                <div class="flex justify-between items-center">
                    <!-- 알림 상태 (읽음/읽지 않음) -->
                    <div class="text-sm ${n.isRead ? 'text-gray-500' : 'text-blue-600'}">
                        ${n.isRead ? '읽음' : '읽지 않음'}
                    </div>
                    
                    <!-- 알림 메시지 -->
                    <div class="text-gray-800">
                        ${n.message}
                    </div>
                    
                    <!-- 알림 시간 -->
                    <div class="text-xs text-gray-400">
                        ${n.createdAt}
                    </div>

                    <!-- X 삭제 버튼 -->
                    <form action="/main/deleteNotification" method="POST" style="display:inline;">
                        <input type="hidden" name="id" value="${n.id}" />
                        <button type="submit" class="text-gray-400 hover:text-red-500 text-lg underline">X</button>
                    </form>
                </div>
            </div>
        </c:forEach>
    </div>
</c:if>


<c:if test="${empty notifications || notifications.size() == 0}">
    <div class="flex-grow rounded bg-gray-200 flex justify-center items-center">
        <div class="text-gray-600 text-lg font-semibold">소식이 없습니다.</div>
    </div>
</c:if>
        </div>		
		</div>
	</div>
</div>
</div>

<div class="h-full">
	<div class="bg-white h-full">컴포넌트</div>
</div>

</div>

	