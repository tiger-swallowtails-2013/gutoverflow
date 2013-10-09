class User < ActiveRecord::Base
  validates_format_of :full_name, :with => /\A[A-Za-z]+\s{1}[A-Za-z]+\z/
  validates :email, :password,:full_name,  presence: true
  validates_uniqueness_of :email
  validates_format_of :email, :with => /@.+\./
   validates_length_of :password, minimum: 6
end