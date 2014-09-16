namespace :csv_exporter do

  desc "export meetings to CSV"
  task export_meetings_to_csv: :environment do
    CsvExporterHelper.export_meetings_to_csv
  end

end
