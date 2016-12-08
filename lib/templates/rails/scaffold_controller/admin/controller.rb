# csv support
require 'csv'
<% if namespaced? -%>
require_dependency "<%= namespaced_path %>/application_controller"

<% end -%>
<% module_namespacing do -%>
class <%= controller_class_name %>Controller < Admin::BaseController
  before_action :set_<%= singular_table_name %>, only: [:show, :edit, :update, :destroy]

  # GET <%= route_url %>
  def index
    authorize <%= remove_ar_module(class_name) %>
    @filter_colums = %w(id)
    @<%= plural_table_name %> = build_query_filter(<%= orm_class.all(remove_ar_module(class_name)) %>, only: @filter_colums)
    respond_to do |format|
      if params[:json].present?
        format.html { send_data(@<%= plural_table_name %>.to_json, filename: "<%= plural_table_name %>-#{Time.now.localtime.strftime('%Y%m%d%H%M%S')}.json") }
      elsif params[:xml].present?
        format.html { send_data(@<%= plural_table_name %>.to_xml, filename: "<%= plural_table_name %>-#{Time.now.localtime.strftime('%Y%m%d%H%M%S')}.xml") }
      elsif params[:csv].present?
        # as_csv =>  () | only: [] | except: []
        format.html { send_data(@<%= plural_table_name %>.as_csv(only: []), filename: "<%= plural_table_name %>-#{Time.now.localtime.strftime('%Y%m%d%H%M%S')}.csv") }
      else
        format.html
      end
    end
  end

  # GET <%= route_url %>/1
  def show
    authorize @<%= singular_table_name %>
  end

  # GET <%= route_url %>/new
  def new
    authorize <%= remove_ar_module(class_name) %>
    @<%= singular_table_name %> = <%= orm_class.build(remove_ar_module(class_name)) %>
  end

  # GET <%= route_url %>/1/edit
  def edit
    authorize @<%= singular_table_name %>
  end

  # POST <%= route_url %>
  def create
    authorize <%= remove_ar_module(class_name) %>
    @<%= singular_table_name %> = <%= orm_class.build(remove_ar_module(class_name), "permitted_attributes(#{remove_ar_module(class_name)})") %>

    if @<%= orm_instance.save %>
      redirect_to <%= singular_table_name %>_path(@<%= singular_table_name %>), notice: <%= "'#{human_name} 创建成功.'" %>
    else
      render :new
    end
  end

  # PATCH/PUT <%= route_url %>/1
  def update
    authorize @<%= singular_table_name %>
    if @<%= remove_ar_module(orm_instance.update("permitted_attributes(@#{singular_table_name})")) %>
      redirect_to <%= singular_table_name %>_path(@<%= singular_table_name %>), notice: <%= "'#{human_name} 更新成功.'" %>
    else
      render :edit
    end
  end

  # DELETE <%= route_url %>/1
  def destroy
    authorize @<%= singular_table_name %>
    @<%= remove_ar_module(orm_instance.destroy) %>
    redirect_to <%= index_helper %>_url, notice: <%= "'#{human_name} 删除成功.'" %>
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
    #   params.require(:<%= singular_table_name %>).permit(policy(@<%= singular_table_name %>).permitted_attributes)
    #   <%- end -%>
    # end
end
<% end -%>
