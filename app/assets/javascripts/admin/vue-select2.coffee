# select2 -- vue
Vue.component 'select2',
  props: ['options', 'value']
  template:"""
    <select>
      <slot></slot>
    </select>
  """
  mounted: ->
    vm = this
    $(this.$el)
      .val(this.value)
      # // init select2
      .select2({data: this.options})
      # // emit event on change.
      .on 'change', ->
        vm.$emit('input', this.value)
  watch:
    value: (value)->
      # // update value
      $(this.$el).select2('val', value)
    options: (options)->
      # // update options
      $(this.$el).select2({data: this.options})
  destroyed: ->
    $(this.$el).off().select2('destroy')
