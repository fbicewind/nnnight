<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/tag.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<%@ include file="../common/head.jsp"%>
</head>
<body>
	<%@ include file="../common/top.jsp"%>
	<div class="banner" style="margin-bottom: 40px;"></div>
	<div class="container" style="min-height: 400px; margin-bottom: 40px;">
		<div class="col-sm-8 col-xs-12" style="margin-bottom: 20px;">
			<div class="full-width overflow-block">
				<ul>
					<c:if test="${blogs.size() == 0 }">
						<li class="article-li">
							暂无日志...
						</li>
					</c:if>
					<c:forEach var="blog" items="${blogs }">
						<li class="article-li">
							<div>
								<h4>
									<a href="${path }/blog/detail/${blog.blogId }">${blog.title }</a>
								</h4>
								<c:if test="${blog.thumb != '' && blog.thumb != null }">
									<div class="overflow-block">
										<c:forEach var="image" items="${fn:split(blog.thumb, '|||')}">
											<div class="col-sm-4 hidden-xs padding-left-0">
												<div class="index-image-outer" style="border:2px solid #eee;text-align: center;">
													<img src="${image }">
												</div>
											</div>
										</c:forEach>
									</div>
								</c:if>
								<p>${blog.thumbContent }</p>
							</div>
							<div>
								<span>
									<i class="fa fa-clock-o" aria-hidden="true"></i>
									<fmt:formatDate value="${blog.createTime }" pattern="yyyy-MM-dd HH:mm:ss" />
								</span>&nbsp;&nbsp;&nbsp;&nbsp; <span>分类：<a href="#">${blog.typeName }</a></span>&nbsp;&nbsp;&nbsp;&nbsp;
								<span>浏览量：${blog.readCount }</span>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<div class="col-sm-4 col-xs-12">
			<div class="personal-info-top">
				<div class="col-md-4 col-sm-12">
					<img src="/static/upload/img/m/${userInfo.avatar }" class="full-width">
				</div>
				<div class="col-md-8 col-sm-12">
					<ul>
						<li>昵称：${userInfo.nickname }</li>
						<li>职业：${userInfo.profession }</li>
						<li>个签：${userInfo.remark }</li>
					</ul>
				</div>
			</div>
			<div class="personal-info-bottom">
				<div class="col-xs-4 text-center">
					<a href="${path }/blog/${userInfo.userId }"><span>文章<br>${userInfo.blogCount }
					</span></a>
				</div>
				<div class="col-xs-4 text-center">
					<a href="#"><span>照片<br>${userInfo.photoCount }
					</span></a>
				</div>
				<div class="col-xs-4 text-center">
					<a href="#"><span>音乐<br>${userInfo.musicCount }
					</span></a>
				</div>
			</div>
			<div class="index-right-block">
				<span>音乐盒</span>
				<div class="index-music-box">
					<div class="index-music-cover" id="ntMusicCover">
						<i class="fa fa-play-circle-o fa-2x music-play" aria-hidden="true" id="ntMusicPlay"></i>
						<i class="fa fa-pause-circle-o fa-lg music-pause" aria-hidden="true" id="ntMusicPause"></i>
					</div>
					<div id="ntMusicRight">
						<div class="index-music-title" id="ntMusicTitle">
							<h5>我是真的爱上你 - 曲肖冰</h5>
						</div>
						<div class="index-music-operation" id="ntMusicOper">
							<i class="fa fa-step-forward fa-2x" aria-hidden="true" style="margin-right:15px;" id="ntMusicNext"></i>
							<i class="fa fa-volume-up fa-2x" aria-hidden="true" style="margin-left: 15px;" id="ntMusicMute"></i>
						</div>
					</div>
				</div>
				<audio id="ntAudio"></audio>
			</div>
			<div class="index-right-block">
				<span>最近日志</span>
				<ul class="last-blog">
					<c:if test="${newBlogs.datalist == null }">
						<li>&nbsp;&nbsp;&nbsp;&nbsp;暂无日志..</li>
					</c:if>
					<c:forEach var="blog" items="${newBlogs.datalist }">
						<li><a href="${path }/blog/detail/${blog.blogId }">${blog.title }</a></li>
					</c:forEach>
				</ul>
			</div>
			<div class="index-right-block">
				<span>最近访客</span>
				<div class="overflow-block">
					<c:if test="${visitors.datalist == null }">
						<div>&nbsp;&nbsp;&nbsp;&nbsp;暂无访客..</div>
					</c:if>
					<c:choose>
						<c:when test="${self }">
							<c:forEach var="visitor" items="${visitors.datalist }">
								<div class="index-visitor">
									<a href="#"> <i class="fa fa-remove visitor-remove"
										aria-hidden="true"></i> <img src="${path }/static/image/photos2.jpg">
										<div class="visitor-name">小马哥</div>
									</a>
								</div>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<c:forEach var="visitor" items="${visitors.datalist }">
								<div class="index-visitor">
									<a href="#"> <img src="${path }/static/image/photos2.jpg">
										<div class="visitor-name">小马哥</div>
									</a>
								</div>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>
	
	<%@ include file="../common/footer.jsp"%>
	<%@ include file="../common/login.jsp"%>
	<script src="${path }/static/js/index.js"></script>
	<script type="text/javascript">
		var _path = '${path}';
		var _userId = '${wholeId}';
		$(function(){
			$('.nav-index').addClass('active');
			var ntAudio = $('#ntAudio')[0];
			index.init();
		});
		index.detail.dot();
		index.changeImgSize();
	</script>
</body>
</html>