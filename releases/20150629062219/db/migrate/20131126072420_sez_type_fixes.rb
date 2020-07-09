class SezTypeFixes < ActiveRecord::Migration
  #lxkuz: I have problems on client caused by it, so I change string -> integer
  def up
      connection.execute(%q{
        alter table special_economic_zones
        alter column special_economic_zone_type_code
        type integer using cast(special_economic_zone_type_code as integer)
      })

      connection.execute(%q{
        alter table special_economic_zone_types
        alter column code
        type integer using cast(code as integer)
      })
  end

  def down
    change_column :special_economic_zones, :special_economic_zone_type_code, :string
    change_column :special_economic_zone_types, :code, :string
  end

end
