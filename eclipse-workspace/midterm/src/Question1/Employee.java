package Question1;

public class Employee {
	private double baseSalary;
	
	private String name;
	private int id;
	private String ssn;
	private String address;
	private int age;
	private String departmentWorkIn;
	private String responsibilities;
	private final double salary;
	

	public Employee(String name, int id, String ssn, String address, int age, String departmentWorkIn,
			String responsibilities, double salary) {
		super();
		this.name = name;
		this.id = id;
		this.ssn = ssn;
		this.address = address;
		this.age = age;
		this.departmentWorkIn = departmentWorkIn;
		this.responsibilities = responsibilities;
		this.salary = salary;
	}
	
	public void reportingTo() {
		System.out.println("THe person they are reporting to");
	}
	
	public double baseSalary() {
		return this.baseSalary;
 	}
	
	
		
}