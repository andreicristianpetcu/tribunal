require 'savon'

module JustroParserHelper
  def self.get_justro_meetings
    client = Savon.client(wsdl: 'http://portalquery.just.ro/query.asmx?WSDL')
    response = client.call(:cautare_sedinte, message: {institutie: 'CurteadeApelBUCURESTI', dataSedinta: '2013-03-05'})
    meetings = response.body[:cautare_sedinte_response][:cautare_sedinte_result][:sedinta]
    return meetings
  end

  def self.save_meetings_to_mongo
    
  end
end
