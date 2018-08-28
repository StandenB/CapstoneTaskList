package co.grandcircus.tasklist;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import co.grandcircus.tasklist.dao.TaskDao;
import co.grandcircus.tasklist.dao.UserDao;

@Controller
public class TaskuserController {

	@Autowired
	private TaskDao taskDao;
	@Autowired
	private UserDao userDao;

	@RequestMapping("/users")
	public String userList() {
		return "redirect/users-list";
	}
	@RequestMapping("/login")
	public String login() {
		return "redirect/users-list";
	}
	
}
