  MODULE('GESTION005.CLW')
IMPRIMIR_PADRON_LOCALIDAD_TOTAL_2 PROCEDURE
EXPORT_ESPECIALIDAD_MINISTERIO PROCEDURE
Export_Ministerio      PROCEDURE                      !Exportar Datos al Ministerio de Salud
EXPORT_PADRON_MINISTERIO PROCEDURE
SendEmail              PROCEDURE(string pEmailServer, string pEmailPort, string pEmailFrom, string pEmailTo, string pEmailSubject, string pEmailCC, string pEmailBcc, string pEmailFileList, string pEmailMessageText)
CUMPLE2                PROCEDURE                      !Browse the SOCIOS file
UpdateEMAILS           PROCEDURE                      !Actualizacion EMAILS
VER_MAILS              PROCEDURE                      !Browse the EMAILS File
CUMPLE                 PROCEDURE
CUMPLE1                PROCEDURE
  END
