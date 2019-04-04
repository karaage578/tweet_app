class UsersController < ApplicationController
    before_action :authenticate_user, {only: [:index, :show, :edit, :update]}
    before_action :forbid_login_user, {only: [:new, :create, :login_form, :login]}
    before_action :ensure_correct_user, {only: [:edit, :update]}

    def index
        @users = User.all
    end

    def show
        @user = User.find_by(id: params[:id])
    end

    def new
    end

    def crete
        @user = User.new(user_id: params[:user_id], email: params[:email], password: params[:password])
        if @user.save
            session[:user_id] = @user.id
            flash[:notice] = "ユーザー登録が完了しました"
            redirect_to("/users/#{@user.id}")
        else
            render("users/new")
        end 
    end

    def edit
        @user = User.find_by(id: params[:id])
    end

    def upadte
        @user = User.find_by(id: params[:id])
        @user.user_id = params[:user_id]
        @user.email = params[:email]
        if @user.save
            flash[:notice] = "ユーザー情報を更新しました"
            redirect_to("/users/#{@user.id}")
        else
            render("ussers/edit")
        end
    end

    def login_form
    end

    def login
        @user = User.find_by(user_id: params[:user_id], password: params[:password])
        if @user
          session[:user_id] = @user.id
          flash[:notice] = "ログインしました"
          redirect_to("/posts/index")
        else
          @error_message = "ユーザーIDまたはパスワードが間違っています"
          @user_id = params[:user_id]
          @password = params[:password]
          render("users/login_form")
        end
    end

    def logout
        session[:user_id] = nil
        flash[:notice] = "ログアウトしました"
        redirect_to("/login")
    end

    def ensure_correct_user
        if @current_user.id != params[:id].to_i
          flash[:notice] = "権限がありません"
          redirect_to("/posts/index")
        end
    end
  end