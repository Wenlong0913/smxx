class Admin::TrackersVisitsController < Admin::BaseController

  def index
    # 汇总
    today = Date.today
    @visits = Tracker::Visit.all
    today_visits = @visits.where('created_at between ? and ?', today.beginning_of_day, today.end_of_day)
    sessions = Tracker::Session.all
    today_sessions = sessions.where('created_at between ? and ?', today.beginning_of_day, today.end_of_day)
    @collect_visits = {
      total_browse: [@visits.count, today_visits.count],
      session_count: [sessions.count, today_sessions.count]
    }
    @chart_data = [[],[]]
    7.times do |i|
      visit_data = @visits.where("created_at between ? and ?", (today-(6-i).day).beginning_of_day, (today-(6-i).day).end_of_day)
      @chart_data[0].push({
        x: (today-(6-i).day).to_time.to_i,
        y: visit_data.present? ? visit_data.map(&:ip_address).uniq.size : 0
      })

      sessions_data = sessions.where("created_at between ? and ?", (today-(6-i).day).beginning_of_day, (today-(6-i).day).end_of_day)
      @chart_data[1].push({
        x: (today-(6-i).day).to_time.to_i,
        y: sessions_data.present? ? sessions_data.count : 0
      })
    end
  end

end
