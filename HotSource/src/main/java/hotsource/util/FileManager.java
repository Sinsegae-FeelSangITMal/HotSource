package hotsource.util;

import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

// 이 객체의 존재가 없다면, 컨트롤러가 '업로드'라는 모델 영역의 업무를 수행하게 되므로
// 업로드 수행을 전담할 수 있는 모델 객체를 정의한다
// 이 객체는 DAO도 아니며, Service도 아니며, Controller도 아니므로, 스프링의 기본 컴포넌트
// 이외의 컴포넌트로 등록하면 된다.
@Component // ComponentScan의 대상이 될 수 있다. 따라서 자동으로 인스턴스 올라온다 
@Slf4j
public class FileManager{
	
}