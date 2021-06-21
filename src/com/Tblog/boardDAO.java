package com.Tblog;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class boardDAO {

	Connection con;
	ResultSet rs;
	PreparedStatement pstmt;
	DataSource ds;

	public void getCon() {
		try {
			Context init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/jspbeginner");
			con = ds.getConnection();
		} catch (Exception e) {
			System.out.println("DB_Connection:" + e.toString());
		}
	}

	public void ResouceClose() {
		try {
			if (pstmt != null) {
				pstmt.close();
			}
			if (rs != null) {
				rs.close();
			}
			if (con != null) {
				con.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void insertBoard(boardDTO bdto) {
		try {
			getCon();
			String sql = "insert into board (member_num,subheading_num,title,content,count)" + "values(?,?,?,?,0)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bdto.getMember_num());
			pstmt.setInt(2, bdto.getSubheading_num());
			pstmt.setString(3, bdto.getTitle());
			pstmt.setString(4, bdto.getContent());
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("insertBoard:" + e.toString());
		} finally {
			ResouceClose();
		}
	}


	public Vector<boardInfoDTO> getBoardList(int member_num){
		Vector<boardInfoDTO> v = new Vector<boardInfoDTO>();
		try {
			getCon();
			String sql = "select s.subheading_num, s.subheading, b.board_num, b. title,b.content,b.date,"
					+ " b.foname,b.frname,b.count"
					+" from board b join subheading s on b.subheading_num = s.subheading_num"
					+" where b.member_num = ?"
					+" order by board_num desc";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, member_num);
			rs = pstmt.executeQuery();
			while(rs.next()){
				boardInfoDTO bidto = new boardInfoDTO(rs.getInt("subheading_num"),
													rs.getString("subheading"),
													rs.getInt("board_num"),
													rs.getString("title"),
													rs.getString("content"),
													rs.getTimestamp("date"),
													rs.getString("foname"),
													rs.getString("frname"),
													rs.getInt("count"));
				v.add(bidto);
			}
		} catch (Exception e) {
			System.out.println("getLastestBoard:"+e.toString());
		}finally {
			ResouceClose();
		}
		return v;
	}
	
	public Vector<boardInfoDTO> getSelectBoardList(int subheading_num){
		Vector<boardInfoDTO> v = new Vector<boardInfoDTO>();
		try {
			getCon();
			String sql = "select s.subheading_num, s.subheading, b.board_num, b. title,b.content,b.date,"
					+ " b.foname,b.frname,b.count"
					+" from board b join subheading s on b.subheading_num = s.subheading_num"
					+" where b.subheading_num = ?"
					+" order by board_num desc";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, subheading_num);
			rs = pstmt.executeQuery();
			while(rs.next()){
				boardInfoDTO bidto = new boardInfoDTO(rs.getInt("subheading_num"),
													rs.getString("subheading"),
													rs.getInt("board_num"),
													rs.getString("title"),
													rs.getString("content"),
													rs.getTimestamp("date"),
													rs.getString("foname"),
													rs.getString("frname"),
													rs.getInt("count"));
				v.add(bidto);
			}
		} catch (Exception e) {
			System.out.println("getLastestBoard:"+e.toString());
		}finally {
			ResouceClose();
		}
		return v;
	}
	
	public Vector<subheadingSizeDTO> getSubheadingSize(){
		Vector<subheadingSizeDTO> v = new Vector<subheadingSizeDTO>();
		try {
			getCon();
			String sql = "select subheading_num, count(subheading_num)"
					+ " from board"
					+ " group by subheading_num";
			pstmt=con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				subheadingSizeDTO ssdto = new subheadingSizeDTO(rs.getInt("subheading_num"), 
																rs.getInt("count(subheading_num)"));
				v.add(ssdto);
			}
		} catch (Exception e) {
			System.out.println("getSubheadingSize:"+e.toString());
		}finally{
			ResouceClose();
		}
		return v;
	}
	
	public boardDTO getBoardInfo(int board_num) {
		boardDTO bdto = new boardDTO();
		try {
			getCon();
			String sql = "select * from board where board_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, board_num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bdto.setBoard_num(rs.getInt("board_num"));
				bdto.setContent(rs.getString("content"));
				bdto.setTitle(rs.getString("title"));
			}
			
		} catch (Exception e) {
			System.out.println("getBoardInfo:"+e.toString());
		}finally {
			ResouceClose();
		}
		return bdto;
	}
	
	public void deleteBoard(int board_num) {
		try {
			getCon();
			String sql = "delete from board where board_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, board_num);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("deleteBoard"+e.toString());
		}finally {
			ResouceClose();
		}
	}
	public  void updateBoard(String title,String content,int subheading_num,int board_num) {
		try {
			getCon();
			String sql="update board set title=?,content=?,subheading_num=?,date=now() where board_num=?";
			pstmt= con.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setInt(3, subheading_num);
			pstmt.setInt(4, board_num);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("updateBoard:"+e.toString());
		}finally {
			ResouceClose();
		}
	}
	public void insertReply(int board_num,String id,String content) {
		try {
			getCon();
			String sql = "update reply set pos=pos-1";
			pstmt=con.prepareStatement(sql);
			pstmt.executeUpdate();
			
			sql = "insert into reply(board_num,id,content,pos,depth,count)"
				+ "values(?,?,?,0,0,0)";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, board_num);
			pstmt.setString(2, id);
			pstmt.setString(3, content);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("insertReply:"+e.toString());
		}finally {
			ResouceClose();
		}
	}
	
	public Vector<replyDTO> getReplyList(){
		Vector<replyDTO> reply_v = new Vector<replyDTO>(); 
		try {
			getCon();
			String sql="select * from reply order by pos";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				replyDTO rdto = new replyDTO();
				rdto.setReply_num(rs.getInt("reply_num"));
				rdto.setBoard_num(rs.getInt("board_num"));
				rdto.setId(rs.getString("id"));
				rdto.setContent(rs.getString("content"));
				rdto.setPos(rs.getInt("pos"));
				rdto.setDepth(rs.getInt("depth"));
				rdto.setDate(rs.getTimestamp("date"));
				rdto.setCount(rs.getInt("count"));
				
				reply_v.add(rdto);
			}
			
		} catch (Exception e) {
			System.out.println("getReplyList:"+e.toString());
		}finally {
			ResouceClose();
		}
		return reply_v;
	}
	
	public void deleteReply(int reply_num) {
		try {
			getCon();
			String sql = "delete from reply where reply_num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, reply_num);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("deleteReply:"+e.toString());
		}finally {
			ResouceClose();
		}
	}
	public void insertComment(int board_num,String id,String content, int pos,int count) {
		try {
			getCon();
			String sql = "update reply set count= count+1 where pos = ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, pos);
			pstmt.executeUpdate();
		
			sql = "update reply set pos=pos-1";
			pstmt=con.prepareStatement(sql);
			pstmt.executeUpdate();
			
			sql = "update reply set pos=pos+1 where pos >=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, count+pos);
			pstmt.executeUpdate();
			
			sql = "insert into reply(board_num,id,content,pos,depth)"
				+ "values(?,?,?,?,1)";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, board_num);
			pstmt.setString(2, id);
			pstmt.setString(3, content);
			pstmt.setInt(4, pos+count);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("insertComment:"+e.toString());
		}finally {
			ResouceClose();
		}
	}
	
}
