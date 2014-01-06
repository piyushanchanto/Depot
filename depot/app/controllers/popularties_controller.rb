class PopulartiesController < ApplicationController
  # GET /popularties
  # GET /popularties.json
  def index
    @popularties = Popularty.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @popularties }
    end
  end

  # GET /popularties/1
  # GET /popularties/1.json
  def show
    @popularty = Popularty.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @popularty }
    end
  end

  # GET /popularties/new
  # GET /popularties/new.json
  def new
    @popularty = Popularty.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @popularty }
    end
  end

  # GET /popularties/1/edit
  def edit
    @popularty = Popularty.find(params[:id])
  end

  # POST /popularties
  # POST /popularties.json
  def create
    @popularty = Popularty.new(params[:popularty])

    respond_to do |format|
      if @popularty.save
        format.html { redirect_to @popularty, notice: 'Popularty was successfully created.' }
        format.json { render json: @popularty, status: :created, location: @popularty }
      else
        format.html { render action: "new" }
        format.json { render json: @popularty.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /popularties/1
  # PUT /popularties/1.json
  def update
    @popularty = Popularty.find(params[:id])

    respond_to do |format|
      if @popularty.update_attributes(params[:popularty])
        format.html { redirect_to @popularty, notice: 'Popularty was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @popularty.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /popularties/1
  # DELETE /popularties/1.json
  def destroy
    @popularty = current_popularty
    @popularty.destroy
    session[:popularty_id] = nil
    respond_to do |format|
      format.html { redirect_to store_url, notice: 'you dislike item' }
      format.json { head :no_content }
    end
  end
end
