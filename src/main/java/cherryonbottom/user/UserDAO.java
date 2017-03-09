package cherryonbottom.user;

import java.util.List;


public interface UserDAO 
{
	public void insertUser(User u);
	
	public List<User> getAllUsers();

	public User getuName(String username);
}
