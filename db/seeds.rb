User.delete_all
Species.delete_all
Breed.delete_all
Animal.delete_all
Post.delete_all


john = User.create(name: 'John', email: 'a@a.com', password: 'password')
jane = User.create(name: 'Jane', email: 'b@b.com', password: 'password')
daniel = User.create(name: 'Daniel', email: 'daniel@dbc.com', password: 'password')
martha = User.create(name: 'Martha', email: 'martha@dbc.com', password: 'password')
taylor = User.create(name: 'Taylor Twoteeth', email: 'taylor@dbc.com', password: 'password')
david = User.create(name: 'David', email: 'david@dbc.com', password: 'password')
noah = User.create(name: 'Noah', email: 'noah@dbc.com', password: 'password')

dog = Species.create(name: 'Dog')
cat = Species.create(name: 'Cat')

golden = Breed.create(name: 'Golden Retriever', species: dog)
shih_tzu = Breed.create(name: 'Shih Tzu', species: dog)

persy = Breed.create(name: 'Persian', species: cat)
mix = Breed.create(name: 'Mixed', species: cat)

# newpost1 = Post.create(user: john, found_status: false, location: "92117", phone: "619-884-0246", email: john.email, date: Date.today )
# newpost2 = Post.create(user: jane, found_status: false, location: "92101", phone: "619-884-0246", email: jane.email, date: Date.today )

teddy = Animal.create(post: newpost1, breed: golden, name: "Teddy", color: "Blonde", additional_notes: "loves frisbees and peanut butter", age: 4, size: "medium", user: jane )
fluffy = Animal.create(post: newpost2, breed: mix, name: "Fluffy", color: "Calico", additional_notes: "loves chasing dogs", age: 2, size: "small", user: john )

