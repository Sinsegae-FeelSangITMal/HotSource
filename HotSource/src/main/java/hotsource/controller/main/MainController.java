package hotsource.controller.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import hotsource.model.asset.AssetService;
import hotsource.model.keyword.KeywordService;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MainController {

	@Autowired
	private AssetService assetService;
	
	@Autowired
	private KeywordService keywordService;
	
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
		
		List keywordList = keywordService.selectAll();
		
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

		mav.addObject("keywordList", keywordList);
		
		return mav;
	}

	// 종합 검색
	@RequestMapping(value="/sale")
	public ModelAndView searchAll() {
		List saleList = assetService.selectSaleAll();
		
		log.debug("sssssssssaleList :"+ saleList);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("main/search_sale");
		mav.addObject("saleList", saleList);
		
		return mav;
	}
	
	// 이미지 상품 리스트
	@RequestMapping(value="/images")
	public ModelAndView imageList() {
		List imgHotList = assetService.selectHot(1);
		List imgNewList = assetService.selectNew(1);
		List imgFreeList = assetService.selectFree(1);
		List imgSaleList = assetService.selectSale(1);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("main/search_image");
		mav.addObject("imgHotList", imgHotList);
		mav.addObject("imgNewList", imgNewList);
		mav.addObject("imgFreeList", imgFreeList);
		mav.addObject("imgSaleList", imgSaleList);
		
		return mav;
	}
	
	// 사운드 상품 리스트
	@RequestMapping(value="/sounds")
	public ModelAndView soundList() {
		List bgmHotList = assetService.selectHot(2);
		List bgmNewList = assetService.selectNew(2);
		List bgmFreeList = assetService.selectFree(2);
		List bgmSaleList = assetService.selectSale(2);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("main/search_sound");
		mav.addObject("bgmHotList", bgmHotList);
		mav.addObject("bgmNewList", bgmNewList);
		mav.addObject("bgmFreeList", bgmFreeList);
		mav.addObject("bgmSaleList", bgmSaleList);
		
		return mav;
	}
	
}
