class BookingsController < ApplicationController

  def create
    booking = current_client.bookings.build(film_id: params[:film_id])
    booking.save
    redirect_to films_path, notice: '#{booking.film.title}の上映を確定しました'
  end

  def destroy
    booking = current_client.bookings.find_by(id: params[:id]).destroy
    redirect_to films_path, notice: '#{booking.film.title}の上映権が失効しました'
  end
end
