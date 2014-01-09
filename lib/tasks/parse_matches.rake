require 'csv'

desc 'This task changes the date format for matching'

task :update_matches => [:environment] do 
  all_matches = Match.all
  all_matches.each do |match|
    match.update_attribute(:har_adm_date, Date.strptime(match.har_adm_date, '%m/%d/%Y'))
  end
end