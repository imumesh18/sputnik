class AddCity < SeedMigration::Migration
  def up
    city_list = [
      [ "Jakarta", true ],
      [ "Surabaya", true ],
      [ "Bandung", true ],
      [ "Medan", true ],
      [ "Bekasi", true],
      [ "Semarang", true]
    ]

    city_list.each do |name, is_enable|
      City.create( :name => name, :is_enabled => is_enable )
    end
  end

  def down

  end
end
