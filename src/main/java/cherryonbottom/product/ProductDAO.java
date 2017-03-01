package cherryonbottom.product;

import java.util.List;

public interface ProductDAO {

	void insert(Product p);
	void update(Product p);
	void delete(int pid);
	
	List<Product> getAllProducts();
	Product getProduct(int pid);
	public Product getProductWithMaxId();
	
}
