package hotsource.model.user;

import hotsource.domain.SnsProvider;

public interface SnsProviderDAO {

	public SnsProvider selectByName(String name);
	
}
