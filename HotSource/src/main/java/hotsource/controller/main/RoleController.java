package hotsource.controller.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import hotsource.model.role.RoleService;

@Controller
public class RoleController {

	@Autowired
	private RoleService roleService;
	
	public List selectAll() {
		return roleService.selectAll();
	}
}
