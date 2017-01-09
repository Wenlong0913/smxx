# csv support
require 'csv'
class Admin::TasksController < Admin::BaseController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :set_produce
  # GET /admin/tasks
  def index
    authorize Task
    @filter_colums = %w(id)
    @tasks = build_query_filter(Task.all, only: @filter_colums).page(params[:page])
    respond_to do |format|
      if params[:json].present?
        format.html { send_data(@tasks.to_json, filename: "tasks-#{Time.now.localtime.strftime('%Y%m%d%H%M%S')}.json") }
      elsif params[:xml].present?
        format.html { send_data(@tasks.to_xml, filename: "tasks-#{Time.now.localtime.strftime('%Y%m%d%H%M%S')}.xml") }
      elsif params[:csv].present?
        # as_csv =>  () | only: [] | except: []
        format.html { send_data(@tasks.as_csv(only: []), filename: "tasks-#{Time.now.localtime.strftime('%Y%m%d%H%M%S')}.csv") }
      else
        format.html
      end
    end
  end

  # GET /admin/tasks/1
  def show
    authorize @task
  end

  # GET /admin/tasks/new
  def new
    authorize Task
    @task = Task.new
  end

  # GET /admin/tasks/1/edit
  def edit
    authorize @task
  end

  # POST /admin/tasks
  def create
    authorize Task
    if params[:taskTypeIds].present? && params[:taskTypeIds].size > 0
      params[:taskTypeIds].uniq.each do |taskType|
        taskType= TaskType.find(taskType)
        next if @produce.tasks.where(task_type_id: taskType).present?
        @task = @produce.tasks.new(task_type: taskType, title: taskType.name, creator_id: current_user.id, ordinal: taskType.ordinal)
        if @task.save
          @produce.update(status: 'processing')
        else
          return render json: @task.errors.as_json, status: :failed
        end
      end
      render json: {text: "数据创建成功！"}, status: :ok
    else
      render json: "数据为空创建失败！", status: :failed
    end
  end

  # PATCH/PUT /admin/tasks/1
  def update
    authorize @task
    if @task.update(permitted_attributes(@task))
      redirect_to admin_task_path(@task), notice: "#{Task.model_name.human} 更新成功."
    else
      render :edit
    end
  end

  # DELETE /admin/tasks/1
  def destroy
    authorize @task
    @task.destroy
    redirect_to admin_tasks_url, notice: "#{Task.model_name.human} 删除成功."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = @produce.tasks.find(params[:id])
    end

    def set_produce
      @produce = Produce.find(params[:produce_id])
    end


    # Only allow a trusted parameter "white list" through.
    # def admin_task_params
    #       #   params[:admin_task]
    #       # end
end
