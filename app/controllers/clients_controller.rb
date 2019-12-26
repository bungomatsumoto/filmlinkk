class ClientsController < ApplicationController
  def index
    # @clients = Client.all
    @q = Client.ransack(params[:q])
    @clients = @q.result(distinct: true).page(params[:page])

  end

  def show
    @client = Client.find(params[:id])
  end
end
