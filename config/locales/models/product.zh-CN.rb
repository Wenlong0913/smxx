_, data = IO.read(__FILE__).split(/^__END__$/, 2)

site_name = Settings.project.meikemei? ? '美容院商家' : '商家'

YAML.load(ERB.new(data).result(binding))

__END__

---
zh-CN:
  activerecord:
    models:
      product: 产品
    attributes:
      product:
        site: <%= site_name %>
        catalog: 产品分类
        name: 产品名称
        image: 图片
        old_price: 原价
        price: 原价
        responsive_person: 适应人群
        warning_message: 注意事项
        service_time: 服务时长
        month_number: 月单数
        unit: 库存单位
        stock: 库存
        discount: 优惠价
        weight: 产品重量
        weight_unit: 重量单位
        description: 简要描述
        content: 介绍
        hot: 热卖
        recommend: 推荐
        event: 活动
        promotion: 促销
        is_manager_recommend: 是否设为站长推荐
        is_shelves: 商品上架
        video_url: 视频链接
    errors:
      models:
        product:
  helpers:
    product:
