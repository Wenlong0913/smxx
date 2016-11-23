class Admin::Tracker::StatisticsController < Admin::BaseController

  def show
    # parms[:times], 接收查看时间区域数组
    if params[:times]
      # today = Date.today
      # Tracker::Visit.where("created_at between ? and ?", today.beginning_of_day, today.end_of_day)
    else
      today = Date.today
    end
    visits = Tracker::Visit.where("created_at between ? and ?", today.beginning_of_day, today.end_of_day)

    uniq_visits_url = visits.pluck(:url).uniq
    @visits_data = []
    uniq_visits_url.each do |url|
      this_page_data = visits.select { |visit| visit.url == url }
      next unless this_page_data.present?
      @visits_data.push({
        url: url,
        count: this_page_data.count,
        ip: this_page_data.pluck(:ip_address).uniq.size,
        user_count: this_page_data.count
      })
    end
  end

end
