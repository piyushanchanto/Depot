class PopulartyLineItemsController < ApplicationController
  # GET /popularty_line_items
  # GET /popularty_line_items.json
  def index
    @popularty_line_items = PopulartyLineItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @popularty_line_items }
    end
  end

  # GET /popularty_line_items/1
  # GET /popularty_line_items/1.json
  def show
    @popularty_line_item = PopulartyLineItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @popularty_line_item }
    end
  end

  # GET /popularty_line_items/new
  # GET /popularty_line_items/new.json
  def new
    @popularty_line_item = PopulartyLineItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @popularty_line_item }
    end
  end

  # GET /popularty_line_items/1/edit
  def edit
    @popularty_line_item = PopulartyLineItem.find(params[:id])
  end

  # POST /popularty_line_items
  # POST /popularty_line_items.json
  def create
    @popularty = current_popularty
    product = Product.find(params[:product_id])
    @popularty_line_item = @popularty.add_product(product.id)

    respond_to do |format|
      if @popularty_line_item.save
        format.html { redirect_to @popularty_line_item.popularty, notice: 'Popularty line item was successfully created.' }
        format.json { render json: @popularty_line_item, status: :created, location: @popularty_line_item }
      else
        format.html { render action: "new" }
        format.json { render json: @popularty_line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /popularty_line_items/1
  # PUT /popularty_line_items/1.json
  def update
    @popularty_line_item = PopulartyLineItem.find(params[:id])

    respond_to do |format|
      if @popularty_line_item.update_attributes(params[:popularty_line_item])
        format.html { redirect_to @popularty_line_item, notice: 'Popularty line item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @popularty_line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /popularty_line_items/1
  # DELETE /popularty_line_items/1.json
  def destroy
    @popularty_line_item = PopulartyLineItem.find(params[:id])
    @popularty_line_item.destroy

    respond_to do |format|
      format.html { redirect_to popularty_line_items_url }
      format.json { head :no_content }
    end
  end
end
