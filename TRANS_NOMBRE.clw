   PROGRAM



   INCLUDE('ABERROR.INC'),ONCE
   INCLUDE('ABFILE.INC'),ONCE
   INCLUDE('ABUTIL.INC'),ONCE
   INCLUDE('ERRORS.CLW'),ONCE
   INCLUDE('KEYCODES.CLW'),ONCE
   INCLUDE('ABFUZZY.INC'),ONCE

   MAP
     MODULE('TRANS_NOMBRE_BC.CLW')
DctInit     PROCEDURE                                      ! Initializes the dictionary definition module
DctKill     PROCEDURE                                      ! Kills the dictionary definition module
     END
!--- Application Global and Exported Procedure Definitions --------------------------------------------
     MODULE('TRANS_NOMBRE001.CLW')
Main                   PROCEDURE   !Wizard Application for D:\bajados\BORRAR\medicina\TRANS_NOMBRE.dct
     END
   END

APELLIDO             CSTRING(51)
NOMBRES              CSTRING(51)
SilentRunning        BYTE(0)                               ! Set true when application is running in 'silent mode'

!region File Declaration
SOCIOS               FILE,DRIVER('ODBC'),OWNER('psrn,sysdba'),NAME('SOCIOS'),PRE(SOC),BINDABLE,THREAD !                     
IDX_SOCIOS_DOCUMENTO     KEY(SOC:N_DOCUMENTO)              !                     
IDX_SOCIOS_MATRICULA     KEY(SOC:MATRICULA)                !                     
PK_SOCIOS                KEY(SOC:IDSOCIO),PRIMARY          !                     
IDX_SOCIOS_ACTA          KEY(SOC:ACTA),DUP                 !                     
IDX_SOCIOS_BAJA          KEY(SOC:BAJA),DUP                 !                     
IDX_SOCIOS_LIBRO         KEY(SOC:LIBRO),DUP                !                     
IDX_SOCIOS_NOMBRE        KEY(SOC:NOMBRE),DUP               !                     
IDX_SOCIOS_N_VIEJO       KEY(SOC:NRO_VIEJO),DUP            !                     
IDX_SOCIOS_PROVEEDOR     KEY(SOC:IDPROVEEDOR),DUP          !                     
IDX_SOCIOS_PROVISORIO    KEY(SOC:PROVISORIO),DUP           !                     
IDX_SOCIO_INGRESO        KEY(SOC:INGRESO),DUP              !                     
FK_SOCIOS_CIRCULO        KEY(SOC:IDCIRCULO),DUP            !                     
FK_SOCIOS_COBERTURA      KEY(SOC:IDCOBERTURA),DUP          !                     
FK_SOCIOS_INSTITUCION    KEY(SOC:IDINSTITUCION),DUP        !                     
FK_SOCIOS_LOCALIDAD      KEY(SOC:IDLOCALIDAD),DUP          !                     
FK_SOCIOS_TIPO_DOC       KEY(SOC:ID_TIPO_DOC),DUP          !                     
FK_SOCIOS_TIPO_IVA       KEY(SOC:TIPOIVA),DUP              !                     
FK_SOCIOS_USUARIO        KEY(SOC:IDUSUARIO),DUP            !                     
FK_SOCIOS_ZONA_VIVENDA   KEY(SOC:IDZONA),DUP               !                     
INTEG_173                KEY(SOC:IDUSUARIO),DUP            !                     
Record                   RECORD,PRE()
IDSOCIO                     LONG                           !                     
MATRICULA                   LONG                           !                     
IDZONA                      LONG                           !                     
IDCOBERTURA                 LONG                           !                     
IDLOCALIDAD                 LONG                           !                     
IDUSUARIO                   LONG                           !                     
NOMBRE                      CSTRING(51)                    !                     
N_DOCUMENTO                 LONG,NAME('"N_DOCUMENTO"')     !                     
DIRECCION                   CSTRING(101)                   !                     
FECHA_ALTA                  DATE,NAME('"FECHA_ALTA"')      !                     
EMAIL                       CSTRING(51)                    !                     
FECHA_NACIMIENTO            DATE,NAME('"FECHA_NACIMIENTO"') !                     
NRO_VIEJO                   LONG,NAME('"NRO_VIEJO"')       !                     
BENEF                       LONG                           !                     
FECHA_BAJA                  DATE,NAME('"FECHA_BAJA"')      !                     
OBSERVACION                 CSTRING(101)                   !                     
IDVENDEDOR                  LONG                           !                     
INGRESO                     LONG                           !                     
DESCUENTO                   LONG                           !                     
MES                         LONG                           !                     
ANO                         LONG                           !                     
PERIODO_ALTA                LONG,NAME('"PERIODO_ALTA"')    !                     
SEXO                        CSTRING(2)                     !                     
CANTIDAD                    LONG                           !                     
HORA_ALTA                   TIME,NAME('"HORA_ALTA"')       !                     
TELEFONO                    CSTRING(31)                    !                     
DIRECCION_LABORAL           CSTRING(51),NAME('"DIRECCION_LABORAL"') !                     
TELEFONO_LABORAL            CSTRING(31),NAME('"TELEFONO_LABORAL"') !                     
FIN_COBERTURA               DATE,NAME('"FIN_COBERTURA"')   !                     
BAJA                        CSTRING(3)                     !                     
ID_TIPO_DOC                 LONG,NAME('"ID_TIPO_DOC"')     !                     
IDCIRCULO                   LONG                           !                     
LIBRO                       LONG                           !                     
FOLIO                       LONG                           !                     
ACTA                        CSTRING(21)                    !                     
PROVISORIO                  CSTRING(2)                     !                     
IDINSTITUCION               LONG                           !                     
FECHA_EGRESO                DATE,NAME('"FECHA_EGRESO"')    !                     
BAJA_TEMPORARIA             CSTRING(3),NAME('"BAJA_TEMPORARIA"') !                     
OTRAS_MATRICULAS            CSTRING(51),NAME('"OTRAS_MATRICULAS"') !                     
OTRAS_CERTIFICACIONES       CSTRING(51),NAME('"OTRAS_CERTIFICACIONES"') !                     
FECHA_TITULO                DATE,NAME('"FECHA_TITULO"')    !                     
LUGAR_NACIMIENTO            CSTRING(51),NAME('"LUGAR_NACIMIENTO"') !                     
CELULAR                     CSTRING(51)                    !                     
IDPROVEEDOR                 LONG                           !                     
TIPOIVA                     LONG                           !                     
CUIT                        CSTRING(12)                    !                     
APELLIDO                    CSTRING(51)                    !                     
NOMBRES                     CSTRING(51)                    !                     
                         END
                     END                       

!endregion

Access:SOCIOS        &FileManager,THREAD                   ! FileManager for SOCIOS
Relate:SOCIOS        &RelationManager,THREAD               ! RelationManager for SOCIOS

FuzzyMatcher         FuzzyClass                            ! Global fuzzy matcher
GlobalErrorStatus    ErrorStatusClass,THREAD
GlobalErrors         ErrorClass                            ! Global error manager
INIMgr               INIClass                              ! Global non-volatile storage manager
GlobalRequest        BYTE(0),THREAD                        ! Set when a browse calls a form, to let it know action to perform
GlobalResponse       BYTE(0),THREAD                        ! Set to the response from the form
VCRRequest           LONG(0),THREAD                        ! Set to the request from the VCR buttons

Dictionary           CLASS,THREAD
Construct              PROCEDURE
Destruct               PROCEDURE
                     END


  CODE
  GlobalErrors.Init(GlobalErrorStatus)
  FuzzyMatcher.Init                                        ! Initilaize the browse 'fuzzy matcher'
  FuzzyMatcher.SetOption(MatchOption:NoCase, 1)            ! Configure case matching
  FuzzyMatcher.SetOption(MatchOption:WordOnly, 0)          ! Configure 'word only' matching
  INIMgr.Init('.\TRANS_NOMBRE.INI', NVD_INI)               ! Configure INIManager to use INI file
  DctInit
  Main
  INIMgr.Update
  INIMgr.Kill                                              ! Destroy INI manager
  FuzzyMatcher.Kill                                        ! Destroy fuzzy matcher


Dictionary.Construct PROCEDURE

  CODE
  IF THREAD()<>1
     DctInit()
  END


Dictionary.Destruct PROCEDURE

  CODE
  DctKill()

