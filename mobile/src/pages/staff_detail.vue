<template>
  <f7-page>
    <div class="navbar">
      <div class="navbar-inner">
        <div class="left sliding">
          <a href="/" class="link icon-only back"><i class="fa fa-chevron-left"></i></a>
        </div>
        <div class="center">{{staff.title}} | 美容师</div>
        <div class="right">
          <a href="#" class="open-panel link icon-only"><i class="icon icon-bars"></i></a>
        </div>
      </div>
    </div>

    <div class="page-content">
      <div class="item-content userprofile" :style="'background: url('+headshot+') no-repeat center;'">
        <div class="item-inner">
          <div class="item-title-row">
            <div class="item-title">{{staff.title}} | 美容师</div>
          </div>
          <div class="star color-amber ">
            <i class="fa fa-star" v-for="star in staff.sco"></i>
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
              <div class="col-33 profiles">
                <div class="color-amber">{{staff.week_service}}</div>
              </div>
              <div class="col-33 profiles">
                <div class="color-amber">{{staff.total_service}}</div>
              </div>
              <div class="col-33 profiles">
                <div class="color-amber">{{staff.score}}</div>
              </div>
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
          <div class="content-block">
            <div class="row">
              <p v-html="staff.content"></p>
            </div>
          </div>
        </div>

        <div id="tab3" class="tab">
          <div class="list-block media-list comment">
            <ul class="comment">
              <li v-for="c in comments">
                <div class="item-link item-content">
                  <div class="item-media">
                    <img src="./../assets/img/comment_dude.svg" style="border-radius:100%" width="40" height="40" alt="">
                  </div>
                  <div class="item-inner">
                    <div class="item-title-row">
                      <div class="item-title author-comment">{{c.name}}</div>
                    </div>
                    <div class="time">{{c.time}}前</div>
                    <div class="comment" style="font-size: 13px;">{{c.content}}</div>
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
        headshot: null,
        comments: [
          {
            name: '匿名用户',
            time: '2分钟',
            content: '哈哈，又发现了一个手法不错的妹子，而且还住这么近，真是太好了，妹子按得很仔细，还讲解了很多养生的小知识，已办套餐'
          },
          {
            name: '匿名用户',
            time: '12分钟',
            content: '做完之后感觉皮肤都白些了。还免费帮我修了杂乱的眉毛。超级感谢'
          },
          {
            name: '匿名用户',
            time: '32分钟',
            content: '很不错的美容师，细节做得也很到位，超出期待！'
          },
          {
            name: '匿名用户',
            time: '1小时',
            content: '太好了，实在太舒服，谁做谁知道。太好了，实在太舒服，谁做谁知道。太好了，实在太舒服，谁做谁知道。'
          }
        ]
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