<template>
  <li class="black-classify">
    <!-- li heder search -->
    <div class="search">
      <div class="input-group">
        <input class="form-control" placeholder="searching this list....">
        <span class="input-group-addon"><i class="fa fa-search"></i></span>
      </div>
    </div>
    <!-- list body -->
    <div class="list-body table-responsiev">
      <ul class="list-unstyled">
        <transition-group name="transition-list">
          <li class="column" :data-id="catalog.id" :key="catalog.id" v-for="catalog in catalogs" v-on:mouseenter="mouseEnters($event)" v-on:mouseleave="mouseLeaves($event)">
            <div class="col-xs-9" @click="choosed(catalog)">
              <i class="fa fa-circle text-info m-r-10 small"></i>{{catalog.name}}
            </div>
            <div class="col-xs-3 text-center text-success handle hidden">
              <span data-target=".modal-form" data-toggle="modal" @click="openModal('edit', catalog)">
                <i class="fa fa-edit"></i>
              </span>
              <span v-on:click="removeData(catalog)">
                <i class="fa fa-remove"></i>
              </span>
            </div>
          </li>
        </transition-group>
      </ul>
    </div>
    <!-- li footer -->
    <div class="classify-footer">
      <span class="btn-link btn-sm pull-right" data-target=".modal-form" data-toggle="modal" @click="openModal('new', catalog)">
        <i class="fa fa-plus-square m-r-5"></i>新增
      </span>
    </div>
  </li>
</template>
<script>
export default {
  props: {
    catalogs: { type: Array, required: true },
    depth: { type: Number, required: true, default: 0}
  },
  methods: {
    choosed (catalog) {
      this.$emit('choosed', catalog, this.depth);
    },
    mouseEnters (e) {

    },
    mouseLeaves (e) {

    },
    openModal (action, catalog) {

    },
    removeData (catalog) {

    }
  }
}
</script>

<style scoped>
/*.cl {
  position: absolute;
  top: 10px;
  left: 10px;
}*/

.black-classify .search{
  border: 1px solid #ccc;
}
.black-classify .search .input-group-addon{
  cursor: pointer;
}
.black-classify .search input,.search span{
  border-radius: 0;
  border: none;
  height: 35px;
}
.black-classify .list-body{
  height: 355px;
  width: 100%;
  border: 1px solid #ccc;
  border-top: none;
  overflow: auto;
  position: relative;
}
/*.black-classify .loading-animation{
  width: 80px;
  height: 80px;
  position: absolute;
  left: 110px;
  top: 120px;
  color: #868686;
}
.black-classify .loading-animation i.fa-spinner{
  animation: rotation 1s linear infinite;
}*/
.black-classify .list-body ul.list-unstyled .active{
  background: #d7dde0
}
.black-classify .list-body ul.list-unstyled li{
  height: 35px;
  line-height: 35px;
  padding-left: 10px;
  overflow: hidden;
}
.black-classify .list-body ul.list-unstyled li:hover{
  cursor: pointer;
  background: #e9e9e9;
}
.black-classify .list-body ul.list-unstyled li div{
  padding: 0px;
}
.black-classify .list-body ul.list-unstyled li .col-xs-9{
  font-weight: bold;
  overflow: hidden;
  white-space: nowrap;
  text-overflow: ellipsis;
}
.black-classify .list-body ul.list-unstyled li .col-xs-3 sapn{
  float: left;
}
.black-classify .list-body ul.list-unstyled li .col-xs-3 i{
  margin: 0px 10px;
}
.black-classify .list-body ul.list-unstyled li .col-xs-3 i:hover{
  color: red;
}
.black-classify .classify-footer{
  height: 30px;
  line-height: 30px;
  border: 1px solid #ccc;
  border-top: none;
}
.black-classify .btn-link{
  cursor: pointer;
}

</style>
