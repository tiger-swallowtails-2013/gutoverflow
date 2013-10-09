class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :topic, class_name: "Post", foreign_key: "post_id"
  has_many :responses, class_name: "Post", foreign_key: "post_id"
  validates_length_of :text, minimum: 1
end
