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
          {id: 1, image_url: 'http://api-dev.sxhop.com/photos/2017/3/29/1/original.?2017', redirect_web_url: 'http://www.baidu.com', redirect_app_url: 'http://www.baidu.com'},
          {id: 2, image_url: 'http://api-dev.sxhop.com/photos/2017/3/29/2/original.?2017', redirect_web_url: 'http://www.baidu.com', redirect_app_url: 'http://www.baidu.com'},
          {id: 3, image_url: 'http://api-dev.sxhop.com/photos/2017/4/12/10/original.?2017', redirect_web_url: 'http://www.baidu.com', redirect_app_url: 'http://www.baidu.com'}
        ]}
        # 发现界面轮波图，需要确定显示哪方面的图片
        find_data = {data: [
          {id: 4, image_url: 'http://api-dev.sxhop.com/photos/2017/4/12/20/original.?2017', redirect_web_url: 'http://www.baidu.com', redirect_app_url: 'http://www.baidu.com'},
          {id: 5, image_url: 'http://api-dev.sxhop.com/photos/2017/4/12/15/original.?2017', redirect_web_url: 'http://www.baidu.com', redirect_app_url: 'http://www.baidu.com'},
          {id: 6, image_url: 'http://api-dev.sxhop.com/photos/2017/4/12/11/original.?2017', redirect_web_url: 'http://www.baidu.com', redirect_app_url: 'http://www.baidu.com'}
        ]}
        # 私藏界面轮波图
        private_data = {data: [
          {id: 9, image_url: 'http://api-dev.sxhop.com/photos/2017/3/29/5/original.?2017', redirect_web_url: 'http://www.baidu.com', redirect_app_url: 'http://www.baidu.com'}
          {id: 9, image_url: 'http://api-dev.sxhop.com/photos/2017/3/29/6/original.?2017', redirect_web_url: 'http://www.baidu.com', redirect_app_url: 'http://www.baidu.com'}
          {id: 9, image_url: 'http://api-dev.sxhop.com/photos/2017/4/12/14/original.?2017', redirect_web_url: 'http://www.baidu.com', redirect_app_url: 'http://www.baidu.com'}
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
