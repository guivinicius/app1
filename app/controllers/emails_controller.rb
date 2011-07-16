class EmailsController < ApplicationController
  
  def index
    @email = Email.new
  end
  
  def create
    @email = Email.new(params[:email])

    respond_to do |format|
      if @email.valid?
        return render :text => params[:email][:email]
      else
        format.html { render action: "index" }
        format.json { render json: @email.errors, status: :unprocessable_entity }
      end
    end
  end
  
end
