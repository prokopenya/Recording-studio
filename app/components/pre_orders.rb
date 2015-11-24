class PreOrders < Netzke::Basepack::Grid
  action :all
  def configure(c)
    super
    c.model = "PreOrder"
    c.columns = [
      :track__name,
      :carrier__name,
      { :name => :track__duration,
        :width => 200
      }
    ]
    c.docked_items = [{
        xtype: :toolbar,
        dock: :left,
        items: [:all]
      }]
  end

  action :all do |c|
    c.query3 = ActiveRecord::Base.connection.execute("UPDATE pre_orders
                                                    SET carrier_id = 1")
    c.handler = :all
  end
end
