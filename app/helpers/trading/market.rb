module Trading
  module Market
    extend self

    def make_order; end

    # S=(S1*V1+S2*V2+S3*V3+...Sn*Vn)/(V1+V2+V3...Vn)
    def weighted_average(amount, rate_symbol, order_type)
      order_book = Hitbtc::API.orderbook(rate_symbol)[order_type]
      sorted_order_book = order_book.sort_by { |order| order[:price] }
      volume_found = 0
      taken_orders = []
      while amount > volume_found
        sorted_order_book.map do |order|
          taken_orders << order
          volume_found += order['size'].to_i
        end
      end
      sum_rates_volumes = 0
      sum_volumes = 0
      taken_orders.map do |order|
        sum_rates_volumes += order['price'].to_i * order['size'].to_i
        sum_volumes += order['size'].to_i
      end
      sum_rates_volumes / sum_volumes
    end
  end
end
