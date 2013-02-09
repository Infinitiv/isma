class ArchivesController < ApplicationController
  def articles
    @articles = Article.where(:article_type_id => 1, :published => true).paginate(:page => params[:page]).order('updated_at DESC')
  end

  def news
    @articles = Article.where(:article_type_id => 2, :published => true).paginate(:page => params[:page]).order('updated_at DESC')
  end

  def anounces
    @articles = Article.where(:article_type_id => 3, :published => true).paginate(:page => params[:page]).order('updated_at DESC')
  end

  def all
    @articles = Article.where(:published => true).paginate(:page => params[:page]).order('updated_at DESC')
  end
end
