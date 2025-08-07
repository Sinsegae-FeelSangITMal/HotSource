package hotsource.controller.seller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import hotsource.domain.Asset;
import hotsource.domain.AssetKeywordMapping;
import hotsource.domain.Keyword;
import hotsource.domain.Seller;
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
	public ModelAndView updateForm(@RequestParam("asset_id") long asset_id) {
		ModelAndView mav = new ModelAndView();
		
		Asset asset = assetService.select(asset_id);
		
		mav.addObject("asset", asset);
		mav.setViewName("/seller/dashboard/asset_update");

	    return mav;
	}
	
	@PostMapping("/dashboard/asset/update")
	@ResponseBody
	public Map<String, String> update(
	        Asset asset,
	        @RequestParam("photo") MultipartFile[] imgFiles,
	        @RequestParam("uploadFiles") MultipartFile[] assetFiles,
	        @RequestParam("keywords") String keywordString,
	        HttpServletRequest request,
	        HttpSession session) {

	    asset.setSeller((Seller) session.getAttribute("seller"));

	    Map<String, String> result = new HashMap<>();
	    try {
	        assetService.updateFullAsset(asset, imgFiles, assetFiles, keywordString, request);
	        result.put("status", "success");
	    } catch (Exception e) {
	        e.printStackTrace();
	        result.put("status", "fail");
	    }
	    return result;
	}

}
