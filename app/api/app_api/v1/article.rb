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
        optional :image_item_ids, type: Array[Integer], coerce_with: ->(val) { val.split(/,|，/).map(&:to_i) }, desc: '图片IDs'
        optional :product_ids, type: Array[Integer], coerce_with: ->(val) { val.split(/,|，/).map(&:to_i) }, desc: '产品ID列表'
        optional :tag_list, type: String, desc: '文章标签, 多个文章用逗号隔开'
      end
      post do
        authenticate!
        article = ::Article.new(title: params[:title], description: params[:description])
        article.author = current_user.id
        article.image_item_ids = params[:image_item_ids] if params[:image_item_ids]
        article.product_ids = params[:product_ids] if params[:product_ids]
        article.tag_list = params[:tag_list]  if params[:tag_list]
        error! article.errors unless article.save
        present article, with: AppAPI::Entities::Article
      end

      desc "文章列表" do
        success AppAPI::Entities::ArticleSimple
      end
      params do
        optional :community_id, type: Integer, desc: '小区下的所有文章列表'
        optional :includes, type: String, values: ['description'], desc: '选择description后会返回文章类容'
        optional :type, type: String, values: ['owner'], desc: '选择owner后会返回我的文章类容'
        use :pagination
        use :sort, fields: [:id, :created_at, :updated_at]
      end
      get do
        authenticate!
        articles = 
            case params[:type]
            when 'owner' then current_user.articles
            else
              ::Article.all
            end
        if Settings.project.imolin? && params[:community_id]
          community = ::Community.find(params[:community_id])
          articles = articles.where(author: community.users.map(&:id))
        end
        articles = paginate_collection(sort_collection(articles), params)
        wrap_collection articles, AppAPI::Entities::Article, type: :list, includes: [params[:includes]]
      end

      desc '查看文章详细' do
        success AppAPI::Entities::Article
      end
      params do
        requires :id, type: Integer, desc: '文章ID'
      end
      get ':id' do
        authenticate!
        present ::Article.find(params[:id]), with: AppAPI::Entities::Article, includes: ['description']
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
