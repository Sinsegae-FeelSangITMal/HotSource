package hotsource.model.seller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import hotsource.domain.Seller;
import hotsource.exception.SellerException;
import hotsource.util.FileManager;

@Service
public class SellerServiceImpl implements SellerService {
	
	@Autowired
	private SellerDAO sellerDAO;
	
	@Autowired
	private FileManager fileManager;
	
	@Override
	public List selectAll() {
		return sellerDAO.selectAll();
	}

	@Override
	public Seller selectBySellerId(long seller_id) {
		return sellerDAO.selectBySellerId(seller_id);
	}

	@Override
	public Seller selectByUserId(long user_id) {
		return sellerDAO.selectByUserId(user_id);
	}

	@Override
	@Transactional
	public void regist(Seller seller, String savePath) throws SellerException {
		fileManager.sellerImgSave(seller, savePath);
		
		sellerDAO.insert(seller);
		
	}
}
