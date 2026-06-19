class Post
  include ActiveModel::Model
  attr_accessor :title, :description, :likes
  def self.all 
    [
      new(title: "welcome with rails", description: "this is a nice course", likes: "10k")
    ]
  end
end
