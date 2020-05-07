class ApplicationController < Sinatra::Base
    configure do
        set :public_folder, './public'
        set :view, './app/views'
        enable  :sessions
        set :session_secret, 'sometHing_noT_tO_tEll'
    end

    get '/' do
        'hello world'
        binding.pry
    end
    
end