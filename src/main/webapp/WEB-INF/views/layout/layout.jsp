<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>ERP</title>
  <meta charset="UTF-8">
  <!-- Agregar el enlace al archivo de estilos de Tailwind CSS -->
  <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
  <!-- Agregar el enlace al archivo de la biblioteca FontAwesome -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,900;1,900&display=swap" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="/resources/css/main.css" />
		 <!--  차트 CDN -->
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
  		  <!-- jquery CDN -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body class="bg-gray-100">
	<jsp:include page="nav.jsp"/>
	
	<div class="flex">
	
		<jsp:include page="aside.jsp"/>
		
		<div class="content m-5 flex-grow">
	    <jsp:include page="${contentPage}"/> <!-- 동적으로 페이지 포함 -->
	    </div>
	    
	</div>
    
    
    
    <!-- asice component 설정 -->
 <script>
    document.addEventListener("DOMContentLoaded", function () {
      // Obtener todas las opciones principales con desplegables
      const opcionesConDesplegable = document.querySelectorAll(".opcion-con-desplegable");

  
      opcionesConDesplegable.forEach(function (opcion) {
        opcion.addEventListener("click", function () {
          // Obtener el desplegable asociado a la opción
          const desplegable = opcion.querySelector(".desplegable");

          // Alternar la clase "hidden" para mostrar u ocultar el desplegable
          desplegable.classList.toggle("hidden");
        });
      });
    });
  </script>
  
  <script>
  const ctx = document.getElementById('employeeLineChart').getContext('2d');
  const employeeLineChart = new Chart(ctx, {
      type: 'line',  // 꺾은선 그래프
      data: {
          labels: ['1월', '2월', '3월', '4월', '5월'],  // X축 레이블
          datasets: [{
              label: '직원 총수',  // 그래프 레이블
              data: [50, 60, 70, 50, 56],  // 각 달의 직원 수 데이터
              backgroundColor: 'rgba(54, 162, 235, 0.2)',  // 배경색
              borderColor: 'rgba(54, 162, 235, 1)',  // 선 색
              borderWidth: 2,  // 선 두께
              fill: true  // 배경을 채울지 여부 (true로 설정하면 그래프 아래 부분이 색으로 채워짐)
          }]
      },
      options: {
          responsive: true,  // 반응형 디자인
          maintainAspectRatio:false,  // 비율 유지하지 않기
          scales: {
              y: {
                  beginAtZero: true  // Y축이 0부터 시작
              }
          }
      }
  });
</script>
</body>
</html>