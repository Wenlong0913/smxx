<template>
  <!-- modal -->
  <div class="catalog-modal">
    <div class="modal-dialog">
      <div class="modal-content">
        <!-- modal header -->
        <div class="modal-header">
          <button type="button" name="button" class="close" @click='close'>
            <span aria-hidden="true">&times;</span>
            <span class="sr-only">关闭</span>
          </button>
          <h4 class="modal-title modalLabel">{{title}}</h4>
        </div>
        <!-- modal body -->
        <div class="modal-body">
          <div class="form form-horizontal" role="form">
            <div class="form-group">
              <div class="col-sm-2 control-label">名称</div>
              <div class="col-sm-10">
                <input type="text" v-model='model.name' class="form-control" placeholder="输入名称">
              </div>
            </div>
            <!-- 状态提示信息 -->
            <div class="return_messages text-right text-success">
              状态提示信息
            </div>
          </div>
        </div>
        <!-- modal footer -->
        <div class="modal-footer">
          <button type="button" name="button" class="btn btn-default" @click="close">取消</button>
          <button type="button" name="button" class="btn btn-primary" @click="submit">更新</button>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
export default{
  props: {
    value: { type: Boolean, default: true },
    model: { type: Object, required: true },
    title: {}
  },
  data() {
    return{
    }
  },
  methods:{
    close () {
      this.$emit('input', false)
    },
    submit () {
      this.$emit('submit', this.model)
    }
  }
}
</script>

<style>
.catalog-modal{
  overflow: hidden;
  position: fixed;
  top: 10vh;
  right: 0;
  bottom: 0;
  left: 0;
  z-index: 1050;
  overflow: hidden;
}
</style>
