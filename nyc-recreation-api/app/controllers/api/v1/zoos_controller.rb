class Api::V1::ZoosController < ApplicationController
  skip_before_action :authorized
  def index
    @zoos = Zoo.all
    render json: @zoos, status: 200
  end
end
