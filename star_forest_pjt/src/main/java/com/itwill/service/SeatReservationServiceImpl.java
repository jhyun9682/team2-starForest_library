package com.itwill.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwill.domain.SeatReservation;
import com.itwill.repository.SeatReservationDao;

@Service
public class SeatReservationServiceImpl implements SeatReservationService{
	@Autowired
	private SeatReservationDao seatReservationDao;
	
	
	@Override
	public int reservation(SeatReservation seatReservation) throws Exception {
		SeatReservation seat = seatReservationDao.selectTimeUsingSeat(seatReservation.getSeat_no());
		/*
		 * 자리가 이미 있을 경우 : 0
		 * 자리가 없을 경우 : 1
		 */
		if(seat.getSeat_status()==1) {
			return 0;
		}else {
			int rowCount = seatReservationDao.reservation(seatReservation);
			return rowCount;
		}
	}

	@Override
	public int returnByUser(SeatReservation seatReservation) throws Exception {
		return seatReservationDao.returnByUser(seatReservation);
	}

	@Override
	public int returnByAuto(SeatReservation seatReservation) throws Exception {
		return seatReservationDao.returnByAuto(seatReservation);
	}
	
	@Override
	public int resetAll() throws Exception {
		return seatReservationDao.resetAll();
	}
	
	@Override
	public int continueSeat(String user_id) throws Exception {
		return seatReservationDao.continueSeat(user_id);
	}

	@Override
	public List<SeatReservation> selectAll() throws Exception {
		return seatReservationDao.selectAll();
	}

	@Override
	public List<SeatReservation> selectAvailableSeat(int seat_status) throws Exception {
		return seatReservationDao.selectAvailableSeat(seat_status);
	}

	@Override
	public int countAvailableSeat(int seat_status) throws Exception {
		return seatReservationDao.countAvailableSeat(seat_status);
	}

	@Override
	public SeatReservation selectTimeUsingSeat(String seat_no) throws Exception {
		return seatReservationDao.selectTimeUsingSeat(seat_no);
	}

	@Override
	public int findByUser(String user_id) throws Exception {
		
		return seatReservationDao.findByUser(user_id);
	}

	@Override
	public SeatReservation findSeat(String user_id) throws Exception {
		return seatReservationDao.findSeat(user_id);
	}

	@Override
	public int countAll() throws Exception {
		return seatReservationDao.countAll();
	}

	

	
	
	
}
