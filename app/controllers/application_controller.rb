class ApplicationController < ActionController::API
    #By using before_action, the server passes the request headers (using the built-in object property request.headers) to AuthorizeApiRequest every time the user makes a request. Calling result on AuthorizeApiRequest.call(request.headers) is coming from SimpleCommand module where it is defined as attr_reader :result. The request results are returned to the @current_user, thus becoming available to all controllers inheriting from ApplicationController.
    before_action :authenticate_request
     attr_reader :current_user
    #  helper_method :current_user

    #   def current_user
    #     if session[:user_id]
    #       @current_user ||= User.find(session[:user_id])
    #     else
    #       @current_user = nil
    #     end
    #   end
   
     private
   
     def authenticate_request
       @current_user = AuthorizeApiRequest.call(request.headers).result
       render json: { error: 'Not Authorized' }, status: 401 unless @current_user
     end
   end