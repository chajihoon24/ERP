<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>

    <!-- Content Area -->
    <div class="flex justify-center items-center h-screen">
        <h1 class="text-4xl font-bold">Welcome to the Website</h1>
    </div>

<form action="/perform_login" method="post" class="flex justify-center items-center min-w-full min-h-full mb-10">
   
    <div class="w-full md:w-1/2 flex flex-col items-center rounded p-4 mb-10">
        <!-- text login -->
        <h1 class="text-center text-2xl font-bold text-gray-600 mb-6">ERP LOGIN</h1>
        
        <!-- email input -->
        <div class="w-3/4 mb-6">
            <input type="text" name="username" id="username" class="w-full py-4 px-8 bg-slate-200 placeholder:font-semibold rounded hover:ring-1 outline-blue-500" placeholder="ID">
        </div>
        
        <!-- password input -->
        <div class="w-3/4 mb-6">
            <input type="password" name="password" id="password" class="w-full py-4 px-8 bg-slate-200 placeholder:font-semibold rounded hover:ring-1 outline-blue-500" placeholder="Password">
        </div>
        
        <!-- button -->
        <div class="w-3/4 mt-4">
            <button type="submit" class="py-4 bg-blue-400 w-full rounded text-blue-50 font-bold hover:bg-blue-700">LOGIN</button>
        </div>
        
        <div class="mb-10"></div>
        <div class="mb-10"></div>
    </div>
</form>