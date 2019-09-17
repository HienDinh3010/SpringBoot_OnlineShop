package com.shop.controller;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.dao.CategoryDAO;
import com.shop.dao.ProductDAO;
import com.shop.entity.Category;
import com.shop.entity.Product;
import com.shop.service.CookieService;

@Controller
public class ProductController {
	
	@Autowired
	ProductDAO productDAO;
	
	@Autowired
	CategoryDAO categoryDAO;
	
	@Autowired
	SessionFactory factory;
	
	@Autowired
	CookieService cookie;
	
	@RequestMapping("/prod/list-by-cate/{id}")
	public String listByCategory(Model model, @PathVariable("id") Integer id) {
		Category category = categoryDAO.findById(id);
		List<Product> products = category.getProducts();
		model.addAttribute("products", products);
		return "product/list";
	}
	
	@RequestMapping("/prod/detail/{id}")
	public String detail(Model model, @PathVariable("id") Integer id) {
		Product product = productDAO.findById(id);
		model.addAttribute("prod", product);
		return "product/detail";
	}
	
	@RequestMapping("/prod/list-by-keywords")
	public String listByKeywords(Model model, @RequestParam("keywords") String keywords) {
		List<Product> list = productDAO.findByKeywords(keywords);
		model.addAttribute("products", list);
		return "product/list";
	}
	
	@RequestMapping("/prod/list-by-special/{type}")
	public String listBySpecial(Model model, @PathVariable("type") String type) {
		List<Product> list = productDAO.findBySpecial(type);
		model.addAttribute("products", list);
		return "product/list";
	}
	
	@ResponseBody
	@RequestMapping("/prod/mark-item-favorite/{id}")
	public String markItemFavorite(@PathVariable("id") Integer id) {
		String favorties = cookie.getValue("favorites", id.toString());
		if (!favorties.contains(id.toString())) {
			favorties = favorties + "," + id.toString();
		}
		cookie.create("favorites", favorties, 30);
		return "Đã ghi nhận mặt hàng";
	}
}
