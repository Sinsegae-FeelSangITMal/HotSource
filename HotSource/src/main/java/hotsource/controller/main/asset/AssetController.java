package hotsource.controller.main.asset;

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
import hotsource.domain.User;
import hotsource.model.asset.AssetDetailDTO;
import hotsource.model.asset.AssetService;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class AssetController {

	@Autowired
	private AssetService assetService;
	
	@PostMapping("/asset/regist")
	@ResponseBody
	public Map<String, String> regist(
	        Asset asset,
	        @RequestParam("photo") MultipartFile[] imgFiles,
	        @RequestParam("uploadFiles") MultipartFile[] assetFiles,
	        @RequestParam("keywords") String keywordString,
	        HttpServletRequest request,
	        HttpSession session) {

	    asset.setSeller((Seller) session.getAttribute("seller"));

	    Map<String, String> result = new HashMap<>();
	    try {
	        assetService.registFullAsset(asset, imgFiles, assetFiles, keywordString, request);
	        result.put("status", "success");
	    } catch (Exception e) {
	        result.put("status", "fail");
	        e.printStackTrace(); // 혹은 로그
	    }
	    return result;
	}
	
	@GetMapping("/asset/detail")
	public ModelAndView getDetail(@RequestParam long asset_id, HttpSession session) {
		ModelAndView mav = new ModelAndView("main/asset/product-details");
		
		User user = (User)session.getAttribute("user");
		//로그인 안했으면 
		AssetDetailDTO dto = assetService.getDetail(asset_id, (user == null ? 0 : user.getUser_id()));
		mav.addObject("assetDetailDTO", dto);
		
		return mav;
	}

}
