package been;
public class user
{
	String name,password;
	public void setn(String n)
	{
		name=n;
		
	}
	public void setp(String p)
	{
		password=p;
		
	}
	public String getp()
	{
		return password;
	}
	public String getn()
	{
		return name;
	}
}