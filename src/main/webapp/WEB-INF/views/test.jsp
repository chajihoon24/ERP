

<script>
	$('#sendPayroll').click(function(){
	
	const basicSalary = $('#basicSalaryI').val()
	const bonus = $('#bonusI').val()
	const positionAllowance = $('#positionAllowanceI').val()
	const nightWorkHours = $('#nightWorkHoursI').val()
	const specialAllowance = $('#specialAllowanceI').val()
	const reportYear = $('#reportYear').val()
	const reportMonth = $('#reportMonth').val()
	const realTotal = parseFloat($('#realTotal').val().replace(/,/g, '')) || 0;
	
	const data ={basicSalary,bonus}
	
	
	$.ajax
	
	})	
	
</script>