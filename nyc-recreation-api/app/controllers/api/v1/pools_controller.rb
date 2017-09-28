class Api::V1::PoolsController < ApplicationController
  def index
    @pools = Pool.all
    render json: @pools, status: 200
  end
end
