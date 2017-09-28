class Api::V1::ZoosController < ApplicationController
  def index
    @zoos = Zoo.all
    render json: @zoos, status: 200
  end
end
