<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../common/tag.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<%@ include file="../../common/head.jsp"%>
<style>
	#eCover{
		padding: 15px;
	}
	.lt-hidden{
		display: none;
	}
	.lt-hidden>h4{
		text-align: center;
		position: fixed;
		width: 100%;
		top:0;
		margin: 0;
		padding:20px 0 15px 0;
		background: #F0EEFF;
	}
	.lt-next, .lt-return{
		width: 50%;
		display: block;
		float:right;
		text-align: right;
	    padding: 5px 15px 5px 0;
	    
	}
	.lt-prev{
		width:50%;
		display: block;
		float: left;
		text-align: left;
		padding: 5px 0 5px 15px;
	}
	.bottom-div{
		position: fixed;
		width: 100%;
		background: #F0EEFF;
		bottom:0;
	}
	.inner-image{
		width:100%;
	}
	.lt-hidden p{
	    text-indent: 2em;
	}
@media screen and (max-width: 767px) {
	#coverDiv{
		margin-top: 150px;
	}
}
</style>
</head>
<body>

	<div class="container" style="min-height: 400px; padding:0;">
		<div id="coverDiv">
			<img id="eCover" src="${path }/static/image/lt/e-cover.jpg" style="width:100%;">
			<div style="text-align: center;">给宝宝的七封情书，点击信封打开哦~</div>
		</div>
		<div id="lt1Div" class="lt-hidden">
			<h4>某年某日</h4>
			<div style="margin-top:55px;margin-bottom:30px;padding: 0 15px;text-align: justify;">
				<p>在想着，用自己有限的才能，给宝宝一份不一样的礼物。于是，这小小的七封情书诞生了。(<strong>首先，这是灵魂画师辛辛苦苦画的，不准鄙视，不准嫌弃，不准笑T.T</strong>)</p>
				<p>有时候，脑子里会幻想，是否，在那个不知名的某年某月某日，我正在看向窗外，而你，正从马路上开着小电驴路过。</p>
				<img src="${path }/static/image/lt/1-1.jpg" class="inner-image"> 
				<p>亦或者，走在广场，不知不觉间的擦肩而过。</p>
				<p>于是，故事就这样开始了...</p>	
			</div>
			<div class="bottom-div">
				<span class="lt-next" data-now="1">NEXT&gt;&gt;&gt;</span>
			</div>
		</div>
		<div id="lt2Div" class="lt-hidden">
			<h4>初见</h4>
			<div style="margin-top:55px;margin-bottom:30px;padding: 0 15px;text-align: justify;">
				<p>有时候，缘分到了，就见到面了。感谢我的哥哥嫂嫂，让我们第一次相遇。</p>
				<p>宝宝非常爱穿裙子，不过，穿着裙子的宝宝确实非常非常的漂亮。第一次见面，看着宝宝穿着一身长裙，瞬间被吸引了。脑子里闪出了一句很有名的话，这妹妹我似乎在哪见过。</p>
				<img src="${path }/static/image/lt/2-1.jpg" class="inner-image">
				<p>我是内向的害羞，宝宝是外向的害羞。这好像，还是我第一次鼓起勇气找女孩要微信，虽然已经水到渠成了:)</p>
				<p>不经意间，看到宝宝好像朝我瞥了我一眼，审视了我一番，内心，超紧张ing</p>
				<img src="${path }/static/image/lt/2-2.jpg" class="inner-image">
				<p>终于和宝宝认识了，第一次一起去逛广场，那一天，天气怎么样已经完全不记得了，因为脑子里只记得了和宝宝在一起的时候。</p>
				<p>你说，你刚刚是不是看到微信昵称笑了。我说，没有。是真的没有，我只是觉得昵称好有个性，嘿嘿。</p>
				<img src="${path }/static/image/lt/2-3.jpg" class="inner-image"> 
				<p>难得的一次逛广场，那时候阿姨说你宅，我还是不相信的。哈哈~~~</p>
			</div>
			<div class="bottom-div">
				<span class="lt-prev" data-now="2">&lt;&lt;&lt;PREV</span>
				<span class="lt-next" data-now="2">NEXT&gt;&gt;&gt;</span>
			</div>
		</div>
		<div id="lt3Div" class="lt-hidden">
			<h4>游泳</h4>
			<div style="margin-top:55px;margin-bottom:30px;padding: 0 15px;text-align: justify;">
				<p>有时候，脑子会搭错筋。也可能是，太想见宝宝了。你随口的一句，你来看我游泳呀，我就真的去了。</p>
				<p>然后，就出现了这一幕。。。</p>
				<img src="${path }/static/image/lt/3-1.jpg" class="inner-image"> 
				<p>看着宝宝一家游泳游得好开心，然后，很羡慕，有很尴尬=.=瞬间很后悔啊有木有</p>
				<p>难得的创造了一次机会，又可以和宝宝一块走走了，老天爷却很不作美的下雨了T.T</p>
				<img src="${path }/static/image/lt/3-2.jpg" class="inner-image">
				<p>于是只能匆匆赶回家，但是这雨最后好像也没有下起来。。。</p> 			
			</div>
			<div class="bottom-div">
				<span class="lt-prev" data-now="3">&lt;&lt;&lt;PREV</span>
				<span class="lt-next" data-now="3">NEXT&gt;&gt;&gt;</span>
			</div>
		</div>
		<div id="lt4Div" class="lt-hidden">
			<h4>第一次约会</h4>
			<div style="margin-top:55px;margin-bottom:30px;padding: 0 15px;text-align: justify;">
				<p>第一次和宝宝的约会，原来一切都是顺顺利利很完美的，最后回家却出了幺蛾子，一直觉得好对不起宝宝。</p>
				<img src="${path }/static/image/lt/4-1.jpg" class="inner-image">
				<p>附上当时写的<a href="http://www.nnnight.cn/blog/detail/42" target="blank">检讨书</a></p>			
			</div>
			<div class="bottom-div">
				<span class="lt-prev" data-now="4">&lt;&lt;&lt;PREV</span>
				<span class="lt-next" data-now="4">NEXT&gt;&gt;&gt;</span>
			</div>
		</div>
		<div id="lt5Div" class="lt-hidden">
			<h4>七夕</h4>
			<div style="margin-top:55px;margin-bottom:30px;padding: 0 15px;text-align: justify;">
				<p>七夕，是一个漫长的故事。因为是周一，我下班很晚的，所以可能去其他地方吃饭会很麻烦的，于是想约宝宝出来走走，结果被严厉的教训了T.T但是最后，一切计划都没实现，我在家陪着我妈，你也没和你朋友玩，也没和我出去，反而是陪着你妈。。。</p>
				<p>一直想着，要送一份不一样的七夕礼物。首饰什么的，普通的感觉太俗了，贵的又买不起。偶然看到了一款剑三的周边钥匙扣，于是又精挑细选了几句话，礼物完成了~</p>
				<p>一直没机会见到宝宝，只能趁着周末亲自送到医院去了。第一次去袍江医院，不是去看病，也不是去看病人，而是去送礼，估计这样的也只有我了。</p>
				<img src="${path }/static/image/lt/5-1.jpg" class="inner-image">
				<p>坐在手术室外，等的确实里边的小护士，嘿嘿~~</p>		
			</div>
			<div class="bottom-div">
				<span class="lt-prev" data-now="5">&lt;&lt;&lt;PREV</span>
				<span class="lt-next" data-now="5">NEXT&gt;&gt;&gt;</span>
			</div>
		</div>
		<div id="lt6Div" class="lt-hidden">
			<h4>第二次约会</h4>
			<div style="margin-top:55px;margin-bottom:30px;padding: 0 15px;text-align: justify;">
				<p>第二次和宝宝的约会，脑子里在想着，是不是该做点什么，怎么也得拉拉小手，只是，胆子小，又怕被嫌弃，一直畏畏缩缩。</p>
				<p>都要回去了，宝宝的手还被牛奶箱弄伤了，心疼。</p>
				<img src="${path }/static/image/lt/6-1.jpg" class="inner-image">
				<p>于是，计划没得逞，普普通通，快快乐乐的一次约会~</p>			
			</div>
			<div class="bottom-div">
				<span class="lt-prev" data-now="6">&lt;&lt;&lt;PREV</span>
				<span class="lt-next" data-now="6">NEXT&gt;&gt;&gt;</span>
			</div>
		</div>
		<div id="lt7Div" class="lt-hidden">
			<h4>后来ing</h4>
			<div style="margin-top:55px;margin-bottom:30px;padding: 0 15px;text-align: justify;">
				<p>日子还在继续，和宝宝的故事也在继续。好久没见到宝宝了，弄了这么个东西，来表达一下我的思念之情。</p>
				<p>我的性格并不是怎么好，太内了，我也正在逐渐改变着自己，只不过，一见到宝宝就像老鼠见到了猫，可能是因为第一次实在是太愧疚了T.T</p>
				<p>陪伴，是最长情的告白。一起走走，是最好的感情药剂。我爱你，是永远的礼物。</p>
				<p>一直以来，都是那么的水到渠成，也没有向宝宝表白过，有些过意不去。首先，在这里说一句，宝宝，我爱你！不知道在什么时候起，你就深深的印在了脑里，做梦梦到你，没事就会想起你，难过了就想和你说说话。把什么都告诉你，想霸道的时时刻刻缠着你。</p>
				<p>然后，求给机会多出去走走，平时也好，周末也好，好好养好病，别那么宅了，嘿嘿~  :)</p>
				<img src="${path }/static/image/lt/7-1.jpg" class="inner-image">
				<p>命运轮转千回，只愿执子之手，与子偕老。千山万水不惧风雨，披星戴月此情不渝。要和你在一起~</p>		
			</div>
			<div class="bottom-div">
				<span class="lt-prev" data-now="7">&lt;&lt;&lt;PREV</span>
				<span class="lt-return">返回<i class="fa fa-reply" aria-hidden="true"></i></span>
			</div>
		</div>
	</div>

	<script src="${path }/static/js/jquery-1.12.3.min.js"></script>
	<script src="${path }/static/js/jquery.validate.min.js"></script>
	<script src="${path }/static/js/jquery.dotdotdot.min.js"></script>
	<script src="${path }/static/js/bootstrap.min.js"></script>
	<script src="${path }/static/plugin/wangEditor/dist/js/wangEditor.min.js"></script>
	<script src="${path }/static/js/common.js"></script>
	<script type="text/javascript">
		$(function(){
			$('#eCover').click(function(){
				$('#coverDiv').hide();
				$('#lt1Div').show();
			});
			$('.lt-next').click(function(){
				var nowId = $(this).attr('data-now');
				var toId = parseInt(nowId) + 1;
				$('#lt'+nowId+'Div').hide();
				$('#lt'+toId+'Div').show();
			});
			$('.lt-prev').click(function(){
				var nowId = $(this).attr('data-now');
				var prevId = parseInt(nowId) - 1;
				$('#lt'+nowId+'Div').hide();
				$('#lt'+prevId+'Div').show();
			});
			$('.lt-return').click(function(){
				$('#lt7Div').hide();
				$('#coverDiv').show();
			});
		});
	</script>
</body>
</html>