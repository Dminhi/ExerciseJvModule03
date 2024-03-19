package com.example.products;

import java.util.ArrayList;
import java.util.List;

public class ProductServiceImpl implements ProductService<Product,Integer>{
    List<Product> productList = new ArrayList<>();

    @Override
    public void saveProduct(Product product) {
        if(findById(product.getIdProduct())==null){
            product.setIdProduct(getNewId());
            productList.add(product);
        } else {
            productList.set(productList.indexOf(findById(product.getIdProduct())),product );
        }
    }

    @Override
    public List<Product> fillAllProduct() {
        return productList;
    }

    @Override
    public void deleteProduct(Integer id) {
    productList.remove(findById(id));
    }

    @Override
    public Product findById(Integer id) {
        for (Product product : productList) {
            if(product.getIdProduct()==id){
                return product;
            }
        }
        return null;
    }
    public int getNewId() {
        int maxId = 0;
        for (Product p: productList){
            if (maxId < p.getIdProduct()){
                maxId = p.getIdProduct();
            }
        }
        return maxId+1;
    }

}
