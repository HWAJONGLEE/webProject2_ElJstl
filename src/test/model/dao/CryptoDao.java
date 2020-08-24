package test.model.dao;

import static common.JDBCTemp.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import test.model.vo.CryptoMember;

public class CryptoDao {
	
	public CryptoDao() {
		
	}

	
	
	public CryptoMember loginCheck(Connection conn, String userid, String userpwd) {
		CryptoMember member = null;

		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = "select * from crypto_member where userid = ? and userpwd = ? ";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userid);
			pstmt.setString(2, userpwd);
			rset = pstmt.executeQuery();

			if (rset.next()) {
				member = new CryptoMember();
				member.setAge(rset.getInt("age"));
				member.setEmail(rset.getString("email"));
				member.setEnrollDate(rset.getDate("enroll_date"));
				member.setEtc(rset.getString("etc"));
				member.setGender(rset.getString("gender"));
				member.setHobby(rset.getString("hobby"));
				member.setLastModified(rset.getDate("lastmodified"));
				member.setPhone(rset.getString("phone"));
				member.setUserid(userid);
				member.setUsername(rset.getString("username"));
				member.setUserpwd(userpwd);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return member;
	}
	
	
	public int insertMember(Connection conn, CryptoMember mem) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = "insert into crypto_member values(?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate, sysdate, default)";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, mem.getUserid());
			pstmt.setString(2, mem.getUserpwd());
			pstmt.setString(3, mem.getUsername());
			pstmt.setString(4, mem.getGender());
			pstmt.setInt(5, mem.getAge());
			pstmt.setString(6, mem.getPhone());
			pstmt.setString(7, mem.getEmail());
			pstmt.setString(8, mem.getHobby());
			pstmt.setString(9, mem.getEtc());

			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}
}
