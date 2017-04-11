module AppAPI::V1
  class ImageItem < Grape::API
    helpers AppAPI::SharedParams
    resources :image_items do

      desc "图片上传" do
        success AppAPI::Entities::ImageItem 
      end
      # swagger 无法测试多图上传
      # 可以用如下方法测试
      # curl -X POST --header 'Content-Type: multipart/form-data' --header 'Accept: application/json' 
      #  -F images[][file]=@"logo.png"  'http://api.lvh.me:5000/v1/image_items'
      params do
        requires :images, type: Array do
          requires :file, :type => Rack::Multipart::UploadedFile, :desc => "多图片上传"
        end
      end
      post do
        authenticate!
        images = []
        if params[:images]
          params[:images].each do |file|
            images << ::ImageItem.create(image: ActionDispatch::Http::UploadedFile.new(file[:file]), owner: current_user)
          end
        end
        present images, with: AppAPI::Entities::ImageItem        
      end

    end # end of resources
  end
end
