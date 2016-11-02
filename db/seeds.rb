require 'active_record'
require 'pg'
require_relative 'connection'
require_relative '../models/apartment'
require_relative '../models/tenant'

Apartment.destroy_all
Tenant.destroy_all

apartment1 = Apartment.create(address: "1111 Burgee Ct.", monthly_rent: 1338, sqft: 100, num_beds: 4, num_baths: 3)
apartment2 = Apartment.create(address: "1112 Walbot Rd.", monthly_rent: 1338, sqft: 100, num_beds: 4, num_baths: 3)
apartment3 = Apartment.create(address: "1113 Anderson Rd.", monthly_rent: 1338, sqft: 100, num_beds: 4, num_baths: 3)

apartment1.tenants.create([
  {name: "Becky", age: 14, gender: "male"},
  {name: "Kelly", age: 34, gender: "female"},
  {name: "Bob", age: 32, gender: "male"}
  ])

apartment2.tenants.create([
  {name: "Beth", age: 24, gender: "female"},
  {name: "Red", age: 25, gender: "male"},
  {name: "Becky2", age: 45, gender: "female"}
  ])

  apartment3.tenants.create([
    {name: "Wendy", age: 39, gender: "female"},
    {name: "Tommy", age: 28, gender: "male"},
    {name: "Holly", age: 57, gender: "female"}
    ])
