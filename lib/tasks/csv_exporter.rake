namespace :csv_exporter do
  desc "TODO"
  task export_meetings_to_csv: :environment do
    CsvExporterHelper.export_meetings_to_csv
  end

end
