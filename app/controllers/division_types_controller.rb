class DivisionTypesController < ApplicationController
  # GET /division_types
  # GET /division_types.json
  def index
    @division_types = DivisionType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @division_types }
    end
  end

  # GET /division_types/1
  # GET /division_types/1.json
  def show
    @division_type = DivisionType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @division_type }
    end
  end

  # GET /division_types/new
  # GET /division_types/new.json
  def new
    @division_type = DivisionType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @division_type }
    end
  end

  # GET /division_types/1/edit
  def edit
    @division_type = DivisionType.find(params[:id])
  end

  # POST /division_types
  # POST /division_types.json
  def create
    @division_type = DivisionType.new(params[:division_type])

    respond_to do |format|
      if @division_type.save
        format.html { redirect_to @division_type, notice: 'Division type was successfully created.' }
        format.json { render json: @division_type, status: :created, location: @division_type }
      else
        format.html { render action: "new" }
        format.json { render json: @division_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /division_types/1
  # PUT /division_types/1.json
  def update
    @division_type = DivisionType.find(params[:id])

    respond_to do |format|
      if @division_type.update_attributes(params[:division_type])
        format.html { redirect_to @division_type, notice: 'Division type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @division_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /division_types/1
  # DELETE /division_types/1.json
  def destroy
    @division_type = DivisionType.find(params[:id])
    @division_type.destroy

    respond_to do |format|
      format.html { redirect_to division_types_url }
      format.json { head :no_content }
    end
  end
end
