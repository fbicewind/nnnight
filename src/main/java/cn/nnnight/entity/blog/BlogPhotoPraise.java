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
 * 照片点赞关联
 * 
 * @author FengBin
 *
 */
@Entity
@Table(name = "nn_photo_praise")
public class BlogPhotoPraise {

	private String photoPraiseId;// 主键id
	private String photoId;// 照片id
	private int userId;// 用户id
	private Date createTime;// 点赞时间

	@Id
	@GeneratedValue(generator = "uuid")
	@GenericGenerator(name = "uuid", strategy = "uuid")
	public String getPhotoPraiseId() {
		return photoPraiseId;
	}

	public void setPhotoPraiseId(String photoPraiseId) {
		this.photoPraiseId = photoPraiseId;
	}

	public String getPhotoId() {
		return photoId;
	}

	public void setPhotoId(String photoId) {
		this.photoId = photoId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	@Temporal(TemporalType.TIMESTAMP)
	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

}
