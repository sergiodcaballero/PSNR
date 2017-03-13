   PROGRAM



   INCLUDE('ABERROR.INC'),ONCE
   INCLUDE('ABFILE.INC'),ONCE
   INCLUDE('ABUTIL.INC'),ONCE
   INCLUDE('ERRORS.CLW'),ONCE
   INCLUDE('KEYCODES.CLW'),ONCE
   INCLUDE('ABFUZZY.INC'),ONCE

   MAP
     MODULE('SUMAR_CANT_CUOTAS_BC.CLW')
DctInit     PROCEDURE                                      ! Initializes the dictionary definition module
DctKill     PROCEDURE                                      ! Kills the dictionary definition module
     END
!--- Application Global and Exported Procedure Definitions --------------------------------------------
     MODULE('SUMAR_CANT_CUOTAS002.CLW')
Main                   PROCEDURE   !Wizard Application for C:\bajados\BORRAR\medicos\Medicos.dct
     END
   END

GLO:IDSOCIO          LONG,NAME('IDSOCIO | READONLY')
GLO:CANTIDAD         LONG
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

FONDOS               FILE,DRIVER('ODBC'),OWNER('psrn,sysdba'),NAME('FONDOS'),PRE(FON),BINDABLE,THREAD !                     
PK_FONDOS                KEY(FON:IDFONDO),PRIMARY          !                     
IDX_FONDOS_NOMBRE        KEY(FON:NOMBRE_FONDO),DUP         !                     
Record                   RECORD,PRE()
IDFONDO                     LONG,NAME('IDFONDO | READONLY') !                     
NOMBRE_FONDO                CSTRING(31),NAME('"NOMBRE_FONDO"') !                     
MONTO                       PDECIMAL(11,2)                 !                     
FECHA                       DATE                           !                     
HORA                        TIME                           !                     
                         END
                     END                       

PAGO_CONVENIO        FILE,DRIVER('ODBC'),OWNER('psrn,sysdba'),NAME('PAGO_CONVENIO'),PRE(PAGCON),BINDABLE,THREAD !                     
PK_PAGO_CONVENIO         KEY(PAGCON:IDPAGO),PRIMARY        !                     
FK_PAGO_CONVENIO_SOCIO   KEY(PAGCON:IDSOCIO),DUP           !                     
IDX_PAGO_CONVENIO_UNIQUE KEY(PAGCON:IDSOLICITUD,PAGCON:NRO_CUOTA) !                     
FK_PAGO_CONVENIO_CONVENIO KEY(PAGCON:IDSOLICITUD),DUP      !                     
FK_PAGO_CONVENIO_USUARIO KEY(PAGCON:IDUSUARIO),DUP         !                     
IDX_PAGO_CONVENIO_PERIODO KEY(PAGCON:PERIODO),DUP          !                     
IDX_PAGO_CONVENIO_FECHA  KEY(PAGCON:FECHA),DUP             !                     
FK_PAGO_CONVENIO_SUBCUENTA KEY(PAGCON:IDSUBCUENTA),DUP,NOCASE,OPT !                     
Record                   RECORD,PRE()
IDPAGO                      LONG,NAME('IDPAGO | READONLY') !                     
IDSOCIO                     LONG                           !                     
IDSOLICITUD                 LONG                           !                     
MONTO_CUOTA                 PDECIMAL(7,2),NAME('"MONTO_CUOTA"') !                     
NRO_CUOTA                   LONG,NAME('"NRO_CUOTA"')       !                     
MES                         CSTRING(3)                     !                     
ANO                         CSTRING(5)                     !                     
PERIODO                     LONG                           !                     
OBSERVACION                 CSTRING(51)                    !                     
FECHA                       DATE                           !                     
HORA                        TIME                           !                     
IDUSUARIO                   LONG                           !                     
IDSUCURSAL                  LONG                           !                     
IDRECIBO                    LONG                           !                     
INTERES                     PDECIMAL(7,2)                  !                     
IDSUBCUENTA                 LONG,NAME('IDSUBCUENTA | READONLY') !                     
                         END
                     END                       

RANKING              FILE,DRIVER('ODBC'),OWNER('psrn,sysdba'),NAME('RANKING'),PRE(RAN),BINDABLE,THREAD !                     
PK_RANKING               KEY(RAN:C1),PRIMARY               !                     
IDX_C2                   KEY(RAN:C2),DUP                   !                     
IDX_C3                   KEY(RAN:C3),DUP                   !                     
IDX_C4                   KEY(RAN:C4),DUP                   !                     
IDX_C5                   KEY(RAN:C5),DUP                   !                     
IDX_CANTIDAD             KEY(RAN:CANTIDAD),DUP             !                     
IDX_IMPORTE              KEY(RAN:IMPORTE),DUP              !                     
Record                   RECORD,PRE()
C1                          CSTRING(51)                    !                     
C2                          CSTRING(51)                    !                     
C3                          CSTRING(51)                    !                     
C4                          CSTRING(51)                    !                     
C5                          CSTRING(51)                    !                     
C6                          CSTRING(51)                    !                     
C7                          CSTRING(51)                    !                     
C8                          CSTRING(51)                    !                     
C9                          CSTRING(51)                    !                     
C10                         CSTRING(51)                    !                     
C11                         CSTRING(51)                    !                     
C12                         CSTRING(51)                    !                     
CANTIDAD                    LONG                           !                     
IMPORTE                     REAL                           !                     
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

PAGOS                FILE,DRIVER('ODBC'),OWNER('psrn,sysdba'),NAME('PAGOS'),PRE(PAG),BINDABLE,THREAD !                     
FK_PAGOS_FACTURA         KEY(PAG:IDFACTURA),DUP            !                     
PK_PAGOS                 KEY(PAG:IDPAGOS),PRIMARY          !                     
FK_PAGOS_SOCIOS          KEY(PAG:IDSOCIO),DUP              !                     
FK_PAGOS_USUARIO         KEY(PAG:IDUSUARIO),DUP            !                     
IDX_FECHA                KEY(PAG:FECHA),DUP                !                     
IDX_PERIODO              KEY(PAG:PERIODO),DUP              !                     
FK_PAGOS_SUBCUENTA       KEY(PAG:IDSUBCUENTA),DUP          !                     
Record                   RECORD,PRE()
IDPAGOS                     LONG,NAME('IDPAGOS | READONLY') !                     
IDSOCIO                     LONG                           !                     
SUCURSAL                    LONG                           !                     
IDFACTURA                   LONG                           !                     
MONTO                       PDECIMAL(7,2)                  !                     
FECHA                       DATE                           !                     
HORA                        TIME                           !                     
MES                         CSTRING(3)                     !                     
ANO                         CSTRING(5)                     !                     
PERIODO                     LONG                           !                     
IDUSUARIO                   LONG                           !                     
IDRECIBO                    LONG                           !                     
MONTO_FACTURA               PDECIMAL(7,2)                  !                     
INTERES_FACTURA             PDECIMAL(7,2)                  !                     
IDSUBCUENTA                 LONG,NAME('IDSUBCUENTA | READONLY') !                     
AFECTADA                    CSTRING(3)                     !                     
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
FECHA_ALTA_MIN              DATE                           !                     
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

CUENTAS              FILE,DRIVER('ODBC'),OWNER('psrn,sysdba'),NAME('CUENTAS'),PRE(CUE),BINDABLE,THREAD !                     
PK_CUENTAS               KEY(CUE:IDCUENTA),PRIMARY         !                     
IDX_TIPO                 KEY(CUE:TIPO),DUP                 !                     
Record                   RECORD,PRE()
IDCUENTA                    LONG,NAME('IDCUENTA | READONLY') !                     
DESCRIPCION                 CSTRING(51)                    !                     
TIPO                        CSTRING(51)                    !                     
                         END
                     END                       

INGRESOS             FILE,DRIVER('ODBC'),OWNER('psrn,sysdba'),NAME('INGRESOS'),PRE(ING),BINDABLE,THREAD !                     
PK_INGRESOS              KEY(ING:IDINGRESO),PRIMARY        !                     
FK_INGRESOS_SUBCUENTA    KEY(ING:IDSUBCUENTA),DUP          !                     
FK_INGRESOS_USUARIOS     KEY(ING:IDUSUARIO),DUP            !                     
IDX_INGRESOS_FECHA       KEY(ING:FECHA),DUP                !                     
IDX_INGRESOS_UNIQUE      KEY(ING:SUCURSAL,ING:IDRECIBO),DUP !                     
FK_INGRESOS_PROVEEDOR    KEY(ING:IDPROVEEDOR),DUP          !                     
Record                   RECORD,PRE()
IDINGRESO                   LONG                           !                     
IDUSUARIO                   LONG                           !                     
IDSUBCUENTA                 LONG                           !                     
OBSERVACION                 CSTRING(101)                   !                     
MONTO                       REAL                           !                     
FECHA                       DATE                           !                     
HORA                        TIME                           !                     
MES                         LONG                           !                     
ANO                         LONG                           !                     
PERIODO                     CSTRING(7)                     !                     
IDPROVEEDOR                 LONG                           !                     
SUCURSAL                    LONG                           !                     
IDRECIBO                    LONG                           !                     
                         END
                     END                       

LIBDIARIO            FILE,DRIVER('ODBC'),OWNER('psrn,sysdba'),NAME('LIBDIARIO'),PRE(LIB),BINDABLE,THREAD !                     
PK_LIBDIARIO             KEY(LIB:IDLIBDIARIO),PRIMARY      !                     
FK_LIBDIARIO_SUBCUENTA   KEY(LIB:IDSUBCUENTA),DUP          !                     
IDX_LIBDIARIO_FECHA      KEY(LIB:FECHA),DUP                !                     
IDX_LIBDIARIO_MES        KEY(LIB:MES),DUP                  !                     
IDX_LIBDIARIO_ANO        KEY(LIB:ANO),DUP                  !                     
IDX_LIBDIARIO_PERIODO    KEY(LIB:PERIODO),DUP              !                     
IDX_LIBDIARIO_TRANSACCION KEY(LIB:IDTRANSACCION),DUP,NOCASE,OPT !                     
IDX_LIBDIARIO_UNIQUE_TRANSAC KEY(LIB:TIPO,LIB:IDTRANSACCION) !                     
IDX_LIBDIARIO_RECIBO     KEY(LIB:SUCURSAL,LIB:RECIBO,LIB:TIPO),DUP !                     
Record                   RECORD,PRE()
IDLIBDIARIO                 LONG                           !                     
IDSUBCUENTA                 LONG                           !                     
DEBE                        REAL                           !                     
HABER                       REAL                           !                     
OBSERVACION                 CSTRING(51)                    !                     
FECHA                       DATE                           !                     
HORA                        TIME                           !                     
MES                         LONG                           !                     
ANO                         LONG                           !                     
PERIODO                     CSTRING(7)                     !                     
FONDO                       REAL                           !                     
SUCURSAL                    LONG                           !                     
RECIBO                      LONG                           !                     
IDPROVEEDOR                 LONG                           !                     
TIPO                        CSTRING(11)                    !                     
IDTRANSACCION               LONG                           !                     
                         END
                     END                       

SUBCUENTAS           FILE,DRIVER('ODBC'),OWNER('psrn,sysdba'),NAME('SUBCUENTAS'),PRE(SUB),BINDABLE,THREAD !                     
INTEG_113                KEY(SUB:IDSUBCUENTA),PRIMARY      !                     
FK_SUBCUENTAS            KEY(SUB:IDCUENTA),DUP             !                     
IDX_SUBCUENTAS_CONTABLE  KEY(SUB:CONTABLE),NOCASE,OPT      !                     
FK_SUBCUENTAS_FONDOS     KEY(SUB:IDFONDO),DUP              !                     
Record                   RECORD,PRE()
IDSUBCUENTA                 LONG,NAME('IDSUBCUENTA | READONLY') !                     
IDCUENTA                    LONG                           !                     
DESCRIPCION                 CSTRING(51)                    !                     
CAJA                        CSTRING(4)                     !                     
CONTABLE                    CSTRING(51)                    !                     
IDFONDO                     LONG                           !                     
INFORME                     CSTRING(3)                     !                     
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

PROVEEDORES          FILE,DRIVER('ODBC'),OWNER('psrn,sysdba'),NAME('PROVEEDORES'),PRE(PRO2),BINDABLE,THREAD !                     
PK_PROVEEDOR             KEY(PRO2:IDPROVEEDOR),PRIMARY     !                     
FK_PROVEEDORES_TIPOIVA   KEY(PRO2:IDTIPOIVA),DUP           !                     
FK_PROVEEDORES_TIPO_PROVEEDOR KEY(PRO2:IDTIPO_PROVEEDOR),DUP !                     
FK_PROVEEDORES_USUARIO   KEY(PRO2:IDUSUARIO),DUP           !                     
IDX_PROVEEDORES_CUIT     KEY(PRO2:CUIT),DUP                !                     
IDX_PROVEEDORES_DESCRIPCION KEY(PRO2:DESCRIPCION),DUP      !                     
Record                   RECORD,PRE()
IDPROVEEDOR                 LONG                           !                     
DESCRIPCION                 CSTRING(51)                    !                     
DIRECCION                   CSTRING(51)                    !                     
TELEFONO                    CSTRING(31)                    !                     
EMAIL                       CSTRING(101)                   !                     
CUIT                        CSTRING(12)                    !                     
FECHA                       DATE                           !                     
HORA                        TIME                           !                     
IDUSUARIO                   LONG                           !                     
IDTIPOIVA                   LONG                           !                     
FECHA_BAJA                  DATE,NAME('"FECHA_BAJA"')      !                     
OBSERVACION                 CSTRING(101)                   !                     
IDTIPO_PROVEEDOR            LONG,NAME('"IDTIPO_PROVEEDOR"') !                     
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

TIPO_PROVEEDOR       FILE,DRIVER('ODBC'),OWNER('psrn,sysdba'),NAME('TIPO_PROVEEDOR'),PRE(TIPP),BINDABLE,THREAD !                     
PK_TIPO_PROVEEDOR        KEY(TIPP:IDTIPO_PROVEEDOR),PRIMARY !                     
IDX_TIPO_PROVEEDOR_DESCRIPCION KEY(TIPP:DESCRIPCION)       !                     
Record                   RECORD,PRE()
IDTIPO_PROVEEDOR            LONG,NAME('IDTIPO_PROVEEDOR | READONLY') !                     
DESCRIPCION                 CSTRING(51)                    !                     
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
Access:FONDOS        &FileManager,THREAD                   ! FileManager for FONDOS
Relate:FONDOS        &RelationManager,THREAD               ! RelationManager for FONDOS
Access:PAGO_CONVENIO &FileManager,THREAD                   ! FileManager for PAGO_CONVENIO
Relate:PAGO_CONVENIO &RelationManager,THREAD               ! RelationManager for PAGO_CONVENIO
Access:RANKING       &FileManager,THREAD                   ! FileManager for RANKING
Relate:RANKING       &RelationManager,THREAD               ! RelationManager for RANKING
Access:COBERTURA     &FileManager,THREAD                   ! FileManager for COBERTURA
Relate:COBERTURA     &RelationManager,THREAD               ! RelationManager for COBERTURA
Access:FACTURA       &FileManager,THREAD                   ! FileManager for FACTURA
Relate:FACTURA       &RelationManager,THREAD               ! RelationManager for FACTURA
Access:INSTITUCION   &FileManager,THREAD                   ! FileManager for INSTITUCION
Relate:INSTITUCION   &RelationManager,THREAD               ! RelationManager for INSTITUCION
Access:LOCALIDAD     &FileManager,THREAD                   ! FileManager for LOCALIDAD
Relate:LOCALIDAD     &RelationManager,THREAD               ! RelationManager for LOCALIDAD
Access:PAGOS         &FileManager,THREAD                   ! FileManager for PAGOS
Relate:PAGOS         &RelationManager,THREAD               ! RelationManager for PAGOS
Access:PAIS          &FileManager,THREAD                   ! FileManager for PAIS
Relate:PAIS          &RelationManager,THREAD               ! RelationManager for PAIS
Access:SOCIOS        &FileManager,THREAD                   ! FileManager for SOCIOS
Relate:SOCIOS        &RelationManager,THREAD               ! RelationManager for SOCIOS
Access:TIPO_DOC      &FileManager,THREAD                   ! FileManager for TIPO_DOC
Relate:TIPO_DOC      &RelationManager,THREAD               ! RelationManager for TIPO_DOC
Access:TIPO_INSTITUCION &FileManager,THREAD                ! FileManager for TIPO_INSTITUCION
Relate:TIPO_INSTITUCION &RelationManager,THREAD            ! RelationManager for TIPO_INSTITUCION
Access:USUARIO       &FileManager,THREAD                   ! FileManager for USUARIO
Relate:USUARIO       &RelationManager,THREAD               ! RelationManager for USUARIO
Access:ZONA_VIVIENDA &FileManager,THREAD                   ! FileManager for ZONA_VIVIENDA
Relate:ZONA_VIVIENDA &RelationManager,THREAD               ! RelationManager for ZONA_VIVIENDA
Access:CUENTAS       &FileManager,THREAD                   ! FileManager for CUENTAS
Relate:CUENTAS       &RelationManager,THREAD               ! RelationManager for CUENTAS
Access:INGRESOS      &FileManager,THREAD                   ! FileManager for INGRESOS
Relate:INGRESOS      &RelationManager,THREAD               ! RelationManager for INGRESOS
Access:LIBDIARIO     &FileManager,THREAD                   ! FileManager for LIBDIARIO
Relate:LIBDIARIO     &RelationManager,THREAD               ! RelationManager for LIBDIARIO
Access:SUBCUENTAS    &FileManager,THREAD                   ! FileManager for SUBCUENTAS
Relate:SUBCUENTAS    &RelationManager,THREAD               ! RelationManager for SUBCUENTAS
Access:NIVEL_FORMACION &FileManager,THREAD                 ! FileManager for NIVEL_FORMACION
Relate:NIVEL_FORMACION &RelationManager,THREAD             ! RelationManager for NIVEL_FORMACION
Access:TIPO_TITULO   &FileManager,THREAD                   ! FileManager for TIPO_TITULO
Relate:TIPO_TITULO   &RelationManager,THREAD               ! RelationManager for TIPO_TITULO
Access:PROVEEDORES   &FileManager,THREAD                   ! FileManager for PROVEEDORES
Relate:PROVEEDORES   &RelationManager,THREAD               ! RelationManager for PROVEEDORES
Access:TIPO_IVA      &FileManager,THREAD                   ! FileManager for TIPO_IVA
Relate:TIPO_IVA      &RelationManager,THREAD               ! RelationManager for TIPO_IVA
Access:TIPO_PROVEEDOR &FileManager,THREAD                  ! FileManager for TIPO_PROVEEDOR
Relate:TIPO_PROVEEDOR &RelationManager,THREAD              ! RelationManager for TIPO_PROVEEDOR
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
  INIMgr.Init('.\Sumar_Cant_Cuotas.INI', NVD_INI)          ! Configure INIManager to use INI file
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

