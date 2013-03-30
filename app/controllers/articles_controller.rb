class ArticlesController < ApplicationController
  # GET /articles
  # GET /articles.json
  def index
    if current_user.nil?
      @last_news_articles = Article.order("updated_at DESC").where("article_type_id = ? and (exp_date >= ? or exp_date IS ?) and published = ?", 2, Time.now.to_date, nil, true).where(group_id: [nil]).limit(5)
      @anounces_articles = Article.order("updated_at DESC").where("article_type_id = ? and exp_date >= ? and published = ?", 3, Time.now.to_date, true).where(group_id: [nil]).limit(5)
      @articles = Article.order("updated_at DESC").where("article_type_id = ? and (exp_date >= ? or exp_date IS ?) and published = ?", 1, Time.now.to_date, nil, true).where(group_id: [nil]).limit(10)
      @personal_articles      
    else
      @last_news_articles = Article.order("updated_at DESC").where("article_type_id = ? and (exp_date >= ? or exp_date IS ?) and published = ?", 2, Time.now.to_date, nil, true).where(group_id: current_user.groups + current_user.groups.map {|g| g.parent}.select {|g| !g.nil?}.uniq  + [nil]).limit(5)
      @anounces_articles = Article.order("updated_at DESC").where("article_type_id = ? and exp_date >= ? and published = ?", 3, Time.now.to_date, true).where(group_id: current_user.groups + current_user.groups.map {|g| g.parent}.select {|g| !g.nil?}.uniq  + [nil]).limit(5)
      @articles = Article.order("updated_at DESC").where("article_type_id = ? and (exp_date >= ? or exp_date IS ?) and published = ?", 1, Time.now.to_date, nil, true).where(group_id: current_user.groups + current_user.groups.map {|g| g.parent}.select {|g| !g.nil?}.uniq  + [nil]).limit(10)
      @personal_articles
    end
    respond_to do |format|
      format.html # index.html.erb
      format.atom {render atom: @last_news_articles}
      format.json { render json: @articles }
    end
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
    @attachment = Attachment.new
    @comments = @article.comments
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @article }
    end
  end

  # GET /articles/new
  # GET /articles/new.json
  def new
    @current_user = User.find(session[:user_id])
    @article = Article.new
    @article_types = ArticleType.all
    @divisions = @current_user.divisions
    @groups = current_user.groups.uniq + current_user.groups.map {|g| g.parent}.select {|g| !g.nil?}.uniq
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @article }
    end
  end

  # GET /articles/1/edit
  def edit
    @article = Article.find(params[:id])
    @article_types = ArticleType.all
    @divisions = @article.user.divisions
    @groups = current_user.groups.uniq + current_user.groups.map {|g| g.parent}.select {|g| !g.nil?}.uniq
  end

  # POST /articles
  # POST /articles.json
  def create
    params[:article][:user_id] = session[:user_id]
    @article = Article.new(params[:article])


    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render json: @article, status: :created, location: @article }
      else
        format.html { render action: "new" }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /articles/1
  # PUT /articles/1.json
  def update
    @article = Article.find(params[:id])

    respond_to do |format|
      if @article.update_attributes(params[:article])
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    respond_to do |format|
      format.html { redirect_to articles_url }
      format.json { head :no_content }
    end
  end
  
  def feed
    @articles = Article.order("updated_at DESC").where("article_type_id = ? and updated_at > ? and published = ?", 2, Time.now.to_date - 30, true)
    
    respond_to do |format|
      format.atom
    end
  end
  
end
