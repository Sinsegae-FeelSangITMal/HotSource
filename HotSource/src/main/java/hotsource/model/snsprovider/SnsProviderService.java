package hotsource.model.snsprovider;

import hotsource.domain.SnsProvider;

public interface SnsProviderService {

	public SnsProvider selectByName(String name);
	
}
