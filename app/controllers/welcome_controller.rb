class WelcomeController < ApplicationController
  def index
    get_tables()
  end

  def show
    get_tables()

    @table_name = params[:id]

    case params[:sql]
    when '1'
      @message = Artist.find(10).inspect
    when '2'
      @message = Track.where(in_orders: true).inspect
    else
    end
  end

  private
    def get_tables()
      @tables = ActiveRecord::Base.connection.tables.map
      @tables = @tables.reject{|i| i == "schema_migrations"}
    end
end
