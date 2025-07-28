package hotsource.model.seller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hotsource.domain.Seller;

@Service
public class SellerServiceImpl implements SellerService {
	
	@Autowired
	private SellerDAO sellerDAO;
	
	@Override
	public List selectAll() {
		return sellerDAO.selectAll();
	}

	@Override
	public Seller select(int user_id) {
		return sellerDAO.select(user_id);
	}

	@Override
	public Seller selectByUserId(int user_id) {
		return sellerDAO.selectByUserId(user_id);
	}
}
