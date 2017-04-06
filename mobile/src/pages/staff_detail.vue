<template>
  <f7-page>
    <div class="navbar">
      <div class="navbar-inner">
        <div class="left sliding"><a href="" class="back link"><i class="icon icon-back"></i></a></div>
        <div class="center">美容师详情</div>
      </div>
    </div>

    <div class="page-content">
      <div class="item-content userprofile">
        <div class="item-media">
          <img :src='headshot' :alt="staff.title" width="80" height="70" >
        </div>
        <div class="item-inner">
          <div class="item-title-row">
            <div class="item-title">{{staff.title}} | 美容师</div>
            <div>
              <i class="fa fa-star" v-for="s in staff.sco"></i>
            </div>
          </div>
        </div>
      </div>

      <div class="toolbar tabbar" style="top: 0;">
        <div class="toolbar-inner">
          <a href="#tab1" class="tab-link active button">个人主页</a>
          <a href="#tab2" class="tab-link button">工作经历</a>
          <a href="#tab3" class="tab-link button">顾客评价</a>
        </div>
      </div>

      <div class="tabs">
        <div id="tab1" class="tab active">
          <div class="content-block text-center">
            <div class="row profiles">
              <div class="col-33 profiles" style="color: #ff9500;">{{staff.week_service}}</div>
              <div class="col-33 profiles" style="color: #ff9500;">{{staff.total_service}}</div>
              <div class="col-33 profiles" style="color: #ff9500;">{{staff.score}}</div>
            </div>
            <div class="row profile stats">
              <div class="col-33 profile stats">周服务数</div>
              <div class="col-33 profile stats">总服务数</div>
              <div class="col-33 profile stats">总评分</div>
            </div>
          </div>

          <hr>
          <div class="list-block media-list">
            <ul>
              <li class="item-content">
                <div class="item-media">年龄：</div>
                <div class="item-inner">{{staff.age}}岁</div>
              </li>
              <li class="item-content">
                <div class="item-media">工作年限：</div>
                <div class="item-inner">{{staff.work_years}}年</div>
              </li>
              <li class="item-content">
                <div class="item-media">擅长领域：</div>
                <div class="item-inner">{{staff.pro}}</div>
              </li>
              <li class="item-content">
                <div class="item-media">个人介绍：</div>
                <div class="item-inner">{{staff.description}}</div>
              </li>
            </ul>
          </div>

          <hr>
          <div class="prductlist content-block">
            <p>证书认证：</p>
            <div class="row">
              <div class="card col-50" v-for="images in staff.images">
                <div class="card-content">
                  <div class="banner productblock">
                    <img :src="images.image_url" class="col-100" alt="">
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div id="tab2" class="tab">
          <div class="prductlist content-block">
            <div class="row">
              <p v-html="staff.content"></p>
            </div>
          </div>
        </div>

        <div id="tab3" class="tab">
          <div class="list-block media-list comment">
            <ul class="comment">
              <li>
                <div class="item-link item-content">
                  <div class="item-media">
                    <img src="./../assets/img/pic1.png" style="border-radius:100%" width="40" height="40" alt="">
                  </div>
                  <div class="item-inner">
                    <div class="item-title-row">
                      <div class="item-title author-comment">匿名用户</div>
                    </div>
                    <div class="time">28分钟前</div>
                    <div class="item-text comment">朋友推荐的向利君技师，真的很喜欢，手法服务都是一流的，真没想到这个价钱能享受到这种服务！</div>
                  </div>
                </div>
              </li>
            </ul>
          </div>
          <hr>
          <div class="list-block ">
            <ul class="message-comment">
              <li class="align-top">
                <div class="item-content">
                  <div class="item-inner">
                    <div class="item-input">
                      <textarea placeholder="请在这里写下您的评价"></textarea>
                    </div>
                  </div>
                </div>
              </li>
              <li class="content-block">
                <a href="#" class="button button-fill">提交评价</a>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </f7-page>
</template>

<script>
  import Staff from 'services/staff'
  export default {
    data () {
      return {
        staff: {images: []},
        headshot: null
      }
    },
    mounted: function () {
      var _this = this
      Staff.get(_this.$route.params.id).then(function (response) {
        _this.headshot = response.data.images[0].image_url
        if (_this.headshot === null) {
          _this.headshot = 'placeholder.jpg'
        }
        _this.staff = response.data
      })
    }
  }
</script>