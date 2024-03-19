package com.example.products;

import java.util.List;

public interface ProductService<T, e> {
    public void saveProduct(T t);

    public List<T> fillAllProduct();

    public void deleteProduct(e id);

    public T findById(e id);

}
