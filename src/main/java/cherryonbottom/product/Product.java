package cherryonbottom.product;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

@Entity
public class Product {
	@Id @GeneratedValue(strategy=GenerationType.AUTO)
private int ProductId;
private String ProductName;
private String Description;
private int Price;
private String Quantity;
private String pImage;
private String ProductCategory;

@Transient
private MultipartFile ProductFile;

public int getProductId() {
	return ProductId;
}
public void setProductId(int productId) {
	ProductId = productId;
}
public String getProductName() {
	return ProductName;
}
public void setProductName(String productName) {
	ProductName = productName;
}


public String getDescription() {
	return Description;
}
public void setDescription(String description) {
	Description = description;
}
public int getPrice() {
	return Price;
}
public void setPrice(int price) {
	Price = price;
}


public String getQuantity() {
	return Quantity;
}
public void setQuantity(String quantity) {
	Quantity = quantity;
}
public MultipartFile getProductFile() {
	return ProductFile;
}
public void setProductFile(MultipartFile productFile) {
	ProductFile = productFile;
}
public String getpImage() {
	return pImage;
}
public void setpImage(String pImage) {
	this.pImage = pImage;
}
public String getProductCategory() {
	return ProductCategory;
}
public void setProductCategory(String productCategory) {
	ProductCategory = productCategory;
}


}
