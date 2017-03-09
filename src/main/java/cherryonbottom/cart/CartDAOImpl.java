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
	
	@SuppressWarnings("rawtypes")
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
	@Transactional
	public Cart getCartByProductID(int cartProductID) {
List l = sessionFactory.getCurrentSession().createQuery("from Cart where ProductID = :id").setInteger("id", cartProductID).list();
		
		if( l.size() > 0 )
			return (Cart)l.get(0);
		else
			return null;
	}

	@Transactional
	public String checkUsername(String Username) {
		List l = sessionFactory.getCurrentSession().createQuery("from Cart where Username = :Username").setString("Username", Username).list();
		
		if( l.size() == 0 )
			return "success";
		else
			return "failure";
		
	}

	@Transactional
	public void update(Cart cart) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().update(cart);
		
	}

	@Transactional
	public void add(Cart cart) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().save(cart);
		
	}

	@Transactional
	public void delete(int i) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().createQuery("delete from Cart as i where i.ID = :id").setInteger("id", i).executeUpdate();

		
	}

	@Transactional
	public void deleteByProductId(int pid) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().createQuery("delete from Cart as i where i.ProductId = :id").setInteger("id", pid).executeUpdate();

		
	}

	@SuppressWarnings("unchecked")
	@Transactional
	public List<Cart> getAllProduct() {
		
		return sessionFactory.getCurrentSession().createQuery("from Cart").list();
	}
}
