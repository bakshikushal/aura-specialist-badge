public class Employee
{
	private String emp_name;
    private Integer emp_age;
    private String emp_desg;
    
    public Employee()
    {
        emp_name = 'New Employee';
        emp_age = 25;
        emp_desg = 'Fresher';    
    }
	
    public Employee(String emp_name, Integer emp_age, String emp_desg)
    {
        this.emp_name = emp_name;
        this.emp_age = emp_age;
        this.emp_desg = emp_desg;
    }
    
    public void setEmpName(String emp_name)
    {
        this.emp_name = emp_name;
    }
	
    public void setEmpage(Integer emp_age)
    {
        this.emp_age = emp_age;
    }
    
    public void setEmpDesg(String emp_desg)
    {
        this.emp_desg = emp_desg;
    }
    
    public String getEmpName()
    {
        return emp_name;
    }
	
    public Integer getEmpage()
    {
        return emp_age;
    }
    
    public String getEmpDesg()
    {
        return emp_desg;
    }
    
}