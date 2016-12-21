<template>
  <li class="black-classify">
    <!-- li heder search -->
    <div class="search">
      <div class="input-group">
        <input class="form-control" placeholder="搜索" v-model="searchText">
        <span class="input-group-addon"><i class="fa fa-search"></i></span>
      </div>
    </div>
    <!-- list body -->
    <div class="list-body table-responsiev">
      <ul class="list-unstyled">
        <transition-group name="transition-list">
          <li class="column" :data-id="catalog.id" :key="catalog.id" v-for="(catalog, index) in filterCatalog(catalogs)" v-on:mouseenter="mouseEnters(catalog)" v-on:mouseleave="mouseLeaves(catalog)" v-show="catalog.filterShow" v-bind:class="catalog.selected ? 'active' : ''">
            <div class="col-xs-9" @click="choosed(catalog)">
              <i class="fa fa-circle text-info m-r-10 small"></i>{{catalog.name}}
            </div>
            <div class="col-xs-3 text-center text-success handle" v-show="catalog.showActions">
              <span data-target=".modal-form" data-toggle="modal" @click="openModal('new', index, {}, catalog.id)">
                <i class="fa fa-plus"></i>
              </span>
              <span data-target=".modal-form" data-toggle="modal" @click="openModal('edit', index, catalog)">
                <i class="fa fa-edit"></i>
              </span>
              <span v-on:click="removeData(catalog, index)">
                <i class="fa fa-remove"></i>
              </span>
            </div>
          </li>
        </transition-group>
      </ul>
    </div>
    <!-- li footer -->
    <div class="classify-footer">
      <span class="btn-link btn-sm pull-right" @click="openModal('new', depth, {})">
        <i class="fa fa-plus-square m-r-5"></i>新增
      </span>
    </div>
    <catalog-form v-model="showModal" :options="options" v-if="showModal" :model="newCatalogModel" @addSubmit="addCatalog" @editSubmit="editCatalog" ></catalog-form>
  </li>
</template>
<script>
import CatalogForm from './form'
export default {
  props: {
    breadcrumb: { type: Array, required: true },
    parent_id: { type: Number },
    catalogs: { type: Array, required: true },
    depth: { type: Number, required: true, default: 0 },
    dataUrl: { required: true, type: String }
  },
  data () {
    return {
      options: {formStatus: '', responseMessage: '', parent_id: '', index:'', addChildren: false},
      showModal : false,
      newCatalogModel: {},
      showActionButton: false,
      searchText: ''
    }
  },
  components: { CatalogForm },
  methods: {
    filterCatalog (catalogs) {
      var searchText = this.searchText
      return catalogs.filter(function(catalog){
        // Todo 匹配一些需要转义的字符会报错，没有找到解决方法，待修复
        var reg = new RegExp(searchText)
        catalog.filterShow = false; // 防止edit/new 时 index错误
        if(reg.test(catalog.name)){
          catalog.filterShow = true;
        }
        return catalog
      })
    },
    choosed (catalog) {
      this.$emit('choosed', catalog, this.depth);
      this.catalogs.forEach(function(value){
        value.selected = false;
      })
      catalog.selected = true;
      this.breadcrumb.splice(this.depth+1, this.breadcrumb.length-1, catalog.name);
    },
    mouseEnters (catalog) {
      this.$set(catalog, 'showActions', true)
    },
    mouseLeaves (catalog) {
      this.$set(catalog, 'showActions', false)
    },
    openModal (action, index, catalog, parent_id) {
      let parentId = this.parent_id, addChildren = false;
      if (parent_id != null) {
        addChildren = true;
        parentId = parent_id;
      }
      this.options = {formStatus: action, responseMessage: {status: false, text: ''}, parent_id: parentId, index: index, addChildren: addChildren};
      this.showModal = true;
      this.newCatalogModel = Object.assign({}, catalog);
    },
    removeData (catalog, index) {
      if(confirm("确认删除？")){
        const deleteUrl = this.dataUrl+"/"+catalog.id;
        var successHandler = function(response){
          this.$emit("removeCatalog", {depth: this.depth, catalogIndex: index, catalog: catalog});
        }
        var errorHandler = function(response){
          alert('error');
        }
        this.$http.delete(deleteUrl).then(successHandler, errorHandler);
      }
    },
    addCatalog (obj) {
      var catalog = obj.catalog, options = obj.options;
      const addUrl = this.dataUrl
      var successHandler = function(response){
        var reCatalog = response.body;
        if (this.options.addChildren) {// 分为内部添加按钮 和 底部添加按钮
          this.catalogs[options.index].children.push(reCatalog)
        }else {
          this.catalogs.push(reCatalog)
        }
        this.options.responseMessage = {status: true, text: '添加成功'};
      }
      var errorHandler = function(response){
        this.responseMessage = {status: false, text: '添加失败，出错了......'}
      }
      console.log(catalog);
      this.$http.post(addUrl, catalog).then(successHandler, errorHandler);
      // var _this = this;
      // setTimeout(function () {
      //   _this.showModal = false;
      // }, 1000);
    },
    editCatalog (obj) {

      var catalog = obj.catalog, options = obj.options;
      const editUrl = this.dataUrl+"/"+catalog.id;
      var successHandler = function(response){
        options.responseMessage = {status: true, text: '修改成功'}
        this.catalogs[options.index].name= catalog.name
      }
      var errorHandler = function(response){
        options.responseMessage = {status: false, text: '出错了......'}
      }
      this.$http.patch(editUrl, catalog).then(successHandler, errorHandler);
    },
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
  margin: 0px 5px;
}
.black-classify .list-body ul.list-unstyled li .col-xs-3 span:hover{
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
