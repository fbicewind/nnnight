<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/tag.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<%@ include file="../common/head.jsp"%>
<link rel="stylesheet" type="text/css" href="${path }/static/plugin/datetimepicker/bootstrap-datetimepicker.min.css">
</head>
<body>
	<%@ include file="../common/top.jsp"%>

	<div class="container" style="margin-bottom: 40px;margin-top:25px;">
		<div class="col-sm-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">
						修改个人信息
					</h3>
				</div>
				<div class="panel-body" style="padding-top:30px;min-height:450px;">
					<form class="form-horizontal" role="form" id="modifyInfoForm" style="margin-top:20px;">
						<div class="form-group">
							<label for="email" class="col-sm-3 control-label">邮箱</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="email" name="email" placeholder="请输入邮箱..." value="${userInfo.email }">
							</div>
						</div>
						<div class="form-group">
							<label for="mobile" class="col-sm-3 control-label">手机</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="mobile" name="mobile" placeholder="请输入手机..." value="${userInfo.mobile }">
							</div>
						</div>
						<div class="form-group">
							<label for="profession" class="col-sm-3 control-label">职业</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="profession" name="profession" placeholder="请输入职业..." value="${userInfo.profession }">
							</div>
						</div>
						<div class="form-group">
							<label for="gender" class="col-sm-3 control-label">性别</label>
							<div class="col-sm-7">
								<label class="radio-inline">
									<c:if test="${userInfo.gender == 1 }">
								    	<input type="radio" value="1" name="gender" checked="checked">男
								    </c:if>
									<c:if test="${userInfo.gender != 1 }">
								    	<input type="radio" value="1" name="gender">男
								    </c:if>
								</label>
								<label class="radio-inline">
									<c:if test="${userInfo.gender == 0 }">
								    	<input type="radio" value="0" name="gender" checked="checked">女
								    </c:if>
									<c:if test="${userInfo.gender != 0 }">
								    	<input type="radio" value="0" name="gender">女
								    </c:if>
								</label>
								<label class="radio-inline">
									<c:if test="${userInfo.gender == 2 }">
								    	<input type="radio" value="2" name="gender" checked="checked">保密
								    </c:if>
									<c:if test="${userInfo.gender != 2 }">
								    	<input type="radio" value="2" name="gender">保密
								    </c:if>
								</label>
							</div>
						</div>
						<div class="form-group">
							<label for="birthday" class="col-sm-3 control-label">生日</label>
							<div class="input-group date form_date col-sm-7" data-date-format="yyyy-mm-dd" style="padding:0 15px;">
			                    <input class="form-control" size="16" type="text" id="birthday" name="birthday" readonly="readonly" style="background-color:#fff;" value="<fmt:formatDate value="${userInfo.birthday }" pattern="yyyy-MM-dd" />">
								<span class="input-group-addon"><span class="fa fa-calendar"></span></span>
			                </div>
						</div>
						<div class="form-group">
							<label for="remark" class="col-sm-3 control-label">个性签名</label>
							<div class="col-sm-7">
								<textarea class="form-control" rows="3" name="remark" id="remark">${userInfo.remark }</textarea>
							</div>
						</div>
						<div class="form-group">
					    	<div class="col-sm-offset-3 col-sm-7">
					    		<button type="submit" class="btn btn-default">保存</button>
					    	</div>
					  	</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="../common/footer.jsp"%>
	<%@ include file="../common/alert.jsp"%>
	<script type="text/javascript" src="${path }/static/plugin/datetimepicker/bootstrap-datetimepicker.min.js"></script>
	<script type="text/javascript" src="${path }/static/plugin/datetimepicker/bootstrap-datetimepicker.zh-CN.js"></script>
	<script src="${path }/static/js/modifyInfo.js"></script>
	<script type="text/javascript">
		var _path = '${path}';
		var _userId = '${wholeId}';
		$(function(){
			$('.nav-about').addClass('active');
			modifyInfo.init();
		});
		
	</script>
</body>
</html>