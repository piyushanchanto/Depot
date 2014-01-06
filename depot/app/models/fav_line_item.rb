class FavLineItem < ActiveRecord::Base
  attr_accessible :fav_id, :product_id
  attr_accessible :quantity
  attr_accessible :product
  belongs_to :product
  belongs_to :fav
end
