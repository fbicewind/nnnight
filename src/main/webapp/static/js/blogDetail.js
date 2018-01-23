var blogDetail = {
	init : {
		replyId : ''
	},
	detail : {
		saveComment : function(){
			var comment = $('#reply').val();
			if(comment == null || comment.replace(/(^\s+)|(\s+$)/g, "") == ''){
				_alert('确认', '评论内容不能为空！');
				return;
			}
			if(_userId == ''){
				_confirm('确认', '您当前尚未登录，是否登录？', blogDetail.detail.toLogin);
				return;
			}
			comment = $('#replyTo').html() + comment;
			$.ajax({
				type : 'POST',
				url : _path + '/blogDo/saveComment',
				data : {
					comment : comment,
					userId : _userId,
					blogId : _blogId,
					parentId : blogDetail.init.replyId
				},
				dataType : 'json',
				success : function(result){
					//_alert('确认', '评论成功！');
					window.location.reload();
				}
			});
		},
		toLogin : function(){
			$('#_confirmModal').modal('hide');
			$('#_loginModal').modal('show');
		},
		reply : function(num, name, id){
			location.href = '#reply';
			if(typeof(id) == 'undefined'){
				blogDetail.init.replyId = '';
				$('#replyTo').html('');
			}else{
				blogDetail.init.replyId = id;
				var str = '<div class="alert alert-default" role="alert">';
				str += '<p>回复 ' + name + '  #' + num + ' ：</p></div>';
				$('#replyTo').html(str);
			}
		},
		praise: function(state){
			if(_userId == ''){
				_confirm('确认', '您当前尚未登录，是否登录？', blogDetail.detail.toLogin);
			}else{
				$.ajax({
					url : _path + '/blogDo/praiseBlog',
					data : {
						state : state,
						userId : _userId,
						blogId : _blogId
					},
					dataType : 'json',
					success : function(result){
						window.location.reload();
					}
				});
			}
		},
		favorite: function(state){
			if(_userId == ''){
				_confirm('确认', '您当前尚未登录，是否登录？', blogDetail.detail.toLogin);
			}else{
				$.ajax({
					url : _path + '/blogDo/favoriteBlog',
					data : {
						state : state,
						userId : _userId,
						blogId : _blogId
					},
					dataType : 'json',
					success : function(result){
						window.location.reload();
					}
				});
			}
		},
		delBlog : function(){
			_confirm('确认', '删除后将无法恢复，是否删除？', blogDetail.detail.toDelete);
		},
		toDelete : function(){
			$.ajax({
				url : _path + '/blogDo/delBlog',
				data : {
					blogId : _blogId
				},
				dataType : 'json',
				success : function(result){
					if(result.status == 1){
						window.location.href = $('.article-return').attr('href');
					}
				}
			});
		}
	}
}