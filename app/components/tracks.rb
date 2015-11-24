class Tracks < Netzke::Basepack::Grid

  def configure(c)

    super
    c.model = "Track"
    c.columns = [
      # you may configure columns inline like this:
      {
        :name => :in_orders,
        :width => 50
      },
      :name,
      { :name => :duration,
        :width => 200,
        :format => 'Y-m-d\TH:i:sP'
      },
      #{ name: :duration, format: 'g:i:s' },
      { name: :artist__name, text: "Artist name" },
      { name: :album__name, text: "Album name" },
      { name: :genre__name, text: "Genre name" },
      :author__name
    ]
  end



  action :apply do |c|
    query1 = ActiveRecord::Base.connection.execute("INSERT INTO pre_orders(track_id)
                                                   SELECT id
                                                   FROM tracks
                                                   WHERE tracks.in_orders = 1")

    query2 = ActiveRecord::Base.connection.execute("UPDATE tracks SET in_orders = 0")

  end


  column :name do |c|
    c.flex = 1
  end

end
