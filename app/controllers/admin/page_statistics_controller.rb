class Admin::PageStatisticsController< Admin::BaseController
  def index

    if params[:times]
      # Tracker::Visit.where("created_at between ? and ?", today.beginning_of_day, today.end_of_day)
    else
      today = Date.today
      visits = Tracker::Visit.where("created_at between ? and ?", today.beginning_of_day, today.end_of_day)
    end


    uniq_visits_url = Tracker::Visit.all.map(&:url).uniq
    @visits_data = []
    uniq_visits_url.each do |url|
      this_page_data = visits.select { |visit| visit.url == url }
      next unless this_page_data.present?
      @visits_data.push({
        url: url,
        count: this_page_data.count,
        ip: this_page_data.map(&:ip_address).uniq.size
      })
    end
  end
end
