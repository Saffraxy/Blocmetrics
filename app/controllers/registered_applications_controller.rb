class RegisteredApplicationsController < ApplicationController

  def index
    @registered_applications = RegisteredApplication.all
  end

  def show
    @registered_application = RegisteredApplication.find(params[:id])
    @events = @registered_application.events.group_by(&:eventname)
  end

#  def new
#    @user = current_user
#    @registered_application = RegisteredApplication.new
#  end

  def create
      @registered_application = current_user.registered_applications.new(registered_application_params)
      @new_registered_application = RegisteredApplication.new

      if @registered_application.save
        flash[:notice] = "Application was registered successfully."
      else
        flash.now[:alert] = "There was an error saving the application. Please try again."
      end

      respond_to do |format|
        format.html
        format.js
      end
    end

    def destroy
      @registered_application = current_user.registered_applications.find(params[:id])

      if @registered_application.destroy
        flash[:notice] = "Registered application was deleted."
      else
        flash[:alert] = "Registered application couldn't be deleted. Try again."
      end

      respond_to do |format|
        format.html
        format.js
      end
    end

private
  def registered_application_params
    params.require(:registered_application).permit(:name, :url)
  end

end
