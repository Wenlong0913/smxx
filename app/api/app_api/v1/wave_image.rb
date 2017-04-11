module AppAPI::V1
  class WaveImage < Grape::API
    helpers AppAPI::SharedParams
    resources :wave_images do

      desc '轮波图'
      params do
        optional :diaplay_type, type: String, values: ['main', 'private', 'find'], desc: '轮波图：首页轮波图，私藏界面轮波图， 发现界面轮波图'
      end
      get do
        # 首页轮波图
        # 这是是写死的，需要确定怎么存储首页的图片
        app_data = {data: [
          {image_url: 'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=2900910847,1546390952&fm=11&gp=0.jpg'},
          {image_url: 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2710676342,4147765701&fm=23&gp=0.jpg'},
          {image_url: 'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1990445434,3520255841&fm=23&gp=0.jpg'}
        ]}
        # 发现界面轮波图，需要确定显示哪方面的图片
        find_data = {data: [
          {image_url: 'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=2900910847,1546390952&fm=11&gp=0.jpg'},
          {image_url: 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2710676342,4147765701&fm=23&gp=0.jpg'},
          {image_url: 'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1990445434,3520255841&fm=23&gp=0.jpg'}
        ]}
        # 私藏界面轮波图
        private_data = {data: [
          {image_url: 'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=2900910847,1546390952&fm=11&gp=0.jpg'},
          {image_url: 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2710676342,4147765701&fm=23&gp=0.jpg'},
          {image_url: 'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1990445434,3520255841&fm=23&gp=0.jpg'}
        ]}
        images = if params[:diaplay_type] == 'private'
          authenticate!
          image_items = []
          current_user.site_favorites.each{ |favorite| image_items << favorite.resource.image_items }
          current_user.product_favorites.each{ |favorite| image_items << favorite.resource.image_items }
          image_items.flatten.sample(3)
          # 先返回固定的图片，让前端可以使用
          app_data
        elsif params[:diaplay_type] == 'find'
          # 先返回固定的图片，让前端可以使用
          find_data
        elsif params[:diaplay_type] == 'main'
          # 先返回固定的图片，让前端可以使用
          app_data
        end

        # 有真实数据之后使用
        # present images, with: AppAPI::Entities::ImageItem
        # 现在先返回几张图片，让前端可以使用
        present images
      end

    end # end of resources
  end
end
