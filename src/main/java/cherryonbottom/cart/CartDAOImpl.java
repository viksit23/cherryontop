package cherryonbottom.cart;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.EnableTransactionManagement;
@Repository
@EnableTransactionManagement
public class CartDAOImpl implements CartDAO {

	

	@Autowired
	private SessionFactory sessionFactory;
 
	public SessionFactory getSessionFactory() 
	{
		return sessionFactory.getCurrentSession().getSessionFactory();
	}

	public void setSessionFactory(SessionFactory sessionFactory) 
	{
		this.sessionFactory = sessionFactory;
	}
	
	@Transactional
	public Cart getCartById(int cartId) {
		List l = sessionFactory.getCurrentSession().createQuery("from Cart where ID = :id").setInteger("id", cartId).list();
		
		if( l.size() > 0 )
			return (Cart)l.get(0);
		else
			return null;
	}
	
	

	@Transactional
	public Cart getCartByUsername(String Username) {
		List l = sessionFactory.getCurrentSession().createQuery("from Cart where Username = :Username").setString("Username", Username).list();
		
		if( l.size() > 0 )
			return (Cart)l.get(0);
		else
			return null;
	}

	public Cart getCartByProductID(int cartProductID) {
		// TODO Auto-generated method stub
		return null;
	}

	public String checkUsername(String Username) {
		// TODO Auto-generated method stub
		return null;
	}

	public void update(Cart cart) {
		// TODO Auto-generated method stub
		
	}

	public void add(Cart cart) {
		// TODO Auto-generated method stub
		
	}

	public void delete(int i) {
		// TODO Auto-generated method stub
		
	}

	public void deleteByProductId(int pid) {
		// TODO Auto-generated method stub
		
	}

	public List<Cart> getAllProduct() {
		// TODO Auto-generated method stub
		return null;
	}
}
