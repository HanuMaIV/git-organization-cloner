require 'json'
puts "Please Enter your Git Username"
username = gets.chomp
puts "Please Enter your Organization Name"
organization = gets.chomp
puts "Please enter number of repos"
pages = (gets.chomp.to_i / 100) + 1

pages.to_i.times do |page|

  api_results = `curl -u "#{username}" "https://api.github.com/orgs/#{organization}/repos?page=#{page}&per_page=100"`

  git_repositories = JSON.parse(api_results)

  git_repositories.each do |repo|
    `git clone #{repo["ssh_url"]}`
  end

end

