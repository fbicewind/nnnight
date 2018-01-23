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

	<div class="container" style="margin-bottom: 40px;margin-top:25px;">
		<div class="col-sm-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">
						${userInfo.nickname }的个人信息
					</h3>
				</div>
				<div class="panel-body" style="padding-top:30px;min-height:450px;">
					<div class="col-xs-12 col-sm-4 col-md-2">
						<div class="text-center">
							<img src="/static/upload/img/l/${userInfo.avatar }" style="width:100px;margin-top:10px;">
						</div>
						<c:if test="${self }">
							<div class="text-center modify-avatar">
								<a href="${path }/aboutMe/modifyAvatar">修改头像</a>
							</div>
						</c:if>
						<div class="three-count">
							<div class="col-xs-4 text-center" style="padding:0;">
								<a href="#">
									<span>文章<br>${userInfo.blogCount }</span>
								</a>
							</div>
							<div class="col-xs-4 text-center" style="padding:0;">
								<a href="#">
									<span>照片<br>${userInfo.photoCount }</span>
								</a>
							</div>
							<div class="col-xs-4 text-center" style="padding:0;">
								<a href="#">
									<span>音乐<br>${userInfo.musicCount }</span>
								</a>
							</div>
						</div>
					</div>
					<div class="col-xs-12 col-sm-8 col-md-10">
						<h4>${userInfo.nickname }</h4>
						<div class="text-right modify-info">
							<c:if test="${self }">
								<c:if test="${userInfo.userId == 1 }">
									<a href="${path }/resume">查看简历</a>
								</c:if>
								<a href="${path }/aboutMe/modifyInfo" style="margin-left:15px;">修改</a>
							</c:if>
						</div>
						<div>
							<div class="about-info-div">
								<div class="col-sm-3 col-md-2">邮箱：</div>
								<div class="col-sm-9 col-md-10">
									${userInfo.email }
									<c:if test="${userInfo.email == null || userInfo.email == '' }">无</c:if>
								</div>
							</div>
							<div class="about-info-div">
								<div class="col-sm-3 col-md-2">手机：</div>
								<div class="col-sm-9 col-md-10">
									${userInfo.mobile }
									<c:if test="${userInfo.mobile == null || userInfo.mobile == '' }">无</c:if>
								</div>
							</div>
							<div class="about-info-div">
								<div class="col-sm-3 col-md-2">职业：</div>
								<div class="col-sm-9 col-md-10">
									${userInfo.profession }
									<c:if test="${userInfo.profession == null || userInfo.profession == '' }">无</c:if>
								</div>
							</div>
							<div class="about-info-div">
								<div class="col-sm-3 col-md-2">性别：</div>
								<div class="col-sm-9 col-md-10">
									<c:choose>
										<c:when test="${userInfo.gender == 0 }">女</c:when>
										<c:when test="${userInfo.gender == 1 }">男</c:when>
										<c:otherwise>保密</c:otherwise>
									</c:choose>
								</div>
							</div>
							<div class="about-info-div">
								<div class="col-sm-3 col-md-2">生日：</div>
								<div class="col-sm-9 col-md-10">
									<fmt:formatDate value="${userInfo.birthday }" pattern="yyyy-MM-dd" />
									<c:if test="${userInfo.birthday == null || userInfo.birthday == '' }">无</c:if>
								</div>
							</div>
							<div class="about-info-div">
								<div class="col-sm-3 col-md-2">个性签名：</div>
								<div class="col-sm-9 col-md-10">
									${userInfo.remark }
									<c:if test="${userInfo.remark == null || userInfo.remark == '' }">无</c:if>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="../common/footer.jsp"%>
	<%@ include file="../common/login.jsp"%>
	<script src="${path }/static/js/aboutMe.js"></script>
	<script type="text/javascript">
		var _path = '${path}';
		$(function(){
			$('.nav-about').addClass('active');
			
		});
		
	</script>
</body>
</html>