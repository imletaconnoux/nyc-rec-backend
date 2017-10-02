class Api::V1::BbqsController < ApplicationController
  skip_before_action :authorized
  def index
    @bbqs = Bbq.all
    render json: @bbqs, status: 200
  end
end
