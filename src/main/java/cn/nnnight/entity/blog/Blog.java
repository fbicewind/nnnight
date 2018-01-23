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
 * 博客/文章
 * 
 * @author FengBin
 *
 */
@Entity
@Table(name = "nn_blog")
public class Blog {

	private int blogId;// 博客id
	private String title;// 标题
	private String content;// 内容
	private int userId;// 作者id
	private int typeId;// 文章类型id
	private int publicFlag;// 是否所有人可见
	private Date createTime;// 创建时间
	private Date updateTime;// 更新时间
	private int draftFlag;// 是否草稿
	private String thumb;// 文章内图片缩略保存，以逗号隔开
	private String thumbContent;// 文章内图片缩略保存，以逗号隔开
	private int topFlag;// 是否置顶
	private int recommendFlag;// 是否首页显示
	private String keyword;// 关键词
	private int readCount;// 浏览量
	private int praiseCount;// 赞数
	private int favoriteCount;// 收藏数
	private int commentCount;// 评论数
	private int deleteFlag;// 是否删除（管理员操作）
	private Date deleteTime;// 删除时间（管理员操作）

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public int getBlogId() {
		return blogId;
	}

	public void setBlogId(int blogId) {
		this.blogId = blogId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getTypeId() {
		return typeId;
	}

	public void setTypeId(int typeId) {
		this.typeId = typeId;
	}

	@Temporal(TemporalType.TIMESTAMP)
	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	@Temporal(TemporalType.TIMESTAMP)
	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public String getThumb() {
		return thumb;
	}

	public void setThumb(String thumb) {
		this.thumb = thumb;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	@Column(name = "readCount", nullable = false, columnDefinition = "INT default 0")
	public int getReadCount() {
		return readCount;
	}

	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}

	@Column(name = "praiseCount", nullable = false, columnDefinition = "INT default 0")
	public int getPraiseCount() {
		return praiseCount;
	}

	public void setPraiseCount(int praiseCount) {
		this.praiseCount = praiseCount;
	}

	@Column(name = "favoriteCount", nullable = false, columnDefinition = "INT default 0")
	public int getFavoriteCount() {
		return favoriteCount;
	}

	public void setFavoriteCount(int favoriteCount) {
		this.favoriteCount = favoriteCount;
	}

	@Column(name = "commentCount", nullable = false, columnDefinition = "INT default 0")
	public int getCommentCount() {
		return commentCount;
	}

	public void setCommentCount(int commentCount) {
		this.commentCount = commentCount;
	}

	@Temporal(TemporalType.TIMESTAMP)
	public Date getDeleteTime() {
		return deleteTime;
	}

	public void setDeleteTime(Date deleteTime) {
		this.deleteTime = deleteTime;
	}

	public String getThumbContent() {
		return thumbContent;
	}

	public void setThumbContent(String thumbContent) {
		this.thumbContent = thumbContent;
	}

	public int getPublicFlag() {
		return publicFlag;
	}

	public void setPublicFlag(int publicFlag) {
		this.publicFlag = publicFlag;
	}

	public int getDraftFlag() {
		return draftFlag;
	}

	public void setDraftFlag(int draftFlag) {
		this.draftFlag = draftFlag;
	}

	public int getTopFlag() {
		return topFlag;
	}

	public void setTopFlag(int topFlag) {
		this.topFlag = topFlag;
	}

	public int getRecommendFlag() {
		return recommendFlag;
	}

	public void setRecommendFlag(int recommendFlag) {
		this.recommendFlag = recommendFlag;
	}

	public int getDeleteFlag() {
		return deleteFlag;
	}

	public void setDeleteFlag(int deleteFlag) {
		this.deleteFlag = deleteFlag;
	}

}
