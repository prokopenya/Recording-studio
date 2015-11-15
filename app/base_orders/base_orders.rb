class BaseOrders < Netzke::Basepack::Grid
  def configure(c)
    super
    c.model = "BaseOrder"
  end
  column :check do |c|
    c.flex = 1
  end
end
