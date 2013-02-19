@u = User.new
@u.login = "zahovaeva"
@u.password = "123"
@u.save
@p = Profile.new
@p.last_name = "Заховаева"
@p.first_name = "Анна"
@p.middle_name = "Георгиевна"
@p.degree = "доктор философских наук"
@p.title = "доцент"
@p.user_id = @u.id
@p.save
@post = Post.new
@post.name = "профессор"
@post.division_id = Division.find_by_name("Кафедра гуманитарных наук ").id
@post.parent_id = 12
@post.user_id = @u.id
@post.save