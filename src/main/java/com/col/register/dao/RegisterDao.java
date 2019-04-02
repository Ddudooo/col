package com.col.register.dao;

import com.col.register.service.UserVO;

public interface RegisterDao {
	//select
	int selectReg(UserVO userVO);
	//insert
	boolean insertReg(UserVO userVO);
}
