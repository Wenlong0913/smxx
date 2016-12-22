<template>
  <div class="panel panel-default">
    <!-- panel head -->
    <div class="panel-heading">
      <div class="panel-heading-btn">
        <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-default" data-click="panel-expand">
          <i class="fa fa-expand"></i>
        </a>
        <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-warning" data-click="panel-collapse">
          <i class="fa fa-minus"></i>
        </a>
      </div>
      <ol class="breadcrumb samll">
        <li v-for="value in breadcrumb">{{ value }}</li>
      </ol>
    </div>
    <!-- panel body -->
    <div class="panel-body">
      <div class="well well-sm table-responsive">
        <!-- <ol class="list-inline"> -->
          <transition-group name="bounce" tag="ol" class="list-inline">
            <li class="black-classify" :key="depth" v-for="(arr, depth) in catalogGroups" is='catalog' :depth="depth" :parent_id="arr[0]" :catalogs="arr[1]" @choosed="choosed"  :breadcrumb="breadcrumb" :dataUrl="dataUrl" @removeCatalog="removeCatalogGroupsData"></li>
          </transition-group>
        <!-- </ol> -->
      </div>
    </div>
  </div>
</template>
<script>
import Catalog from './list'
import 'transitions/bounce';
export default {
  props: {
    dataUrl: { required: true, type: String }
  },
  components: { Catalog },
  data () {
    return {
      catalogGroups: [],
      breadcrumb: ['选择：']
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
    }
  },
  mounted () {
    this.loadData();
  }
}
</script>

<style scoped>
.well{
  background: #efefef;
  min-width: 100%;
  overflow-x: scroll;
  overflow-y: hidden;
}
.well ol.list-inline{
  margin: 0px;
  white-space: nowrap;
  display: inline-block;
}
.well ol li.black-classify{
  height: 420px;
  width: 300px;
  margin-right: 10px;
  background: #fff;
  padding: 0px;
  box-shadow: 0px 0px 5px 0px #c0c7c9;
}
</style>
