package Question1;

public class comissionedEmployee extends Employee {

	private double sales;
	
	public salariedEmployee( String name, int id, String ssn, String address, int age, String departmentWorkIn,
					String responsibilities, double salary, double workHours)
	{
		super(name, id, ssn, address, age, departmentWorkIn, responsibilities, salary, workHours);

		this.sales = workHours;f
	}
			
	public double totalSalary() {
		return this.sales * 10 + salary;
	}
	
}
