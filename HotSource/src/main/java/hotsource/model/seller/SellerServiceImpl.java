package hotsource.model.seller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hotsource.domain.Seller;
import hotsource.exception.SellerException;

@Service
public class SellerServiceImpl implements SellerService {
	
	@Autowired
	private SellerDAO sellerDAO;
	
	@Override
	public List selectAll() {
		return sellerDAO.selectAll();
	}

	@Override
	public Seller select(long user_id) {
		return sellerDAO.select(user_id);
	}

	@Override
	public Seller selectByUserId(long user_id) {
		return sellerDAO.selectByUserId(user_id);
	}

	@Override
	public void regist(Seller seller) throws SellerException {
		sellerDAO.insert(seller);
	}
}
