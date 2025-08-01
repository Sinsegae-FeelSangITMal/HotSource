package hotsource.model.subcategory;

import java.util.List;

public interface SubCategoryDAO {
	public List selectAll();
	public List selectByTopCategoryId(int topcategory_id);	
}