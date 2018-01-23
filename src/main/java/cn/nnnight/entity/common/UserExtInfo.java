package cn.nnnight.entity.common;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * 用户额外信息
 * 
 * @author FengBin
 *
 */
@Entity
@Table(name = "nn_user_ext_info")
public class UserExtInfo {

	private int userId;
	private String profession;// 职业
	private Date birthday;// 生日
	private String email;// 邮箱
	private String mobile;// 手机
	private int gender;// 性别：0--女，1--男，2--保密
	private int blogCount;// 文章数
	private int photoCount;// 照片数
	private int musicCount;// 音乐数

	@Id
	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getProfession() {
		return profession;
	}

	public void setProfession(String profession) {
		this.profession = profession;
	}

	@Temporal(TemporalType.TIMESTAMP)
	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	@Column(name="gender" ,nullable=false,columnDefinition="INT default 2")
	public int getGender() {
		return gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}

	@Column(name="blogCount" ,nullable=false,columnDefinition="INT default 0")
	public int getBlogCount() {
		return blogCount;
	}

	public void setBlogCount(int blogCount) {
		this.blogCount = blogCount;
	}

	@Column(name="photoCount" ,nullable=false,columnDefinition="INT default 0")
	public int getPhotoCount() {
		return photoCount;
	}

	public void setPhotoCount(int photoCount) {
		this.photoCount = photoCount;
	}

	@Column(name="musicCount" ,nullable=false,columnDefinition="INT default 0")
	public int getMusicCount() {
		return musicCount;
	}

	public void setMusicCount(int musicCount) {
		this.musicCount = musicCount;
	}

}
