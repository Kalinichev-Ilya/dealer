class TradeOrdersController < ApplicationController
  def index
    @trade_orders = TradeOrder.last(50)
    @count = TradeOrder.all.count
  end
end
