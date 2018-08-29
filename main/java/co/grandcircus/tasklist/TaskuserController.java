package co.grandcircus.tasklist;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import co.grandcircus.tasklist.dao.TaskDao;
import co.grandcircus.tasklist.dao.UserDao;
import co.grandcircus.tasklist.entity.User;

@Controller
public class TaskuserController {

	@Autowired
	private TaskDao taskDao;
	@Autowired
	private UserDao userDao;

//	@RequestMapping("/users")
//	public String showUserList() {
//		return "redirect/users-list";
//	}
	
	@RequestMapping("/login")
	public ModelAndView showLoginForm() {
		return new ModelAndView("login");
	}

	@PostMapping("/login")
	public ModelAndView submitLoginForm(
			HttpSession session,
			@RequestParam("email") String email, 
			@RequestParam("password") String password) {
		User user = userDao.getByEmail("email");
		if (user != null && password.equals(user.getPassword())) {
			//match
			session.setAttribute("user", user);
			return new ModelAndView("redirect:/");
		} else {
			// Not a match
			ModelAndView mav = new ModelAndView("login");
			mav.addObject("message", "Sorry hacker scum, you guessed wrong, try again");
			return mav;
		}	
	}
	@RequestMapping("/logout")
	public ModelAndView logout(HttpSession session, RedirectAttributes redir) {
		session.invalidate();
		redir.addFlashAttribute("message", "Goodbye!!");
		return new ModelAndView("redirect:/");
	}
	
	@RequestMapping("/users")
	public ModelAndView listUsers() {
		ModelAndView mav = new ModelAndView("user-list");
		mav.addObject("username", userDao.findAll());
		return mav;
	}
	
	@RequestMapping("/users/{id}")
	public ModelAndView showUser(@PathVariable("id") User user) {
		ModelAndView mav = new ModelAndView("user-show");
		mav.addObject("user", user);
		mav.addObject("task", taskDao.findAllByOrderByTaskname());
		return mav;
	}

	@RequestMapping("/users/{id}/edit")
	public ModelAndView editUser(@PathVariable("id") User user) {
		ModelAndView mav = new ModelAndView("user-edit");
		mav.addObject("user", user);
		mav.addObject("task", taskDao.findAllByOrderByTaskname());
		return mav;
	}

	@PostMapping("/users/{id}/edit")
	public ModelAndView submitEditUser(@ModelAttribute("id") User user) {
		userDao.save(user);
		ModelAndView mav = new ModelAndView("redirect:/users/" + user.getId());
		return mav;
	}

	@RequestMapping("/register") //was /students/add
	public ModelAndView addUser() {
		ModelAndView mav = new ModelAndView("register");
		return mav;
	}

	@PostMapping("/register") //was /students/add
	public ModelAndView submitAddUser(User user, HttpSession session,
			@RequestParam("username") String username,
			@RequestParam("email") String email, 
			@RequestParam("password") String password) {
		userDao.save(user);
		session.setAttribute("user", user);
		//id = userDao.findIdByUser();
		ModelAndView mav = new ModelAndView("redirect:/users/{user.id}");
		return mav;
	}

	@RequestMapping("/users/{id}/delete")
	public ModelAndView editUser(@PathVariable("id") Long id) {
		userDao.deleteById(id);
		ModelAndView mav = new ModelAndView("redirect:/users");
		return mav;
	}
}
