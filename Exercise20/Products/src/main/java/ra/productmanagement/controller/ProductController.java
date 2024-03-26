package ra.productmanagement.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import ra.productmanagement.model.entity.Product;
import ra.productmanagement.service.IProductService;
import ra.productmanagement.service.ProductServiceIMPL;

import java.util.List;

@Controller
@RequestMapping(value ={"/","/index"})
public class ProductController {
    private final IProductService productService = new ProductServiceIMPL();
    @GetMapping
    public String index(Model model){
        List<Product> productList = productService.findAll();
        model.addAttribute("products",productList);
        return "index";
    }
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable int id, Model model) {
        model.addAttribute("product", productService.findById(id));
        return "edit";
    }
    @GetMapping("/delete/{id}")
    public String deleteForm(@PathVariable int id, Model model) {
        Product product = productService.findById(id);
        model.addAttribute("product",product);
        return "delete";
    }
    @PostMapping("/delete")
    public String delete(@RequestParam(name="id") int id){
        productService.remove(id);
        return "redirect:/";
    }
    @PostMapping("/update")
    public String update(@ModelAttribute Product product){
        productService.update(product.getId(),product);
        return "redirect:/";
    }
    @GetMapping("/create")
    public String creates(){
        return "create";
    }
    @PostMapping("/create")
    public String create(@ModelAttribute Product product){
        productService.save(product);
        return "redirect:/";
    }
    @GetMapping("/view/{id}")
    public String view(@PathVariable int id,Model model){
       Product product= productService.findById(id);
        model.addAttribute("product",product);
        return "view";
    }
}
