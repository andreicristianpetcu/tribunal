require 'savon'

module JustroParserHelper

  def self.get_parser_request_params
    request_params_list = []
    court_name = 'CurteadeApelBUCURESTI'
    # startDate = Date.new(2000, 1, 1)
    # endDate = Date.today
    startDate = Date.new(2014, 3, 5)

    startDate = Date.new(2014, 6, 1)
    endDate = startDate
    (startDate..endDate).each do |date|
      request_param = {}
      request_param[:court_name] = court_name
      request_param[:requestDate] = date.strftime("%Y-%m-%d")
      request_params_list << request_param
    end
    request_params_list
  end

  def self.get_justro_meetings
    meetings = []
    client = Savon.client(wsdl: 'http://portalquery.just.ro/query.asmx?WSDL')
    get_parser_request_params.each do |request_params|
      binding.pry
      puts "request #{request_params}"
      meeting = {}
      meeting[:request_param] = request_params
      begin
        response = client.call(:cautare_sedinte, message: {institutie: request_params[:court_name], dataSedinta: request_params[:requestDate]})
        cautare_sedinte_response = response.body[:cautare_sedinte_response]
        result = cautare_sedinte_response[:cautare_sedinte_result]
        meeting = result[:sedinta]
      rescue Exception => e
        # binding.pry
        meeting[:error] = e.backtrace.to_s
        # binding.pry
      end

      meetings << meeting
    end
    return meetings
  end

  def self.save_meetings_to_mongo
    meetings = get_justro_meetings
    meetings.each do |meeting|
      # puts meeting[:departament]
      requestDate = DateTime.now()
      # requestParams = {}
      # requestParZWams
      # binding.pry
      JustRoRequest.create(
        meeting: meeting, 
        requestDate: requestDate)
    end
  end
end
