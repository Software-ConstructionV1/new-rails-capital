Posteditor.destroy_all
Post.destroy_all
Editor.destroy_all
User.destroy_all

users = [
  { name: "Ahmed Hassan", age: 23 },
  { name: "Mona Said",    age: 28 },
  { name: "Karim Adel",   age: 21 },
  { name: "Laila Tarek",  age: 26 }
]

users.each do |user_attrs|
  User.create!(user_attrs)
end

editors = [
  { name: "John" },
  { name: "Sara" },
  { name: "Yusuf" },
  { name: "Nadine" }
]

editors.each do |editor_attrs|
  Editor.create!(editor_attrs)
end
