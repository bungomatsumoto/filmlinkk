class FilmsController < ApplicationController
  before_action :set_search, only: [:index]
  before_action :get_id_film, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_right_holder!, only: [:new, :create, :edit, :update, :destroy]

  def index
    # if params[:q]
      @q = Film.ransack(params[:q])
      @films = @q.result(distinct: true).page(params[:page])
    # else
    #   @films = Film.all
    # end
    # @films = Film.all
  end

  def new
    @film = Film.new
  end

  def create
    @film = current_right_holder.films.build(film_params)
    if @film.save
      redirect_to films_path, notice: "作品を登録しました"
    else
      render :new
    end
  end

  def show
    @booking = current_client.bookings.find_by(film_id: @film.id) if current_client
  end

  def edit
  end

  def update
    if @film.update(film_params)
      redirect_to films_path, notice: "作品を編集しました"
    else
      render :edit
    end
  end

  def destroy
    @film.destroy
    redirect_to films_path, notice: "作品を削除しました"
  end

  private

  def film_params
    params.require(:film).permit(:title, :intro, :director, :document, :production_year, :production_country, :running_time, :cast, :genre, :image)
  end

  # def search_params
  #   params.require(:q).permit(:gearname_or_title_or_review_cont)
  # end

  def get_id_film
    @film = Film.find(params[:id])
  end

  def set_search
    @search = Film.ransack(params[:q])
    # @film = @search.result
  end

end
