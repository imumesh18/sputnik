# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks

begin
    require 'cane/rake_task'
  
    desc "Run cane to check quality metrics"
    Cane::RakeTask.new(:quality) do |cane|
      cane.add_threshold 'coverage/.last_run.json', :>=, 49
      cane.no_style = true
      cane.no_doc = true
      cane.no_readme = true
      cane.no_abc = true
    end
  
    task :default => :quality
  rescue LoadError
    warn "cane not available, quality task not provided."
  end