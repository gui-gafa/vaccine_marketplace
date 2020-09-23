# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


VaccineType.create(name:"Febre Amarela", description: "Vacina para febre amarela, Validade: 10 anos")
VaccineType.create(name:"Tríplice Bacteriana (DTP)", description: "Vacina para difteria, tétano e coqueluche, Validade: 5 anos")
VaccineType.create(name:"Gripe", description: "Vacina para gripe, Validade: 1 ano")

