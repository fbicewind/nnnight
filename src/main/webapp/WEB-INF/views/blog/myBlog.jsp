<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/tag.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<%@ include file="../common/head.jsp"%>
</head>
<body>
	<%@ include file="../common/top.jsp"%>
	<div class="container" style="min-height: 200px;">
		<div class="full-width overflow-block" style="padding: 40px 30px;">
			<img src="/static/upload/img/l/${userInfo.avatar }" class="top-info-img">
			<div class="top-info-div">
				<h2>${userInfo.nickname }</h2>
				<p>${userInfo.remark }</p>
			</div>
		</div>
	</div>

	<div class="container" style="min-height: 400px;; margin-bottom: 40px;">
		<div class="col-sm-8 col-xs-12">
			<div class="full-width overflow-block">
				<ul id="myTab" class="nav nav-tabs">
					<li class="blog-mydiary">
						<a href="${path }/blog/${userId }" class="diary-types">我的博客</a>
					</li>
					<li class="blog-private">
						<a href="${path }/blog/${userId }?t=p" class="diary-types">私密博客</a>
					</li>
					<li class="blog-draft">
						<a href="${path }/blog/${userId }?t=d" class="diary-types">草稿箱</a>
					</li>
					<li class="blog-favorite">
						<a href="${path }/blog/${userId }?t=f" class="diary-types">我的收藏</a>
					</li>
					<li style="float: right;">
						<a href="${path }/blog/mark" class="diary-types">
						<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
						<span class="hidden-xs"> 写博客</a>
					</li>
				</ul>
			</div>
			<div class="full-width overflow-block">
				<div id="myTabContent" class="tab-content">
					<div class="tab-pane active" id="myDiary">
						<ul>
							<c:if test="${blogs.totalSize == 0 }">
								<li class="article-li">
									暂无日志...
								</li>
							</c:if>
							<c:choose>
								<c:when test="${type == 'd' }">
									<c:forEach var="blog" items="${blogs.datalist }">
										<li class="article-li">
											<div>
												<h4>
													<a href="${path}/blog/mark?blogId=${blog.blogId }">${blog.title }</a>
												</h4>
											</div>
											<div>
												<span>
													<i class="fa fa-clock-o" aria-hidden="true"></i>
													<fmt:formatDate value="${blog.createTime }" pattern="yyyy-MM-dd HH:mm:ss" />
												</span>
											</div>
										</li>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<c:forEach var="blog" items="${blogs.datalist }">
										<li class="article-li">
											<div>
												<h4>
													<a href="${path }/blog/detail/${blog.blogId}?i=${ti}&t=${type}">${blog.title }</a>
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
												<a href="${path }/blog/detail/${blog.blogId}?i=${ti}&t=${type}">
													<p>${blog.thumbContent }</p>
												</a>
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
								</c:otherwise>
							</c:choose>
						</ul>
					</div>

				</div>
				<div style="text-align: center;">
					<c:choose>
						<c:when test="${blogs.totalNo == 1 }">
							<ul class="pagination" style="text-align: center;">
								<li class="disabled"><a href="#">&lt;</a></li>
								<li class="active disabled"><a href="#">1</a></li>
								<li class="disabled"><a href="#">&gt;</a></li>
							</ul>
						</c:when>
						<c:when test="${blogs.totalNo == 2 }">
							<ul class="pagination" style="text-align: center;">
								<c:choose>
									<c:when test="${blogs.pageNo == 1 }">
										<li class="disabled"><a href="#">&lt;</a></li>
										<li class="active disabled"><a href="#">1</a></li>
										<li><a href="${path }/blog/${userId}?n=2&t=${type}&i=${ti}">2</a></li>
										<li><a href="${path }/blog/${userId}?n=2&t=${type}&i=${ti}">&gt;</a></li>
									</c:when>
									<c:otherwise>
										<li><a href="${path }/blog/${userId}?n=1&t=${type}&i=${ti}">&lt;</a></li>
										<li><a href="${path }/blog/${userId}?n=1&t=${type}&i=${ti}">1</a></li>
										<li class="disabled"><a href="#">2</a></li>
										<li class="disabled"><a href="#">&gt;</a></li>
									</c:otherwise>
								</c:choose>
							</ul>
						</c:when>
						<c:when test="${blogs.totalNo == 3 }">
							<ul class="pagination" style="text-align: center;">
								<c:choose>
									<c:when test="${blogs.pageNo == 1 }">
										<li class="disabled"><a href="#">&lt;</a></li>
										<li class="active disabled"><a href="#">1</a></li>
										<li><a href="${path }/blog/${userId}?n=2&t=${type}&i=${ti}">2</a></li>
										<li><a href="${path }/blog/${userId}?n=3&t=${type}&i=${ti}">3</a></li>
										<li><a href="${path }/blog/${userId}?n=2&t=${type}&i=${ti}">&gt;</a></li>
									</c:when>
									<c:when test="${blogs.pageNo == 3 }">
										<li><a href="#">&lt;</a></li>
										<li><a href="${path }/blog/${userId}?n=1&t=${type}&i=${ti}">1</a></li>
										<li><a href="${path }/blog/${userId}?n=2&t=${type}&i=${ti}">2</a></li>
										<li class="disabled"><a href="#">3</a></li>
										<li class="disabled"><a href="#">&gt;</a></li>
									</c:when>
									<c:otherwise>
										<li><a href="${path }/blog/${userId}?n=1&t=${type}&i=${ti}">&lt;</a></li>
										<li><a href="${path }/blog/${userId}?n=1&t=${type}&i=${ti}">1</a></li>
										<li class="active disabled"><a href="#">2</a></li>
										<li><a href="${path }/blog/${userId}?n=3&t=${type}&i=${ti}">3</a></li>
										<li><a href="#">&gt;</a></li>
									</c:otherwise>
								</c:choose>
							</ul>
						</c:when>
						<c:otherwise>
							<ul class="pagination" style="text-align: center;">
								<c:choose>
									<c:when test="${blogs.pageNo == 1 }">
										<li class="disabled"><a href="#">&lt;</a></li>
										<li class="active disabled"><a href="#">1</a></li>
										<li><a href="${path }/blog/${userId}?n=2&t=${type}&i=${ti}">2</a></li>
										<li class="disabled"><a href="#">...</a></li>
										<li><a href="${path }/blog/${userId}?n=${blogs.totalNo}&t=${type}&i=${ti}">${blogs.totalNo}</a></li>
										<li><a href="${path }/blog/${userId}?n=2&t=${type}&i=${ti}">&gt;</a></li>
									</c:when>
									<c:when test="${blogs.pageNo == blogs.totalNo }">
										<li><a href="${path }/blog/${userId}?n=${blogs.pageNo-1}&t=${type}&i=${ti}">&lt;</a></li>
										<li><a href="${path }/blog/${userId}?n=1&t=${type}&i=${ti}">1</a></li>
										<li class="disabled"><a href="#">...</a></li>
										<li><a href="${path }/blog/${userId}?n=${blogs.pageNo-1}&t=${type}&i=${ti}">${blogs.pageNo-1}</a></li>
										<li class="active disabled"><a href="#">${blogs.pageNo}</a></li>
										<li class="disabled"><a href="#">&gt;</a></li>
									</c:when>
									<c:otherwise>
										<li><a href="${path }/blog/${userId}?n=${blogs.pageNo-1}&t=${type}&i=${ti}">&lt;</a></li>
										<li><a href="${path }/blog/${userId}?n=1&t=${type}&i=${ti}">1</a></li>
										<c:if test="${blogs.pageNo != 2 && blogs.pageNo != 3 }">
											<li class="disabled"><a href="#">...</a></li>
										</c:if>
										<c:if test="${blogs.pageNo != 2 }">
											<li><a href="${path }/blog/${userId}?n=${blogs.pageNo-1}&t=${type}&i=${ti}">${blogs.pageNo-1}</a></li>
										</c:if>
										<li class="active disabled"><a href="#">${blogs.pageNo}</a></li>
										<c:if test="${blogs.pageNo != (blogs.totalNo - 1) }">
											<li><a href="${path }/blog/${userId}?n=${blogs.pageNo+1}&t=${type}&i=${ti}">${blogs.pageNo+1}</a></li>
										</c:if>
										<c:if test="${blogs.pageNo != (blogs.totalNo - 1) && blogs.pageNo != (blogs.totalNo - 2) }">
											<li class="disabled"><a href="#">...</a></li>
										</c:if>
										<li><a href="${path }/blog/${userId}?n=${blogs.totalNo}&t=${type}&i=${ti}">${blogs.totalNo}</a></li>
										<li><a href="${blogs.pageNo+1}&t=${type}">&gt;</a></li>
									</c:otherwise>
								</c:choose>
							</ul>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
		<div class="col-sm-4 col-xs-12">
			<div class="index-right-block" style="margin-top: 35px;">
				<span>日志分类</span>
				<ul class="last-blog">
					<c:choose>
						<c:when test="${1 == ti }">
							<li class="active"><a href="${path }/blog/${userId}?i=1">我的博客</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="${path }/blog/${userId}?i=1">我的博客</a></li>
						</c:otherwise>
					</c:choose>
					<c:forEach var="type" items="${types }">
						<c:choose>
							<c:when test="${type.typeId == ti }">
								<li class="active"><a href="${path }/blog/${userId}?i=${type.typeId}">${type.typeName }</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="${path }/blog/${userId}?i=${type.typeId}">${type.typeName }</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</ul>
			</div>
			<div class="index-right-block" style="margin-top: 35px;">
				<span>最近日志</span>
				<ul class="last-blog">
					<c:if test="${newBlogs.datalist == null }">
						<li>暂无日志..</li>
					</c:if>
					<c:forEach var="blog" items="${newBlogs.datalist }">
						<li><a href="${path }/blog/detail/${blog.blogId }">${blog.title }</a></li>
					</c:forEach>
				</ul>
			</div>
			<div class="index-right-block" style="margin-top: 35px;">
				<span>大家在看</span>
				<ul class="last-blog">
					<c:if test="${viewBlogs.datalist == null }">
						<li>暂无日志..</li>
					</c:if>
					<c:forEach var="blog" items="${viewBlogs.datalist }">
						<li><a href="${path }/blog/detail/${blog.blogId }">${blog.title }</a></li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>

	<%@ include file="../common/footer.jsp"%>
	<%@ include file="../common/login.jsp"%>
	<script src="${path }/static/js/myblog.js"></script>
	<script type="text/javascript">
		var _path = '${path}';
		$(function(){
			$('.nav-blog').addClass('active');
			switch('${type}'){
				case 'a':
					$('.blog-mydiary').addClass('active');
					break;
				case 'p':
					$('.blog-private').addClass('active');
					break;
				case 'd':
					$('.blog-draft').addClass('active');
					break;
				case 'f':
					$('.blog-favorite').addClass('active');
					break;
				default:
					break;
			}
			myblog.init();
		});
		myblog.changeImgSize();
	</script>
</body>
</html>