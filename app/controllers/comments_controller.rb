class CommentsController < ApplicationController
	
	load_and_authorize_resource
	def create
		byebug
		@article =Article.find(params[:article_id])
		@comment=@article.comments.new(comment_params)
		@comment.user_id=current_user.id
		@comment.save
		redirect_to article_path(@article)	
	end

	def destroy
		byebug
		@article=Article.find(params[:article_id])
		@comment=@article.comments.find(params[:id])
		@comment.destroy
		redirect_to article_path(@article)

	end

	private 
	
	def comment_params
		params.require(:comment).permit(:commenter,:body)
	end

end