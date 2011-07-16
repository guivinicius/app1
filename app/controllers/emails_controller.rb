class EmailsController < ApplicationController
  
  def index
    @email = Email.new
  end
  
  def create
    @email = Email.new(params[:email])

    respond_to do |format|
      if @email.valid?
        require 'net/http'
        
        url_email = URI.parse('http://0.0.0.0:3001/emails')
        # url_login = URI.parse('http://0.0.0.0:3001/users/sign_in')
        
        # Logando na aplicacao
        # login_args = { 'email' => 'gui.vinicius@gmail.com', "password" => "g7895123" }
        # resp, data = Net::HTTP.post_form(url_login, login_args)
        
        # return render :text => data
        
        # Enviando email
        post_args = {:email => params[:email][:email]}
        resp, data = Net::HTTP.post_form(url_email, post_args)
        
        return render :text => data
        
      else
        format.html { render action: "index" }
      end
    end
  end
  
end
