class AddTestData < ActiveRecord::Migration
  def self.up
    Product.delete_all
    Product.create(:title => 'Pramatic Version Control',
      :description => 
      %{<p>
          This is a recipe-based approach
        </p>},
        :image_url => '/image/svn.jpg',
        :price => 28.50)
  end

  def self.down
    Product.delete_all
  end
end
