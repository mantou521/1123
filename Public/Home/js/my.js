$(function(){
    // 跳转
    $('.yeji_con_search_tc').click(function(){
        window.location.href='info.html';
    })
    // 记住登陆一个月效果(复选框)
    $(".login_bot_rem em").click( function () {
        var val=$(this).attr('onOff');
        if(val==0){
            $(this).attr("onOff", '1');
            $(this).addClass("checkbox_em2");
        }else{
            $(this).attr("onOff", '0');
            $(this).removeClass("checkbox_em2");
        }
    });

    $(".login_bot_span_login").click( function () {

    });

    // 注册不能为空
    /*$(".login_bot_span_reg").click( function () {
        // alert('开始进行验证码');
        //第一步:初级加工（验证）、验证必填项是否为空
        //采用智能验证方法
        $('.data_list').each(function(){
            $geshiyanzheng=$(this).attr('geshiyanzheng');
            $val = $.trim($(this).val());
            if($val==''){
                $tipText=$(this).attr('tip');
                alert($tipText+'不能为空');
                return false;
            }else{
                //如果当前是邮箱，邮箱格式验证
                /!*if($geshiyanzheng == 'email'){//email属性为1，表示是邮箱
                 $isEmail = checkEmail($val);//该方法会返回true 或者false
                 if($isEmail == false){  //不是邮箱，出现提示
                 $errText=$(this).attr('placeholder')+'格式不正确';
                 alert($errText);
                 }
                 }*!/

                //如果当前是手机，验证手机格式
                if($geshiyanzheng == 'phone') {
                    $isPhone = checkMobilePhone($val);
                    if($isPhone == false){
                        $errText='手机号格式不正确';
                        alert($errText);
                        return false;
                    }
                }

                if($geshiyanzheng == 'idcard'){//email属性为1，表示是邮箱
                    $isEmail = checkCard($val);//该方法会返回true 或者false
                    if($isEmail == false){  //不是邮箱，出现提示
                        $errText='身份证号格式不正确';
                        alert($errText);
                        return false;
                    }
                }
            }
        })
    });*/

    // 首页左侧菜单栏，手风琴
    $(".main_left_li_dif").click( function () {
        var val=$(this).attr('onOff');
        if(val==0){
            $(this).attr("onOff", '1');
            $(this).find('ol').hide();
        }else{
            $(this).attr("onOff", '0');
            $(this).find('ol').show();
        }

    });


//步骤
    $(".pwd_next_step").click( function () {
        var val=$('.pwd_step').attr('step');

        $('.pwd_con').hide();
        $('.pwd_con').eq(val).show();

        if(val==1){
            $('.pwd_step').attr("step", '2');
            $('.pwd_step').find('span').eq(val).addClass("pwd_step_span2");
        }else if(val==2){
            $('.pwd_step').attr("step", '3');
            $('.pwd_step').find('span').eq(val).addClass("pwd_step_span3");
        }else if(val==3){
            $('.pwd_step').attr("step", '3');
            $('.pwd_step').find('span').eq(val).addClass("pwd_step_span4");
            $html = '<a href="index.html">去登陆</a>';
            $(this).html($html);
        }

    });

// 弹窗
    $(".yeji_con_search_r").click( function () {
        var val=$('.yeji_con_tiaojian_query_tc').attr('onOff');
        if(val==0){
            $('.yeji_con_tiaojian_query_tc').attr("onOff", '1');
            $('.yeji_con_tiaojian_query_tc').show();
        }else{
            $('.yeji_con_tiaojian_query_tc').attr("onOff", '0');
            $('.yeji_con_tiaojian_query_tc').hide();
        }
    });

//系统架构
    $('.yeji2_form div input').focus(function(){
        $(this).removeClass('ipt_bor2').addClass('ipt_bor');
    });
    $('.yeji2_form div input').blur(function(){
        $(this).removeClass('ipt_bor').addClass('ipt_bor2');
    });

    //分销
    $('.tree-folder-header').click(function(){
        if($(this).hasClass('hide')){
            $(this).removeClass('hide').addClass('show');
            $(this).siblings('.tree-folder-content').fadeIn(300);
        }else{
            $(this).removeClass('show').addClass('hide');
            $(this).siblings('.tree-folder-content').fadeOut(300);
        }
    });
    $('.tree-folder-content .tree-folder-header').click(function(){
        if($(this).hasClass('hide2')){
            $(this).removeClass('hide2').addClass('show2');
            $(this).siblings('.tree-folder-content').fadeIn(300);
        }else{
            $(this).removeClass('show2').addClass('hide2');
            $(this).siblings('.tree-folder-content').fadeOut(300);
        }
    });

    // //login
    // $(".login_bot_span_login").click( function () {
    //     $('.data_list').each(function(){
    //         $yz=$(this).attr('yz');
    //         $val2 = $.trim($(this).val());
    //         if($val2==''){
    //             $tipText2=$(this).attr('tip');
    //             alert($tipText2+'不能为空');
    //             return false;
    //         }else{
    //             //
    //         }
    //     })
    // });

    /*开店报单*/
    //升级店铺
    $('.dialog-content').css('opacity','0');
    $('#wechat-share').click(function(){
        $('.dialog').addClass('dialog-open');
        $('.dialog-content').css('opacity','1');
    });
    $('.dialog-close').click(function(){
        $('.dialog').removeClass('dialog-open');
        $('.dialog-content').css('opacity','0');
    });
    //支付选择
    $('.dia_radio li').click(function(){
        $('.dia_radio li').find('span').removeClass('cur');
        $(this).find('span').addClass('cur');
        $('.dia_radio li').find('i').hide();
        $(this).find('i').show();
        $('.dia_radio li').find('input').attr('checked','false');
        $(this).find('input').attr('checked','true');
        //biaoji
        $(this).addClass('zhifu_cur').siblings().removeClass('zhifu_cur');
    });
    //支付默认选择
    $('.dia_radio li').eq(1).find('span').addClass('cur');
    $('.dia_radio li').eq(1).find('i').show();
    $('.dia_radio li').eq(1).find('input').attr('checked','true');
    // //确认升级
    // $('.up_zhifu a').click(function(){
    //     if($('.dia_radio li:eq(0)').hasClass('zhifu_cur')){
    //         window.location.href='open_online.html';
    //     }else{
    //         window.location.href='open_offline.html';
    //     }
    // });
    //zhifu--银行卡
    $('.zhifu1').click(function(){
        $('.zhifu1').find('span').removeClass('cur3');
        $(this).find('span').addClass('cur3');
        $('.zhifu1').find('i').hide();
        $(this).find('i').show();
        $('.zhifu1').find('input').attr('checked','false');
        $(this).find('input').attr('checked','true');
    });
    //默认选择
    $('.zhifu1').eq(0).find('span').addClass('cur3');
    $('.zhifu1').eq(0).find('i').show();
    $('.zhifu1').eq(0).find('input').attr('checked','true');
    //铺货选择
    $('.dia_puhuo li').click(function(){
        $('.dia_puhuo li').find('span').removeClass('cur');
        $(this).find('span').addClass('cur');
        $('.dia_puhuo li').find('i').hide();
        $(this).find('i').show();
        $('.dia_puhuo li').find('input').attr('checked','false');
        $(this).find('input').attr('checked','true');
        //biaoji
        $(this).addClass('zhifu_cur').siblings().removeClass('zhifu_cur');
    });
    //铺货默认选择
    $('.dia_puhuo li').eq(1).find('span').addClass('cur');
    $('.dia_puhuo li').eq(1).find('i').show();
    $('.dia_puhuo li').eq(1).find('input').attr('checked','true');

    //uu_baodan
    var uu_l=$('.uu_img_ul li').length;
    var uu_num=107+16;
    $('.uu_img_ul').width(uu_l*uu_num);
    var num=0;
    function uu_play(){
        if(!$('.uu_img_ul').is(':animated')) {
            if ($(this).hasClass('uu_img_left')) {
                num--;
                if(num==-1){
                    num=0;
                }
                $('.uu_img_ul').animate({'margin-left':-uu_num*num},1000);

            }else{
                num++;
                $('.uu_img_ul').animate({'margin-left':-uu_num*num},1000);
            }
        }
    }
    $('.uu_img_left').click(uu_play);
    $('.uu_img_right').click(uu_play);

    $('.uu_img_ul li').click(function(){
        var uu_src=$(this).find('.uu_img img').attr('src');
        $('.uu_big_img').attr('src',uu_src);
    });

    //bianma
    $('.uu-bianhao').css('opacity','0');
    $('#bianhao').click(function(){
        $('.dialog-bianhao').addClass('dialog-open');
        $('.uu-bianhao').css('opacity','1');
    });
    $('.dialog-close').click(function(){
        $('.dialog-bianhao').removeClass('dialog-open');
        $('.uu-bianhao').css('opacity','0');
    });
    //转出类型
    $('.kc_radio li').click(function(){
        $('.kc_radio li').find('span').removeClass('cur');
        $(this).find('span').addClass('cur');
        $('.kc_radio li').find('i').hide();
        $(this).find('i').show();
        $('.kc_radio li').find('input').attr('checked','false');
        $(this).find('input').attr('checked','true');
        //biaoji
        $(this).addClass('kucun_cur').siblings().removeClass('kucun_cur');
    });
    //铺货默认选择
    $('.kc_radio li').eq(1).find('span').addClass('cur');
    $('.kc_radio li').eq(1).find('i').show();
    $('.kc_radio li').eq(1).find('input').attr('checked','true');
    $('.kc_type a').click(function(){
        if($('.kc_radio li:eq(0)').hasClass('kucun_cur')){
            window.location.href='type_inner.html';
        }else{
            window.location.href='type_outer.html';
        }
    });
    /*baotuan*/
    $('.bt_ul li').eq(0).find('span').addClass('cur');
    $('.bt_ul li').eq(0).find('i').show();
    $('.bt_ul li').eq(0).find('input').attr('checked','true');
    $('.bt_ul li').click(function(){
        $('.bt_ul li').find('span').removeClass('cur');
        $(this).find('span').addClass('cur');
        $('.bt_ul li').find('i').hide();
        $(this).find('i').show();
        $('.bt_ul li').find('input').attr('checked','false');
        $(this).find('input').attr('checked','true');
    });

    $('.biaozhun a').hover(function(){
        $(this).parents('.biaozhun').find('.bz').show();
    },function(){
        $(this).parents('.biaozhun').find('.bz').hide();
    });
    //出团总人数
    function z_ipt(){
        var z_num=$('.bts .bt_box').length;
        var z_child=0;
        //开始
        for(var i=0;i<z_num;i++){
            //$('.bts .bt_box').eq(i).find('.bt_number').blur(function(){
            var zz_num=parseInt($('.bts .bt_box').eq(i).find('.bt_number').val());
            z_child+=zz_num;
            //});
        }
        //添加
        $('.bts .bt_box .bt_number').blur(function(){
            var z_child2=0;
            for(var j=0;j<z_num;j++){
                //$('.bts .bt_box').eq(i).find('.bt_number').blur(function(){
                var zz_num2=parseInt($('.bts .bt_box').eq(j).find('.bt_number').val());
                z_child2+=zz_num2;
                //});
            }
            $('.btz2').html(z_child2);
        });
        var _z_num=parseInt($('.bts .bt_box').length)+parseInt(num);
        $('.btz1').html(_z_num);
        $('.btz2').html(z_child);
    }
    z_ipt();
    //up_add();
    bt_remove();
    var x=1;
    $('.bt_add').click(function(){
        x++;
        var html='<div class="bt_box"><img class="bt_remove" src="/Public/Home/images/bt_remove.png" alt=""/><p><span class="bt_span_l">姓名</span><input type="text" name="name[]" placeholder="" class="bt_span_r"/></p><p><span class="bt_span_l">性别</span><select class="bt_select" name="sex[]"><option value="">男</option><option value="">女</option><select></p><p><span class="bt_span_l">电话（选填）</span><input type="text" name="mobile[]" placeholder="" class="bt_span_r"/></p><p><span class="bt_span_l">身份证号</span><input type="text" name="usercard[]"  placeholder="" class="bt_span_r"/></p><p><span class="bt_span_l">身份证复印件</span><input type="text"  placeholder="" class="bt_span_r"/><span class="file_upload"><input name="pic[]" type="file" id="importFile" /><a href="javaScript:;">点击上传</a></span></p><p><input type="radio" value="" class="child"/>携带儿童<input type="number" name="c_num[]" value="0" class="bt_number" min="0"/><span class="biaozhun"><a href="javaScript:;">儿童标准</a><span class="bz"><span class="bz_div">儿童标准</span><span class="bz_p">身高0.8~1.2米（含），不占床，仅含当地旅游车位，半价套餐，导服，其他不含，儿童1.2~1.5米的，请自行选择儿童票高铁票升级方案。</span> </span></span></p></div>';
        $('.bts').append(html);
        z_ipt();
        // up_add();
        $('.bt_remove').click(function(){
            $(this).parent().remove();
            x--;
            z_ipt();
        });

        //儿童人数
        $('.add').click(function(){
            var v=$(this).siblings('.count-input').val();
            console.log($(this));
            console.log(v);
            v++;
            $(this).siblings('.count-input').val(v);
            z_ipt();
            //alert(1);
        });
        $('.reduce').click(function(){
            var v=$(this).siblings('.count-input').val();
            v--;
            if(v<=0){
                v=0;
            }
            $(this).siblings('.count-input').val(v);
            z_ipt();
        });
        $('.count-input').keyup(function(){
            z_ipt();
        });
        //上传复印件
        $('.file_upload input').change(function(){
            var src=$(this).val();
            $(this).parents('p').find('.bt_span_r').val(src);
        });

        $('.biaozhun a').hover(function(){
            $(this).parents('.biaozhun').find('.bz').show();
        },function(){
            $(this).parents('.biaozhun').find('.bz').hide();
        });
    });

    //function up_add(){
        //儿童人数
        // $('.add').click(function(){
        //     var v=$(this).siblings('.count-input').val();
        //     console.log('yuanlai'+$(this));
        //     console.log('yuanlai'+v);
        //     v++;
        //     $(this).siblings('.count-input').val(v);
        //     z_ipt();
        //     //alert(1);
        // });
        // $('.reduce').click(function(){
        //     var v=$(this).siblings('.count-input').val();
        //     v--;
        //     if(v<=0){
        //         v=0;
        //     }
        //     $(this).siblings('.count-input').val(v);
        //     z_ipt();
        // });
        // $('.count-input').keyup(function(){
        //     z_ipt();
        // });
        // //上传复印件
        // $('.file_upload input').change(function(){
        //     var src=$(this).val();
        //     $(this).parents('p').find('.bt_span_r').val(src);
        // });
    //}
    function bt_remove() {
        $('.bt_remove').click(function(){
            $(this).parent().remove();
            z_ipt();
        });
    }


    //alert_bm
    $('.bm_radio li').click(function(){
        if(!$(this).hasClass('on')){
            $(this).find('span').addClass('cur');
            $(this).find('i').show();
            $(this).find('input').attr('checked',true);
            $(this).addClass('on');
        }else{
            $(this).find('span').removeClass('cur');
            $(this).find('i').hide();
            $(this).find('input').attr('checked',false);
            $(this).removeClass('on');
            $('.bm_all li span').removeClass('cur');
            $('.bm_all li i').hide();
            $('.bm_all li input').attr('checked',false);
            $('.bm_all li').removeClass('on');
        }
    });
    //bm_all
    $('.bm_all li').click(function(){
        if(!$(this).hasClass('on')){
            $(this).find('span').addClass('cur');
            $(this).find('i').show();
            $(this).find('input').attr('checked',true);
            $(this).addClass('on');
            for(var i=0;i<$('.bm_radio li').length;i++){
                $('.bm_radio li').eq(i).find('span').addClass('cur');
                $('.bm_radio li').eq(i).find('i').show();
                $('.bm_radio li').eq(i).find('input').attr('checked',true);
                $('.bm_radio li').eq(i).addClass('on');
            }
        }else{
            $(this).find('span').removeClass('cur');
            $(this).find('i').hide();
            $(this).find('input').attr('checked',false);
            $(this).removeClass('on');
            for(var i=0;i<$('.bm_radio li').length;i++){
                $('.bm_radio li').eq(i).find('span').removeClass('cur');
                $('.bm_radio li').eq(i).find('i').hide();
                $('.bm_radio li').eq(i).find('input').attr('checked',false);
                $('.bm_radio li').eq(i).removeClass('on');
            }
        }
    });
    //bm_确认
    $('.alert_bm').click(function(){
        for(var i=0;i<$('.bm_radio li').length;i++){
            if($('.bm_radio li').eq(i).find('input').is(':checked')){
                var bm_num=$('.bm_radio li').eq(i).find('em').html();
                $('.inner_tex').append(bm_num+';');
            }
        }
        $('.dialog').removeClass('dialog-open');
        $('.dialog-content').css('opacity','0');
    });
    //bm_uu
    $('.alert_bm').click(function(){
        for(var i=0;i<$('.bm_radio li').length;i++){
            if($('.bm_radio li').eq(i).find('input').is(':checked')){
                var bm_num=$('.bm_radio li').eq(i).find('em').html();
                $('.uu_number').append(bm_num+';');
            }
        }
        $('.dialog').removeClass('dialog-open');
        $('.dialog-content').css('opacity','0');
    });
    //uu
    $('.dialog-content2').css('opacity','0');
    $('#wechat-share2').click(function(){
        $('.dialog2').addClass('dialog-open');
        $('.dialog-content2').css('opacity','1');
    });
    $('.dialog-close2').click(function(){
        $('.dialog2').removeClass('dialog-open');
        $('.dialog-content2').css('opacity','0');
    });
});


