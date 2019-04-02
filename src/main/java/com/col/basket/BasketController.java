package com.col.basket;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.col.mypage.service.MypageService;

@Controller
public class BasketController {
	
	@RequestMapping(value="/basket")
	public String basket() {
		
		return "basket/basket.tiles";
	}

	@RequestMapping(value="/basketPay")
	public String basketPay() {
		
		return "basket/basketPay.tiles";
	}
	@RequestMapping(value="/basketResult")
	public String basketResult() {
		
		return "basket/basketResult.tiles";
	}
	@RequestMapping(value="/basketTicket")
	public String basketTicket() {
		
		return "basket/basketTicket.tiles";
	}


}
