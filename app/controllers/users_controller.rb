class UsersController < ApplicationController
    skip_before_action :require_login, only: [:index, :createuser, :login_pro]
    def index

    end
    
    def createuser
        user = User.create(user_params)
        
        if !user.valid?
            flash[:errors] = user.errors.full_messages
            # if user_params[:password] != user_params[:password_confirmation]
            #     puts user_params[:password]
            #     puts user_params[:password_confirmation]
            #     flash[:errors] << "Passwords do not match!"
            # end
            redirect_to "/"
        else
            puts "============="
            puts user.id
            puts "============="
            session[:userid] = user.id
            redirect_to "/users/find/#{session[:userid]}"
        end

    end

    def edit
        @user = User.find(params[:id])
    end

    def editpro
        user = User.find(params[:id])
        user.update(user_params)
        if !user.valid?
            flash[:errors] = user.errors.full_messages
            redirect_to "/users/edit/#{params[:id]}"
        else
            redirect_to "/users/find/#{params[:id]}"
        end
    end

    def login_pro
        u = User.find_by(email: params[:email])
        
        if u && u.authenticate(params[:password])
            session[:userid] = u.id 
            redirect_to "/users/find/#{session[:userid]}"
        else
            flash[:errors] = ["Invalid Log in"]
            redirect_to "/"
        end 
    end

    def usershow
        @user = User.find(session[:userid])
        @instate = Event.where(state:@user.state)
        @outstate = Event.where.not(state:@user.state)
        
    end

    def logout
        session[:userid] = nil
        redirect_to '/'
    end

    private
        def user_params
            params.require(:user).permit(:first_name, :last_name, :email, :city, :state, :password, :password_confirmation)
        end
end
