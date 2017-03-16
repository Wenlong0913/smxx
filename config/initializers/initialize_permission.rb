# 初始创建权限
if Permission.table_exists?
  unless Permission.exists?
    puts "初始创建权限"
    permissions = [
      {symbol_name: 'login_desktop', name: '登陆桌面端', group_name: '登陆', description: ''},

      {symbol_name: 'upload_attachment', name: '上传附件', group_name: '附件管理', description: ''},

      {symbol_name: 'create_member', name: '客户-创建', group_name: '客户管理', description: ''},

      {symbol_name: 'create_preorder_conversition', name: '生产设计-创建', group_name: '生产设计管理', description: ''},
      {symbol_name: 'update_preorder_conversition', name: '生产设计-更改', group_name: '生产设计管理', description: ''},

      {symbol_name: 'create_order', name: '订单-创建', group_name: '订单管理', description: ''},
      {symbol_name: 'order_material_split', name: '订单物料-拆分', group_name: '订单管理', description: ''},

      {symbol_name: 'create_produce', name: '生产任务-创建', group_name: '生产任务', description: ''},
      {symbol_name: 'produce_material_review', name: '生产任务-物料审核', group_name: '生产任务', description: ''},
      {symbol_name: 'destroy_produce', name: '生产任务-删除', group_name: '生产任务', description: ''},
      {symbol_name: 'update_produce', name: '生产任务-更改', group_name: '生产任务', description: ''},

      {symbol_name: 'order_delivery', name: '订单发货', group_name: '发货', description: ''},
      {symbol_name: 'confirm_delivery', name: '确认收货', group_name: '发货', description: ''},

      {symbol_name: 'create_material', name: '物料创建', group_name: '物料管理', description: ''},
      {symbol_name: 'update_material', name: '物料更新', group_name: '物料管理', description: ''},
      {symbol_name: 'storage', name: '出入库', group_name: '物料管理', description: ''},
      {symbol_name: 'purchase', name: '采购', group_name: '物料管理', description: ''},
      {symbol_name: 'warehouse', name: '仓库', group_name: '物料管理', description: ''},

      {symbol_name: 'vendor', name: '供应商管理', group_name: '供应商管理', description: ''}
    ]
    permissions.each do |permission|
      Permission::Create.(permission)
    end
  end
end
