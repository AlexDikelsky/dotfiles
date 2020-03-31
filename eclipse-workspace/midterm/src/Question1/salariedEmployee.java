package Question1;

public class salariedEmployee extends Employee {

	private double workHours;
	
	public salariedEmployee( String name, int id, String ssn, String address, int age, String departmentWorkIn,
			String responsibilities, double salary, double workHours) {
		super(name, id, ssn, address, age, departmentWorkIn, responsibilities, salary, workHours)
		this.workHours = workHours;
	}
	
	public double totalSalary() {
		return this.workHours * 10.0 + this.salary;
	}
		
		
}
