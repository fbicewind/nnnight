package cn.nnnight.vo;

import java.util.Date;

public class BlogVo {

	private int blogId;// 博客id
	private String title;// 标题
	private String content;// 内容
	private int userId;// 作者id
	private int typeId;// 文章类型id
	private String typeName;// 文章类型id
	private int publicFlag;// 是否所有人可见
	private Date createTime;// 创建时间
	private Date updateTime;// 更新时间
	private String thumb;// 文章内图片缩略保存，以逗号隔开
	private String thumbContent;// 文章内图片缩略保存，以逗号隔开
	private int topFlag;// 是否置顶
	private int recommendFlag;// 是否置顶
	private String keyword;// 关键词
	private int readCount;// 浏览量
	private int praiseCount;// 赞数
	private int favoriteCount;// 收藏数
	private int commentCount;// 评论数
	private int favoriteFlag;// 是否已收藏
	private int praiseFlag;// 是否以点赞

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

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public int getPublicFlag() {
		return publicFlag;
	}

	public void setPublicFlag(int publicFlag) {
		this.publicFlag = publicFlag;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

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

	public String getThumbContent() {
		return thumbContent;
	}

	public void setThumbContent(String thumbContent) {
		this.thumbContent = thumbContent;
	}

	public int getTopFlag() {
		return topFlag;
	}

	public void setTopFlag(int topFlag) {
		this.topFlag = topFlag;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public int getReadCount() {
		return readCount;
	}

	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}

	public int getPraiseCount() {
		return praiseCount;
	}

	public void setPraiseCount(int praiseCount) {
		this.praiseCount = praiseCount;
	}

	public int getFavoriteCount() {
		return favoriteCount;
	}

	public void setFavoriteCount(int favoriteCount) {
		this.favoriteCount = favoriteCount;
	}

	public int getCommentCount() {
		return commentCount;
	}

	public void setCommentCount(int commentCount) {
		this.commentCount = commentCount;
	}

	public int getRecommendFlag() {
		return recommendFlag;
	}

	public void setRecommendFlag(int recommendFlag) {
		this.recommendFlag = recommendFlag;
	}

	public int getFavoriteFlag() {
		return favoriteFlag;
	}

	public void setFavoriteFlag(int favoriteFlag) {
		this.favoriteFlag = favoriteFlag;
	}

	public int getPraiseFlag() {
		return praiseFlag;
	}

	public void setPraiseFlag(int praiseFlag) {
		this.praiseFlag = praiseFlag;
	}

}
