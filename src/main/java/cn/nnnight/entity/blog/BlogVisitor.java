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
 * 博客访问记录
 * 
 * @author FengBin
 *
 */
@Entity
@Table(name = "nn_blog_vistor")
public class BlogVisitor {

	private String vistorId;// 主键id
	private int blogId;// 博客id
	private int userId;// 用户id
	private int clearFlag;// 是否清除（用户自己操作）
	private Date createTime;// 访问时间
	private String ipAddress;

	@Id
	@GeneratedValue(generator = "uuid")
	@GenericGenerator(name = "uuid", strategy = "uuid")
	public String getVistorId() {
		return vistorId;
	}

	public void setVistorId(String vistorId) {
		this.vistorId = vistorId;
	}

	public int getBlogId() {
		return blogId;
	}

	public void setBlogId(int blogId) {
		this.blogId = blogId;
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

	public String getIpAddress() {
		return ipAddress;
	}

	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
	}

}
