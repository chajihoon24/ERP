<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <nav class="bg-gray-800 p-4 flex items-center justify-between">
    <div>
    
      <h1 style="margin-left: 2vw;" class="text-white text-xl font-semibold ml-8"><a href="/main">Jihoon ERP</a></h1>
    </div>
    <div style="margin-right: 3vw;" class="flex items-center space-x-4">
    
  		<!--   현재 사용자란 -->
<span class="text-white">${Gusername == 'anonymousUser' ? 'Guest' : Gusername}</span>
      <i class="fas fa-user-circle text-white text-2xl"></i>
    </div>
  </nav>