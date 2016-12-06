module Tracker
  class Summary

    # return tracker 汇总页面数据
    def self.report
      today = Date.today # Time.parse(time)
      visits = Tracker::Visit.all
      today_visits = visits.where('created_at between ? and ?', today.beginning_of_day, today.end_of_day)
      sessions = Tracker::Session.all
      today_sessions = sessions.where('created_at between ? and ?', today.beginning_of_day, today.end_of_day)
      visits_data = {}
      visits_data[:visits_count] = {
        total_browse: visits.count,
        today_browse: today_visits.count,
        session_count: sessions.count,
        today_session: today_sessions.count,
        share_count: '--',
        today_share: '--'
      }
      # chart: 访问量　＆　ip量
      chart_data = [[],[]]
      6.downto(0) do |i|
        visit_data = visits.where("created_at between ? and ?", (today-i.day).beginning_of_day, (today-i.day).end_of_day)
        chart_data[0].push({
          x: (today-i.day).to_time.to_i,
          y: visit_data.present? ? visit_data.pluck(:ip_address).uniq.size : 0
        })
        # sessions_data = visit_data.pluck(:sessions_id).sessions.where("updated_at between ? and ?", (today-i.day).beginning_of_day, (today-i.day).end_of_day)
        sessions_data = visit_data.pluck(:session_id).uniq()
        chart_data[1].push({
          x: (today-i.day).to_time.to_i,
          y: sessions_data.size
        })
      end
      visits_data[:chart_data] = chart_data
      return visits_data
    end

    private

  end
end
