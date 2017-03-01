package cherryonbottom.user;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
@Transactional
public class UserDAOImpl implements UserDAO {

	@Autowired
	SessionFactory sf;

	public void insertUser(User u) {
		// TODO Auto-generated method stub
		sf.getCurrentSession().save(u);
	}

	public List<User> getAllUsers() {
		// TODO Auto-generated method stub
		
		return sf.getCurrentSession().createQuery("from User u").list();
	}
}





