json.extract! admin_catalog, :id, :parent_id, :name, :position, :created_at, :updated_at
json.url admin_catalog_url(admin_catalog, format: :json)