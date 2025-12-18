package com.gamepex.user.rental;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fasterxml.jackson.annotation.JsonSubTypes.Type;
import com.gamepex.admin.console.AdminConsoleDAO;
import com.gamepex.admin.gametitle.AdminGameTitleDAO;
import com.gamepex.share.RentDetailVO;
import com.gamepex.share.RentalDTO;
import com.gamepex.share.RentalVO;

@Service
public class UserRentalService {
	
	@Inject
	private UserRentalDAO userRentalDAO;
	@Inject
	private AdminConsoleDAO adminConsoleDAO;
	@Inject
	private AdminGameTitleDAO adminGameTitleDAO;

	
	@Transactional
	public void register(RentalVO rentalInfo, List<RentDetailVO> detailList) throws Exception {
		userRentalDAO.register(rentalInfo);
		int price = 0;
		
		for(RentDetailVO detail : detailList) {
			detail.setRt_no(rentalInfo.getRt_no());
			
			if(detail.getRd_type().matches("playstation5|xbox|virtual|steamdeck|nintendo")) {
				price = adminConsoleDAO.getConsoleOne(detail.getRd_serial()).getCon_price();
			} //else {
				//price = adminGameTitleDAO.getGameTitleOne(detail.getRd_serial()).getTtl_price();
			//}
			detail.setRd_price(price);
		}
		userRentalDAO.registerDetail(detailList);
		
	}

	
	
	
}
