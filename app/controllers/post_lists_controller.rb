class PostListsController < ApplicationController
  # GET /post_lists
  # GET /post_lists.json
  def index
    @post_lists = PostList.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @post_lists }
    end
  end

  # GET /post_lists/1
  # GET /post_lists/1.json
  def show
    @post_list = PostList.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post_list }
    end
  end

  # GET /post_lists/new
  # GET /post_lists/new.json
  def new
    @post_list = PostList.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post_list }
    end
  end

  # GET /post_lists/1/edit
  def edit
    @post_list = PostList.find(params[:id])
  end

  # POST /post_lists
  # POST /post_lists.json
  def create
    @post_list = PostList.new(params[:post_list])

    respond_to do |format|
      if @post_list.save
        format.html { redirect_to @post_list, notice: 'Post list was successfully created.' }
        format.json { render json: @post_list, status: :created, location: @post_list }
      else
        format.html { render action: "new" }
        format.json { render json: @post_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /post_lists/1
  # PUT /post_lists/1.json
  def update
    @post_list = PostList.find(params[:id])

    respond_to do |format|
      if @post_list.update_attributes(params[:post_list])
        format.html { redirect_to @post_list, notice: 'Post list was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /post_lists/1
  # DELETE /post_lists/1.json
  def destroy
    @post_list = PostList.find(params[:id])
    @post_list.destroy

    respond_to do |format|
      format.html { redirect_to post_lists_url }
      format.json { head :no_content }
    end
  end
end
