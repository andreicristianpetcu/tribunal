require 'savon'

module JustroParserHelper

  def self.get_parser_request_params
    request_params_list = []
    court_name = 'CurteadeApelBUCURESTI'
    startDate = Date.new(2000, 1, 1)
    endDate = Date.today
    (startDate..endDate).each do |date|
      request_param = {}
      request_param[:court_name] = court_name
      request_param[:date] = date
      request_params_list << request_param
      # puts "date #{date}"
    end
    request_params_list
  end

  def self.get_justro_meetings
    client = Savon.client(wsdl: 'http://portalquery.just.ro/query.asmx?WSDL')
    response = client.call(:cautare_sedinte, message: {institutie: 'CurteadeApelBUCURESTI', dataSedinta: '2013-03-05'})
    meetings = response.body[:cautare_sedinte_response][:cautare_sedinte_result][:sedinta]
    return meetings
  end

  def self.save_meetings_to_mongo
    meetings = get_justro_meetings
    meetings.each do |meeting|
      puts meeting[:departament]
      requestDate = DateTime.now()
      # requestParams = {}
      # requestParZWams
      JustRoRequest.create(
        meeting: meeting, 
        requestDate: requestDate)
    end
  end
end
