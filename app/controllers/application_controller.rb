class ApplicationController < Sinatra::Base
    configure do
        set :public_folder, 'public'
        set :views, 'app/views'
        enable  :sessions
        set :session_secret, 'sometHing_noT_tO_tEll'
    end

    use Rack::Flash

    get '/' do
        'hello world'
        erb :index
    end
    
    post '/login' do 
        
    end 
    
    get '/signup' do
        erb :signup
    end

    post '/signup' do
        new_dep = Department.new(params[:department])
        if Department.find_by(name: new_dep.slug)
            flash[:signup_error] = '* Departement name is existed.' 
            redirect '/signup'
        else
            new_dep.save
            redirect '/'
        end
    end
end