   PROGRAM



   INCLUDE('ABERROR.INC'),ONCE
   INCLUDE('ABFILE.INC'),ONCE
   INCLUDE('ABUTIL.INC'),ONCE
   INCLUDE('ERRORS.CLW'),ONCE
   INCLUDE('KEYCODES.CLW'),ONCE
   INCLUDE('ABFUZZY.INC'),ONCE

   MAP
     MODULE('PADRON_BC.CLW')
DctInit     PROCEDURE                                      ! Initializes the dictionary definition module
DctKill     PROCEDURE                                      ! Kills the dictionary definition module
     END
!--- Application Global and Exported Procedure Definitions --------------------------------------------
     MODULE('PADRON001.CLW')
Main                   PROCEDURE   !Wizard Application for C:\Sistemas\Enfermeros\Enfermeros.dct
     END
   END

SilentRunning        BYTE(0)                               ! Set true when application is running in 'silent mode'

!region File Declaration
CIRCULO              FILE,DRIVER('ODBC'),OWNER('psrn,sysdba'),NAME('CIRCULO'),PRE(CIR),BINDABLE,THREAD !                     
PK_CIRCULO               KEY(CIR:IDCIRCULO),PRIMARY        !                     
IDX_CIRCULO              KEY(CIR:DESCRIPCION),DUP          !                     
Record                   RECORD,PRE()
IDCIRCULO                   LONG,NAME('IDCIRCULO | READONLY') !                     
DESCRIPCION                 CSTRING(51)                    !                     
NOMBRE_CORTO                CSTRING(21),NAME('"NOMBRE_CORTO"') !                     
                         END
                     END                       

COBERTURA            FILE,DRIVER('ODBC'),OWNER('psrn,sysdba'),NAME('COBERTURA'),PRE(COB),BINDABLE,THREAD !                     
PK_COBERTURA             KEY(COB:IDCOBERTURA),PRIMARY      !                     
IDX_COBERTURA            KEY(COB:DESCRIPCION),DUP          !                     
IDX_MONTO                KEY(COB:MONTO),DUP                !                     
Record                   RECORD,PRE()
IDCOBERTURA                 LONG,NAME('IDCOBERTURA | READONLY') !                     
DESCRIPCION                 CSTRING(21)                    !                     
MONTO                       LONG                           !                     
DESCUENTO                   LONG                           !                     
FORMA_PAGO                  CSTRING(20)                    !                     
INTERES                     PDECIMAL(7,2)                  !                     
                         END
                     END                       

INSTITUCION          FILE,DRIVER('ODBC'),OWNER('psrn,sysdba'),NAME('INSTITUCION'),PRE(INS2),BINDABLE,THREAD !                     
PK_INSTITUCION           KEY(INS2:IDINSTITUCION),PRIMARY   !                     
IDX_INSTITUCION_NOMBRE   KEY(INS2:NOMBRE),DUP              !                     
FK_INSTITUCION_LOCALIDAD KEY(INS2:IDLOCALIDAD),DUP         !                     
FK_INSTITUCION_TIPO      KEY(INS2:IDTIPO_INSTITUCION),DUP  !                     
IDX_INSTITUCION_NOMBRECORTO KEY(INS2:NOMBRE_CORTO),DUP,NOCASE,OPT !                     
Record                   RECORD,PRE()
IDINSTITUCION               LONG,NAME('IDINSTITUCION | READONLY') !                     
IDTIPO_INSTITUCION          LONG,NAME('"IDTIPO_INSTITUCION"') !                     
IDLOCALIDAD                 LONG                           !                     
NOMBRE                      CSTRING(51)                    !                     
DIRECCION                   CSTRING(51)                    !                     
TELEFONO                    CSTRING(21)                    !                     
E_MAIL                      CSTRING(51),NAME('"E_MAIL"')   !                     
NOMBRE_CORTO                CSTRING(31)                    !                     
TIPO_ESTADO                 CSTRING(21)                    !                     
                         END
                     END                       

LOCALIDAD            FILE,DRIVER('ODBC'),OWNER('psrn,sysdba'),NAME('LOCALIDAD'),PRE(LOC),BINDABLE,THREAD !                     
PK_LOCALIDAD             KEY(LOC:IDLOCALIDAD),PRIMARY      !                     
FK_LOCALIDAD_PAIS        KEY(LOC:IDPAIS),DUP               !                     
KEY_CP                   KEY(LOC:CP),DUP,NAME('CP')        !                     
NOMBRE                   KEY(LOC:DESCRIPCION),DUP          !                     
Record                   RECORD,PRE()
IDLOCALIDAD                 LONG,NAME('IDLOCALIDAD | READONLY') !                     
DESCRIPCION                 CSTRING(51)                    !                     
CP                          LONG                           !                     
CPNUEVO                     CSTRING(21)                    !                     
IDPAIS                      LONG                           !                     
COD_TELEFONICO              CSTRING(11)                    !                     
                         END
                     END                       

PAIS                 FILE,DRIVER('ODBC'),OWNER('psrn,sysdba'),NAME('PAIS'),PRE(PAI),BINDABLE,THREAD !                     
PK_PAIS                  KEY(PAI:IDPAIS),PRIMARY           !                     
IDX_PAIS_DESCRIPCION     KEY(PAI:DESCRIPCION)              !                     
Record                   RECORD,PRE()
IDPAIS                      LONG,NAME('IDPAIS | READONLY') !                     
DESCRIPCION                 CSTRING(21)                    !                     
                         END
                     END                       

SOCIOS               FILE,DRIVER('ODBC'),OWNER('psrn,sysdba'),NAME('SOCIOS'),PRE(SOC),BINDABLE,THREAD !                     
PK_SOCIOS                KEY(SOC:IDSOCIO),PRIMARY          !                     
IDX_SOCIOS_DOCUMENTO     KEY(SOC:N_DOCUMENTO)              !                     
IDX_SOCIOS_MATRICULA     KEY(SOC:MATRICULA)                !                     
FK_SOCIOS_CIRCULO        KEY(SOC:IDCIRCULO),DUP            !                     
FK_SOCIOS_COBERTURA      KEY(SOC:IDCOBERTURA),DUP          !                     
FK_SOCIOS_INSTITUCION    KEY(SOC:IDINSTITUCION),DUP        !                     
FK_SOCIOS_LOCALIDAD      KEY(SOC:IDLOCALIDAD),DUP          !                     
FK_SOCIOS_TIPO_DOC       KEY(SOC:ID_TIPO_DOC),DUP          !                     
FK_SOCIOS_USUARIO        KEY(SOC:IDUSUARIO),DUP            !                     
FK_SOCIOS_ZONA_VIVENDA   KEY(SOC:IDZONA),DUP               !                     
IDX_SOCIOS_ACTA          KEY(SOC:ACTA),DUP                 !                     
IDX_SOCIOS_BAJA          KEY(SOC:BAJA),DUP                 !                     
IDX_SOCIOS_LIBRO         KEY(SOC:LIBRO),DUP                !                     
IDX_SOCIOS_NOMBRE        KEY(SOC:NOMBRE),DUP               !                     
IDX_SOCIOS_N_VIEJO       KEY(SOC:NRO_VIEJO),DUP            !                     
IDX_SOCIOS_PROVISORIO    KEY(SOC:PROVISORIO),DUP           !                     
IDX_SOCIO_INGRESO        KEY(SOC:INGRESO),DUP              !                     
FK_SOCIOS_TIPO_TITULO    KEY(SOC:IDTIPOTITULO),DUP         !                     
IDX_SOCIOS_MINISTERIO    KEY(SOC:IDMINISTERIO),DUP         !                     
SOCIOS_CENTRO_SALUD      KEY(SOC:IDCS),DUP                 !                     
IDX_SOCIOS_PROVEEDOR     KEY(SOC:IDPROVEEDOR),DUP          !                     
FK_SOCIOS_TIPO_IVA       KEY(SOC:TIPOIVA),DUP,NOCASE,OPT   !                     
FK_SOCIOS_BANCO          KEY(SOC:IDBANCO),DUP              !                     
Record                   RECORD,PRE()
IDSOCIO                     LONG,NAME('IDSOCIO | READONLY') !                     
MATRICULA                   LONG                           !                     
IDZONA                      LONG                           !                     
IDCOBERTURA                 LONG                           !                     
IDLOCALIDAD                 LONG                           !                     
IDUSUARIO                   LONG                           !                     
NOMBRE                      CSTRING(101)                   !                     
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
BAJA_TEMPORARIA             CSTRING(3)                     !                     
OTRAS_MATRICULAS            CSTRING(51)                    !                     
OTRAS_CERTIFICACIONES       CSTRING(51)                    !                     
FECHA_TITULO                DATE                           !                     
LUGAR_NACIMIENTO            CSTRING(51)                    !                     
CELULAR                     CSTRING(51)                    !                     
IDTIPOTITULO                LONG                           !                     
IDMINISTERIO                LONG                           !                     
IDCS                        CSTRING(21)                    !                     
LUGAR_TRABAJO               CSTRING(51)                    !                     
TIPO_TITULO                 CSTRING(51)                    !                     
IDPROVEEDOR                 LONG                           !                     
TIPOIVA                     LONG                           !                     
CUIT                        CSTRING(12)                    !                     
IDBANCO                     LONG,NAME('IDBANCO | readonly') !                     
CBU                         CSTRING(16)                    !                     
ANSSAL                      LONG                           !                     
FIN_COB                     DATE                           !                     
APELLIDO                    CSTRING(51)                    !                     
NOMBRES                     CSTRING(51)                    !                     
CUMPLE                      LONG                           !                     
                         END
                     END                       

TIPO_DOC             FILE,DRIVER('ODBC'),OWNER('psrn,sysdba'),NAME('TIPO_DOC'),PRE(TIP3),BINDABLE,THREAD !                     
PK_TIPO_DOC              KEY(TIP3:ID_TIPO_DOC),PRIMARY     !                     
IDX_TIPO_DOC_DESCIPCION  KEY(TIP3:DESCRIPCION),DUP         !                     
Record                   RECORD,PRE()
ID_TIPO_DOC                 LONG,NAME('ID_TIPO_DOC | READONLY') !                     
DESCRIPCION                 CSTRING(21)                    !                     
                         END
                     END                       

PADRON               FILE,DRIVER('TOPSPEED'),NAME('PADRON.TPS'),PRE(PAD1),BINDABLE,CREATE,THREAD !                     
PK_SOCIOS                KEY(PAD1:IDSOCIO),NOCASE,OPT,PRIMARY !                     
IDX_SOCIOS_DOCUMENTO     KEY(PAD1:N_DOCUMENTO),NOCASE,OPT  !                     
IDX_SOCIOS_MATRICULA     KEY(PAD1:MATRICULA),NOCASE,OPT    !                     
FK_SOCIOS_COLEGIO        KEY(PAD1:IDCOLEGIO),DUP,NOCASE,OPT !                     
FK_SOCIOS_INSTITUCION    KEY(PAD1:IDINSTITUCION),DUP,NOCASE,OPT !                     
FK_SOCIOS_LOCALIDAD      KEY(PAD1:IDLOCALIDAD),DUP,NOCASE,OPT !                     
FK_SOCIOS_TIPO_DOC       KEY(PAD1:ID_TIPO_DOC),DUP,NOCASE,OPT !                     
IDX_SOCIOS_ACTA          KEY(PAD1:ACTA),DUP,NOCASE,OPT     !                     
IDX_SOCIOS_BAJA          KEY(PAD1:BAJA),DUP,NOCASE,OPT     !                     
IDX_SOCIOS_LIBRO         KEY(PAD1:LIBRO),DUP,NOCASE,OPT    !                     
IDX_SOCIOS_NOMBRE        KEY(PAD1:NOMBRE),DUP,NOCASE,OPT   !                     
FK_MINISTERIO            KEY(PAD1:IDMINISTERIO),DUP,NOCASE,OPT !                     
FK_CENTRO_SALUD          KEY(PAD1:IDCENTRO_SALUD),DUP,NOCASE,OPT !                     
FK_TITULO                KEY(PAD1:ID_TITULO),DUP,NOCASE,OPT !                     
Record                   RECORD,PRE()
IDSOCIO                     LONG                           !                     
MATRICULA                   STRING(10)                     !                     
IDLOCALIDAD                 LONG                           !                     
NOMBRE                      STRING(30)                     !                     
N_DOCUMENTO                 LONG                           !                     
DIRECCION                   STRING(50)                     !                     
FECHA_ALTA                  DATE                           !                     
EMAIL                       STRING(100)                    !                     
FECHA_NACIMIENTO            DATE                           !                     
FECHA_BAJA                  DATE                           !                     
OBSERVACION                 STRING(100)                    !                     
INGRESO                     LONG                           !                     
MES                         LONG                           !                     
ANO                         LONG                           !                     
PERIODO_ALTA                STRING(6)                      !                     
SEXO                        STRING(1)                      !                     
CANTIDAD                    LONG                           !                     
HORA_ALTA                   TIME                           !                     
TELEFONO                    STRING(30)                     !                     
DIRECCION_LABORAL           STRING(50)                     !                     
TELEFONO_LABORAL            STRING(30)                     !                     
FIN_COBERTURA               DATE                           !                     
BAJA                        STRING(2)                      !                     
ID_TIPO_DOC                 LONG                           !                     
IDCOLEGIO                   LONG                           !                     
LIBRO                       LONG                           !                     
FOLIO                       LONG                           !                     
ACTA                        STRING(20)                     !                     
PROVISORIO                  STRING(2)                      !                     
IDINSTITUCION               LONG                           !                     
FECHA_EGRESO                DATE                           !                     
BAJA_TEMPORARIA             STRING(2)                      !                     
OTRAS_MATRICULAS            STRING(50)                     !                     
OTRAS_CERTIFICACIONES       STRING(50)                     !                     
FECHA_TITULO                DATE                           !                     
LUGAR_NACIMIENTO            STRING(50)                     !                     
CELULAR                     STRING(50)                     !                     
IDMINISTERIO                LONG                           !                     
DESCRIPCION_MINISTERIO      STRING(50)                     !                     
IDCENTRO_SALUD              STRING(20)                     !                     
DESCRIPCION_CENTRO_SALUD    STRING(50)                     !                     
ID_TITULO                   LONG                           !                     
USUARIO                     STRING(20)                     !                     
USUARIO_MOD                 STRING(20)                     !                     
FECHA_MOD                   LONG                           !                     
TIPO_TITULO                 STRING(20)                     !                     
                         END
                     END                       

TIPO_INSTITUCION     FILE,DRIVER('ODBC'),OWNER('psrn,sysdba'),NAME('TIPO_INSTITUCION'),PRE(TIP4),BINDABLE,THREAD !                     
PK_T_INSTITUCION         KEY(TIP4:IDTIPO_INSTITUCION),PRIMARY !                     
IDX_T_INST_DESCRIPCION   KEY(TIP4:DESCRIPCION)             !                     
Record                   RECORD,PRE()
IDTIPO_INSTITUCION          LONG,NAME('IDTIPO_INSTITUCION | READONLY') !                     
DESCRIPCION                 CSTRING(51)                    !                     
                         END
                     END                       

USUARIO              FILE,DRIVER('ODBC'),OWNER('psrn,sysdba'),NAME('USUARIO'),PRE(USU),BINDABLE,THREAD !                     
PK_USUARIO               KEY(USU:IDUSUARIO),PRIMARY        !                     
USUARIO_IDX1             KEY(USU:DESCRIPCION),DUP          !                     
Record                   RECORD,PRE()
IDUSUARIO                   LONG,NAME('IDUSUARIO | READONLY') !                     
DESCRIPCION                 CSTRING(21)                    !                     
CONTRASENA                  CSTRING(11)                    !                     
NIVEL                       LONG                           !                     
BAJA                        DATE                           !                     
                         END
                     END                       

ZONA_VIVIENDA        FILE,DRIVER('ODBC'),OWNER('psrn,sysdba'),NAME('ZONA_VIVIENDA'),PRE(ZON),BINDABLE,THREAD !                     
PK_ZONA_VIVIENDA         KEY(ZON:IDZONA),PRIMARY           !                     
IDX_ZONA_VIVIENDA        KEY(ZON:DESCRIPCION),DUP          !                     
Record                   RECORD,PRE()
IDZONA                      LONG,NAME('IDZONA | READONLY') !                     
DESCRIPCION                 CSTRING(21)                    !                     
                         END
                     END                       

NIVEL_FORMACION      FILE,DRIVER('ODBC'),OWNER('psrn,sysdba'),NAME('NIVEL_FORMACION'),PRE(NIV),BINDABLE,THREAD !                     
PK_NIVEL_FORMACION       KEY(NIV:IDNIVELFOMACION),PRIMARY  !                     
Record                   RECORD,PRE()
IDNIVELFOMACION             LONG,NAME('IDNIVELFOMACION | READONLY') !                     
DESCRIPCION                 STRING(50)                     !                     
GRADO                       CSTRING(3)                     !                     
                         END
                     END                       

TIPO_TITULO          FILE,DRIVER('ODBC'),OWNER('psrn,sysdba'),NAME('TIPO_TITULO'),PRE(TIP6),BINDABLE,THREAD !                     
PK_TIPO_TITULO           KEY(TIP6:IDTIPOTITULO),PRIMARY    !                     
FK_TIPO_TITULO_NIVEL_FORMACION KEY(TIP6:IDNIVELFORMACION),DUP !                     
Record                   RECORD,PRE()
IDTIPOTITULO                LONG,NAME('IDTIPOTITULO | READONLY') !                     
DESCRIPCION                 CSTRING(51)                    !                     
CORTO                       CSTRING(11)                    !                     
IDNIVELFORMACION            LONG                           !                     
                         END
                     END                       

TIPO_IVA             FILE,DRIVER('ODBC'),OWNER('psrn,sysdba'),NAME('TIPO_IVA'),PRE(TIP7),BINDABLE,THREAD !                     
PK_TIPO_IVA              KEY(TIP7:IDTIPOIVA),PRIMARY       !                     
IDX_TIPOIVA_DESCRIPCION  KEY(TIP7:DECRIPCION),DUP          !                     
Record                   RECORD,PRE()
IDTIPOIVA                   LONG,NAME('IDTIPOIVA | READONLY') !                     
DECRIPCION                  STRING(30)                     !                     
RETENCION                   DECIMAL(5,2)                   !                     
                         END
                     END                       

BANCO                FILE,DRIVER('ODBC'),OWNER('psrn,sysdba'),NAME('BANCO'),PRE(BAN2),BINDABLE,THREAD !                     
PK_BANCO                 KEY(BAN2:IDBANCO),PRIMARY         !                     
FK_BANCO_COD_RESGISTRO   KEY(BAN2:ID_REGISTRO),DUP         !                     
Record                   RECORD,PRE()
IDBANCO                     LONG,NAME('IDBANCO | READONLY') !                     
DESCRIPCION                 CSTRING(51)                    !                     
CODIGO_BANCO                LONG,NAME('"CODIGO_BANCO"')    !                     
ID_REGISTRO                 LONG,NAME('"ID_REGISTRO"')     !                     
CBU_BLOQUE_1                LONG,NAME('"CBU_BLOQUE_1"')    !                     
SUBEMPRESA                  PDECIMAL(8)                    !                     
                         END
                     END                       

BANCO_COD_REG        FILE,DRIVER('ODBC'),OWNER('psrn,sysdba'),NAME('BANCO_COD_REG'),PRE(BAN3),BINDABLE,THREAD !                     
PK_BANCO_COD_REG         KEY(BAN3:ID_REGISTRO),PRIMARY     !                     
Record                   RECORD,PRE()
ID_REGISTRO                 LONG,NAME('ID_REGISTRO | READONLY') !                     
DESCRIPCION                 CSTRING(51)                    !                     
COD_REGISTRO                LONG,NAME('"COD_REGISTRO"')    !                     
                         END
                     END                       

MATRICULADOS         FILE,DRIVER('dBase4'),NAME('D:\Bajados\BORRAR\PSNR\documentacion\MATRICULADOS.dbf'),PRE(MAT),BINDABLE,THREAD !                     
Record                   RECORD,PRE()
MATRICULA                   REAL                           !                     
NOMBRE                      STRING(34)                     !                     
IDLOCALIDA                  REAL                           !                     
                         END
                     END                       

!endregion

Access:CIRCULO       &FileManager,THREAD                   ! FileManager for CIRCULO
Relate:CIRCULO       &RelationManager,THREAD               ! RelationManager for CIRCULO
Access:COBERTURA     &FileManager,THREAD                   ! FileManager for COBERTURA
Relate:COBERTURA     &RelationManager,THREAD               ! RelationManager for COBERTURA
Access:INSTITUCION   &FileManager,THREAD                   ! FileManager for INSTITUCION
Relate:INSTITUCION   &RelationManager,THREAD               ! RelationManager for INSTITUCION
Access:LOCALIDAD     &FileManager,THREAD                   ! FileManager for LOCALIDAD
Relate:LOCALIDAD     &RelationManager,THREAD               ! RelationManager for LOCALIDAD
Access:PAIS          &FileManager,THREAD                   ! FileManager for PAIS
Relate:PAIS          &RelationManager,THREAD               ! RelationManager for PAIS
Access:SOCIOS        &FileManager,THREAD                   ! FileManager for SOCIOS
Relate:SOCIOS        &RelationManager,THREAD               ! RelationManager for SOCIOS
Access:TIPO_DOC      &FileManager,THREAD                   ! FileManager for TIPO_DOC
Relate:TIPO_DOC      &RelationManager,THREAD               ! RelationManager for TIPO_DOC
Access:PADRON        &FileManager,THREAD                   ! FileManager for PADRON
Relate:PADRON        &RelationManager,THREAD               ! RelationManager for PADRON
Access:TIPO_INSTITUCION &FileManager,THREAD                ! FileManager for TIPO_INSTITUCION
Relate:TIPO_INSTITUCION &RelationManager,THREAD            ! RelationManager for TIPO_INSTITUCION
Access:USUARIO       &FileManager,THREAD                   ! FileManager for USUARIO
Relate:USUARIO       &RelationManager,THREAD               ! RelationManager for USUARIO
Access:ZONA_VIVIENDA &FileManager,THREAD                   ! FileManager for ZONA_VIVIENDA
Relate:ZONA_VIVIENDA &RelationManager,THREAD               ! RelationManager for ZONA_VIVIENDA
Access:NIVEL_FORMACION &FileManager,THREAD                 ! FileManager for NIVEL_FORMACION
Relate:NIVEL_FORMACION &RelationManager,THREAD             ! RelationManager for NIVEL_FORMACION
Access:TIPO_TITULO   &FileManager,THREAD                   ! FileManager for TIPO_TITULO
Relate:TIPO_TITULO   &RelationManager,THREAD               ! RelationManager for TIPO_TITULO
Access:TIPO_IVA      &FileManager,THREAD                   ! FileManager for TIPO_IVA
Relate:TIPO_IVA      &RelationManager,THREAD               ! RelationManager for TIPO_IVA
Access:BANCO         &FileManager,THREAD                   ! FileManager for BANCO
Relate:BANCO         &RelationManager,THREAD               ! RelationManager for BANCO
Access:BANCO_COD_REG &FileManager,THREAD                   ! FileManager for BANCO_COD_REG
Relate:BANCO_COD_REG &RelationManager,THREAD               ! RelationManager for BANCO_COD_REG
Access:MATRICULADOS  &FileManager,THREAD                   ! FileManager for MATRICULADOS
Relate:MATRICULADOS  &RelationManager,THREAD               ! RelationManager for MATRICULADOS

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
  INIMgr.Init('.\Padron.INI', NVD_INI)                     ! Configure INIManager to use INI file
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

