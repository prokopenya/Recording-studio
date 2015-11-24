class Authors < Netzke::Basepack::Grid
  def configure(c)
    super
    c.model = "Author"

    c.columns = [
      { :name => :name,
        :renderer => "uppercase",
        :width => 200
      },
      :first_name,
      :last_name
    ]

  end
end
