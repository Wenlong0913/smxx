<template>
  <f7-page>
    <div class="navbar">
      <div class="navbar-inner">
        <div class="left sliding">
          <a href="/" class="back link"><i class="icon icon-back"></i></a>
        </div>
        <div class="center">信息中心</div>
        <div class="right">
          <a href="#" class="open-panel link icon-only"><i class="icon icon-bars"></i></a>
        </div>
      </div>
    </div>

    <div class="page-content hide-bars-on-scroll">
      <div class="list-block media-list">
        <ul>
          <li class="item-content" v-for="info in informations">
            <div class="item-media">
              <f7-link href="#">
                <img src="./../assets/img/comingsoon.png" alt="" width="80" height="80" />
              </f7-link>
            </div>
            <div class="item-inner">
              <div class="item-title-row">
                <div class="item-title">
                  <h3 style="text-align: left;height: 10px;">{{info.title}}</h3>
                  <p>{{info.description}}</p>
                </div>
              </div>
            </div>
          </li>
        </ul>
      </div>
    </div>
  </f7-page>
</template>

<script>
export default {
  data () {
    return {
      informations: [
        {
          title: '系统消息',
          description: '您的积分增加了8分！！点击查看'
        },
        {
          title: '促销消息',
          description: '您已获得[美甲免单机会]资格！！点击查看'
        },
        {
          title: '通知消息',
          description: '亲，您购物车中的「免费美甲」即将到期！！请查看'
        }
      ]
    }
  }
}
</script>
