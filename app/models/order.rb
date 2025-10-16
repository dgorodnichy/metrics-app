class Order < ApplicationRecord
  after_create :track_order

  private

  def track_order
    Yabeda.metrics_app.orders_placed_total.increment
    Yabeda.metrics_app.money_earned_total_cents.increment({}, by: amount)
  end
end
