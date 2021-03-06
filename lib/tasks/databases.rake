namespace :db do
  desc 'Drops and recreates the database from db/schema.rb for the current environment and loads the seeds.'
  task :reset => [ 'db:drop', 'db:setup' ]
 
  desc 'Create the database, load the schema, and initialize with the seed data'
  task :setup => [ 'db:create', 'db:schema:load', 'db:seed' ]
 
  desc 'Load the seed data from db/seeds.rb'
  task :seed => :environment do
    seed_file = File.join(Rails.root, 'db', 'seeds.rb')
    load(seed_file) if File.exist?(seed_file)
  end
  
  desc 'Load the sample data from db/samples.rb'
  task :sample => :environment do
    sample_file = File.join(Rails.root, 'db', 'samples.rb')
    load(sample_file) if File.exist?(sample_file)
  end
end