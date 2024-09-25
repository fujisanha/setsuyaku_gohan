class CommentsController < ApplicationController
  def index
    @recipe = Recipe.find(params[:recipe_id])
    @comments = @recipe.comments
    @comment = Comment.new
  end
  
  def create
    @comment = current_user.comments.new(comment_params.merge(recipe_id: params[:recipe_id]))
    @recipe = @comment.recipe
    if @comment.save
      flash[:notice] = "created"
      redirect_to recipe_comments_path(@recipe)  #コメント送信後は、一つ前のページへリダイレクトさせる。
    else
      @comments = @recipe.comments
      render 'comments/index'  #同上
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:comment)  #formにてpost_idパラメータを送信して、コメントへpost_idを格納するようにする必要がある。
  end
end
