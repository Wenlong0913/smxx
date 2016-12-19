<template>
  <div class="well well-sm table-responsive">
    <ol class="list-inline">
      <li v-for="(catalogs, depth) in catalogGroups" is='catalog' :depth="depth" :catalogs="catalogs" @choosed="choosed"></li>
    </ul>
  </div>
</template>
<script>
import Catalog from './list'
export default {
  props: {
    dataUrl: { required: true, type: String }
  },
  components: { Catalog },
  data () {
    return {
      catalogGroups: []
    }
  },
  methods: {
    loadData () {
      var successHandler = function(response){
        this.catalogGroups.push(response.body);
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
        if(catalog.children && catalog.children.length > 0)
          this.catalogGroups.push(catalog.children);
      }
    }
  },
  mounted () {
    this.loadData();
  }
}
</script>
