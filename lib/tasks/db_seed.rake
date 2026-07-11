namespace :db do
  namespace :seeding do
    Rails.root.glob('db/seeds/*_seeds.rb').each do |filename|
      task_name = File.basename(filename, '.rb').gsub('_seeds', '')

      task task_name => :environment do
        load(filename)
      end
    end
  end
end
