namespace :grape do
  desc "List Routes"
  task routes: :environment do
    Twitter::API.routes.each do |api|
      method = api.route_method.ljust(10)
      path = api.route_path
      puts "\s\s\s\s#{method} #{path}"
    end
  end
end
