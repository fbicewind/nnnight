// 定义最后光标对象
var lastEditRange;
var emotion = {
    init: function () {
        emotion.detail.initEmoji();
        emotion.detail.clickEdit();
        emotion.detail.keyUpEdit();
        emotion.detail.chooseEmoji();
        emotion.detail.toggleEmoji();
    },
    detail: {
        initEmoji: function () {
            $.ajax({
                url: '/static/upload/emoji.json',
                headers: {
                    contentType: "application/x-www-form-urlencoded"
                },
                async: false,
                success: function (data) {
                    var defaultStr = '', moodStr = '', weatherStr = '', foxStr = '';
                    $.each(data, function (index, item) {
                        if (item.category == null || item.category == '') {
                            defaultStr += '<img class="emotion-icon" src="' + item.url + '" title=' + item.phrase + '>';
                        } else if (item.category == '心情') {
                            moodStr += '<img class="emotion-icon" src="' + item.url + '" title=' + item.phrase + '>';
                        } else if (item.category == '天气') {
                            weatherStr += '<img class="emotion-icon" src="' + item.url + '" title=' + item.phrase + '>';
                        } else if (item.category == '阿狸') {
                            foxStr += '<img class="emotion-icon" src="' + item.url + '" title=' + item.phrase + '>';
                        }
                    });
                    $('#defaultTab').html(defaultStr);
                    $('#moodTab').html(moodStr);
                    $('#weatherTab').html(weatherStr);
                    $('#foxTab').html(foxStr);
                }
            });
        },
        clickEdit: function () {	// 编辑框点击事件
            $('#emotionContent').click(function () {
                // 获取选定对象
                var selection = getSelection();
                // 设置最后光标对象
                lastEditRange = selection.getRangeAt(0);
            });
        },
        keyUpEdit: function () {
            $('#emotionContent').keyup(function () {
                // 获取选定对象
                var selection = getSelection();
                // 设置最后光标对象
                lastEditRange = selection.getRangeAt(0);
                console.log(lastEditRange);
            });
        },
        chooseEmoji: function () {
            $('.emotion-icon').on('click', function () {
                // 获取编辑框对象
                var edit = document.getElementById('emotionContent');
                // 编辑框设置焦点
                edit.focus();
                // 获取选定对象
                var selection = getSelection();
                // 判断是否有最后光标对象存在
                if (lastEditRange) {
                    // 存在最后光标对象，选定对象清除所有光标并添加最后光标还原之前的状态
                    selection.removeAllRanges();
                    selection.addRange(lastEditRange);
                }
                // 创建img元素
                var img = document.createElement('img');
                img.src = $(this).attr('src');
                // 判断选定对象范围是编辑框还是文本节点
                if (selection.anchorNode.nodeName != '#text') {
                    // 如果是编辑框范围。则创建表情文本节点进行插入
                    if (edit.childNodes.length > 0) {
                        // 是否是最后一个元素
                        var isLast = true;
                        // 如果文本框的子元素大于0，则表示有其他元素，则按照位置插入表情节点
                        for (var i = 0; i < edit.childNodes.length; i++) {
                            if (i == selection.anchorOffset) {
                                edit.insertBefore(img, edit.childNodes[i]);
                                isLast = false;
                                break;
                            }
                        }
                        // 如果是最后一个元素，则直接在结尾插入
                        if (isLast) {
                            edit.appendChild(img);
                        }
                    } else {
                        // 否则直接插入一个表情元素
                        edit.appendChild(img);
                    }
                    // 创建新的光标对象
                    var range = document.createRange();
                    // 光标对象的范围界定为新建的表情节点
                    range.selectNodeContents(img);
                    range.setStartAfter(img);
                    // 使光标开始和光标结束重叠
                    range.collapse(true);
                    // 清除选定对象的所有光标对象
                    selection.removeAllRanges();
                    // 插入新的光标对象
                    selection.addRange(range)
                } else {
                    // 如果是文本节点则先获取光标对象
                    var range = selection.getRangeAt(0);
                    // 插入表情
                    range.insertNode(img);
                    // 光标位置后移
                    range.setStartAfter(img);
                    // 光标开始和光标结束重叠
                    range.collapse(true);
                    // 清除选定对象的所有光标对象
                    selection.removeAllRanges();
                    // 插入新的光标对象
                    selection.addRange(range);
                }
                // 无论如何都要记录最后光标对象
                lastEditRange = selection.getRangeAt(0);
                $('#emojoDiv').hide();
            });
        },
        toggleEmoji : function () {
            $('#emotionIcon').click(function (event) {
               $('#emojoDiv').toggle();
                event.stopPropagation();
            });
            $('#emojoDiv').click(function (event) {
                event.stopPropagation();
            });
            $(document).click(function () {
                $('#emojoDiv').hide();
            });
        }
    }
}