package cn.nnnight.entity.blog;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.GenericGenerator;

/**
 * 留言
 * 
 * @author FengBin
 *
 */
@Entity
@Table(name = "nn_blog_leave_word")
public class BlogLeaveWord {

	private String leaveId;// 留言id
	private String word;// 留言内容
	private int userId;// 用户id
	private int leaveUserId;// 留言用户id
	private Date createTime;// 创建时间
	private int deleteFlag;// 是否删除（管理员操作）

	@Id
	@GeneratedValue(generator = "uuid")
	@GenericGenerator(name = "uuid", strategy = "uuid")
	public String getLeaveId() {
		return leaveId;
	}

	public void setLeaveId(String leaveId) {
		this.leaveId = leaveId;
	}

	public String getWord() {
		return word;
	}

	public void setWord(String word) {
		this.word = word;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getLeaveUserId() {
		return leaveUserId;
	}

	public void setLeaveUserId(int leaveUserId) {
		this.leaveUserId = leaveUserId;
	}

	@Temporal(TemporalType.TIMESTAMP)
	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public int getDeleteFlag() {
		return deleteFlag;
	}

	public void setDeleteFlag(int deleteFlag) {
		this.deleteFlag = deleteFlag;
	}

}
