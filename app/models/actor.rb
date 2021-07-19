class Actor < ApplicationRecord
  has_many :movie_actors
  has_many :movies, through: :movie_actors

  def self.youngest_to_oldest
    order(:age)
  end

  def self.average_age
    if all.length == 0
      return "N/A"
    else
      average(:age).round
    end
  end

  # def self.find_actor(name)
  #   where("name = ?", name)
  # end
end
