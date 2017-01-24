class Api::V1::TaskTypesController < Api::V1::BaseController
  before_action :authenticate!

  def index
    authorize TaskType
    render json: {task_types: TaskType.all.as_json(only: %w(id name ordinal))}
  end

end
