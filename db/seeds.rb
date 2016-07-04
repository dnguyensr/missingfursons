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

australian_shepherd = Breed.create(name: 'Australian Shepherd', species: dog)
beagle = Breed.create(name: 'Beagle', species: dog)
boston_terrier = Breed.create(name: 'Boston Terrier', species: dog)
boxer = Breed.create(name: 'Boxer', species: dog)
bulldog = Breed.create(name: 'Bulldog', species: dog)
charles_spaniel = Breed.create(name: 'Cavalier King Charles Spaniel', species: dog)
dachshund = Breed.create(name: 'Dachshund', species: dog)
doberman_pinscher = Breed.create(name: 'Doberman Pinscher', species: dog)
french_bulldog = Breed.create(name: 'French Bulldog', species: dog)
german_shepherd = Breed.create(name: 'German Shepherd', species: dog)
golden = Breed.create(name: 'Golden Retriever', species: dog)
havanse = Breed.create(name: 'Havanese', species: dog)
lab = Breed.create(name: 'Labrador Retriever', species: dog)
mastiff = Breed.create(name: 'Mastiff', species: dog)
mini_schnauzer = Breed.create(name: 'Miniature Schnauzer', species: dog)
pembroke_welsh = Breed.create(name: 'Pembroke Welsh Corgi', species: dog)
pointer = Breed.create(name: 'Pointer', species: dog)
pomeranian = Breed.create(name: 'Pomeranian', species: dog)
poodle = Breed.create(name: 'Poodle', species: dog)
rottweiler = Breed.create(name: 'Rottweiler', species: dog)
shetland_sheepdog = Breed.create(name: 'Shetland Sheepdog', species: dog)
shih_tzu = Breed.create(name: 'Shih Tzu', species: dog)
siberian_husky = Breed.create(name: 'Siberian Husky', species: dog)
yorkshire_terrier = Breed.create(name: 'Yorkshire Terrier', species: dog)

domestic_long_haired = Breed.create(name: 'Domestic Long-Haired', species: cat)
domestic_short_haired = Breed.create(name: 'Domestic Short-Haired', species: cat)
himalayan = Breed.create(name: 'Himalayan', species: cat)
persy = Breed.create(name: 'Persian', species: cat)
siamese = Breed.create(name: 'Siamese', species: cat)



# newpost1 = Post.create(user: john, found_status: false, location: "92117", phone: "619-884-0246", email: john.email, date: Date.today )
# newpost2 = Post.create(user: jane, found_status: false, location: "92101", phone: "619-884-0246", email: jane.email, date: Date.today )
# teddy = Animal.create(post: newpost1, breed: golden, name: "Teddy", color: "Blonde", additional_notes: "loves frisbees and peanut butter", image: File.new("Teddy-2.jpeg"), age: 4, size: "medium" )
# fluffy = Animal.create(post: newpost2, breed: mix, name: "Fluffy", color: "Calico", additional_notes: "loves chasing dogs", image: File.new("Feles.jpg"), age: 2, size: "small" )
