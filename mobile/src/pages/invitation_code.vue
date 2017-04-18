<template>
  <f7-page>
    <div class="navbar">
      <div class="navbar-inner">
        <div class="left sliding"><a href="" class="back link"><i class="icon icon-back"></i></a></div>
        <div class="center">美客美邀请码</div>
        <div class="right">
          <a href="#" class="open-panel link icon-only"><i class="icon icon-bars"></i></a>
        </div>
      </div>
    </div>

    <div class="page-content close-picker" style="margin-top: 10px;">
      <div class="item-content text-center">
        <div class="item-media">
          <img src="./../assets/img/gift-box.svg" alt="" width="80" height="70" >
        </div>
        <f7-list form>
          <f7-list-item>
            <f7-input type="text" placeholder="请输入您获得的邀请码"></f7-input>
          </f7-list-item>
        </f7-list>
        <div class="row">
          <button class="button-fill button col-100"> 立 即 使 用 </button>
        </div>
        <p class="text-center">邀请码使用规则</p>
        <p class="text-center">输入您的邀请码，可立即获得一份超值大礼包。</p>
      </div>
      <hr>
      <div class="item-content text-center">
        <div class="item-media">
          <img src="./../assets/img/flower.svg" alt="" width="80" height="70" >
          <div class="item-title">
            您的邀请码：231R3FD
          </div>
        </div>
        <div class="row">
          <a href="#" data-picker=".picker-1" class=" open-picker button-fill button col-100"> 立 即 分 享 </a>
        </div>
        <p class="text-center">邀请码分享规则</p>
        <p class="text-center">分享您的邀请码，通过您的邀请码注册成功，您可立即获得一份超值大礼包。</p>
      </div>

      <div class="picker-modal picker-1">
        <div class="toolbar">
          <div class="toolbar-inner row">
            <div class="left col-33"></div>
            <div class="center col-33">分 享</div>
            <div class="right col-33"><a href="#" class="close-picker button button-sm button-raised">取  消  </a></div>
          </div>
        </div>
        <div class="picker-modal-inner">
          <div class="content-block">
            <ul class="socials row">
              <li class="col-25">
                <a href="" class="fb"><i class="fa fa-bluetooth"></i>
                </a>
              </li>
              <li class="col-25">
                <a href="" class="tw"><i class="fa fa-qq"></i></a>
              </li>
              <li class="col-25"><a href="" class="gp"><i class="fa fa-weixin"></i></a>
              </li>
              <li class="col-25"><a href="" class="pin"><i class="fa fa-weibo"></i></a>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </f7-page>
</template>

<script>
  export default {}
</script>