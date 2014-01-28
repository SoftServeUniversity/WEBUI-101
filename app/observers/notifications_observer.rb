class NotificationsObserver < ActiveRecord::Observer
  observe :exhibition, :exhibit

  def after_create(record)
    notify(record, 'create')
  end

  def after_update(record)
    notify(record, 'update')
  end

  def after_destroy(record)
    notify(record, 'destroy')
  end

  private

    def notify(record, action_name)
      ModeratorNotifier.notify_moderator(record, action_name).deliver
    end

end
