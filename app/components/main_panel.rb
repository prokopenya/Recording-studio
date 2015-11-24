class MainPanel < Netzke::Basepack::Viewport

  js_configure do |c|
    c.initComponent = <<-JS
      function()
      {
        this.callParent();
        this.navigation = this.down('panel[itemId="navigation"]');
        this.navigation.on('select', function(m, r) {
          this.netzkeLoadComponent(r.raw.cmp, {container: this.mainPanel, callback: function(cmp) {
            if (cmp.isFloating()) { cmp.show(); }
          }, scope: this});
        }, this);
      }
    JS
  end

  def configure(c)
    c.items = [
      {
        xtype: :treepanel,
        item_id: :navigation,
        flex: 1,
        root: menu,
        title: "TREEMENU"
      },
      :main_tab
    ]
    c.layout = {:type => :hbox}
  end

  component :main_tab do |c|
    c.klass = MainTab
    c.flex = 7
  end

  component :window_one do |c|
    c.klass = WindowOne
  end

  def leaf(text, component, icon = nil)
    { text: text,
      icon: icon && uri_to_icon(icon),
      cmp: component,
      leaf: true
    }
  end

  def menu
    {
      :text => "Windows",
      :expanded => true,
      :children => [leaf("Number One", :window_one)]
    }
  end
end

class MainTab < Netzke::Basepack::TabPanel


  component :albums do |c|
    c.klass = Albums
    c.height = 620
  end

  component :artists do |c|
    c.klass = Artists
  end

  component :authors do |c|
    c.klass = Authors
  end

  component :genres do |c|
    c.klass = Genres
  end

  component :tracks do |c|
    c.klass = Tracks
    c.height = 620
  end

  component :carriers do |c|
    c.klass = Carriers
  end

  component :pre_orders do |c|
    c.klass = PreOrders
  end

  component :type_carriers do |c|
    c.klass = TypeCarriers
  end

  component :albums_artists do |c|
    c.klass = AlbumsArtists
    c.title = "Albums and Artists"
  end

  component :tracks_albums do |c|
    c.klass = TracksAlbums
    c.title = "Tracks and Albums"
  end

  component :tracks_artists do |c|
    c.klass = TracksArtists
    c.title = "Tracks and Artists"
  end

  component :tracks_genres do |c|
    c.klass = TracksGenres
    c.title = "Tracks and Genres"
  end

  def configure(c)
    super
    c.items = [:tracks_genres, :tracks_artists, :tracks_albums, :albums_artists, :albums,
               :artists, :authors, :genres, :tracks, :pre_orders, :carriers, :type_carriers]
  end
end
