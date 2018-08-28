package co.grandcircus.tasklist;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import co.grandcircus.tasklist.dao.TaskDao;
import co.grandcircus.tasklist.dao.UserDao;
import co.grandcircus.tasklist.entity.Task;
import co.grandcircus.tasklist.entity.User;

@Controller
public class TasklistController {
	
	@Autowired
	private TaskDao taskDao;
	@Autowired
	private UserDao userDao;

	@RequestMapping("/")
	public ModelAndView home() {
//		return "redirect:/tasks";
		ModelAndView mav = new ModelAndView("index");
		return mav;
	}

	@RequestMapping("/tasks")
	public ModelAndView listTasks() {
		ModelAndView mav = new ModelAndView("task-list");
		mav.addObject("tasks", taskDao.findAll());
		return mav;
	}
	
	@RequestMapping("/tasks/{id}")
	public ModelAndView showTasks(@PathVariable("id") Task task) {
		ModelAndView mav = new ModelAndView("task-show");
		mav.addObject("task", task);
		return mav;
	}

	@RequestMapping("/tasks/{id}/edit")
	public ModelAndView editTasks(@PathVariable("id") Task task) {
		ModelAndView mav = new ModelAndView("task-edit");
		mav.addObject("task", task);
		return mav;
	}

	@PostMapping("/tasks/{id}/edit")
	public ModelAndView submitEditTasks(@ModelAttribute("id") Task task) {
		taskDao.save(task);
		ModelAndView mav = new ModelAndView("redirect:/tasks/" + task.getId());
		return mav;
	}

	@RequestMapping("/tasks/add")
	public ModelAndView addTask() {
		ModelAndView mav = new ModelAndView("task-add");
		return mav;
	}

	@PostMapping("/tasks/add")
	public ModelAndView submitAddBootcamp(Task task) {
		taskDao.save(task);
		ModelAndView mav = new ModelAndView("redirect:/tasks");
		return mav;
	}

	@RequestMapping("/tasks/{id}/delete")
	public ModelAndView editTask(@PathVariable("id") Long id) {
		taskDao.deleteById(id);
		ModelAndView mav = new ModelAndView("redirect:/tasks");
		return mav;
	}

	@RequestMapping("/tasks/{id}/remove-user")
	public ModelAndView removeUser(
			@PathVariable("id") Long taskId,
			@RequestParam("userId") User user) {
		// The student - bootcamp relationship is owned by the student, so
		// we need to update and save the student.
		user.setTask(null);
		userDao.save(user);
		
		ModelAndView mav = new ModelAndView("redirect:/tasks/" + taskId);	
		return mav;
	}
}

