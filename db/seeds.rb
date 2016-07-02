
User.delete_all
Species.delete_all
Breed.delete_all
Animal.delete_all
Post.delete_all


john = User.create(name: 'john', email: 'a@a.com', password: 'password')
jane = User.create(name: 'jane', email: 'b@b.com', password: 'password')

dog = Species.create(name: 'Dog')
cat = Species.create(name: 'Cat')

golden = Breed.create(name: 'Golden Retriever', species_id: dog.id)
shih_tzu = Breed.create(name: 'Shih Tzu', species_id: dog.id)

persy = Breed.create(name: 'Persian', species_id: cat.id)
mix = Breed.create(name: 'Mixed', species_id: cat.id)

teddy = Animal.create(breed_id: golden.id, name: "Teddy", color: "Blonde", additional_notes: "loves frisbees and peanut butter", image: File.new("./db/Teddy-2.jpeg"), age: 4, size: "medium" )
fluffy = Animal.create(breed_id: mix.id, name: "Fluffy", color: "Calico", additional_notes: "loves chasing dogs", image: File.new("./db/Feles.jpg"), age: 2, size: "small" )

newpost1 = Post.create(user_id: john.id, animal_id: teddy.id, found_status: false, location: "92117", phone: "619-884-0246", email: john.email, date: Date.today )
newpost2 = Post.create(user_id: jane.id, animal_id: fluffy.id, found_status: false, location: "92101", phone: "619-884-0246", email: jane.email, date: Date.today )


