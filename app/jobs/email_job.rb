class EmailJob < ActiveJob::Base
  queue_as :default

  def perform(id,record_user,admin)
      UserMailer.email(id,record_user,admin).deliver_now

  end
end
