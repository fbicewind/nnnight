<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/tag.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<%@ include file="../common/head.jsp"%>
<link rel="stylesheet" href="${path }/static/plugin/cropper/cropper.min.css">
<style type="text/css">
img {
    max-width: 100%;
}
.cropper-view-box,
.cropper-face {
	border-radius: 50%;
}
.preview{
	overflow: hidden;
}
</style>
</head>
<body>
	<%@ include file="../common/top.jsp"%>

	<div class="container" style="margin-bottom: 40px;margin-top:25px;">
		<div class="col-sm-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">
						修改头像
					</h3>
				</div>
				<div class="panel-body" style="padding-top:30px;min-height:450px;">
					<div class="visible-xs">对不起，该分辨率下暂不支持头像修改...</div>
					<div style="overflow: hidden;margin-bottom:15px;">
						<form id="avatarForm" enctype="multipart/form-data" method="post">
							<div class="col-sm-8 col-md-6 hidden-xs"><span class="btn btn-default avatar-select-span">选择图片</span><input type="file" name="avatar" id="avatarSelect"></div>
						</form>
						<div class="col-sm-4 col-md-6 hidden-xs" style="padding-top:8px;">预览</div>
					</div>
					<div class="col-sm-8 col-md-6 hidden-xs">
						<div id="imageDiv" style="width: 400px;height: 400px;">
	        				<img id="image" style="width: 100%;height:100%;">
	      				</div>
					</div>
					<div class="col-sm-4 col-md-6 hidden-xs">
						<div style="width: 200px;">
							<div class="preview" style="width: 200px;height: 200px;border: 1px solid #ddd;"></div>
					    </div>
					    <div style="width: 100px;">
					        <div class="preview" style="width: 100px;height: 100px;margin-top: 20px;border: 1px solid #ddd;"></div>
					    </div>
					    <div style="width: 50px;">
					        <div class="preview" style="width: 50px;height: 50px;margin-top: 20px;border: 1px solid #ddd;"></div>
					    </div>
					    <div>
					    	<button class="btn btn-default" type="button" style="margin-top:20px;" id="saveAvatar">保存</button>
					    </div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="../common/footer.jsp"%>
	<%@ include file="../common/login.jsp"%>
	<%@ include file="../common/alert.jsp"%>
	<script src="${path }/static/js/jquery.form.js"></script>
	<script src="${path }/static/plugin/cropper/cropper.min.js"></script>
	<script src="${path }/static/js/modifyAvatar.js"></script>
	
	<script type="text/javascript">
		var _path = '${path}';
		var _userId = '${wholeId}';
		$(function(){
			$('.nav-about').addClass('active');
			modifyAvatar.init();
		});
		
	</script>
</body>
</html>