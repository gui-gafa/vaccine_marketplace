# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create(email: "admin@admin", clinic_owner: false, password: '123456', password_confirmation: '123456')
User.create(email: "clinica@clinica", clinic_owner: true, password: '123456', password_confirmation: '123456')
User.create(email: "clinica2@clinica2", clinic_owner: true, password: '123456', password_confirmation: '123456')
User.create(email: "user@user", clinic_owner: false, password: '123456', password_confirmation: '123456')
User.create(email: "user2@user2", clinic_owner: false, password: '123456', password_confirmation: '123456')


Clinic.create(name:"Zé Gotinha", address: "Rua Roma n° 673, Jardim Augusta, São José dos Campos", user: User.find_by(email:'clinica@clinica'))
Clinic.create(name:"Postão da esquina", address: "Avenida Wenceslau Escobar, 1086, Tristez, Porto Alegre", user: User.find_by(email:'clinica2@clinica2'))

VaccineType.create(name:"Febre Amarela", description: "Vacina para febre amarela, Validade: 10 anos")
VaccineType.create(name:"Tríplice Bacteriana (DTP)", description: "Vacina para difteria, tétano e coqueluche, Validade: 5 anos")
VaccineType.create(name:"Gripe", description: "Vacina para gripe, Validade: 1 ano")

Vaccine.create(price:300.00, vaccine_type: VaccineType.find_by(name:"Febre Amarela"), clinic: Clinic.find_by(name:"Zé Gotinha"))
Vaccine.create(price:200.00, vaccine_type: VaccineType.find_by(name:"Tríplice Bacteriana (DTP)"), clinic: Clinic.find_by(name:"Zé Gotinha"))
Vaccine.create(price:150.00, vaccine_type: VaccineType.find_by(name:"Febre Amarela"), clinic: Clinic.find_by(name:"Postão da esquina"))
Vaccine.create(price:100.00, vaccine_type: VaccineType.find_by(name:"Tríplice Bacteriana (DTP)"), clinic: Clinic.find_by(name:"Postão da esquina"))
Vaccine.create(price:50.00, vaccine_type: VaccineType.find_by(name:"Gripe"), clinic: Clinic.find_by(name:"Postão da esquina"))

Order.create(unit_price: 300.00, quantity: 2,
             vaccine: Vaccine.find_by( vaccine_type: VaccineType.find_by(name:"Febre Amarela"), 
                                       clinic: Clinic.find_by(name:"Zé Gotinha")), user: User.find_by(email: "user@user"))
Order.create(unit_price: 50.00,  quantity: 3,
             vaccine: Vaccine.find_by( vaccine_type: VaccineType.find_by(name:"Gripe"), 
                                       clinic: Clinic.find_by(name:"Postão da esquina")), user: User.find_by(email: "user2@user2"))

Review.create(description: " Nem doeu. ", stars: 5, order: Order.first)
Review.create(description: " Aplicação profissional. ", stars: 5, order: Order.first)
Review.create(description: " Doeu um pouco, mas é uma ótima clinica. ", stars: 3, order: Order.first)
Review.create(description: " Horrível. Não se vacine no Postão da esqunina. ", stars: 0, order: Order.all[1])
