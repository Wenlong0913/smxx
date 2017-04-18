<template>
  <f7-page>
    <f7-navbar title="Vue+Cordova" back-link="Back" sliding></f7-navbar>
    <f7-block inner>
      <div class="c"></div>
      <cordova></cordova>
      <hello></hello>
    </f7-block>
  </f7-page>
</template>

<script>
import Hello from 'components/Hello'
import Cordova from 'components/Cordova'

export default {
  components: {
    Hello,
    Cordova
  }
}
</script>

<style scoped>
.c { height: 300px;  }
</style>
