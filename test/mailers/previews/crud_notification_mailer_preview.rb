# Preview all emails at http://localhost:3000/rails/mailers/crud_notification_mailer
class CrudNotificationMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/crud_notification_mailer/create_notification
  def create_notification
    CrudNotificationMailer.create_notification
  end

  # Preview this email at http://localhost:3000/rails/mailers/crud_notification_mailer/update_notification
  def update_notification
    CrudNotificationMailer.update_notification
  end

  # Preview this email at http://localhost:3000/rails/mailers/crud_notification_mailer/delete_notofication
  def delete_notofication
    CrudNotificationMailer.delete_notofication
  end

end
