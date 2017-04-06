<template>
  <f7-page>
    <div class="navbar">
      <div class="navbar-inner">
        <div class="left sliding">
          <a href="/" class="link icon-only back"><i class="fa fa-chevron-left"></i></a>
        </div>
        <div class="center ">美客美美容师</div>
        <div class="right">
          <a href="#" class="open-panel link icon-only"><i class="icon icon-bars"></i></a>
        </div>
      </div>
    </div>

    <div class="page-content hide-bars-on-scroll">
      <div class="list-block media-list">
        <ul>
          <li class="item-content" v-for="staff in staffs">
            <div class="item-media">
              <f7-link :href="'/staffs/' + staff.id" v-for="images in staff.images">
                <img :src="images.image_url" :alt="images.title" width="80" height="80" />
              </f7-link>
            </div>
            <div class="item-inner">
              <div class="item-subtitle">
                <f7-link :href="'/staffs/' + staff.id">
                  <span>姓名：{{staff.title}}</span>
                </f7-link>
              </div>
              <div class="item-title-row">
                <div class="item-title">
                  <span>年龄：{{staff.age}}</span>
                  <span>工作年限：{{staff.work_years}}</span>
                </div>
              </div>
              <div class="item-title-row">
                <div class="item-title">个人介绍：{{staff.description}}</div>
              </div>
            </div>
          </li>
        </ul>
      </div>
    </div>
  </f7-page>
</template>

<script>
import Staff from 'services/staff'
export default {
  data () {
    return {
      staffs: []
    }
  },
  mounted: function () {
    var _this = this
    Staff.list().then(function (response) {
      _this.staffs = response.data
    })
  }
}
</script>
