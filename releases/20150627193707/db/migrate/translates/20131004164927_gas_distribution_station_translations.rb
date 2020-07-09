class GasDistributionStationTranslations < ActiveRecord::Migration
  def change
    create_table 'gas_distribution_station_translations' do |t|
      t.integer 'gas_distribution_station_id'
      t.string 'locale'
      t.text 'name'
      t.text 'description'
      t.text 'owner'
      t.text 'operating_organization'
      t.datetime 'created_at', :null => false
      t.datetime 'updated_at', :null => false
    end
    add_index 'gas_distribution_station_translations', ['locale'], name: 'index_gas_distribution_station_id_on_locale'
    add_index 'gas_distribution_station_translations', ['gas_distribution_station_id'], name: 'index_x2qavbn4awerty140304a2cfe92b74c8d48138ef'
  end
end