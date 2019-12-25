class BookingsController < ApplicationController

  def index
    @client = current_client
    @bookings = Booking.where(client_id: @client).all
  end

  def create
    booking = current_client.bookings.build(film_id: params[:film_id])
    booking.save
    redirect_to films_path, notice: "『#{booking.film.title}』の上映権を持つことを明らかにします"
  end

  def destroy
    booking = current_client.bookings.find_by(id: params[:id]).destroy
    redirect_to films_path, notice: "『#{booking.film.title}』の上映権終了を確認しました"
  end
end
