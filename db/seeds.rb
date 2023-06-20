Reservation.destroy_all
Place.destroy_all
User.destroy_all
user = User.create!(name: 'John')
Place.create([
    {description: "Stay with Alvaro - Hosting for 6 years",
    photo: "https://images.unsplash.com/photo-1591825729269-caeb344f6df2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80",
    location: "Stowe, Vermont",
    owner: user,
    rate: 123
    },
    {description: "Stay with Daniele - Consultancy",
    photo: "https://images.unsplash.com/photo-1619292585355-ab0e3fd509fe?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=872&q=80",
    location: "Boston, MA, USA",
    owner: user,
    rate: 28
    },
    {description: "Stay with Mathieu - Business owner",
    photo: "https://images.unsplash.com/photo-1629078691977-dc51747c0263?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=869&q=80",
    location: "Gold Coast QLD, Australia",
    owner: user,
    rate: 55
    },
    {description: "Stay with David - Landscaper - Hosting for 7 years",
    photo: "https://images.unsplash.com/photo-1634849430862-a5a3ba00a7f9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80",
    location: "Juniper Mountain House, Evergreen",
    owner: user,
    rate: 80
    },
])
10.times do
    Reservation.create!(
        customer: user, 
        place: Place.all.sample, 
        start_date: Random.rand((Date.today + 1.days)..(Date.today + 6.days)), 
        end_date: Random.rand((Date.today + 1.week)..(Date.today + 2.weeks))
    )
end
