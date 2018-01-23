<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/tag.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<%@ include file="../common/head.jsp"%>
</head>
<body>
	<%@ include file="../common/top.jsp"%>
	<div class="container" style="min-height: 400px; margin-bottom: 40px;margin-top:25px;">
		<div class="col-sm-8 col-xs-12">
			<div style="background: #fff;padding:15px;">
				<textarea rows="4" class="form-control" style="border-radius: 5px 5px 0 0;border: 1px solid #ddd;border-bottom:none;"></textarea>
				<div style="border: 1px solid #ddd;overflow: hidden;">
					<i class="fa fa-smile-o fa-lg" aria-hidden="true" style="padding:10px;cursor: pointer;"></i>
					<button type="button" class="btn btn-default pull-right" style="border:none;border-left:1px solid #ddd;border-radius:0;height:34px;">发&nbsp;&nbsp;送</button>
					<button type="button" class="btn btn-default pull-right" style="border:none;border-left:1px solid #ddd;border-radius:0;height:34px;">GOAL</button>
				</div>
			</div>
			<div>
				<div style="background: #fff;margin-top: 20px;padding:15px;">
					<p>TestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTest</p>
					<div>
						<span>2018-01-21 12:17</span>
					</div>
				</div>
			</div>
			<div>
				<div style="background: #fff;margin-top: 20px;padding:15px;">
					<p>TestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTest</p>
					<div>
						<span>2018-01-21 12:17</span>
					</div>
				</div>
			</div>
			<div>
				<div style="background: #fff;margin-top: 20px;padding:15px;">
					<p>TestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTest</p>
					<div>
						<span>2018-01-21 12:17</span>
					</div>
				</div>
			</div>
		</div>
		<div class="col-sm-4 col-xs-12">
			<div style="background: #fff;overflow: hidden;padding:15px 0;">
				<div style="overflow: hidden;">
					<div class="col-md-4 col-sm-12">
						<img src="/static/upload/img/m/${userInfo.avatar }" class="full-width">
					</div>
					<div class="col-md-8 col-sm-12">
						<ul>
							<li>昵称：${userInfo.nickname }</li>
							<li>GOAL：未设置</li>
							<!-- 初定目标 num<5，任务满满（进行中的多），终结者（完成的比例多），LOSER？？？（失败的比例多） -->
						</ul>
					</div>
				</div>
				<div style="overflow: hidden;margin-top:20px;">
					<div class="col-xs-4 text-center">
						<a href="#"><span>完成<br>${userInfo.blogCount }
						</span></a>
					</div>
					<div class="col-xs-4 text-center">
						<a href="#"><span>进行中<br>${userInfo.photoCount }
						</span></a>
					</div>
					<div class="col-xs-4 text-center">
						<a href="#"><span>失败<br>${userInfo.musicCount }
						</span></a>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<%@ include file="../common/footer.jsp"%>
	<%@ include file="../common/login.jsp"%>
	<script src="${path }/static/js/emotion.js"></script>
	<script type="text/javascript">
		var _path = '${path}';
		var _userId = '${wholeId}';
		$(function(){
			$('.nav-mood').addClass('active');
			emotion.init();
		});
	</script>
</body>
</html>