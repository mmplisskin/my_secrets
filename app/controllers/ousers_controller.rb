class OusersController < ApplicationController

protect_from_forgery with: :null_session


  def new
    @ouser = Ouser.new(ouser_params)
  end

  def create
    @ouser = Ouser.create(ouser_params)
  end


  def index
    @ousers = Ouser.find(current_ouser)

      respond_to do |format|
      format.html {
          render
      }
      format.json {
          render json: @ousers
      }
      end
  end


  def show
    @ouser = Ouser.find(params[:id])
    respond_to do |format|
    format.html {
        render
    }
    format.json {
        render json: @ouser
        redirect_to(:controller => 'posts', :action => 'index')
    }
    end
  end

  def update
    @ouser = Ouser.find(params[:id])
    # @ouser.update_attributes(ouser_params)
    # @ouser.update_attributes(ouser_params)
    # @ouser.last_update = Time.now
  if @ouser.update_attributes(ouser_params)

      respond_to do |format|
        format.html {
          render

        }

      format.json {
          render json: @ouser
      }
      end


    end
  end


private
  def ouser_params
    params.require(:ouser).permit(:latitude, :longitude)
  end

end
