var orderIncrement = 1; //use on add seat to cart from

var isAndroid = Framework7.prototype.device.android === true;
var isIos = Framework7.prototype.device.ios === true;

Template7.global = {
    android: isAndroid,
    ios: isIos
};

var myApp = new Framework7({
  init: true,
  pushState: true,
  swipePanel: 'left',
  precompileTemplates: false,
  modalTitle: '私享荟',
  modalButtonOk: '好的',
  modalButtonCancel: '取消',
  modalPreloaderTitle: '加载中...',
  // Enable Template7 pages
  //template7Pages: true
});

if(isAndroid){
  myApp.material = true //enable Material theme
}

var $$ = Dom7;

var mainView = myApp.addView('.view-main', {
  dynamicNavbar: true
})

//- 默认隐藏toolbar, 只在需要的页面显示
console.log('hidden toolbar');
//mainView.hideToolbar();

// Probably should be removed on a production/local app
$$(document).on('ajaxStart', function (e) {
  myApp.showIndicator();
});
$$(document).on('ajaxComplete', function () {
  myApp.hideIndicator();
});

//- 加载模版
var myDataCache = {}
myApp.apply_template = function(url, context, callback) {
  var template;
  template = myApp.templates[url];
  if (template) {
    return callback(template(context));
  }
  myApp.showIndicator();
  return $$.ajax({
    url: url,
    success: function(html) {
      template = Template7.compile(html);
      myApp.templates[url] = template;
      return callback(template(context));
    },
    error: function(xhr) {
      return myApp.alert('无法读取模版!');
    },
    complete: function(xhr) {
      return myApp.hideIndicator();
    }
  });
};

 
// 3 Slides Per View, 10px Between
var mySwiper3 = myApp.swiper('.swiper-3', {
  pagination:'.swiper-3 .swiper-pagination',
  spaceBetween: 10,
  slidesPerView: 3
});

//agent follower         
var mySwiper3 = myApp.swiper('.swiper-follower', {
  pagination:'.swiper-follower .swiper-pagination',
  spaceBetween: 10,
  slidesPerView: 6
});     

//- Share Click
$$('.share-btn').on('click', function (e) {
  var target = this;
  var buttons1 = [
    {
      label: true,
      text: '分享'
    },
    {
      text: '微信',
      bg: '#ffcc00',
      onClick: function () {
          myApp.alert('Button1 clicked');
      }
    },
    {
      text: '微博',
      onClick: function () {
          myApp.alert('Button2 clicked');
      }
    }
  ];

  var buttons2 = [
    {
      text: '取消',
      color: 'red'
    },
  ];
  var groups = [buttons1, buttons2];
  myApp.actions(target, groups);
});   


//- Send Notification
var flashNotice = $$("#flash-notice");
if(flashNotice.length == 1){
  myApp.addNotification({
    title: flashNotice.data('msg'),
    // subtitle: 'Notification subtitle',
    // message: flashNotice.data('msg'),
    media: isAndroid ? '<a href="#" class="close-notification"><i class="fa fa-close"></i></a>' : '<i class="fa fa-user fa-lg"></i>'
  });

}

//- Check Mobile Form
function validate_mobile(mobile){
  if(!(/^1[3|4|5|7|8][0-9]\d{8}$/.test(mobile))){ 
    myApp.alert("手机号码有误，请重新输入"); 
    return false; 
  }
  return true;
}

//- wap pay 
function wap_pay(channel) {
    myApp.showIndicator();
    var amount = $$("#order_price").val();

    var pay_url = $$("#payment_url").val();

    var xhr = new XMLHttpRequest();
    xhr.open("POST", pay_url, true);
    xhr.setRequestHeader("Content-type", "application/json");
    xhr.send(JSON.stringify({
      channel: channel,
      app_id: $$('#app_id').val(),                     //该应用在ping++的应用ID
      user_order_id: $$('#user_order_id').val(),   
      order_no: $$('#order_no').val(),                 //订单在商户系统中的订单号
      amount: amount,                //订单价格，单位：人民币 分
      subject: $$('#subject').val(),
      body: $$('#body').val(),
      charge_url: $$('#payment_url').val(),   //商户服务端创建订单的url
      charge_param: {a:1,b:2},                 //(可选，用户自定义参数，若存在自定义参数则壹收款会通过 POST 方法透传给 charge_url)
      open_id: $$('#openid').val()                        //(可选，使用微信公众号支付时必须传入)
    }));

    xhr.onreadystatechange = function () {
      if (xhr.readyState == 4 && xhr.status == 200) {
        
        json_data = JSON.parse(xhr.responseText);

        window.res = json_data;
        console.log('on success: ');
        console.log(xhr.responseText);

        var callback = function(result, err){
          console.log(result);
          console.log(err);
          if (result == "success") {
            // 只有微信公众账号 wx_pub 支付成功的结果会在这里返回，其他的 wap 支付结果都是在 extra 中对应的 URL 跳转。
            myApp.alert("支付成功！进入［我的订单］查看电子票！");
            location.href = "#!/user_orders";
          } else if (result == "fail") {
            myApp.alert("支付时遇到了错误，请选择其他支付方式！");
            // charge 不正确或者微信公众账号支付失败时会在此处返回
          } else if (result == "cancel") {
            myApp.alert("请再次在［我的订单］中调起支付");
            // 微信公众账号支付取消支付
          }
        }
        pingpp.createPayment(json_data['charge'], callback, json_data['signature'], false);
        //pingpp.createPayment(json_data['charge'], callback);
      }
    }
  myApp.hideIndicator();
}

// app_pay 需要配合 example-webview 的 iOS 或者 Android 项目使用。
function app_pay(channel) {
    var amount = $$("#order_price").val();
    if (typeof PINGPP_IOS_SDK !== 'undefined') {
        PINGPP_IOS_SDK.callPay(channel, amount);
    } else if (typeof PINGPP_ANDROID_SDK !== 'undefined') {
        PINGPP_ANDROID_SDK.callPay(channel, amount);
    }
}

// Option 1. Using one 'pageInit' handler for all pages (recommended way):
$$(document).on('pageInit', function (e) {
  // Page Data contains all required information about loaded and initialized page 
  var page = e.detail.page;
  console.log('in app init ' + page.name);
  if(page.name == 'user-order-pay'){
    $$('#pay').on('click', function(){
      pingpp_one.init({
          app_id: $$('#app_id').val(),                     //该应用在ping++的应用ID
          order_no: $$('#order_no').val(),                 //订单在商户系统中的订单号
          user_order_id: $$('#user_order_id').val(), 
          amount: $$('#order_price').val(),                //订单价格，单位：人民币 分
          // 壹收款页面上需要展示的渠道，数组，数组顺序即页面展示出的渠道的顺序
          // upmp_wap 渠道在微信内部无法使用，若用户未安装银联手机支付控件，则无法调起支付
          channel: ['wx','wx_pub','alipay_wap','alipay','upacp_wap','jdpay_wap','bfb_wap'],
          charge_url: $$('#payment_url').val(),   //商户服务端创建订单的url
          charge_param: {a:1,b:2},              //(可选，用户自定义参数，若存在自定义参数则壹收款会通过 POST 方法透传给 charge_url)
          open_id: $$('#openid').val(),         //(可选，使用微信公众号支付时必须传入)
        },function(res){
          if(!res.status){
            //处理错误
            alert(res.msg);
          }
          else{
              //若微信公众号渠道需要使用壹收款的支付成功页面，则在这里进行成功回调，调用 pingpp_one.success 方法，你也可以自己定义回调函数
              //其他渠道的处理方法请见第 2 节
              pingpp_one.success(function(res){
                if(!res.status){
                  alert(res.msg);
                }
              },function(){
                //这里处理支付成功页面点击“继续购物”按钮触发的方法，例如：若你需要点击“继续购物”按钮跳转到你的购买页，则在该方法内写入 window.location.href = "你的购买页面 url"
                window.location.href= $$('#order_url').val();//示例
              });
          }
      });
    });
  }

})

console.log('app inited!');

//再一次加载当前页面
//mainView.router.reloadPage('/');

//myApp.init();