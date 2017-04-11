<template>
  <f7-page>
    <div class="navbar">
      <div class="navbar-inner">
        <div class="left sliding">
          <a href="/" class="link icon-only back"><i class="fa fa-chevron-left"></i></a>
        </div>
        <div class="center">美客美美容师</div>
        <div class="right">
          <a href="#" class="open-panel link icon-only"><i class="icon icon-bars"></i></a>
        </div>
      </div>
    </div>

    <div class="page-content hide-bars-on-scroll">
      <div class="prductlist content-block">
        <div class="row">
          <div class="card tablet-50" v-for="staff in staffs">
            <div class="card-content"> 
              <div class="banner productblock">
                <f7-link :href="'/staffs/' + staff.id" v-for="images in staff.images">
                  <img :src="images.image_url" :alt="images.title" class="col-100" />
                </f7-link>
                <a class="cartfloating floating-button" :href="'/staffs/' + staff.id"><i class="fa fa-magic"></i></a>
              </div>
              <div class="content-block productdata">
                <h2 class="maintitle col-100">美容师：{{staff.title}}</h2>
                <div class="item-subtitle star color-amber ">
                  <i class="fa fa-star" v-for="star in staff.sco"></i>
                </div>
                <p class="col-100">
                  <span>年龄：{{staff.age}}岁</span>
                  <span>工作年限：{{staff.work_years}}年</span>
                </p>
                <p class="col-100">擅长领域：{{staff.pro}}</p>
                <div class="clear"></div>
              </div>
              <div class="clear"></div>
            </div>
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
