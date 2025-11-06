package org.bookrental.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminHomeController {
	
	@GetMapping("/admin")
	// http://localhost:8080/admin(/admin) URL 요청을 매핑한다.
	public String home() {
		return "admin/index";
		// WEB-INF/views/admin/index.jsp를 브라우저에 출력한다.
	}

}
