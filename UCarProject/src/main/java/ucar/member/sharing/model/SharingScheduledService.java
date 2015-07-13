package ucar.member.sharing.model;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import ucar.sharing.reservation.model.ReservationVO;

@Component
public class SharingScheduledService {
	private static final Logger logger = LoggerFactory.getLogger(SharingScheduledService.class);
	@Resource
	private MemberSharingDAO memberSharingDAO;
	
	@Transactional
	@Scheduled(cron = "0 */10 * * * *")
	public void doSharingScheduled(){
		Long currentDate=System.currentTimeMillis();
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm");
		String nowTime=transFormat.format(currentDate);
		String mess=null;
		logger.debug("SharingScheduler 실행");
		System.out.println("["+nowTime+"] 스케줄러실행");
		List<ReservationVO> list=memberSharingDAO.getAllSharingListExcludeCancel();
		for(int i=0; i<list.size(); i++){
			try {
				Long rentalDate = transFormat.parse(list.get(i).getRentalDate()).getTime();
				if(list.get(i).getSharingStatus().equals("예약")){
					if((rentalDate-currentDate)/60000<=10){
						list.get(i).setSharingStatus("취소");
						memberSharingDAO.changeSharingStatusByReservationNo(list.get(i));
						mess="예약번호 "+list.get(i).getReservationNo()+"번 예약 취소";
						System.out.println("["+nowTime+"] 예약번호 "+list.get(i).getReservationNo()+" 번 : 예약 취소");
					}
				} else if(list.get(i).getSharingStatus().equals("이용요금결제")){
					if((rentalDate-currentDate)/60000==0){
						list.get(i).setSharingStatus("이용중");
						memberSharingDAO.changeSharingStatusByReservationNo(list.get(i));
						mess="예약번호 "+list.get(i).getReservationNo()+"번 이용 시작";
						System.out.println("["+nowTime+"] 예약번호 "+list.get(i).getReservationNo()+" 번 : 이용시작");
					}
				} else if(list.get(i).getSharingStatus().equals("이용중") || list.get(i).getSharingStatus().equals("연장") || list.get(i).getSharingStatus().equals("연체")){
					Long returnDate=null;
					if(list.get(i).getExtensionDate()!=null){
						returnDate = transFormat.parse(list.get(i).getExtensionDate()).getTime();
					} else{
						returnDate = transFormat.parse(list.get(i).getReturnDate()).getTime();
					}
					if((currentDate-returnDate)/60000>=0){
						list.get(i).setSharingStatus("연체");
						list.get(i).setLateTime((currentDate-returnDate)/60000);
						memberSharingDAO.changeSharingStatusByReservationNo(list.get(i));
						memberSharingDAO.updateLateFeeAndTime(list.get(i));
						mess="예약번호 "+list.get(i).getReservationNo()+"번 연체료 부과";
						System.out.println("["+nowTime+"] 예약번호 "+list.get(i).getReservationNo()+" 번 : 연체료부과");
					}
				}
				logger.debug("예약상태 변경 : {}", mess);
			} catch (ParseException e) {
				e.printStackTrace();
			}			
		}
	}
}
