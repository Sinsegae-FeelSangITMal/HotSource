package hotsource.model.topcategory;

import java.util.List;

public interface TopCategoryDAO {

	public List selectAll();
	public List select(int topcategory_id);
}
