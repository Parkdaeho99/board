package com.test.model1.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.test.model1.vo.User;


public class UserDAO { 
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	public UserDAO() {
		try {
			Context init = new InitialContext();
			DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/bbs");
			conn = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void udClose() {
		try {
			if (rs!=null)rs.close();
			if (pstmt!=null)pstmt.close();
			if (conn!=null)conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public int login(String userId, String userPassword) {
		String sql = "SELECT userPassword FROM user WHERE userID=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if (rs.next()) { //튜플이 한줄이라도 나왔다면 아이디가 있다는 의미
				if(rs.getString(1).equals(userPassword)) {
					return 1; //로그인 성공
				} else {
					return 0; //비밀번호 불일치
				}
			}
			return -1; //튜플이 하나도 안나와서 아이디조차 없다는 의미
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -2; //데이터베이스 오류 코드
	}
	
	public int join(User user) {
		String sql = "INSERT INTO user VALUES(?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getUserId());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserGender());
			pstmt.setString(5, user.getUserEmail());
			pstmt.executeUpdate();
			return 0; 
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}
}
