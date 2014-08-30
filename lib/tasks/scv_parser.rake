namespace :scv_parser do
  desc "Parse data\\Capete_de_tabel_indicatori_2012.csv"
  task parse_courts_indicators_csv: :environment do
    CsvParserHelper.parse_indicators_csv
  end

end
