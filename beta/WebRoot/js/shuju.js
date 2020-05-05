
$(document).ready(function () {
    //头部二级列表显示
    $(".zongshu_tou_liebiao_nei").click(function () {
        if ($(".zongshu_tou_liebiaoer").css("display")=="none"){
            $(".zongshu_tou_liebiaoer").show();
        }else {
            $(".zongshu_tou_liebiaoer").hide();
        }
    })
    var a="";
    var num;
    for (var i=0; i<$(".zongshu_tou_liebiaoer").children().length; i++){
        //头部二级列表背景颜色
        $(".zongshu_tou_liebiaoer").children(i).mouseover(function () {
            $(this).css({
                color:"red"
            })
        })
        $(".zongshu_tou_liebiaoer").children(i).mouseout(function () {
            $(this).css({
                color:"black"
            })
        })
        //更换一级列表文字
        $(".zongshu_tou_liebiaoer").children(i).click(function () {
            a =$(this).text();
            $(".zongshu_tou_liebiao_nei").children()[0].innerHTML=a;
            //更换内容
            num=$(this).index();
            if (num==0){
                $(".zongshu_neirong").css({
                    display:"block"
                })
                $(".zongshu_neirong2").css({
                    display:"none"
                })
                $(".quanguo_neirong").css({
                    display:"block"
                })
                $("#shengji_neirong").css({
                    display:"none"
                })
            }else {
                $(".zongshu_neirong").css({
                    display:"none"
                })
                $(".zongshu_neirong2").css({
                    display:"block"
                })
                $(".quanguo_neirong").css({
                    display:"none"
                })
                $("#shengji_neirong").css({
                    display:"dlock"
                })
                $("#shengji_neirong").removeClass('shengji_neirong2');
            }
        })

    }
    //数据说明隐藏显示
    //显示
    $(".shujushuoming").click(function () {
        $(".shuju_box").css({
            display:"block"
        })
    })
    //隐藏
    $(".chahao").click(function () {
        $(".shuju_box").css({
            display: "none"
        })
    })
    //固定顶端标签
    $(document).scroll(function () {
        if ($(document).scrollTop()==836||$(document).scrollTop()<836){
            $(".xuanfuliebiao_box").css({
                display:"none"
            })
        }else {
            $(".xuanfuliebiao_box").css({
                display:"block"
            })
        }
    })
    var a=$(document).scrollTop();
    //

})
