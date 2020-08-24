package test.model.service;

import static common.JDBCTemp.*;


import java.sql.Connection;

import test.model.dao.CryptoDao;
import test.model.vo.CryptoMember;

public class CryptoService {
	
	private CryptoDao cdao = new CryptoDao();

	public CryptoService() {
		
	}
	
	
	public CryptoMember loginCheck(String userid, String userpwd) {
		Connection conn = getConnection();		
		CryptoMember member = cdao.loginCheck(conn, userid, userpwd);
		close(conn);
		return member;
	}
	
	public int insertMember(CryptoMember mem) {
		Connection conn = getConnection();
		int result = cdao.insertMember(conn, mem);
		if(result > 0) {
			commit(conn);
		}else
			rollback(conn);		
		close(conn);
		return result;
	}
}
