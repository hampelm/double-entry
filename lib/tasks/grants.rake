namespace :grants do
  desc "TODO"
  task import: :environment do

    require 'csv'

    csv_text = File.read('./grants.csv') # TODO put somewhere more sane
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      row = row.to_hash

      # TODO why isn't this working?
      Rails.logger.info row["from"]

      begin
        to = Organization.find_by name: row["to"]
        from = Organization.find_by name: row["from"]
      rescue ActiveRecord::RecordNotFound
        Rails.logger.warn "No record"
        next
      end


      Grant.create(
        from: from,
        to: to,
        amount: row["amount"],
        start: row["start"].to_date,
        complete: row["complete"].to_date,
      )
    end

  end

end
