class Genres < Netzke::Basepack::Grid
  def configure(c)
    super
    c.model = "Genre"
  end
  
  column :name do |c|
    c.flex = 1
  end
end
