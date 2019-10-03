# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# seed_file = Rails.root.join('db', 'seeds', 'seeds.yml')
# config = YAML::load_file(seed_file)
# Category.create!(config)


# don't work ->
# require 'yaml'
# # Парсим данные из yml файла
# data = YAML.load_file('seeds.yml')
# # Получаем массив проектов (получается массив хешей)
# projects = data[:projects]
# # Для каждого проекта из массива:
# projects.each do |project|
#   # Создаем новый проект в БД
#   created_project = Project.create!(title: project[:title])
#   # Создаем для нового проекта todos
#   created_project.todos.create!(project[:todos])
# end


# don't work ->
# seed_file = Rails.root.join('db', 'seeds', 'seeds.yml')
# config = HashWithIndifferentAccess.new(YAML::load_file(seed_file))

# my_hash["projects"].each do |project|
#     puts project["title"]
#     project["todos"].each do |todo|
#         puts todo["text"]
#     end
# end


data = HashWithIndifferentAccess.new(YAML::load_file(File.join(Rails.root, 'db', 'seeds.yml')))

    data[:projects].each do |project|
        p = Project.new(title: project[:title])
        project[:todos].each do |todo|
            p.todos << Todo.create(todo)
        end
        p.save!
    end