class CreateElectricPowerTransmissionTranslations < ActiveRecord::Migration
  def change
    create_table :electric_power_transmission_translations do |t|
      t.integer  'electric_power_transmission_id'
      t.string   'locale'
      t.string   'name'
      t.text     'description'
      t.text     'supplier'
      t.text     'owner'
      t.text     'operating_organization'
      t.datetime 'created_at',                     :null => false
      t.datetime 'updated_at',                     :null => false
    end

    add_index 'electric_power_transmission_translations', ['electric_power_transmission_id'], :name => 'index_881562bbe5b9abfb5fe53869aac34b3093e5dd81'
    add_index 'electric_power_transmission_translations', ['locale'], :name => 'index_electric_power_transmission_translations_on_locale'
  end
end