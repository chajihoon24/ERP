import java.time.LocalDate;
import java.time.LocalDateTime;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
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
	
	public void getList() {
		System.out.println("관리자계정 리스트 가져오기 테스트");
		for(Employee n: employeeRepository.getAll()) {
			System.out.println(n.getName());
		}
	}
	@Test
	public void name() {
		
		for(Notification n:notificationRepository.getAll("jihoon9998")) {
			
			System.out.println(n.toString());
		};
		
		
	}
	
	

}
