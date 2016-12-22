## 横向展示目录组件
### 1. 需要

  1. routes
  ```
  resources :catalogs
  ```
  2. 需要gem
  ```
  gem 'closure_tree'
  ```
  3. create catalog_table

### 2. 引入组件
    <!-- 在 webpack/appliction

    ```
    Vue.component ('catalogList', require('components/catalog'))
    ``` -->
    js 文件中:
    ```
    var container = pages.find('catalog-list');
    new Vue({el: container[0]});
    ```


### 3. veiw

  > data-url :传入index url

  ```
  <catalog-list data-url=admin_catalogs_path></catalog-list>
  ```

### 4. controller

```
  def index
    respond_to do |format|
      format.html
      format.json do
        @catalogs = Catalog.roots
        render json: @catalogs
      end
    end
  end

  def create
    @admin_catalog = Catalog.new(admin_catalog_params)
    if @admin_catalog.save
      render json: @admin_catalog
    else
      head 403
    end
  end

  def update
    authorize @admin_catalog
    if @admin_catalog.update(admin_catalog_params)
      render json: {status: 'Catalog 更新成功.'}
    else
      render json: {status: 'Catalog 更新失败.'}
    end
  end

  def destroy
    authorize @admin_catalog
    @admin_catalog.destroy
    render json: {status: 'Catalog 删除成功.'}
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_admin_catalog
      @admin_catalog = Catalog.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def admin_catalog_params
      params.permit(:parent_id, :name, :position)
    end
```

### 5. 序列化返回json

  create: serializers/catalog_serializer

  ```
  attributes :id, :name, :children
  has_many :children

  def children
    object.children.map{|c| CatalogSerializer.new(c).as_json }
  end
  ```

### 6. models

  ```
  has_closure_tree dependent: :destroy #关联删除下级目录
  belongs_to :parent
  ```
