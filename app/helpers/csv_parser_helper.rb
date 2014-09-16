module CsvParserHelper

  def self.parse_circumscriptions_csv
    csv_file_path = File.join(File.dirname(__FILE__), "../../data/Circumscriptii_instante.csv")
    headers_checked = false
    population_hash = Hash.new
    CSV.foreach(csv_file_path) do |row|
      if !headers_checked then
        check_headers(row, get_circumscription_headers)
        headers_checked = true
      else
        append_population_to(population_hash, row[5], row[8])
        append_population_to(population_hash, row[6], row[8])
        append_population_to(population_hash, row[7], row[8])
      end
    end
    population_hash.each do |key, value|
      if !key.nil?
        court = Court.where(computer_name: key).first
        if !court.nil?
          court.population = value
          court.save
        end
      end
    end
  end

  def self.append_population_to(hash, key, population)
    if hash[key].nil?
      hash[key] = 0
    end
    hash[key] += strip(population)
  end

  def self.parse_dictionary_term_csv
    DictionaryTerm.delete_all
    csv_file_path = File.join(File.dirname(__FILE__), "../../data/dictionary_term.csv")
    CSV.foreach(csv_file_path) do |row|
      dictionary_term = DictionaryTerm.new  
      dictionary_term.termen = row[0]
      dictionary_term.legaleza = row[1]
      dictionary_term.romana = row[2]
      dictionary_term.save
    end
  end

  def self.parse_court_judges_csv
    csv_file_path = File.join(File.dirname(__FILE__), "../../data/judges.csv")
    headers_checked = false
    CSV.foreach(csv_file_path) do |row|
      if !headers_checked then
        check_headers(row, get_court_judges_headers)
        headers_checked = true
      else
        court_computer_name = row[2]
        court = Court.where(computer_name: court_computer_name).first
        if !court.nil?
          trial_judge = TrialJudge.new
          trial_judge.surname = row[0]
          trial_judge.name = row[1]
          trial_judge.court = court

          trial_judge.save
        else
          raise "Court not found for #{row}"
        end
      end
    end
  end

  def self.parse_court_contacts_csv
    csv_file_path = File.join(File.dirname(__FILE__), "../../data/court_contacts.csv")
    headers_checked = false
    CSV.foreach(csv_file_path) do |row|
      if !headers_checked then
        check_headers(row, get_court_contacts_headers)
        headers_checked = true
      else
        court_computer_name = row[1]
        court = court.where(computer_name: court_computer_name).first
        court.web_site = row[2]
        court.email = row[3]
        court.telephone = row[4]
        court.fax = row[5]
        court.program = row[6]
        court.address = row[7]

        court.save
        puts court.name
      end
    end
  end

  def self.parse_indicators_csv
    csv_file_path = File.join(File.dirname(__FILE__), "../../data/Capete_de_tabel_indicatori_2013_2.csv")
    headers_checked = false
    CSV.foreach(csv_file_path) do |row|
      if !headers_checked then
        check_headers(row, get_indicator_headers)
        headers_checked = true
      else
        court_computer_name = row[1]
        court = Court.where(computer_name: court_computer_name).first
        if court.nil?
          raise "No court with computer name #{court_computer_name}"
        else
          fill_court_from_row(court, row)
          court.save
          puts court.name
        end
      end
    end
  end

  def self.fill_court_from_row(court, row)
    court.name = row[0]
    court.computer_name = row[1]
    court.population = strip(row[2])
    court.number_of_judges = strip(row[3])
    court.total_activity_volume = strip(row[4])
    court.resolved_trial_fields = strip(row[5])
    court.load_per_scheme = strip(row[6])
    court.load_per_judge = strip(row[7])
    court.atacability_indicator = strip(row[8])
    court.casation_indicator = strip(row[9])
    court.duration_in_days = strip(row[10])
    court.performance_indicator = strip(row[11])
    court.operativity = strip(row[12])
    court.load_indicator = strip(row[13])
    court.safety_indicator = strip(row[14])
  end
  
  def self.strip(string)
    if !string.nil? then
      return Float(string.tr('%', '').tr(' ', '').tr(',', '.'))
    else
      return nil
    end
  end

  def self.check_headers(possible_headers, actual_headers)
    actual_headers.each_with_index do |item, index|
      current_column_header = possible_headers[index]
      if(current_column_header != item) then
        error_message =  "Headers have changed for index #{index} \n expecting \"#{item}\" \n but found \"#{current_column_header}\""
        raise error_message
      end
    end
  end 

  def self.get_court_judges_headers
    return ["Nume", "Prenume", "Instanta"]
  end

  def self.get_court_contacts_headers
    return ["Instanța", "Cod portal", "Site", "Email", "Telefon", "Fax", "Program de lucru", "Adresa"]
  end

  def self.get_circumscription_headers
    return ["Cod judet", "Codul SIRUTA", "judet", "localitatea", "rang", "judecatorie", "tribunal", "CA", "Populatie"]
  end

  def self.get_indicator_headers
    ["Denumirea instantei in clar (cu diactritice)",
     "Codul informatic al instantei (din portal)",
     "Populația",
     "Numar de judecatori",
     "Stoc (total volum de activitate al instantei)",
     "Dosare solutionate",
     "Incarcatura pe schema",
     "Incarcatura pe judecator",
     "Indice de atacabilitate (procent atacate din solutionate)",
     "Indice de casare/desfiintare",
     "Durata in zile (extras din portal, ca diferenta dintre data inregistrarii dosarului si data solutionarii)",
     "Performanta pentru gogoasa",
     "Operativitatea relativa",
     "Incarcatura relativa",
     "Siguranta relativa"]
  end
end
