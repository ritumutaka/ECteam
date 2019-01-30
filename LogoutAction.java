package com.internousdev.anemone.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.anemone.dao.MCategoryDAO;
import com.internousdev.anemone.dao.UserInfoDAO;
import com.internousdev.anemone.dto.MCategoryDTO;
import com.opensymphony.xwork2.ActionSupport;;

public class LogoutAction extends ActionSupport implements SessionAware{

	private Map<String, Object> session;


	public String execute() {
		if(!session.containsKey("mCategoryList")) {
			return "sessionError";
		}

		List<MCategoryDTO> mCategoryDtoList = new ArrayList<MCategoryDTO>();
		UserInfoDAO userInfoDao = new UserInfoDAO();
		String loginId = (String)session.get("loginId");
		boolean savedLoginId = (boolean)session.get("savedLoginId");
		MCategoryDAO MCategoryDAO  = new MCategoryDAO();

		//ログアウトに成功したら、1.sessionをクリア 2.カテゴリーリストを取得 3.カテゴリーリストをsessionにput
		if(userInfoDao.logout(loginId) > 0) {
			session.clear();
			mCategoryDtoList = MCategoryDAO.getMCategoryList();
			session.put("mCategoryList", mCategoryDtoList);
			//ID保存チェックされてたら、(ログインＩＤをkeepIdにsession.put、 ID保存チェックをsessionにput)
			if(savedLoginId) {
				session.put("keepId", loginId);
				session.put("savedLoginId", savedLoginId);
			}
		}

		return SUCCESS;
	}


	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public Map<String, Object> getSession() {
		return session;
	}
}
