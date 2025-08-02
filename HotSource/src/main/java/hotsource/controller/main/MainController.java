package hotsource.controller.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import hotsource.model.asset.AssetService;

@Controller
public class MainController {

	@Autowired
	private AssetService assetService;
	
	@RequestMapping(value= "/index", method=RequestMethod.GET)
	public ModelAndView getMain() {
		List imgHotList = assetService.selectHot(1);
		List imgNewList = assetService.selectNew(1);
		List imgFreeList = assetService.selectFree(1);
		List imgSaleList = assetService.selectSale(1);
		List bgmHotList = assetService.selectHot(2);
		List bgmNewList = assetService.selectNew(2);
		List bgmFreeList = assetService.selectFree(2);
		List bgmSaleList = assetService.selectSale(2);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("main/index");
		mav.addObject("imgHotList", imgHotList);
		mav.addObject("imgNewList", imgNewList);
		mav.addObject("imgFreeList", imgFreeList);
		mav.addObject("imgSaleList", imgSaleList);
		mav.addObject("bgmHotList", bgmHotList);
		mav.addObject("bgmNewList", bgmNewList);
		mav.addObject("bgmFreeList", bgmFreeList);
		mav.addObject("bgmSaleList", bgmSaleList);
		
		return mav;
	}

	// 종합 검색
	@RequestMapping(value="/search")
	public String searchAll() {
		return "main/search_all";
	}
	
	// 이미지 상품 리스트
	@RequestMapping(value="/images")
	public String imageList() {
		return "main/search_resource";
	}
	
	// 사운드 상품 리스트
	@RequestMapping(value="/sounds")
	public String soundList() {
		return "main/search_resource";
	}
	
}
