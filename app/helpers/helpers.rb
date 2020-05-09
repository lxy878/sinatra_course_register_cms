class Helpers

    def self.current_user(session)
        User.find(session[:dep_id])
    end
  
    def self.logged_in?(session)
        !!session[:dep_id]
    end
  
end