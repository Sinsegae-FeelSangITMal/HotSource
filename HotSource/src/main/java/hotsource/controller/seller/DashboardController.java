package hotsource.controller.seller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import hotsource.domain.Asset;
import hotsource.model.asset.AssetService;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class DashboardController {
	
	@Autowired
	private AssetService assetService;

	@GetMapping("/dashboard/assetList")
	public String getListPage(@RequestParam("seller_id") long seller_id, HttpServletRequest request) {
	    List<Asset> assets = assetService.selectBySellerId(seller_id);
	    log.debug("assets :" + assets);
	    request.setAttribute("assets", assets);
	    return "/seller/dashboard/asset_list";
	}
	
	@GetMapping("/dashboard/assetCreate")
	public String getCreatePage() {
		return "/seller/dashboard/asset_create";
	}
	
	
	@GetMapping("/dashboard/asset/update")
	public ModelAndView update(@RequestParam("asset_id") long asset_id) {
		ModelAndView mav = new ModelAndView();
		
		Asset asset = assetService.select(asset_id);
		
		mav.addObject("asset", asset);
		mav.setViewName("/seller/dashboard/asset_update");

	    return mav;
	}
}
