Reservation.destroy_all
Place.destroy_all
User.destroy_all

user = User.create!(name: 'John')
place = Place.create!(description: 'La casa escondida', location: 'Peru', owner: user, rate: 200)
Reservation.create!(start_date: '31/12/2022', end_date: '31/12/2023', place: place, customer: user, bill: 200)
