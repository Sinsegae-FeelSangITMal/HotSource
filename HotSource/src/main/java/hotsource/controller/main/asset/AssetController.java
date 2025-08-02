package hotsource.controller.main.asset;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import hotsource.domain.Asset;
import hotsource.domain.Seller;
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
	        @RequestParam(name = "sale", required = false) Integer salePercent,
	        HttpServletRequest request,
	        HttpSession session) {
		log.debug("에셋 등록시 seller :"+ (Seller) session.getAttribute("seller"));

	    asset.setSeller((Seller) session.getAttribute("seller"));

	    assetService.regist(asset);
	    assetService.saveAssetFiles(asset.getAsset_id(), imgFiles, assetFiles, request);

	    Map<String, String> result = new HashMap();
	    result.put("status", "success");
	    return result;
	}

}
