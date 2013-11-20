class Schedule < ActiveRecord::Base
  belongs_to :user

  validates :begin_date, presence: true
  validates :end_date, presence: true
  validates_date_of :end_date, :after_or_equal_to => :begin_date, :message => "End date must be after or equal to begin date"
  validates :user_id, presence: true
end