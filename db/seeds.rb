country_list = [
  [ "Belarus"],
  [ "Russia" ]
]

city_list = [
  ["Minsk", 1],
  ["Grondo", 1],
  ["Mogilev", 1],
  ["Brest", 1],
  ["Vitebsk", 1],
  ["Gomel", 1],
  ["Moscow", 2],
  ["Saint Petersburg", 2],
  ["Siberia", 2],
  ["Novosibirsk", 2],
  ["Smolensk", 2],
  ["Yekaterinburg", 2],
];

make_list = [["BMW"],["AUDI"],["Mercedes"],["Mazda"],["Toyota"],["Ford"]];
model_list = [["X6",1],["525",1],["720",1],["A8",2],["A6",2],["80",2],["S350",3],["S500",3],["E220",3],["626",4],["6",4],["3",4],["Avensis",5],["Corolla",5],["Camry",5],["Focus",6],["Escort",6],["Mondeo",6]];
condition_list = [["used"],["new"],["nearly new"]];
style_list = [["Convertible"],["Coupe"],["Estate"],["Hatchback"],["SUV"],["Saloon"],["Other"]]
mileage_list = [["up to 1000 miles"],["up to 5000 miles"],["up to 15000 miles"],["up to 25000 miles"],["up to 50000 miles"],["up to 75000 miles"],["over 75000 miles"],["Other"]]
year_list = [["up to 1 year old"],["up to 2 years old"],["up to 3 years old"],["up to 5 years old"],["up to 7 years old"],["over 10 years old"],["Other"]]
engine_list = [["Diesel"],["Electric"],["Hybrid"],["Petrol"],["LPG"],["Other"]]
engine_volume_list = [["1L-2L"],["2L-3L"],["3L-4L"],["4L-5L"],["Other"]]
transmission_list = [["Automatic"],["Manual"],["Semi-auto"],["Other"]]
door_list = [["2 doors"],["3 doors"],["4 doors"],["5 doors"],["Other"]]
color_list = [["black"],["green"],["yellow"],["red"],["blue"],["brown"],["grey"],["orange"]]
feature_list = [["Leather"],["Air Conditioning"],["Allow wheels"],["Parktronic"]]

User.create do |u|
  u.email="evilzorge@gmail.com"
  u.password="12345678"
  u.password_confirmation="12345678"
  u.role="admin"
  u.nickname = "Superadmin"
  u.name = "Kirill"
  u.surname = "Chernobai"
end

User.create do |u|
  u.email="envoyfromgalaxy@ya.ru"
  u.password="12345678"
  u.password_confirmation="12345678"
  u.role="user"
  u.nickname = "envoyfromgalaxy"
  u.name = "Kirill"
  u.surname = "Chernobai"
end

User.create do |u|
  u.email="ghostcrawler@gmail.com"
  u.password="12345678"
  u.password_confirmation="12345678"
  u.role="user"
  u.nickname = "another_user"
  u.name = "Test"
  u.surname = "Test"
end

Type.create do |u|
  u.name = 'Sell'
end

Type.create do |u|
  u.name = 'Buy'
end

Type.create do |u|
  u.name = 'Change'
end


country_list.each do |name|
  Country.create(name: name.join(""))
end

city_list.each do |name, country_id|
  City.create(name: name, country_id: country_id)
end

make_list.each do |name|
  Make.create(name: name.join(""))
end

model_list.each do |name, make_id|
  Model.create(name: name, make_id: make_id)
end

condition_list.each do |name|
  Condition.create(name: name.join(""))
end

style_list.each do |name|
  Style.create(name: name.join(""))
end

mileage_list.each do |name|
  Mileage.create(name: name.join(""))
end
year_list.each do |name|
  Year.create(name: name.join(""))
end
engine_list.each do |name|
  Engine.create(name: name.join(""))
end
engine_volume_list.each do |name|
  EngineVolume.create(name: name.join(""))
end
transmission_list.each do |name|
  Transmission.create(name: name.join(""))
end
door_list.each do |name|
  Door.create(name: name.join(""))
end
color_list.each do |name|
  Color.create(name: name.join(""))
end
feature_list.each do |name|
  Feature.create(name: name.join(""))
end
# Car.create(country_id:1, city_id:1, make_id:1, model_id:1, condition_id:1, style_id:1, mileage_id:1, engine_id:1, year_id:1, engine_volume_id:1, transmission_id:1, door_id:1, color_id:1)