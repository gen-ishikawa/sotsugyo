class TweetsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tweet, only: [:edit, :update, :destroy]
  
  def index
    @tweets = Tweet.all
  end
    
  def show
    set_tweet
    @comment = @tweet.comments.build
    @comments = @tweet.comments
  end
  
  def new
    if params[:back]
      @tweet = Tweet.new(tweets_params)
    else
      @tweet = Tweet.new
    end
  end
  
  def create
    @tweet = Tweet.new(tweets_params)
    @tweet.user_id = current_user.id
    if @tweet.save
      redirect_to tweets_path, notice: "投稿しました！"
      NoticeMailer.sendmail_tweet(@tweet).deliver
    else
      render 'new'
    end
  end

  def edit
    set_tweet
  end
  
  def update
    set_tweet
    @tweet.update(tweets_params)
    redirect_to tweets_path, notice: "編集しました！"
  end
  
  def destroy
    set_tweet
    @tweet.destroy
    redirect_to tweets_path, notice: "削除しました！"
  end

  def confirm
    @tweet = Tweet.new(tweets_params)
    render :new if @tweet.invalid?
  end
  
  private
    def tweets_params
      params.require(:tweet).permit(:content, :image, :image_cache)
    end
    
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end
end
