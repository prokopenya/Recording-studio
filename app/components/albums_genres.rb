class AlbumsGenres < Netzke::Basepack::Form

  js_configure do |c|
    c.initComponent = <<-JS
      function()
      {
        this.callParent();
        this.netzkeGetComponent('genres').on('rowclick', function(grid, record)
        {
          this.serverSetGenre({genre_id: record.getId()});
          this.netzkeGetComponent('albums').getStore().load();
        }, this);
      }
    JS
  end

  def configure(c)
    super
      c.items = [:genres, :albums]
      c.layout = {type: :vbox, align: :stretch}
  end

  component :genres do |c|
    c.flex = 1
    c.height = 350
  end

  component :albums do |c|
    c.flex = 1
    c.scope = {genre_id: component_session[:current_genre_id]}
    c.height = 200
  end

  endpoint :server_set_genre do |params, this|
    component_session[:current_genre_id] = params[:genre_id]
  end

end
