$(document).ready ->
  body = $('body.admin-sessions.new')
  if body.length > 0
    container = body.find('.weixin-login')
    if container.length > 0
      console.log(container[0])
      sessionUrl = container[0].dataset["sessionUrl"]
      verifyUrl = container[0].dataset["verifyUrl"]
      qrcodeImgUrl = container[0].dataset["qrcodeImgUrl"]
      weixin = new Vue
        el: container[0],
        data:
          showModal: false
          weixinQrcode: ''
          token: ''
          timeoutSec: 120
          showImage: false
          timer: null
          stopLogin: false
        computed:
          message: ()->
            if this.timeoutSec <= 0
              this.message = '登录超时，请关闭重试!'
            else
              this.message = '请在'+this.timeoutSec+'内打开微信扫一扫!'
        watch:
          showModal: (val)->
            if val
              this.loadQrcode()
            else
              this.close()
        methods:
          loadQrcode: ()->
            vm = this
            vm.$http.get(sessionUrl).then((response)->
              vm.token = response.body.token
              vm.timeoutSec = response.body.timeout_sec
              vm.weixinQrcode = qrcodeImgUrl+'?token='+vm.token
              vm.showImage = true
              vm.startTimer()
              vm.checkTokenLogin()
            ,(response)->

            )
          close: ()->
            vm = this
            vm.stopLogin = true
            clearTimeout(vm.timer)
          checkTokenLogin: ()->
            vm = this
            vm.$http.post(verifyUrl, token: vm.token).then((response)->
              json = response.body
              console.log(json)
              if json['status'] == 'ok'
                vm.message = '登录成功，正在转到访问页面...'
                setTimeout(()-> 
                  window.location.href = json["url"]
                , 1500);
              else
                if vm.stopLogin == false
                  window.setTimeout(vm.checkTokenLogin, 3000);
            ,(response)->

            )
          startTimer: ()->
            vm = this
            if vm.timeoutSec >= 0
              vm.timeoutSec--
              vm.timer = setTimeout(()->
                vm.startTimer()
              , 1000)
            else
              vm.stopLogin = true

            