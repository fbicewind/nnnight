package cn.nnnight.entity.blog;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 博客主题样式
 * 
 * @author FengBin
 *
 */
@Entity
@Table(name = "nn_blog_style")
public class BlogStyle {

	private int userId;// 用户id
	private String banner;// banner图片
	private String style;// css样式

	@Id
	@GeneratedValue
	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getBanner() {
		return banner;
	}

	public void setBanner(String banner) {
		this.banner = banner;
	}

	public String getStyle() {
		return style;
	}

	public void setStyle(String style) {
		this.style = style;
	}

}
