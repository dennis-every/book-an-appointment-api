Reservation.destroy_all
Place.destroy_all
User.destroy_all


user = User.create!(name: 'John')
place = Place.create!(description: 'Stay with Alvaro - Hosting for 6 years', photo: 'https://unsplash.com/photos/IWfe63thJxk', location: 'Stowe, Vermont', owner: user, rate: 123)
second_place = Place.create!(description: 'Stay with Daniele - Consultancy', photo: 'https://unsplash.com/photos/1uNh3B3ppl4', location: 'Boston, MA, USA', owner: user, rate: 28)
third_place = Place.create!(description: 'Stay with Mathieu - Business owner', photo: 'https://unsplash.com/photos/wE7qDv11kio', location: 'Gold Coast QLD, Australia', owner: user, rate: 55)
fourth_place = Place.create!(description: 'Stay with David - Landscaper - Hosting for 7 years', photo: 'https://unsplash.com/photos/-4eDIVBRP2g', location: 'Juniper Mountain House, Evergreen', owner: user, rate: 80)
Reservation.create!(start_date: '31/12/2022', end_date: '31/12/2023', place: place, customer: user, bill: 200)