   PROGRAM


NetTalk:TemplateVersion equate('8.71')
ActivateNetTalk   EQUATE(1)
  include('NetCrit.inc'),once
  include('NetMap.inc'),once
  include('NetAll.inc'),once
  include('NetTalk.inc'),once
  include('NetSimp.inc'),once
  include('NetFtp.inc'),once
  include('NetHttp.inc'),once
  include('NetWww.inc'),once
  include('NetWeb.inc'),once
  include('NetWSDL.inc'),once
  include('NetEmail.inc'),once
  include('NetFile.inc'),once
  include('NetWebSms.inc'),once
StringTheory:TemplateVersion equate('2.46')

   INCLUDE('ABERROR.INC'),ONCE
   INCLUDE('ABFILE.INC'),ONCE
   INCLUDE('ABUTIL.INC'),ONCE
   INCLUDE('ERRORS.CLW'),ONCE
   INCLUDE('KEYCODES.CLW'),ONCE
   INCLUDE('ABFUZZY.INC'),ONCE
MAPI_DIALOG                         EQUATE(00000008h)   ! Display a send note UI
  include('cwsynchc.inc'),once  ! added by NetTalk
  include('StringTheory.Inc'),ONCE

   MAP
     MODULE('GESTION_BC.CLW')
DctInit     PROCEDURE                                      ! Initializes the dictionary definition module
DctKill     PROCEDURE                                      ! Kills the dictionary definition module
     END
!--- Application Global and Exported Procedure Definitions --------------------------------------------
     MODULE('GESTION001.CLW')
Main                   PROCEDURE   !Gestion.dct
     END
       MODULE('ec_mail.Lib')
       SendMail(Byte,String,String,String,<String>,*queue),ULong,DLL(dll_mode)
       GLastError(),String
       EXPORTWORD(*QUEUE,*QUEUE,*STRING)
       END
       EvoP_P(*QUEUE,Long)
       MODULE('claevo.Dll')
       Exportar(*QUEUE,*QUEUE,*QUEUE,SHORT,STRING,*GROUP)
       ExportarVII(*QUEUE,*QUEUE,*QUEUE,SHORT,STRING,*GROUP,*QUEUE)
       END
       PKSNumTexto(REAL),STRING
       MODULE('claevo.Dll')
       EcRptExport(*QUEUE,*QUEUE,*QUEUE,SHORT,STRING,*GROUP)
       ExportarRptII(*QUEUE,*QUEUE,*QUEUE,SHORT,STRING,*GROUP,*QUEUE)
       PDP(*QUEUE,Long)
       END
     Module('Win32.lib')
     ShellExecute(Long,*CString,*CString,*CString,*CString,Short),UShort,PASCAL,RAW,NAME('ShellExecuteA')
     END
   END

GLO:IDUSUARIO        LONG,NAME('IDUSUARIO | READONLY')
GLO:NIVEL            LONG
GLO:IDSOCIO          LONG,NAME('IDSOCIO | READONLY')
GLO:MES              LONG
GLO:ANO              LONG
GLO:PERIODO          CSTRING(12)
GLO:MES_HASTA        LONG
GLO:ANO_HASTA        LONG
GLO:PERIODO_HASTA    CSTRING(12)
FECHA_DESDE          LONG
FECHA_HASTA          LONG
GLO:ESTADO           STRING(20)
GLO:TOTAL            PDECIMAL(7,2)
GLO:INTERES          PDECIMAL(7,2)
GLO:IDSOLICITUD      LONG,NAME('IDSOLICITUD | READONLY')
GLO:MONTO            REAL
GLO:PAGO             LONG,NAME('IDPAGOS | READONLY')
GLO:FECHA_LARGO      STRING(50)
REPORTE_LARGO        STRING(100)
GLO:CARGA_sTRING     STRING(100)
GLO:NRO_CUOTA        LONG,NAME('"NRO_CUOTA"')
GLO:CANCELA_CUOTA    CSTRING(3)
GLO:CALCULA_DEUDA    CSTRING(3)
GLO:IDLOTE           LONG
GLO:EMAIL            STRING(255)
TAGS                 QUEUE,PRE()
PUNTERO                REAL
PUNTERO2               REAL
PUNTERO3               REAL
PUNTERO4               REAL
                     END
CARNET               QUEUE,PRE()
NOMBRE                 CSTRING(51)
MATRICULA              CSTRING(11)
LIBRO                  LONG
FOLIO                  LONG
TITULO                 STRING(50)
FECHA_ALTA             DATE,NAME('"FECHA_ALTA"')
N_DOCUMENTO            LONG,NAME('"N_DOCUMENTO"')
DIRECCION              STRING(50)
LOCALI                 STRING(50)
CP                     LONG
PROVISORIO             STRING(20)
EMITIDO                STRING(20)
                     END
GLO:CUENTA           LONG,NAME('IDCUENTA | READONLY')
GLO:QFDESDE          STRING(20)
GLO:QFHASTA          STRING(20)
GLO:CANT_CUOTAS_MAX  LONG,NAME('"CANT_CUOTAS_MAX"')
GLO:ANO_COUTA        LONG
GLO:RAZON_SOCIAL     CSTRING(101),NAME('"RAZON_SOCIAL"')
GLO:DIRECCION        STRING(256)
GLO:CUIT             CSTRING(12)
GLO:FIRMA1           CSTRING(101)
GLO:FIRMA2           CSTRING(51)
GLO:FIRMA3           CSTRING(51)
GLO:LEY              CSTRING(41)
GLO:PER_JUR          CSTRING(21)
GLO:MAILEMP          STRING(100)
global:firsttime     BYTE
GLO:BANCO            LONG,NAME('IDBANCO | READONLY')
Glo:IDOS             LONG,NAME('IDOS | READONLY')
GLO:TIPO             CSTRING(2)
GLO:SECUENCIA        LONG
GLO:PRIMERA          STRING(2)
GLO:CODIGO_BANCO     LONG,NAME('"CODIGO_BANCO"')
GLO:SUBEMPRESA       PDECIMAL(8)
SMTP                 STRING(50)
USUARIO_SMTP         STRING(50)
PASSWORD_SMTP        STRING(50)
SMTP_SEGURO          BYTE
PUERTO               USHORT
GLO:DETALLE_RECIBO   STRING(255)
GLO:DUPLICADO        STRING(20)
GLO:RECIBO           LONG
GLO:SUCURSAL         LONG
GLO:GTO_ADM          STRING(100)
GLO:DIA_REPORT       STRING(20)
GLO:MES_REPORT       STRING(20)
GLO:ANO_REPORT       STRING(20)
GLO:IDCURSO          LONG,NAME('IDCURSO | READONLY')
GLO:IDINSCRIPCION    LONG,NAME('IDINSCRIPCION | READONLY')
GLO:ID_MODULO        LONG,NAME('ID_MODULO | READONLY')
GLO:IDRECIBO         LONG
GLO:IDSUBCUENTA_CURSO LONG
GLO:CANTIDAD_CUOTAS  LONG
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

CUMPLE               FILE,DRIVER('ODBC'),OWNER('psrn,sysdba'),NAME('CUMPLE'),PRE(CUM),BINDABLE,THREAD !                     
PK_CUMPLE                KEY(CUM:IDSOCIO),PRIMARY          !                     
por_dia                  KEY(CUM:FECHA_NAC),DUP,NOCASE,OPT !                     
Record                   RECORD,PRE()
IDSOCIO                     LONG                           !                     
NOMBRE                      CSTRING(51)                    !                     
EMAIL                       CSTRING(101)                   !                     
FECHA_NAC                   DATE,NAME('"FECHA_NAC"')       !                     
DIA                         LONG                           !                     
ANO                         LONG                           !                     
MENSAGE                     CSTRING(257)                   !                     
                         END
                     END                       

FACTURA_CONVENIO     FILE,DRIVER('ODBC'),OWNER('psrn,sysdba'),NAME('FACTURA_CONVENIO'),PRE(FACXCONV),BINDABLE,THREAD !                     
PK_FACTURA_CONVENIO      KEY(FACXCONV:IDFACTURA,FACXCONV:IDCONVENIO),PRIMARY !                     
FK_FACTURA_CONVENIO_FACTURA KEY(FACXCONV:IDFACTURA)        !                     
FACTURA_CONVENIO_CONVENIO KEY(FACXCONV:IDCONVENIO),DUP,NOCASE,OPT !                     
Record                   RECORD,PRE()
IDFACTURA                   LONG                           !                     
IDCONVENIO                  LONG                           !                     
                         END
                     END                       

INFORME              FILE,DRIVER('ODBC'),OWNER('psrn,sysdba'),NAME('INFORME'),PRE(INF),BINDABLE,THREAD !                     
INFORME_IDX_FECHA        KEY(INF:FECHA),DUP                !                     
FK_INFORME_USUARIO       KEY(INF:IDUSUARIO),DUP            !                     
PK_INFORME               KEY(INF:IDINFORME),PRIMARY        !                     
IDX_INFORME_RECIBO       KEY(INF:SUCURSAL,INF:IDRECIBO),DUP,NOCASE,OPT !                     
Record                   RECORD,PRE()
IDINFORME                   LONG,NAME('IDINFORME | READONLY') !                     
FECHA                       DATE                           !                     
HORA                        TIME                           !                     
INFORME                     CSTRING(501)                   !                     
IDUSUARIO                   LONG                           !                     
TERMINADO                   CSTRING(3)                     !                     
MONTO                       REAL                           !                     
SUCURSAL                    LONG                           !                     
IDRECIBO                    LONG                           !                     
                         END
                     END                       

CURSO_CUOTA          FILE,DRIVER('ODBC'),OWNER('psrn,sysdba'),NAME('CURSO_CUOTA'),PRE(CUR1),BINDABLE,THREAD !                     
CURSO_CUOTA_IDX_PAGADO   KEY(CUR1:PAGADO),DUP              !                     
CURSO_CUOTA_IDX_SUBCUENTA KEY(CUR1:IDSUBCUENTA),DUP        !                     
PK_CURSO_CUOTA           KEY(CUR1:IDINSCRIPCION,CUR1:IDCURSO,CUR1:IDMODULO,CUR1:IDCUOTA),PRIMARY !                     
FK_CURSO_CUOTA_DETALLE   KEY(CUR1:IDINSCRIPCION,CUR1:IDCURSO,CUR1:IDMODULO),DUP !                     
Record                   RECORD,PRE()
IDINSCRIPCION               LONG                           !                     
IDCURSO                     LONG                           !                     
IDMODULO                    LONG                           !                     
IDCUOTA                     LONG                           !                     
MONTO                       DECIMAL(9,2)                   !                     
PAGADO                      CSTRING(3)                     !                     
IDSUBCUENTA                 LONG                           !                     
DESCUENTO                   REAL                           !                     
SUCURSAL                    LONG                           !                     
IDRECIBO                    LONG                           !                     
IDUSUARIO                   LONG                           !                     
FECHA                       DATE                           !                     
HORA                        TIME                           !                     
AFECTADA                    CSTRING(3)                     !                     
                         END
                     END                       

EXP_CURSO_INSCRIPCION FILE,DRIVER('TOPSPEED'),NAME('CURSO_INSCRIPCION.TPS'),PRE(CURI1),BINDABLE,CREATE,THREAD !                     
PK_CURSO_INSCRIPCION     KEY(CURI1:IDINSCRIPCION),PRIMARY  !                     
FK_CURSO_INSCRIPCION_CURSO KEY(CURI1:IDCURSO),DUP          !                     
FK_CURSO_INSCRIPCION_PROVEEDOR KEY(CURI1:ID_PROVEEDOR),DUP !                     
FK_CURSO_INSCRIPCION_USUARIO KEY(CURI1:IDUSUARIO),DUP      !                     
IDX_CURSO_INSCRIPCION_FECHA KEY(CURI1:FECHA),DUP           !                     
IDX_CONTROL              KEY(CURI1:ID_PROVEEDOR,CURI1:IDCURSO),NOCASE,OPT !                     
Record                   RECORD,PRE()
IDINSCRIPCION               LONG                           !                     
ID_PROVEEDOR                LONG                           !                     
IDCURSO                     LONG                           !                     
FECHA                       DATE                           !                     
HORA                        TIME                           !                     
IDUSUARIO                   LONG                           !                     
MONTO_TOTAL                 REAL                           !                     
TERMINADO                   CSTRING(3)                     !                     
DESCUENTO                   REAL                           !                     
PAGADO_TOTAL                CSTRING(3)                     !                     
CUOTAS                      LONG                           !                     
MONTO_CUOTA                 REAL                           !                     
OBSERVACION                 CSTRING(101)                   !                     
                         END
                     END                       

LIQUIDACION_CODIGO   FILE,DRIVER('ODBC'),OWNER('psrn,sysdba'),NAME('LIQUIDACION_CODIGO'),PRE(LIQC),BINDABLE,THREAD !                     
PK_LIQUIDACION_CODIGO    KEY(LIQC:IDLIQUIDACION,LIQC:IDNOMENCLADOR,LIQC:IDOS),PRIMARY !                     
FK_LIQUIDACION_CODIGO_OS KEY(LIQC:IDOS,LIQC:IDNOMENCLADOR),DUP !                     
FK_LIQUIDACION_CODIGO_LIQ KEY(LIQC:IDLIQUIDACION),DUP      !                     
Record                   RECORD,PRE()
IDLIQUIDACION               LONG                           !                     
IDNOMENCLADOR               LONG                           !                     
IDOS                        LONG                           !                     
VALOR                       PDECIMAL(5,2)                  !                     
CANTIDAD                    LONG                           !                     
TOTAL                       PDECIMAL(7,2)                  !                     
                         END
                     END                       

PAGOS_LIQUIDACION    FILE,DRIVER('ODBC'),OWNER('psrn,sysdba'),NAME('PAGOS_LIQUIDACION'),PRE(PAGL),BINDABLE,THREAD !                     
FK_PAGOS_LIQUIDACION_SOCIOS KEY(PAGL:IDSOCIO),DUP          !                     
PK_PAGOS_LIQUIDACION     KEY(PAGL:IDPAGOS),PRIMARY         !                     
FK_PAGOS_LIQUIDACION_USUARIOS KEY(PAGL:IDUSUARIO),DUP,NOCASE,OPT !                     
IDX_PAGOS_LIQUIDACION_PAGO KEY(PAGL:IDLIQUIDACION),DUP,NOCASE,OPT !                     
Record                   RECORD,PRE()
IDPAGOS                     LONG,NAME('IDPAGOS | READONLY') !                     
IDSOCIO                     LONG                           !                     
SUCURSAL                    LONG                           !                     
IDLIQUIDACION               LONG                           !                     
MONTO                       REAL                           !                     
FECHA                       DATE                           !                     
HORA                        TIME                           !                     
MES                         CSTRING(3)                     !                     
ANO                         CSTRING(5)                     !                     
PERIODO                     LONG                           !                     
IDUSUARIO                   LONG                           !                     
IDRECIBO                    LONG                           !                     
MONTO_FACTURA               REAL,NAME('"MONTO_FACTURA"')   !                     
INTERES_FACTURA             PDECIMAL(5,2),NAME('"INTERES_FACTURA"') !                     
IDSUBCUENTA                 LONG                           !                     
AFECTADA                    CSTRING(3)                     !                     
DEBITO                      REAL                           !                     
CUOTA                       PDECIMAL(7,2)                  !                     
CANT_CUOTA                  LONG                           !                     
SEGURO                      PDECIMAL(7,2)                  !                     
CANT_CUOTA_S                LONG                           !                     
GASTOS_ADM                  PDECIMAL(7,2)                  !                     
IMP_CHEQUE                  PDECIMAL(7,2)                  !                     
MONTO_IMP_CHEQUE            PDECIMAL(7,2)                  !                     
MONTO_IMP_DEBITO            PDECIMAL(7,2)                  !                     
MONTO_IMP_TOTAL             PDECIMAL(7,2)                  !                     
CREDITO                     PDECIMAL(7,2)                  !                     
SOCIOS_LIQUIDACION          LONG                           !                     
GASTOS_BANCARIOS            REAL                           !                     
                         END
                     END                       

EMAILS               FILE,DRIVER('ODBC'),OWNER('psrn,sysdba'),NAME('EMAILS'),PRE(EML),BINDABLE,THREAD !                     
EMAILS_FECHA             KEY(EML:FECHA),DUP                !                     
EMAILS_TITULO            KEY(EML:TITULO),DUP               !                     
PK_EMAILS                KEY(EML:IDEMAIL),PRIMARY          !                     
Record                   RECORD,PRE()
IDEMAIL                     LONG,NAME('IDEMAIL | READONLY') !                     
PARA                        CSTRING(255)                   !                     
TITULO                      CSTRING(101)                   !                     
MENSAJE                     CSTRING(255)                   !                     
ADJUNTO                     CSTRING(101)                   !                     
FECHA                       DATE                           !                     
HORA                        TIME                           !                     
IDUSUARIO                   LONG                           !                     
                         END
                     END                       

BANCO_DEBITO         FILE,DRIVER('ASCII'),NAME('MAIN12345.TXT'),PRE(BAN),CREATE,BINDABLE,THREAD !                     
Record                   RECORD,PRE()
TRAFICO_INF                 STRING(2)                      !                     
COD_BANCO                   STRING(3)                      !                     
COD_REGISTRO                STRING(2)                      !                     
F_VENCIMIENTO               STRING(6)                      !                     
EMPRESA                     STRING(5)                      !                     
IDENTIFICADO                STRING(22)                     !                     
MONEDA                      STRING(1)                      !                     
CBU_B_1                     STRING(8)                      !                     
CBU_B_4                     STRING(14)                     !                     
IMPORTE                     STRING(10)                     !                     
CUIT                        STRING(11)                     !                     
DESCRIPCION                 STRING(10)                     !                     
VENCIMIENTO                 STRING(15)                     !                     
REFER_UNIVOCA               STRING(15)                     !                     
NUEVO_CBU                   STRING(22)                     !                     
CODIGO_RETORNO              STRING(3)                      !                     
                         END
                     END                       

MCENTRO_SALUD        FILE,DRIVER('TOPSPEED'),NAME('CENTROSAL.TPS'),PRE(MCS),BINDABLE,THREAD ! -- MINISTERIO  TPS ---CONTRO DE SALUD
PK_CENTRO_SALUD          KEY(MCS:IDCENTRO_SALUD),NOCASE,OPT,PRIMARY !                     
IDX_NOMBRE               KEY(MCS:DESCRIPCION),NOCASE,OPT   !                     
Record                   RECORD,PRE()
IDCENTRO_SALUD              STRING(20)                     !                     
DESCRIPCION                 STRING(50)                     !                     
DIRECCION                   STRING(50)                     !                     
                         END
                     END                       

CONF_EMP             FILE,DRIVER('ODBC'),OWNER('psrn,sysdba'),NAME('CONF_EMP'),PRE(COF),BINDABLE,THREAD !                     
PK_CONF_EMP              KEY(COF:RAZON_SOCIAL),PRIMARY     !                     
LOGO                        BLOB,BINARY                    !                     
LOGO_FIRMA2                 BLOB,BINARY                    !                     
Record                   RECORD,PRE()
RAZON_SOCIAL                CSTRING(101),NAME('"RAZON_SOCIAL"') !                     
CUIT                        CSTRING(12)                    !                     
DIRECCION                   CSTRING(51)                    !                     
TELEFONOS                   CSTRING(31)                    !                     
EMAIL                       CSTRING(51)                    !                     
CONTROL_CUOTA               LONG,NAME('"CONTROL_CUOTA"')   !                     
FIRMA1                      CSTRING(51)                    !                     
FIRMA2                      CSTRING(51)                    !                     
FIRMA3                      CSTRING(51)                    !                     
LEY                         CSTRING(41)                    !                     
PER_JUR                     CSTRING(21)                    !                     
PORCENTAJE_LIQUIDACION      REAL                           !                     
IMP_CHEQUE                  PDECIMAL(7,2)                  !                     
CHEQUERA                    PDECIMAL(7,2)                  !                     
SMTP                        CSTRING(51)                    !                     
USUARIO_SMTP                CSTRING(51)                    !                     
PASSWORD_SMTP               CSTRING(51)                    !                     
SMTP_SEGURO                 LONG                           !                     
PUERTO                      LONG                           !                     
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

SQL                  FILE,DRIVER('ODBC'),OWNER('psrn,sysdba'),NAME('SQL'),PRE(SQL),BINDABLE,THREAD !                     
Record                   RECORD,PRE()
VAR1                        CSTRING(101)                   !                     
VAR2                        CSTRING(101)                   !                     
VAR3                        CSTRING(101)                   !                     
VAR4                        CSTRING(101)                   !                     
VAR5                        CSTRING(101)                   !                     
VAR6                        CSTRING(101)                   !                     
VAR7                        CSTRING(101)                   !                     
VAR8                        CSTRING(101)                   !                     
VAR9                        CSTRING(101)                   !                     
VAR10                       CSTRING(101)                   !                     
VAR11                       CSTRING(101)                   !                     
VAR12                       CSTRING(101)                   !                     
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

CONSULTRIO_ADHERENTE FILE,DRIVER('ODBC'),OWNER('psrn,sysdba'),NAME('CONSULTRIO_ADHERENTE'),PRE(CON1),BINDABLE,THREAD !                     
FK_CONSULTRIO_ADHERENTE_CONSUL KEY(CON1:IDCONSULTORIO),DUP !                     
FK_CONSULTRIO_ADHERENTE_SOCIO KEY(CON1:IDSOCIO),DUP        !                     
IDX_CONSULTORIO_ADHERENTE_UNIQU KEY(CON1:FOLIO,CON1:NRO)   !                     
PK_CONSULTRIO_ADHERENTE  KEY(CON1:IDCONSUL_ADE),PRIMARY    !                     
Record                   RECORD,PRE()
IDCONSUL_ADE                LONG,NAME('IDCONSUL_ADE | READONLY') !                     
IDCONSULTORIO               LONG                           !                     
IDSOCIO                     LONG                           !                     
NRO                         LONG                           !                     
FECHA                       DATE                           !                     
FOLIO                       LONG                           !                     
LIBRO                       LONG                           !                     
TELEFONO                    CSTRING(41)                    !                     
                         END
                     END                       

AUDITORIA            FILE,DRIVER('ODBC'),OWNER('psrn,sysdba'),NAME('AUDITORIA'),PRE(AUD),BINDABLE,THREAD !                     
PK_AUDITORIA             KEY(AUD:IDAUDITORIA),PRIMARY      !                     
FK_AUDITORIA_SOCIOS      KEY(AUD:IDSOCIO),DUP              !                     
FK_AUDITORIA_USUARIO     KEY(AUD:IDUSUARIO),DUP            !                     
IDX_AUDITRIA_ACCION      KEY(AUD:ACCION),DUP               !                     
Record                   RECORD,PRE()
IDAUDITORIA                 LONG,NAME('IDAUDITORIA | READONLY') !                     
ACCION                      CSTRING(101)                   !                     
IDSOCIO                     LONG                           !                     
FECHA                       DATE                           !                     
HORA                        TIME                           !                     
IDUSUARIO                   LONG                           !                     
                         END
                     END                       

CONTROL_LIQUIDACION  FILE,DRIVER('ODBC'),OWNER('psrn,sysdba'),NAME('CONTROL_LIQUIDACION'),PRE(CON31),BINDABLE,THREAD !                     
PK_CONTROL_LIQUIDACION   KEY(CON31:IDSOCIO),PRIMARY        !                     
FK_CONTROL_LIQUIDACION   KEY(CON31:IDSOCIO),DUP            !                     
Record                   RECORD,PRE()
IDSOCIO                     LONG                           !                     
MES                         CSTRING(3)                     !                     
ANO                         CSTRING(5)                     !                     
PERIODO                     LONG                           !                     
NUMERO                      LONG                           !                     
                         END
                     END                       

EMAIL                FILE,DRIVER('ASCII'),NAME('MENSAJE.TXT'),PRE(EMA),CREATE,BINDABLE,THREAD !                     
Record                   RECORD,PRE()
MENSAJE                     STRING(10000)                  !                     
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

CONTROL_CUOTA        FILE,DRIVER('ODBC'),OWNER('psrn,sysdba'),NAME('CONTROL_CUOTA'),PRE(CONC),BINDABLE,THREAD !                     
PK_CONTROL_CUOTA         KEY(CONC:IDCONTROL),PRIMARY       !                     
CONTROL_CUOTA_ANO        KEY(CONC:ANO)                     !                     
Record                   RECORD,PRE()
IDCONTROL                   LONG,NAME('IDCONTROL | READONLY') !                     
ANO                         LONG                           !                     
CANT_CUOTAS_MAX             LONG,NAME('"CANT_CUOTAS_MAX"') !                     
FECHA_TOPE_PAGO             DATE,NAME('"FECHA_TOPE_PAGO"') !                     
DESCUENTO_CUOTA             PDECIMAL(5,2),NAME('"DESCUENTO_CUOTA"') !                     
GENERADO                    CSTRING(3)                     !                     
MONTO_ANUAL                 DECIMAL(7,2)                   !                     
                         END
                     END                       

EXP_CURSO_INSCRIPCION_DETALLE FILE,DRIVER('TOPSPEED'),NAME('CURSO_INSCRIPCION_DETALLE.TPS'),PRE(CURD1),BINDABLE,CREATE,THREAD !                     
PK_CURSO_INSCRIPCION_DETALLE KEY(CURD1:IDINSCRIPCION,CURD1:IDCURSO,CURD1:ID_MODULO),PRIMARY !                     
FK_CURSO_INSCRIPCION_DETALLE_IN KEY(CURD1:IDINSCRIPCION),DUP !                     
IDX_CURSO_DETALLE_CURSO  KEY(CURD1:IDCURSO),DUP            !                     
IDX_CURSO_DETALLE_MODULO KEY(CURD1:ID_MODULO),DUP          !                     
IDX_CURSO_DETALLE_PAGADO KEY(CURD1:PAGADO),DUP             !                     
IDX_CURSO_DETALLE_SUBCTA KEY(CURD1:IDSUBCUENTA),DUP,NOCASE,OPT !                     
Record                   RECORD,PRE()
IDINSCRIPCION               LONG                           !                     
IDCURSO                     LONG                           !                     
ID_MODULO                   LONG                           !                     
FECHA_INSCRIPCION           DATE                           !                     
PRESENTE                    CSTRING(3)                     !                     
NOTA                        REAL                           !                     
MONTO                       REAL                           !                     
PAGADO                      CSTRING(3)                     !                     
FECHA_PAGO                  DATE                           !                     
HORA_PAGO                   TIME                           !                     
USUARIO_PAGO                LONG                           !                     
IDSUBCUENTA                 LONG                           !                     
DESCUENTO                   REAL                           !                     
SUCURSAL                    LONG                           !                     
IDRECIBO                    LONG                           !                     
                         END
                     END                       

EXP_INGRESOS         FILE,DRIVER('TOPSPEED'),NAME('INGRESOS.TPS'),PRE(ING1),BINDABLE,CREATE,THREAD !                     
PK_INGRESOS              KEY(ING1:IDINGRESO),PRIMARY       !                     
FK_INGRESOS_SUBCUENTA    KEY(ING1:IDSUBCUENTA),DUP         !                     
FK_INGRESOS_USUARIOS     KEY(ING1:IDUSUARIO),DUP           !                     
FK_INGRESOS_PROVEEDOR    KEY(ING1:IDPROVEEDOR),DUP         !                     
IDX_INGRESOS_UNIQUE      KEY(ING1:SUCURSAL,ING1:IDRECIBO),NOCASE,OPT !                     
IDX_INGRESOS_FECHA       KEY(ING1:FECHA),DUP,NOCASE,OPT    !                     
Record                   RECORD,PRE()
IDINGRESO                   LONG                           !                     
IDUSUARIO                   LONG                           !                     
IDSUBCUENTA                 LONG                           !                     
OBSERVACION                 CSTRING(51)                    !                     
MONTO                       DECIMAL(9,2)                   !                     
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

CONSULTORIO          FILE,DRIVER('ODBC'),OWNER('psrn,sysdba'),NAME('CONSULTORIO'),PRE(CON2),BINDABLE,THREAD !                     
PK_CONSULTORIO           KEY(CON2:IDCONSULTORIO),PRIMARY   !                     
FK_CONSULTORIO_INSPECTOR KEY(CON2:IDINSPECTOR),DUP         !                     
FK_CONSULTORIO_LOCALIDAD KEY(CON2:IDLOCALIDAD),DUP         !                     
FK_CONSULTORIO_SOCIOS    KEY(CON2:IDSOCIO),DUP             !                     
Record                   RECORD,PRE()
IDCONSULTORIO               LONG,NAME('IDCONSULTORIO | READONLY') !                     
IDLOCALIDAD                 LONG                           !                     
IDSOCIO                     LONG                           !                     
DIRECCION                   CSTRING(51)                    !                     
FECHA                       DATE                           !                     
LIBRO                       LONG                           !                     
FOLIO                       LONG                           !                     
ACTA                        CSTRING(21)                    !                     
IDINSPECTOR                 LONG                           !                     
HABILITADO                  CSTRING(3)                     !                     
FECHA_HABILITACION          DATE                           !                     
FECHA_VTO                   DATE                           !                     
TELEFONO                    CSTRING(41)                    !                     
ACTIVO                      CSTRING(3)                     !                     
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

CV                   FILE,DRIVER('ODBC'),OWNER('psrn,sysdba'),NAME('CV'),PRE(CV),BINDABLE,THREAD !                     
PK_CV                    KEY(CV:IDCV),PRIMARY              !                     
FK_CV_INSTITUCION        KEY(CV:IDINSTITUCION),DUP         !                     
FK_CV_SOCIOS             KEY(CV:IDSOCIO),DUP               !                     
FK_CV_T_CURSO            KEY(CV:ID_TIPO_CURSO),DUP         !                     
IDX_CV_DESCRIPCION       KEY(CV:DESCRIPCION),DUP           !                     
Record                   RECORD,PRE()
IDCV                        LONG,NAME('IDCV | READONLY')   !                     
DESCRIPCION                 CSTRING(51)                    !                     
IDSOCIO                     LONG                           !                     
IDINSTITUCION               LONG                           !                     
ID_TIPO_CURSO               LONG,NAME('"ID_TIPO_CURSO"')   !                     
ANO_EGRESO                  CSTRING(5),NAME('"ANO_EGRESO"') !                     
CANTIDAD_HORAS              CSTRING(21),NAME('"CANTIDAD_HORAS"') !                     
OBSERVACION                 CSTRING(101)                   !                     
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

ESPECIALIDAD         FILE,DRIVER('ODBC'),OWNER('psrn,sysdba'),NAME('ESPECIALIDAD'),PRE(ESP),BINDABLE,THREAD !                     
PK_ESPECIALIDAD          KEY(ESP:IDESPECIALIDAD),PRIMARY   !                     
IDX_ESPECIALIDAD_DESCRIPCION KEY(ESP:DESCRIPCION)          !                     
Record                   RECORD,PRE()
IDESPECIALIDAD              LONG,NAME('IDESPECIALIDAD | READONLY') !                     
DESCRIPCION                 CSTRING(51)                    !                     
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

INSPECTOR            FILE,DRIVER('ODBC'),OWNER('psrn,sysdba'),NAME('INSPECTOR'),PRE(INS),BINDABLE,THREAD !                     
PK_INSPECTOR             KEY(INS:IDINSPECTOR),PRIMARY      !                     
FK_INSPECTOR_SOCIOS      KEY(INS:IDSOCIO),DUP              !                     
Record                   RECORD,PRE()
IDINSPECTOR                 LONG,NAME('IDINSPECTOR | READONLY') !                     
IDSOCIO                     LONG                           !                     
OBSERVACION                 CSTRING(51)                    !                     
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

TIPO_COMPROBANTE     FILE,DRIVER('ODBC'),OWNER('psrn,sysdba'),NAME('TIPO_COMPROBANTE'),PRE(TIPCOM),BINDABLE,THREAD !                     
IDX_TIPO_COMPROBANTE_DEC KEY(TIPCOM:DESCRIPCION),DUP       !                     
PK_TIPO_COMPROBANTE      KEY(TIPCOM:IDTIPO_COMPROBANTE),PRIMARY !                     
Record                   RECORD,PRE()
IDTIPO_COMPROBANTE          LONG,NAME('IDTIPO_COMPROBANTE | READONLY') !                     
DESCRIPCION                 CSTRING(21)                    !                     
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

PADRONXESPECIALIDAD  FILE,DRIVER('ODBC'),OWNER('psrn,sysdba'),NAME('PADRONXESPECIALIDAD'),PRE(PAD),BINDABLE,THREAD !                     
PK_ESPXSOC               KEY(PAD:IDESPECIALIDAD,PAD:IDSOCIO),PRIMARY !                     
FK_PADRONXESPECIALIDAD_ESP KEY(PAD:IDESPECIALIDAD),DUP     !                     
FK_PADRONXESPECIALIDAD_SOCI KEY(PAD:IDSOCIO),DUP           !                     
Record                   RECORD,PRE()
IDESPECIALIDAD              LONG                           !                     
IDSOCIO                     LONG                           !                     
                         END
                     END                       

EXP_PROVEEDORES      FILE,DRIVER('TOPSPEED'),NAME('PROVEEDORES.TPS'),PRE(PRO21),BINDABLE,CREATE,THREAD !                     
PK_PROVEEDOR             KEY(PRO21:IDPROVEEDOR),PRIMARY    !                     
FK_PROVEEDORES_USUARIO   KEY(PRO21:IDUSUARIO),DUP          !                     
FK_PROVEEDORES_TIPOIVA   KEY(PRO21:IDTIPOIVA),DUP          !                     
IDX_PROVEEDORES_CUIT     KEY(PRO21:CUIT),DUP               !                     
IDX_PROVEEDORES_DESCRIPCION KEY(PRO21:DESCRIPCION),DUP     !                     
FK_PROVEEDORES_TIPO_PROVEEDOR KEY(PRO21:IDTIPO_PROVEEDOR),DUP,NOCASE,OPT !                     
Record                   RECORD,PRE()
IDPROVEEDOR                 LONG                           !                     
DESCRIPCION                 CSTRING(51)                    !                     
DIRECCION                   CSTRING(51)                    !                     
TELEFONO                    CSTRING(31)                    !                     
EMAIL                       CSTRING(101)                   !                     
CUIT                        CSTRING(12)                    !                     
FECHA                       TIME                           !                     
HORA                        TIME                           !                     
IDUSUARIO                   LONG                           !                     
IDTIPOIVA                   LONG                           !                     
FECHA_BAJA                  DATE                           !                     
OBSERVACION                 CSTRING(101)                   !                     
IDTIPO_PROVEEDOR            LONG                           !                     
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

RENUNCIA             FILE,DRIVER('ODBC'),OWNER('psrn,sysdba'),NAME('RENUNCIA'),PRE(REN),BINDABLE,THREAD !                     
PK_RENUNCIA              KEY(REN:IDRENUNCIA),PRIMARY       !                     
FK_RENUNCIA_SOCIOS       KEY(REN:IDSOCIO),DUP              !                     
FK_RENUNCIA_USUARIO      KEY(REN:IDUSUARIO),DUP            !                     
Record                   RECORD,PRE()
IDRENUNCIA                  LONG,NAME('IDRENUNCIA | READONLY') !                     
IDSOCIO                     LONG                           !                     
IDUSUARIO                   LONG                           !                     
LIBRO                       CSTRING(51)                    !                     
FOLIO                       LONG                           !                     
ACTA                        CSTRING(51)                    !                     
FECHA                       DATE                           !                     
HORA                        TIME                           !                     
                         END
                     END                       

MINESP               FILE,DRIVER('ASCII'),NAME('MINESP.TXT'),PRE(MESP),BINDABLE,CREATE,THREAD ! --- MINISTERIO --- TXT
Record                   RECORD,PRE()
NRO                         STRING(1)                      !                     
COLEGIO                     STRING(50)                     !                     
IDSOCIO                     STRING(20)                     !                     
NOMBRE                      STRING(50)                     !                     
IDESPECIALIDAD              STRING(20)                     !                     
ESPECIALIDAD                STRING(50)                     !                     
FECHA_INICIO                STRING(20)                     !                     
                         END
                     END                       

LIQUIDACIONXSOCIO    FILE,DRIVER('ODBC'),OWNER('psrn,sysdba'),NAME('LIQUIDACIONXSOCIO'),PRE(LXSOC),BINDABLE,THREAD !                     
PK_LIQUIDACIONXSOCIO     KEY(LXSOC:IDSOCIO,LXSOC:PERIODO),PRIMARY !                     
FK_LIQUIDACIONXSOCIO_1   KEY(LXSOC:IDSOCIO),DUP            !                     
IDX_LIQUIDACIONXSOCIO_MES_ANO KEY(LXSOC:MES,LXSOC:ANO),DUP !                     
Record                   RECORD,PRE()
IDSOCIO                     LONG                           !                     
MES                         LONG                           !                     
ANO                         LONG                           !                     
PERIODO                     CSTRING(7)                     !                     
TIPO_PERIODO                CSTRING(31),NAME('"TIPO_PERIODO"') !                     
MONTO                       PDECIMAL(7,2)                  !                     
FECHA_CARGA                 DATE                           !                     
FECHA_PRESENTACION          DATE                           !                     
FECHA_COBRO                 DATE                           !                     
FECHA_PAGO                  DATE                           !                     
MONTO_PAGADO                PDECIMAL(7,2)                  !                     
IDFORMA_PAGO                LONG                           !                     
DEBITO                      PDECIMAL(7,2)                  !                     
COMISION                    PDECIMAL(7,2)                  !                     
CANTIDAD                    LONG                           !                     
DEBITO_COMISION             PDECIMAL(7,2)                  !                     
CANTIDAD_CUOTAS_PAGADAS     LONG                           !                     
DEBITO_PAGO_CUOTAS          PDECIMAL(7,2)                  !                     
MONTO_TOTAL                 PDECIMAL(7,2)                  !                     
PRESENTADO                  CSTRING(3)                     !                     
COBRADO                     CSTRING(3)                     !                     
PAGADO                      CSTRING(3)                     !                     
                         END
                     END                       

LIQUIDACION_DISKETTE FILE,DRIVER('ASCII','/CLIP=OFF'),NAME('C17791XX.285'),PRE(MAC),CREATE,BINDABLE,THREAD ! LIQUIDACION MENSUAL MACRO
Record                   RECORD,PRE()
COLUMNA                     STRING(161)                    !                     
                         END
                     END                       

MINISTERIO           FILE,DRIVER('TOPSPEED'),NAME('MINISTERIO.TPS'),PRE(MIN),BINDABLE,THREAD ! --MINISTERIO TPS --- MINISTERIO
PK_MINISTERIO            KEY(MIN:IDMINISTERIO),NOCASE,OPT,PRIMARY !                     
IDX_DECRIPCION           KEY(MIN:DESCRIPCION),NOCASE,OPT   !                     
Record                   RECORD,PRE()
IDMINISTERIO                LONG                           !                     
DESCRIPCION                 STRING(50)                     !                     
DIRECCION                   STRING(50)                     !                     
                         END
                     END                       

MINSALUD             FILE,DRIVER('ASCII'),NAME('MINSALUD.TXT'),PRE(MINS),BINDABLE,CREATE,THREAD ! --- MINISTERIO --- TXT
Record                   RECORD,PRE()
NRO                         STRING(1)                      !                     
IDCOLEGIO                   STRING(20)                     !                     
MATRICULA                   STRING(10)                     !                     
APELLIDO                    STRING(30)                     !                     
NOMBRES                     STRING(30)                     !                     
NOMBRE                      STRING(30)                     !                     
TIPO_DOC                    STRING(20)                     !                     
N_DOCUMENTO                 STRING(20)                     !                     
SEXO                        STRING(1)                      !                     
DIRECCION                   STRING(50)                     !                     
TELEFONO                    STRING(30)                     !                     
CELULAR                     STRING(50)                     !                     
EMAIL                       STRING(100)                    !                     
FECHA_ALTA                  STRING(20)                     !                     
FECHA_NACIMIENTO            STRING(20)                     !                     
FECHA_BAJA                  STRING(20)                     !                     
LOCALIDAD                   STRING(100)                    !                     
ANO                         STRING(20)                     !                     
DIRECCION_LABORAL           STRING(50)                     !                     
TELEFONO_LABORAL            STRING(30)                     !                     
BAJA                        STRING(2)                      !                     
LIBRO                       STRING(20)                     !                     
FOLIO                       STRING(20)                     !                     
ACTA                        STRING(20)                     !                     
PROVISORIO                  STRING(2)                      !                     
FECHA_EGRESO                STRING(20)                     !                     
BAJA_TEMPORARIA             STRING(2)                      !                     
FECHA_TITULO                STRING(20)                     !                     
LUGAR_NACIMIENTO            STRING(50)                     !                     
DESCRIPCION_MINISTERIO      STRING(50)                     !                     
INSTITUCION                 STRING(50)                     !                     
IDCENTRO_SALUD              STRING(20)                     !                     
DESCRIPCION_CENTRO_SALUD    STRING(50)                     !                     
TIPO_INSTITUCION            STRING(30)                     !                     
TITULO                      STRING(50)                     !                     
NIVEL_FORMACION             STRING(50)                     !                     
GRADO                       STRING(2)                      !                     
TIPO_TITULO                 STRING(20)                     !                     
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

PAGOSXCIRCULO        FILE,DRIVER('ODBC'),OWNER('psrn,sysdba'),NAME('PAGOSXCIRCULO'),PRE(PAG1),BINDABLE,THREAD !                     
PK_PAGOSXCIRCULO         KEY(PAG1:IDSOCIO,PAG1:IDCIRCULO),PRIMARY !                     
FK_PAGOSXCIRCULO_SOCIO   KEY(PAG1:IDSOCIO)                 !                     
FK_PAGOSXCIRCULO_CIRCULO KEY(PAG1:IDCIRCULO),DUP           !                     
Record                   RECORD,PRE()
IDSOCIO                     LONG                           !                     
IDCIRCULO                   LONG                           !                     
                         END
                     END                       

TIPO_CURSO           FILE,DRIVER('ODBC'),OWNER('psrn,sysdba'),NAME('TIPO_CURSO'),PRE(TIP2),BINDABLE,THREAD !                     
PK_T_CURSO               KEY(TIP2:ID_TIPO_CURSO),PRIMARY   !                     
IDX_DESCRIPCION          KEY(TIP2:DESCRIPCION)             !                     
Record                   RECORD,PRE()
ID_TIPO_CURSO               LONG,NAME('ID_TIPO_CURSO | READONLY') !                     
DESCRIPCION                 CSTRING(51)                    !                     
GRADO                       STRING(2)                      !                     
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

LIQUIDACION_ENTREGA_BANCO FILE,DRIVER('ODBC'),OWNER('psrn,sysdba'),NAME('LIQUIDACION_ENTREGA_BANCO'),PRE(BCO),BINDABLE,THREAD !                     
FK_LIQUIDACION_ENTREGA_BANCO_OS KEY(BCO:IDOS),DUP          !                     
FK_LIQUIDACION_ENTREGA_BANCO_US KEY(BCO:IDUSUARIO),DUP     !                     
LIQUIDACION_ENTREGA_BANCO_UNIKE KEY(BCO:MES,BCO:ANO,BCO:IDOS) !                     
PK_LIQUIDACION_ENTREGA_BANCO KEY(BCO:IDENTREGABNCO),PRIMARY !                     
Record                   RECORD,PRE()
IDENTREGABNCO               LONG                           !                     
DESCRIPCION                 CSTRING(51)                    !                     
FECHA                       DATE                           !                     
HORA                        TIME                           !                     
IDUSUARIO                   LONG                           !                     
MES                         LONG                           !                     
ANO                         LONG                           !                     
PERIODO                     LONG                           !                     
IDOS                        LONG                           !                     
SECUENCIA                   LONG                           !                     
TIPO                        CSTRING(2)                     !                     
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

CONSULTORIO_EQUIPO   FILE,DRIVER('ODBC'),OWNER('psrn,sysdba'),NAME('CONSULTORIO_EQUIPO'),PRE(CON),BINDABLE,THREAD !                     
PK_CONSULTORIO_EQUIPO    KEY(CON:IDCONSULTORIO,CON:IDTIPOEQUIPO),PRIMARY !                     
FK_CONSULTORIO_EQUIPO_CONS KEY(CON:IDCONSULTORIO),DUP      !                     
FK_CONSULTORIO_EQUIPO_EQUIP KEY(CON:IDTIPOEQUIPO),DUP      !                     
Record                   RECORD,PRE()
IDCONSULTORIO               LONG                           !                     
IDTIPOEQUIPO                LONG                           !                     
OBSERVACION                 CSTRING(101)                   !                     
FECHA                       DATE                           !                     
HORA                        TIME                           !                     
IDUSUARIO                   LONG                           !                     
                         END
                     END                       

TIPO_EQUIPO          FILE,DRIVER('ODBC'),OWNER('psrn,sysdba'),NAME('TIPO_EQUIPO'),PRE(TIP5),BINDABLE,THREAD !                     
PK_TIPO_EQUIPO           KEY(TIP5:IDTIPOEQUIPO),PRIMARY    !                     
IDX_TIPO_EQUIPO_DESCRIPCION KEY(TIP5:DESCRIPCION),DUP      !                     
Record                   RECORD,PRE()
IDTIPOEQUIPO                LONG,NAME('IDTIPOEQUIPO | READONLY') !                     
DESCRIPCION                 CSTRING(51)                    !                     
                         END
                     END                       

FACTURAXCUPON        FILE,DRIVER('ODBC'),OWNER('psrn,sysdba'),NAME('FACTURAXCUPON'),PRE(FAC2),BINDABLE,THREAD !                     
PK_FACTURAXCUPON         KEY(FAC2:IDFACTURA),PRIMARY       !                     
IDX_FACTURAXCUPON_SOCIO_LOTE KEY(FAC2:IDSOCIO,FAC2:IDLOTE) !                     
FK_FACTURAXCUPON_LOTE    KEY(FAC2:IDLOTE),DUP              !                     
FK_FACTURAXCUPON_SOCIO   KEY(FAC2:IDSOCIO),DUP             !                     
Record                   RECORD,PRE()
IDFACTURA                   LONG                           !                     
IDSOCIO                     LONG                           !                     
IDLOTE                      LONG                           !                     
                         END
                     END                       

LOTE                 FILE,DRIVER('ODBC'),OWNER('psrn,sysdba'),NAME('LOTE'),PRE(LOT),BINDABLE,THREAD !                     
PK_LOTE                  KEY(LOT:IDLOTE),PRIMARY           !                     
FK_LOTE_USUARIO          KEY(LOT:IDUSUARIO),DUP            !                     
Record                   RECORD,PRE()
IDLOTE                      LONG                           !                     
FECHA                       DATE                           !                     
HORA                        TIME                           !                     
IDUSUARIO                   SHORT                          !                     
                         END
                     END                       

CAJA                 FILE,DRIVER('ODBC'),OWNER('psrn,sysdba'),NAME('CAJA'),PRE(CAJ),BINDABLE,THREAD !                     
PK_CAJA                  KEY(CAJ:IDCAJA),PRIMARY           !                     
FK_CAJA_USUARIOS         KEY(CAJ:IDUSUARIO),DUP            !                     
FK_CAJA_SUBCUENTA        KEY(CAJ:IDSUBCUENTA),DUP          !                     
IDX_CAJA_FECHA           KEY(CAJ:FECHA),DUP                !                     
IDX_CAJA_MES             KEY(CAJ:MES),DUP                  !                     
IDX_CAJA_ANO             KEY(CAJ:ANO),DUP                  !                     
IDX_CAJA_PERIODO         KEY(CAJ:PERIODO),DUP              !                     
IDX_CAJA_TRANSACCION     KEY(CAJ:IDTRANSACCION),DUP,NOCASE,OPT !                     
IDX_UNIQUE_TRANSAC       KEY(CAJ:TIPO,CAJ:IDTRANSACCION)   !                     
Record                   RECORD,PRE()
IDCAJA                      LONG                           !                     
IDSUBCUENTA                 LONG                           !                     
IDUSUARIO                   LONG                           !                     
DEBE                        DECIMAL(9,2)                   !                     
HABER                       DECIMAL(9,2)                   !                     
MONTO                       DECIMAL(9,2)                   !                     
OBSERVACION                 CSTRING(51)                    !                     
FECHA                       DATE                           !                     
MES                         LONG                           !                     
ANO                         LONG                           !                     
PERIODO                     CSTRING(7)                     !                     
SUCURSAL                    LONG                           !                     
RECIBO                      LONG                           !                     
TIPO                        CSTRING(11)                    !                     
IDTRANSACCION               LONG                           !                     
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

GASTOS               FILE,DRIVER('ODBC'),OWNER('psrn,sysdba'),NAME('GASTOS'),PRE(GAS),BINDABLE,THREAD !                     
PK_GASTOS                KEY(GAS:IDGASTOS),PRIMARY         !                     
FK_GASTOS_SUBCUENTA      KEY(GAS:IDSUBCUENTA),DUP          !                     
FK_GASTOS_USUARIO        KEY(GAS:IDUSUARIO),DUP            !                     
IDX_GASTOS_FECHA         KEY(GAS:FECHA),DUP                !                     
IDX_GASTOS_UNIQUE        KEY(GAS:SUCURSAL,GAS:IDRECIBO,GAS:IDPROVEEDOR),DUP !                     
FK_GASTOS1               KEY(GAS:IDPROVEEDOR),DUP,NOCASE,OPT !                     
FK_GASTOS_TIPO_COMPROBANTE KEY(GAS:IDTIPO_COMPROBANTE),DUP,NOCASE,OPT !                     
Record                   RECORD,PRE()
IDGASTOS                    LONG                           !                     
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
IDTIPO_COMPROBANTE          LONG                           !                     
LETRA                       CSTRING(3)                     !                     
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

SOCIOSXTRABAJO       FILE,DRIVER('ODBC'),OWNER('psrn,sysdba'),NAME('SOCIOSXTRABAJO'),PRE(SOC2),BINDABLE,THREAD !                     
PK_SOCIOSXTRABAJO        KEY(SOC2:IDSOCIOS,SOC2:IDTRABAJO),PRIMARY !                     
FK_SOCIOSXTRABAJO_TRABAJO KEY(SOC2:IDTRABAJO),DUP          !                     
FK_SOCIOSXTRABAJO_SOCIOS KEY(SOC2:IDSOCIOS),DUP            !                     
Record                   RECORD,PRE()
IDSOCIOS                    LONG                           !                     
IDTRABAJO                   LONG                           !                     
FECHA                       DATE                           !                     
                         END
                     END                       

TRABAJO              FILE,DRIVER('ODBC'),OWNER('psrn,sysdba'),NAME('TRABAJO'),PRE(TRA),BINDABLE,THREAD !                     
PK_TRABAJO               KEY(TRA:IDTRABAJO),PRIMARY        !                     
IDX_TRABAJO_DESCRIPCION  KEY(TRA:DESCRIPCION)              !                     
FK_TRABAJO_LOCALIDAD     KEY(TRA:IDLOCALIDAD),DUP          !                     
Record                   RECORD,PRE()
IDTRABAJO                   LONG,NAME('IDTRABAJO | READONLY') !                     
DESCRIPCION                 CSTRING(51)                    !                     
DIRECCION                   CSTRING(51)                    !                     
IDLOCALIDAD                 LONG                           !                     
TELEFONO                    CSTRING(21)                    !                     
EMAIL                       CSTRING(51)                    !                     
OBSERVACION                 CSTRING(51)                    !                     
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

OBRA_SOCIAL          FILE,DRIVER('ODBC'),OWNER('psrn,sysdba'),NAME('OBRA_SOCIAL'),PRE(OBR),BINDABLE,THREAD !                     
IDX_OBRA_SOCIAL_NOMBRE   KEY(OBR:NOMBRE),DUP               !                     
IDX_OBRA_SOCIAL_NOM_CORTO KEY(OBR:NOMPRE_CORTO),DUP        !                     
FK_OBRA_SOCIAL_LOCALIDAD KEY(OBR:IDLOCALIDAD),DUP          !                     
PK_OBRA_SOCIAL           KEY(OBR:IDOS),PRIMARY             !                     
Record                   RECORD,PRE()
IDOS                        LONG,NAME('IDOS | READONLY')   !                     
NOMBRE                      CSTRING(101)                   !                     
NOMPRE_CORTO                CSTRING(31),NAME('"NOMPRE_CORTO"') !                     
DIRECCION                   CSTRING(51)                    !                     
TELEFONO                    CSTRING(31)                    !                     
CUIT                        LONG                           !                     
EMAIL                       CSTRING(51)                    !                     
IDLOCALIDAD                 LONG                           !                     
PRONTO_PAGO                 CSTRING(3),NAME('"PRONTO_PAGO"') !                     
FECHA_BAJA                  DATE                           !                     
OBSERVACION                 CSTRING(20)                    !                     
                         END
                     END                       

OS_PLANES            FILE,DRIVER('ODBC'),OWNER('psrn,sysdba'),NAME('OS_PLANES'),PRE(OS_),BINDABLE,THREAD !                     
FK_OS_PLANES_OS          KEY(OS_:IDOS),DUP                 !                     
PK_OS_PLANES             KEY(OS_:IDOS,OS_:IDPLAN_OS),PRIMARY !                     
Record                   RECORD,PRE()
IDOS                        LONG                           !                     
IDPLAN_OS                   CSTRING(31),NAME('"IDPLAN_OS"') !                     
PORCENTAJE                  PDECIMAL(5,2)                  !                     
                         END
                     END                       

SOCIOSXOS            FILE,DRIVER('ODBC'),OWNER('psrn,sysdba'),NAME('SOCIOSXOS'),PRE(SOC3),BINDABLE,THREAD !                     
FK_SOCIOSXOS_OS          KEY(SOC3:IDOS),DUP                !                     
FK_SOCIOSXOS_SOCIOS      KEY(SOC3:IDSOCIOS),DUP            !                     
PK_SOCIOSXOS             KEY(SOC3:IDSOCIOS,SOC3:IDOS),PRIMARY !                     
Record                   RECORD,PRE()
IDSOCIOS                    LONG                           !                     
IDOS                        LONG                           !                     
NUMERO                      CSTRING(31)                    !                     
FECHA_ALTA                  DATE,NAME('"FECHA_ALTA"')      !                     
OBSERVACION                 CSTRING(51)                    !                     
                         END
                     END                       

FORMA_PAGO           FILE,DRIVER('ODBC'),OWNER('psrn,sysdba'),NAME('FORMA_PAGO'),PRE(FOR),BINDABLE,THREAD !                     
IDX_FORMA_PAGO_DESCRIPCION KEY(FOR:DESCRIPCION),DUP        !                     
PK_FORMA_PAGO            KEY(FOR:IDFORMA_PAGO),PRIMARY     !                     
Record                   RECORD,PRE()
IDFORMA_PAGO                LONG,NAME('IDFORMA_PAGO | READONLY') !                     
DESCRIPCION                 CSTRING(51)                    !                     
OBSERVACION                 CSTRING(101)                   !                     
                         END
                     END                       

LIQUIDACION          FILE,DRIVER('ODBC'),OWNER('psrn,sysdba'),NAME('LIQUIDACION'),PRE(LIQ),BINDABLE,THREAD !                     
PK_LIQUIDACION           KEY(LIQ:IDLIQUIDACION),PRIMARY    !                     
IDX_LIQUIDACION_ANO      KEY(LIQ:ANO),DUP                  !                     
IDX_LIQUIDACION_FECHA_CARGA KEY(LIQ:FECHA_CARGA),DUP       !                     
IDX_LIQUIDACION_FECHA_PAGO KEY(LIQ:FECHA_PAGO),DUP         !                     
IDX_LIQUIDACION_FECHA_PRESENTAC KEY(LIQ:FECHA_PRESENTACION),DUP !                     
IDX_LIQUIDACION_MES      KEY(LIQ:MES),DUP                  !                     
IDX_LIQUIDACION_PERIODO  KEY(LIQ:PERIODO),DUP              !                     
FK_LIQUIDACION_FORMA_PAGO KEY(LIQ:IDFORMA_PAGO),DUP        !                     
FK_LIQUIDACION_OS        KEY(LIQ:IDOS),DUP                 !                     
FK_LIQUIDACION_SOCIO     KEY(LIQ:IDSOCIO),DUP              !                     
IDX_LIQUIDACION_UNIQUE   KEY(LIQ:PERIODO,LIQ:TIPO_PERIODO,LIQ:IDSOCIO,LIQ:IDOS),DUP !                     
IDX_LIQUIDACION_PRESENTADO KEY(LIQ:PRESENTADO),DUP         !                     
IDX_LIQUIDACION_COBRADO  KEY(LIQ:COBRADO),DUP              !                     
IDX_LIQUIDACION_PAGADO   KEY(LIQ:PAGADO),DUP               !                     
FK_USUARIO               KEY(LIQ:IDUSUARIO),DUP            !                     
IDX_LIQUIDACION_PAGO     KEY(LIQ:IDPAGO_LIQUIDACION),DUP,NOCASE,OPT !                     
Record                   RECORD,PRE()
IDLIQUIDACION               LONG                           !                     
IDSOCIO                     LONG                           !                     
IDOS                        LONG                           !                     
MES                         LONG                           !                     
ANO                         LONG                           !                     
PERIODO                     CSTRING(7)                     !                     
TIPO_PERIODO                CSTRING(31),NAME('"TIPO_PERIODO"') !                     
MONTO                       REAL                           !                     
FECHA_CARGA                 DATE,NAME('"FECHA_CARGA"')     !                     
FECHA_PRESENTACION          DATE,NAME('"FECHA_PRESENTACION"') !                     
FECHA_COBRO                 DATE                           !                     
FECHA_PAGO                  DATE,NAME('"FECHA_PAGO"')      !                     
MONTO_PAGADO                REAL,NAME('"MONTO_PAGADO"')    !                     
IDFORMA_PAGO                LONG                           !                     
DEBITO                      REAL                           !                     
COMISION                    REAL                           !                     
CANTIDAD                    LONG                           !                     
DEBITO_COMISION             REAL                           !                     
CANTIDAD_CUOTAS_PAGADAS     LONG                           !                     
DEBITO_PAGO_CUOTAS          REAL                           !                     
MONTO_TOTAL                 REAL                           !                     
PRESENTADO                  CSTRING(3)                     !                     
COBRADO                     CSTRING(3)                     !                     
PAGADO                      CSTRING(3)                     !                     
IDUSUARIO                   LONG                           !                     
USUARIO_PAGO                LONG                           !                     
IDPAGO_LIQUIDACION          LONG                           !                     
SOCIOS_LIQUIDACION          LONG                           !                     
                         END
                     END                       

SEGURO               FILE,DRIVER('ODBC'),OWNER('psrn,sysdba'),NAME('SEGURO'),PRE(SEG),BINDABLE,THREAD !                     
IDX_SEGURO_MATRICULA     KEY(SEG:IDMATRICULA),DUP          !                     
IDX_SEGURO_NOMBRE        KEY(SEG:NOMBRE),DUP               !                     
FK_SEGURO_FORMA_PAGO     KEY(SEG:ID_FORMA_PAGO),DUP        !                     
FK_SEGURO_SOCIOS         KEY(SEG:IDSOCIO)                  !                     
FK_SEGURO_TIPO_SEGURO    KEY(SEG:ID_TIPO_SEGURO),DUP       !                     
FK_SEGURO_USUARIO        KEY(SEG:IDUSUARIO),DUP            !                     
PK                       KEY(SEG:IDSEGURO),PRIMARY         !                     
Record                   RECORD,PRE()
IDSEGURO                    LONG,NAME('IDSEGURO | READONLY') !                     
IDSOCIO                     LONG                           !                     
NOMBRE                      CSTRING(51)                    !                     
IDMATRICULA                 LONG                           !                     
ID_TIPO_SEGURO              LONG,NAME('"ID_TIPO_SEGURO"')  !                     
ID_FORMA_PAGO               LONG,NAME('"ID_FORMA_PAGO"')   !                     
FECHA                       DATE                           !                     
HORA                        DATE                           !                     
IDUSUARIO                   LONG                           !                     
BAJA                        CSTRING(3)                     !                     
FECHA_BAJA                  DATE,NAME('"FECHA_BAJA"')      !                     
OBSERVACION                 CSTRING(101)                   !                     
CANTIDAD                    LONG                           !                     
                         END
                     END                       

SEGURO_FACTURA       FILE,DRIVER('ODBC'),OWNER('psrn,sysdba'),NAME('SEGURO_FACTURA'),PRE(SEG5),BINDABLE,THREAD !                     
IDX_SEGURO_FACTURA_ESTADO KEY(SEG5:ESTADO),DUP             !                     
IDX_SEGURO_FACTURA_FECHA KEY(SEG5:FECHA),DUP               !                     
IDX_SEGURO_FACTURA_MES   KEY(SEG5:MES),DUP                 !                     
IDX_SEGURO_FACTURA_PERIODO KEY(SEG5:PERIODO),DUP           !                     
IDX_SEGURO_FACTURA_TOTAL KEY(SEG5:TOTAL),DUP               !                     
FK_SEGURO_FACTURA_SOCIO  KEY(SEG5:IDSOCIO),DUP             !                     
FK_SEGURO_FACTURA_TIPO_SEGURO KEY(SEG5:IDTIPO_SEGURO),DUP  !                     
FK_SEGURO_FACTURA_USUARIO KEY(SEG5:IDUSUARIO),DUP          !                     
IDX_SEGURO_FACTURA_UNIQUE KEY(SEG5:IDSOCIO,SEG5:PERIODO)   !                     
PK_SEGURO_FACTURA        KEY(SEG5:IDFACTURA),PRIMARY       !                     
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
IDTIPO_SEGURO               LONG,NAME('"IDTIPO_SEGURO"')   !                     
IDPAGO                      LONG                           !                     
IDPAGO_LIQ                  LONG                           !                     
                         END
                     END                       

TIPO_SEGURO          FILE,DRIVER('ODBC'),OWNER('psrn,sysdba'),NAME('TIPO_SEGURO'),PRE(TIP8),BINDABLE,THREAD !                     
PK_TIPO_SEGURO           KEY(TIP8:ID_TIPO_SEGURO),PRIMARY  !                     
Record                   RECORD,PRE()
ID_TIPO_SEGURO              LONG,NAME('ID_TIPO_SEGURO | READONLY') !                     
DESCRIPCION                 CSTRING(51)                    !                     
COBERTURA                   DECIMAL(12,2)                  !                     
MOTO                        DECIMAL(12,2)                  !                     
PORCENT_COL                 DECIMAL(12,2),NAME('"PORCENT_COL"') !                     
                         END
                     END                       

NOMENCLADOR          FILE,DRIVER('ODBC'),OWNER('psrn,sysdba'),NAME('NOMENCLADOR'),PRE(NOM),BINDABLE,THREAD !                     
IDX_NOMENCLADOR_CODIGO   KEY(NOM:CODIGO),DUP               !                     
IDX_NOMENCLADOR_DESCRIPCION KEY(NOM:DESCRIPCION),DUP       !                     
IDX_NOMENCLADOR_CONTROL  KEY(NOM:CODIGO,NOM:DESCRIPCION)   !                     
PK_NOMENCLADOR           KEY(NOM:IDNOMENCLADOR),PRIMARY    !                     
Record                   RECORD,PRE()
IDNOMENCLADOR               LONG,NAME('IDNOMENCLADOR | READONLY') !                     
CODIGO                      LONG                           !                     
DESCRIPCION                 CSTRING(101)                   !                     
                         END
                     END                       

NOMENCLADORXOS       FILE,DRIVER('ODBC'),OWNER('psrn,sysdba'),NAME('NOMENCLADORXOS'),PRE(NOM2),BINDABLE,THREAD !                     
FK_NOMENCLADORXOS_NOMENCLADOR KEY(NOM2:IDNOMENCLADOR),DUP  !                     
FK_NOMENCLADORXOS_OS     KEY(NOM2:IDOS),DUP                !                     
PK_NOMENCLADORXOS        KEY(NOM2:IDOS,NOM2:IDNOMENCLADOR),PRIMARY !                     
Record                   RECORD,PRE()
IDOS                        LONG                           !                     
IDNOMENCLADOR               LONG                           !                     
VALOR                       PDECIMAL(5,2)                  !                     
VALOR_ANTERIOR              PDECIMAL(5,2),NAME('"VALOR_ANTERIOR"') !                     
                         END
                     END                       

CURSO                FILE,DRIVER('ODBC'),OWNER('psrn,sysdba'),NAME('CURSO'),PRE(CUR),BINDABLE,THREAD !                     
IDX_CURSO_DESCRIPCION    KEY(CUR:DESCRIPCION),DUP          !                     
FK_CURSO_TIPO_CURSO      KEY(CUR:ID_TIPO_CURSO),DUP        !                     
PK_CURSO                 KEY(CUR:IDCURSO),PRIMARY          !                     
Record                   RECORD,PRE()
IDCURSO                     LONG,NAME('IDCURSO | READONLY') !                     
DESCRIPCION                 CSTRING(51)                    !                     
PRESENCIAL                  CSTRING(3)                     !                     
CANTIDAD_HORAS              PDECIMAL(5,2),NAME('"CANTIDAD_HORAS"') !                     
MONTO_TOTAL                 DECIMAL(9,2),NAME('"MONTO_TOTAL"') !                     
OBSERVACION                 CSTRING(101)                   !                     
ID_TIPO_CURSO               LONG,NAME('"ID_TIPO_CURSO"')   !                     
CANTIDAD                    LONG                           !                     
FECHA_INICIO                DATE,NAME('"FECHA_INICIO"')    !                     
FECHA_FIN                   DATE,NAME('"FECHA_FIN"')       !                     
                         END
                     END                       

CURSO_INSCRIPCION    FILE,DRIVER('ODBC'),OWNER('psrn,sysdba'),NAME('CURSO_INSCRIPCION'),PRE(CURI),BINDABLE,THREAD !                     
IDX_CURSO_INSCRIPCION_FECHA KEY(CURI:FECHA),DUP            !                     
IDX_CONTROL              KEY(CURI:ID_PROVEEDOR,CURI:IDCURSO),NOCASE,OPT !                     
FK_CURSO_INSCRIPCION_CURSO KEY(CURI:IDCURSO),DUP           !                     
FK_CURSO_INSCRIPCION_PROVEEDOR KEY(CURI:ID_PROVEEDOR),DUP  !                     
FK_CURSO_INSCRIPCION_USUARIO KEY(CURI:IDUSUARIO),DUP       !                     
IDX_CURSO_INSCRIPCION_UNIQUE KEY(CURI:ID_PROVEEDOR,CURI:IDCURSO) !                     
PK_CURSO_INSCRIPCION     KEY(CURI:IDINSCRIPCION),PRIMARY   !                     
Record                   RECORD,PRE()
IDINSCRIPCION               LONG                           !                     
ID_PROVEEDOR                LONG,NAME('"ID_PROVEEDOR"')    !                     
IDCURSO                     LONG                           !                     
FECHA                       DATE                           !                     
HORA                        TIME                           !                     
IDUSUARIO                   LONG                           !                     
MONTO_TOTAL                 DECIMAL(9,2),NAME('"MONTO_TOTAL"') !                     
TERMINADO                   CSTRING(3)                     !                     
DESCUENTO                   DECIMAL(9,2)                   !                     
PAGADO_TOTAL                CSTRING(3),NAME('"PAGADO_TOTAL"') !                     
CUOTAS                      LONG                           !                     
MONTO_CUOTA                 REAL,NAME('"MONTO_CUOTA"')     !                     
OBSERVACION                 CSTRING(501)                   !                     
                         END
                     END                       

CURSO_INSCRIPCION_DETALLE FILE,DRIVER('ODBC'),OWNER('psrn,sysdba'),NAME('CURSO_INSCRIPCION_DETALLE'),PRE(CURD),BINDABLE,THREAD !                     
IDX_CURSO_DETALLE_CURSO  KEY(CURD:IDCURSO),DUP             !                     
IDX_CURSO_DETALLE_MODULO KEY(CURD:ID_MODULO),DUP           !                     
IDX_CURSO_DETALLE_PAGADO KEY(CURD:PAGADO),DUP              !                     
IDX_CURSO_DETALLE_SUBCTA KEY(CURD:IDSUBCUENTA),DUP         !                     
FK_CURSO_INSCRIPCION_DETALLE_IN KEY(CURD:IDINSCRIPCION),DUP !                     
PK_CURSO_INSCRIPCION_DETALLE KEY(CURD:IDINSCRIPCION,CURD:IDCURSO,CURD:ID_MODULO),PRIMARY !                     
Record                   RECORD,PRE()
IDINSCRIPCION               LONG                           !                     
IDCURSO                     LONG                           !                     
ID_MODULO                   LONG,NAME('"ID_MODULO"')       !                     
FECHA_INSCRIPCION           DATE,NAME('"FECHA_INSCRIPCION"') !                     
PRESENTE                    CSTRING(3)                     !                     
NOTA                        PDECIMAL(5,2)                  !                     
MONTO                       DECIMAL(9,2)                   !                     
PAGADO                      CSTRING(3)                     !                     
FECHA_PAGO                  DATE,NAME('"FECHA_PAGO"')      !                     
HORA_PAGO                   TIME,NAME('"HORA_PAGO"')       !                     
USUARIO_PAGO                LONG,NAME('"USUARIO_PAGO"')    !                     
IDSUBCUENTA                 LONG                           !                     
DESCUENTO                   DECIMAL(9,2)                   !                     
SUCURSAL                    LONG                           !                     
IDRECIBO                    LONG                           !                     
CANTIDAD_CUOTAS             LONG                           !                     
SALDO_CUOTAS                LONG                           !                     
                         END
                     END                       

CURSO_MODULOS        FILE,DRIVER('ODBC'),OWNER('psrn,sysdba'),NAME('CURSO_MODULOS'),PRE(CUR2),BINDABLE,THREAD !                     
CURSO_MODULOS_DESCRIPCION KEY(CUR2:DESCRIPCION),DUP        !                     
IDX_CONTROL              KEY(CUR2:ID_MODULO,CUR2:IDCURSO),DUP !                     
IDX_MODULO_NUMERO        KEY(CUR2:NUMERO_MODULO),DUP       !                     
FK_CURSO_MODULOS_CURSO   KEY(CUR2:IDCURSO),DUP             !                     
IDX_MODULO_UNIQUE        KEY(CUR2:IDCURSO,CUR2:NUMERO_MODULO) !                     
PK_CURSO_MODULOS         KEY(CUR2:ID_MODULO),PRIMARY       !                     
Record                   RECORD,PRE()
ID_MODULO                   LONG,NAME('ID_MODULO | READONLY') !                     
IDCURSO                     LONG                           !                     
DESCRIPCION                 CSTRING(51)                    !                     
NUMERO_MODULO               LONG,NAME('"NUMERO_MODULO"')   !                     
CANTIDAD_HORAS              LONG,NAME('"CANTIDAD_HORAS"')  !                     
EXAMEN                      CSTRING(3)                     !                     
MONTO                       DECIMAL(9,2)                   !                     
FECHA_INICIO                DATE,NAME('"FECHA_INICIO"')    !                     
FECHA_FIN                   DATE,NAME('"FECHA_FIN"')       !                     
HORA_INICIO                 TIME,NAME('"HORA_INICIO"')     !                     
HORA_FIN                    TIME,NAME('"HORA_FIN"')        !                     
OBSERVACION                 CSTRING(256)                   !                     
                         END
                     END                       

ME                   FILE,DRIVER('ODBC'),OWNER('psrn,sysdba'),NAME('ME'),PRE(ME),BINDABLE,THREAD !                     
IDX_ME_FECHAi            KEY(ME:FECHA),DUP                 !                     
IDX_ME_ORIGEN            KEY(ME:ORIGEN),DUP                !                     
FK_ME_DPTO               KEY(ME:IDDPTO),DUP                !                     
FK_ME_ESTADO             KEY(ME:IDESTADO),DUP              !                     
FK_ME_TIPO               KEY(ME:IDTIPO),DUP                !                     
FK_ME_USUARIO            KEY(ME:IDUSUARIO),DUP             !                     
PK_ME                    KEY(ME:ME),PRIMARY                !                     
Record                   RECORD,PRE()
ME                          LONG,NAME('ME | READONLY')     !                     
FECHA                       DATE                           !                     
NUMERO                      CSTRING(51)                    !                     
ORIGEN                      CSTRING(101)                   !                     
CONTENIDO                   CSTRING(256)                   !                     
ACTIVO                      CSTRING(3)                     !                     
IDESTADO                    LONG                           !                     
IDDPTO                      LONG                           !                     
IDTIPO                      LONG                           !                     
IDUSUARIO                   LONG                           !                     
HORA                        TIME                           !                     
                         END
                     END                       

MEDPTO               FILE,DRIVER('ODBC'),OWNER('psrn,sysdba'),NAME('MEDPTO'),PRE(MED),BINDABLE,THREAD !                     
IDX_MEDPTO_DECRIP        KEY(MED:DESCRIPCION)              !                     
PK_MEDPTO                KEY(MED:IDDPTO),PRIMARY           !                     
Record                   RECORD,PRE()
IDDPTO                      LONG,NAME('IDDPTO | READONLY') !                     
DESCRIPCION                 CSTRING(51)                    !                     
                         END
                     END                       

MEESTADO             FILE,DRIVER('ODBC'),OWNER('psrn,sysdba'),NAME('MEESTADO'),PRE(MEE),BINDABLE,THREAD !                     
IDX_MEESTADO_DESCRIP     KEY(MEE:DESCRIPCION)              !                     
PK_MEESTADO              KEY(MEE:IDESTADO),PRIMARY         !                     
Record                   RECORD,PRE()
IDESTADO                    LONG,NAME('IDESTADO | READONLY') !                     
DESCRIPCION                 CSTRING(51)                    !                     
                         END
                     END                       

MEPASES              FILE,DRIVER('ODBC'),OWNER('psrn,sysdba'),NAME('MEPASES'),PRE(MEP),BINDABLE,THREAD !                     
IDX_MEPASES_DESTINO      KEY(MEP:DPTO_DESTINO),DUP         !                     
IDX_MEPASES_ORIGEN       KEY(MEP:DPTO_ORIGEN),DUP          !                     
PK_MEPASES               KEY(MEP:IDME,MEP:DPTO_ORIGEN,MEP:DPTO_DESTINO),PRIMARY !                     
IDX_MEPASES_ME           KEY(MEP:IDME),DUP,NOCASE,OPT      !                     
IDX_MEPASES_FECHA        KEY(MEP:FECHA),DUP,NOCASE,OPT     !                     
Record                   RECORD,PRE()
IDME                        LONG                           !                     
DPTO_ORIGEN                 LONG,NAME('"DPTO_ORIGEN"')     !                     
DPTO_DESTINO                LONG,NAME('"DPTO_DESTINO"')    !                     
MOTIVO                      CSTRING(101)                   !                     
IDUSUARIO                   LONG                           !                     
FECHA                       DATE                           !                     
HORA                        TIME                           !                     
                         END
                     END                       

METIPO               FILE,DRIVER('ODBC'),OWNER('psrn,sysdba'),NAME('METIPO'),PRE(MET),BINDABLE,THREAD !                     
IDX_METIPO_DESCRIP       KEY(MET:DESCRIPCION)              !                     
PK_METIPO                KEY(MET:IDTIPO),PRIMARY           !                     
Record                   RECORD,PRE()
IDTIPO                      LONG,NAME('IDTIPO | READONLY') !                     
DESCRIPCION                 CSTRING(51)                    !                     
                         END
                     END                       

MS                   FILE,DRIVER('ODBC'),OWNER('psrn,sysdba'),NAME('MS'),PRE(MS),BINDABLE,THREAD !                     
IDX_MS_FECHA             KEY(MS:FECHA),DUP                 !                     
IDX_MS_ORIGEN            KEY(MS:ORIGEN),DUP                !                     
FK_MS_DPTO               KEY(MS:IDDPTO),DUP                !                     
FK_MS_ESTADO             KEY(MS:IDESTADO),DUP              !                     
FK_MS_TIPO               KEY(MS:IDTIPO),DUP                !                     
FK_MS_USUARIO            KEY(MS:IDUSUARIO),DUP             !                     
PK_MS                    KEY(MS:MS),PRIMARY                !                     
IDX_MS_NUMERO            KEY(MS:NUMERO),DUP,NOCASE,OPT     !                     
Record                   RECORD,PRE()
MS                          LONG,NAME('MS | READONLY')     !                     
FECHA                       DATE                           !                     
NUMERO                      CSTRING(51)                    !                     
ORIGEN                      CSTRING(101)                   !                     
CONTENIDO                   CSTRING(256)                   !                     
ACTIVO                      CSTRING(3)                     !                     
IDESTADO                    LONG                           !                     
IDDPTO                      LONG                           !                     
IDTIPO                      LONG                           !                     
IDUSUARIO                   LONG                           !                     
HORA                        TIME                           !                     
                         END
                     END                       

LIQUIDACION_INFORME  FILE,DRIVER('ODBC'),OWNER('psrn,sysdba'),NAME('LIQUIDACION_INFORME'),PRE(LIQINF),BINDABLE,THREAD !                     
PK_LIQUIDACION_INFORME   KEY(LIQINF:IDSOCIO),PRIMARY       !                     
Record                   RECORD,PRE()
IDSOCIO                     LONG                           !                     
NOMBRE                      CSTRING(101)                   !                     
EMAIL                       CSTRING(101)                   !                     
MONTO                       PDECIMAL(9,2)                  !                     
DESC_OS                     PDECIMAL(5,2),NAME('"DESC_OS"') !                     
DEBITO                      PDECIMAL(5,2)                  !                     
SEGURO                      PDECIMAL(5,2)                  !                     
DEBITO_COMISION             PDECIMAL(5,2),NAME('"DEBITO_COMISION"') !                     
DEBITO_PAGO_CUOTA           PDECIMAL(5,2),NAME('"DEBITO_PAGO_CUOTA"') !                     
MONTO_TOTAL                 PDECIMAL(9,2),NAME('"MONTO_TOTAL"') !                     
MENSAJE                     CSTRING(10001)                 !                     
                         END
                     END                       

INGRESOS_FACTURA     FILE,DRIVER('ODBC'),OWNER('psrn,sysdba'),NAME('INGRESOS_FACTURA'),PRE(ING2),BINDABLE,THREAD !                     
IDX_INGRESOS_FACTURA_1   KEY(ING2:FECHA),DUP               !                     
IDX_INGRESOS_FACTURA_2   KEY(ING2:SUCURSAL,ING2:IDRECIBO),DUP !                     
FK_INGRESOS_FACTURA_SOCIO KEY(ING2:IDSOCIO),DUP            !                     
INGRESOS_FACTURA_IDX_CONTROL KEY(ING2:ANO,ING2:IDSOCIO)    !                     
PK_INGRESOS_FACTURA      KEY(ING2:IDINGRESO_FAC),PRIMARY   !                     
Record                   RECORD,PRE()
IDINGRESO_FAC               LONG,NAME('IDINGRESO_FAC | READONLY') !                     
IDSOCIO                     LONG                           !                     
IDSUBCUENTA                 LONG                           !                     
OBSERVACION                 CSTRING(101)                   !                     
MONTO                       PDECIMAL(7,2)                  !                     
FECHA                       DATE                           !                     
HORA                        TIME                           !                     
MES                         LONG                           !                     
ANO                         LONG                           !                     
PERIODO                     CSTRING(8)                     !                     
SUCURSAL                    LONG                           !                     
IDRECIBO                    LONG                           !                     
IDUSUARIO                   LONG                           !                     
MES_HASTA                   LONG,NAME('"MES_HASTA"')       !                     
                         END
                     END                       

PADRON_WEB_OS        FILE,DRIVER('BASIC'),NAME('padron_web_OS.cvs'),PRE(PAD21),CREATE,BINDABLE,THREAD !                     
Record                   RECORD,PRE()
OBRA_SOCIAL                 CSTRING(31),NAME('"NOMPRE_CORTO"') !                     
MATRICULA                   STRING(5)                      !                     
NOMBRE                      CSTRING(101)                   !                     
LOCALIDAD                   CSTRING(51)                    !                     
COD_TEL                     CSTRING(11)                    !                     
TELEFONO_LABORAL            CSTRING(31),NAME('"TELEFONO_LABORAL"') !                     
DIRECCION_LABORAL           CSTRING(51),NAME('"DIRECCION_LABORAL"') !                     
                         END
                     END                       

PADRON_WEB           FILE,DRIVER('BASIC'),NAME('padron_web.cvs'),PRE(PAD2),CREATE,BINDABLE,THREAD !                     
Record                   RECORD,PRE()
MATRICULA                   STRING(5)                      !                     
NOMBRE                      CSTRING(101)                   !                     
LOCALIDAD                   CSTRING(51)                    !                     
COD_TEL                     CSTRING(11)                    !                     
TELEFONO_LABORAL            CSTRING(31),NAME('"TELEFONO_LABORAL"') !                     
DIRECCION_LABORAL           CSTRING(51),NAME('"DIRECCION_LABORAL"') !                     
                         END
                     END                       

SOCIOSAlias          FILE,DRIVER('ODBC'),OWNER('psrn,sysdba'),NAME('SOCIOS'),PRE(SOC1),BINDABLE,THREAD !                     
PK_SOCIOS                KEY(SOC1:IDSOCIO),PRIMARY         !                     
IDX_SOCIOS_DOCUMENTO     KEY(SOC1:N_DOCUMENTO)             !                     
IDX_SOCIOS_MATRICULA     KEY(SOC1:MATRICULA)               !                     
FK_SOCIOS_CIRCULO        KEY(SOC1:IDCIRCULO),DUP           !                     
FK_SOCIOS_COBERTURA      KEY(SOC1:IDCOBERTURA),DUP         !                     
FK_SOCIOS_INSTITUCION    KEY(SOC1:IDINSTITUCION),DUP       !                     
FK_SOCIOS_LOCALIDAD      KEY(SOC1:IDLOCALIDAD),DUP         !                     
FK_SOCIOS_TIPO_DOC       KEY(SOC1:ID_TIPO_DOC),DUP         !                     
FK_SOCIOS_USUARIO        KEY(SOC1:IDUSUARIO),DUP           !                     
FK_SOCIOS_ZONA_VIVENDA   KEY(SOC1:IDZONA),DUP              !                     
IDX_SOCIOS_ACTA          KEY(SOC1:ACTA),DUP                !                     
IDX_SOCIOS_BAJA          KEY(SOC1:BAJA),DUP                !                     
IDX_SOCIOS_LIBRO         KEY(SOC1:LIBRO),DUP               !                     
IDX_SOCIOS_NOMBRE        KEY(SOC1:NOMBRE),DUP              !                     
IDX_SOCIOS_N_VIEJO       KEY(SOC1:NRO_VIEJO),DUP           !                     
IDX_SOCIOS_PROVISORIO    KEY(SOC1:PROVISORIO),DUP          !                     
IDX_SOCIO_INGRESO        KEY(SOC1:INGRESO),DUP             !                     
FK_SOCIOS_TIPO_TITULO    KEY(SOC1:IDTIPOTITULO),DUP        !                     
IDX_SOCIOS_MINISTERIO    KEY(SOC1:IDMINISTERIO),DUP        !                     
SOCIOS_CENTRO_SALUD      KEY(SOC1:IDCS),DUP                !                     
IDX_SOCIOS_PROVEEDOR     KEY(SOC1:IDPROVEEDOR),DUP         !                     
FK_SOCIOS_TIPO_IVA       KEY(SOC1:TIPOIVA),DUP,NOCASE,OPT  !                     
FK_SOCIOS_BANCO          KEY(SOC1:IDBANCO),DUP             !                     
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

LIQUIDACIONAlias     FILE,DRIVER('ODBC'),OWNER('psrn,sysdba'),NAME('LIQUIDACION'),PRE(LIQ1),BINDABLE,THREAD !                     
PK_LIQUIDACION           KEY(LIQ1:IDLIQUIDACION),PRIMARY   !                     
IDX_LIQUIDACION_ANO      KEY(LIQ1:ANO),DUP                 !                     
IDX_LIQUIDACION_FECHA_CARGA KEY(LIQ1:FECHA_CARGA),DUP      !                     
IDX_LIQUIDACION_FECHA_PAGO KEY(LIQ1:FECHA_PAGO),DUP        !                     
IDX_LIQUIDACION_FECHA_PRESENTAC KEY(LIQ1:FECHA_PRESENTACION),DUP !                     
IDX_LIQUIDACION_MES      KEY(LIQ1:MES),DUP                 !                     
IDX_LIQUIDACION_PERIODO  KEY(LIQ1:PERIODO),DUP             !                     
FK_LIQUIDACION_FORMA_PAGO KEY(LIQ1:IDFORMA_PAGO),DUP       !                     
FK_LIQUIDACION_OS        KEY(LIQ1:IDOS),DUP                !                     
FK_LIQUIDACION_SOCIO     KEY(LIQ1:IDSOCIO),DUP             !                     
IDX_LIQUIDACION_UNIQUE   KEY(LIQ1:PERIODO,LIQ1:TIPO_PERIODO,LIQ1:IDSOCIO,LIQ1:IDOS),DUP !                     
IDX_LIQUIDACION_PRESENTADO KEY(LIQ1:PRESENTADO),DUP        !                     
IDX_LIQUIDACION_COBRADO  KEY(LIQ1:COBRADO),DUP             !                     
IDX_LIQUIDACION_PAGADO   KEY(LIQ1:PAGADO),DUP              !                     
FK_USUARIO               KEY(LIQ1:IDUSUARIO),DUP           !                     
IDX_LIQUIDACION_PAGO     KEY(LIQ1:IDPAGO_LIQUIDACION),DUP,NOCASE,OPT !                     
Record                   RECORD,PRE()
IDLIQUIDACION               LONG                           !                     
IDSOCIO                     LONG                           !                     
IDOS                        LONG                           !                     
MES                         LONG                           !                     
ANO                         LONG                           !                     
PERIODO                     CSTRING(7)                     !                     
TIPO_PERIODO                CSTRING(31),NAME('"TIPO_PERIODO"') !                     
MONTO                       REAL                           !                     
FECHA_CARGA                 DATE,NAME('"FECHA_CARGA"')     !                     
FECHA_PRESENTACION          DATE,NAME('"FECHA_PRESENTACION"') !                     
FECHA_COBRO                 DATE                           !                     
FECHA_PAGO                  DATE,NAME('"FECHA_PAGO"')      !                     
MONTO_PAGADO                REAL,NAME('"MONTO_PAGADO"')    !                     
IDFORMA_PAGO                LONG                           !                     
DEBITO                      REAL                           !                     
COMISION                    REAL                           !                     
CANTIDAD                    LONG                           !                     
DEBITO_COMISION             REAL                           !                     
CANTIDAD_CUOTAS_PAGADAS     LONG                           !                     
DEBITO_PAGO_CUOTAS          REAL                           !                     
MONTO_TOTAL                 REAL                           !                     
PRESENTADO                  CSTRING(3)                     !                     
COBRADO                     CSTRING(3)                     !                     
PAGADO                      CSTRING(3)                     !                     
IDUSUARIO                   LONG                           !                     
USUARIO_PAGO                LONG                           !                     
IDPAGO_LIQUIDACION          LONG                           !                     
SOCIOS_LIQUIDACION          LONG                           !                     
                         END
                     END                       

PAGOS_LIQUIDACIONAlias FILE,DRIVER('ODBC'),OWNER('psrn,sysdba'),NAME('PAGOS_LIQUIDACION'),PRE(PAGL1),BINDABLE,THREAD !                     
FK_PAGOS_LIQUIDACION_SOCIOS KEY(PAGL1:IDSOCIO),DUP         !                     
PK_PAGOS_LIQUIDACION     KEY(PAGL1:IDPAGOS),PRIMARY        !                     
FK_PAGOS_LIQUIDACION_USUARIOS KEY(PAGL1:IDUSUARIO),DUP,NOCASE,OPT !                     
IDX_PAGOS_LIQUIDACION_PAGO KEY(PAGL1:IDLIQUIDACION),DUP,NOCASE,OPT !                     
Record                   RECORD,PRE()
IDPAGOS                     LONG,NAME('IDPAGOS | READONLY') !                     
IDSOCIO                     LONG                           !                     
SUCURSAL                    LONG                           !                     
IDLIQUIDACION               LONG                           !                     
MONTO                       REAL                           !                     
FECHA                       DATE                           !                     
HORA                        TIME                           !                     
MES                         CSTRING(3)                     !                     
ANO                         CSTRING(5)                     !                     
PERIODO                     LONG                           !                     
IDUSUARIO                   LONG                           !                     
IDRECIBO                    LONG                           !                     
MONTO_FACTURA               REAL,NAME('"MONTO_FACTURA"')   !                     
INTERES_FACTURA             PDECIMAL(5,2),NAME('"INTERES_FACTURA"') !                     
IDSUBCUENTA                 LONG                           !                     
AFECTADA                    CSTRING(3)                     !                     
DEBITO                      REAL                           !                     
CUOTA                       PDECIMAL(7,2)                  !                     
CANT_CUOTA                  LONG                           !                     
SEGURO                      PDECIMAL(7,2)                  !                     
CANT_CUOTA_S                LONG                           !                     
GASTOS_ADM                  PDECIMAL(7,2)                  !                     
IMP_CHEQUE                  PDECIMAL(7,2)                  !                     
MONTO_IMP_CHEQUE            PDECIMAL(7,2)                  !                     
MONTO_IMP_DEBITO            PDECIMAL(7,2)                  !                     
MONTO_IMP_TOTAL             PDECIMAL(7,2)                  !                     
CREDITO                     PDECIMAL(7,2)                  !                     
SOCIOS_LIQUIDACION          LONG                           !                     
GASTOS_BANCARIOS            REAL                           !                     
                         END
                     END                       

!endregion

DbAudit              CLASS(DbAuditManager),THREAD          ! DataBase Audit Manager
Construct              PROCEDURE()
                     END

DbChangeTrigger      CLASS(DbChangeManager),THREAD         ! DataBase Change Trigger Manager
Construct              PROCEDURE()
                     END

GlobalVariabls    Group,Pre(Glo)
MAPI_Session_Number   ULong(0)
MessageID             String(255)
                  End
GOL::SALIDA    STRING(2000)
gol_outhtml               FILE,DRIVER('ASCII'),NAME(GOL::SALIDA),PRE(SalG),CREATE,BINDABLE,THREAD
Record                   RECORD,PRE()
Linea                       STRING(5000)
                         END
                     END
Access:CIRCULO       &FileManager,THREAD                   ! FileManager for CIRCULO
Relate:CIRCULO       &RelationManager,THREAD               ! RelationManager for CIRCULO
Access:CUMPLE        &FileManager,THREAD                   ! FileManager for CUMPLE
Relate:CUMPLE        &RelationManager,THREAD               ! RelationManager for CUMPLE
Access:FACTURA_CONVENIO &FileManager,THREAD                ! FileManager for FACTURA_CONVENIO
Relate:FACTURA_CONVENIO &RelationManager,THREAD            ! RelationManager for FACTURA_CONVENIO
Access:INFORME       &FileManager,THREAD                   ! FileManager for INFORME
Relate:INFORME       &RelationManager,THREAD               ! RelationManager for INFORME
Access:CURSO_CUOTA   &FileManager,THREAD                   ! FileManager for CURSO_CUOTA
Relate:CURSO_CUOTA   &RelationManager,THREAD               ! RelationManager for CURSO_CUOTA
Access:EXP_CURSO_INSCRIPCION &FileManager,THREAD           ! FileManager for EXP_CURSO_INSCRIPCION
Relate:EXP_CURSO_INSCRIPCION &RelationManager,THREAD       ! RelationManager for EXP_CURSO_INSCRIPCION
Access:LIQUIDACION_CODIGO &FileManager,THREAD              ! FileManager for LIQUIDACION_CODIGO
Relate:LIQUIDACION_CODIGO &RelationManager,THREAD          ! RelationManager for LIQUIDACION_CODIGO
Access:PAGOS_LIQUIDACION &FileManager,THREAD               ! FileManager for PAGOS_LIQUIDACION
Relate:PAGOS_LIQUIDACION &RelationManager,THREAD           ! RelationManager for PAGOS_LIQUIDACION
Access:EMAILS        &FileManager,THREAD                   ! FileManager for EMAILS
Relate:EMAILS        &RelationManager,THREAD               ! RelationManager for EMAILS
Access:BANCO_DEBITO  &FileManager,THREAD                   ! FileManager for BANCO_DEBITO
Relate:BANCO_DEBITO  &RelationManager,THREAD               ! RelationManager for BANCO_DEBITO
Access:MCENTRO_SALUD &FileManager,THREAD                   ! FileManager for MCENTRO_SALUD
Relate:MCENTRO_SALUD &RelationManager,THREAD               ! RelationManager for MCENTRO_SALUD
Access:CONF_EMP      &FileManager,THREAD                   ! FileManager for CONF_EMP
Relate:CONF_EMP      &RelationManager,THREAD               ! RelationManager for CONF_EMP
Access:FONDOS        &FileManager,THREAD                   ! FileManager for FONDOS
Relate:FONDOS        &RelationManager,THREAD               ! RelationManager for FONDOS
Access:TIPO_COBERTURA &FileManager,THREAD                  ! FileManager for TIPO_COBERTURA
Relate:TIPO_COBERTURA &RelationManager,THREAD              ! RelationManager for TIPO_COBERTURA
Access:SQL           &FileManager,THREAD                   ! FileManager for SQL
Relate:SQL           &RelationManager,THREAD               ! RelationManager for SQL
Access:PAGO_CONVENIO &FileManager,THREAD                   ! FileManager for PAGO_CONVENIO
Relate:PAGO_CONVENIO &RelationManager,THREAD               ! RelationManager for PAGO_CONVENIO
Access:CONSULTRIO_ADHERENTE &FileManager,THREAD            ! FileManager for CONSULTRIO_ADHERENTE
Relate:CONSULTRIO_ADHERENTE &RelationManager,THREAD        ! RelationManager for CONSULTRIO_ADHERENTE
Access:AUDITORIA     &FileManager,THREAD                   ! FileManager for AUDITORIA
Relate:AUDITORIA     &RelationManager,THREAD               ! RelationManager for AUDITORIA
Access:CONTROL_LIQUIDACION &FileManager,THREAD             ! FileManager for CONTROL_LIQUIDACION
Relate:CONTROL_LIQUIDACION &RelationManager,THREAD         ! RelationManager for CONTROL_LIQUIDACION
Access:EMAIL         &FileManager,THREAD                   ! FileManager for EMAIL
Relate:EMAIL         &RelationManager,THREAD               ! RelationManager for EMAIL
Access:RANKING       &FileManager,THREAD                   ! FileManager for RANKING
Relate:RANKING       &RelationManager,THREAD               ! RelationManager for RANKING
Access:CONTROL_CUOTA &FileManager,THREAD                   ! FileManager for CONTROL_CUOTA
Relate:CONTROL_CUOTA &RelationManager,THREAD               ! RelationManager for CONTROL_CUOTA
Access:EXP_CURSO_INSCRIPCION_DETALLE &FileManager,THREAD   ! FileManager for EXP_CURSO_INSCRIPCION_DETALLE
Relate:EXP_CURSO_INSCRIPCION_DETALLE &RelationManager,THREAD ! RelationManager for EXP_CURSO_INSCRIPCION_DETALLE
Access:EXP_INGRESOS  &FileManager,THREAD                   ! FileManager for EXP_INGRESOS
Relate:EXP_INGRESOS  &RelationManager,THREAD               ! RelationManager for EXP_INGRESOS
Access:COBERTURA     &FileManager,THREAD                   ! FileManager for COBERTURA
Relate:COBERTURA     &RelationManager,THREAD               ! RelationManager for COBERTURA
Access:CONSULTORIO   &FileManager,THREAD                   ! FileManager for CONSULTORIO
Relate:CONSULTORIO   &RelationManager,THREAD               ! RelationManager for CONSULTORIO
Access:CONTROL_FACTURA &FileManager,THREAD                 ! FileManager for CONTROL_FACTURA
Relate:CONTROL_FACTURA &RelationManager,THREAD             ! RelationManager for CONTROL_FACTURA
Access:CONVENIO      &FileManager,THREAD                   ! FileManager for CONVENIO
Relate:CONVENIO      &RelationManager,THREAD               ! RelationManager for CONVENIO
Access:CONVENIO_DETALLE &FileManager,THREAD                ! FileManager for CONVENIO_DETALLE
Relate:CONVENIO_DETALLE &RelationManager,THREAD            ! RelationManager for CONVENIO_DETALLE
Access:CV            &FileManager,THREAD                   ! FileManager for CV
Relate:CV            &RelationManager,THREAD               ! RelationManager for CV
Access:DETALLE_FACTURA &FileManager,THREAD                 ! FileManager for DETALLE_FACTURA
Relate:DETALLE_FACTURA &RelationManager,THREAD             ! RelationManager for DETALLE_FACTURA
Access:ESPECIALIDAD  &FileManager,THREAD                   ! FileManager for ESPECIALIDAD
Relate:ESPECIALIDAD  &RelationManager,THREAD               ! RelationManager for ESPECIALIDAD
Access:FACTURA       &FileManager,THREAD                   ! FileManager for FACTURA
Relate:FACTURA       &RelationManager,THREAD               ! RelationManager for FACTURA
Access:INSPECTOR     &FileManager,THREAD                   ! FileManager for INSPECTOR
Relate:INSPECTOR     &RelationManager,THREAD               ! RelationManager for INSPECTOR
Access:INSTITUCION   &FileManager,THREAD                   ! FileManager for INSTITUCION
Relate:INSTITUCION   &RelationManager,THREAD               ! RelationManager for INSTITUCION
Access:TIPO_COMPROBANTE &FileManager,THREAD                ! FileManager for TIPO_COMPROBANTE
Relate:TIPO_COMPROBANTE &RelationManager,THREAD            ! RelationManager for TIPO_COMPROBANTE
Access:LOCALIDAD     &FileManager,THREAD                   ! FileManager for LOCALIDAD
Relate:LOCALIDAD     &RelationManager,THREAD               ! RelationManager for LOCALIDAD
Access:PADRONXESPECIALIDAD &FileManager,THREAD             ! FileManager for PADRONXESPECIALIDAD
Relate:PADRONXESPECIALIDAD &RelationManager,THREAD         ! RelationManager for PADRONXESPECIALIDAD
Access:EXP_PROVEEDORES &FileManager,THREAD                 ! FileManager for EXP_PROVEEDORES
Relate:EXP_PROVEEDORES &RelationManager,THREAD             ! RelationManager for EXP_PROVEEDORES
Access:PAGOS         &FileManager,THREAD                   ! FileManager for PAGOS
Relate:PAGOS         &RelationManager,THREAD               ! RelationManager for PAGOS
Access:PAIS          &FileManager,THREAD                   ! FileManager for PAIS
Relate:PAIS          &RelationManager,THREAD               ! RelationManager for PAIS
Access:PERIODO_FACTURA &FileManager,THREAD                 ! FileManager for PERIODO_FACTURA
Relate:PERIODO_FACTURA &RelationManager,THREAD             ! RelationManager for PERIODO_FACTURA
Access:RENUNCIA      &FileManager,THREAD                   ! FileManager for RENUNCIA
Relate:RENUNCIA      &RelationManager,THREAD               ! RelationManager for RENUNCIA
Access:MINESP        &FileManager,THREAD                   ! FileManager for MINESP
Relate:MINESP        &RelationManager,THREAD               ! RelationManager for MINESP
Access:LIQUIDACIONXSOCIO &FileManager,THREAD               ! FileManager for LIQUIDACIONXSOCIO
Relate:LIQUIDACIONXSOCIO &RelationManager,THREAD           ! RelationManager for LIQUIDACIONXSOCIO
Access:LIQUIDACION_DISKETTE &FileManager,THREAD            ! FileManager for LIQUIDACION_DISKETTE
Relate:LIQUIDACION_DISKETTE &RelationManager,THREAD        ! RelationManager for LIQUIDACION_DISKETTE
Access:MINISTERIO    &FileManager,THREAD                   ! FileManager for MINISTERIO
Relate:MINISTERIO    &RelationManager,THREAD               ! RelationManager for MINISTERIO
Access:MINSALUD      &FileManager,THREAD                   ! FileManager for MINSALUD
Relate:MINSALUD      &RelationManager,THREAD               ! RelationManager for MINSALUD
Access:SERVICIOS     &FileManager,THREAD                   ! FileManager for SERVICIOS
Relate:SERVICIOS     &RelationManager,THREAD               ! RelationManager for SERVICIOS
Access:SERVICIOXSOCIO &FileManager,THREAD                  ! FileManager for SERVICIOXSOCIO
Relate:SERVICIOXSOCIO &RelationManager,THREAD              ! RelationManager for SERVICIOXSOCIO
Access:SOCIOS        &FileManager,THREAD                   ! FileManager for SOCIOS
Relate:SOCIOS        &RelationManager,THREAD               ! RelationManager for SOCIOS
Access:TIPO_CONVENIO &FileManager,THREAD                   ! FileManager for TIPO_CONVENIO
Relate:TIPO_CONVENIO &RelationManager,THREAD               ! RelationManager for TIPO_CONVENIO
Access:PAGOSXCIRCULO &FileManager,THREAD                   ! FileManager for PAGOSXCIRCULO
Relate:PAGOSXCIRCULO &RelationManager,THREAD               ! RelationManager for PAGOSXCIRCULO
Access:TIPO_CURSO    &FileManager,THREAD                   ! FileManager for TIPO_CURSO
Relate:TIPO_CURSO    &RelationManager,THREAD               ! RelationManager for TIPO_CURSO
Access:TIPO_DOC      &FileManager,THREAD                   ! FileManager for TIPO_DOC
Relate:TIPO_DOC      &RelationManager,THREAD               ! RelationManager for TIPO_DOC
Access:TIPO_INSTITUCION &FileManager,THREAD                ! FileManager for TIPO_INSTITUCION
Relate:TIPO_INSTITUCION &RelationManager,THREAD            ! RelationManager for TIPO_INSTITUCION
Access:LIQUIDACION_ENTREGA_BANCO &FileManager,THREAD       ! FileManager for LIQUIDACION_ENTREGA_BANCO
Relate:LIQUIDACION_ENTREGA_BANCO &RelationManager,THREAD   ! RelationManager for LIQUIDACION_ENTREGA_BANCO
Access:USUARIO       &FileManager,THREAD                   ! FileManager for USUARIO
Relate:USUARIO       &RelationManager,THREAD               ! RelationManager for USUARIO
Access:ZONA_VIVIENDA &FileManager,THREAD                   ! FileManager for ZONA_VIVIENDA
Relate:ZONA_VIVIENDA &RelationManager,THREAD               ! RelationManager for ZONA_VIVIENDA
Access:CONSULTORIO_EQUIPO &FileManager,THREAD              ! FileManager for CONSULTORIO_EQUIPO
Relate:CONSULTORIO_EQUIPO &RelationManager,THREAD          ! RelationManager for CONSULTORIO_EQUIPO
Access:TIPO_EQUIPO   &FileManager,THREAD                   ! FileManager for TIPO_EQUIPO
Relate:TIPO_EQUIPO   &RelationManager,THREAD               ! RelationManager for TIPO_EQUIPO
Access:FACTURAXCUPON &FileManager,THREAD                   ! FileManager for FACTURAXCUPON
Relate:FACTURAXCUPON &RelationManager,THREAD               ! RelationManager for FACTURAXCUPON
Access:LOTE          &FileManager,THREAD                   ! FileManager for LOTE
Relate:LOTE          &RelationManager,THREAD               ! RelationManager for LOTE
Access:CAJA          &FileManager,THREAD                   ! FileManager for CAJA
Relate:CAJA          &RelationManager,THREAD               ! RelationManager for CAJA
Access:CUENTAS       &FileManager,THREAD                   ! FileManager for CUENTAS
Relate:CUENTAS       &RelationManager,THREAD               ! RelationManager for CUENTAS
Access:GASTOS        &FileManager,THREAD                   ! FileManager for GASTOS
Relate:GASTOS        &RelationManager,THREAD               ! RelationManager for GASTOS
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
Access:SOCIOSXTRABAJO &FileManager,THREAD                  ! FileManager for SOCIOSXTRABAJO
Relate:SOCIOSXTRABAJO &RelationManager,THREAD              ! RelationManager for SOCIOSXTRABAJO
Access:TRABAJO       &FileManager,THREAD                   ! FileManager for TRABAJO
Relate:TRABAJO       &RelationManager,THREAD               ! RelationManager for TRABAJO
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
Access:OBRA_SOCIAL   &FileManager,THREAD                   ! FileManager for OBRA_SOCIAL
Relate:OBRA_SOCIAL   &RelationManager,THREAD               ! RelationManager for OBRA_SOCIAL
Access:OS_PLANES     &FileManager,THREAD                   ! FileManager for OS_PLANES
Relate:OS_PLANES     &RelationManager,THREAD               ! RelationManager for OS_PLANES
Access:SOCIOSXOS     &FileManager,THREAD                   ! FileManager for SOCIOSXOS
Relate:SOCIOSXOS     &RelationManager,THREAD               ! RelationManager for SOCIOSXOS
Access:FORMA_PAGO    &FileManager,THREAD                   ! FileManager for FORMA_PAGO
Relate:FORMA_PAGO    &RelationManager,THREAD               ! RelationManager for FORMA_PAGO
Access:LIQUIDACION   &FileManager,THREAD                   ! FileManager for LIQUIDACION
Relate:LIQUIDACION   &RelationManager,THREAD               ! RelationManager for LIQUIDACION
Access:SEGURO        &FileManager,THREAD                   ! FileManager for SEGURO
Relate:SEGURO        &RelationManager,THREAD               ! RelationManager for SEGURO
Access:SEGURO_FACTURA &FileManager,THREAD                  ! FileManager for SEGURO_FACTURA
Relate:SEGURO_FACTURA &RelationManager,THREAD              ! RelationManager for SEGURO_FACTURA
Access:TIPO_SEGURO   &FileManager,THREAD                   ! FileManager for TIPO_SEGURO
Relate:TIPO_SEGURO   &RelationManager,THREAD               ! RelationManager for TIPO_SEGURO
Access:NOMENCLADOR   &FileManager,THREAD                   ! FileManager for NOMENCLADOR
Relate:NOMENCLADOR   &RelationManager,THREAD               ! RelationManager for NOMENCLADOR
Access:NOMENCLADORXOS &FileManager,THREAD                  ! FileManager for NOMENCLADORXOS
Relate:NOMENCLADORXOS &RelationManager,THREAD              ! RelationManager for NOMENCLADORXOS
Access:CURSO         &FileManager,THREAD                   ! FileManager for CURSO
Relate:CURSO         &RelationManager,THREAD               ! RelationManager for CURSO
Access:CURSO_INSCRIPCION &FileManager,THREAD               ! FileManager for CURSO_INSCRIPCION
Relate:CURSO_INSCRIPCION &RelationManager,THREAD           ! RelationManager for CURSO_INSCRIPCION
Access:CURSO_INSCRIPCION_DETALLE &FileManager,THREAD       ! FileManager for CURSO_INSCRIPCION_DETALLE
Relate:CURSO_INSCRIPCION_DETALLE &RelationManager,THREAD   ! RelationManager for CURSO_INSCRIPCION_DETALLE
Access:CURSO_MODULOS &FileManager,THREAD                   ! FileManager for CURSO_MODULOS
Relate:CURSO_MODULOS &RelationManager,THREAD               ! RelationManager for CURSO_MODULOS
Access:ME            &FileManager,THREAD                   ! FileManager for ME
Relate:ME            &RelationManager,THREAD               ! RelationManager for ME
Access:MEDPTO        &FileManager,THREAD                   ! FileManager for MEDPTO
Relate:MEDPTO        &RelationManager,THREAD               ! RelationManager for MEDPTO
Access:MEESTADO      &FileManager,THREAD                   ! FileManager for MEESTADO
Relate:MEESTADO      &RelationManager,THREAD               ! RelationManager for MEESTADO
Access:MEPASES       &FileManager,THREAD                   ! FileManager for MEPASES
Relate:MEPASES       &RelationManager,THREAD               ! RelationManager for MEPASES
Access:METIPO        &FileManager,THREAD                   ! FileManager for METIPO
Relate:METIPO        &RelationManager,THREAD               ! RelationManager for METIPO
Access:MS            &FileManager,THREAD                   ! FileManager for MS
Relate:MS            &RelationManager,THREAD               ! RelationManager for MS
Access:LIQUIDACION_INFORME &FileManager,THREAD             ! FileManager for LIQUIDACION_INFORME
Relate:LIQUIDACION_INFORME &RelationManager,THREAD         ! RelationManager for LIQUIDACION_INFORME
Access:INGRESOS_FACTURA &FileManager,THREAD                ! FileManager for INGRESOS_FACTURA
Relate:INGRESOS_FACTURA &RelationManager,THREAD            ! RelationManager for INGRESOS_FACTURA
Access:PADRON_WEB_OS &FileManager,THREAD                   ! FileManager for PADRON_WEB_OS
Relate:PADRON_WEB_OS &RelationManager,THREAD               ! RelationManager for PADRON_WEB_OS
Access:PADRON_WEB    &FileManager,THREAD                   ! FileManager for PADRON_WEB
Relate:PADRON_WEB    &RelationManager,THREAD               ! RelationManager for PADRON_WEB
Access:SOCIOSAlias   &FileManager,THREAD                   ! FileManager for SOCIOSAlias
Relate:SOCIOSAlias   &RelationManager,THREAD               ! RelationManager for SOCIOSAlias
Access:LIQUIDACIONAlias &FileManager,THREAD                ! FileManager for LIQUIDACIONAlias
Relate:LIQUIDACIONAlias &RelationManager,THREAD            ! RelationManager for LIQUIDACIONAlias
Access:PAGOS_LIQUIDACIONAlias &FileManager,THREAD          ! FileManager for PAGOS_LIQUIDACIONAlias
Relate:PAGOS_LIQUIDACIONAlias &RelationManager,THREAD      ! RelationManager for PAGOS_LIQUIDACIONAlias

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
  INIMgr.Init('.\Gestion.INI', NVD_INI)                    ! Configure INIManager to use INI file
  DctInit
                             ! Begin Generated by NetTalk Extension Template
    if ~command ('/netnolog') and (command ('/nettalklog') or command ('/nettalklogerrors') or command ('/neterrors') or command ('/netall'))
      NetDebugTrace ('[Nettalk Template] NetTalk Template version 8.71')
      NetDebugTrace ('[Nettalk Template] NetTalk Template using Clarion ' & 10000)
      NetDebugTrace ('[Nettalk Template] NetTalk Object version ' & NETTALK:VERSION )
      NetDebugTrace ('[Nettalk Template] ABC Template Chain')
    end
                             ! End Generated by Extension Template
  SYSTEM{PROP:Icon} = 'Logo.ico'
  Main
  INIMgr.Update
                             ! Begin Generated by NetTalk Extension Template
    NetCloseCallBackWindow() ! Tell NetTalk DLL to shutdown it's WinSock Call Back Window
  
    if ~command ('/netnolog') and (command ('/nettalklog') or command ('/nettalklogerrors') or command ('/neterrors') or command ('/netall'))
      NetDebugTrace ('[Nettalk Template] NetTalk Template version 8.71')
      NetDebugTrace ('[Nettalk Template] NetTalk Template using Clarion ' & 10000)
      NetDebugTrace ('[Nettalk Template] Closing Down NetTalk (Object) version ' & NETTALK:VERSION)
    end
                             ! End Generated by Extension Template
  INIMgr.Kill                                              ! Destroy INI manager
  FuzzyMatcher.Kill                                        ! Destroy fuzzy matcher
    

DbAudit.Construct PROCEDURE

  CODE
  SELF.Init(GlobalErrors)
  SELF.AddLogFile('PAGOS','PAGOS.log')
  SELF.AddItem('PAGOS','PAG:IDPAGOS',PAG:IDPAGOS,'IDPAGOS','@n-14')
  SELF.AddItem('PAGOS','PAG:IDSOCIO',PAG:IDSOCIO,'IDSOCIO','@n-14')
  SELF.AddItem('PAGOS','PAG:MES',PAG:MES,'MES','@s2')
  SELF.AddItem('PAGOS','PAG:ANO',PAG:ANO,'ANO','@s4')
  SELF.AddItem('PAGOS','PAG:MONTO',PAG:MONTO,'MONTO','@n-7.2')
  SELF.AddItem('PAGOS','PAG:FECHA',PAG:FECHA,'FECHA','@d17')
  SELF.AddLogFile('SOCIOS','SOCIOS.log')
  SELF.AddItem('SOCIOS','SOC:IDSOCIO',SOC:IDSOCIO,'IDSOCIO','@n-14')
  SELF.AddItem('SOCIOS','SOC:MATRICULA',SOC:MATRICULA,'MATRICULA','@n-14')
  SELF.AddItem('SOCIOS','SOC:NOMBRE',SOC:NOMBRE,'NOMBRE','@s30')
  SELF.AddItem('SOCIOS','SOC:IDUSUARIO',SOC:IDUSUARIO,'IDUSUARIO','@n-14')
  SELF.AddItem('SOCIOS','SOC:FECHA_ALTA',SOC:FECHA_ALTA,'FECHA ALTA','@d17')


DbChangeTrigger.Construct PROCEDURE

  CODE
  SELF.Init(DbAudit.IDbChangeAudit)

!---------------------------------------------------------------------------
PKSNumTexto  FUNCTION(Nro)
Texto        String(170)
Valor        String(@N_11.2)

U          STRING('Un    Dos   Tres  CuatroCinco Seis  Siete Ocho  Nueve ')
D          string('Diez      Once      Doce      Trece     Catorce   Quince'|
            & '    Dieciseis DiecisieteDieciocho Diecinueve')
V          string('Veintiuno   Veintidos   Veintitres  VeinticuatroVeinticinco '|
            & 'Veintiseis  Veintisiete Veintiocho  Veintinueve')
C          string('Veinte   Treinta  Cuarenta CincuentaSesenta  Setenta'|
            &'  Ochenta  Noventa  ')
UM         string('Ciento       Doscientos   Trescientos  Cuatrocientos'|
            &'Quinientos   Seiscientos  Setecientos  Ochocientos  '|
            &'Novecientos  ')

  CODE

  IF Nro = 0 THEN RETURN('').
  Valor = Nro

  Texto = ''
  IF SUB(Valor,-11,1) = 1                ! 10 - 19 Millones
    Texto = SUB(D,(((SUB(Valor,-10,1))*10)+1),10)
  ELSIF SUB(Valor,-11,1) = 2 AND SUB(Valor,-10,1) = 0 ! 20 - 99 Millones
    Texto = SUB(C,(((SUB(Valor,-11,1)-2)*9)+1),9)
  ELSIF SUB(Valor,-11,1) = 2 AND SUB(Valor,-10,1) = 1 ! 20 - 99 Millones
    Texto = SUB(v,(((SUB(Valor,-10,1)-1)*12)+1),8)
  ELSIF SUB(Valor,-11,1) = 2 AND SUB(Valor,-10,1) > 1 ! 20 - 99 Millones
    Texto = SUB(v,(((SUB(Valor,-10,1)-1)*12)+1),12)
  ELSIF SUB(Valor,-11,1) > 2             ! 20 - 99 Millones
    Texto = SUB(C,(((SUB(Valor,-11,1)-2)*9)+1),9)
    IF SUB(Valor,-10,1) > 0          ! 2? - 9? Millones
      Texto = CLIP(Texto) &' y ' &SUB(U,(((SUB(Valor,-10,1)-1)*6)+1),6)
    .
  ELSE
    IF SUB(Valor,-10,1) > 0          !  1 -  9 Mil
      Texto = SUB(U,(((SUB(Valor,-10,1)-1)*6)+1),6)
  . .
  IF CLIP(Texto) <> ''
    IF SUB(Valor,-11,1) = 0 AND  SUB(Valor,-10,1) = 1
      Texto = clip(Texto) &' Millon '
    ELSE
      Texto = clip(Texto) &' Millones '
  .   .
  IF SUB(Valor,-9,1) > 0
    Texto = CLIP(Texto) &' ' &CLIP(SUB(UM,(((SUB(Valor,-9,1)-1)*13)+1),13))
  .
  IF SUB(Valor,-8,1) = 1                 ! 10 - 19 Mil
    Texto = CLIP(Texto) &' ' &CLIP(SUB(D,(((SUB(Valor,-7,1))*10)+1),10))
  ELSIF SUB(Valor,-8,1) = 2 AND SUB(Valor,-7,1) = 0  ! 20 - 99 Mil
    Texto = CLIP(Texto) &' ' &CLIP(SUB(C,(((SUB(Valor,-8,1)-2)*9)+1),9))
  ELSIF SUB(Valor,-8,1) = 2 AND SUB(Valor,-7,1) = 1  ! 20 - 99 Mil
    Texto = CLIP(Texto) &' ' &CLIP(SUB(v,(((SUB(Valor,-7,1)-1)*12)+1),8))
  ELSIF SUB(Valor,-8,1) = 2 AND SUB(Valor,-7,1) > 1  ! 20 - 99 Mil
    Texto = CLIP(Texto) &' ' &CLIP(SUB(v,(((SUB(Valor,-7,1)-1)*12)+1),12))
  ELSIF SUB(Valor,-8,1) > 2          ! 20 - 99 Mil
    Texto = CLIP(Texto) &' ' &CLIP(SUB(C,(((SUB(Valor,-8,1)-2)*9)+1),9))
    IF SUB(Valor,-7,1) > 0           ! 2? - 9? Mil
      Texto = CLIP(Texto) &' y ' &SUB(U,(((SUB(Valor,-7,1)-1)*6)+1),6)
    .
  ELSE
    IF SUB(Valor,-7,1) > 0           !  1 -  9 Mil
      Texto = CLIP(Texto) &' ' &CLIP(SUB(U,(((SUB(Valor,-7,1)-1)*6)+1),6))
  .  .
  IF SUB(Valor,-9,1) <> 0 OR SUB(Valor,-8,1) <> 0 OR SUB(Valor,-7,1) <> 0
    Texto = clip(Texto) &' Mil     '.
  IF SUB(Valor,-6,1) > 0
    Texto = CLIP(Texto) &' ' &CLIP(SUB(UM,(((SUB(Valor,-6,1)-1)*13)+1),13))
  .
  IF SUB(Valor,-5,1) = 1
    Texto = CLIP(Texto) &' ' &SUB(D,((SUB(Valor,-4,1)*10)+1),10).
  IF SUB(Valor,-5,1) = 2    AND SUB(Valor,-4,1) = 0
    Texto = CLIP(Texto) &' ' &SUB(C,(((SUB(Valor,-5,1)-2)*9)+1),9)
  ELSIF SUB(Valor,-5,1) = 2
    Texto = CLIP(Texto) &' ' &SUB(V,(((SUB(Valor,-4,1)-1)*12)+1),12)
  ELSIF SUB(Valor,-5,1) > 2
    Texto = CLIP(Texto) &' ' &SUB(C,(((SUB(Valor,-5,1)-2)*9)+1),9)
    IF SUB(Valor,-4,1) > 0  AND SUB(Valor,-4,1) = 1
      Texto = CLIP(Texto) &' y Uno'
      ELSIF SUB(Valor,-4,1) > 0 AND SUB(Valor,-4,1) > 1
        Texto = CLIP(Texto) &' y ' &SUB(U,(((SUB(Valor,-4,1)-1)*6)+1),6)
      .
  ELSE
      IF SUB(Valor,-4,1) > 0  AND SUB(Valor,-5,1) = 0
      Texto = CLIP(Texto) &' ' &SUB(U,(((SUB(Valor,-4,1)-1)*6)+1),6)
      IF SUB(Valor,-4,1) = 1
      Texto = CLIP(Texto) &'o'
      . . .
  IF CLIP(Texto) <> ''
    Texto = CLIP(Texto) &' con  '
  .
  Texto = CLIP(Texto) &' ' &SUB(Valor,-2,2) &'/100'
  Texto = LEFT(Texto)

  RETURN(Texto)
!---------------------------------------------------------------------------
EvoP_P PROCEDURE (ImageQueue,Rec)                 
L:Busq        long                        
L:Reg         Long                        
L:NroReg   Long                        
Loc:String      STRING(19)
Loc:Long        Long
EvoFiIeName                STRING(255),AUTO,STATIC
ImagenListado               FILE,DRIVER('DOS'),NAME(EvoFiIeName)
                     RECORD
Buffer                 STRING(5000)
                     ..

  CODE
   L:NroReg = Rec
   Loop L:Reg = 1 to L:NroReg
      Get(ImageQueue,L:Reg)
      EvoFiIeName  = WHAT(ImageQueue,1)
      OPEN(ImagenListado)
      If error() Then Message('Error: ' & Error() & '|No puede abrirse la pagina:' & L:Reg,'Preview').
      Set(ImagenListado)
      Loop                               
         Previous(ImagenListado)                           
         If error()
            Set(ImagenListado)                             
            Next(ImagenListado)
            If error() then Message('Error: ' & Error() & '|No se puede Acceder a la pag.:' & L:Reg,'Preview'); break .
         End
         L:Busq = INSTRING('Evolution_Paginas_',ImagenListado.buffer,1,1)
         if L:Busq <> 0
            Loc:String = 'Pagina '&L:Reg&' de ' & L:NroReg
            ImagenListado.buffer = Sub(ImagenListado.buffer,1,L:Busq-1) &Loc:String & sub(ImagenListado.buffer,L:Busq+19,len(ImagenListado.buffer))
            Put(ImagenListado)
            If error() then Message('Error: ' & Error() & 'No puede Actualizarce la Pagina:' & L:Reg,'Preview').
            break
         END
      END
      CLOSE(ImagenListado)
   END


Dictionary.Construct PROCEDURE

  CODE
  IF THREAD()<>1
     DctInit()
  END


Dictionary.Destruct PROCEDURE

  CODE
  DctKill()

