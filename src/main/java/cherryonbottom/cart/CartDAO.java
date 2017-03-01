package cherryonbottom.cart;

import java.util.List;

public interface CartDAO {
Cart getCartById(int cartId);
	
	Cart getCartByUsername(String Username);
	
	Cart getCartByProductID(int cartProductID);
	
	String checkUsername(String Username);

    void update(Cart cart);
    
    void add(Cart cart);
    
    void delete(int i);
    
    void deleteByProductId(int pid);
    
    public List<Cart> getAllProduct();

}

