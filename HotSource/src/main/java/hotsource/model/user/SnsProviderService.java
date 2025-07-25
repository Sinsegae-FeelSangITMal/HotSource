package hotsource.model.user;

import hotsource.domain.SnsProvider;

public interface SnsProviderService {

	public SnsProvider selectByName(String name);
	
}
