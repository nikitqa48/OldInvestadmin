# encoding: utf-8

require "json"
require 'hpricot'

namespace :upload do

  # Usage: rake upload:cities[cities.geojson]
  task :cities, [:filename] => :environment do |t, args|
    args.with_defaults :filename => "cities.geojson"
    filename = args['filename']

    content = File.read filename
    data = JSON.parse content
    features = data["features"]
    features.each do |item|
      c = City.new
      c.name = item["properties"]["NAME"]
      c.population = item["properties"]["POPULATION"]
      lat = item['geometry']['coordinates'][1]
      lng = item['geometry']['coordinates'][0]
      coords = "#{lat}_#{lng}"
      c.coords = coords
      c.save
    end
  end

  # Usage: rake upload:municipalities[cities.geojson]
  task :municipalities, [:filename] => :environment do |t, args|
    args.with_defaults :filename => "municipalities.geojson"
    filename = args['filename']

    def generate_coords coords
      lat = []
      lng = []
      coords = coords.first
      coords = coords.first if(coords.first[0].is_a? Array)
      coords.each { |coord| lat.push(coord[1]); lng.push(coord[0]) }
      "#{lat.join(",")}_#{lng.join(",")}"
    end

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

  # Usage: rake upload:development_plans[development_plans.kml]
  task :development_plans, [:filename] => :environment do |t, args|
    args.with_defaults :filename => "development_plans.kml"
    filename = args['filename']

    def generate_coords coords
      lat = []
      lng = []
      coords = coords.first
      coords = coords.first if(coords.first[0].is_a? Array)
      coords.each { |coord| lat.push(coord[1]); lng.push(coord[0]) }
      "#{lat.join(",")}_#{lng.join(",")}"
    end

    doc = open(File.join(Rails.root, "public", filename)) do |f|
      doc = Hpricot.XML(f)
      (doc/:Placemark).each do | item |
        coords = ""
        name = item.at('name').innerHTML
        description = item.at('description').innerHTML.gsub(/ style=".*"/, "").gsub(/<!\[CDATA\[/, "").gsub(/\]\]>/, "")
        (lon,lat,elevation) = item.at('coordinates').innerHTML.split(',')
        coords = "#{lat}_#{lon}"

        puts "[*] Saving " + name

        dp = DevelopmentPlan.new
        dp.name = name
        dp.description = description
        dp.coords = coords
        dp.save(:validate => false)
      end
    end
  end
end