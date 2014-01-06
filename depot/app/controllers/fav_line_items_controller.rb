class FavLineItemsController < ApplicationController
  # GET /fav_line_items
  # GET /fav_line_items.json
  def index
    @fav_line_items = FavLineItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @fav_line_items }
    end
  end

  # GET /fav_line_items/1
  # GET /fav_line_items/1.json
  def show
    @fav_line_item = FavLineItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @fav_line_item }
    end
  end

  # GET /fav_line_items/new
  # GET /fav_line_items/new.json
  def new
    @fav_line_item = FavLineItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @fav_line_item }
    end
  end

  # GET /fav_line_items/1/edit
  def edit
    @fav_line_item = FavLineItem.find(params[:id])
  end

  # POST /fav_line_items
  # POST /fav_line_items.json
  def create
    @fav = current_fav
    product = Product.find(params[:product_id])
    @fav_line_item = @fav.fav_line_items.build(product: product)

    respond_to do |format|
      if @fav_line_item.save
        format.html { redirect_to @fav_line_item.fav, notice: 'Item was successfully Added to your Wish List.' }
        format.json { render json: @fav_line_item, status: :created, location: @fav_line_item }
      else
        format.html { render action: "new" }
        format.json { render json: @fav_line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /fav_line_items/1
  # PUT /fav_line_items/1.json
  def update
    @fav_line_item = FavLineItem.find(params[:id])

    respond_to do |format|
      if @fav_line_item.update_attributes(params[:fav_line_item])
        format.html { redirect_to @fav_line_item, notice: 'Fav line item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @fav_line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fav_line_items/1
  # DELETE /fav_line_items/1.json
  def destroy
    @fav_line_item = FavLineItem.find(params[:id])
    @fav_line_item.destroy

    respond_to do |format|
      format.html { redirect_to fav_line_items_url }
      format.json { head :no_content }
    end
  end
end
