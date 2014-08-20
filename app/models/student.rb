class Student < ActiveRecord::Base
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates_format_of :first_name, :with => /^[A-Z][a-zA-Z]+/, :multiline => true, :on => :create
  validates_format_of :last_name, :with => /^[A-Z][a-zA-Z]+/, :multiline => true, :on => :create

  FORBIDDEN_FIRSTNAMES = [["Delmer", "Reed"], ["Elie", "Schoppik"], ["Anil", "Bridgpal"], ["Tim", "Licata"]]
  validate :username_is_allowed

  def username_is_allowed
    if FORBIDDEN_FIRSTNAMES.include?([first_name, last_name])
      errors.add(:first_name, "#{first_name} is a restricted username")
    end
  end
end