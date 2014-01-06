class PopulartyLineItem < ActiveRecord::Base
  attr_accessible :popularty_id, :product_id
  attr_accessible :product
  belongs_to :product
  belongs_to :popularty
end
