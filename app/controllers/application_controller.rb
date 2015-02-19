class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

 def current_users_around


    # base_uri = 'https://blinding-fire-43.firebaseio.com/'
    # firebase = Firebase::Client.new(base_uri)
    @users_around = current_user.nearbys(10)
    # users = User.all
    @current_users_around = @users_around.where(updated_at: (1.hour.ago..Time.now))

    # users.each do |u|

    #   body = firebase.get("user#{u.id.to_s}").body
    #   current_user_body = firebase.get("user#{current_user.id.to_s}").body


    #   if body && current_user_body
    #     this_user_point = body['l']
    #     current_user_point = current_user_body['l']
    #     user_time = (body['datetime'] || 1.second.ago)
    #     if 1.hour.ago < user_time
  end

  helper_method :current_users_around

  private
  def power(num, pow)
    num ** pow
  end

  def distance(lat1, long1, lat2, long2)
    dtor = Math::PI / 180
    r = 6378.14

    rlat1  = lat1  * dtor
    rlong1 = long1 * dtor
    rlat2  = lat2  * dtor
    rlong2 = long2 * dtor

    dlon = rlong1 - rlong2
    dlat = rlat1  - rlat2

    a = power(Math::sin(dlat/2), 2) + Math::cos(rlat1) * Math::cos(rlat2) * power(Math::sin(dlon/2), 2)
    c = 2 * Math::atan2(Math::sqrt(a), Math::sqrt(1-a))
    d = r * c

    return d
  end

end
