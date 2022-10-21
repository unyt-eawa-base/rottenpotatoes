class Movie < ApplicationRecord
  has_many :reviews
  has_many :moviegoers, through: :reviews
  @@grandfathered_date = Date.parse('1 Nov 1968')
  def self.all_ratings ; %w[G PG PG-13 R NC-17]; end

  validates :title, presence: true
  validates :release_date, presence: true
  validate :released_1930_or_later # uses custom validator below
  validates :rating, inclusion: {in: Movie.all_ratings}, unless: :grandfathered?
  def released_1930_or_later
    errors.add(:release_date, 'must be 1930 or later') if
      release_date && release_date < Date.parse('1 Jan 1930')
  end
  def grandfathered?
    release_date && release_date < @@grandfathered_date
  end

  def average_rating
    self.reviews.average :potatoes
  end

  def reviews_count
    self.reviews.count
  end
end
