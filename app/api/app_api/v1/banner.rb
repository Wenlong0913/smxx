module AppAPI::V1
  class Banner < Grape::API
    helpers AppAPI::SharedParams
    resources :banners do

      desc '轮波图'
      params do
        optional :diaplay_type, type: String, values: ['main', 'privated', 'discover'], desc: '轮波图：首页轮波图，私藏界面轮波图， 发现界面轮波图'
      end
      get do
        # 首页轮波图
        # 这是是写死的，需要确定怎么存储首页的图片
        app_data = {data: [
          {id: 1, image_url: 'http://img0.imgtn.bdimg.com/it/u=3819177557,2233233617&fm=23&gp=0.jpg', redirect_web_url: 'http://img0.imgtn.bdimg.com/it/u=3819177557,2233233617&fm=23&gp=0.jpg', redirect_app_url: 'http://img0.imgtn.bdimg.com/it/u=3819177557,2233233617&fm=23&gp=0.jpg'},
          {id: 2, image_url: 'http://img1.imgtn.bdimg.com/it/u=3919432552,641803243&fm=23&gp=0.jpg', redirect_web_url: 'http://img1.imgtn.bdimg.com/it/u=3919432552,641803243&fm=23&gp=0.jpg', redirect_app_url: 'http://img1.imgtn.bdimg.com/it/u=3919432552,641803243&fm=23&gp=0.jpg'},
          {id: 3, image_url: 'http://img3.imgtn.bdimg.com/it/u=1283854745,2431185040&fm=23&gp=0.jpg', redirect_web_url: 'http://img3.imgtn.bdimg.com/it/u=1283854745,2431185040&fm=23&gp=0.jpg', redirect_app_url: 'http://img3.imgtn.bdimg.com/it/u=1283854745,2431185040&fm=23&gp=0.jpg'}
        ]}
        # 发现界面轮波图，需要确定显示哪方面的图片
        find_data = {data: [
          {id: 4, image_url: 'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2663089414,714422026&fm=23&gp=0.jpg', redirect_web_url: 'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2663089414,714422026&fm=23&gp=0.jpg', redirect_app_url: 'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2663089414,714422026&fm=23&gp=0.jpg'},
          {id: 5, image_url: 'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=312855977,259299819&fm=23&gp=0.jpg', redirect_web_url: 'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=312855977,259299819&fm=23&gp=0.jpg', redirect_app_url: 'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=312855977,259299819&fm=23&gp=0.jpg'},
          {id: 6, image_url: 'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=4147180806,1939837096&fm=23&gp=0.jpg'}
        ]}
        # 私藏界面轮波图
        private_data = {data: [
          {id: 7, image_url: 'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=2900910847,1546390952&fm=11&gp=0.jpg', redirect_web_url: 'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=2900910847,1546390952&fm=11&gp=0.jpg', redirect_app_url: 'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=2900910847,1546390952&fm=11&gp=0.jpg'},
          {id: 8, image_url: 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2710676342,4147765701&fm=23&gp=0.jpg', redirect_web_url: 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2710676342,4147765701&fm=23&gp=0.jpg', redirect_app_url: 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2710676342,4147765701&fm=23&gp=0.jpg'},
          {id: 9, image_url: 'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1990445434,3520255841&fm=23&gp=0.jpg', redirect_web_url: 'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1990445434,3520255841&fm=23&gp=0.jpg', redirect_app_url: 'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1990445434,3520255841&fm=23&gp=0.jpg'}
        ]}
        images = if params[:diaplay_type] == 'privated'
          # 先返回固定的图片，让前端可以使用
          app_data
        elsif params[:diaplay_type] == 'discover'
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
