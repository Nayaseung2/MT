package com.kh.mt.pay.model.service;

import com.kh.mt.pay.model.vo.Pay;

public interface PayService {

	void insertPayList(Pay p);

	int selectPeach(String mcode);


}
