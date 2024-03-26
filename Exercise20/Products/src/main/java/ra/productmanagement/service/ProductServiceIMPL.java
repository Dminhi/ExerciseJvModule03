package ra.productmanagement.service;

import ra.productmanagement.model.entity.Product;

import java.util.ArrayList;
import java.util.List;

public class ProductServiceIMPL implements IProductService {
    private static final List<Product> products = new ArrayList<>();
    static {
        products.add(new Product(1,"Mecerdes",30000,"Primeum","Mercedes"));
        products.add(new Product(2, "Toyota Camry", 25000, "Economical", "Toyota"));
        products.add(new Product(3, "BMW", 35000, "Luxury", "BMW"));
        products.add(new Product(4, "Honda Civic", 20000, "Reliable", "Honda"));
        products.add(new Product(5, "Ford Mustang", 27000, "Versatile" , "Ford"));
    }

    @Override
    public List<Product> findAll() {
        return products;
    }

    @Override
    public void save(Product product) {products.add(product);
    }

    @Override
    public Product findById(int id) {
        return
                products.stream().filter(product -> product.getId() == id).findFirst().orElse(null);
    }

    @Override
    public void update(int id, Product product) {
        products.set(products.indexOf(findById(id)), product);
    }

    @Override
    public void remove(int id) {
        products.remove(findById(id));
    }

}
