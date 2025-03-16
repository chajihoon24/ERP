<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="flex flex-col h-full">
<div class="flex h-full mb-4">
	<section class="py-1 bg-white w-2/3 " style="min-width: 66.6667%;">
  <div class="relative flex flex-col min-w-0 break-words bg-white w-full mb-6 rounded ">
    <div class="rounded-t mb-0 px-4 py-3 border-0">
      <div class="flex flex-wrap items-center">
        <div class="relative w-full px-4 max-w-full flex-grow flex-1 flex">
          <h3 class="font-semibold text-base  text-gray-600 text-2xl">공지 사항</h3>
          <div class="ml-auto mr-3 mt-1">
				<input id="name" class="w-32 bg-white border border-gray-300 pl-3 py-1 shadow-sm focus:ring focus:ring-blue-200 focus:border-blue-400 outline-none">
				<span class="px-2 text-gray-500 underline hover:font-bold hover:text-black cursor-pointer">검색</span>
			</div>
			<a href="main/notice/perform">
                    <button class="py-1 px-2 bg-gray-400 text-white rounded-md hover:bg-gray-500 mt-1">
        공지사항 등록
    </button>
    </a>
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
			            ${status.index+1}
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
</section>

<div class="w-full h-full">
	<div class="w-full h-full">
		<div class="ml-4  bg-white w-full h-full">
        <div class="relative w-full px-4 max-w-full flex-grow flex-1 p-2">
          <h3 class="font-semibold text-base  text-gray-600 text-2xl">알림</h3>
        </div>		
		</div>
	</div>
</div>
</div>

<div class="h-full">
	<div class="bg-white h-full">컴포넌트</div>
</div>

</div>

	