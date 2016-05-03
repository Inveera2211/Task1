class ArticlesController < ApplicationController

  load_and_authorize_resource 



  #http_basic_authenticate_with name:"dhh",password:"secret",except: [:index, :show]
  def new
    @articles = Article.new
  end

  def index

    @articles = Article.all.page(params[:page]).per(4)

  end

  def create
   @article = Article.new(article_params)
   #@article.user_id =current_user.id
   @article.save

   redirect_to @article


 end

  def show
    @article = Article.find(params[:id])
  
  end

  def edit

    @article = Article.find(params[:id])
     end

  def update
    @article = Article.find(params[:id])
    
    @article.update(article_params)
    flash[:notice]="Successfully updated article."
    redirect_to @article
    
  end

  def destroy
   # byebug
    @article = Article.find(params[:id])
   @article.destroy
    redirect_to articles_path
    end
 
  private
    def article_params
      params.require(:article).permit(:title, :text)
    end
end
