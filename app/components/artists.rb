class Artists < Netzke::Basepack::Grid

  def configure(c)
    super
    c.model = "Artist"
  end


  column :name do |c|
    c.flex = 1
  end
end
