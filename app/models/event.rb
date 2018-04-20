class Event < ActiveRecord::Base
  belongs_to :user
  has_many :attends, dependent: :delete_all
  has_many :comments, dependent: :delete_all
  has_many :attendees, through: :attends, source: :user
  validates :name, :city, :state, presence: true
  validate :future_event

  private
    def future_event
      if date == nil
        errors.add(:date, "can't be empty")
      elsif date < Time.now
        errors.add(:date, "can't be in the past!")
      end
    end
end
