<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<aside class="bg-gray-800 text-white w-64 min-h-screen p-4 max-w-none">
  <nav>
    <ul class="space-y-2">
      <li class="opcion-con-desplegable">
        <div class="flex items-center justify-between p-2 hover:bg-gray-700">
          <div class="flex items-center">
            <i class="fas fa-regular fa-user mr-2"></i>
            <span>HR</span>
          </div>
          <i class="fas fa-chevron-down text-xs"></i>
        </div>
        <ul class="desplegable ml-4 hidden">
          <li>
            <a href="/HR/employee_m" class="block p-2 hover:bg-gray-700 flex items-center">
              <i class="fas fa-chevron-right mr-2 text-xs"></i>
              	직원 관리
            </a>
          </li>
          <li>
            <a href="#" class="block p-2 hover:bg-gray-700 flex items-center">
              <i class="fas fa-chevron-right mr-2 text-xs"></i>
             	 급여 관리
            </a>
          </li>
          <li>
            <a href="#" class="block p-2 hover:bg-gray-700 flex items-center">
              <i class="fas fa-chevron-right mr-2 text-xs"></i>
             	 성과 관리
            </a>
          </li>
          <li>
            <a href="#" class="block p-2 hover:bg-gray-700 flex items-center">
              <i class="fas fa-chevron-right mr-2 text-xs"></i>
             	 리포트/분석
            </a>
          </li>            
        </ul>
      </li>
      <li class="opcion-con-desplegable">
        <div class="flex items-center justify-between p-2 hover:bg-gray-700">
          <div class="flex items-center">
            <i class="fas fa-money-bill-wave mr-2"></i>
            <span>WMS</span>
          </div>
          <i class="fas fa-chevron-down text-xs"></i>
        </div>
        <ul class="desplegable ml-4 hidden">
          <li>
            <a href="#" class="block p-2 hover:bg-gray-700 flex items-center">
              <i class="fas fa-chevron-right mr-2 text-xs"></i>
              Tratamientos
            </a>
          </li>
          <li>
            <a href="#" class="block p-2 hover:bg-gray-700 flex items-center">
              <i class="fas fa-chevron-right mr-2 text-xs"></i>
              Gastos
            </a>
          </li>
          <li>
            <a href="#" class="block p-2 hover:bg-gray-700 flex items-center">
              <i class="fas fa-chevron-right mr-2 text-xs"></i>
              Facturas
            </a>
          </li>
        </ul>
      </li>
      <li class="opcion-con-desplegable">
        <div class="flex items-center justify-between p-2 hover:bg-gray-700">
          <div class="flex items-center">
            <i class="fas fa-chart-bar mr-2"></i>
            <span>Informes</span>
          </div>
          <i class="fas fa-chevron-down text-xs"></i>
        </div>
        <ul class="desplegable ml-4 hidden">
          <li>
            <a href="#" class="block p-2 hover:bg-gray-700 flex items-center">
              <i class="fas fa-chevron-right mr-2 text-xs"></i>
              Presupuestos
            </a>
          </li>
          <li>
            <a href="#" class="block p-2 hover:bg-gray-700 flex items-center">
              <i class="fas fa-chevron-right mr-2 text-xs"></i>
              Informe médico
            </a>
          </li>
        </ul>
      </li>
      <li class="opcion-con-desplegable">
        <div class="flex items-center justify-between p-2 hover:bg-gray-700">
          <div class="flex items-center">
            <i class="fas fa-file-alt mr-2"></i>
            <span>Documentación</span>
          </div>
          <i class="fas fa-chevron-down text-xs"></i>
        </div>
        <ul class="desplegable ml-4 hidden">
          <li>
            <a href="#" class="block p-2 hover:bg-gray-700 flex items-center">
              <i class="fas fa-chevron-right mr-2 text-xs"></i>
              Firmas pendientes
            </a>
          </li>
          <li>
            <a href="#" class="block p-2 hover:bg-gray-700 flex items-center">
              <i class="fas fa-chevron-right mr-2 text-xs"></i>
              Documentos
            </a>
          </li>
        </ul>
      </li>
      
      <li class="opcion-con-desplegable">
      <a href="/admin">
        <div class="flex items-center justify-between p-2 hover:bg-gray-700">
          <div class="flex items-center">
            <i class="fa fa-cog mr-2"></i>
            <span>사용자 관리</span>
          </div>
        </div>
        </a>
      </li>
      
     
      <li class="opcion-con-desplegable">
      <a href="/main/login">
        <div class="flex items-center justify-between p-2 hover:bg-gray-700">
        	<div class="flex items-center">
            <i class="fas fa-sign-in-alt fa-lg mr-3" style="color: #ffffff;"></i>
            <span>로그인</span>
          </div>
        </div>
        </a>
      </li>
      
      
      <li class="opcion-con-desplegable">
      <a href="/logout" onclick="return confirmLogout();">
        <div class="flex items-center justify-between p-2 hover:bg-gray-700">
        	<div class="flex items-center">
            <i class="fas fa-sign-out-alt fa-flip-horizontal fa-lg mr-3" style="color: #ffffff;"></i>
            <span>로그아웃</span>
          </div>
        </div>
        </a>
      </li>        
        
        
        
    </ul>
  </nav>
</aside>

<script>
  function confirmLogout() {
    return confirm("로그아웃을 진행하시겠습니까?");
  }
</script>
