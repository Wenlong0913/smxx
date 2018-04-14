// 天气预报
$(document).ready(function(){
  var request_city = "成都";
  // 去掉天气的中文
  var reg = /[\u4E00-\u9FA5]/g
  $.get("http://wthrcdn.etouch.cn/weather_mini?city=" + request_city,function(data,status){
    var res_data = JSON.parse(data);
    // 今天的天气数据
    var today_weather = res_data.data.forecast[0];
    // 明天的天气数据
    var tomorrow_weather = res_data.data.forecast[1];
    // 请求城市
    $(".request_city").text(request_city);
    // 今天日期
    // $("#today_weather_date").text(today_weather.date);
    // 今天最高温度
    $("#today_weather_high").text(today_weather.high.toString().replace(reg,''));
    // 今天最低温度
    $("#today_weather_low").text(today_weather.low.toString().replace(reg,''));
    // 今天天气类型
    $("#today_weather_type").text(today_weather.type);
    // 今天天气风力
    $("#today_weather_fengli").text(today_weather.fengli);
    // 今天天气风向
    $("#today_weather_fengxiang").text(today_weather.fengxiang);
    // 明天日期
    // $("#tomorrow_weather_date").text(tomorrow_weather.date);
    // 明天最高温度
    $("#tomorrow_weather_high").text(tomorrow_weather.high.toString().replace(reg,''));
    // 明天最低温度
    $("#tomorrow_weather_low").text(tomorrow_weather.low.toString().replace(reg,''));
  });
});

// 表单验证
function submit_form(){
  if ($('#one').val() == ""){
    $("#one_faild").attr("class","faild-text");
    $('#one_faild').text("请输入您的姓名 *");
    $('#one').focus();
  }else if($('#two').val() == ""){
    $("#two_faild").attr("class","faild-text");
    $('#two_faild').text("请输入您的电话号码 *");
    $('#two').focus();
  }else if(!$("#two").val().match(/^1[34578]\d{9}$/)){
    $("#two_faild").attr("class","faild-text");
    $('#two_faild').text("请输入有效的11位电话号码 *");
    $('#two').focus();
  }else if($('#three').val() == ""){
    $("#three_faild").attr("class","faild-text");
    $('#three_faild').text("请输入您入驻名称 *");
    $('#three').focus();
  }else if($('#five').val() == ""){
    $("#five_faild").attr("class","faild-text");
    $('#five_faild').text("请输入您入驻地址 *");
    $('#five').focus();
  }else if($('#six').val() == ""){
    $("#six_faild").attr("class","faild-text");
    $('#six_faild').text("请输入您的邮箱 *");
    $('#six').focus();
  }else {
    $('.simple_form').submit();
  }
};