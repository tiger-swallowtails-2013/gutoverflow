class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :topic, class_name: "Post", foreign_key: "post_id"
  has_many :responses, class_name: "Post", foreign_key: "post_id"
  validates_length_of :text, minimum: 1
  validates_presence_of :user_id
end
