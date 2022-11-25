package test.cafe.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.cafe.dto.CafeDto;
import test.util.DbcpBean;

public class CafeDao {

	private static CafeDao dao;
	/*
	 * static 메소드는 생성자를 호출하지 않고 클래스명ㅇ로 바로 호출을 하기 때문에
	 * 메소드 호출전에 무언가 준비작업을 하고 싶다면 static 블럭 안에서 하면 된다.
	 * static 블럭은 해당 클래스를 최초로 사용할때 한번만 실행되기 때문에
	 * 초기화 작업을 하기에 적당한 블럭이다.  
	 */
	static {
		if(dao==null) {
		dao=new CafeDao();
		}
	}
	
	private CafeDao() {}
	
	public static CafeDao getInstance() {
		return dao;
	}
	
	//글의 갯수를 리턴하는 메소드
	public int getCount() {
		int count=0;
		//필요한 객체를 담을 지역변수를 미리 만들어둔다.
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//Connection Pool에서 Connection 객체를 하나 얻어온다.
			conn = new DbcpBean().getConn();
			//실행할 sql문의 뼈대 구성하기
			String sql = "SELECT MAX(ROWNUM) AS num "
					+ " FROM board_cafe";
			//sql문의 ?에 바인딩할게 있으면 한다.

			pstmt = conn.prepareStatement(sql);
			//SELECT문을 수행하고 결과값을 받아온다.
			rs = pstmt.executeQuery();
			//반복문 돌면서 resultSet에서 필요한 값을 얻어낸다.
			if (rs.next()) {
				count=rs.getInt("num");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close(); //Connection Pool에 Connection 반납하기

			} catch (Exception e2) {
			}
		}
		return count;
	}

	
	
	//글의 조회수를 올리는 메소드
	public boolean addViewCount(int num) {		
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "UPDATE board_cafe"
					+ " SET viewCount=viewCount+1"
					+ " WHERE num=?";
			pstmt = conn.prepareStatement(sql);
			//?에 바인딩
			pstmt.setInt(1, num);
			//INSERT or UPDATE or DELETE문을 수행하고 수정,삭제,추가된 row의 개수 리턴
			rowCount = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
			}
		}

		if (rowCount > 0) {
			return true;
		} else {
			return false;
		}
	}	
	
	//글 하나의 정보를 삭제하는 메소드
	public boolean delete(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "DELETE FROM board_cafe"
					+ " WHERE num=?";
			pstmt = conn.prepareStatement(sql);
			//?에 바인딩
			pstmt.setInt(1, num);
			//INSERT or UPDATE or DELETE문을 수행하고 수정,삭제,추가된 row의 개수 리턴
			rowCount = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
			}
		}

		if (rowCount > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	//글 하나를 수정하는 메소드
	public boolean update(CafeDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "UPDATE board_cafe"
					+ " SET title=?, content=?"
					+ " WHERE num=?";
			pstmt = conn.prepareStatement(sql);
			//?에 바인딩
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			pstmt.setInt(3, dto.getNum());
			//INSERT or UPDATE or DELETE문을 수행하고 수정,삭제,추가된 row의 개수 리턴
			rowCount = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
			}
		}

		if (rowCount > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	//글 하나의 정보를 리턴해주는 메소드
	public CafeDto getData(int num) {
		//필요한 객체를 담을 지역변수를 미리 만들어둔다.
		CafeDto dto=null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//Connection Pool에서 Connection 객체를 하나 얻어온다.
			conn = new DbcpBean().getConn();
			//실행할 sql문의 뼈대 구성하기
			String sql = "SELECT writer, title, content, viewCount, regdate"
					+ " FROM board_cafe"
					+ " WHERE num=?";
			//sql문의 ?에 바인딩할게 있으면 한다.			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			//SELECT문을 수행하고 결과값을 받아온다.
			rs = pstmt.executeQuery();
			//반복문 돌면서 resultSet에서 필요한 값을 얻어낸다.
			if (rs.next()) {
				dto=new CafeDto();
	            dto.setNum(num);
	            dto.setWriter(rs.getString("writer"));
	            dto.setTitle(rs.getString("title"));
	            dto.setContent(rs.getString("content"));
	            dto.setViewCount(rs.getInt("viewCount"));
	            dto.setRegdate(rs.getString("regdate"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close(); //Connection Pool에 Connection 반납하기

			} catch (Exception e2) {
			}
		}
		return dto;
	}

	
	//글 목록 리턴하기	
	public List<CafeDto> getList(CafeDto dto) {
		//회원 목록을 담을 객체 생성
		List<CafeDto> list = new ArrayList<>();

		//필요한 객체를 담을 지역변수를 미리 만들어둔다.
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//Connection Pool에서 Connection 객체를 하나 얻어온다.
			conn = new DbcpBean().getConn();
			//실행할 sql문의 뼈대 구성하기
			String sql = "SELECT *"
					+ " FROM"
					+ "	(SELECT result1.*, ROWNUM AS rnum"
					+ "	FROM "
					+ "		(SELECT num, writer, title, viewCount, TO_CHAR(regdate, 'YYYY.MM.DD HH24:MI') AS regdate"
					+ "		FROM board_cafe"
					+ "		ORDER BY num DESC) result1)"
					+ " WHERE rnum BETWEEN ? AND ?";
			//sql문의 ?에 바인딩할게 있으면 한다.
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,	dto.getStartRowNum());
			pstmt.setInt(2, dto.getEndRowNum());
			//SELECT문을 수행하고 결과값을 받아온다.
			rs = pstmt.executeQuery();
			//반복문 돌면서 resultSet에서 필요한 값을 얻어낸다.
			while (rs.next()) {
				CafeDto tmp=new CafeDto();
				tmp.setNum(rs.getInt("num"));
				tmp.setWriter(rs.getString("writer"));
				tmp.setTitle(rs.getString("title"));
				tmp.setViewCount(rs.getInt("viewCount"));
				tmp.setRegdate(rs.getString("regdate"));
	            //CafeDto 객체의 참조값을 List 에 누적 시키기
	            list.add(tmp);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close(); //Connection Pool에 Connection 반납하기

			} catch (Exception e2) {
			}
		}
		return list;
	}
	
	
	//새글을 저장하는 메소드
	public boolean insert(CafeDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "INSERT INTO board_cafe"
					+ " (num, writer, title, content, viewCount, regdate)"
					+ " VALUES(board_cafe_seq.NEXTVAL, ?, ?, ?, 0, SYSDATE)";
			pstmt = conn.prepareStatement(sql);
			//?에 바인딩
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			//INSERT or UPDATE or DELETE문을 수행하고 수정,삭제,추가된 row의 개수 리턴
			rowCount = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
			}
		}

		if (rowCount > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	
}
