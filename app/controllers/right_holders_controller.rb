class RightHoldersController < ApplicationController
  def show
    @right_holder = RightHolder.find(params[:id])
  end
end
