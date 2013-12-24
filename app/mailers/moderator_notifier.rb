class ModeratorNotifier < ActionMailer::Base
  default from: "scout_museum@example.com"

  def notify_moderator(entry, action)
    @entry, @action = entry, action
    template = set_template(@entry, @action)
    mail(to: @entry.user.email,
         subject: 'Moderator notifications.',
         template_name: template)
  end

  private

    def set_template(entry, action)
      identifier = entry.class.to_s.downcase
      template = "#{identifier}_notifications/#{action}_#{identifier}"
    end

end
