package co.grandcircus.tasklist.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;


@Entity
public class Task {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "taskId", nullable = false, updatable = false)
	private Long id;
	private String taskname;
	private Date duedate;
	private boolean complete;
	
	// annotate many-to-one relationships
	@ManyToOne
	private User user;
	
	public Task () {}

	public Task(Long id, String taskname, Date duedate, boolean complete, User user) {
		super();
		this.id = id;
		this.taskname = taskname;
		this.duedate = duedate;
		this.complete = complete;
		this.user = user;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTaskname() {
		return taskname;
	}

	public void setTaskname(String taskname) {
		this.taskname = taskname;
	}

	public Date getDuedate() {
		return duedate;
	}

	public void setDuedate(Date duedate) {
		this.duedate = duedate;
	}

	public boolean isComplete() {
		return complete;
	}

	public void setComplete(boolean complete) {
		this.complete = complete;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Override
	public String toString() {
		return "Task [id=" + id + ", taskname=" + taskname + ", duedate=" + duedate + ", complete=" + complete
				+ ", user=" + user + "]";
	}
	
}