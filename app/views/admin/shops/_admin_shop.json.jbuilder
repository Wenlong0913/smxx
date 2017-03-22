json.extract! admin_shop, :id, :name, :description, :content, :contact_name, :contact_phone, :is_published, :note, :properties, :business_time, :address, :created_at, :updated_at
json.url admin_shop_url(admin_shop, format: :json)
