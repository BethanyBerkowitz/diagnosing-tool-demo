# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

symptoms = Symptom.create([
    { description: 'Uncontrollable Giggles' }, 
    { description: 'Coffee Breath' }, 
    { description: 'Unbearable Lightness of Being' }, 
    { description: 'Blindness in 3rd Eye' }, 
    { description: 'Caterpillars' },
    { description: 'Smells Like Teen Spirit' },
])

diagnoses = Diagnosis.create([
    { description: 'Carbon-Based' }, 
    { description: 'Overcaffeinated' }, 
    { description: 'Undercaffeinated' }, 
    { description: 'Socially Distant' }, 
])