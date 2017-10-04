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

  def edit
    @user = User.find(params[:id])
  end

  def update
    if @user
      if params[:bbq_id]
        @bbq = Bbq.find(params[:bbq_id])
        UserPref.create(user_id: @user.id, bbq_id: params[:bbq_id])
      end
      if params[:zoo_id]
        @zoo = Zoo.find(params[:zoo_id])
        UserPref.create(user_id: @user.id, zoo_id: params[:zoo_id])
      end
      if params[:pool_id]
        @pool = Pool.find(params[:pool_id])
        UserPref.create(user_id: @user.id, pool_id: params[:pool_id])
      end
      if params[:tenni_id]
        @tenni = Tenni.find(params[:tenni_id])
        UserPref.create(user_id: @user.id, tenni_id: params[:tenni_id])
      end
      render json: @user, status: 200
    end
  end

  def destroy
    if @user
      if params[:bbq_id]
        bbqpref = UserPref.find_by_user_id_and_bbq_id(@user.id, params[:bbq_id])
        bbqpref.delete
      end
      if params[:zoo_id]
        zoopref = UserPref.find_by_user_id_and_zoo_id(@user.id, params[:zoo_id])
        zoopref.delete
      end
      if params[:pool_id]
        poolpref = UserPref.find_by_user_id_and_pool_id(@user.id, params[:pool_id])
        poolpref.delete
      end
      if params[:tenni_id]
        tennipref = UserPref.find_by_user_id_and_tenni_id(@user.id, params[:tenni_id])
        tennipref.delete
      end
      render json: @user, status: 200
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
         tenni = Tenni.all.find(user_pref[:tenni_id])
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
