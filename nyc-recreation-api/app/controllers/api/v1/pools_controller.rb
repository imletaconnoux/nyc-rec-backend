class Api::V1::PoolsController < ApplicationController
  skip_before_action :authorized
  def index
    @pools = Pool.all
    render json: @pools, status: 200
  end
end
