package com.smhrd.model;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class cocDAO {
	SqlSessionFactory factory = SqlSessionManager.getSqlSessionFactory();

	// 회원가입기능
	public int join(userDTO user) {
		SqlSession session = factory.openSession(true);

		int row = 0;

		try {
			row = session.insert("cocMapper.join", user);

			if (row > 0) {
				session.commit();
			} else {
				session.rollback();
			}
		} catch (Exception e) {
			System.out.println("dao 회원가입 실패");
			e.printStackTrace();
		} finally {
			// 3. session 자원 반납
			session.close();
		}

		return row;

	}

	// 로그인기능
	public userDTO login(userDTO user) {

		SqlSession session = factory.openSession(true);

		userDTO u = null;

		try {
			u = session.selectOne("cocMapper.login", user);

			if (u != null) {
				session.commit();
			} else {
				session.rollback();
			}
		} catch (Exception e) {
			System.out.println("로그인 실패");
			e.printStackTrace();
		} finally {
			session.close();
		}

		return u;

	}

	public int idCheck(String id) {

		SqlSession session = factory.openSession(true);

		int row = 0;

		try {
			row = session.selectOne("cocMapper.idCheck", id);

			if (row > 0) {
				session.commit();
			} else {
				session.rollback();
			}
		} catch (Exception e) {
			System.out.println("id 체크 실패");
			e.printStackTrace();
		} finally {
			session.close();
		}

		return row;

	}

	public int nickCheck(String nickname) {
		SqlSession session = factory.openSession(true);

		int row = 0;

		try {
			row = session.selectOne("cocMapper.nickCheck", nickname);

			if (row > 0) {
				session.commit();
			} else {
				session.rollback();
			}
		} catch (Exception e) {
			System.out.println("nick 체크 실패");
			e.printStackTrace();
		} finally {
			session.close();
		}

		return row;

	}
	
	public List<ingredientDTO> ingtype(String type) {
		SqlSession session = factory.openSession();
		List<ingredientDTO> list = null;
		System.out.println("dao에서는"+type);
		try {
			list = session.selectList("cocMapper.ingtype",type);
		} catch (Exception e) {
			System.out.println("선택한재료 불러오기 실패");
			e.printStackTrace();
		}finally {
			session.close();
		}
		return list;
	}

	public List<ingredientDTO> ingall() {
		SqlSession session = factory.openSession();
		List<ingredientDTO> list = null;
		try {
			list = session.selectList("cocMapper.ingall");
		} catch (Exception e) {
			System.out.println("모든 재료 불러오기 실패");
			e.printStackTrace();
		}finally {
			session.close();
		}
		return list;
	}
	
	public List<cocDTO> ct_all(){
		SqlSession session = factory.openSession();
		List<cocDTO> list = null;
		try {
			list = session.selectList("cocMapper.cocall");
		} catch (Exception e) {
			System.out.println("모든 칵테일 불러오기 실패");
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return list;
	}
	
	public List<cocDTO> ct_atype(String type){
		SqlSession session = factory.openSession();
		List<cocDTO> list = null;
		System.out.println(type);
		try {
			list = session.selectList("cocMapper.cocatype",type);
		} catch (Exception e) {
			System.out.println("종류 칵테일 불러오기 실패");
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return list;
	}
	public List<cocDTO> ct_btype(String btype){
		SqlSession session = factory.openSession();
		List<cocDTO> list = null;
		try {
			if(btype.equals("낮음 (0-10%)")) {
			list = session.selectList("cocMapper.cocbtype10");
			} else if (btype.equals("중간 (10-20%)")) {
				list = session.selectList("cocMapper.cocbtype20");
			}else {
				list = session.selectList("cocMapper.cocbtype30");
			}
		} catch (Exception e) {
			System.out.println("모든 칵테일 불러오기 실패");
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return list;
	}
	
	public List<cocDTO> ct_abtype(String a ,String b){
		SqlSession session = factory.openSession();
		List<cocDTO> list = null;
		try {
			if(a.equals("다양한") && b.equals("다양한")) {
				list = session.selectList("cocMapper.cocall");
			} else if (a.equals("다양한") && b.equals("낮음 (0-10%)")) {
				list = session.selectList("cocMapper.cocbtype10");
			} else if (a.equals("다양한") && b.equals("중간 (10-20%)")) {
				list = session.selectList("cocMapper.cocbtype20");
			} else if (a.equals("다양한") && b.equals("높음 (20% 이상)")) {
				list = session.selectList("cocMapper.cocbtype30");
			} else if (!a.equals("다양한")) {
				if(b.equals("낮음 (0-10%)")) {
					list = session.selectList("cocMapper.cocabtype10",a);
					} else if (b.equals("중간 (10-20%)")) {
						list = session.selectList("cocMapper.cocabtype20",a);
					}else {
						list = session.selectList("cocMapper.cocabtype30",a);
					}
			}
			
			
			
			
			
		} catch (Exception e) {
			System.out.println("모든 칵테일 불러오기 실패");
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return list;
	}

	public List<cocDTO> loadingrsp(String name) {
		SqlSession session = factory.openSession();
		List<cocDTO> list = null;
		try {
			list = session.selectList("cocMapper.loadingrsp",name);
		} catch (Exception e) {
			System.out.println("종류 칵테일 불러오기 실패");
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return list;
		
		
		
	}
	

	public int user_update(userDTO dto) {
		SqlSession session = factory.openSession(true);

		int u = 0;

		try {
			u = session.update("cocMapper.userupdate", dto);

			if (u > 0) {
				session.commit();
			} else {
				session.rollback();
			}
		} catch (Exception e) {
			System.out.println("수정 실패");
			e.printStackTrace();
		} finally {
			session.close();
		}

		return u;
		
		
	}
	public int imgcange(userDTO dto) {
		SqlSession session = factory.openSession(true);

		int u = 0;

		try {
			u = session.update("cocMapper.imgcange", dto);

			if (u > 0) {
				session.commit();
			} else {
				session.rollback();
			}
		} catch (Exception e) {
			System.out.println("수정 실패");
			e.printStackTrace();
		} finally {
			session.close();
		}

		return u;
	}

	public int heart(coc_likeDTO dto) {
		SqlSession session = factory.openSession(true);

		int u = 0;

		try {
			u = session.insert("cocMapper.ct_like", dto);

			if (u > 0) {
				session.commit();
			} else {
				session.rollback();
			}
		} catch (Exception e) {
			System.out.println("하트 실패");
			e.printStackTrace();
		} finally {
			session.close();
		}

		return u;
		
	}

	public coc_likeDTO checkheart(coc_likeDTO dto) {
		SqlSession session = factory.openSession(true);

		coc_likeDTO u = null;

		try {
			u = session.selectOne("cocMapper.ct_ck_like", dto);

			if (u != null) {
				session.commit();
			} else {
				session.rollback();
			}
		} catch (Exception e) {
			System.out.println("하트 췍 실패");
			e.printStackTrace();
		} finally {
			session.close();
		}

		return u;
	}

	public int deleteheart(coc_likeDTO dto) {
		SqlSession session = factory.openSession(true);

		int u = 0;

		try {
			u = session.delete("cocMapper.ct_dl_like", dto);

			if (u > 0) {
				session.commit();
			} else {
				session.rollback();
			}
		} catch (Exception e) {
			System.out.println("하트 삭제 실패");
			e.printStackTrace();
		} finally {
			session.close();
		}

		return u;
		
	}

	public List<cocDTO> mypage_ct(String user_id) {
		SqlSession session = factory.openSession();
		List<cocDTO> list = null;
		try {
			list = session.selectList("cocMapper.mypick",user_id);
		} catch (Exception e) {
			System.out.println("내가 좋아요한 칵테일 불러오기 실패");
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return list;
		
	}
	public int ct_like_count(String user_id) {
		SqlSession session = factory.openSession();
		int count = 0;
			try {
				count = session.selectOne("cocMapper.ct_like_count",user_id);
			} catch (Exception e) {
				System.out.println("내가 좋아요한 칵테일 갯수 불러오기 실패");
				e.printStackTrace();
			}finally {
				session.close();
			}
		return count;
			
	}

	public List<postDTO> loadpost() {
		SqlSession session = factory.openSession();
		List<postDTO> list= null;
		try {
			list = session.selectList("cocMapper.load_post");

			if (list != null) {
				session.commit();
			} else {
				session.rollback();
			}
		} catch (Exception e) {
			System.out.println("post 불러오기 실패");
			e.printStackTrace();
		} finally {
			// 3. session 자원 반납
			session.close();
		}
		
		
		return list;
	}
	
	public int updateUserImage(userDTO user) {
	      SqlSession session = factory.openSession(true);
	      
	      
	      int result = 0;
	      try {
	          System.out.println("세션 닉네임 값 확인 : " + user.getUser_nick()); // 디버깅용 로그
	         result = session.update("cocMapper.updateUserImage", user);
	         System.out.println(result);
	         if (result > 0) {
	            session.commit();
	            System.out.println(result);
	         } else {
	            session.rollback();
	         }
	      } catch (Exception e) {
	         System.out.println("이미지 업데이트 실패");
	         e.printStackTrace();
	      } finally {
	         // 3. session 자원 반납
	         session.close();
	      }

	      return result;

	   }

	public int savePost(postDTO post) {
		SqlSession session = factory.openSession(true);

		int row = 0;

		try {
			row = session.insert("cocMapper.up_post", post);

			if (row > 0) {
				session.commit();
			} else {
				session.rollback();
			}
		} catch (Exception e) {
			System.out.println("dao 포스트 업로드 실패");
			e.printStackTrace();
		} finally {
			// 3. session 자원 반납
			session.close();
		}

		return row;
		
	}

	public int comment_up(coc_commentDTO dto) {
		SqlSession session = factory.openSession(true);

		int u = 0;

		try {
			u = session.insert("cocMapper.comment_up", dto);

			if (u > 0) {
				session.commit();
			} else {
				session.rollback();
			}
		} catch (Exception e) {
			System.out.println("dao댓글등록 실패");
			e.printStackTrace();
		} finally {
			session.close();
		}

		return u;
		
	}

	public List<coc_commentDTO> loadcomment(coc_commentDTO dto) {
		SqlSession session = factory.openSession(true);
		List<coc_commentDTO> u = null;

		try {
			u = session.selectList("cocMapper.comment_load",dto);

			if (u != null) {
				session.commit();
			} else {
				session.rollback();
			}
		} catch (Exception e) {
			System.out.println("dao댓글 불러오기 실패");
			e.printStackTrace();
		} finally {
			session.close();
		}

		return u;
	}

	public userDTO getid(userDTO ddto) {
		SqlSession session = factory.openSession(true);

		userDTO u = null;

		try {
			u = session.selectOne("cocMapper.getid", ddto);

			if (u != null) {
				session.commit();
			} else {
				session.rollback();
			}
		} catch (Exception e) {
			System.out.println("dao댓글 포토 불러오기 실패");
			e.printStackTrace();
		} finally {
			session.close();
		}

		return u;		
	}

	public postDTO getpost(postDTO dto) {
		SqlSession session = factory.openSession(true);

		postDTO u = null;
			session.update("cocMapper.up_view",dto);
		try {
			u = session.selectOne("cocMapper.get_post", dto);

			if (u != null) {
				session.commit();
			} else {
				session.rollback();
			}
		} catch (Exception e) {
			System.out.println("dao 개시글하나불러오기 실패");
			e.printStackTrace();
		} finally {
			session.close();
		}

		return u;				
	}

	public int comment_up_post(post_commentDTO dto) {
		SqlSession session = factory.openSession(true);

		int u = 0;

		try {
			u = session.insert("cocMapper.comment_up_post", dto);

			if (u > 0) {
				session.commit();
			} else {
				session.rollback();
			}
		} catch (Exception e) {
			System.out.println("daoeee댓글등록 실패");
			e.printStackTrace();
		} finally {
			session.close();
		}

		return u;
	}

	public List<post_commentDTO> loadcomment_post(post_commentDTO dto) {
		SqlSession session = factory.openSession(true);
		List<post_commentDTO> u = null;

		try {
			u = session.selectList("cocMapper.comment_post",dto);

			if (u != null) {
				session.commit();
			} else {
				session.rollback();
			}
		} catch (Exception e) {
			System.out.println("dao댓글 불러오기 실패");
			e.printStackTrace();
		} finally {
			session.close();
		}

		return u;
	}

	public int delcomment(post_commentDTO dto) {
		SqlSession session = factory.openSession(true);
		int u = 0;
		try {
			u = session.delete("cocMapper.del_comment",dto);

			if (u > 0) {
				session.commit();
			} else {
				session.rollback();
			}
		} catch (Exception e) {
			System.out.println("dao댓글 삭제 실패");
			e.printStackTrace();
		} finally {
			session.close();
		}
		return u;
		
		
	}

	public int updatepost(post_commentDTO dto) {
		SqlSession session = factory.openSession(true);
		int u = 0;
		try {
			u = session.update("cocMapper.up_comt",dto);

			if (u > 0) {
				session.commit();
			} else {
				session.rollback();
			}
		} catch (Exception e) {
			System.out.println("dao댓글 수정 실패");
			e.printStackTrace();
		} finally {
			session.close();
		}
		return u;
		
	}

	public int upPost(postDTO dto) {
		SqlSession session = factory.openSession(true);
		int u = 0;
		try {
			u = session.update("cocMapper.update_post",dto);

			if (u > 0) {
				session.commit();
			} else {
				session.rollback();
			}
		} catch (Exception e) {
			System.out.println("dao개시글 수정 실패");
			e.printStackTrace();
		} finally {
			session.close();
		}
		return u;
		
	}

	public int upPostnoimg(postDTO dto) {
		SqlSession session = factory.openSession(true);
		int u = 0;
		try {
			u = session.update("cocMapper.update_post_noimg",dto);

			if (u > 0) {
				session.commit();
			} else {
				session.rollback();
			}
		} catch (Exception e) {
			System.out.println("dao개시글 수정 실패");
			e.printStackTrace();
		} finally {
			session.close();
		}
		return u;
	}

	public int delpost(int post_idx) {
		SqlSession session = factory.openSession(true);
		int u = 0;
		try {
			u = session.delete("cocMapper.delpost",post_idx);

			if (u > 0) {
				session.commit();
			} else {
				session.rollback();
			}
		} catch (Exception e) {
			System.out.println("dao포스트 삭제 실패");
			e.printStackTrace();
		} finally {
			session.close();
		}
		return u;
	}
	
	public int delcomt(int post_idx) {
		SqlSession session = factory.openSession(true);
		int u = 0;
		try {
			u = session.delete("cocMapper.delcomt",post_idx);

			if (u > 0) {
				session.commit();
			} else {
				session.rollback();
			}
		} catch (Exception e) {
			System.out.println("dao포스트댓글 삭제 실패");
			e.printStackTrace();
		} finally {
			session.close();
		}
		return u;
	}

	public int updatepost_ct(coc_commentDTO dto) {
		SqlSession session = factory.openSession(true);
		int u = 0;
		try {
			u = session.update("cocMapper.up_comt_ct",dto);

			if (u > 0) {
				session.commit();
			} else {
				session.rollback();
			}
		} catch (Exception e) {
			System.out.println("dao댓글 수정 실패");
			e.printStackTrace();
		} finally {
			session.close();
		}
		return u;
	}

	public int delcomment_ct(coc_commentDTO dto) {
		SqlSession session = factory.openSession(true);
		int u = 0;
		try {
			u = session.delete("cocMapper.del_comment_ct",dto);

			if (u > 0) {
				session.commit();
			} else {
				session.rollback();
			}
		} catch (Exception e) {
			System.out.println("dao댓글 삭제 실패");
			e.printStackTrace();
		} finally {
			session.close();
		}
		return u;
		
	}

	public List<usercocDTO> LoadFeed() {
		SqlSession session = factory.openSession(true);
		List<usercocDTO> list = null;
		try {
			list = session.selectList("cocMapper.Load_Feed");

			if (list != null) {
				session.commit();
			} else {
				session.rollback();
			}
		} catch (Exception e) {
			System.out.println("dao feed 불러오기 실패");
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

	public int user_comment_cnt(String string) {
		SqlSession session = factory.openSession();
		int count = 0;
			try {
				count = session.selectOne("cocMapper.cmt_cnt",string);
			} catch (Exception e) {
				System.out.println("댓글갯수 불러오기 실패");
				e.printStackTrace();
			}finally {
				session.close();
			}
		return count;
		
	}

	public int feedupload(usercocDTO dto) {
		SqlSession session = factory.openSession(true);

		int u = 0;

		try {
			u = session.insert("cocMapper.feedupload", dto);

			if (u > 0) {
				session.commit();
			} else {
				session.rollback();
			}
		} catch (Exception e) {
			System.out.println("dao피드업로드  실패");
			e.printStackTrace();
		} finally {
			session.close();
		}

		return u;
		
	}

	public usercocDTO getFeed(int idx) {
		SqlSession session = factory.openSession(true);

		usercocDTO u = null;
		try {
			u = session.selectOne("cocMapper.get_feed", idx);

			if (u != null) {
				session.commit();
			} else {
				session.rollback();
			}
		} catch (Exception e) {
			System.out.println("dao 피드 하나불러오기 실패");
			e.printStackTrace();
		} finally {
			session.close();
		}

		return u;				
		
	}

	public int comment_up_feed(user_coc_commentDTO dto) {
		SqlSession session = factory.openSession(true);

		int u = 0;

		try {
			u = session.insert("cocMapper.comment_up_feed", dto);

			if (u > 0) {
				session.commit();
			} else {
				session.rollback();
			}
		} catch (Exception e) {
			System.out.println("daoeee피드댓글등록 실패");
			e.printStackTrace();
		} finally {
			session.close();
		}

		return u;
		
	}

	public List<user_coc_commentDTO> loadcomment_feed(user_coc_commentDTO dto) {
		SqlSession session = factory.openSession(true);
		List<user_coc_commentDTO> u = null;

		try {
			u = session.selectList("cocMapper.comment_feed",dto);

			if (u != null) {
				session.commit();
			} else {
				session.rollback();
			}
		} catch (Exception e) {
			System.out.println("dao댓글 불러오기 실패");
			e.printStackTrace();
		} finally {
			session.close();
		}

		return u;
	}

	public user_coc_likeDTO checkheart_feed(user_coc_likeDTO dto) {
		SqlSession session = factory.openSession(true);

		user_coc_likeDTO u = null;

		try {
			u = session.selectOne("cocMapper.user_ct_ck_like", dto);

			if (u != null) {
				session.commit();
			} else {
				session.rollback();
			}
		} catch (Exception e) {
			System.out.println("하트 췍 실패");
			e.printStackTrace();
		} finally {
			session.close();
		}

		return u;
	}

	public userDTO usr_img_get(String user_id) {
		SqlSession session = factory.openSession(true);

		userDTO u = null;

		try {
			u = session.selectOne("cocMapper.user_img_get", user_id);

			if (u != null) {
				session.commit();
			} else {
				session.rollback();
			}
		} catch (Exception e) {
			System.out.println("하트 췍 실패");
			e.printStackTrace();
		} finally {
			session.close();
		}
		return u;

		
		
	}

	public int heart_feed(user_coc_likeDTO dto) {
		SqlSession session = factory.openSession(true);

		int u = 0;

		try {
			u = session.insert("cocMapper.user_ct_like", dto);

			if (u > 0) {
				session.commit();
			} else {
				session.rollback();
			}
		} catch (Exception e) {
			System.out.println("하트 실패");
			e.printStackTrace();
		} finally {
			session.close();
		}

		return u;
		
	}

	public int deleteheart_feed(user_coc_likeDTO dto) {
		SqlSession session = factory.openSession(true);

		int u = 0;

		try {
			u = session.delete("cocMapper.user_ct_dl_like", dto);

			if (u > 0) {
				session.commit();
			} else {
				session.rollback();
			}
		} catch (Exception e) {
			System.out.println("하트 삭제 실패");
			e.printStackTrace();
		} finally {
			session.close();
		}

		return u;
	}

	public int updatepost_feed(user_coc_commentDTO dto) {
		SqlSession session = factory.openSession(true);
		int u = 0;
		try {
			u = session.update("cocMapper.up_comt_feed",dto);

			if (u > 0) {
				session.commit();
			} else {
				session.rollback();
			}
		} catch (Exception e) {
			System.out.println("dao댓글 수정 실패");
			e.printStackTrace();
		} finally {
			session.close();
		}
		return u;
	}

	public int delcomment_feed(user_coc_commentDTO dto) {
		SqlSession session = factory.openSession(true);
		int u = 0;
		try {
			u = session.delete("cocMapper.del_comment_feed",dto);

			if (u > 0) {
				session.commit();
			} else {
				session.rollback();
			}
		} catch (Exception e) {
			System.out.println("dao댓글 삭제 실패");
			e.printStackTrace();
		} finally {
			session.close();
		}
		return u;
	}

	public int upFeed(usercocDTO dto) {
		SqlSession session = factory.openSession(true);
		int u = 0;
		try {
			u = session.update("cocMapper.update_feed",dto);

			if (u > 0) {
				session.commit();
			} else {
				session.rollback();
			}
		} catch (Exception e) {
			System.out.println("dao피드 수정 실패");
			e.printStackTrace();
		} finally {
			session.close();
		}
		return u;
		
	}
	public int upFeednoimg(usercocDTO dto) {
		SqlSession session = factory.openSession(true);
		int u = 0;
		try {
			u = session.update("cocMapper.update_feed_noimg",dto);

			if (u > 0) {
				session.commit();
			} else {
				session.rollback();
			}
		} catch (Exception e) {
			System.out.println("dao피드 수정 실패");
			e.printStackTrace();
		} finally {
			session.close();
		}
		return u;
		
	}

	public int delcomt_feed(int feed_idx) {
		SqlSession session = factory.openSession(true);
		int u = 0;
		try {
			u = session.delete("cocMapper.delcomt_feed",feed_idx);

			if (u > 0) {
				session.commit();
			} else {
				session.rollback();
			}
		} catch (Exception e) {
			System.out.println("da피드 모든 댓글 삭제 실패");
			e.printStackTrace();
		} finally {
			session.close();
		}
		return u;
		
	}

	public int delfeed(int feed_idx) {
		SqlSession session = factory.openSession(true);
		System.out.println("왜?>"+feed_idx);
		int u = 0;
		try {
			u = session.delete("cocMapper.delfeed",feed_idx);

			if (u > 0) {
				session.commit();
			} else {
				session.rollback();
			}
		} catch (Exception e) {
			System.out.println("dao피드 삭제 실패");
			e.printStackTrace();
		} finally {
			session.close();
		}
		return u;
		
	}

	public int delfeed_heart(int feed_idx) {
		SqlSession session = factory.openSession(true);
		int u = 0;
		try {
			u = session.delete("cocMapper.delfeed_heart",feed_idx);

			if (u > 0) {
				session.commit();
			} else {
				session.rollback();
			}
		} catch (Exception e) {
			System.out.println("dao피드 삭제 실패");
			e.printStackTrace();
		} finally {
			session.close();
		}
		return u;
		
	}

	public int user_ct_like_count(String user_id) {
		SqlSession session = factory.openSession();
		int count = 0;
			try {
				count = session.selectOne("cocMapper.user_ct_like_count",user_id);
			} catch (Exception e) {
				System.out.println("내 피드 개수 불러오기 실패");
				e.printStackTrace();
			}finally {
				session.close();
			}
		return count;
	}

	public List<usercocDTO> mypage_fd(String user_id) {
		SqlSession session = factory.openSession();
		List<usercocDTO> list = null;
		try {
			list = session.selectList("cocMapper.myfeed",user_id);
		} catch (Exception e) {
			System.out.println("내가 좋아요한 칵테일 불러오기 실패");
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return list;
	}
	   // 칵테일 검색 기능
	   public List<cocDTO> searchCocktails(String query) {
	       SqlSession session = factory.openSession(true);
	       List<cocDTO> c = new ArrayList<>();

	       try {
	           c = session.selectList("cocMapper.searchCocktails",query);

	           if (c != null) {
	               session.commit();
	           } else {
	               session.rollback();
	           }
	       } catch (Exception e) {
	           System.out.println("dao 칵테일 찾기 실패");
	           e.printStackTrace();
	           session.rollback(); // 예외 발생 시 롤백 처리
	       } finally {
	           session.close();
	       }
	       return c;
	   }
	   // 재료 검색 기능
	   public List<ingredientDTO> searchIngredients(String query) {
	       SqlSession session = factory.openSession(true);
	       List<ingredientDTO> i = new ArrayList<>();

	       try {
	           i = session.selectList("cocMapper.searchIngredients", query );

	           if (i != null) {
	               session.commit();
	           } else {
	               session.rollback();
	           }
	       } catch (Exception e) {
	           System.out.println("dao 재료 찾기 실패");
	           e.printStackTrace();
	           session.rollback(); // 예외 발생 시 롤백 처리
	       } finally {
	           session.close();
	       }
	       return i;
	   }




	   //칵테일 json객체 저장
	   public  List<cocDTO> getCocktailDetails(int ct_idx) {
	       SqlSession session = factory.openSession(true);
	       List<cocDTO> c = new ArrayList<>();
	       try {
	              c = session.selectList("cocMapper.searchCocktailModal",ct_idx);

	              if (c != null) {
	                  session.commit();
	              } else {
	                  session.rollback();
	              }
	          } catch (Exception e) {
	              System.out.println("dao 칵테일 객체 저장 실패");
	              e.printStackTrace();
	              session.rollback(); // 예외 발생 시 롤백 처리
	          } finally {
	              session.close();
	          }
	          return c;
	   }
	   
	   // 재료 json 객체 저장
	   public List<ingredientDTO> getIngredients(int ingre_idx) {
	       SqlSession session = factory.openSession(true);
	        List<ingredientDTO> i = new ArrayList<>();
	        try {
	              i = session.selectList("cocMapper.searchIngredientModal", ingre_idx );

	              if (i != null) {
	                  session.commit();
	              } else {
	                  session.rollback();
	              }
	          } catch (Exception e) {
	              System.out.println("dao 재료 찾기 실패");
	              e.printStackTrace();
	              session.rollback(); // 예외 발생 시 롤백 처리
	          } finally {
	              session.close();
	          }
	          return i;
	   }
	   
	   // 검색 기능: 제목, 내용, 작성자에서 검색어를 포함하는 포스트 조회
       public List<postDTO> searchPost(String query) {
           SqlSession session = factory.openSession(true);
           List<postDTO> list = null;
           try {
               list = session.selectList("cocMapper.searchPost", query);
               
               if (list != null) {
                   session.commit();
               } else {
                   session.rollback();
               }
           } catch (Exception e) {
               System.out.println("포스트 검색 실패");
               e.printStackTrace();
           } finally {
               session.close();
           }
           return list;
       }
       
	   
	
	

	

}
