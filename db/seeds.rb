# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


DockWorker.delete_all
Shipment.delete_all
Dock.delete_all
Vendor.delete_all
State.delete_all
Appointment.delete_all
Reservation.delete_all

dock_names = ['Dock 1', 'Dock 2', 'Dock 3', 'Dock 4', 'Dock 5', 'Dock 6']
vendor_names = ['Vendor 1', 'Vendor 2', 'Vendor 3', 'Vendor 4', 'Vendor 5', 'Vendor 6']

state_names = [
    "Alabama",
    "Alaska",
    "Arizona",
    "Arkansas",
    "California",
    "Colorado",
    "Connecticut",
    "Delaware",
    "Florida",
    "Georgia",
    "Hawaii",
    "Idaho",
    "Illinois",
    "Indiana",
    "Iowa",
    "Kansas",
    "Kentucky",
    "Louisiana",
    "Maine",
    "Maryland",
    "Massachusetts",
    "Michigan",
    "Minnesota",
    "Mississippi",
    "Missouri",
    "Montana",
    "Nebraska",
    "Nevada",
    "New Hampshire",
    "New Jersey",
    "New Mexico",
    "New York",
    "North Carolina",
    "North Dakota",
    "Ohio",
    "Oklahoma",
    "Oregon",
    "Pennsylvania",
    "Rhode Island",
    "South Carolina",
    "South Dakota",
    "Tennessee",
    "Texas",
    "Utah",
    "Vermont",
    "Virginia",
    "Washington",
    "West Virginia",
    "Wisconsin",
    "Wyoming",

]


docks = []
vendors = []
states = []


dock_names.each do |dock_name|
  docks << Dock.create(name: dock_name)
end

vendor_names.each do |vendor_name|
  vendors << Vendor.create(name: vendor_name)
end

state_names.each do |state_name|
  states << State.create(name: state_name)
end