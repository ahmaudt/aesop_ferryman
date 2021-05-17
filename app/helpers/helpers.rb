class Helpers
  def self.current_user(session)
    @current_user = Advisor.find_by_id(session[:user_id])
  end

  def self.is_logged_in?(session)
    !!session[:user_id] # double !! makes value into boolean, i.e. true or false
  end
end