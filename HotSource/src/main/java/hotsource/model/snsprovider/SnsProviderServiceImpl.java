package hotsource.model.snsprovider;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hotsource.domain.SnsProvider;

@Service
public class SnsProviderServiceImpl implements SnsProviderService{

	@Autowired
	private SnsProviderDAO snsProviderDAO;
	
	@Override
	public SnsProvider selectByName(String name) {
		return snsProviderDAO.selectByName(name);
	}

}
