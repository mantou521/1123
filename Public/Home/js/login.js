// JavaScript Document
$(document).ready(function () {
    //创建一个*
    $(".a1").each(function () {

        var hdw = $("<strong class='reda'></strong>");

        $(this).parent().append(hdw);

    });
    //end

    $(".uu_tijiao :input").blur(function(){

        $(this).parent().find(".a2").remove();

        //判断 银行卡帐号
        if ($(this).is("#hao")) {
            if (this.value == "") {

                var hdw1 = $("<span class='a2 error'></span>");
                $(this).parent().append(hdw1);
                $(this).val('');
                $(this).attr('placeholder','银行卡帐号不能为空');
                $(this).css('border-color','#0066cc');

            } else {

                var hdw1 = $("<span class='a2 righta'></span>");
                $(this).parent().append(hdw1);
            }

        }
        //end

        //判断 姓名
        if ($(this).is("#name")) {
            if (this.value == "") {

                var hdw1 = $("<span class='a2 error'></span>");
                $(this).parent().append(hdw1);
                $(this).val('');
                $(this).attr('placeholder','姓名不能为空');
                $(this).css('border-color','#0066cc');

            } else {

                var hdw1 = $("<span class='a2 righta'></span>");
                $(this).parent().append(hdw1);
            }

        }
        //end

        //判断 身份证号
        if ($(this).is("#idcard")) {
            var reg2 = /^(\d{15}$|^\d{18}$|^\d{17}(\d|X|x))$/
            if (this.value != "" && reg2.test(this.value)) {

                var hdw1 = $("<span class='a2 righta'></span>");
                $(this).parent().append(hdw1);

            } else {
                var hdw1 = $("<span class='a2 error'></span>");
                $(this).parent().append(hdw1);
                $(this).val('');
                $(this).attr('placeholder','请输入正确的身份证号');
                $(this).css('border-color','#0066cc');

            }
        }
        //end

        //判断 联系方式
        if ($(this).is("#card")) {
            var reg3 = /^[1][3578][0-9]{9}$/;
            if (this.value != "" && reg3.test(this.value)) {

                var hdw1 = $("<span class='a2 righta'></span>");
                $(this).parent().append(hdw1);

            } else {
                var hdw1 = $("<span class='a2 error'></span>");
                $(this).parent().append(hdw1);
                $(this).val('');
                $(this).attr('placeholder','请输入正确的手机号');
                $(this).css('border-color','#0066cc');

            }
        }
        //end

        //判断 家庭住址
        if ($(this).is("#phone")) {
            if (this.value == "") {

                var hdw1 = $("<span class='a2 error'></span>");
                $(this).parent().append(hdw1);
                $(this).val('');
                $(this).attr('placeholder','家庭住址不能为空');
                $(this).css('border-color','#0066cc');

            } else {

                var hdw1 = $("<span class='a2 righta'></span>");
                $(this).parent().append(hdw1);
            }

        }
        //end

        //判断 邮编
        if ($(this).is("#youbian")) {
            var reg4 = /[1-9]\d{5}(?!\d)/;
            if (this.value != "" && reg4.test(this.value)) {

                var hdw1 = $("<span class='a2 righta'></span>");
                $(this).parent().append(hdw1);

            } else {
                var hdw1 = $("<span class='a2 error'></span>");
                $(this).parent().append(hdw1);
                $(this).val('');
                $(this).attr('placeholder','请输入正确的邮编');
                $(this).css('border-color','#0066cc');

            }
        }
        //end

    });
    //blur  end


//提交
    $("#send").click(function () {

        $(".uu_tijiao :input").trigger("blur");
        var hdw3 = $(".error").length;

        if (hdw3) {

            return false;

        }

        alert("注册成功");

    });
    //end 

});

