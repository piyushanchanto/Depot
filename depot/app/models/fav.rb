class Fav < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :fav_line_items, dependent: :destroy
end
