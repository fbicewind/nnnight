package cn.nnnight.entity.blog;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

/**
 * 博客音乐
 * 
 * @author FengBin
 *
 */
@Entity
@Table(name = "nn_blog_music")
public class BlogMusic {

	private String musicId;// 音乐id
	private String url;// 音乐路径
	private String title;// 音乐名
	private String lrcurl;// 歌词路径
	private String singer;// 歌手
	private String cover;// 封面路径
	private Date createTime;// 添加时间
	private int userId;// 用户id
	private int sortNo;// 排序
	private String type;// 音乐类型, 0:自己上传, 1:网络音乐

	@Id
	@GeneratedValue(generator = "uuid")
	@GenericGenerator(name = "uuid", strategy = "uuid")
	public String getMusicId() {
		return musicId;
	}

	public void setMusicId(String musicId) {
		this.musicId = musicId;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getLrcurl() {
		return lrcurl;
	}

	public void setLrcurl(String lrcurl) {
		this.lrcurl = lrcurl;
	}

	public String getSinger() {
		return singer;
	}

	public void setSinger(String singer) {
		this.singer = singer;
	}

	public String getCover() {
		return cover;
	}

	public void setCover(String cover) {
		this.cover = cover;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getSortNo() {
		return sortNo;
	}

	public void setSortNo(int sortNo) {
		this.sortNo = sortNo;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

}
