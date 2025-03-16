<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="flex">

<!--======= 자세히 수정/삭제====================================================================================== -->

<div class="h-full bg-white p-4 w-1/2">
    <div class="text-xl text-gray-600 mb-2">자세히 보기 수정/삭제</div>
    <hr class="mb-4">
    
    <div>
        <div class="p-2"><span class="pr-2">일련번호:</span><span id="user_id">${UserDetail.userId}</span></div>
        <div class="p-2"><span class="pr-2">아이디:</span>${UserDetail.username}</div>
        <div class="p-2"><span class="pr-2">이름:</span>${UserDetail.name}</div>
        <div class="p-2"><span class="pr-2">이메일:</span>${UserDetail.email}</div>
        <div class="p-2"><span class="pr-2">권한:</span>
            <select id="user_role" class="w-24 p-2 border rounded-md focus:ring-2 focus:ring-blue-300">
                <option value="ADMIN" ${UserDetail.role == 'ADMIN' ? 'selected' : ''}>Admin</option>
                <option value="USER" ${UserDetail.role == 'USER' ? 'selected' : ''}>User</option>
            </select>
        </div>
        <div class="p-2"><span class="pr-2">상태:</span>
            <select id="user_status" class="w-30 p-2 border rounded-md focus:ring-2 focus:ring-blue-300">
                <option value="ACTIVE" ${UserDetail.status == 'ACTIVE' ? 'selected' : ''}>ACTIVE</option>
                <option value="INACTIVE" ${UserDetail.status == 'INACTIVE' ? 'selected' : ''}>INACTIVE</option>
            </select>
        </div>
        <div class="p-2"><span class="pr-2">생성일자:</span>${UserDetail.createdAt}</div>
    </div>
    
    <div class="mt-4 flex justify-end"> <!-- flex와 justify-end로 오른쪽 정렬 -->
        <button id="detail_update_btn" type="submit" class="py-2 px-4 bg-gray-400 text-white rounded-md hover:bg-gray-500">수정</button>
        <button id="detail_delete_btn" type="submit" class="py-2 px-4 bg-gray-400 text-white rounded-md hover:bg-gray-500 ml-2">삭제</button> <!-- 버튼 사이에 간격을 주기 위해 ml-2 추가 -->
    </div>
    
</div>

<!--======================= 계정 복구 =======================================================================-->
<div class="w-1/2" style="height: 451px;">
    <div class="h-full bg-white ml-4 p-4 flex flex-col overflow-hidden">
        <div class="flex">
            <div class="text-xl text-gray-600 mb-2">계정 복구</div>
            <div class="underline ml-auto hover:text-red-500" id="deleteAll" style="cursor:pointer;">전체 영구삭제</div>
        </div>
        <hr class="mb-4">

        <div class="flex-1 overflow-y-auto" style="max-height: 360px;">
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
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="user" items="${deletedUser}" varStatus="status">
                        <tr class="border-b ${status.index % 2 eq 0 ? 'bg-gray-100' : ''}">
                            <td class="px-6 py-4 text-sm font-medium text-gray-900">
                                ${user.userId} <!-- 일련번호 -->
                            </td>
                            <td class="px-6 py-4 text-sm font-medium text-gray-900">
                                ${user.username} <!-- ID -->
                            </td>
                            <td class="px-6 py-4 text-sm font-medium text-gray-900">
                                ${user.name} <!-- 이름 -->
                            </td>
                            <td class="px-6 py-4 text-sm font-medium text-gray-900 underline hover:text-red-500">
                                <div class="rollback-btn" data-user-id="${user.userId}" style="cursor:pointer;"> 복구 </div>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

<!-- ==================================================================================================== -->
</div>
<script>
    $(document).ready(function () {

        // 🔹 계정 전체 영구 삭제
        $("#deleteAll").click(function () {
            if (!confirm("영구적으로 삭제되어 다시 복구가 불가능합니다. 정말로 삭제하시겠습니까?")) {
                return;
            }

            $.ajax({
                url: "/admin/delete/all",
                type: "DELETE",
                success: function (response) {
                    alert("삭제되었습니다.");
                    location.href = "/admin";
                },
                error: function () {
                    alert("삭제에 실패했습니다.");
                }
            });
        });

        // 🔹 사용자 삭제 (소프트 삭제)
        $("#detail_delete_btn").click(function () {
            let userId = $("#user_id").text().trim(); // 일련번호 가져오기
            if (!confirm("정말로 삭제하시겠습니까?")) {
                return;
            }

            $.ajax({
                url: "/admin/change_delete/" + userId,
                type: "PATCH",
                success: function (response) {
                    alert("삭제되었습니다.");
                    location.href = "/admin"; // 삭제 후 목록 페이지로 이동
                },
                error: function () {
                    alert("삭제에 실패했습니다.");
                }
            });
        });

        // 🔹 사용자 정보 수정 (권한, 상태)
        $("#detail_update_btn").click(function () {
            let userId = $("#user_id").text().trim();
            let role = $("#user_role").val();
            let status = $("#user_status").val();
            console.log(userId+role+status);

            $.ajax({
                url: "/admin/updateUser",
                type: "PATCH",
                contentType: "application/json",
                data: JSON.stringify({ id: userId, role: role, status: status }),
                success: function (response) {
                    alert("수정되었습니다.");
                    location.reload(); // 페이지 새로고침
                },
                error: function (xhr) {
                    alert("수정 실패: " + xhr.responseText);
                }
            });
        });

        // 🔹 계정 복구 (동적 이벤트 바인딩)
        $(document).on("click", ".rollback-btn", function () {
            let userId = $(this).data("user-id"); // 클릭한 요소의 userId 가져오기

            if (!confirm("정말로 복구하시겠습니까?")) {
                return;
            }

            $.ajax({
                url: "/admin/rollback/" + userId, // 동적으로 userId 추가
                type: "PUT",
                success: function (response) {
                    alert("복구되었습니다.");
                    location.reload(); // 새로고침하여 변경된 데이터 반영
                },
                error: function () {
                    alert("복구에 실패했습니다.");
                }
            });
        });

    });
</script>
