package cherryonbottom.catagory;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
@Transactional
public class CategoryDAOImpl implements CategoryDAO {

	@Autowired
	SessionFactory sf;
	
	public void insert(Category c) {
		sf.getCurrentSession().save(c);
	}

	public void update(Category c) {
		sf.getCurrentSession().update(c);
	}

	public void delete(int cid) {
		sf.getCurrentSession().createQuery("delete from Category c where c.id = :ID").setInteger("ID", cid).executeUpdate();
	}

	public List<Category> getAllCategories() {
		return sf.getCurrentSession().createQuery("from Category c").list();
	}

	public Category getCategory(int cid) {
		return (Category)sf.getCurrentSession().createQuery("from Category c where c.id = :ID").setInteger("ID", cid).list().get(0);
	}

}
