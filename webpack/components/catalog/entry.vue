<template>
  <div class="list-body table-responsiev">
    <ul class="list-unstyled">
      <transition-group name="transition-list">
        <li class="column" :data-id="catalog.id" :key="catalog.id" v-for="catalog in catalogs">
          <div class="col-xs-9" @click="choose(catalog)">
            <i class="fa fa-circle text-info m-r-10 small"></i>{{catalog.name}}
          </div>
        </li>
      </transition-group>
    </ul>
  </div>
</template>
<script>
export default {
  props: {
    catalogs: { required: true }
  },
  methods: {
    choose (catalog) {
      this.$emit('selected', catalog)
    }
  }
}
</script>
