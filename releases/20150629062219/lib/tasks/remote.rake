# encoding: utf-8
# coding: utf-8

require "net/http"
require "uri"

def centroid (coordinates)
	coords = coordinates.split('_')
	lons = coords[0].split(',').map {|l| l.to_f}
	lats = coords[1].split(',').map {|l| l.to_f}
	meanLat = lats.instance_eval { reduce(:+) / size.to_f }
	meanLon = lons.instance_eval { reduce(:+) / size.to_f }

	return meanLat.round(5), meanLon.round(5)
end

def get_platform_data (platform)
	lat, lon = centroid platform.coords

	data = {
		'PROPERTY[NAME][0]' => platform.name,
		'PROPERTY[76][0]'		=> platform.description,
		'PROPERTY[163][0]'	=> platform.address,
		'PROPERTY[166][0]' 	=> platform.name,
		'PROPERTY[331][0]' 	=> platform.contact_person,
		'PROPERTY[333][0]' 	=> platform.contact_person_phone,
		'PROPERTY[168][0]'	=> platform.description,
		'PROPERTY[172][0]' 	=> platform.area,
		'PROPERTY[189][0]'	=> platform.airport_distance,
		'PROPERTY[193][0]'	=> platform.seaport_distance,
		'PROPERTY[336][0]'	=> platform.gas,
		'PROPERTY[341][0]'	=> platform.electricity,
		'PROPERTY[350][0]'	=> platform.water,
		'PROPERTY[353][0]'	=> platform.sewage_plants,
		'PROPERTY[298][0]' 	=> lat,
		'PROPERTY[299][0]' 	=> lon
	}

	case platform.ownership_type_code
	when 0
		ownership_type_code = 27
	when 2
		ownership_type_code = 25
	end

	if defined? ownership_type_code and !ownership_type_code.nil?
		data['PROPERTY[175]'] = ownership_type_code
	end

	return Hash[ data.map { | _, value | [_, value.to_s] } ] # .to_s map over hash, lol ruby
end

def get_project_data (project)
	case project.economic_activity_code
	when 1
		activity_code = 116
	when 2
		activity_code = 116
	when 5
		activity_code = 123
	when 10
		activity_code = 102
	when 11
		activity_code = 102
	when 12
		activity_code = 102
	when 13
		activity_code = 124
	when 14
		activity_code = 124
	when 15
		activity_code = 115
	# when 16
	# 	activity_code = "Производство табачных изделий"
	when 17
		activity_code = 108
	# when 18
	# 	activity_code = "Производство одежды; выделка и крашение меха"
	when 19
		activity_code = 109
	when 20
		activity_code = 110
	when 21
		activity_code = 111
	# when 22
	# 	activity_code = "Издательская и полиграфическая деятельность, тиражирование записанных носителей информации"
	# when 23
	# 	activity_code = "Производство кокса, нефтепродуктов и ядерных материалов"
	when 24
		activity_code = 112
	when 25
		activity_code = 101
	when 26
		activity_code = 113
	when 27
		activity_code = 114
	when 28
		activity_code = 114
	# when 29
	# 	activity_code = "Производство машин и оборудования"
	# when 30
	# 	activity_code = "Производство офисного оборудования и вычислительной техники"
	when 31
		activity_code = 104
	when 32
		activity_code = 104
	# when 33
	# 	activity_code = "Производство медицинских изделий; средств измерений, контроля, управления и испытаний; оптических приборов, фото- и кинооборудования; часов"
	when 34
		activity_code = 105
	when 35
		activity_code = 105
	# when 36
	# 	activity_code = "Производство мебели и прочей продукции, не включенной в другие группировки"
	# when 37
	# 	activity_code = "Обработка вторичного сырья"
	when 40
		activity_code = 107
	# when 41
	# 	activity_code = "Сбор, очистка и распределение воды"
	when 45
		activity_code = 126
	# when 50
	# 	activity_code = "Торговля автотранспортными средствами и мотоциклами, их техническое обслуживание и ремонт"
	when 51
		activity_code = 127
	when 52
		activity_code = 127
	when 55
		activity_code = 128
	# when 60
	# 	activity_code = "Деятельность сухопутного транспорта"
	# when 61
	# 	activity_code = "Деятельность водного транспорта"
	# when 62
	# 	activity_code = "Деятельность воздушного и космического транспорта"
	# when 63
	# 	activity_code = "Вспомогательная и дополнительная транспортная деятельность"
	when 64
		activity_code = 129
	when 65
		activity_code = 130
	# when 66
	# 	activity_code = "Страхование"
	when 67
		activity_code = 130
	when 70
		activity_code = 117
	# when 71
	# 	activity_code = "Аренда машин и оборудования без оператора; прокат бытовых изделий и предметов личного пользования"
	# when 72
	# 	activity_code = "Деятельность, связанная с использованием вычислительной техники и информационных технологий"
	# when 73
	# 	activity_code = "Научные исследования и разработки"
	when 74
		activity_code = 121
	when 75
		activity_code = 118
	when 80
		activity_code = 119
	when 85
		activity_code = 120
	# when 90
	# 	activity_code = "Сбор сточных вод, отходов и аналогичная деятельность"
	# when 91
	# 	activity_code = "Деятельность общественных объединений"
	# when 92
	# 	activity_code = "Деятельность по организации отдыха и развлечений, культуры и спорта"
	when 93
		activity_code = 121
	when 95
		activity_code = 122
	# when 96
	# 	activity_code = "Деятельность частных домашних хозяйств по производству товаров для собственного потребления"
	# when 97
	# 	activity_code = "Деятельность частных домашних хозяйств по предоставлению услуг для собственного пользования"
	# when 99
	# 	activity_code = "Деятельность экстерриториальных организаций"
	end

	case project.project_type_id
	when 2
		type_id = 11
	when 3
		type_id = 10
	end

	coords = project.coords.split('_')
	lat = coords[0].to_f.round(5)
	lon = coords[1].to_f.round(5)

	data = {
		'PROPERTY[NAME][0]' => project.name,
		'PROPERTY[45][0]'		=> project.description,
		'PROPERTY[22][0]'		=> project.territory,
		'PROPERTY[27][0]'		=> project.common_price.to_f * 1000000,
		'PROPERTY[29][0]'		=> project.required_investments.to_f * 1000000,
		'PROPERTY[30][0]'		=> (project.common_price.to_f - project.required_investments.to_f) * 1000000,
		'PROPERTY[33][0]'		=> project.jobs,
		'PROPERTY[298][0]' 	=> lon,
		'PROPERTY[299][0]' 	=> lat
	}

	if defined? activity_code and !activity_code.nil?
		data['PROPERTY[20][0][VALUE]'] = activity_code
	end

	if defined? type_id and !type_id.nil?
		data['PROPERTY[49]'] = type_id
	end

	return Hash[ data.map { | _, value | [_, value.to_s] } ] # .to_s map over hash, lol ruby
end

def get_zone_data (zone)
	lat, lon = centroid zone.coords

	data = {
		'PROPERTY[NAME][0]' => zone.name,
		'PROPERTY[240][0]'	=> zone.address,
		'PROPERTY[249][0]'	=> zone.free_square,
		'PROPERTY[397][0]'	=> zone.airport_distance,
		'PROPERTY[399][0]'	=> zone.seaport_distance,
		'PROPERTY[358][0]'	=> zone.gas,
		'PROPERTY[363][0]'	=> zone.electricity,
		'PROPERTY[372][0]'	=> zone.water,
		'PROPERTY[375][0]'	=> zone.sewage_plants,
		'PROPERTY[298][0]' 	=> lat,
		'PROPERTY[299][0]' 	=> lon
	}

	return Hash[ data.map { | _, value | [_, value.to_s] } ] # .to_s map over hash, lol ruby
end

def auth()
	puts "[*] Authorizing..."

	# Requisites
	user = 'r48'
	password = 'bbc890'

	uri = URI.parse("http://invest.gov.ru/reg_admin/")
	uri.query = {
		"login" 				=> "yes",
		"AUTH_FORM" 		=> "Y",
		"TYPE" 					=> "AUTH",
		"backurl" 			=> "/reg_admin/",
		"USER_LOGIN"		=> user,
		"USER_PASSWORD"	=> password,
		"USER_REMEMBER"	=> "Y",
		"Login" 				=> "Войти"
  }.to_query

  # Log in
  sessid = ''
	cookies = ''

	Net::HTTP.start(uri.host, uri.port) do |http|
		request = Net::HTTP::Post.new(uri.request_uri)
		response = http.request request

		# Get sessid
		re = /'bitrix_sessid':'(.{32})'/
		sessid = re.match(response.body)[1]

		# Get cookies
		all_cookies = response.get_fields('set-cookie')
		cookies_array = Array.new
		all_cookies.each { | cookie |
			cookies_array.push(cookie.split('; ')[0])
		}
		cookies = cookies_array.join('; ')
	end

	return sessid, cookies
end

def post(path, sessid, cookies, model, data, remote_code = false)
	uri = URI.parse "http://invest.gov.ru/reg_admin/"
	Net::HTTP.start(uri.host, uri.port) do |http|
		uri.path 	= path

		if remote_code
			uri.query = { "edit" => "Y", "CODE" => remote_code }.to_query
			puts "[#{remote_code}] Updating \"#{model.name}\"..."
		else
			uri.query = { "edit" => "Y" }.to_query
			puts "[*] Posting \"#{model.name}\"..."
		end

		data['sessid'] = sessid
		data['iblock_submit'] = 'Сохранить'

		request = Net::HTTP::Post.new(uri.request_uri, {
			"Cookie" => cookies,
			"Content-Type" => "application/x-www-form-urlencoded"
		})

		request.body = data.to_query
		response = http.request request

		# Save remote code
		if !remote_code
			# Get page with all records
			uri.query = {"SHOWALL_1" => "1"}.to_query
			request = Net::HTTP::Get.new(uri.request_uri, {"Cookie" => cookies})
			response = http.request request

			# Get last occurence of CODE
			remote_code = response.body.scan(/CODE=(\d*)/).last[0]

			# Save as remote code
			model.remote_code = remote_code
			model.save(:validate => false)
		end
	end
end

def get_remote_code(path, sessid, cookies, model)
	remote_code = false

	uri = URI.parse "http://invest.gov.ru/reg_admin/"
	Net::HTTP.start(uri.host, uri.port) do |http|
		uri.path 	= path

		# Get page with all records
		uri.query = {"SHOWALL_1" => "1"}.to_query
		request = Net::HTTP::Get.new(uri.request_uri, {"Cookie" => cookies})
		response = http.request request
		text = response.body.force_encoding 'utf-8'

		# Get last occurence of CODE
		re = Regexp.new("#{model.name}.{170}CODE=(\\d*)", Regexp::MULTILINE)

		result = text.scan(re)
		remote_code = result.last()
		if (remote_code != nil)
			remote_code = remote_code[0]
		end
	end

	return remote_code
end

def imports
	return {
		"/reg_admin/invest_places.php" => {
			model: Platform,
			get_data: ->(platform) { get_platform_data(platform) }
		},
  	"/reg_admin/invest_project.php" => {
  		model: Project,
  		get_data: ->(project) { get_project_data(project) }
  	},
  	"/reg_admin/invest_zona.php" => {
  		model: SpecialEconomicZone,
  		get_data: ->(zone) { get_zone_data(zone) }
  	}
	}
end

namespace :remote do
  desc "Update data on remote server and post new data"
  task update: :environment do

  	sessid, cookies = auth()

		imports().each do |path, value|
  		model 		= value[:model]
  		get_data 	= value[:get_data]

  		modelsToPost = model.all.find_all { | model |  
  			!defined? model.remote_code or model.remote_code.nil?
  		}

  		modelsToUpdate = model.all.find_all { | model |  
  			defined? model.remote_code and !model.remote_code.nil?
  		}

  		modelsToPost.each do | model |
  			post path, sessid, cookies, model, get_data.(model)
  		end

  		modelsToUpdate.each do | model |
  			post path, sessid, cookies, model, get_data.(model), model.remote_code
  		end
  	end

  	puts "[*] Done."
 	end

  desc "Fix remote code"
  task fix_code: :environment do

  	sessid, cookies = auth()

		imports().each do |path, value|
  		model 		= value[:model]
  		get_data 	= value[:get_data]

  		models = model.all.find_all { | model |  
  			defined? model.remote_code and !model.remote_code.nil?
  		}

  		models.each do | model |
  			remote_code = get_remote_code(path, sessid, cookies, model)
  			puts model.name
  			puts remote_code.inspect
  			puts "==========================================="
  			model.remote_code = remote_code
  			model.save(:validate => false)
  		end
  	end
  end

end