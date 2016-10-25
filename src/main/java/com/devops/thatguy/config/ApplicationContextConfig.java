package com.devops.thatguy.config;

import java.util.Properties;

import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBuilder;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.devops.thatguy.dao.CartDAO;
import com.devops.thatguy.dao.CartDAOImpl;
import com.devops.thatguy.dao.CategoryDAO;
import com.devops.thatguy.dao.CategoryDAOImpl;

import com.devops.thatguy.dao.ProductDAO;
import com.devops.thatguy.dao.ProductDAOImpl;
import com.devops.thatguy.dao.SupplierDAO;
import com.devops.thatguy.dao.SupplierDAOImpl;
import com.devops.thatguy.dao.UserDetailsDAO;
import com.devops.thatguy.dao.UserDetailsDAOImpl;
import com.devops.thatguy.model.BillingAddress;
import com.devops.thatguy.model.CardDetail;
import com.devops.thatguy.model.Cart;
import com.devops.thatguy.model.Category;

import com.devops.thatguy.model.OrderDetail;
import com.devops.thatguy.model.OrderedItems;
import com.devops.thatguy.model.Product;
import com.devops.thatguy.model.ShippingAddress;
import com.devops.thatguy.model.Supplier;
import com.devops.thatguy.model.UserDetails;




@Configuration
@ComponentScan("com.devops")
@EnableTransactionManagement
public class ApplicationContextConfig {
	@Bean(name="dataSource")
	public DataSource getH2DataSource(){
DriverManagerDataSource dataSource=new DriverManagerDataSource();
/*String url="jdbc:h2:~/test;"+
"INIT=CREATE SCHEMA IIF NOT EXISTS TEST";*/

dataSource.setDriverClassName("org.h2.Driver");
dataSource.setUrl("jdbc:h2:tcp://localhost/~/single");
dataSource.setUsername("sa");
dataSource.setPassword("");
return dataSource;
}
	
private Properties getHibernateProperties(){
Properties properties=new Properties();
properties.put("hibernate.show.sql", "true");
properties.put("hibernate.dialect","org.hibernate.dialect.H2Dialect");
properties.setProperty("hibernate.hbm2ddl.auto", "update");
return properties;
}

@Autowired
@Bean(name="sessionFactory")
public SessionFactory getSessionFactory(DataSource dataSource){
LocalSessionFactoryBuilder sessionBuilder=new LocalSessionFactoryBuilder(dataSource);
sessionBuilder.addProperties(getHibernateProperties());
sessionBuilder.addAnnotatedClasses(Category.class);
sessionBuilder.addAnnotatedClasses(UserDetails.class);
sessionBuilder.addAnnotatedClasses(Supplier.class);
sessionBuilder.addAnnotatedClasses(Cart.class);

sessionBuilder.addAnnotatedClasses(Product.class);
sessionBuilder.addAnnotatedClass(OrderDetail.class);
sessionBuilder.addAnnotatedClass(OrderedItems.class);
sessionBuilder.addAnnotatedClass(CardDetail.class);
sessionBuilder.addAnnotatedClass(ShippingAddress.class);
sessionBuilder.addAnnotatedClass(BillingAddress.class);
return sessionBuilder.buildSessionFactory();
}
@Autowired
@Bean(name="transactionManager")
public HibernateTransactionManager getTransactionManager(SessionFactory sessionFactory){
 HibernateTransactionManager transactionManager=new  HibernateTransactionManager(sessionFactory);
 return transactionManager;
}

	@Autowired
	@Bean(name = "categoryDAO")
	public CategoryDAO getCategorDao(SessionFactory sessionFactory) {
		return new CategoryDAOImpl(sessionFactory);
	}
	
	@Autowired
	@Bean(name = "productDAO")
	public ProductDAO getProductDao(SessionFactory sessionFactory) {
			return new ProductDAOImpl(sessionFactory);
	}
	@Autowired
	@Bean(name = "suppliertDAO")
	public SupplierDAO getSuppliertDAO(SessionFactory sessionFactory) {
			return new SupplierDAOImpl(sessionFactory);
	}
	@Autowired
	@Bean(name = "userDetailsDAO")
	public UserDetailsDAO getUserDetailsDAO(SessionFactory sessionFactory) {
			return new UserDetailsDAOImpl(sessionFactory);
	}
	@Autowired
	@Bean(name = "cartDAO")
	public CartDAO getCartDAO(SessionFactory sessionFactory) {
			return new CartDAOImpl(sessionFactory);
	}

}