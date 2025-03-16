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
            <div class="m-2 bg-white h-full flex items-center justify-center">
                리스트 컴포넌트 1
            </div>
        </div>
        <div class="w-1/2 h-screen">
            <div class="m-2 bg-white h-full flex items-center justify-center">
                리스트 컴포넌트 2
            </div>
        </div>
    </div>
</div>
