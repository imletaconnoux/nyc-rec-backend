class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def index
    @users = User.all
    render json: @users, status: 200
  end

  # create method for post requests
  def create
    user = User.new(user_params)
    if user.save
      token = encode_token({user_id: user.id})
      render json: {user: user, jwt: token}, status: 201
    end
  end

  def me
    #should be able to retrieve user and their prefs
    if @user
      prefs = load_user_prefs(@user)
      render json: {user: @user, prefs: prefs}, status: 201
    else
      render json: {message: "Error"}
    end
  end

  private
  def user_params
    params.permit(:username, :password)
  end

  def load_user_prefs(user)
    pref_objs = {zoos: [], bbqs: [], tennis: [], pools: [] }
    user.user_prefs.each do |user_pref|
       if user_pref[:zoo_id]
         zoo = Zoo.all.find(user_pref[:zoo_id])
         pref_objs[:zoos].push({zoo_info: zoo})
       elsif user_pref[:tenni_id]
         tenni = Tennis.all.find(user_pref[:tenni_id])
         pref_objs[:tennis].push({tenni_info: tenni})
       elsif user_pref[:bbq_id]
         bbq = Bbq.all.find(user_pref[:bbq_id])
         pref_objs[:bbqs].push({bbq_info: bbq})
       elsif user_pref[:pool_id]
         pool = Pool.all.find(user_pref[:pool_id])
         pref_objs[:pools].push({pool_info: pool})
       end
     end
     return pref_objs
  end

end
