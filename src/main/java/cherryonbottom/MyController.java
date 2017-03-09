package cherryonbottom;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.lang.annotation.Annotation;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import org.springframework.security.core.context.SecurityContextHolder;

import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;

import cherryonbottom.cart.Cart;
import cherryonbottom.cart.CartDAO;
import cherryonbottom.catagory.Category;
import cherryonbottom.catagory.CategoryDAO;
import cherryonbottom.product.Product;
import cherryonbottom.product.ProductDAO;
import cherryonbottom.user.User;
import cherryonbottom.user.UserDAO;

@Controller
public class MyController {
	
	@Autowired
	CategoryDAO cdao;
	@Autowired
	ProductDAO pdao;
	@Autowired 
	UserDAO udao;
	@Autowired
	ServletContext context;
	@Autowired
	CartDAO crdao;

	
	public String test()
	{
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    if (auth != null && !auth.getName().equals("anonymousUser"))
	    {    
	    	System.out.println(auth.getName());
	    	//System.out.println("User present");
	    	return "false";
	    }
	    else
	    {
	    	System.out.println("User not present");
	    	return "true";
	    }
	    
	    
		
	}
	
	@RequestMapping("/")
	public String home()
	{
				
		return "index";
	}
	
	@RequestMapping("/index")
	public String index()
	{
				
		return "index";
	}
	
	@RequestMapping("/head")
	public String head()
	{
		return "head";
	}
	
	@RequestMapping("/head-meta")
	public String headmeta()
	{
		return "head-meta";
	}

	@RequestMapping("/aboutus")
	public String aboutUs()
	{
		return "aboutus";
	}
	@RequestMapping("/categories")
	public String categories()
	{
		return "categories";
	}
	
	@RequestMapping(value="/allcategories")
	public ModelAndView allcategories()
	{
		ModelAndView mav = new ModelAndView("allcategories");
		
		
		List<Category> list = cdao.getAllCategories();
		
		JSONArray jarr = new JSONArray();
		
		for( Category c: list )
		{
			JSONObject jobj = new JSONObject();
			
			jobj.put("CategoryId", c.getId());
			jobj.put("CategoryName", c.getCategoryName() );
			
			jarr.add(jobj);
		}
		
		System.out.println(jarr.toJSONString());
		
		mav.addObject("CategoryJSON", jarr.toJSONString());
		
		return mav;
	}
	
	@RequestMapping("/addcategory")
	public ModelAndView addcategory()
	{
		ModelAndView model= new ModelAndView("addcategory");
		
		model.addObject("category", new Category());
		return model;
				
	}	
	@RequestMapping(value="addCategoryToDb", method=RequestMethod.POST)
	public String addCategories(@ModelAttribute("category") Category c )
	{
		System.out.println(c.getCategoryName());
		cdao.insert(c);
		
		return "redirect:/allcategories";
	}
	
	@RequestMapping("/DeleteCategoryFromDB")
	public String DeleteCategory(@RequestParam("text") int cId){
		System.out.println(cId);
		
		Category c = cdao.getCategory(cId);
		cdao.delete(cId);
List<Product> list = pdao.getAllProducts();
		
		for( Product p:list )
		{
			if( p.getProductCategory().equals(c.getCategoryName()) )
			{
				p.setProductCategory("-");
				pdao.update(p);
			}
		}
		
		
		return "redirect:/allcategories";

	}			
	
	
	
	@RequestMapping("/updatecategory")
	public ModelAndView updatecategory(@RequestParam("text") int cId) 
	{
		ModelAndView mav = new ModelAndView("editcategory");
		Category c = cdao.getCategory(cId);
		
		System.out.println(cId);
		
		mav.addObject("Category", c);
		return mav;
	}
	
	@RequestMapping(value="/UpdateCategoryToDB" , method=RequestMethod.POST)
	public String UpdateCategoryToDB( @ModelAttribute("Category") Category c ) {
		/*System.out.println("received category id:"+c.getId());
		System.out.println("received category name:"+c.getCategoryName());
*/
		/*update category */
		cdao.update(c);
		
		return "redirect:/allcategories";
	}
	
	
	
	
	
	@RequestMapping("/contactus")
	public String contactUs()
	{
		return "contactus";
				
	}
	
	@RequestMapping(value="/allproducts")
	public ModelAndView allproducts()
	{
		ModelAndView mav = new ModelAndView("allproducts");
		
		
		List<Product> list = pdao.getAllProducts();
		
		JSONArray jarr = new JSONArray();
		
		for( Product p: list )
		{
			JSONObject jobj = new JSONObject();
			
			jobj.put("ProductId", p.getProductId());
			jobj.put("ProductName", p.getProductName() );
			jobj.put("ProductCategory", p.getProductCategory() );
			jobj.put("ProductDescription", p.getDescription());
			jobj.put("ProductPrice", p.getPrice());
			jobj.put("ProductQuantity", p.getQuantity());
			jarr.add(jobj);
		}
		
		System.out.println(jarr.toJSONString());
		
		mav.addObject("ProductJSON", jarr.toJSONString());
		
		return mav;
	}
	
	
	
	@RequestMapping("/addproduct")
	public ModelAndView addproduct()
	{
		ModelAndView model= new ModelAndView("addproduct");
		
		model.addObject("product", new Product());
		List<Category> list=cdao.getAllCategories();
		model.addObject("AllCategories",list);
		return model;
		
				
	}
	
	@RequestMapping(value="addProductToDb", method=RequestMethod.POST)
	public String addProducts(@ModelAttribute("product") Product p )
	{
		System.out.println(p.getProductName());
		pdao.insert(p);
		Product i1 = pdao.getProductWithMaxId();

		System.out.println(i1.getProductId());

		try {
			String path = context.getRealPath("/");

			System.out.println(path);

			File directory = null;

		

			if (p.getProductFile().getContentType().contains("image")) {
				directory = new File(path + "\\resources\\images");

				System.out.println(directory);

				byte[] bytes = null;
				File file = null;
				bytes = p.getProductFile().getBytes();

				if (!directory.exists())
					directory.mkdirs();

				file = new File(directory.getAbsolutePath() + System.getProperty("file.separator") + "image_"
						+ i1.getProductId() + ".jpg");

				System.out.println(file.getAbsolutePath());

				BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(file));
				stream.write(bytes);
				stream.close();
				
			
			}

			i1.setpImage("resources/images/image_" + i1.getProductId() + ".jpg");

			pdao.update(i1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/allproducts";
	}
	
	@RequestMapping("/DeleteProductFromDB")
	public String DeleteProduct(@RequestParam("text") int ProductId){
		System.out.println(ProductId);
		
		Product p = pdao.getProduct(ProductId);
		pdao.delete(ProductId);

		
		
		return "redirect:/allproducts";

	}
	@RequestMapping("/updateproduct")
	public ModelAndView updateproduct(@RequestParam("text") int ProductId) 
	{
		ModelAndView mav = new ModelAndView("editproduct");
		Product p = pdao.getProduct(ProductId);
		
		System.out.println(ProductId);
		
		List<Category> list=cdao.getAllCategories();
		mav.addObject("AllCategories",list);
		mav.addObject("Product", p);
		return mav;
	}
	
	@RequestMapping(value="/UpdateProductToDB" , method=RequestMethod.POST)
	public String UpdateProductToDB( @ModelAttribute("Product") Product p ) {
		
		pdao.update(p);

		
		return "redirect:/allproducts";
	}
	
	
	
	@RequestMapping("/signup")
	public ModelAndView signup(){
		ModelAndView model = new ModelAndView("signup");
		model.addObject("User", new User());
		return model;
	}
	
	@RequestMapping(value="AddUserToDB", method=RequestMethod.POST)
	public ModelAndView addSignup(@Valid @ModelAttribute("User") User u ,BindingResult bind)
	{
		System.out.println(u.getuName());
		
		
		
		ModelAndView mav = new ModelAndView("login");

		System.out.println("In User Insert");

		System.out.println( bind.hasErrors() );
		
		if (bind.hasErrors()) {
			mav.addObject("User", u);
		} else {
			if (u.getuPassword().equals(u.getuCPassword())) {
				List<User> list = udao.getAllUsers();

				System.out.println(list);

				boolean usermatch = false;

				for (User user : list) {
					if (user.getuName().equals(u.getuName())) {
						usermatch = true;
						break;
					}
				}

				if (usermatch == false) {
					String password = u.getuPassword();
					BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
					String hashedPassword = passwordEncoder.encode(password);
					System.out.println(hashedPassword);
					u.setuPassword(hashedPassword);
					
					System.out.println(u.getuPassword());
					
					udao.insertUser(u);

					mav.addObject("User", new User());

					mav.addObject("success", "success");
				} else
				{
					ModelAndView mav1 = new ModelAndView("signup");
					
					mav1.addObject("User", u);

					mav1.addObject("useralreadyexists", "useralreadyexists");
					
					return mav1;
				}
			} else
			{
				ModelAndView mav1 = new ModelAndView("signup");
				
				mav1.addObject("User", u);

				mav1.addObject("passwordmismatch", "passwordmismatch");
				
				return mav1;
				
				
			}

		}
		
		return mav;
		
	}
	

	@RequestMapping(value="/loginpage", method = RequestMethod.GET)
	public ModelAndView login(){
		ModelAndView model = new ModelAndView("login");
		return model;
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logoutPage(HttpServletRequest request, HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) 
		{

			System.out.println("In LogOut");
			new SecurityContextLogoutHandler().logout(request, response, auth);

		}

		return "login";
	}
	
	
	@RequestMapping(value = "/initiateFlow", method = RequestMethod.GET)
	public String redirect(HttpServletRequest request) {

		String retval = "";

		if (request.getUserPrincipal() == null)
			retval = "redirect:/cart?user=none";
		else
			retval = "redirect:/cart?user=" + request.getUserPrincipal().getName();

		return retval;
	}
	
	@RequestMapping(value = "/addToCart")
	public String addToCart(HttpServletRequest request) {

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null && !auth.getName().equals("anonymousUser")) {
			System.out.println(request.getParameter("ProductId"));
			System.out.println(request.getParameter("pqty"));

			int qty = 1;
			
			
			Cart cd = crdao.getCartByProductID(Integer.parseInt(request.getParameter("ProductId")));
			
			
			qty = Integer.parseInt(request.getParameter("pqty"));
			

			try {
				

				if (!(qty >= 1 && qty <= 10))
					throw new Exception();
			} catch (Exception e) {
				System.out.println("Invalid Qty");
			}
			
			
			if(cd!=null){
				String checkQuantity = cd.getQty();
				cd.setQty(String.valueOf(Integer.parseInt(checkQuantity)+qty));
				crdao.update(cd);
			}
			else{

			Cart c = new Cart();

			c.setProductID(request.getParameter("ProductId"));
			c.setQty("" + qty);

			Product p = pdao.getProduct(Integer.parseInt(request.getParameter("ProductId")));

			c.setName(p.getProductName());
			c.setPrice( "" + p.getPrice());

			c.setUserName(auth.getName());

			crdao.add(c);
			}
			
			Product productQuantity = pdao.getProduct(Integer.parseInt(request.getParameter("ProductId")));
			String quan = "" + productQuantity.getQuantity();
			productQuantity.setQuantity(String.valueOf(Integer.parseInt(quan)-qty));
			pdao.update(productQuantity);

		}

		return "redirect:initiateFlow";
	}
		
	
	@RequestMapping(value = "/view/{productID}")
		public ModelAndView addproduct1(@PathVariable("productID") int prodid) {
			ModelAndView mav = new ModelAndView("view");

			System.out.println(prodid);

			Product p = pdao.getProduct(prodid);

			if (p != null) {

				mav.addObject("ProductName", p.getProductName());
				mav.addObject("ProductDescription", p.getDescription());
				mav.addObject("ProductCategory", p.getProductCategory());
				
				mav.addObject("ProductPrice", p.getPrice());
				mav.addObject("ProductQty", p.getQuantity());
				mav.addObject("ProductImg", p.getpImage());
				mav.addObject("ProductId", p.getProductId());
			
			}

			return mav;
		
		}
}

	
	
	
	
