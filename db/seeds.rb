# encoding: UTF-8
# This file is auto-generated from the current content of the database. Instead
# of editing this file, please use the migrations feature of Seed Migration to
# incrementally modify your database, and then regenerate this seed file.
#
# If you need to create the database on another system, you should be using
# db:seed, not running all the migrations from scratch. The latter is a flawed
# and unsustainable approach (the more migrations you'll amass, the slower
# it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Base.transaction do

  City.create({"id"=>1, "is_enabled"=>true, "name"=>"Jakarta"})

  City.create({"id"=>2, "is_enabled"=>true, "name"=>"Surabaya"})

  City.create({"id"=>3, "is_enabled"=>true, "name"=>"Bandung"})

  City.create({"id"=>4, "is_enabled"=>true, "name"=>"Medan"})

  City.create({"id"=>5, "is_enabled"=>true, "name"=>"Bekasi"})

  City.create({"id"=>6, "is_enabled"=>true, "name"=>"Semarang"})
  ActiveRecord::Base.connection.reset_pk_sequence!('cities')
end

SeedMigration::Migrator.bootstrap(20180801172136)
