users = [
  { name: "Karim Ibrahim", dob: Date.new(2000, 1, 1), email: "karim@example.com", phone_number: "01000000001", address: "Cairo" },
  { name: "Ruby Student", dob: Date.new(2001, 2, 2), email: "student@example.com", phone_number: "01000000002", address: "Giza" }
]

editors = [
  { name: "First Editor", email: "first.editor@example.com" },
  { name: "Second Editor", email: "second.editor@example.com" }
]

users.each do |user_attributes|
  User.find_or_create_by!(email: user_attributes[:email]) do |user|
    user.assign_attributes(user_attributes)
  end
end

editors.each do |editor_attributes|
  Editor.find_or_create_by!(email: editor_attributes[:email]) do |editor|
    editor.assign_attributes(editor_attributes)
  end
end
