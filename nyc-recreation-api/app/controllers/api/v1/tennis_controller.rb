class Api::V1::TennisController < ApplicationController
  def index
    @tennis = Tenni.all
    render json: @tennis, status: 200
  end
end
