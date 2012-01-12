namespace :radiant do
  namespace :extensions do
    namespace :lacquer do
      
      desc "Runs the migration of the Lacquer extension"
      task :migrate => :environment do
        require 'radiant/extension_migrator'
        if ENV["VERSION"]
          LacquerExtension.migrator.migrate(ENV["VERSION"].to_i)
          Rake::Task['db:schema:dump'].invoke
        else
          LacquerExtension.migrator.migrate
          Rake::Task['db:schema:dump'].invoke
        end
      end
      
      desc "Copies public assets of the Lacquer to the instance public/ directory."
      task :update => :environment do
        is_svn_or_dir = proc {|path| path =~ /\.svn/ || File.directory?(path) }
        puts "Setting default initializers"
        Dir[LacquerExtension.root + "/lib/templates/*"].reject(&is_svn_or_dir).each do |file|
          path = file.sub(LacquerExtension.root, '')
          if path =~ /lacquer.rb/
            cp file, RAILS_ROOT + '/config/initializers', :verbose => false
          elsif path =~ /varnish./
            cp file, RAILS_ROOT + '/config', :verbose => false
          end
          
        end
      end
      
    end
  end
end
