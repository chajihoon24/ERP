import java.time.LocalDate;
import java.time.LocalDateTime;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.erp.domain.Department;
import com.erp.domain.Employee;
import com.erp.domain.ErpUser;
import com.erp.domain.Notice;
import com.erp.domain.Notification;
import com.erp.repository.DepartmentRepository;
import com.erp.repository.EmployeeRepository;
import com.erp.repository.ErpUserRepository;
import com.erp.repository.NoticeRepository;
import com.erp.repository.NotificationRepository;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= { "file:src/main/webapp/WEB-INF/spring/config/applicationContext.xml" })
public class SpringTest {
	
	@Autowired
	ErpUserRepository userRepository;
	@Autowired
	NoticeRepository noticeRepository;
	@Autowired
	EmployeeRepository employeeRepository;
	@Autowired
	DepartmentRepository departmentRepository;
	@Autowired
	NotificationRepository  notificationRepository;
	
	
	public void insertSampleUser() {
		System.out.println("notice 생성 테스트");
		
		
		for(int i = 5 ; i<9 ; i++) {
		Notice user = new Notice();
		
		user.setType("NOTICE");
		user.setAuthor("관리자");
		user.setTitle("테스트의 건 "+i);
		user.setContent("sample");
		
		
        LocalDateTime currentDateTime = LocalDateTime.now();
        user.setCreatedAt(currentDateTime);	
		
		
        noticeRepository.insertNotice(user);
		
		
		}
	}
	

	@Test
	public void name() {
		Employee employee = new Employee();
		
		employee.setId(1);
		employee.setName("수정수정");
		employee.setNotes("안녕하세요 안녀앙아ㅏ아아아");
		
		employeeRepository.updateEmployee(employee);
		
	}
	
	

}
