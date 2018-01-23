package cn.nnnight.entity.common;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.GenericGenerator;

/**
 * 登录历史
 * 
 * @author FengBin
 *
 */
@Entity
@Table(name = "nn_login_history")
public class LoginHistory {

	private String loginHistoryId;// 登录历史id
	private int userId;// 用户id
	private String loginIp;// 登录ip
	private Date loginTime;// 登录时间
	private int successFlag;// 登录成功标志

	@Id
	@GeneratedValue(generator = "uuid")
	@GenericGenerator(name = "uuid", strategy = "uuid")
	public String getLoginHistoryId() {
		return loginHistoryId;
	}

	public void setLoginHistoryId(String loginHistoryId) {
		this.loginHistoryId = loginHistoryId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getLoginIp() {
		return loginIp;
	}

	public void setLoginIp(String loginIp) {
		this.loginIp = loginIp;
	}

	@Temporal(TemporalType.TIMESTAMP)
	public Date getLoginTime() {
		return loginTime;
	}

	public void setLoginTime(Date loginTime) {
		this.loginTime = loginTime;
	}

	public int getSuccessFlag() {
		return successFlag;
	}

	public void setSuccessFlag(int successFlag) {
		this.successFlag = successFlag;
	}

}
