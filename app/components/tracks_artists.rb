class TracksArtists < Netzke::Basepack::Form

  js_configure do |c|
    c.initComponent = <<-JS
      function()
      {
        this.callParent();
        this.netzkeGetComponent('artists').on('rowclick', function(grid, record)
        {
          this.serverSetArtist({artist_id: record.getId()});
          this.netzkeGetComponent('tracks').getStore().load();
        }, this);
      }
    JS
  end

  def configure(c)
    super
      c.items = [:artists, :tracks]
      c.layout = {type: :vbox, align: :stretch}
  end

  component :artists do |c|
    c.flex = 1
    c.height = 200
  end

  component :tracks do |c|
    c.flex = 1
    c.scope = {artist_id: component_session[:current_artist_id]}
    c.height = 350
  end

  endpoint :server_set_artist do |params, this|
    component_session[:current_artist_id] = params[:artist_id]
  end
end
