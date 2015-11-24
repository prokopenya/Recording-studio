class TracksAlbums < Netzke::Basepack::Form

  js_configure do |c|
    c.initComponent = <<-JS
      function()
      {
        this.callParent();
        this.netzkeGetComponent('albums').on('rowclick', function(grid, record)
        {
          this.serverSetAlbum({album_id: record.getId()});
          this.netzkeGetComponent('tracks').getStore().load();
        }, this);
      }
    JS
  end

  def configure(c)
    super
      c.items = [:albums, :tracks]
      c.layout = {type: :vbox, align: :stretch}
  end

  component :albums do |c|
    c.flex = 1
    c.height = 250
  end

  component :tracks do |c|
    c.flex = 1
    c.scope = {album_id: component_session[:current_album_id]}
    c.height = 350
  end

  endpoint :server_set_album do |params, this|
    component_session[:current_album_id] = params[:album_id]
  end
end
