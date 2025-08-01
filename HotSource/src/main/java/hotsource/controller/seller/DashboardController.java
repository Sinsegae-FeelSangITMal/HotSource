package hotsource.controller.seller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DashboardController {

	@GetMapping("/dashboard/assetList")
	public String getListPage() {
		return "/seller/dashboard/asset_list";
	}
	
	@GetMapping("/dashboard/assetCreate")
	public String getCreatePage() {
		return "/seller/dashboard/asset_create";
	}
}
