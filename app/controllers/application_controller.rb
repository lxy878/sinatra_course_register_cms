class ApplicationController < Sinatra::Base
    configure do
        set :public_folder, 'public'
        set :views, 'app/views'
        enable  :sessions
        set :session_secret, 'sometHing_noT_tO_tEll'
    end

    use Rack::Flash

    get '/' do
        erb :index
    end

    post '/login' do 
        dep = Department.find_by_slug(params[:name])
        
        if dep.nil?
            flash[:login_error] = '* Department is not existed.'
            redirect '/'
        elsif 
        else
            session[:dep_id] = dep.id
            redirect "/login/#{dep.slug}"
        end
    end 
    
    get '/login/:slug' do
        erb :login
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