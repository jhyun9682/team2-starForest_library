package com.itwill.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

//대출량
@Repository
public class BookRentalCntDaoImpl implements BookRentalCntDao{
	@Autowired
	private DataSource dataSource;
	
	public BookRentalCntDaoImpl() {
	}

	public BookRentalCntDaoImpl(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	
	
	@Override
	public void plusRentalCnt(int number) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = dataSource.getConnection();
			String sql = "UPDATE book " + "SET book_rental_cnt = book_rental_cnt + 1 " + "WHERE book_no = ?";//조건 뭐로?
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, number);
			pstmt.executeUpdate();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (Exception ex) {
			}
			try {
				if (con != null)
					con.close();
			} catch (Exception ex) {
			}
		}
	}
	
	
}
