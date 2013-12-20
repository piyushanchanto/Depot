class Product < ActiveRecord::Base
  attr_accessible :description, :image_url, :title, :price
  validates_presence_of :title, :description, :image_url
  validates_presence_of :price, :numeracity => {:greater_than => 0}
  validates_format_of :image_url, :with => %r{\.(gif|jpg|png)$}i, :message => 'image must be GIF, JPG or PNG format' 
  
  # protected
  #          def price_must_be_at_least_a_cent
  #            errors.add(:price, 'Should be one') if price < 0.01
  #          end
     
  def self.find_products_for_sale
    find(:all, :order => "title")
  end
end
  