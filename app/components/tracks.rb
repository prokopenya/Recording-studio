class Tracks < Netzke::Basepack::Grid
  def configure(c)
    super
    c.model = "Track"
    c.bbar = [:add, :edit, :del, :add_in_form, :apply, :search, :do_something]
  end



  action :apply do |c|
    query1 = ActiveRecord::Base.connection.execute("INSERT INTO pre_orders(track_id)
                                                   SELECT id
                                                   FROM tracks
                                                   WHERE tracks.in_orders = 1")

    query2 = ActiveRecord::Base.connection.execute("UPDATE tracks SET in_orders = 0")

  end

  action :do_something do |c|
    c.text = c.tooltip = "My cool action"

    #PreOrder.connection.update_all("UPDATE in_orders, name FROM tracks WHERE in_orders = true AND name != null")
  end

  column :name do |c|
    c.flex = 1
  end

end
