class CommentsController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    @article = Article.find(params[:article_id])
    @comment = Comment.create(comment_params)
    redirect_to article_path(@article)
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to @comment
    else
      render 'edit'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to articles_path()
  end

  private
  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end


end
