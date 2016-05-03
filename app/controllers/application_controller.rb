class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  rescue_from CanCan::AccessDenied, with: :not_authorized
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  include ApplicationHelper
  include RecordsHelper
  include TimeHelper

  def respond_modal_with(*args, &blk)
    options = args.extract_options!
    options[:responder] = ModalResponder
    respond_with *args, options, &blk
  end

  private

  def not_authorized
    redirect_to root_url, alert: "Acesso não autorizado."
  end

end
