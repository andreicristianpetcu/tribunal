module CsvParserHelper

  def self.parse_indicators_csv
    csv_file_path = File.join(File.dirname(__FILE__), "../../data/Capete_de_tabel_indicatori_2013.csv")
    headers_checked = false
    CSV.foreach(csv_file_path) do |row|
      if !headers_checked then
        check_headers(row)
        headers_checked = true
      else
        court_computer_name = row[1]
        court = Court.where(computer_name: court_computer_name).first
        fill_court_from_row(court, row)
        court.save
        puts court.name
      end
    end
  end

  def self.fill_court_from_row(court, row)
    court.name = row[0]
    court.computer_name = row[1]
    # court.population = strip(row[2])
    court.number_of_judges = strip(row[3])
    court.budget = strip(row[4])
    court.total_activity_volume = strip(row[5])
    court.resolved_trial_fields = strip(row[6])
    court.operativity = strip(row[7])
    # court.operativity_median = strip(row[8])
    court.load_per_scheme = strip(row[9])
    court.load_per_judge = strip(row[10])
    court.load_indicator = strip(row[11])
    court.share_per_population = strip(row[12])
    # court.median_load_indicator = strip(row[13])
    court.atacability_indicator = strip(row[14])
    court.casation_indicator = strip(row[15])
    court.safety_indicator = strip(row[16])
    # court.safety_indicator_median = strip(row[17])
    court.duration_in_days = strip(row[18])
    court.duration_in_months = strip(row[19])
    court.share_by_duration = strip(row[20])
    # court.duration_median = strip(row[21])
    court.performance_indicator = strip(row[22])
    # court.performance_median = strip(row[23])
  end
  
  def self.strip(string)
    if !string.nil? then
      return Float(string.tr('%', '').tr(' ', '').tr(',', '.'))
    else
      return nil
    end
  end

  def self.check_headers(possible_headers)
    get_headers.each_with_index do |item, index|
      current_column_header = possible_headers[index]
      if(current_column_header != item) then
        error_message =  "Headers have changed for index #{index} \n expecting \"#{item}\" \n but found \"#{current_column_header}\""
        raise error_message
      end
    end
  end 

  def self.get_headers
    initial_headers = ["Denumirea instantei in clar (cu diactritice)",
                       "Codul informatic al instantei (din portal)",
                       "Populația",
                       "Numar de judecatori",
                       "Buget (mii lei)",
                       "Stoc (total volum de activitate al instantei)",
                       "Dosare solutionate",
                       "Operativitate (procent solutionate din stoc)",
                       "Mediana sirului de valori privind operativitatea (valorile operativitatii mai mari decat mediana + 5% se vor colora verde, valorile mai mici decat mediana -5% se vor colora rosu, iar valorile dintre mediana +/-5% se vor colora galben)",
                       "Incarcatura pe schema",
                       "Incarcatura pe judecator",
                       "Incarcare (procent schema/judecator)",
                       "ponderare de populatie (procentaj de numar de judecatori ocupati la populatia deservita de acea instanta vs. numar de judecatori nationali la populatia nationala, la fiecare instanta in clasa ei)",
                       "Mediana sirului de valori privind indicele de încărcare(valorile incarcaturii mai mari decat mediana + 5% se vor colora verde, valorile mai mici decat mediana -5% se vor colora rosu, iar valorile dintre mediana +/-5% se vor colora galben)",
                       "Indice de atacabilitate (procent atacate din solutionate)",
                       "Indice de casare/desfiintare",
                       "Indicator de \"siguranta\" (100%-Desfiintare*Atacare) [ne mai gandim la denumire - certitudine/ stabilitate/ predictibilitate]",
                       "Mediana sirului de valori privind indicele de \"siguranta\" (valorile sigurantei mai mari decat mediana + 5% se vor colora verde, valorile mai mici decat mediana -5% se vor colora rosu, iar valorile dintre mediana +/-5% se vor colora galben)",
                       "Durata in zile (extras din portal, ca diferenta dintre data inregistrarii dosarului si data solutionarii)",
                       "Durata (in luni)",
                       "Ponderare dupa durata (procentul de durata de la aceasta instanta fata de durata mediana din clasa ei la nivel national--adica judecatorie, tribunal, curte de apel, curte suprema=4 clase)",
                       "Mediana duratei (valorile duratei mai mari decat mediana nationala + 5% se vor colora rosu, valorile mai mici decat mediana -5% se vor colora verde, iar valorile dintre mediana +/-5% se vor colora galben)",
                       "Indicele de performanta al instantei este [(Operativitate ponderata cu durata) impartit la (Indice de incarcatura ponderata cu populatia)] inmultit cu Indicatorul de \"siguranta\" )",
                       "Mediana sirului de valori privind indicele de performanta (valorile performantei mai mari decat mediana + 5% se vor colora verde, valorile mai mici decat mediana -5% se vor colora rosu, iar valorile dintre mediana +/-5% se vor colora galben)",
                       "Sa nu uitam in viitor de ponderarea in functie de nr de firme"]
  initial_headers
  end
end
