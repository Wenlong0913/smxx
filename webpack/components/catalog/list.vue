<template>
  <td>
    <div class="cl">
      <div class="search">
        <div class="input-group">
          <input class="form-control" placeholder="searching this list....">
          <span class="input-group-addon"><i class="fa fa-search"></i></span>
        </div>
      </div>
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
        <div class="classify-footer">
          <span class="btn-link btn-sm pull-right" data-target=".modal-form" data-toggle="modal" @click="openModal('new', catalog)">
            <i class="fa fa-plus-square m-r-5"></i>新增
          </span>
        </div>
      </div>
    </div>
  </td>
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
.cl {
  position: absolute;
  top: 10px;
  left: 10px;
}
</style>
