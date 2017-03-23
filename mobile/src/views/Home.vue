<template>
  <div id="app">
    <cordova></cordova>
    <hello></hello>
  </div>
</template>

<script>
import Hello from 'components/Hello'
// import Cordova from 'components/Cordova'

export default {
  name: 'app',
  components: {
    Hello
    // Cordova
  }
}
</script>
