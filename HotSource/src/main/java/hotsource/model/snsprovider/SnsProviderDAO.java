package hotsource.model.snsprovider;

import hotsource.domain.SnsProvider;

public interface SnsProviderDAO {

	public SnsProvider selectByName(String name);
	
}
