class Symptom < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :name, :date_started
  validate :valid_date_ended

  private

  def valid_date_ended
    if (!date_ended.nil? && date_ended <= date_started)
      errors.add(:date_ended, 'Date Ended must be after Date Started')
    end
  end

end
