class Post < ApplicationRecord
   attr_accessor :signed_in
  belongs_to :user
end
