class Carriers < Netzke::Basepack::Grid
  def configure(c)
    super
    c.model = "Carrier"
  end
#  column :name do |c|
#    c.flex = 1
#  end
end
