package hotsource.controller.seller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DashboardController {

	@GetMapping("/dashboard/projectList")
	public String getListPage() {
		return "/seller/dashboard/projectList";
	}
	
	@GetMapping("/dashboard/createProject")
	public String getCreatePage() {
		return "/seller/dashboard/createProject";
	}
}
