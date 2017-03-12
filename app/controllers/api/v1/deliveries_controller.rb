class  Api::V1::DeliveriesController < Api::V1::BaseController
  before_action :authenticate!

  def index
    authorize Attachment
    deliveries = Delivery.all
    render json: deliveries.as_json
  end

  private
  def attachment_json(attachment)
    attachment.as_json(only: %w(id name), methods: [:attachment_url, :attachment_file_name])
  end

end
