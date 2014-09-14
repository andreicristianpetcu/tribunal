require 'csv'

module CsvExporterHelper

  def self.export_meetings_to_csv
    # meeting_number = TrialMeeting.all.size
    meeting_number = 200

    per_batch = 100
    index = 0

    CSV.open('/home/andrei/meetings.csv', 'wb') do |csv|
      csv << ["Departament", "Complet", "Data", "Instanță", "Număr VDosar", "DataDosar", "Tip Caz", "Status"]

      0.step(meeting_number, per_batch) do |offset|
        puts "------------#{get_percentage(index, meeting_number)}"
        TrialMeeting.limit(per_batch).skip(offset).each do |trial_meeting|
          index += 1
          trial_meeting.trial_files.each do |trial_file|
            csv << [trial_meeting.departament, trial_meeting.complet, trial_meeting.date, trial_file.court.computer_name, trial_file.number, 
                    trial_file.date, trial_file.case_type, trial_file.trial_status]
          end
        end
      end
    end

  end

  def self.get_percentage(index, total)
    return "#{(index.to_f/total*100).to_i}%"
  end

end
