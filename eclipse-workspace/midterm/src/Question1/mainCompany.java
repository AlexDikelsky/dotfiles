
public class mainCompany
{
	public static void main(String args[])
	{
		
		
		Employee[] emps=new Employee[2];
		emps[0]=new salariedEmployee("William",1,"222-33-6525", "add", 31,"HR","HR work",2000,15);
		//Name, ID, SSN, Address, Age, DepartmentWorkIn, Responsibilities,salary,work Hour
		//int[] hrs={3,4,2,8};
		 emps[1]=new salariedEmployee("Angela",2,"111-33-6525", "sdf", 23,"Sale","Sale work",1400,15);
		//Name, ID, SSN, Address, Age, DepartmentWorkIn, Responsibilities,salary,sales per week
		 
		 double sum = 0.0;
		 for (Employee asdf : emps) {
			 sum = sum + asdf.totalSalary();
		 }
		 System.out.println(sum);
	}
}
