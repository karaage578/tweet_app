class UsersController < ApplicationController

    def index
        @users = User.all
    end

    def show
        @user = User.find_by(id: params[:id])
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_id: params[:user_id], email: params[:email], password: params[:password], image_name: "default_user.png")
        if @user.save
            flash[:notice] = "ユーザー登録が完了しました"
            redirect_to("/users/#{@user.id}")
        else
            render("users/new")
        end 
    end

    def edit
        @user = User.find_by(id: params[:id])
    end

    def update
        @user = User.find_by(id: params[:id])
        @user.user_id = params[:user_id]
        @user.email = params[:email]

        if params[:image]
            @user.image_name = "#{@user.id}.jpg"
            image = params[:image]
            File.binwrite("public/user_images/#{@user.image_name}", image.read)
        end

        if @user.save
            flash[:notice] = "ユーザー情報を更新しました"
            redirect_to("/users/#{@user.id}")
        else
            render("ussers/edit")
        end
    end

  end