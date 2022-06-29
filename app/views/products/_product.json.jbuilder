json.extract! product, :id, :item_name, :price, :size, :stock_quantity, :description, :image, :created_at, :updated_at
json.url product_url(product, format: :json)
