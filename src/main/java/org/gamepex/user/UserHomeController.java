package org.bookrental.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserHomeController {

	@GetMapping("/user") // 사용자 요청 URL(/user)을 매핑한다.
	public String home() {
		return "user/index"; // views/user/index.jsp
	}
	
}
