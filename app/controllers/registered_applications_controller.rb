class RegisteredApplicationsController < ApplicationController
  def index
    if current_user
      @apps = current_user.registered_applications
    else
      redirect_to sign_in_path
    end
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
    set_app
    @events = @app.events    
  end

  def edit
    set_app
    if !@app 
      redirect_to registered_applications_path, warning: "you are not authorized to read"
    end
  end

  def update
    set_app
    if @app.update_attributes(app_params) 
      redirect_to registered_applications_path, notice: "successfully updated application details"  
    else
      render :edit, error: "something went wrong in updating the application"
    end
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
    @app = current_user.registered_applications.find(params[:id])
  end
  def app_params
    params.require(:registered_application).permit(:name, :URL)
  end
end
