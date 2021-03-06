package com.semi.dao;

import static common.JDBCTemplet.close;
import static common.JDBCTemplet.getConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.semi.vo.HeartVo;
import com.semi.vo.MessageVo;
import com.semi.vo.MsgVo;
import com.semi.vo.PostVo;
import com.semi.vo.UserVo;

import common.JDBCTemplet;
import util.sha256;

public class UserDaoImpl extends JDBCTemplet implements UserDao {

	@Override
	public int login(String u_id, String u_pwd) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = con.prepareStatement(loginSql);
			pstmt.setString(1, u_id);
			rs = pstmt.executeQuery();
			String pwd_ch = sha256.getSHA256(u_pwd);

			if (rs.next()) {
				if (rs.getString(1).equals(pwd_ch))

					return 1; // 로그인성공
				else
					return 0; // 비밀번호 불일치, 로그인 실패
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, con);
		}
		return -1;// 데이터베이스 오류

	}

	@Override
	public int join(UserVo vo) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;

		try {
			pstmt = con.prepareStatement(joinSql);
			pstmt.setString(1, vo.getU_id());
			pstmt.setString(2, vo.getU_pwd());
			pstmt.setString(3, vo.getU_name());
			pstmt.setString(4, vo.getU_email());
			pstmt.setString(5, vo.getU_emailhash());

			return pstmt.executeUpdate();// 회원가입 성공

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt, con);
		}
		return -1;// 회원가입 실패
	}

	@Override
	// 아이디로 이메일 주소 가져오기
	public String getUserEmail(String u_id) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			pstmt = con.prepareStatement(getUserEmailSql);

			pstmt.setString(1, u_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				return rs.getString(1); // 이메일 주소 반환
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null; // 데이터베이스 오류
	}

	// 회원여부 확인
	@Override
	public int CheckID(String u_id) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			pstmt = con.prepareStatement(CheckIDsql);
			pstmt.setString(1, u_id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				return 1; // 회원정보 있음
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, con);
		}
		return 0;// 데이터베이스 오류

	}

	@Override
	public int naverRegister(String u_id, String u_name, String u_email) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;	
		
		try {
			pstmt = con.prepareStatement(naverjoinSql);
			pstmt.setString(1, u_id);
			pstmt.setString(2, u_name);
			pstmt.setString(3, u_email);			
			System.out.println("[naver 회원가입 성공]");
			return pstmt.executeUpdate();//회원가입 성공

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt, con);
		}
		return -1;//회원가입 실패		
	}
	
	@Override
	public int withdrawal(String u_id) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			pstmt = con.prepareStatement(deleteSql);
			pstmt.setString(1, u_id);
			rs = pstmt.executeQuery();
			System.out.println("2..쿼리문 실행");

			if (rs.next()) {
				return 1; // 회원정보 있음
			}

		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			close(rs, pstmt, con);
		}
		return 0;// 데이터베이스 오류
	}

	// 아이디로 이름 가져오기
	@Override
	public String getUserName(String u_id) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			pstmt = con.prepareStatement(getUserNameSql);

			pstmt.setString(1, u_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				return rs.getString(1); // 이름 반환
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null; // 데이터베이스 오류
	}

	// 아이디로 pwd 가져오기
	@Override
	public String getUserPwd(String u_id) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			pstmt = con.prepareStatement(getUserPwdSql);
			pstmt.setString(1, u_id);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				return rs.getString(1); // 비밀번호 반환
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null; // 데이터베이스 오류
	}

	// 아이디로 이메일 인증여부 가져오기
	@Override
	public String getUserEmailChecked(String u_id) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = con.prepareStatement(getEmailCkSql);
			pstmt.setString(1, u_id);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				return rs.getString(1); // 이메일 인증여부 반환
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, con);
		}
		return "N";
	}

	// 유저 프로필사진 수정
	@Override
	public int changePhoto(String userID, String fileName) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		int res = 0;

		try {
			pstmt = con.prepareStatement(changePhotoSql);
			pstmt.setString(1, fileName);
			pstmt.setString(2, userID);

			res = pstmt.executeUpdate();

			if (res > 0) {
				commit(con);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt, con);
		}
		return res;
	}

	// 아이디로 유저 프로필사진파일명 가져오기
	@Override
	public String getUserPhoto(String userID) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			pstmt = con.prepareStatement(getUserPhotoSql);
			pstmt.setString(1, userID);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				return rs.getString(1); // 유저프로필파일명 반환
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, con);
		}
		// 유저프로필이 없는 경우, 기본사진 반환
		return "data:image/jpeg;base64,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";
	}

	// 아이디로 프로필파일경로 가져오기
	@Override
	public String getProfilePath(String u_id) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			pstmt = con.prepareStatement(getProfilePathSql);
			pstmt.setString(1, u_id);
			rs = pstmt.executeQuery();
			System.out.println("2-1. 프로필경로 가져오는 쿼리문 실행");
			while (rs.next()) {
				System.out.println("2-2. 프로필경로 가져오는 경로값 반환");
				return "http://localhost8787/beepro/matching/" + rs.getString("userProfile"); // 이미지경로 반환
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, con);
		}

		return "data:image/jpeg;base64,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";
	}

	// 이메일 인증상태 변경(N->Y)
	@Override
	public String setUserEmailChecked(String email) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;

		try {
			pstmt = con.prepareStatement(setEmailCkSql);
			pstmt.setString(1, email);
			pstmt.executeUpdate();
			return "Y"; // 이메일 인증성공

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt, con);
		}

		return "N";// 이메일 인증실패
	}

	// 비밀번호 변경
	@Override
	public int updatePwd(String newPwd, String u_id) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;

		String u_pwd = sha256.getSHA256(newPwd);

		try {
			pstmt = con.prepareStatement(updatePwdSql);
			pstmt.setString(1, u_pwd);
			pstmt.setString(2, u_id);
			pstmt.executeUpdate();

			return 1; // 비밀번호 변경 성공

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt, con);
		}

		return 2; // 비밀번호 변경 실패

	}
	//지역 정보 업데이트
	@Override
	public int updateArea(String u_id, String area) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		int res = 0;

		try {
			pstmt = con.prepareStatement(updateAreaSql);
			pstmt.setString(1, area);
			pstmt.setString(2, u_id);			

			res = pstmt.executeUpdate(); // 지역정보 변경 성공

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt, con);
		}

		return res; // 지역정보 변경 실패
		
	}
	//기술 정보 업데이트
	@Override
	public int updateSkill(String u_id, String skill) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		System.out.println(u_id);
		System.out.println(skill);
		int res = 0;
		try {
			pstmt = con.prepareStatement(updateSkillSql);
			pstmt.setString(1, skill);
			pstmt.setString(2, u_id);
			res = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt, con);
		}

		return res; // 비밀번호 변경 실패
		
	}


	/* 메세지 DAO */

	// 모든 채팅 리스트를 메세지시퀀스로 불러오는 메소드
	public ArrayList<MessageVo> getChatListBySeq(String send_id, String get_id, String message_seq) {

		ArrayList<MessageVo> chatList = null;
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM MESSAGE WHERE ((send_id=? AND get_id=?) OR (send_id=? AND get_id=?)) AND message_seq>? ORDER BY regdate ";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, send_id);
			pstmt.setString(2, get_id);
			pstmt.setString(3, get_id);
			pstmt.setString(4, send_id);
			pstmt.setInt(5, Integer.parseInt(message_seq));
			rs = pstmt.executeQuery();
			chatList = new ArrayList<MessageVo>();
			while (rs.next()) {
				MessageVo msg = new MessageVo();
				msg.setMessageSeq(rs.getInt("message_seq"));
				msg.setSend_id(rs.getString("send_id"));
				msg.setGet_id(rs.getString("get_id"));
				msg.setContent(rs.getString("content").replace(" ", "&nbsp;").replace("<", "&lt;").replace(">", "&gt;")
						.replace("\n", "<br>"));
				int regdate = Integer.parseInt(rs.getString("regdate").substring(11, 13));
				String timeType = "오전";
				if (regdate >= 12) {
					timeType = "오후";
					regdate -= 12;
				}
				msg.setRegdate(rs.getString("regdate").substring(0, 11) + " " + timeType + " " + regdate + ":"
						+ rs.getString("regdate").substring(14, 16) + "");
				chatList.add(msg);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, conn);
		}

		return chatList;
	}

	// 최근 업데이트된 채팅 불러오는 메소드
	public ArrayList<MessageVo> getChatListByRecent(String send_id, String get_id, int number) {

		ArrayList<MessageVo> chatList = null;
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = " SELECT * FROM MESSAGE WHERE ((send_id=? AND get_id=?) OR (send_id=? AND get_id=?)) AND message_seq > (SELECT MAX(message_seq) - ? FROM message WHERE (send_id=? AND get_id=?) OR (send_id=? AND get_id=?)) ORDER BY regdate ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, send_id);
			pstmt.setString(2, get_id);
			pstmt.setString(3, get_id);
			pstmt.setString(4, send_id);
			pstmt.setInt(5, number);
			pstmt.setString(6, send_id);
			pstmt.setString(7, get_id);
			pstmt.setString(8, get_id);
			pstmt.setString(9, send_id);

			rs = pstmt.executeQuery();
			chatList = new ArrayList<MessageVo>();

			while (rs.next()) {
				MessageVo msg = new MessageVo();
				msg.setMessageSeq(rs.getInt("message_seq"));
				msg.setSend_id(rs.getString("send_id"));
				msg.setGet_id(rs.getString("get_id"));
				msg.setContent(rs.getString("content").replace(" ", "&nbsp;").replace("<", "&lt;").replace(">", "&gt;")
						.replace("\n", "<br>"));
				// 오전 오후 나타내기 위한
				int regdate = Integer.parseInt(rs.getString("regdate").substring(11, 13));
				String timeType = "오전";
				if (regdate >= 12) {
					timeType = "오후";
					regdate -= 12;
				}
				msg.setRegdate(rs.getString("regdate").substring(0, 11) + " " + timeType + " " + regdate + ":"
						+ rs.getString("regdate").substring(14, 16) + "");
				chatList.add(msg);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, conn);
		}

		return chatList;
	}

	// 보낸 메세지
	public int submit(String send_id, String get_id, String content) {

		Connection conn = getConnection();
		PreparedStatement pstmt = null;

		String sql = " INSERT INTO MESSAGE VALUES(MESSAGE_SEQ.NEXTVAL,?,?,?,SYSDATE,0) ";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, send_id);
			pstmt.setString(2, get_id);
			pstmt.setString(3, content);

//			System.out.println("send_id : " + send_id );
//			System.out.println("get_id : " + get_id );
//			System.out.println("content : " + content );

			return pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt, conn);
		}

		return -1; // 데이터베이스 오류
	}

	// 메세지를 읽었다고 반환(받는사람 입장에서 해당 메세지를 다 받았다고 알림!)
	public int readChat(String send_id, String get_id) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;

		String sql = " UPDATE MESSAGE SET read_ck = 1 WHERE (send_id = ? AND get_id = ?) ";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, get_id); // 받는사람과 보낸사람 교차해서 넣어줌
			pstmt.setString(2, send_id);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(con);
		}
		return -1; // 데이터베이스 오류
	}

	// 현재 읽지 않은 메세지의 개수를 반환
	public int getAllUnreadChat(String u_id) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = " SELECT COUNT(message_seq) FROM message WHERE get_id = ? AND read_ck = 0 ";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, u_id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt("COUNT(message_seq)");
			}
			return 0; // 받은 메시지 없음
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
			close(con);
		}
		return -1; // 데이터베이스 오류

	}

	public ArrayList<MessageVo> getBox(String u_id) {

		ArrayList<MessageVo> chatList = null;
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String SQL = " SELECT * FROM message WHERE message_seq IN (SELECT MAX(message_seq) FROM message WHERE get_id = ? OR send_id = ? GROUP BY send_id, get_id) ";
		try {
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, u_id);
			pstmt.setString(2, u_id);
			rs = pstmt.executeQuery();

			chatList = new ArrayList<MessageVo>();
			while (rs.next()) {
				MessageVo msg = new MessageVo();
				msg.setMessageSeq(rs.getInt("message_seq"));
				msg.setSend_id(rs.getString("send_id"));
				msg.setGet_id(rs.getString("get_id"));
				msg.setContent(rs.getString("content").replace(" ", "&nbsp;").replace("<", "&lt;").replace(">", "&gt;")
						.replace("\n", "<br>"));
				// 오전 오후 나타내기 위한
				int regdate = Integer.parseInt(rs.getString("regdate").substring(11, 13));
				String timeType = "오전";
				if (regdate >= 12) {
					timeType = "오후";
					regdate -= 12;
				}
				msg.setRegdate(rs.getString("regdate").substring(0, 11) + " " + timeType + " " + regdate + ":"
						+ rs.getString("regdate").substring(14, 16) + "");
				chatList.add(msg);

				for (int i = 0; i < chatList.size(); i++) {
					MessageVo x = chatList.get(i);
					for (int j = 0; j < chatList.size(); j++) {
						MessageVo y = chatList.get(j);
						if (x.getSend_id().equals(y.getGet_id()) && x.getGet_id().equals(y.getSend_id())) {
							if (x.getMessageSeq() < y.getMessageSeq()) {
								chatList.remove(x);
								i--;
								break;
							} else {
								chatList.remove(y);
								j--;
							}
						}
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
			close(con);
		}

		return chatList; // 리스트 반환
	}

	// 특정 회원으로 부터 현재 읽지 않은 메세지의 개수를 반환
	public int getUnreadChat(String send_id, String get_id) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = " SELECT COUNT(message_seq) FROM message WHERE send_id = ? AND get_id = ? AND read_ck = 0 ";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, send_id);
			pstmt.setString(2, get_id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt("COUNT(message_seq)");
			}
			return 0; // 받은 메시지 없음
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
			close(con);
		}
		return -1; // 데이터베이스 오류
	}

	/* 쪽지 DAO */

	// 쪽지 보내기
	public int insertMsg(String send_id, String get_id, String content) {

		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		int res = 0;
		String sql = " INSERT INTO msg VALUES(msg_seq.NEXTVAL,?,?,?,SYSDATE,0,'Y','Y') ";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, send_id);
			pstmt.setString(2, get_id);
			pstmt.setString(3, content);

			res = pstmt.executeUpdate();

			if (res > 0) {
				commit(conn);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt, conn);
		}

		return res;
	}

	// 쪽지 읽었다고 처리
	public int readMsg(int no) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		int res = 0;
		String sql = " UPDATE msg SET read_ck = 1 WHERE msg_seq=? ";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);

			res = pstmt.executeUpdate();

			if (res > 0) {
				commit(con);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt, con);
		}
		return res;
	}

	//보낸 쪽지 삭제
	public int deletSendMsg(String[] list) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		int res = 0;
		int msg_seq = 0;

		String sql = " UPDATE msg SET sdelete_ck='N' WHERE msg_seq=? ";

		try {
			for (int i = 0; i < list.length; i++) {
				msg_seq = Integer.parseInt(list[i]);
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, msg_seq);

				res = pstmt.executeUpdate();

				if (res > 0) {
					commit(con);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(con);
		}

		return res;
	}
	//받은 쪽지 삭제
	public int deletGetMsg(String[] list) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		int res = 0;
		int msg_seq = 0;

		String sql = " UPDATE msg SET gdelete_ck='N' WHERE msg_seq=? ";

		try {
			for (int i = 0; i < list.length; i++) {
				msg_seq = Integer.parseInt(list[i]);
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, msg_seq);

				res = pstmt.executeUpdate();

				if (res > 0) {
					commit(con);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(con);
		}

		return res;
	}
	
	// 읽은 쪽지 체크
	public ArrayList<Integer> readChk(String u_id) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Integer> list = new ArrayList<Integer>();

		String sql = " SELECT * FROM msg WHERE get_id=? AND read_ck=1 ";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, u_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				list.add(rs.getInt(1));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
			close(con);
		}

		return list;
	}

	// 모든 받은 쪽지 목록
	public ArrayList<MsgVo> getAllMsg(String get_id) {
		ArrayList<MsgVo> list = null;
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM msg WHERE get_id=? AND gdelete_ck='Y' ORDER BY regdate DESC ";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, get_id);
			rs = pstmt.executeQuery();

			list = new ArrayList<MsgVo>();

			while (rs.next()) {
				MsgVo msg = new MsgVo();
				msg.setMsg_seq(rs.getInt("msg_seq"));
				msg.setSend_id(rs.getString("send_id"));
				msg.setGet_id(rs.getString("get_id"));
				msg.setContent(rs.getString("content"));

				int regdate = Integer.parseInt(rs.getString("regdate").substring(11, 13));
				String timeType = "오전";
				if (regdate >= 12) {
					timeType = "오후";
					regdate -= 12;
				}
				msg.setRegdate(rs.getString("regdate").substring(0, 11) + " " + timeType + " " + regdate + ":"
						+ rs.getString("regdate").substring(14, 16) + "");
				msg.setRead_ck(rs.getInt("read_ck"));

				list.add(msg);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, conn);
		}

		return list;
	}

	// 모든 보낸 쪽지 목록
	public ArrayList<MsgVo> sendAllMsg(String u_id) {
		ArrayList<MsgVo> list = null;
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM msg WHERE send_id=? AND sdelete_ck='Y' ORDER BY regdate DESC ";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, u_id);
			rs = pstmt.executeQuery();

			list = new ArrayList<MsgVo>();

			while (rs.next()) {
				MsgVo msg = new MsgVo();
				msg.setMsg_seq(rs.getInt("msg_seq"));
				msg.setSend_id(rs.getString("send_id"));
				msg.setGet_id(rs.getString("get_id"));
				msg.setContent(rs.getString("content"));

				int regdate = Integer.parseInt(rs.getString("regdate").substring(11, 13));
				String timeType = "오전";
				if (regdate >= 12) {
					timeType = "오후";
					regdate -= 12;
				}
				msg.setRegdate(rs.getString("regdate").substring(0, 11) + " " + timeType + " " + regdate + ":"
						+ rs.getString("regdate").substring(14, 16) + "");
				msg.setRead_ck(rs.getInt("read_ck"));

				list.add(msg);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, conn);
		}

		return list;
	}

	// 보낸 쪽지 읽었는지 체크
	public ArrayList<Integer> sendMsgReadChk(String u_id) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Integer> list = new ArrayList<Integer>();
		
		String sql = " SELECT * FROM msg WHERE send_id=? AND read_ck=1 ";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, u_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				list.add(rs.getInt(1));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
			close(con);
		}

		return list;
	}

	// 읽지 않은 쪽지 갯수
	public int getUnreadAllMsg(String u_id) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = " SELECT COUNT(msg_seq) FROM msg WHERE get_id = ? AND read_ck = 0 AND gdelete_ck='Y'  ";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, u_id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				return rs.getInt("COUNT(msg_seq)");
			}
			return 0; // 받은 쪽지 없음
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
			close(con);
		}
		return -1; // 데이터베이스 오류
	}
	
	
	
	

	/* 하트 DAO */
	
	public int heartChk(String send_id, String get_id) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = " SELECT * FROM heart WHERE send_id=? AND get_id=? ";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, send_id);
			pstmt.setString(2, get_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				return -1; // 컬럼이 존재하면 음수 리턴

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(con);
		}

		return 1; // 컬럼이 존재하지 않으면 양수 리턴
	}
	
	public int insertHeart(HeartVo vo) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		int res = 0;

		try {
			pstmt = con.prepareStatement(insertHeartSql);
			pstmt.setString(1, vo.getH_send());
			pstmt.setString(2, vo.getH_get());

			res = pstmt.executeUpdate();

			if (res > 0) {
				commit(con);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(con);
		}
		return res;
	}
	
	public int deleteHeart(HeartVo vo) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		int res = 0;
		String sql = " DELETE FROM heart WHERE send_id=? AND get_id=? ";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getH_send());
			pstmt.setString(2, vo.getH_get());
			
			res = pstmt.executeUpdate();
			if (res > 0) {
				commit(con);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(con);
		}
		return res;
	}
	
	//내가 팔로우한 사람 목록
	public ArrayList<String> selectFollowing(String send_id) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<String> list = new ArrayList<String>();

		try {
			pstmt = con.prepareStatement(followingSql);
			pstmt.setString(1, send_id);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				list.add(rs.getString(1));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;

	}
	
	//팔로우 목록 (보류)
	public ArrayList<String> selectFollower(String get_id) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<String> list = new ArrayList<String>();

		try {
			pstmt = con.prepareStatement(followerSql);
			pstmt.setString(1, get_id);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				list.add(rs.getString(1));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;

	}
	
	//나를 팔로우한 갯수
	public int followerCount(String u_id) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = " SELECT COUNT(*) FROM heart WHERE get_id = ? ";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, u_id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt("COUNT(*)");
			}
			return 0; 
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
			close(con);
		}
		return -1; // 데이터베이스 오류

	}
	
	//나를 팔로잉한 갯수
	public int followingCount(String u_id) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = " SELECT COUNT(*) FROM heart WHERE send_id = ? ";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, u_id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt("COUNT(*)");
			}
			return 0; 
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
			close(con);
		}
		return -1; // 데이터베이스 오류

	}

	public int projectCount(String u_id) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = " select count(*) from project where member_id LIKE '%"+u_id+"%'";
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt("COUNT(*)");
			}
			return 0; // 참여프로젝트 없음
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
			close(con);
		}
		return -1; // 데이터베이스 오류
	}
	

}
