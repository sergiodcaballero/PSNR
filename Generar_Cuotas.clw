   PROGRAM



   INCLUDE('ABERROR.INC'),ONCE
   INCLUDE('ABFILE.INC'),ONCE
   INCLUDE('ABUTIL.INC'),ONCE
   INCLUDE('ERRORS.CLW'),ONCE
   INCLUDE('KEYCODES.CLW'),ONCE
   INCLUDE('ABFUZZY.INC'),ONCE

   MAP
     MODULE('GENERAR_CUOTAS_BC.CLW')
DctInit     PROCEDURE                                      ! Initializes the dictionary definition module
DctKill     PROCEDURE                                      ! Kills the dictionary definition module
     END
!--- Application Global and Exported Procedure Definitions --------------------------------------------
     MODULE('GENERAR_CUOTAS001.CLW')
Main                   PROCEDURE   !Wizard Application for F:\Sistemas\Sis10\PsRN\Psrn.dct
     END
   END

GLO:MES              LONG
FECHA_DESDE          DATE
FECHA_HASTA          DATE
GLO:ANO              LONG
GLO:PERIODO          CSTRING(12)
GLO:IDUSUARIO        LONG
GLO:CC               REAL,NAME('CC=N(9.0)')
GLO:IDSOCIO          LONG
GLO:ESTADO           CSTRING(22)
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

DEUDA                FILE,DRIVER('dBase4'),NAME('DEUDA.DBF'),PRE(DEU),BINDABLE,THREAD ! DEUDA INICIAL  --- BORRAR
Record                   RECORD,PRE()
MAT                         REAL,NAME('MAT=N(7.0)')        !                     
NOMBRE                      STRING(37)                     !                     
CC                          REAL,NAME('CC=N(9.0)')         !                     
                         END
                     END                       

TIPO_COBERTURA       FILE,DRIVER('ODBC'),OWNER('psrn,sysdba'),NAME('TIPO_COBERTURA'),PRE(TIPC),BINDABLE,THREAD !                     
FK_TIPO_COBERTURA_1      KEY(TIPC:IDCOBERTURA),DUP         !                     
PK_TIPO_COBERTURA        KEY(TIPC:IDTIPOCUBERTURA),PRIMARY !                     
Record                   RECORD,PRE()
IDTIPOCUBERTURA             LONG,NAME('IDTIPOCUBERTURA | READONLY') !                     
IDCOBERTURA                 LONG                           !                     
ANO_MIN                     LONG,NAME('"ANO_MIN"')         !                     
ANO_MAX                     LONG,NAME('"ANO_MAX"')         !                     
DIFERENCIA_MONTO            PDECIMAL(5,2),NAME('"DIFERENCIA_MONTO"') !                     
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

CONTROL_FACTURA      FILE,DRIVER('ODBC'),OWNER('psrn,sysdba'),NAME('CONTROL_FACTURA'),PRE(CON3),BINDABLE,THREAD !                     
PK_CONTROL_FACTURA       KEY(CON3:IDSOCIO),PRIMARY         !                     
FK_CONTROL_FACTURA       KEY(CON3:IDSOCIO),DUP             !                     
Record                   RECORD,PRE()
IDSOCIO                     LONG                           !                     
MES                         CSTRING(3)                     !                     
ANO                         CSTRING(5)                     !                     
PEDIODO                     LONG                           !                     
                         END
                     END                       

CONVENIO             FILE,DRIVER('ODBC'),OWNER('psrn,sysdba'),NAME('CONVENIO'),PRE(CON4),BINDABLE,THREAD !                     
PK_CONVENIO              KEY(CON4:IDSOLICITUD),PRIMARY     !                     
FK_CONVENIO_SOCIOS       KEY(CON4:IDSOCIO),DUP             !                     
FK_CONVENIO_TIPO         KEY(CON4:IDTIPO_CONVENIO),DUP     !                     
IDX_CONVENCIO_PERIODO    KEY(CON4:IDSOCIO,CON4:PERIODO),DUP !                     
IDX_CONVENIO_CONTROL     KEY(CON4:IDSOCIO,CON4:IDTIPO_CONVENIO,CON4:CANCELADO,CON4:FECHA_CANCELADO) !                     
Record                   RECORD,PRE()
IDSOLICITUD                 LONG                           !                     
IDSOCIO                     LONG                           !                     
IDTIPO_CONVENIO             LONG,NAME('"IDTIPO_CONVENIO"') !                     
MONTO_TOTAL                 PDECIMAL(7,2),NAME('"MONTO_TOTAL"') !                     
CANTIDAD_CUOTAS             LONG,NAME('"CANTIDAD_CUOTAS"') !                     
MONTO_CUOTA                 PDECIMAL(7,2),NAME('"MONTO_CUOTA"') !                     
MONTO_BONIFICADO            PDECIMAL(7,2),NAME('"MONTO_BONIFICADO"') !                     
INTERES                     PDECIMAL(7,2)                  !                     
GASTOS_ADMINISTRATIVOS      PDECIMAL(7,2),NAME('"GASTOS_ADMINISTRATIVOS"') !                     
FECHA                       DATE                           !                     
HORA                        TIME                           !                     
MES                         CSTRING(3)                     !                     
ANO                         CSTRING(5)                     !                     
PERIODO                     LONG                           !                     
APROBADO                    CSTRING(2)                     !                     
EXEPCION                    CSTRING(3)                     !                     
CANCELADO                   CSTRING(3)                     !                     
PAGADO                      CSTRING(3)                     !                     
LIBRO                       LONG                           !                     
FOLIO                       LONG                           !                     
ACTA                        CSTRING(21)                    !                     
OBSERVACION                 CSTRING(101)                   !                     
FECHA_CANCELADO             DATE                           !                     
                         END
                     END                       

CONVENIO_DETALLE     FILE,DRIVER('ODBC'),OWNER('psrn,sysdba'),NAME('CONVENIO_DETALLE'),PRE(CON5),BINDABLE,THREAD !                     
PK_CONVENIO_DETALLE      KEY(CON5:IDSOLICITUD,CON5:MES,CON5:ANO),PRIMARY !                     
FK_CONVENIO_DETALLE      KEY(CON5:IDSOLICITUD),DUP         !                     
IDX_CONVENIO_DETALLE_PERIODO KEY(CON5:PERIODO),DUP         !                     
IDX_CONVENIO_DETALLE_SOL_PER KEY(CON5:IDSOLICITUD,CON5:PERIODO),DUP !                     
IDX_CONVENIO_DETALLE_SOCIO KEY(CON5:IDSOCIO,CON5:PERIODO),DUP !                     
IDX_CONVENIO_DETALLE_SOL_NCUOTA KEY(CON5:IDSOLICITUD,CON5:NRO_CUOTA),DUP !                     
Record                   RECORD,PRE()
IDSOLICITUD                 LONG                           !                     
MES                         CSTRING(3)                     !                     
ANO                         CSTRING(5)                     !                     
PERIODO                     LONG                           !                     
IDSOCIO                     LONG                           !                     
INTERES                     PDECIMAL(7,2)                  !                     
NRO_CUOTA                   LONG,NAME('"NRO_CUOTA"')       !                     
MONTO_CUOTA                 PDECIMAL(7,2),NAME('"MONTO_CUOTA"') !                     
MONTO_TOTAL                 PDECIMAL(7,2),NAME('"MONTO_TOTAL"') !                     
DEUDA_INICIAL               PDECIMAL(7,2),NAME('"DEUDA_INICIAL"') !                     
CAPITAL_ACUMULADO           PDECIMAL(7,2),NAME('"CAPITAL_ACUMULADO"') !                     
INTERES_ACUMULADO           PDECIMAL(7,2),NAME('"INTERES_ACUMULADO"') !                     
SALDO_ADEUDADO              PDECIMAL(7,2),NAME('"SALDO_ADEUDADO"') !                     
BONIFICACION                PDECIMAL(7,2)                  !                     
CUOTA_BONIFICADA            PDECIMAL(7,2),NAME('"CUOTA_BONIFICADA"') !                     
CANCELADO                   CSTRING(3)                     !                     
OBSERVACION                 CSTRING(51)                    !                     
FECHA                       DATE                           !                     
HORA                        TIME                           !                     
                         END
                     END                       

DETALLE_FACTURA      FILE,DRIVER('ODBC'),OWNER('psrn,sysdba'),NAME('DETALLE_FACTURA'),PRE(DET),BINDABLE,THREAD !                     
PK_DETALLE_FACTURA       KEY(DET:IDFACTURA,DET:CONCEPTO,DET:MES,DET:ANO),PRIMARY !                     
FK_DETALLE_FACTURA       KEY(DET:IDFACTURA),DUP            !                     
Record                   RECORD,PRE()
IDFACTURA                   LONG                           !                     
CONCEPTO                    CSTRING(51)                    !                     
MES                         LONG                           !                     
ANO                         LONG                           !                     
PERIODO                     LONG                           !                     
MONTO                       PDECIMAL(7,2)                  !                     
                         END
                     END                       

FACTURA              FILE,DRIVER('ODBC'),OWNER('psrn,sysdba'),NAME('FACTURA'),PRE(FAC),BINDABLE,THREAD !                     
PK_FACTURA               KEY(FAC:IDFACTURA),PRIMARY        !                     
FK_FACTURA_SOCIO         KEY(FAC:IDSOCIO),DUP              !                     
FK_FACTURA_USUARIO       KEY(FAC:IDUSUARIO),DUP            !                     
IDX_FACTURA_ANO          KEY(FAC:ANO),DUP                  !                     
IDX_FACTURA_ESTADO       KEY(FAC:ESTADO),DUP               !                     
IDX_FACTURA_FECHA        KEY(FAC:FECHA),DUP                !                     
IDX_FACTURA_MES          KEY(FAC:MES),DUP                  !                     
IDX_FACTURA_PERIODO      KEY(FAC:PERIODO),DUP              !                     
IDX_FACTURA_TOTAL        KEY(FAC:TOTAL),DUP                !                     
Record                   RECORD,PRE()
IDFACTURA                   LONG,NAME('IDFACTURA | READONLY') !                     
IDSOCIO                     LONG                           !                     
IDUSUARIO                   LONG                           !                     
MONTOCOBERTURA              PDECIMAL(7,2)                  !                     
INTERES                     PDECIMAL(7,2)                  !                     
TOTAL                       PDECIMAL(7,2)                  !                     
MES                         LONG                           !                     
ANO                         LONG                           !                     
PERIODO                     CSTRING(12)                    !                     
FECHA                       DATE                           !                     
HORA                        TIME                           !                     
ESTADO                      CSTRING(22)                    !                     
DESCUENTOCOBERTURA          PDECIMAL(7,2)                  !                     
DESCUENTOESPECIAL           PDECIMAL(7,2)                  !                     
IDPAGO                      LONG                           !                     
IDPAGO_LIQ                  LONG                           !                     
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

PERIODO_FACTURA      FILE,DRIVER('ODBC'),OWNER('psrn,sysdba'),NAME('PERIODO_FACTURA'),PRE(PER),BINDABLE,THREAD !                     
PK_PERIODO_FACTURA       KEY(PER:ANO,PER:MES),PRIMARY      !                     
FK_PERIODO_FACTURA_USUARIO KEY(PER:IDUSUARIO),DUP          !                     
IDX_PERIODO_FACTURA_PERIODO KEY(PER:PERIODO),DUP           !                     
Record                   RECORD,PRE()
ANO                         CSTRING(5)                     !                     
MES                         CSTRING(3)                     !                     
PERIODO                     LONG                           !                     
FECHA                       DATE                           !                     
HORA                        TIME                           !                     
IDUSUARIO                   LONG                           !                     
                         END
                     END                       

SERVICIOS            FILE,DRIVER('ODBC'),OWNER('psrn,sysdba'),NAME('SERVICIOS'),PRE(SER),BINDABLE,THREAD !                     
PK_SERVICIOS             KEY(SER:IDSERVICIOS),PRIMARY      !                     
IDX_SERVICIOS_DESCRIPCION KEY(SER:DESCRIPCION)             !                     
Record                   RECORD,PRE()
IDSERVICIOS                 LONG,NAME('IDSERVICIOS | READONLY') !                     
DESCRIPCION                 CSTRING(51)                    !                     
MONTO                       PDECIMAL(7,2)                  !                     
DESCUENTO                   PDECIMAL(5,2)                  !                     
INTERES                     PDECIMAL(5,2)                  !                     
                         END
                     END                       

SERVICIOXSOCIO       FILE,DRIVER('ODBC'),OWNER('psrn,sysdba'),NAME('SERVICIOXSOCIO'),PRE(SER2),BINDABLE,THREAD !                     
PK_SOCIOS_SERVICIOS      KEY(SER2:IDSOCIO,SER2:IDSERVICIOS),PRIMARY !                     
FK_SERVICIOXSOCIO_SERVICIOS KEY(SER2:IDSERVICIOS),DUP      !                     
FK_SERVICIOXSOCIO_SOCIOS KEY(SER2:IDSOCIO),DUP             !                     
Record                   RECORD,PRE()
IDSOCIO                     LONG                           !                     
IDSERVICIOS                 LONG                           !                     
FECHA                       DATE                           !                     
HORA                        DATE                           !                     
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
CBU                         CSTRING(23)                    !                     
ANSSAL                      LONG                           !                     
FECHA_ALTA_MIN              DATE                           !                     
APELLIDO                    CSTRING(51)                    !                     
NOMBRES                     CSTRING(51)                    !                     
CUMPLE                      LONG                           !                     
                         END
                     END                       

TIPO_CONVENIO        FILE,DRIVER('ODBC'),OWNER('psrn,sysdba'),NAME('TIPO_CONVENIO'),PRE(TIP),BINDABLE,THREAD !                     
PK_T_CONVENIO            KEY(TIP:IDTIPO_CONVENIO),PRIMARY  !                     
IDX_TIPO_CONVENIO_DESCRIPCION KEY(TIP:DESCRIPCION)         !                     
Record                   RECORD,PRE()
IDTIPO_CONVENIO             LONG,NAME('IDTIPO_CONVENIO | READONLY') !                     
DESCRIPCION                 CSTRING(51)                    !                     
INTERES                     PDECIMAL(5,2)                  !                     
GASTO_ADMINISTRATIVO        PDECIMAL(5,2)                  !                     
CANCELA_CUOTA               CSTRING(3)                     !                     
CALCULA_DEUDA               CSTRING(3)                     !                     
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

!endregion

Access:CIRCULO       &FileManager,THREAD                   ! FileManager for CIRCULO
Relate:CIRCULO       &RelationManager,THREAD               ! RelationManager for CIRCULO
Access:DEUDA         &FileManager,THREAD                   ! FileManager for DEUDA
Relate:DEUDA         &RelationManager,THREAD               ! RelationManager for DEUDA
Access:TIPO_COBERTURA &FileManager,THREAD                  ! FileManager for TIPO_COBERTURA
Relate:TIPO_COBERTURA &RelationManager,THREAD              ! RelationManager for TIPO_COBERTURA
Access:COBERTURA     &FileManager,THREAD                   ! FileManager for COBERTURA
Relate:COBERTURA     &RelationManager,THREAD               ! RelationManager for COBERTURA
Access:CONTROL_FACTURA &FileManager,THREAD                 ! FileManager for CONTROL_FACTURA
Relate:CONTROL_FACTURA &RelationManager,THREAD             ! RelationManager for CONTROL_FACTURA
Access:CONVENIO      &FileManager,THREAD                   ! FileManager for CONVENIO
Relate:CONVENIO      &RelationManager,THREAD               ! RelationManager for CONVENIO
Access:CONVENIO_DETALLE &FileManager,THREAD                ! FileManager for CONVENIO_DETALLE
Relate:CONVENIO_DETALLE &RelationManager,THREAD            ! RelationManager for CONVENIO_DETALLE
Access:DETALLE_FACTURA &FileManager,THREAD                 ! FileManager for DETALLE_FACTURA
Relate:DETALLE_FACTURA &RelationManager,THREAD             ! RelationManager for DETALLE_FACTURA
Access:FACTURA       &FileManager,THREAD                   ! FileManager for FACTURA
Relate:FACTURA       &RelationManager,THREAD               ! RelationManager for FACTURA
Access:INSTITUCION   &FileManager,THREAD                   ! FileManager for INSTITUCION
Relate:INSTITUCION   &RelationManager,THREAD               ! RelationManager for INSTITUCION
Access:LOCALIDAD     &FileManager,THREAD                   ! FileManager for LOCALIDAD
Relate:LOCALIDAD     &RelationManager,THREAD               ! RelationManager for LOCALIDAD
Access:PAIS          &FileManager,THREAD                   ! FileManager for PAIS
Relate:PAIS          &RelationManager,THREAD               ! RelationManager for PAIS
Access:PERIODO_FACTURA &FileManager,THREAD                 ! FileManager for PERIODO_FACTURA
Relate:PERIODO_FACTURA &RelationManager,THREAD             ! RelationManager for PERIODO_FACTURA
Access:SERVICIOS     &FileManager,THREAD                   ! FileManager for SERVICIOS
Relate:SERVICIOS     &RelationManager,THREAD               ! RelationManager for SERVICIOS
Access:SERVICIOXSOCIO &FileManager,THREAD                  ! FileManager for SERVICIOXSOCIO
Relate:SERVICIOXSOCIO &RelationManager,THREAD              ! RelationManager for SERVICIOXSOCIO
Access:SOCIOS        &FileManager,THREAD                   ! FileManager for SOCIOS
Relate:SOCIOS        &RelationManager,THREAD               ! RelationManager for SOCIOS
Access:TIPO_CONVENIO &FileManager,THREAD                   ! FileManager for TIPO_CONVENIO
Relate:TIPO_CONVENIO &RelationManager,THREAD               ! RelationManager for TIPO_CONVENIO
Access:TIPO_DOC      &FileManager,THREAD                   ! FileManager for TIPO_DOC
Relate:TIPO_DOC      &RelationManager,THREAD               ! RelationManager for TIPO_DOC
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
Access:BANCO         &FileManager,THREAD                   ! FileManager for BANCO
Relate:BANCO         &RelationManager,THREAD               ! RelationManager for BANCO
Access:BANCO_COD_REG &FileManager,THREAD                   ! FileManager for BANCO_COD_REG
Relate:BANCO_COD_REG &RelationManager,THREAD               ! RelationManager for BANCO_COD_REG

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
  INIMgr.Init('.\Generar_Cuotas.INI', NVD_INI)             ! Configure INIManager to use INI file
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

