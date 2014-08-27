module CsvParserHelper

  def self.parse_indicators_csv
    csv_file_path = File.join(File.dirname(__FILE__), "../../data/Capete_de_tabel_indicatori_2012.csv")
    CSV.foreach(csv_file_path) do |row|
      #check table headers
      binding.pry
    end
  end
end
