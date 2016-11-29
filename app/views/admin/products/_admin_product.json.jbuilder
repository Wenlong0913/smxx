json.extract! admin_product, :id, :site_id, :title, :description, :created_at, :updated_at
json.url admin_product_url(admin_product, format: :json)