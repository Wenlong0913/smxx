<template>
  <div class="panel panel-default" v-if="catalogPanelShow" v-bind:class="{ 'catalog-fixed': catalogFixed }">
    <!-- panel head -->
    <div class="panel-heading">
      <div class="panel-heading-btn">
        <div v-if="catalogFixed" >
          <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-danger" @click="closePanel">
            <i class="fa fa-close"></i>
          </a>
        </div>
        <div v-else >
          <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-default" data-click="panel-expand">
            <i class="fa fa-expand"></i>
          </a>
          <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-warning" data-click="panel-collapse">
            <i class="fa fa-minus"></i>
          </a>
        </div>
      </div>
      <ol class="breadcrumb samll">
        <li>选择：</li>
        <li v-for="value in breadcrumb">{{ value.name }}</li>
      </ol>
    </div>
    <!-- panel body -->
    <div class="panel-body">
      <div class="well well-sm table-responsive">
        <!-- <ol class="list-inline"> -->
          <transition-group name="bounce" tag="ol" class="list-inline">
            <li class="black-classify" :key="depth" v-for="(arr, depth) in catalogGroups" is='catalog' :depth="depth" :parent_id="arr[0]" :catalogs="arr[1]" @choosed="choosed"  :breadcrumb="breadcrumb" :dataUrl="dataUrl" @removeCatalog="removeCatalogGroupsData" :catalogFixed="catalogFixed"></li>
          </transition-group>
        <!-- </ol> -->
      </div>
    </div>
    <!-- panel footer -->
    <div class="panel-footer text-right" v-if="catalogFixed">
      <button type="button" class="btn btn-default" @click="closePanel">取消</button>
      <button type="button" class="btn btn-primary" v-on:click="returnBreadcrumb">确定</button>
    </div>
  </div>
</template>
<script>
import Catalog from './list'
import 'transitions/bounce';
export default {
  props: {
    dataUrl: { required: true, type: String },
    catalogFixed: { type: Boolean, default: false},
    catalogPanelShow: { type: Boolean, default: true },
  },
  components: { Catalog },
  data () {
    return {
      catalogGroups: [],
      breadcrumb: [],
    }
  },
  methods: {
    loadData () {
      var successHandler = function(response){
        this.catalogGroups.push([null, response.body]);
      }
      var errorHandler = function(response){
        alert('falied')
      }
      this.$http.get(this.dataUrl).then(successHandler, errorHandler);
    },
    choosed (catalog, depth) {
      var shouldPush = true;
      if(this.catalogGroups[depth + 1] && this.catalogGroups[depth + 1] == catalog.children){
        shouldPush = false
      }
      if(shouldPush){
        this.catalogGroups.splice(depth + 1);
        if(catalog.children && catalog.children.length > 0){
          this.catalogGroups.push([catalog.id, catalog.children]);
        }
      }
    },
    removeCatalogGroupsData (obj) {
      var depth = parseInt(obj.depth), index = parseInt(obj.catalogIndex)
      if (this.catalogGroups.length > depth) {
        this.catalogGroups[depth][1].splice(index, 1)
        if (this.catalogGroups[depth+1][0] == obj.catalog.id) {
          this.catalogGroups.splice(depth + 1)
        }
      }
    },
    closePanel () {
      this.$emit('input', false);
    },
    returnBreadcrumb () {
      this.$emit('selected_array', this.breadcrumb);
      this.$emit('input', false);
    }
  },
  mounted () {
    this.loadData();
  }
}
</script>

<style scoped>
.catalog-fixed{
  position: fixed;
  width: 80%;
  left: 10vw;
  top: 5vh;
  z-index: 10000;
  box-shadow: 0px 0px 5px 0px #ccc;
}
.well{
  background: #efefef;
  min-width: 100%;
  overflow-x: scroll;
  overflow-y: hidden;
  margin-bottom: 0px;
}
.well ol.list-inline{
  margin: 0px;
  white-space: nowrap;
  display: inline-block;
}
.well ol li.black-classify{
  width: 300px;
  margin-right: 10px;
  background: #fff;
  padding: 0px;
  box-shadow: 0px 0px 5px 0px #c0c7c9;
}
</style>
