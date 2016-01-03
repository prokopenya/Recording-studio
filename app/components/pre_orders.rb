class PreOrders < Netzke::Basepack::Grid
  action :check_max_duration

  js_configure do |c|
    c.on_apply = <<-JS
    function()
    {
      this.addTracks({}, function(result)
      {
          Ext.Msg.alert('Message', result);
      })
    }
    JS

    c.onCheckMaxDuration = <<-JS
      function()
        {
          this.checkMaxDurationQuery({});
        }
    JS
  end

  def configure(c)
    super
    c.model = "PreOrder"
    c.columns = [
      :track__name,
      :carrier__name
    ]
    c.bbar = [:add, :edit, :del, :apply, :check_max_duration]

  end

  action :check_max_duration do |c|
    order1 = ActiveRecord::Base.connection.execute("UPDATE pre_orders SET carrier_id = 1")
    temp            = Carrier.where(id:1).sum(:type_carrier_id)
    @price_order    = TypeCarrier.where(id: temp).sum(:price_of_record)
    @name_carrier   = TypeCarrier.where(id: temp).pluck(:name)
    @id_carrier     = TypeCarrier.where(id: temp).pluck(:id)
    @time           = TypeCarrier.where(id: temp).sum(:max_duration)
    @price1         = TypeCarrier.where(id: temp).sum(:price_of_record)

    @max_duration = []
    (1..5).each do |i|
      @max_duration << TypeCarrier.where(id:i).sum(:max_duration)
    end

    @prices= []
    (1..5).each do |i|
      @prices << TypeCarrier.where(id:i).sum(:price_of_record)
    end
  end

  endpoint :add_tracks do |params, this|
    if ($duration_all < @time)
      this.netzke_set_result("Треки добавлены в заказ на #{@name_carrier}. Общая длительность треков: #{Time.at($duration_all).utc.strftime("%H:%M:%S")}.\n Стоимость заказа равна: #{@price1} рублей")
    else
      this.netzke_set_result("Длительность треков больше, чем допустимая длительность носителя. Текущая длительность #{Time.at($duration_all).utc.strftime("%H:%M:%S")}")
    end
  end

  #endpoint :check_max_duration_query do |params, this|
  #end
end
