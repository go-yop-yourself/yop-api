namespace :db do
  task :migrate do
    require "sequel"
    Sequel.extension :migration
    db = Sequel.connect("sqlite://db/yop.db")
    puts "Migrating to latest"
    Sequel::Migrator.run(db, "db/migrations")
  end
end
