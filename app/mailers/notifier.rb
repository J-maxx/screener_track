class Notifier < ActionMailer::Base

    def contact_notification(sender)
      @sender = sender
      mail(:to => "screenertrack@gmail.com",
           :from => sender.email,
           :subject => "#{sender.contact_type}")
   end
end
