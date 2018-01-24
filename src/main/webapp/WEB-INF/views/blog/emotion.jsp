<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/tag.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<%@ include file="../common/head.jsp"%>
</head>
<body>
	<%@ include file="../common/top.jsp"%>
	<div class="container emotion-container">
		<div class="col-sm-8 col-xs-12">
			<div class="emotion-textarea-div">
				<div id="emotionContent" contenteditable="true" style="height: 140px;padding: 10px;"></div>
				<div>
					<i class="fa fa-smile-o fa-lg" aria-hidden="true" id="emotionIcon"></i>
					<div id="emojoDiv" style="position: absolute;border: 1px solid #ddd;background: #fff;display: none;">
						<div id="myTabContent" class="tab-content" style="height: 160px;width: 100%;overflow-y:
						scroll;">
							<div class="tab-pane fade in active" id="defaultTab"></div>
							<div class="tab-pane fade" id="moodTab"></div>
							<div class="tab-pane fade" id="weatherTab"></div>
							<div class="tab-pane fade" id="foxTab"></div>
						</div>
						<ul id="myTab" class="nav nav-tabs" style="margin-bottom: 0;">
							<li class="active"><a href="#defaultTab" data-toggle="tab">默认</a></li>
							<li><a href="#moodTab" data-toggle="tab">心情</a></li>
							<li><a href="#weatherTab" data-toggle="tab">天气</a></li>
							<li><a href="#foxTab" data-toggle="tab">阿狸</a></li>
						</ul>
					</div>
					<button type="button" class="btn btn-default pull-right">发&nbsp;&nbsp;送</button>
					<button type="button" class="btn btn-default pull-right">GOAL</button>
				</div>
			</div>
			<div class="emotion-content-div">
				<p>TestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTest</p>
				<div>
					<span>2018-01-21 12:17</span>
				</div>
			</div>
			<div class="emotion-content-div">
				<p>TestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTest</p>
				<div>
					<span>2018-01-21 12:17</span>
				</div>
			</div>
			<div class="emotion-content-div">
				<p>TestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTest</p>
				<div>
					<span>2018-01-21 12:17</span>
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
							<li><span style="display: inline-block;width: 42px;">昵&nbsp;&nbsp;称</span>：
							${userInfo.nickname }</li>
							<li><span style="display: inline-block;width: 42px;">GOAL</span>： 未设置</li>
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
			<div style="background: #fff;padding: 15px;margin-top: 20px;">
				<h5>进行中</h5>
				<ul>
					<li><a href="#">[<i>s</i>]good</a></li>
				</ul>
			</div>
			<div style="background: #fff;padding: 15px;margin-top: 20px;">
				<h5>完成</h5>
				<ul>
					<li><a href="#">[<i>s</i>]good</a></li>
				</ul>
			</div>
			<div style="background: #fff;padding: 15px;margin-top: 20px;">
				<h5>失败</h5>
				<ul>
					<li><a href="#">[<i>s</i>]good</a></li>
				</ul>
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