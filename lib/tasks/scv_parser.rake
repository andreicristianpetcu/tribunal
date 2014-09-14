namespace :scv_parser do
  desc "Parse data/Capete_de_tabel_indicatori_2013.csv"
  task parse_courts_indicators_csv: :environment do
    CsvParserHelper.parse_indicators_csv
  end

  desc "Parse data/Circumscriptii_instante.csv"
  task parse_circumscriptions_csv: :environment do
    CsvParserHelper.parse_circumscriptions_csv
  end
end
