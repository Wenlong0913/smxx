<template>
  <div data-page="staffping_category" class="page navbar-fixed" >
    <div class="navbar">
      <div class="navbar-inner">
        <div class="left sliding"><a href="/f7-theme/max_solaris/home.html" class="back link"><i class="icon icon-back"></i></a></div>
        <div class="center ">美容师 </div>
          <div class="right"><a href="#" class="open-panel link icon-only"><i class="icon icon-bars"></i></a></div>
      </div>
    </div>
    <div class="page-content hide-bars-on-scroll">
      <div class="prductlist category ">
          <div class="row" v-for="item in staffs">
            <div class="card col-100 tablet-50">
                <f7-link :href="'/staffs/' + item.id" class="card-content">
                    <div class="content-block productdata ">
                        <h2 class="maintitle col-100 ">{{item.title}}</h2>
                        <p class="col-100">{{item.description}}</p>
                        <div class="clear"></div>
                    </div>
                    <div class="clear"></div>
                </f7-link>
                <img :src="item.images[0].image_url" :alt="item.title" class="categoryimg">
            </div>
          </div>
      </div>
      <hr>
      <div class="content-block">
              <h2 class="center">We are at social</h2>
              <p class="center">Get connected with us on social</p>
              <ul class="socials">
                  <li><a href="" class="fb"><i class="fa fa-facebook"></i></a></li>
                  <li><a href="" class="tw"><i class="fa fa-twitter"></i></a></li>
                  <li><a href="" class="gp"><i class="fa fa-google-plus"></i></a></li>
                  <li><a href="" class="pin"><i class="fa fa-pinterest"></i></a></li>
                  <li><a href="" class="env"><i class="fa fa-envelope"></i></a></li>
              </ul>
        </div>
        <hr>
        <div class="content-block  center">
            <span class="">Copyright 2016. All Rights Reserved. </span>
        </div>
    </div>
  </div>
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
