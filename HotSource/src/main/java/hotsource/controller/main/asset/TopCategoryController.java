package hotsource.controller.main.asset;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import hotsource.model.topcategory.TopCategoryService;

@Controller
@RequestMapping("/asset")
public class TopCategoryController {
	@Autowired
	private TopCategoryService topCategoryService;
	
	@GetMapping("/topcategory/list")
	@ResponseBody  //응답 데이터 형식이 html 문서가 아닌, json 등의 순수 데이터 일 경우
							//ViewResolver 인 InternalResourceViewResolver가 동작하지 않음	
							//접두어 , 접미어의 조합을 시도하지 않음. 즉 reponse.setContentType("application/json")	
	public List selectAll(){
		//List를 json문자열로 변환해야한다..
		List topList=topCategoryService.selectAll();
		//스프링을 사용하지 않을 경우, 개발자가 List를 Gson 또는 직접 json문자열로 응답 정보를 만들어야 
		//하지만, 스프링은 개발에 필요한 모든것을 지원하는 프레임웍이므로, 코드를 단순화 시켜줌 
		return topList;
	}
}