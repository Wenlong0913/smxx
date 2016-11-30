class Admin::Tracker::StatisticsController < Admin::BaseController

  def show
    authorize :'tracker/home', :index?
    today = Date.today
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
