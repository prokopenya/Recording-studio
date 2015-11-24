class WindowOne < Netzke::Basepack::Window
  def configure(c)
    super
    c.persistence = true
    c.title = "Window nesting a grid"
    c.width = 800
    c.height = 400
    c.items = [:albums]
  end

  component :albums do |c|
    c.scope = {artist_id: 3}
  end
end
