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
          <h4 class="modal-title modalLabel">{{ options.formStatus == 'new' ? '新建目录' : '修改' }}</h4>
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
            <div class="return_messages text-right" :class="options.responseMessage.status ? 'text-success' : 'text-danger' ">
              {{ options.responseMessage.text}}
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
    options: { type: Object, required: true },
    value: { type: Boolean, default: true },
    model: { type: Object, required: true }
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
      this.model.parent_id = this.options.parent_id;
      var model = {catalog: this.model, options: this.options };
      if (this.options.formStatus=='new') {
        this.$emit('addSubmit', model)
      }else if (this.options.formStatus=='edit') {
        this.$emit('editSubmit', model)
      }
    }
  }
}
</script>

<style scoped>
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
