<template>
  <div>
    <div class="navbar">
      <div class="navbar-inner">
        <div class="left">
          <a href="#" class="link icon-only"><i class="icon icon-back" @click="close"></i></a>
        </div>
        <div class="right">
          <a href="#"  class="link" style="font-size: 16px">发布</a>
        </div>
      </div>
    </div>
    <div class="content-block inset">
      投票表单
    </div>
  </div>
</template>

<script>
export default {
  data: function () {
    return {}
  },
  methods: {
    close () {
      window.f7.closeModal('.popup-form')
    }
  }
}
</script>

<style lang="sass" scoped>
</style>
