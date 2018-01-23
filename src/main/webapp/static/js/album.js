var album = {
	init : function() {
		album.validate.albumValidate();
	},
	detail : {
		addAlbum : function(){
			$('#albumForm').submit();
		},
		toUploadPhotos : function(){
			album.detail.removeHistory();
			$('#uploadPhotoModal').modal('show');
		},
		uploadPhoto : function(i){
			if(fileArr.length == 0){
				_alert('确认', '请先选择照片');
				return;
			}
			if(i < fileArr.length){
				var albumData = new FormData();
				albumData.append("albumId", toAlbumId);
				albumData.append("photo", fileArr[i]);
				$('.photo-to-upload').eq(i).append('<span class="this-uploading">上传中<i class="fa fa-spinner fa-pulse fa-fw margin-bottom"></i></span>');
				$.when(album.detail.uploadDetail(albumData)).done(function(data, status){
		            i++;
		            if(status == 1){
		            	$('.this-uploading').text('已上传').addClass('this-uploaded').removeClass('this-uploading');
		            }else{
		            	$('.this-uploading').text('上传失败').addClass('this-uploaded').removeClass('this-uploading');
		            }
		            album.detail.uploadPhoto(i);
		        });
			} else {//全部上传完成，重新计算数量
				$.ajax({
				    url: _path + '/album/getAlbum',
				    type: 'POST',
				    data: {
				    	albumId : toAlbumId
				    },
				    dataType: 'json',
				    success : function(result){
				    	console.log(result);
				    	$('.photo-count-' + toAlbumId).text(result.photoCount);
				    }
				});
			}

		},
		uploadDetail : function(albumData){
			var defer = $.Deferred();
			$.ajax({
			    url: _path + '/blogDo/uploadPhoto',
			    type: 'POST',
			    data: albumData,
			    processData: false,
			    contentType: false,
			    dataType: 'json',
			    success : function(result){
			    	defer.resolve(result, 1);
			    },
			    error : function(){
			    	defer.resolve(result, 0);
			    }
			});
			return defer.promise();
		},
		removeHistory : function(){
			fileArr = [];
			$('#addTarget').prevAll().remove();
			$('.to-show-select').hide();
		}
	},
	validate : {
		albumValidate : function(){
			$('#albumForm').validate({
				rules : {
					albumName : {
						required : true,
						minlength : 1,
						maxlength : 10,
						remote : {
							url : _path + "/validate/albumName",
							type : "get",
							data : {
			                	albumName: function() {
						            return $("#albumName").val();
						        }
			                },
			                dataType : 'json',
							dataFilter : function(data) {
								data = eval('('+data+')');
								if(data.status == '0'){
									return true;
								}else{
									return false;
								}
							}
						}
					},
					albumDesc : {
						required : true,
						minlength : 1,
						maxlength : 100
					}
				},
				messages : {
					albumName : {
						required : '请填写相册名称',
						minlength : '相册名称不能少于一个字符',
						maxlength : '相册名称不能多余十个字符',
						remote : '相册名称已存在'
					},
					albumDesc : {
						required : '请填写相册描述',
						minlength : '相册描述不能少于一个字符',
						maxlength : '相册描述不能多于一百个字符'
					}
				},
				submitHandler : function(form) {
					$.ajax({
						type : 'POST',
						url : _path + '/blogDo/saveAlbum',
						data : $('#albumForm').serialize(),
						dataType : 'json',
						success : function(result){
							if(result.status == 1){
								window.location.reload();
							}else{
								_alert('确认', '创建失败！');
							}
						}
					});
				}
			});
		}
	}
}
