class HelloController < ApplicationController
  after_action :update_metrics

  def index
    render plain: "Здарова, бандиты!"
  end

  def seed
    GenerateEverythingJob.perform_now
    render plain: "Done!"
  end

  def refresh_online
    users_online_count = rand(5..30)
    Yabeda.metrics_app.users_online.set({}, users_online_count)
    render plain: "#{users_online_count} users online now"
  end

  private

  def update_metrics
    Yabeda.metrics_app.index_page_opened_total.increment
  end
end
