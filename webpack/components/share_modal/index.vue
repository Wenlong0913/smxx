<template>
  <modal title="title" :show.sync="showModal" @cancel="showModal = false" okText='保存' cancelText="取消" @ok="showModal = false">
    <div>
      <image-album :server="server" @delete="delete_image" @selected="selected_images" :selected-list="imageListIds"></image-album>
    </div>
  </modal>
</template>

<script>
export default {
  data () {
    return {
      title: '分享',
      showModal: false,
      url: 'lack'
    }
  }
}
</script>

<style lang="sass" scoped>
</style>
