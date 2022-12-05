package test.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.board.dto.BoardDto;
import test.util.DbcpBean;

public class BoardDao {
	private static BoardDao dao;
	/*
	 * static 메소드는 생성자를 호출하지 않고 클래스명으로 바로 호출을 하기 때문에
	 * 메소드 호출전에 무언가 준비작업을 하고 싶다면 static 블럭 안에서 하면 된다.
	 * static 블럭은 해당 클래스를 최초로 사용할때 한번만 실행되기 때문에
	 * 초기화 작업을 하기에 적당한 블럭이다.  
	 */
	static {
		if(dao==null) {
		dao=new BoardDao();
		}
	}
	
	private BoardDao() {}
	
	public static BoardDao getInstance() {
		return dao;
	}
	
	//글 삭제하는 메소드
	
	
	//글 1개 추가하는 메소드
	public boolean insert(BoardDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "INSERT INTO recipe_board"
					+ " (num, title, writer, content, viewCount, regdate)"
					+ " VALUES(recipe_cafe_seq.NEXTVAL, ?, ?, ?, 0, sysdate)";
			pstmt = conn.prepareStatement(sql);
			//?에 바인딩
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getWriter());
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
	
	//전체 글의 목록을 리턴하는 메소드
	public List<BoardDto> getList() {
		//회원 목록을 담을 객체 생성
		List<BoardDto> list = new ArrayList<>();

		//필요한 객체를 담을 지역변수를 미리 만들어둔다.
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//Connection Pool에서 Connection 객체를 하나 얻어온다.
			conn = new DbcpBean().getConn();
			//실행할 sql문의 뼈대 구성하기
			String sql = "SELECT num, title, writer, viewCount, TO_CHAR(regdate, 'YY:MM:DD HH24:MI') AS regdate"
					+ " FROM recipe_board"
					+ " ORDER BY num DESC";
			//sql문의 ?에 바인딩할게 있으면 한다.
			pstmt = conn.prepareStatement(sql);
			//SELECT문을 수행하고 결과값을 받아온다.
			rs = pstmt.executeQuery();
			//반복문 돌면서 resultSet에서 필요한 값을 얻어낸다.
			while (rs.next()) {
				BoardDto dto=new BoardDto();
				dto.setNum(rs.getInt("num"));
				dto.setTitle(rs.getString("title"));
				dto.setWriter(rs.getString("writer"));
				dto.setViewCount(rs.getInt("viewCount"));
				dto.setRegdate(rs.getString("regdate"));
				list.add(dto);
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

}
