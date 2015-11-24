
class Albums < Netzke::Basepack::Grid

  def configure(c)
    super
    c.model = "Album"
    c.columns = [
      # you may configure columns inline like this:
      { name: :artist__name, text: "Artist" },
      :name,
      :released
    ]
  end

  column :name do |c|
    c.flex = 1
  end
end
