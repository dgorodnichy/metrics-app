Yabeda.configure do
  group :metrics_app do
    counter :index_page_opened_total, comment: "Index page visits"
    counter :users_registered_total, tags: %i[kind], comment: "Users registered"
    counter :orders_placed_total, comment: "Orders placed"
    counter :money_earned_total_cents, comment: "Total GMV in cents"

    gauge :users_online, comment: "Users online"
  end
end
