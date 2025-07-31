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
	
	// 파일업로드 메서드, 파일명만 배열로 return
	public List imgUpload(MultipartFile[] photo, String savePath) throws UploadException {
		
		List imgList = new ArrayList<>();
		
		try {
			for(int i=0; i <photo.length; i++) {
				String ori = photo[i].getOriginalFilename();
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
		File directory = new File(savePath, "seller_"+seller.getSeller_id());
		
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