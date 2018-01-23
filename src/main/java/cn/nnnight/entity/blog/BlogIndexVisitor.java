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
 * 博客首页访问用户
 * 
 * @author FengBin
 *
 */
@Entity
@Table(name = "nn_blog_index_visitor")
public class BlogIndexVisitor {

	private String indexVisitorId;// 主键id
	private int indexId;// 博客用户id
	private int userId;// 用户id
	private int clearFlag;// 是否清除
	private Date createTime;// 访问时间

	@Id
	@GeneratedValue(generator = "uuid")
	@GenericGenerator(name = "uuid", strategy = "uuid")
	public String getIndexVisitorId() {
		return indexVisitorId;
	}

	public void setIndexVisitorId(String indexVisitorId) {
		this.indexVisitorId = indexVisitorId;
	}

	public int getIndexId() {
		return indexId;
	}

	public void setIndexId(int indexId) {
		this.indexId = indexId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getClearFlag() {
		return clearFlag;
	}

	public void setClearFlag(int clearFlag) {
		this.clearFlag = clearFlag;
	}

	@Temporal(TemporalType.TIMESTAMP)
	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

}
