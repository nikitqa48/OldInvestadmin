require "json"

namespace :municipalities do
  task :init => [:environment] do
    def generate_coords coords
      lat = []
      lng = []
      coords = coords.first
      coords = coords.first if(coords.first[0].is_a? Array)
      coords.each_with_index do |coord, i|
        #if i == 0 || i % 3 == 0 || i == (coords.size - 1)
          lat.push(coord[1]); lng.push(coord[0])
        #end
      end
      "#{lat.join(",")}_#{lng.join(",")}"
    end

    filename = "municipalities.txt"
    content = File.read(File.join(Rails.root, "public", filename))
    data = JSON.parse content
    features = data["features"]
    features.each do |item|
      m = Municipality.new
      m.name = item["properties"]["NAME"]
      m.coords = generate_coords(item["geometry"]["coordinates"])
      m.owner_id = User.first.id
      m.save
    end
  end

  task :drop => [:environment] do
    Municipality.destroy_all
  end

end