class CreateGasDistributionStations < ActiveRecord::Migration
  def change
    create_table :gas_distribution_stations do |t|
      t.string :name #Наименование
      t.text :description #Описание
      t.integer :municipality_id #Муниципалитет
      t.integer :city_id #Поселение
      t.float :out_1 #Выход Мпа 1
      t.float :thousand_m3h_1 #Тыс. м. куб. час 1
      t.float :million_m3y_1 #Миллионы м. куб. год 1
      t.float :project_million_m3y_1 #Проектируемые миллионы м. куб. год 1
      t.float :actual_million_m3y_1 #Фактические миллионы м. куб. год 1
      t.float :loading_1 #Загрузка, проценты 1
      t.float :out_2
      t.float :thousand_m3h_2
      t.float :million_m3y_2
      t.float :project_million_m3y_2
      t.float :actual_million_m3y_2
      t.float :loading_2
      t.text :owner #Собственник
      t.date :relevance #Актуальность данных
      t.text :coords

      t.text :operating_organization
      t.integer :owner_id

      #
      t.timestamps
    end
    add_index(:gas_distribution_stations, :municipality_id)
    add_index(:gas_distribution_stations, :city_id)
    add_index(:gas_distribution_stations, :owner_id)
  end
end
