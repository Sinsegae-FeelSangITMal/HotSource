package hotsource.model.role;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RoleServiceImpl implements RoleService {
	
	@Autowired
	private RoleDAO roleDAO;
	
	@Override
	public List selectAll() {
		return roleDAO.selectAll();
	}
}
