<% if namespaced? -%>
require_dependency "<%= namespaced_path %>/application_controller"

<% end -%>
<% module_namespacing do -%>
class <%= controller_class_name %>Controller < <%= controller_class_name.split('::').size > 1 ? "#{controller_class_name.split('::')[0]}::BaseController" : 'ApplicationController' %>
  before_action :set_<%= singular_table_name %>, only: [:show, :edit, :update, :destroy]

  def index
    authorize <%= remove_ar_module(class_name) %>
    @<%= plural_table_name %> = <%= orm_class.all(remove_ar_module(class_name)) %>
    respond_to do |format|
      format.html
      format.json { render json: @<%= plural_table_name %> }
    end
  end

  def show
    authorize @<%= singular_table_name %>
    respond_to do |format|
      format.html
      format.json { render json: @<%= singular_table_name %> }
    end
  end

  def new
    authorize <%= remove_ar_module(class_name) %>
    @<%= singular_table_name %> = <%= orm_class.build(remove_ar_module(class_name)) %>
  end

  def edit
    authorize @<%= singular_table_name %>
  end

  def create
    authorize <%= remove_ar_module(class_name) %>
    @<%= singular_table_name %> = <%= orm_class.build(remove_ar_module(class_name), "permitted_attributes(#{remove_ar_module(class_name)})") %>

    respond_to do |format|
      format.html do
        if @<%= orm_instance.save %>
          redirect_to <%= singular_table_name %>_path(@<%= singular_table_name %>), notice: <%= "'#{human_name} 创建成功.'" %>
        else
          render :new
        end
      end
      format.json { render json: @<%= singular_table_name %> }
    end

  end

  def update
    authorize @<%= singular_table_name %>
    respond_to do |format|
      format.html do
        if @<%= remove_ar_module(orm_instance.update("permitted_attributes(@#{singular_table_name})")) %>
          redirect_to <%= singular_table_name %>_path(@<%= singular_table_name %>), notice: <%= "'#{human_name} 更新成功.'" %>
        else
          render :edit
        end
      end
      format.json { render json: @<%= singular_table_name %> }
    end
  end

  def destroy
    authorize @<%= singular_table_name %>
    @<%= remove_ar_module(orm_instance.destroy) %>
    respond_to do |format|
      format.html { redirect_to <%= index_helper %>_url, notice: <%= "'#{human_name} 删除成功.'" %> }
      format.json { head 200 }
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_<%= singular_table_name %>
      @<%= singular_table_name %> = <%= orm_class.find(remove_ar_module(class_name), "params[:id]") %>
    end

    # Only allow a trusted parameter "white list" through.
    # def <%= "#{singular_table_name}_params" %>
    #   <%- if attributes_names.empty? -%>
    #   params[:<%= singular_table_name %>]
    #   <%- else -%>
    #   params.require(:<%= singular_table_name %>).permit(<%= attributes_names.map { |name| ":#{name}" }.join(', ') %>)
    #   <%- end -%>
    # end
end
<% end -%>
