module CourtDataProviderHelper
  def self.get_courts_names
    return ['CurteadeApelBUCURESTI', 'TribunalulBUCURESTI', 'JudecatoriaSECTORUL4BUCURESTI', 'TribunalulTIMIS', 'CurteadeApelBACAU', 'CurteadeApelCLUJ', 
    'CurteadeApelORADEA', 'CurteadeApelCONSTANTA', 'CurteadeApelSUCEAVA', 'TribunalulBOTOSANI', 'CurteadeApelPLOIESTI', 'CurteadeApelTARGUMURES', 
    'CurteadeApelGALATI', 'CurteadeApelIASI', 'CurteadeApelPITESTI', 'CurteadeApelCRAIOVA', 'JudecatoriaARAD', 'CurteadeApelALBAIULIA', 
    'CurteadeApelTIMISOARA', 'TribunalulBRASOV', 'TribunalulDOLJ', 'CurteadeApelBRASOV', 'CurteaMilitaradeApelBUCURESTI', 'TribunalulSATUMARE', 
    'TribunalulSALAJ', 'TribunalulSIBIU', 'TribunalulSUCEAVA', 'TribunalulTELEORMAN', 'TribunalulTULCEA', 'TribunalulVASLUI', 
    'TribunalulVALCEA', 'TribunalulVRANCEA', 'TribunalulMilitarBUCURESTI', 'TribunalulILFOV', 'JudecatoriaBUFTEA', 'TribunalulGORJ', 
    'TribunalulHARGHITA', 'TribunalulHUNEDOARA', 'TribunalulIALOMITA', 'TribunalulIASI', 'TribunalulMARAMURES', 'TribunalulMEHEDINTI', 
    'TribunalulMURES', 'TribunalulNEAMT', 'TribunalulOLT', 'TribunalulPRAHOVA', 'TribunalulALBA', 'TribunalulARAD', 
    'TribunalulARGES', 'TribunalulBACAU', 'TribunalulBIHOR', 'TribunalulBISTRITANASAUD', 'TribunalulBRAILA', 'TribunalulBUZAU', 
    'TribunalulCARASSEVERIN', 'TribunalulCALARASI', 'TribunalulCLUJ', 'TribunalulCONSTANTA', 'TribunalulCOVASNA', 'TribunalulDAMBOVITA', 
    'TribunalulGALATI', 'TribunalulGIURGIU', 'JudecatoriaADJUD', 'JudecatoriaAGNITA', 'JudecatoriaAIUD', 'JudecatoriaALBAIULIA', 
    'JudecatoriaALESD', 'JudecatoriaBABADAG', 'JudecatoriaBACAU', 'JudecatoriaBAIADEARAMA', 'JudecatoriaBAIAMARE', 'JudecatoriaBAILESTI', 
    'JudecatoriaBALS', 'JudecatoriaBALCESTI', 'JudecatoriaBECLEAN', 'JudecatoriaBEIUS', 'JudecatoriaBICAZ', 'JudecatoriaBARLAD', 
    'JudecatoriaBISTRITA', 'JudecatoriaBLAJ', 'JudecatoriaBOLINTINVALE', 'JudecatoriaBOTOSANI', 'JudecatoriaBOZOVICI', 'JudecatoriaBRAD', 
    'JudecatoriaBRAILA', 'JudecatoriaBRASOV', 'JudecatoriaBREZOI', 'JudecatoriaBUHUSI', 'JudecatoriaBUZAU', 'JudecatoriaCALAFAT', 
    'JudecatoriaCALARASI', 'JudecatoriaCAMPENI', 'JudecatoriaCAMPINA', 'JudecatoriaCAMPULUNG', 'JudecatoriaCAMPULUNGMOLDOVENESC', 'JudecatoriaCARACAL', 
    'JudecatoriaCARANSEBES', 'JudecatoriaCHISINEUCRIS', 'JudecatoriaCLUJNAPOCA', 'JudecatoriaCONSTANTA', 'JudecatoriaCORABIA', 'JudecatoriaCOSTESTI', 
    'JudecatoriaCRAIOVA', 'JudecatoriaCURTEADEARGES', 'JudecatoriaDarabani', 'JudecatoriaCAREI', 'JudecatoriaDEJ', 'JudecatoriaDETA', 
    'JudecatoriaDEVA', 'JudecatoriaDOROHOI', 'JudecatoriaDRAGASANI', 'JudecatoriaDRAGOMIRESTI', 'JudecatoriaDROBETATURNUSEVERIN', 'JudecatoriaFAGARAS', 
    'JudecatoriaFALTICENI', 'JudecatoriaFAUREI', 'JudecatoriaFETESTI', 'JudecatoriaFILIASI', 'JudecatoriaFOCSANI', 'JudecatoriaGAESTI', 
    'JudecatoriaGALATI', 'JudecatoriaGHEORGHENI', 'JudecatoriaGHERLA', 'JudecatoriaGIURGIU', 'JudecatoriaGURAHUMORULUI', 'JudecatoriaGURAHONT', 
    'JudecatoriaHARLAU', 'JudecatoriaHATEG', 'JudecatoriaHOREZU', 'JudecatoriaHUEDIN', 'JudecatoriaHUNEDOARA', 'JudecatoriaHUSI', 
    'JudecatoriaIASI', 'JudecatoriaINEU', 'JudecatoriaINSURATEI', 'JudecatoriaINTORSURABUZAULUI', 'JudecatoriaLEHLIUGARA', 'JudecatoriaLIPOVA', 
    'JudecatoriaLUDUS', 'JudecatoriaLUGOJ', 'JudecatoriaMACIN', 'JudecatoriaMANGALIA', 'JudecatoriaMARGHITA', 'JudecatoriaMEDGIDIA', 
    'JudecatoriaMEDIAS', 'JudecatoriaMIERCUREACIUC', 'JudecatoriaMIZIL', 'JudecatoriaMOINESTI', 'JudecatoriaMOLDOVANOUA', 'JudecatoriaMORENI', 
    'JudecatoriaMOTRU', 'JudecatoriaMURGENI', 'JudecatoriaNASAUD', 'JudecatoriaNEGRESTIOAS', 'JudecatoriaNOVACI', 'JudecatoriaODORHEIULSECUIESC', 
    'JudecatoriaOLTENITA', 'JudecatoriaONESTI', 'JudecatoriaORADEA', 'JudecatoriaORASTIE', 'JudecatoriaORAVITA', 'JudecatoriaORSOVA', 
    'JudecatoriaPANCIU', 'JudecatoriaPATARLAGELE', 'JudecatoriaPETROSANI', 'JudecatoriaPIATRANEAMT', 'JudecatoriaPITESTI', 'JudecatoriaPLOIESTI', 
    'JudecatoriaPOGOANELE', 'JudecatoriaPUCIOASA', 'JudecatoriaRACARI', 'JudecatoriaRADAUTI', 'JudecatoriaRADUCANENI', 'JudecatoriaRAMNICUSARAT', 
    'JudecatoriaRAMNICUVALCEA', 'JudecatoriaREGHIN', 'JudecatoriaRESITA', 'JudecatoriaROMAN', 'JudecatoriaROSIORIDEVEDE', 'JudecatoriaRUPEA', 
    'JudecatoriaSALISTE', 'JudecatoriaSANNICOLAULMARE', 'JudecatoriaSATUMARE', 'JudecatoriaSAVENI', 'JudecatoriaSEBES', 'JudecatoriaSECTORUL1BUCURESTI', 
    'JudecatoriaSECTORUL2BUCURESTI', 'JudecatoriaSECTORUL3BUCURESTI', 'JudecatoriaSECTORUL5BUCURESTI', 'JudecatoriaSECTORUL6BUCURESTI', 'JudecatoriaSEGARCEA', 'JudecatoriaSFANTUGHEORGHE', 
    'JudecatoriaSIBIU', 'JudecatoriaSIGHETUMARMATIEI', 'JudecatoriaSIGHISOARA', 'JudecatoriaSIMLEULSILVANIEI', 'JudecatoriaSINAIA', 'JudecatoriaSLATINA', 
    'JudecatoriaSLOBOZIA', 'JudecatoriaSTREHAIA', 'JudecatoriaSUCEAVA', 'JudecatoriaTARGOVISTE', 'JudecatoriaTARGUBUJOR', 'JudecatoriaTARGUCARBUNESTI', 
    'JudecatoriaTARGUJIU', 'JudecatoriaTARGULAPUS', 'JudecatoriaTARGUMURES', 'JudecatoriaTARGUNEAMT', 'JudecatoriaTARGUSECUIESC', 'JudecatoriaTARNAVENI', 
    'JudecatoriaTECUCI', 'JudecatoriaTIMISOARA', 'JudecatoriaTOPLITA', 'JudecatoriaTULCEA', 'JudecatoriaTURDA', 'JudecatoriaTURNUMAGURELE', 
    'JudecatoriaURZICENI', 'JudecatoriaVALENIIDEMUNTE', 'JudecatoriaVANJUMARE', 'JudecatoriaVASLUI', 'JudecatoriaVATRADORNEI', 'JudecatoriaVIDELE', 
    'JudecatoriaVISEUDESUS', 'JudecatoriaZALAU', 'JudecatoriaZARNESTI', 'JudecatoriaZIMNICEA', 'TribunalulMilitarIASI', 'JudecatoriaALEXANDRIA', 
    'TribunalulMilitarTIMISOARA', 'TribunalulMilitarCLUJNAPOCA', 'TribunalulMilitarTeritorialBUCURESTI', 'JudecatoriaAVRIG', 'JudecatoriaTOPOLOVENI', 'JudecatoriaPODUTURCULUI', 
    'JudecatoriaFAGET', 'JudecatoriaSALONTA', 'JudecatoriaLIESTI', 'JudecatoriaHARSOVA', 'JudecatoriaSOMCUTAMARE', 'JudecatoriaPASCANI', 
    'TribunalulComercialARGES', 'TribunalulComercialCLUJ', 'TribunalulComercialMURES', 'TribunalulpentruminoriSifamilieBRASOV', 'JudecatoriaCORNETU', 'JudecatoriaJIBOU' ]
  end

  # def self.populate_all
  #   get_courts_names.each do |court_name|
  #     Court.create(name: court_name, computer_name: court_name)
  #   end
  # end
end
