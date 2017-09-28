class Api::V1::BbqsController < ApplicationController
  def index
    @bbqs = Bbq.all
    render json: @bbqs, status: 200
  end
end
