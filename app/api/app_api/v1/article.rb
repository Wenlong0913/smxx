module AppAPI::V1
  class Article < Grape::API
    helpers AppAPI::SharedParams
    resources :articles do

      desc "发布文章" do
        success AppAPI::Entities::Article 
      end
      params do
        requires :description, type: String, desc: '文章内容'
        requires :title, type: String, desc: '文章标题'
        requires :image_item_ids, type: Array[Integer], coerce_with: ->(val) { val.split(/,|，/).map(&:to_i) }, desc: '图片IDs'
        requires :product_ids, type: Array[Integer], coerce_with: ->(val) { val.split(/,|，/).map(&:to_i) }, desc: '产品ID列表'
      end
      post do
        authenticate!
        article = ::Article.new(title: params[:title], description: params[:description])
        article.author = current_user.id
        article.image_item_ids = params[:image_item_ids]
        article.product_ids = params[:product_ids]
        error! article.errors unless article.save
        present article, with: AppAPI::Entities::Article, type: :full_article   
      end

      desc "文章列表" do
        success AppAPI::Entities::Article 
      end
      params do
        use :pagination
        use :sort, fields: [:id, :created_at, :updated_at]
      end
      get do
        authenticate!
        articles = ::Article.all
        articles = paginate_collection(sort_collection(articles), params)
        wrap_collection articles, AppAPI::Entities::Article, type: :full_article
      end

      desc '查看文章详细' do
        success AppAPI::Entities::Article
      end
      params do
        requires :id, type: Integer, desc: '文章ID'
      end
      get ':id' do
        authenticate!
        present ::Article.find(params[:id]), with: AppAPI::Entities::Article, type: :full_article 
      end

      desc '删除文章' do
        success AppAPI::Entities::Article
      end
      params do
        requires :id, type: Integer, desc: '文章ID'
      end
      delete ':id' do
        authenticate!
        article = ::Article.find(params[:id]).destroy
        present article, with: AppAPI::Entities::Article
      end

    end # end of resources
  end
end
