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
        if dep && dep.authenticate(params[:password])
            session[:dep_id] = dep.id
            redirect "/menu"
        else
            flash[:login_error] = '* Department name or password is incorrect.'
            redirect '/'
        end
    end 
    
    get '/menu' do
        authentication_required
        erb :menu
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

    get '/logout' do
        session.clear
        redirect '/'
    end

    helpers do
        def current_dep
            Department.find(session[:dep_id]) if session[:dep_id]
        end
      
        def logged_in?
            !!current_dep
        end

        def authentication_required
            if !logged_in?
                flash[:authenticate_error] = '* You must log in.'
                redirect '/'
            end
        end
    end
end