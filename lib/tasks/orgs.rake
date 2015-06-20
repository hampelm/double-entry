namespace :orgs do
  desc "TODO"
  task import: :environment do

    require 'csv'

    csv_text = File.read('./orgs.csv') # TODO put somewhere more sane
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      row = row.to_hash
      o = Hash["name" => row["name"], "nid" => row["nid"]]
      Organization.create!(o)
    end

  end

end
