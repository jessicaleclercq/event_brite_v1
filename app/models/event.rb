class Event < ApplicationRecord
  before_create :impossible_create_edit_past

  belongs_to :admin, class_name: 'User'
  has_many :attendances
  has_many :users, through: :attendances

  validates :start_date,
    presence: true
    
    #validate :impossible_create_edit_past

  validates :duration,
    presence: true
    
    validate :duration_multiple_5_positive

  validates :title, 
    presence: true, 
    length: {minimum: 5, maximum: 140}

  validates :description, 
    presence: true, 
    length: {minimum: 20, maximum: 1000}

  validates :price, 
    presence: true, 
    length: {in: 1..1000}

  validates :location, 
    presence: true  
  
  private

  def impossible_create_edit_past
    if start_date < Time.now
      errors.add(:start_date, "Vous ne pouvez pas créer un évenement dans le passé")
    end    
  end

  def duration_multiple_5_positive
return if duration.blank?

  if duration%5 !=0 || duration < 0
    errors.add(:duration, "must be a positive number multiple of 5")
  end
end  

end
