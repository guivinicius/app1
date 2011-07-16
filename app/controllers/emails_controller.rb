class EmailsController < ApplicationController
  
  def index
    @email = Email.new
  end
  
  def create
    @email = Email.new(params[:email])

    respond_to do |format|
      if @email.valid?
        # Enviar para a outra aplicação
        return render :text => params[:email][:email]
      else
        format.html { render action: "index" }
      end
    end
  end
  
end
