class WelcomeController < ApplicationController
  def index
    get_tables()
  end

  def show
    get_tables()

    @table_name = params[:id]

    get_columns_from()

  end

  private
    def get_tables()
      @tables = ActiveRecord::Base.connection.tables.map
      @tables = @tables.reject{|i| i == "schema_migrations"}
    end

    def get_columns_from()
      @models = []

      @tables.each do |table|
        @models << table.capitalize.singularize.camelize.constantize
      end

      @columns_name = []

      @models.each do |model|
        @columns_name << model.columns.map {|c| c.name }
      end
    end

end
