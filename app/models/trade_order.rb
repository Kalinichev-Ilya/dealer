# "trade_id"=>34928465,
# "trade_type"=>"buy",
# "quantity"=>"0.02873758",
# "price"=>"13698.99999999",
# "amount"=>"393.67610841",
# "unix_date"=>1514116770

class TradeOrder < ApplicationRecord
  def time
    Time.at(unix_date).strftime('%I:%M %p')
  end
end
