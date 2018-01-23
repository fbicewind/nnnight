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
			<div class="full-width overflow-block article-detail">
				<div class="article-detail-top">
					<span class="article-type">${blog.typeName }</span>
					<a class="article-return" href="${path }/blog/${blog.userId}?t=${diaryType }&i=${isType}"><i class="fa fa-reply" aria-hidden="true"></i>&nbsp;返回日志列表</a>
				</div>
				<h3 class="article-title">${blog.title }</h3>
				<div class="last-edit-time">
					编辑于&nbsp;&nbsp;<span>
						<c:choose>
							<c:when test="${blog.updateTime == null || blog.updateTime == '' }">
								<fmt:formatDate value="${blog.createTime }" pattern="yyyy-MM-dd HH:mm:ss" />
							</c:when>
							<c:otherwise>
								<fmt:formatDate value="${blog.updateTime }" pattern="yyyy-MM-dd HH:mm:ss" />
							</c:otherwise>
						</c:choose>
					</span>
				</div>
				<div class="article-detail-content">
					<c:out value="${blog.content }" escapeXml="false"></c:out>
				</div>
				<div class="article-opercate">
					<c:choose>
						<c:when test="${self }">
							<span class="ireport hover-pointer" onclick="blogDetail.detail.delBlog()">删除</span>&nbsp;&nbsp; 
							<span class="ireport hover-pointer" onclick="window.location.href='${path}/blog/mark?blogId=${blog.blogId }'">编辑</span>&nbsp;&nbsp; 
						</c:when>
						<c:otherwise>
							<span class="ireport hover-pointer" title="暂时无法使用">举报</span>&nbsp;&nbsp; 
						</c:otherwise>
					</c:choose>
					
					<span class="hover-pointer" onclick="blogDetail.detail.reply()">评论</span>&nbsp;&nbsp; 
					<c:choose>
						<c:when test="${blog.favoriteFlag == 0 }">
							<span class="hover-pointer" onclick="blogDetail.detail.favorite(1)">
								<i class="fa fa-heart-o" aria-hidden="true" title="收藏"></i>(${blog.favoriteCount })
							</span>&nbsp;&nbsp;
						</c:when>
						<c:otherwise>
							<span class="hover-pointer" onclick="blogDetail.detail.favorite(0)">
								<i class="fa fa-heart-o red" aria-hidden="true" title="取消收藏"></i>(${blog.favoriteCount })
							</span>&nbsp;&nbsp;
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${blog.praiseFlag == 0 }">
							<span class="hover-pointer" onclick="blogDetail.detail.praise(1)">
								<i class="fa fa-thumbs-o-up" aria-hidden="true" title="点赞"></i>(${blog.praiseCount })
							</span>&nbsp;&nbsp; 
						</c:when>
						<c:otherwise>
							<span class="hover-pointer" onclick="blogDetail.detail.praise(0)">
								<i class="fa fa-thumbs-up" aria-hidden="true" title="取消点赞"></i>(${blog.praiseCount })
							</span>&nbsp;&nbsp; 
						</c:otherwise>
					</c:choose>
					<span>浏览(${blog.readCount })</span>
				</div>
				<div class="full-width overflow-block">
					<div class="col-sm-6 col-xs-12">
						<c:choose>
							<c:when test="${prev == null }">
								上一篇：无
							</c:when>
							<c:otherwise>
								上一篇：<a href="${path }/blog/detail/${prev.blogId}?i=${isType}">${prev.title }</a>
							</c:otherwise>
						</c:choose>
					</div>
					<div class="col-sm-6 col-xs-12 next-title">
						<c:choose>
							<c:when test="${next == null }">
								下一篇：无
							</c:when>
							<c:otherwise>
								下一篇：<a href="${path }/blog/detail/${next.blogId}?i=${isType}">${next.title }</a>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<hr class="hidden-sm hidden-xs">
				<div class="article-visitor hidden-sm hidden-xs" style="overflow: hidden;">
					<h5>本文最近访客</h5>
					<c:if test="${visitors.datalist == null }">
						<div>暂无访客..</div>
					</c:if>
					<c:choose>
						<c:when test="${self }">
							<c:forEach var="visitor" items="${visitors.datalist }">
								<div class="col-sm-2 col-xs-4 relative-div ">
									<a href="${path }/aboutMe/${visitor.userId}"> 
										<i class="fa fa-remove visitor-remove" aria-hidden="true"></i> 
										<img src="/static/upload/img/m/${userInfo.avatar }" class="full-width">
										<div class="visitor-name">${visitor.nickname }</div>
									</a>
								</div>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<c:forEach var="visitor" items="${visitors.datalist }">
								<div class="col-sm-2 col-xs-4 relative-div ">
									<a href="${path }/aboutMe/${visitor.userId}"> 
										<img src="/static/upload/img/l/${userInfo.avatar }" class="full-width">
										<div class="visitor-name">${visitor.nickname }</div>
									</a>
								</div>
							</c:forEach>
						</c:otherwise>
					</c:choose>
					<!-- 
					<span class="hover-pointer show-more-visitor">
						<div>&nbsp;</div> 显示更多 <i class="fa fa-angle-double-down" aria-hidden="true"></i>
					</span>
					 -->
				</div>
				<hr>
				<div class="article-comment">
					<h5>评论(${comments.totalSize })</h5>
					<ul class="blog-comment-ul">
						<c:if test="${comments.totalSize == 0}">
							<li style="text-align:center;">暂无评论...</li>
						</c:if>
						<c:forEach var="comment" items="${comments.datalist}" varStatus="status">
							<li>
								<div class="media">
									<a class="pull-left text-center" href="#">
										<img class="media-object" src="/static/upload/img/m/${userInfo.avatar }">
										<span>${comment.nickname }</span>
									</a>
									<div class="media-body">
										<div>
											<span style="margin-right:30px;">${status.index + comments.pageNo*10 - 9 }楼</span>
											<span class="hidden-xs">
												<fmt:formatDate value="${comment.createTime }" pattern="yyyy-MM-dd HH:mm:ss" />
											</span>
											<a href="javascript:void(0);" style="float:right;" onclick="blogDetail.detail.reply('${status.index + comments.pageNo*10 - 9}','${comment.nickname }','${comment.commentId }')">回复</a>
											<span class="hover-pointer" style="float:right;margin-right:10px;">
												<i class="fa fa-thumbs-o-up" aria-hidden="true" title="赞"></i>(${comment.praiseCount })
											</span>
										</div>
										<c:out value="${comment.comment }" escapeXml="false"></c:out>
									</div>
								</div>
							</li>
						</c:forEach>
						<!-- 
						<li>
							<div class="media">
								<a class="pull-left" href="#">
									<img class="media-object" src="${path }/static/image/photos2.jpg" alt="媒体对象">
									<span>隔壁老王</span>
								</a>
								<div class="media-body">
									<div>
										<span style="margin-right:30px;">2楼</span>
										<span class="hidden-xs">2017-03-13 20:23</span>
										<a href="#reply" style="float:right;">回复</a>
										<span class="hover-pointer" style="float:right;margin-right:10px;">
											<i class="fa fa-thumbs-o-up" aria-hidden="true" title="赞"></i>(100)
										</span>
									</div>
									这是一些示例文本。这是一些示例文本。
									这是一些示例文本。这是一些示例文本。
									这是一些示例文本。这是一些示例文本。
									这是一些示例文本。这是一些示例文本。
									这是一些示例文本。这是一些示例文本。
								</div>
							</div>
						</li>
						 -->
					</ul>
					<div style="margin-bottom:15px;">
						<div id="replyTo">
						<!-- 
							<div class="alert alert-default" role="alert">
	    						<button class="close"  data-dismiss="alert" type="button" >&times;</button>
							    <p>回复 隔壁老王  #1 ：</p>
							</div>
							 -->
						</div>
						<textarea rows="5" style="width:100%;resize: none;" id="reply"></textarea>
						<button type="button" class="btn btn-primary btn-sm" onclick="blogDetail.detail.saveComment()">&nbsp;确&nbsp;&nbsp;定&nbsp;</button>
					</div>
				</div>
			</div>
		</div>

		<div class="col-sm-4 col-xs-12">
			<div class="index-right-block" style="margin-top: 0px;">
				<span>日志分类</span>
				<ul class="last-blog">
					<li><a href="${path }/blog/${blog.userId}?i=1">我的博客</a></li>
					<c:forEach var="type" items="${types }">
						<li><a href="${path }/blog/${blog.userId}?i=${type.typeId}">${type.typeName }</a></li>
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
	<%@ include file="../common/confirm.jsp"%>
	<%@ include file="../common/alert.jsp"%>
	<script src="${path }/static/js/blogDetail.js"></script>
	<script type="text/javascript">
		var _path = '${path}';
		var _userId = '${SPRING_SECURITY_CONTEXT.authentication.principal.id }';
		var _blogId = '${blog.blogId}';
		$(function(){
			$('.nav-blog').addClass('active');
		});
	</script>
</body>
</html>