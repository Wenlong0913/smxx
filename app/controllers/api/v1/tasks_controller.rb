class Api::V1::TasksController < Api::V1::BaseController
  before_action :authenticate!
  before_action :set_produce

  def index
    authorize Task
  end

  def create
    authorize @produce.tasks
    flag, task = Task::Create.(permitted_attributes(Task).merge({resource: @produce, creator_id: @current_user.id}))
    if flag
      render json: {status: 'ok', task: task.as_json(only: [:id])}
    else
      render json: {status: 'failed', error_message: task.errors.messages.inject(''){ |k, v| k += v.join(':') + '. '} }
    end
  end

  private
  def set_produce
    @produce = Produce.find(params["produce_id"])
  end

end
