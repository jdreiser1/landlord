### NOTE: Make sure you've loaded the seeds.sql file into your DB before starting
### this exercise

require "pg" # postgres db library
require "active_record" # the ORM
require "pry" # for debugging

ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :database => "landlord_db"
)

class Tenant < ActiveRecord::Base
  belongs_to :apartment
end

class Apartment < ActiveRecord::Base
  has_many :tenaexints
end

################################################
#### NOTE: DON'T MODIFY ABOVE THIS LINE     ####
################################################


################################################
# FINDING / SELECTING
################################################

# Hint, the following methods will help: `where`, `all`, `find`, `find_by`

# Use Active record to do the following, and store the results **in a variable**
# example: get every tenant in the DB
all_tenants = Tenant.all

# get the first tenant in the DB
first_tenant = Tenant.first
# get all tenants older than 65
older_tenants = Tenant.where("age > 65")
# get all apartments whose price is greater than $2300
expensive_tenants = Apartment.where("monthly_rent > 2300")
# get the apartment with the address "6005 Damien Corners"
specific_apartment = Tenant.find_by(address: "6005 Damien Corners")
# get all tenants in that apartment
tenants_per_apartment = specific_apartment.tenants
# Use `each` and `puts` to:
# Display the name and ID # of every tenant
all_tenant.each {|tenant| puts "#{tenant.id}: #{tenant.name}" }
# Iterate over each apartment, for each apartment, display it's address and rent price
all_apartments = Apartment.all
all_apartments.each {|apartment| puts "#{apartment.address}: #{apartment.monthly_rent}"}
# Iterate over each apartment, for each apartment, display it's address and all of it's tenants
all_apartments.each { |apartment| puts "#{apartment.address}: #{apartment.tenants}" }
################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `uddate`, `destroy`

# Create 3 new apartments, and save them to the DB
Apartment.create(address: "1111 Penis Rd.", monthly_rent: 1338, sqft: 100, num_beds: 4, num_baths: 3)
Apartment.create(address: "1112 Penis Rd.", monthly_rent: 1338, sqft: 100, num_beds: 4, num_baths: 3)
Apartment.create(address: "1113 Penis Rd.", monthly_rent: 1338, sqft: 100, num_beds: 4, num_baths: 3)
# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
Tenant.create(name: "Becky", age: 14, gender: "male", apartment_id: 1)
Tenant.create(name: "Becky1", age: 15, gender: "male", apartment_id: 1)
Tenant.create(name: "Becky2", age: 16, gender: "male", apartment_id: 2)
Tenant.create(name: "Becky3", age: 15, gender: "female", apartment_id: 3)
Tenant.create(name: "Becky4", age: 17, gender: "male", apartment_id: 3)
Tenant.create(name: "Becky5", age: 16, gender: "female", apartment_id: 3)
Tenant.create(name: "Becky6", age: 18, gender: "male", apartment_id: 3)
Tenant.create(name: "Becky7", age: 34, gender: "male", apartment_id: 2)
Tenant.create(name: "Becky8", age: 64, gender: "male", apartment_id: 1)
# Note: you'll use this little bit of code as a `seeds.rb` file later on.

# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
kristin = Tenant.find_by(name: "Kristin Wisokys")
kristin.age += 1
kristin.save
# Note: She's in the seed data, so she should be in your DB

# Rennovation!
# Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
# Make sure to save the results to your database
apartment = Apartment.find_by address: "62897 Verna Walk"
apartment.num_beds += 1
apartment.save
# Rent Adjustment!
# Update the same apartment that you just 'rennovated'. Increase it's rent by $400
# to reflect the new bedroom
apartment.monthly_rent += 1
apartment.save

# Millenial Eviction!
# Find all tenants who are under 30 years old
# Delete their records from the DB
under_30_tenants = Tenant.where "age < 30"
under_30_tenants.destroy_all
