package com.itwill.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwill.controller.interceptor.LoginCheck;
import com.itwill.domain.Favorite;
import com.itwill.service.FavoriteService;

@Controller
public class FavoriteController {
	@Autowired
	private FavoriteService favoriteService;

}
