module TradeOrderHelper
  extend self

  def record(array)
    array.each do |order|
      next if order_exist?(order)
      trade_order = TradeOrder.create!(trade_id: order['trade_id'],
                                       trade_type: order['type'],
                                       quantity: order['quantity'],
                                       price: order['price'],
                                       amount: order['amount'],
                                       unix_date: order['date'])
      Rails.logger.info("New trade order recorded: #{trade_order.id}")
    end
  end

  private

  def order_exist?(order)
    TradeOrder.where(trade_id: order['trade_id'],
                     trade_type: order['type'],
                     quantity: order['quantity'],
                     price: order['price'],
                     amount: order['amount'],
                     unix_date: order['date']).any?
  end
end
