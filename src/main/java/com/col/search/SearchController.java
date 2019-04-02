package com.col.search;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.col.mypage.service.MypageService;

@Controller
public class SearchController {

	@RequestMapping(value = "/search")
	public String search() {

		return "search/search.tiles";
	}


}
