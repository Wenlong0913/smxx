module AppAPI::V1
  class ForageDatacache < Grape::API
    resources :forage_datacaches do
      desc "导入forage data_cache数据"
      params do
        requires :url, type: String, desc: 'webhook链接'
        requires :data, type: String, desc: '数据'
        requires :event_type, type: String, desc: '事件类型'
        requires :data_key, type: String, desc: '爬虫id'
        requires :sign2, type: String, desc: 'sign2'
        requires :timestamp, type: Integer, desc: '时间戳'
        optional :crawl_time, type: Integer, desc: '爬取时间'
      end
      post do
        if Settings.project.wgtong?
          begin
            user_secret = "k5NDhiNjExMjA1Nj-699cabea0493204"
            if Digest::MD5.hexdigest(user_secret + params[:timestamp].to_s) == params[:sign2]
              data = JSON.parse(params[:data])
              title = data["article_title"]
              migrate_to, original_catalog = if title =~ /.*(活动预告|活动报名|抢票|免费|公益|福利|赠票|领票|预约|享活动|活动早知道|展览预告|看展览|听讲座|讲座通知|讲坛|鉴赏会|周末耍事|展讯|佳片有约).*/
                ['product', $1]
              else
                ['cms_page']
              end
              data_cache = Forage::DataCache.new(title: title, url: data["__url"])
              data_cache.migrate_to            = migrate_to
              data_cache.matched_status        = 'none'
              data_cache.image                 = data["article_thumbnail"]
              data_cache.content               = data["article_content"]
              data_cache.date                  = Time.at(data["article_publish_time"]).to_date.to_s
              data_cache.from                  = data["weixin_nickname"]
              data_cache.original_catalog      = original_catalog
              if data_cache.save
                present params[:data_key]
              else
                error! data_cache.errors
              end
            else
              error! "数据不合法"
            end
          rescue => e
            error! e.message
          end
        else
          present notice: "只能wgtong使用"
        end
      end
    end
  end
end
