class PreOrders < Netzke::Basepack::Grid
  def configure(c)
    super
    c.model = "PreOrder"
  end
=begin
  action :apply do |c|
    puts "&&&&&&&&&&&&&&&&&&&&&&7777777&&&&&&&&&&&&7"
    query = ActiveRecord::Base.connection.execute("SELECT COUNT(carrier_id)
                                                   FROM pre_orders
                                                   WHERE carrier_id = null")
    puts PreOrder.where("carrier_id = null").count
  end
=end
end
