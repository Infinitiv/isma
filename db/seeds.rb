# encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:"seed (or created alongside the db with db:"setup").
#
# Examples:"
#
#   cities = City.create([{ name:" 'Chicago' }, { name:" 'Copenhagen' }]")
#   Mayor.create(name:" 'Emanuel', city:" cities.first")

@u = User.new
@u.login = "bunin"
@u.password = "123"
@u.save
@p = Profile.new
@p.last_name = "Бунин"
@p.first_name = "Алексей"
@p.middle_name = "Олегович"
@p.degree = "доктор исторических наук"
@p.title = "профессор"
@p.user_id = @u.id
@p.save
@post = Post.new
@post.name = "заведущюий кафедрой"
@post.division_id = Division.find_by_name("Кафедра гуманитарных наук ").id
@post.user_id = @u.id
@post.save
