package cherryonbottom.catagory;

import java.util.List;

public interface CategoryDAO {

	void insert(Category c);
	void update(Category c);
	void delete(int cid);
	
	List<Category> getAllCategories();
	Category getCategory(int cid);
}
