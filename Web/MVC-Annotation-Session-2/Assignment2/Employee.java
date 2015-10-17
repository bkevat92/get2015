/*
 * Pojo class for employee
 * @author Banwari Kevat
 */
public class Employee {
	String employeeName;
	int employeeId;
	String email;
	String dob;
	String dateOfJoining;
	int ctcPerAnnum;


	public String getEmployeeName() {
		return employeeName;
	}

	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}

	/*
	 * Parameterized Constructor
	 * @param employeeName
	 * @param employeeId
	 * @param email
	 * @param dateOfJoining
	 */
	public Employee(String employeeName, int employeeId, String email,
			String dateOfJoining) {
		super();
		this.employeeName = employeeName;
		this.employeeId = employeeId;
		this.email = email;
		this.dateOfJoining = dateOfJoining;

	}

	public Employee() {
		this.ctcPerAnnum = 18000;
		this.dob = "";
		this.dateOfJoining = "";

	}

	
	public int getemployeeId() {
		return employeeId;
	}

	
	public void setemployeeId(int employeeId) {
		this.employeeId = employeeId;
	}

	
	public String getemail() {
		return email;
	}

	
	public void setemail(String email) {
		this.email = email;
	}

	public String getdob() {
		return dob;
	}

	public void setdob(String dob) {
		this.dob = dob;
	}

	public String getdateOfJoining() {
		return dateOfJoining;
	}

	
	public void setdateOfJoining(String dateOfJoining) {
		this.dateOfJoining = dateOfJoining;
	}


	public int getCtcPerAnnum() {
		return ctcPerAnnum;
	}

	
	public void setCtcPerAnnum(int ctcPerAnnum) {
		this.ctcPerAnnum = ctcPerAnnum;
	}

}
