package cherryonbottom.product;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
@Transactional
public class ProductDAOImpl implements ProductDAO {

	@Autowired
	SessionFactory sf;
	
	public void insert(Product p) {
		sf.getCurrentSession().save(p);
	}

	public void update(Product p) {
		sf.getCurrentSession().update(p);
	}

	public void delete(int pid) {
		sf.getCurrentSession().createQuery("delete from Product p where p.id = :ID").setInteger("ID", pid).executeUpdate();
	}

	public List<Product> getAllProducts() {
		return sf.getCurrentSession().createQuery("from Product p").list();
	}

	public Product getProduct(int pid) {
		return (Product)sf.getCurrentSession().createQuery("from Product p where p.id = :ID").setInteger("ID", pid).list().get(0);
	}

	@Transactional
	public Product getProductWithMaxId() 
	{
		List<Product> l = sf.getCurrentSession()
				.createQuery("from Product as p where p.ProductId = ( select max(a.ProductId) from Product as a )")
				.list();

		if (l.size() > 0) {
			return l.get(0);
		} else {
			return null;
		}
	
	}
}
