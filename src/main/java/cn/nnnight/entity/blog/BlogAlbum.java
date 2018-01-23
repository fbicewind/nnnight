package cn.nnnight.entity.blog;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * 相册
 * 
 * @author FengBin
 *
 */
@Entity
@Table(name = "nn_blog_album")
public class BlogAlbum {

	private int albumId;// 相册id
	private int userId;// 用户id
	private int photoCount;// 照片数
	private Date createTime;// 创建时间
	private int publicFlag;// 是否公开
	private String albumName;// 相册名称
	private String coverImg;// 相册封面
	private String albumDesc;// 相册描述

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public int getAlbumId() {
		return albumId;
	}

	public void setAlbumId(int albumId) {
		this.albumId = albumId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	@Column(name = "photoCount", nullable = false, columnDefinition = "INT default 0")
	public int getPhotoCount() {
		return photoCount;
	}

	public void setPhotoCount(int photoCount) {
		this.photoCount = photoCount;
	}

	@Temporal(TemporalType.TIMESTAMP)
	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public int getPublicFlag() {
		return publicFlag;
	}

	public void setPublicFlag(int publicFlag) {
		this.publicFlag = publicFlag;
	}

	public String getAlbumName() {
		return albumName;
	}

	public void setAlbumName(String albumName) {
		this.albumName = albumName;
	}

	public String getCoverImg() {
		return coverImg;
	}

	public void setCoverImg(String coverImg) {
		this.coverImg = coverImg;
	}

	public String getAlbumDesc() {
		return albumDesc;
	}

	public void setAlbumDesc(String albumDesc) {
		this.albumDesc = albumDesc;
	}

}
