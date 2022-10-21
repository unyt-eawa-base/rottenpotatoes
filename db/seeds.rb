# Seed the RottenPotatoes DB with some movies.
def add_movie_reviews(title, range, num)
  comments = {
    1 => ['Terrible', 'Very Poor', 'Unwatchable', 'What were they thinking'],
    2 => ['Lacking in vision', 'Poor', 'Wasted hours', 'A bit boring'],
    3 => ['Barely average', 'So so', 'not impressed'],
    4 => ['Solid work', 'Strong acting', 'Well directed', 'Impressive'],
    5 => ['Masterpiece', 'Excellent', 'One of the best movies ever', 'Superbly played and directed']
  }
  scores = range.to_a
  movie = Movie.find_by_title title
  Moviegoer.all.to_a.sample(num).each do |mg|
    score = scores.sample
    comment = comments[score].sample
    r = movie.reviews.build :potatoes => score, :comments => comment
    r.moviegoer = mg
    r.save!
  end
end

movies = [
  {title: 'Aladdin', rating: 'G', release_date: '25-Nov-1992', description: 'Love story from orient'},
  {title: 'When Harry Met Sally', rating: 'R', release_date: '21-Jul-1989', description: 'Billy Crystal at his best'},
  {title: 'The Help', rating: 'PG-13', release_date: '10-Aug-2011', description: 'Average at best'},
  {title: 'Raiders of the Lost Ark', rating: 'PG', release_date: '12-Jun-1981', description: 'Indiana Jones outsmarting the Nazis'},
  {title: 'The imitation game', rating: 'PG-13', release_date: '28-Sep-2014', description: 'The story of Alan Turing and Enigma'},
  {title: 'Lincoln', rating: 'PG-13', release_date: '9-Nov-2012', description: 'Third Oscar for Daniel Day Lewis'},
  {title: 'The Irishman', rating: 'R', release_date: '12-Apr-2019', description: 'Explosive! Pacino and De Niro together again'},
  {title: 'No time to day', rating: 'PG-13', release_date: '30-Sep-2021', description: 'Last Bond movie for Daniel Craig'},
  {title: 'Das leben der anderen', rating: 'R', release_date: '30-Mar-2006', description: 'We still have Paris!'},
  {title: 'Casablanca', release_date: '26-Nov-1942', description: 'Simply perfect! The best german movie ever!'}
]

movies.each do |movie|
  Movie.create!(movie)
end

moviegoers = [
  {name: 'Franz', surname: 'Kafka'},
  {name: 'Margaret', surname: 'Atwood'},
  {name: 'Khalid', surname: 'Hosseini'},
  {name: 'Milan', surname: 'Kundera'},
  {name: 'Albert', surname: 'Camus'},
  {name: 'Harper', surname: 'Lee'},
  {name: 'Markus', surname: 'Zusak'},
  {name: 'Elif', surname: 'Shafak'},
  {name: 'Alberto', surname: 'Moravia'},
  {name: 'Elfriede', surname: 'Jelinek'}
]

moviegoers.each do |mg|
  mg[:email] = "#{mg[:name].downcase}.#{mg[:surname].downcase}@gmail.com"
  mg[:password] = 'Test1234'
  Moviegoer.create! mg
end

add_movie_reviews('Aladdin', 1..4, 4)
add_movie_reviews('When Harry Met Sally', 1..4, 6)
add_movie_reviews('Raiders of the Lost Ark', 2..4, 7)
add_movie_reviews('The Help', 1..2, 4)
add_movie_reviews('The imitation game', 3..5, 9)
add_movie_reviews('Lincoln', 3..5, 9)
add_movie_reviews('The Irishman', 2..5, 8)
add_movie_reviews('No time to day', 1..5, 7)
add_movie_reviews('Casablanca', 3..5, 9)
add_movie_reviews('Das leben der anderen', 4..5, 6)

