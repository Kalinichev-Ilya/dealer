class BillingWorker
  include Sidekiq::Worker
  include Exmo::API
  def perform
    bills = Exmo::API.last_bills('BTC_USD', 200)

    Rails.logger.info "Received #{bills.count} bills."

    TradeOrderHelper.record(bills)
  end
end
