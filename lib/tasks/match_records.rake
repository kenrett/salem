require 'csv'

desc 'This task matches records from two csv files'

task :match_records, [:big_csv, :small_csv] => [:environment] do |t, argv|
  CSV.foreach(argv[:big_csv], headers: true, header_converters: :symbol) do |row|
    CSV.foreach(argv[:small_csv], headers: true, header_converters: :symbol) do |record|
      if row[:date] == record[:date] && row[:blah] == record[:blah]
        File.open('./matches.csv', 'a'){|file| file << "#{row[:date]}, #{row[:blah]}"}
      end
    end
  end
end

