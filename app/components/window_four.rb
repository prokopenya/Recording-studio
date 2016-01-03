class WindowOne < Netzke::Basepack::Window
  def configure(c)
    super
    c.persistence = true
    c.title = "Window nesting a grid"
    c.width = 800
    c.height = 400
    c.items = [:tracks]
  end

  component :tracks do |c|
    c.scope = ->(rel) { rel.where("duration > 240) }
  end
end
