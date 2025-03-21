package com.erp.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.erp.domain.ErpUser;
import com.erp.repository.ErpUserRepository;

@Service
public class CustomUserDetailsService implements UserDetailsService {
	
	@Autowired
	ErpUserRepository erpUserRepository;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		ErpUser user = erpUserRepository.getUserByUsername(username);
		System.out.println("커스텀진입"+user.getPassword());
        if (user == null) {
            throw new UsernameNotFoundException("User not found with username: " + username);
        }
        
        // 암호화된 비밀번호는 DB에서 가져오고, 로그인 시 입력한 비밀번호는 Spring Security가 비교
        return new CustomUserDetails(user);
  
	}

}
