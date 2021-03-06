class Airline < ApplicationRecord
  has_many :reviews

  # before we save our airline this will slugify the name
  before_create :slugify

  def slugify
    # this method will take the airline's name and converts it into url-safe slug and sets it as a slug value.
    self.slug = name.parameterize
  end

  def avg_score
    # this method gets the average score of the reviews for an airline
    reviews.average(:score).to_f.round(2)
  end
end
