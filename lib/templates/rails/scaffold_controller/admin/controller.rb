<%
def strip_admin_module(s)
  s.gsub(/^Admin::/, '')
end
# binding.pry
%>
<% if namespaced? -%>
require_dependency "<%= namespaced_path %>/application_controller"

<% end -%>
<% module_namespacing do -%>
class <%= controller_class_name %>Controller < Admin::BaseController
  before_action :set_<%= singular_table_name %>, only: [:show, :edit, :update, :destroy]

  # GET <%= route_url %>
  def index
    authorize <%= strip_admin_module(class_name) %>
    @<%= plural_table_name %> = <%= orm_class.all(strip_admin_module(class_name)) %>
  end

  # GET <%= route_url %>/1
  def show
    authorize @<%= singular_table_name %>
  end

  # GET <%= route_url %>/new
  def new
    authorize <%= strip_admin_module(class_name) %>
    @<%= singular_table_name %> = <%= orm_class.build(strip_admin_module(class_name)) %>
  end

  # GET <%= route_url %>/1/edit
  def edit
    authorize @<%= singular_table_name %>
  end

  # POST <%= route_url %>
  def create
    authorize <%= strip_admin_module(class_name) %>
    @<%= singular_table_name %> = <%= orm_class.build(strip_admin_module(class_name), "permitted_attributes(#{strip_admin_module(class_name)})") %>

    if @<%= orm_instance.save %>
      redirect_to <%= singular_table_name %>_path(@<%= singular_table_name %>), notice: <%= "'#{human_name} 创建成功.'" %>
    else
      render :new
    end
  end

  # PATCH/PUT <%= route_url %>/1
  def update
    authorize @<%= singular_table_name %>
    if @<%= strip_admin_module(orm_instance.update("permitted_attributes(@#{singular_table_name})")) %>
      redirect_to <%= singular_table_name %>_path(@<%= singular_table_name %>), notice: <%= "'#{human_name} 更新成功.'" %>
    else
      render :edit
    end
  end

  # DELETE <%= route_url %>/1
  def destroy
    authorize @<%= singular_table_name %>
    @<%= strip_admin_module(orm_instance.destroy) %>
    redirect_to <%= index_helper %>_url, notice: <%= "'#{human_name} 删除成功.'" %>
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_<%= singular_table_name %>
      @<%= singular_table_name %> = <%= orm_class.find(strip_admin_module(class_name), "params[:id]") %>
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
