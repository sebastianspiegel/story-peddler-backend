# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

luna = User.create(username: "Luna", password: "password")

james = Story.new(title: "James and the Giant Peach", genre: "Adventure", summary: "An orphaned boy finds a magical peach and goes on a great adventure with a crew of larger-than-life insects.")
james.user = User.first 
james.save
james.characters << Character.create(name: "Miss Spider", description: "A good-natured female spider who takes care of James.")
james.characters << Character.create(name: "The Old Green Grasshopper", description: "A male grasshopper, who is the eldest and most cultured of the animals.")
james.characters << Character.create(name: "James Henry Trotter", description: "The seven-year-old protagonist.")
james.plot_points << PlotPoint.create(description: "The crew captures a flock of seagulls to fly the peach through the sky.", order:3)
james.plot_points <<  PlotPoint.create(description: "James is sent to bed with no dinner by his mean aunts.", order: 1)
james.plot_points <<  PlotPoint.create(description: "The crew parties and eats lots of peach!", order: 2)

tangled = Story.new(title: "Rapunzel", genre: "Romance", summary: "A princess with long hair is recused from a tower by a brave prince.")
tangled.user = User.first
tangled.save 
tangled.characters << Character.create(name: "Rapunzel", description: "A princess with long hair.")
tangled.characters << Character.create(name: "Prince Charming", description: "A brave prince.")
tangled.plot_points << PlotPoint.create(description: "Rapunzel and Prince Charming live happily ever after.", order: 1)
tangled.plot_points << PlotPoint.create(description: "The prince climbs Repunzel's hair.", order: 2)
tangled.plot_points << PlotPoint.create(description: "Rapunzel lets down her hair.", order: 3)

starwars = Story.new(title: "Star Wars", genre: "SciFi", summary: "The Imperial Forces -- under orders from cruel Darth Vader -- hold Princess Leia hostage, in their efforts to quell the rebellion against the Galactic Empire. Luke Skywalker and Han Solo, captain of the Millennium Falcon, work together with the companionable droid duo R2-D2 and C-3PO to rescue the beautiful princess, help the Rebel Alliance, and restore freedom and justice to the Galaxy.")
starwars.user = User.first
starwars.save 
starwars.characters << Character.create(name: "Luke Skywaler", description: "A Tatooine farmboy who rose from humble beginnings to become one of the greatest Jedi the galaxy has ever known.")
starwars.characters << Character.create(name: "Darth Vader", description: "A towering, black-clad, and menacing villain. His head is covered by a mechanical helmet, and the sound of his breathing is an eerie, mechanical hiss.")