class OrderSweeperJob
  include Sidekiq::Worker

  def perform
    if Settings.project.sxhop? || Settings.project.imolin? || Settings.project.meikemei?
      # 获取配置信息
      current_setting = AppSetting.current
      auto_deliver_days = current_setting.auto_deliver_days.to_f || 30
      auto_cancel_seconds = (current_setting.auto_cancel_hours.to_f || 1) * 60 * 60

      # 自动确认超过规定时间未收货的订单
      Order.delivering.each do |order|
        deliver_days = (Date.today - order.updated_at.localtime.to_date).to_f
        next if auto_deliver_days > deliver_days
        OrderCompletedJob.new.perform(order.id)
      end

      # 自动关闭超过规定时间未支付的订单
      Order.where(status: ['open', 'pending']).each do |order|
        open_seconds = (Time.now - order.updated_at.localtime).to_f
        next if auto_cancel_seconds > open_seconds
        order.cancelled!
      end
    end
  end
end
