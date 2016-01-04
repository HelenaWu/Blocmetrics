class RegisteredApplicationsController < ApplicationController
  def index
    @apps = current_user.registered_applications
  end

  def new
    @app = RegisteredApplication.new
  end
  
  def create
    @app = RegisteredApplication.new(app_params)
    @app.user = current_user
    if @app.save
      redirect_to registered_applications_path, notice: "successfully linked new application"
    else
      render :new, alert: "Failed to link application"
    end
  end
  
  def show

  end

  def edit

  end

  def destroy
    set_app
    if @app.destroy
      redirect_to registered_applications_path, notice: "succesfully deleted application"
    else
      redirect_to registered_applications_path, error: "something went wrong in deleting this application"
    end
  end

  private
  def set_app
    @app = RegisteredApplication.find(params[:id])
  end
  def app_params
    params.require(:registered_application).permit(:name, :URL)
  end
end
