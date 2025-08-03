package hotsource.util;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import hotsource.domain.Asset;
import hotsource.domain.AssetImg;
import hotsource.domain.Seller;
import hotsource.exception.UploadException;
import lombok.extern.slf4j.Slf4j;

@Component 
@Slf4j
public class FileManager{

	public void save(Asset asset, String savePath) throws UploadException{
		
		// 파일 수가 복수이므로 상품마다 1:1 대응하는 디렉토리를 생성
		File directory = new File(savePath, Long.toString(asset.getAsset_id()));					// 루트 디렉토리 / 하위 디렉토리 : p_23, p_7 --> 확장자가 없어서 폴더로 만들어짐
		
		//MultipartFile 변수와 html 이름이 동일하면 매핑됨 
		MultipartFile[] photo = asset.getPhoto();
		log.debug("업로드 한 파일의 수는 "+photo.length);
		
		List imgList = new ArrayList<>();
		
			try {
				for (int i=0; i<photo.length; i++) {
					// 확장자 구하기 (원본 이미지 정보 추출)
					log.debug("원본 파일명은 " + photo[i].getOriginalFilename());
					String ori = photo[i].getOriginalFilename();
					String ext = ori.substring(ori.lastIndexOf(".")+1, ori.length());
					
					// 개발자가 원하는 파일명 생성하기
					try {
						Thread.sleep(10);	// 연산 속도가 너무 빠르면 파일명이 중복될 수 있음
					} catch (InterruptedException e) {
						e.printStackTrace();
					}		
					
					long time =  System.currentTimeMillis();
					String filename = time + "." + ext;																					// --> 확장자가 붙어 파일로 만들어짐
					
					// 생성한 파일명을 DB 저장하기 위해 Product의 imgList에 보관해놓자
					AssetImg assetImg = new AssetImg();
					assetImg.setAsset_img_url(filename);		// 이미지명 저장
					imgList.add(assetImg);
					asset.setImgList(imgList);
					
					// realPath를 사용하려면 앱의 전반적인 전역적 정보를 가진 객체인 ServletContext가 필요					
					File file = new File(directory.getAbsolutePath() + File.separator + filename);			// absolute: 하드디스크 풀 경로
					log.debug("업로드 된 이미지가 생성된 경로는 " + savePath);
					
					photo[i].transferTo(file);			// 메모리상의 파일 정보가, 실제 디스크상으로 존재하게 되는 시점
				}
			} catch (Exception e) {
				e.printStackTrace();
				throw new UploadException("파일 업로드 실패", e);
			}		
	}
	
	// 상품 이미지 삭제 (지정한 상품의 디렉토리 및 하위 파일들)
	// savePath = ~/data 디렉토리까지
	public void remove(Asset asset, String savePath) {
		// 디렉토리를 지우기 위해서는 하위 파일들이 먼저 삭제되어야 함
		// 1. 조사 대상 디렉토리를 지정
		File directory = new File(savePath, Long.toString(asset.getAsset_id()));
		
		// 2. 디렉토리가 존재할 경우 하위 파일 삭제
		if (directory.exists() && directory.isDirectory()) {		// '디렉토리'가 맞고 '존재'하는지
			// 하위 파일들이 존재하는지 목록 얻기
			File[] files = directory.listFiles();
			
			if (files != null) {		// 파일이 존재한다면
				// 파일의 수 만큼 삭제
				for (File file : files) {
					boolean deleted =  file.delete();			// 파일 삭제 후 결과 반환
					log.debug(file.getName()+"를 삭제한 결과 : "+deleted);
				}
			}
			
			// 3. 디렉토리 삭제
			boolean result = directory.delete();
			
			if (result==false)
				log.warn("디렉토리 삭제 실패 : "+directory.getAbsolutePath());
		}
	}
	
	// 파일업로드 메서드, 파일명만 배열로 return
	public List imgUpload(MultipartFile[] photo, String savePath) throws UploadException {
		
		List imgList = new ArrayList<>();
		
		try {
			for(int i=0; i <photo.length; i++) {
				String ori = photo[i].getOriginalFilename();
				if (ori == null || ori.isEmpty()) {
				    log.warn("원본 파일명이 null이거나 비어있습니다. index={}", i);
				    continue;
				}
				String ext = ori.substring(ori.lastIndexOf(".")+1, ori.length());
				String filename = UUID.randomUUID().toString() + "." + ext;
				log.debug("filename:"+filename);
				
				imgList.add(filename);
				
				File file = new File(savePath + File.separator + filename);
				log.debug("이미지가 저장된 전체 경로: " + file.getAbsolutePath());
				
				photo[i].transferTo(file);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new UploadException("파일 업로드 실패 ", e);
		}
		
		return imgList;
	}
	
	// 에셋 이미지파일 저장 
	public void assetImgSave(Asset asset, String savePath) throws UploadException{
		File directory = new File(savePath, "data_"+asset.getAsset_id());
		
		MultipartFile[] photo = asset.getPhoto();
		log.debug("업로드 한 파일의 수는 "+photo.length);
		
		List imgList = new ArrayList();
		
		try {
			for(int i=0; i<photo.length; i++) {
				log.debug("원본 파일명은 "+ photo[i].getOriginalFilename());
				String ori = photo[i].getOriginalFilename();
				
				String ext = ori.substring(ori.lastIndexOf(".")+1, ori.length());
				
				String filename = UUID.randomUUID().toString() + "." + ext;
				
				AssetImg assetImg = new AssetImg();
				assetImg.setAsset_img_url(filename);
				imgList.add(assetImg);
				asset.setImgList(imgList);
				
				File file = new File(directory.getAbsoluteFile() + File.separator + filename);
				log.debug("업로드된 이미지가 생성된 경로는 "+savePath);
				
				photo[i].transferTo(file);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new UploadException("파일 업로드 실패 ",e);
		}
	}
	
	//판매자 이미지파일 저장 
	public void sellerImgSave(Seller seller, String savePath) throws UploadException{
		
		log.debug("seller Id:"+ seller.getSeller_id());
		File directory = new File(savePath+"/"+seller.getSeller_id());
		
		MultipartFile photo = seller.getSeller_profile();
		
		try {
			String ori = photo.getOriginalFilename();
			String ext = ori.substring(ori.lastIndexOf(".")+1, ori.length());
			String filename = UUID.randomUUID().toString() + "." + ext;
			
			seller.setProfile_img_url(filename);
			
			File file = new File(directory.getAbsoluteFile() + File.separator + filename);
			log.debug("이미지가 저장된 전체 경로: " + file.getAbsolutePath());
			
			photo.transferTo(file);
		} catch (Exception e) {
			e.printStackTrace();
			throw new UploadException("파일 업로드 실패 ",e);
		}
	}
	
	// 에셋 이미지파일 삭제 
	public void assetImgRemove(Asset asset, String savePath) {
		File directory = new File(savePath, "data_"+asset.getAsset_id());
		
		if(directory.exists() && directory.isDirectory()) {
			File[] files = directory.listFiles();
			
			if(files != null) {
				for (File file:files) {
					boolean deleted = file.delete();
					log.debug(file.getName() +"를 삭제한 결과" + deleted);
				}
			}
			
			boolean result = directory.delete();
			
			if(result == false) {
				log.warn("디렉토리 삭제 실패"+ directory.getAbsolutePath());
			}
		}
	}
	

}