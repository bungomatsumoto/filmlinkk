class FilmsController < ApplicationController
  before_action :get_id_film, only: [:show, :update, :destroy]

  def index
    @films = Film.all
  end

  def new
    @film = Film.new
  end

  def create
    @film = Film.new(film_params)
    if @film.save
      redirect_to films_path, notice:"作品を登録しました"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @film.update(film_params)
      redirect_to films_path, notice:"作品を編集しました"
    else
      render :edit
    end
  end

  def destroy
    @film.destroy
    redirect_to films_path, notice:"作品を削除しました"
  end

  private

  def film_params
    params.require(:film).permit(:title, :intro, :director, :images[], :document, :production_year, :production_country, :running_time, :cast, :genre)
  end

  def get_id_film
    @film = Film.find(params[:id])
  end

end
