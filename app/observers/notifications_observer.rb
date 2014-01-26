class NotificationsObserver < ActiveRecord::Observer
  observe :exhibition, :exhibit

  def after_create(record)
    notify(record, action_name: 'create')
  end

  def after_update(record)
    notify(record, action_name: 'update')
  end

  def after_destroy(record)
    notify(record, action_name: 'destroy')
  end

  private

    def notify(record, action_name: 'create')
      ModeratorNotifier.notify_moderator(record, action_name).deliver
    end

end
