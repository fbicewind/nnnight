<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/tag.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<%@ include file="../common/head.jsp"%>
<style type="text/css">
#wEditor{
	height:600px;
}
</style>
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

	<div class="container" style="min-height: 400px; margin-bottom: 40px;">
		<input type="hidden" id="_blogDetail" value='<c:out value="${blog.content }" escapeXml="false"></c:out>'>
		<div class="col-sm-8 col-xs-12">
			<form role="form" id="newBlog">
				<input type="hidden" name="blogId" id="blogId" value="${blog.blogId }">
			 	<div class="form-group">
					<input type="text" name="title" id="title" class="form-control" placeholder="标题..." value="${blog.title }">
				</div>
				<div id="wEditor">
				</div>
				<div style="margin:15px 0;">
					<div class="form-group">
	    				<label for="type" class="form-label" style="font-weight: 500;">分类：</label>
	    				<select class="form-control" id="type" style="width:150px;display: inline-block;">
	    					<c:choose>
	    						<c:when test="${blog.typeId == 1 }">
	    							<option value="1" selected="selected">我的博客</option>
	    						</c:when>
	    						<c:otherwise>
	    							<option value="1">我的博客</option>
	    						</c:otherwise>
	    					</c:choose>
							<c:forEach var="type" items="${types }">
								<c:choose>
		    						<c:when test="${blog.typeId == type.typeId }">
		    							<option value="${type.typeId }" selected="selected">${type.typeName }</option> 
		    						</c:when>
		    						<c:otherwise>
		    							<option value="${type.typeId }">${type.typeName }</option> 
		    						</c:otherwise>
		    					</c:choose>
							</c:forEach>
						</select>
						<a style="cursor: pointer;" data-toggle="modal" data-target="#myModal">添加分类</a>
	  				</div>
	  				<div class="checkbox">
						<label style="padding-left: 0;width: 110px;">
							仅自己可见
							<c:choose>
								<c:when test="${blog.publicFlag == 1 }">
									<input id="isPublic" type="checkbox" style="margin-left: 10px;width:15px;height:15px;" checked> 
								</c:when>
								<c:otherwise>
									<input id="isPublic" type="checkbox" style="margin-left: 10px;width:15px;height:15px;"> 
								</c:otherwise>
							</c:choose>
						</label>
						<label style="padding-left: 0;width: 70px;">
							置顶
							<c:choose>
								<c:when test="${blog.topFlag == 1 }">
									<input id="isTop" type="checkbox" style="margin-left: 10px;width:15px;height:15px;" checked>
								</c:when>
								<c:otherwise>
									<input id="isTop" type="checkbox" style="margin-left: 10px;width:15px;height:15px;">
								</c:otherwise>
							</c:choose>
						</label>
						<label style="padding-left: 0;width: 90px;">
							首页推荐
							<c:choose>
								<c:when test="${blog.recommendFlag == 1 }">
									<input id="isRecommend" type="checkbox" style="margin-left: 10px;width:15px;height:15px;" checked>
								</c:when>
								<c:otherwise>
									<input id="isRecommend" type="checkbox" style="margin-left: 10px;width:15px;height:15px;">
								</c:otherwise>
							</c:choose>
						</label>
					</div>
				</div>
				<div class="form-group">
					<button type="button" class="btn btn-primary"  onclick="blogPublish.detail.submitBlog()" style="margin-right:5px;">&nbsp;发&nbsp;&nbsp;&nbsp;&nbsp;表&nbsp;</button>
					<button type="button" class="btn btn-default" onclick="blogPublish.detail.cancelBlog()">&nbsp;取&nbsp;&nbsp;&nbsp;&nbsp;消&nbsp;</button>
					<button style="float: right;" type="button" class="btn btn-default" onclick="blogPublish.detail.saveDraft()">保存草稿</button>
				</div>
			</form>
		</div>
		<div class="col-sm-4 col-xs-12">
			<div class="index-right-block" style="margin-top: 0px;">
				<span>日志分类</span>
				<ul class="last-blog">
					<li><a href="${path }/blog/${userInfo.userId}?i=1">我的博客</a></li>
					<c:forEach var="type" items="${types }">
						<li><a href="${path }/blog/${userInfo.userId}?i=${type.typeId}">${type.typeName }</a></li>
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
						<li><a href="${path }/detail/blog/${blog.blogId }">${blog.title }</a></li>
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
						<li><a href="${path }/detail/blog/${blog.blogId }">${blog.title }</a></li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>

<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="myModalLabel">
                	<span id="modalCompany">添加日志分类</span>
                </h4>
            </div>
            <div class="modal-body">
            	<form role="form" class="form-horizontal" id="newType">
            		<div class="form-group">
						<label for="typeName" class="col-sm-3 control-label">分类名称：</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" id="typeName" name="typeName">
						</div>
					</div>
            	</form>
			</div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" onclick="blogPublish.detail.addType()">确定</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>
<!-- /.modal -->

	<%@ include file="../common/footer.jsp"%>
	<%@ include file="../common/login.jsp"%>
	<%@ include file="../common/alert.jsp"%>
	<%@ include file="../common/confirm.jsp"%>
	<script src="${path }/static/js/blogPublish.js"></script>
	<script type="text/javascript">
		var _path = '${path}';
		$(function () {
			$('.nav-blog').addClass('active');
			blogPublish.init();
        });
	</script>
</body>
</html>