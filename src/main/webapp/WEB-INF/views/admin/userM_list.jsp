<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="h-full bg-white mr-3 p-4">

    <div class="text-xl text-gray-600 mb-2">사용자 관리</div>
    <hr class="mb-4">
    <div class="flex flex-col">
        <div class="overflow-x-auto">
            <div class="py-2 inline-block min-w-full">
                <div class="overflow-hidden">
                    <table class="min-w-full">
                        <thead class="bg-white border-b">
                            <tr>
                                <th scope="col" class="text-sm font-medium text-gray-900 px-6 py-4 text-left">
                                    일련번호
                                </th>
                                <th scope="col" class="text-sm font-medium text-gray-900 px-6 py-4 text-left">
                                    ID
                                </th>
                                <th scope="col" class="text-sm font-medium text-gray-900 px-6 py-4 text-left">
                                    이름
                                </th>
                                <th scope="col" class="text-sm font-medium text-gray-900 px-6 py-4 text-left">
                                    이메일
                                </th>
                                <th scope="col" class="text-sm font-medium text-gray-900 px-6 py-4 text-left">
                                    권한
                                </th>
                                <th scope="col" class="text-sm font-medium text-gray-900 px-6 py-4 text-left">
                                    상태
                                </th>
                                <th scope="col" class="text-sm font-medium text-gray-900 px-6 py-4 text-left">
                                    생성일자
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- userList를 반복하여 출력 -->
                            <c:forEach var="user" items="${UserList}" varStatus="status" >
                                 <tr class="border-b ${status.index % 2 == 0 ? 'bg-gray-100' : ''}" onClick="location.href='/admin/detail?id=${user.userId}'" style="cursor:pointer;">
                                        <td class="px-6 py-4 text-sm font-medium text-gray-900">
                                            ${user.userId} <!-- 일련번호 -->
                                        </td>
                                        <td class="px-6 py-4 text-sm font-medium text-gray-900">
                                            ${user.username} <!-- ID -->
                                        </td>
                                        <td class="px-6 py-4 text-sm font-medium text-gray-900">
                                            ${user.name} <!-- 이름 -->
                                        </td>
                                        <td class="px-6 py-4 text-sm font-medium text-gray-900">
                                            ${user.email} <!-- 이메일 -->
                                        </td>
                                        <td class="px-6 py-4 text-sm font-medium text-gray-900">
                                            ${user.role} <!-- 권한 -->
                                        </td>
                                        <td class="px-6 py-4 text-sm font-medium text-gray-900">
                                            ${user.status} <!-- 상태 -->
                                        </td>
                                        <td class="px-6 py-4 text-sm font-medium text-gray-900">
                                            ${user.createdAt} <!-- 생성일자 -->
                                        </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
