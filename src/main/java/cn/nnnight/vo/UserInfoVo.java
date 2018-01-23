package cn.nnnight.vo;

import java.util.Date;

public class UserInfoVo {

	private int userId; // 用户id
	private String nickname;//
	private String remark;// 备注
	private String avatar;// 形象
	private String profession;// 职业
	private Date birthday;// 生日
	private String email;// 邮箱
	private String mobile;// 手机
	private int gender;// 性别：0--女，1--男，2--保密
	private int blogCount;// 文章数
	private int photoCount;// 照片数
	private int musicCount;// 音乐数

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public String getProfession() {
		return profession;
	}

	public void setProfession(String profession) {
		this.profession = profession;
	}

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

	public int getGender() {
		return gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}

	public int getBlogCount() {
		return blogCount;
	}

	public void setBlogCount(int blogCount) {
		this.blogCount = blogCount;
	}

	public int getPhotoCount() {
		return photoCount;
	}

	public void setPhotoCount(int photoCount) {
		this.photoCount = photoCount;
	}

	public int getMusicCount() {
		return musicCount;
	}

	public void setMusicCount(int musicCount) {
		this.musicCount = musicCount;
	}

}
