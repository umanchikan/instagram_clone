class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :update, :destroy]
  before_action :user_login_check, only: [:new, :edit, :update, :destroy]

  def index
    @pictures = Picture.all
  end

  # GET /pictures/1
  # GET /pictures/1.json
  def show
    @favorite = current_user.favorites.find_by(picture_id: @picture.id)
  end

  def new
    if params[:back]
      @picture = Picture.new(picture_params)
    else
      @picture = Picture.new
    end
  end

  # GET /pictures/1/edit
  def edit
  end

  def destroy
    @picture.destroy
      redirect_to pictures_url, notice: 'Picture was successfully destroyed.'
  end

  def confirm
    @picture = current_user.pictures.build(picture_params)
    render :new if @picture.invalid?
  end

  def create
    @picture = current_user.pictures.build(picture_params)#現在ログインしているuserのidを、blogのuser_idカラムに挿入する
    if @picture.save
      redirect_to @picture, notice: '投稿できました'
    else
      render :new
    end
  end

  def update
    respond_to do |format|
      if @picture.update(picture_params)
        format.html { redirect_to @picture, notice: '編集できました' }
      else
        format.html { render :edit }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_picture
      @picture = Picture.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def picture_params
      params.require(:picture).permit(:content, :blog_picture, :blog_picture_cache)
    end

  def user_login_check
    unless logged_in?
      redirect_to root_path
    end
  end
end
