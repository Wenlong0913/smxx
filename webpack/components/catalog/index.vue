<template>
  <div class="cc">
    <table class="table table-stripped">
      <tr>
        <td v-for="(catalogs, depth) in catalogGroups" is='catalog' :depth="depth" :catalogs="catalogs" @choosed="choosed"></td>
      </tr>
    </table>
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

<style scoped>
.cc {
  overflow-x: auto;
}
td {
  min-width: 400px;
  max-width: 400px;
  min-height: 200px;
  height: 200px;
  position: relative;
  align: top;
}
</style>
