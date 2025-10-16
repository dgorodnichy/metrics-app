class User < ApplicationRecord
  after_create :track_user

  enum :kind, { client: 0, courier: 1 }

  private

  def track_user
    Yabeda.metrics_app.users_registered_total.increment({ kind: kind})
  end
end
