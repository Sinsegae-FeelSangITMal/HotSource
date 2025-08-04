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
import org.springframework.web.bind.annotation.RequestMapping;
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
	    
	    // 키워드 문자열 파싱 및 중복 제거
	    String[] keywordArr = keywordString.split(",");
	    Set<String> keywordSet = Arrays.stream(keywordArr)
	        .map(String::trim)
	        .filter(s -> !s.isEmpty())
	        .collect(Collectors.toSet());

	    List<AssetKeywordMapping> keywordMappingList = new ArrayList<>();
	    for (String keywordName : keywordSet) {
	        Keyword keyword = new Keyword();
	        keyword.setKeyword_name(keywordName);

	        AssetKeywordMapping mapping = new AssetKeywordMapping();
	        mapping.setKeyword(keyword);
	        keywordMappingList.add(mapping);
	    }
	    asset.setKeywordList(keywordMappingList);
	    // Asset에 키워드 리스트 대입 
	    
	    assetService.regist(asset);
	    
	    assetService.saveAssetFiles(asset.getAsset_id(), imgFiles, assetFiles, request);

	    Map<String, String> result = new HashMap();
	    result.put("status", "success");
	    return result;
	}
	

}
