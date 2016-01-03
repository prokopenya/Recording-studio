class Tracks < Netzke::Basepack::Grid
=begin
  action :choose_tracks
  js_configure do |c|
    c.onChooseTracks = <<-JS
        function()
        {
          this.chooseTracksQuery({});
        }
    JS
  end
=end
  def configure(c)
    super
    c.model = "Track"
    #c.bbar = [:add, :edit, :del, :search, :in_pre_order]
    c.columns = [
      {
        :name => :in_orders,
        :width => 50,
        :flex => 1
      },
      :name,
      { :name => :duration_tracks,
        :width => 200,
        :flex => 1,
        :getter => ->(r){Time.at(r.duration).utc.strftime("%H:%M:%S")},
        :setter => ->(r, v){r.duration = Time.parse(v).seconds_since_midnight}
      },
      { name: :artist__name, text: "Artist name", flex: 1 },
      { name: :album__name, text: "Album name", flex: 1 },
      { name: :genre__name, text: "Genre name", flex: 1 },
      { name: :author__name, flex: 1}
    ]
    c.docked_items = [{
        xtype: :toolbar,
        dock: :left,
        #items: [:choose_tracks]
      }]
  end

  column :name do |c|
    c.flex = 1
  end

  action :apply do |c|
    super(c)
    insert_to_pre_order = ActiveRecord::Base.connection.execute("INSERT INTO pre_orders(track_id)
                                                                 SELECT id
                                                                 FROM tracks
                                                                 WHERE tracks.in_orders = 1")
    # :(
    $duration_all = Track.where("in_orders = 1").sum(:duration)
    clean = ActiveRecord::Base.connection.execute("UPDATE tracks SET in_orders = 0")
  end

  #endpoint :choose_tracks do |params, this|
  #end
end
