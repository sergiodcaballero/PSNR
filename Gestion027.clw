

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABPRHTML.INC'),ONCE
   INCLUDE('ABPRPDF.INC'),ONCE
   INCLUDE('ABQUERY.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE
   INCLUDE('abprtext.inc'),ONCE
   INCLUDE('abprxml.inc'),ONCE
   INCLUDE('abrppsel.inc'),ONCE

                     MAP
                       INCLUDE('GESTION027.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION002.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION013.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION026.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION028.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Process
!!! </summary>
CUPON_DE_PAGO2 PROCEDURE 

Progress:Thermometer BYTE                                  ! 
Process:View         VIEW(RANKING)
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel),DISABLE,HIDE
                     END

ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeNoRecords          PROCEDURE(),DERIVED
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ThisProcess          ProcessClass                          ! Process Manager
ProgressMgr          StepStringClass                       ! Progress Manager

  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
!---------------------------------------------------------------------------

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('CUPON_DE_PAGO2')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:CONTROL_FACTURA.Open                              ! File CONTROL_FACTURA used by this procedure, so make sure it's RelationManager is open
  Relate:RANKING.Open                                      ! File RANKING used by this procedure, so make sure it's RelationManager is open
  Relate:SOCIOS.Open                                       ! File SOCIOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  LOGOUT(1,RANKING,SOCIOS,CONTROl_FACTURA)
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('CUPON_DE_PAGO2',ProgressWindow)            ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowAlpha+ScrollSort:AllowNumeric,ScrollBy:RunTime)
  ThisProcess.Init(Process:View, Relate:RANKING, ?Progress:PctText, Progress:Thermometer, ProgressMgr, RAN:C1)
  ThisProcess.AddSortOrder(RAN:PK_RANKING)
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  ?Progress:UserString{Prop:Text}='GENERA FACTURACION'
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(RANKING,'QUICKSCAN=on')
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:CONTROL_FACTURA.Close
    Relate:RANKING.Close
    Relate:SOCIOS.Close
  END
  IF SELF.Opened
    INIMgr.Update('CUPON_DE_PAGO2',ProgressWindow)         ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  COMMIT
  RETURN ReturnValue


ThisWindow.TakeNoRecords PROCEDURE

  CODE
  
  !!! Evolution Consulting FREE Templates Start!!!
    RETURN
  
  !!! Evolution Consulting FREE Templates End!!!
  
  
  
  PARENT.TakeNoRecords


ThisWindow.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeRecord()
  GLO:IDSOCIO = RAN:C1
  
  if GLO:IDSOLICITUD =  GLO:IDSOCIO then
      !message('se cargo el mismo')
  else
      GLO:IDSOLICITUD =  GLO:IDSOCIO
  
  
      CON3:IDSOCIO = GLO:IDSOCIO
      GET (CONTROL_FACTURA,CON3:PK_CONTROL_FACTURA)
      IF ERRORCODE() = 35 THEN
          !MESSAGE ('NO ENCONTRO COLTROL DE FACTURA FINAL')
          !SELECT(?GLO:IDSOCIO)
          !CYCLE
      ELSE
          GLO:MES     = CON3:MES
          GLO:ANO     = CON3:ANO
          IF CON3:MES = 12 THEN
             GLO:MES = 1
             GLO:ANO = GLO:ANO + 1
          ELSE
             GLO:MES = GLO:MES + 1
         END
      END
  
      GLO:ESTADO = 'SIN DETALLE'
      GLO:PERIODO = GLO:ANO&(FORMAT(GLO:MES,@N02))
  
  
      !!! LLAMA A LOS PROCEDIMIENTO DE FACTURACION
      FACTURAR_CABECERA_CUPON
  
      FACTURAR_DETALLE_CUPON
  
      !!!GUARDA PERIODO FACTURA ACTUAL
      GLO:MES = 0
      GLO:ANO = 0
      GLO:PERIODO = ''
      GLO:IDSOCIO = 0
  
  END
  RETURN ReturnValue

!!! <summary>
!!! Generated from procedure template - Process
!!! </summary>
FACTURAR_CABECERA_CUPON PROCEDURE 

Progress:Thermometer BYTE                                  ! 
Process:View         VIEW(SOCIOS)
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel),DISABLE,HIDE
                     END

ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeNoRecords          PROCEDURE(),DERIVED
                     END

ThisProcess          CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ProgressMgr          StepLongClass                         ! Progress Manager

  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
!---------------------------------------------------------------------------

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('FACTURAR_CABECERA_CUPON')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:COBERTURA.Open                                    ! File COBERTURA used by this procedure, so make sure it's RelationManager is open
  Relate:CONTROL_FACTURA.Open                              ! File CONTROL_FACTURA used by this procedure, so make sure it's RelationManager is open
  Relate:FACTURA.Open                                      ! File FACTURA used by this procedure, so make sure it's RelationManager is open
  Relate:SOCIOS.Open                                       ! File SOCIOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('FACTURAR_CABECERA_CUPON',ProgressWindow)   ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisProcess.Init(Process:View, Relate:SOCIOS, ?Progress:PctText, Progress:Thermometer, ProgressMgr, SOC:IDSOCIO)
  ThisProcess.AddSortOrder(SOC:PK_SOCIOS)
  ThisProcess.AddRange(SOC:IDSOCIO,GLO:IDSOCIO)
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  SELF.SetUseMRP(False)
  ?Progress:UserString{Prop:Text}=''
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(SOCIOS,'QUICKSCAN=on')
  SELF.SetAlerts()
  ProgressWindow{prop:hide}= true
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:COBERTURA.Close
    Relate:CONTROL_FACTURA.Close
    Relate:FACTURA.Close
    Relate:SOCIOS.Close
  END
  IF SELF.Opened
    INIMgr.Update('FACTURAR_CABECERA_CUPON',ProgressWindow) ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.TakeNoRecords PROCEDURE

  CODE
  
  !!! Evolution Consulting FREE Templates Start!!!
    RETURN
  
  !!! Evolution Consulting FREE Templates End!!!
  
  
  
  PARENT.TakeNoRecords


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeRecord()
  if SOC:BAJA = 'NO' AND SOC:BAJA_TEMPORARIA = 'NO' then
  
      FAC:IDSOCIO = SOC:IDSOCIO
      FAC:DESCUENTOESPECIAL  = SOC:DESCUENTO
      ! CONTROLA SI ES LA 1º VEZ QUE SE CARGA LA FACTURA
      PERIODO1# = GLO:PERIODO
      CON3:IDSOCIO = SOC:IDSOCIO
      GET (CONTROL_FACTURA,CON3:PK_CONTROL_FACTURA)
      IF ERRORCODE() = 35 THEN
          CON3:MES = GLO:MES
          CON3:ANO = GLO:ANO
          CON3:PEDIODO = CON3:ANO&(FORMAT(CON3:MES,@N02))
          PRIMERA_VEZ" = 'SI'
          ADD(CONTROL_FACTURA)
          IF ERRORCODE() THEN MESSAGE(ERROR()).
          
      ELSE
           GLO:MES = CON3:MES
           GLO:ANO = CON3:ANO
           PERIODO2# = CON3:PEDIODO
           IF CON3:MES = 12 THEN
              GLO:MES = 1
              GLO:ANO = GLO:ANO + 1
           ELSE
               GLO:MES = GLO:MES + 1
           END
           
      END
    
      !MESSAGE ('EL PERIODO 1:'&PERIODO1#&', EL PERIODO 2:'&PERIODO2#&' 1º VEZ = '&PRIMERA_VEZ")
      IF PERIODO1# > PERIODO2# OR PRIMERA_VEZ"= 'SI' THEN !! CONTROLA QUE YA NO SE HAYA FACTURADO
          FAC:MES  = GLO:MES
          FAC:ANO = GLO:ANO
          FAC:INTERES = 0
          FAC:TOTAL  = 0
          FAC:PERIODO =   GLO:ANO&(FORMAT(GLO:MES,@N02))
          FAC:IDUSUARIO = GLO:IDUSUARIO
          FAC:FECHA =TODAY()
          FAC:HORA = CLOCK()
          FAC:ESTADO = 'SIN DETALLE'
          add(FACTURA)
          
       END
  end ! fecha baja
  
  PERIODO1# = 0
  PERIODO2# = 0
  PRIMERA_VEZ" = ''
  
  PUT(Process:View)
  IF ERRORCODE()
    GlobalErrors.ThrowFile(Msg:PutFailed,'Process:View')
    ThisWindow.Response = RequestCompleted
    ReturnValue = Level:Fatal
  END
  RETURN ReturnValue

!!! <summary>
!!! Generated from procedure template - Process
!!! </summary>
CUPON_DE_PAGO1 PROCEDURE 

Progress:Thermometer BYTE                                  ! 
Process:View         VIEW(SOCIOS)
                       PROJECT(SOC:IDSOCIO)
                       JOIN(PAG1:FK_PAGOSXCIRCULO_SOCIO,SOC:IDSOCIO)
                       END
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel),DISABLE,HIDE
                     END

ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
                     END

ThisProcess          CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ProgressMgr          StepLongClass                         ! Progress Manager

  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
!---------------------------------------------------------------------------

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('CUPON_DE_PAGO1')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:RANKING.Open                                      ! File RANKING used by this procedure, so make sure it's RelationManager is open
  Relate:SOCIOS.Open                                       ! File SOCIOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('CUPON_DE_PAGO1',ProgressWindow)            ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisProcess.Init(Process:View, Relate:SOCIOS, ?Progress:PctText, Progress:Thermometer, ProgressMgr, SOC:IDSOCIO)
  ThisProcess.AddSortOrder(SOC:PK_SOCIOS)
  ThisProcess.SetFilter('SOC:BAJA <<> ''SI'' OR SOC:BAJA_TEMPORARIA <<> ''SI''')
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  ?Progress:UserString{Prop:Text}='VERIFICA SOCIOS NO AGREMIADOS'
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(SOCIOS,'QUICKSCAN=on')
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:RANKING.Close
    Relate:SOCIOS.Close
  END
  IF SELF.Opened
    INIMgr.Update('CUPON_DE_PAGO1',ProgressWindow)         ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeRecord()
  PAG1:IDSOCIO = SOC:IDSOCIO
  GET (PAGOSXCIRCULO,PAG1:FK_PAGOSXCIRCULO_SOCIO)
  IF ERRORCODE() = 35  THEN
       RAN:C1 = SOC:IDSOCIO
       ADD(RANKING)
       IF ERRORCODE() THEN MESSAGE(ERROR()).
  END
  RETURN ReturnValue

!!! <summary>
!!! Generated from procedure template - Report
!!! </summary>
IMPRIMIR_RECIBO_CANCELACION PROCEDURE 

Progress:Thermometer BYTE                                  ! 
L:NroReg             LONG                                  ! 
Process:View         VIEW(CONVENIO)
                       PROJECT(CON4:CANCELADO)
                       PROJECT(CON4:CANTIDAD_CUOTAS)
                       PROJECT(CON4:FECHA)
                       PROJECT(CON4:FECHA_CANCELADO)
                       PROJECT(CON4:IDSOCIO)
                       PROJECT(CON4:IDSOLICITUD)
                       PROJECT(CON4:IDTIPO_CONVENIO)
                       PROJECT(CON4:MONTO_BONIFICADO)
                       PROJECT(CON4:MONTO_CUOTA)
                       PROJECT(CON4:MONTO_TOTAL)
                       JOIN(TIP:PK_T_CONVENIO,CON4:IDTIPO_CONVENIO)
                         PROJECT(TIP:DESCRIPCION)
                       END
                       JOIN(SOC:PK_SOCIOS,CON4:IDSOCIO)
                         PROJECT(SOC:MATRICULA)
                         PROJECT(SOC:NOMBRE)
                       END
                       JOIN(CON5:FK_CONVENIO_DETALLE,CON4:IDSOLICITUD)
                         PROJECT(CON5:ANO)
                         PROJECT(CON5:CANCELADO)
                         PROJECT(CON5:DEUDA_INICIAL)
                         PROJECT(CON5:MES)
                         PROJECT(CON5:MONTO_CUOTA)
                         PROJECT(CON5:NRO_CUOTA)
                         PROJECT(CON5:OBSERVACION)
                       END
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

Report               REPORT,AT(1000,2000,6250,7688),PRE(RPT),PAPER(PAPER:A4),FONT('Arial',9,,FONT:regular,CHARSET:ANSI), |
  THOUS
                       HEADER,AT(1000,1000,6250,1000),USE(?Header)
                         STRING('Nro.: '),AT(4688,31),USE(?String2),TRN
                         STRING(@n-14),AT(5125,42),USE(CON4:IDSOLICITUD)
                         IMAGE('Logo.JPG'),AT(10,63,1490,885),USE(?Image1)
                         STRING('RECIBO DE CANCELACION DE DEUDA'),AT(2177,813),USE(?String1),FONT(,,,FONT:bold+FONT:underline), |
  TRN
                         STRING('Fecha:'),AT(4708,240),USE(?String4),TRN
                         STRING(@d17),AT(5458,250),USE(CON4:FECHA)
                       END
break1                 BREAK(CON5:IDSOLICITUD),USE(?BREAK1)
                         HEADER,AT(0,0,,1802),USE(?GROUPHEADER1)
                           LINE,AT(10,10,6229,0),USE(?Line2),COLOR(COLOR:Black)
                           STRING('Nro Socio:'),AT(21,63),USE(?String22),TRN
                           STRING(@n-7),AT(656,63),USE(CON4:IDSOCIO)
                           STRING(@s30),AT(1240,63,2302,188),USE(SOC:NOMBRE)
                           STRING(@n-7),AT(4198,63),USE(SOC:MATRICULA)
                           STRING('CANCELADO:'),AT(31,813),USE(?String47),FONT(,,,FONT:bold),TRN
                           STRING('Matricula:'),AT(3573,63),USE(?String25),TRN
                           STRING(@n$-10.2),AT(1573,500),USE(CON4:MONTO_TOTAL),FONT(,,,FONT:bold)
                           STRING('Cantidad de Cuotas:'),AT(2344,500),USE(?String29),FONT(,,,FONT:bold),TRN
                           STRING('Detalle del Convenio'),AT(2438,1219),USE(?String40),FONT(,10,,FONT:bold+FONT:underline), |
  TRN
                           LINE,AT(10,1437,6229,0),USE(?Line4),COLOR(COLOR:Black)
                           STRING('Mes'),AT(740,1521),USE(?String35),TRN
                           STRING('Año'),AT(1271,1521),USE(?String36),TRN
                           STRING('Nro. Cuota'),AT(10,1521),USE(?String37),TRN
                           STRING('Monto Cuota'),AT(1781,1521),USE(?String38),TRN
                           STRING('Deuda Inicial'),AT(2677,1521),USE(?String39),TRN
                           STRING('Facturado'),AT(5656,1542),USE(?String45),TRN
                           LINE,AT(21,1781,6229,0),USE(?Line5),COLOR(COLOR:Black)
                           STRING('Tipo Convenio:'),AT(21,240),USE(?String26),TRN
                           LINE,AT(10,458,6229,0),USE(?Line1),COLOR(COLOR:Black)
                           STRING('Monto Total Adheudado: '),AT(31,500),USE(?String28),FONT(,,,FONT:bold),TRN
                           STRING(@n-7),AT(927,229),USE(CON4:IDTIPO_CONVENIO)
                           STRING(@s50),AT(1469,229),USE(TIP:DESCRIPCION)
                           STRING(@s2),AT(896,813),USE(CON4:CANCELADO),FONT(,,,FONT:underline),TRN
                           STRING(@d17),AT(2875,813),USE(CON4:FECHA_CANCELADO)
                           STRING('FECHA DE CANCELACION:'),AT(1229,813),USE(?String42),TRN
                           STRING(@n$-10.2),AT(5552,500),USE(CON4:MONTO_CUOTA),FONT(,,,FONT:bold)
                           LINE,AT(10,740,6229,0),USE(?Line3),COLOR(COLOR:Black)
                           STRING(@n-7),AT(3573,500),USE(CON4:CANTIDAD_CUOTAS),FONT(,,,FONT:bold)
                           STRING('Monto de la Cuota:'),AT(4396,500),USE(?String30),FONT(,,,FONT:bold),TRN
                         END
detail1                  DETAIL,AT(0,0,,229),USE(?DETAIL1)
                           STRING(@s4),AT(1208,10),USE(CON5:ANO)
                           STRING(@s2),AT(760,10),USE(CON5:MES)
                           STRING(@n-7),AT(21,10),USE(CON5:NRO_CUOTA)
                           STRING(@n$-10.2),AT(1802,10),USE(CON5:MONTO_CUOTA)
                           STRING(@n$-10.2),AT(2719,10),USE(CON5:DEUDA_INICIAL)
                           STRING(@s50),AT(3635,10),USE(CON5:OBSERVACION)
                           STRING(@s2),AT(5854,10),USE(CON5:CANCELADO)
                           LINE,AT(10,208,6229,0),USE(?Line6),COLOR(COLOR:Black)
                         END
                         FOOTER,AT(0,0,,2271),USE(?GROUPFOOTER1)
                           STRING('MONTO A CANCELAR: '),AT(31,94),USE(?String46),FONT(,12,,FONT:bold+FONT:underline), |
  TRN
                           STRING(@n$-10.2),AT(2031,83),USE(CON4:MONTO_BONIFICADO),FONT(,12,,FONT:bold+FONT:underline)
                           BOX,AT(21,438,6323,52),USE(?Box1),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                           LINE,AT(198,1917,2417,0),USE(?Line9),COLOR(COLOR:Black)
                           STRING('Firma Responsable Colegio '),AT(531,2000),USE(?String44),TRN
                           LINE,AT(3990,1906,2240,0),USE(?Line8),COLOR(COLOR:Black)
                           STRING('Firma y Aclaración  del Colegiado '),AT(4198,2000),USE(?String43),TRN
                         END
                       END
                       FOOTER,AT(1000,9688,6250,1000),USE(?Footer)
                         LINE,AT(10,31,7271,0),USE(?Line3:2),COLOR(COLOR:Black)
                         STRING('Fecha del Reporte:'),AT(21,63),USE(?EcFechaReport),FONT('Courier New',7),TRN
                         STRING('DatoEmpresa'),AT(2667,115),USE(?DatoEmpresa),FONT('Courier New',7),TRN
                         STRING('Evolution_Paginas_'),AT(5292,52),USE(?PaginaNdeX),FONT('Courier New',7),TRN
                       END
                       FORM,AT(1000,1000,6250,9688),USE(?Form)
                       END
                     END
ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
OpenReport             PROCEDURE(),BYTE,PROC,DERIVED
SetStaticControlsAttributes PROCEDURE(),DERIVED
                     END

ThisReport           CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ProgressMgr          StepLongClass                         ! Progress Manager
Previewer            CLASS(PrintPreviewClass)              ! Print Previewer
Ask                    PROCEDURE(),DERIVED
                     END

TargetSelector       ReportTargetSelectorClass             ! Report Target Selector
XMLReporter          CLASS(XMLReportGenerator)             ! XML
Setup                  PROCEDURE(),DERIVED
                     END

HTMLReporter         CLASS(HTMLReportGenerator)            ! HTML
SetUp                  PROCEDURE(),DERIVED
                     END

TXTReporter          CLASS(TextReportGenerator)            ! TXT
Setup                  PROCEDURE(),DERIVED
                     END

PDFReporter          CLASS(PDFReportGenerator)             ! PDF
SetUp                  PROCEDURE(),DERIVED
                     END


  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
!---------------------------------------------------------------------------

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('IMPRIMIR_RECIBO_CANCELACION')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:CONVENIO.Open                                     ! File CONVENIO used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('IMPRIMIR_RECIBO_CANCELACION',ProgressWindow) ! Restore window settings from non-volatile store
  TargetSelector.AddItem(XMLReporter.IReportGenerator)
  TargetSelector.AddItem(HTMLReporter.IReportGenerator)
  TargetSelector.AddItem(TXTReporter.IReportGenerator)
  TargetSelector.AddItem(PDFReporter.IReportGenerator)
  SELF.AddItem(TargetSelector)
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisReport.Init(Process:View, Relate:CONVENIO, ?Progress:PctText, Progress:Thermometer, ProgressMgr, CON4:IDSOLICITUD)
  ThisReport.AddSortOrder(CON4:PK_CONVENIO)
  ThisReport.AddRange(CON4:IDSOLICITUD,GLO:IDSOLICITUD)
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:CONVENIO.SetQuickScan(1,Propagate:OneMany)
  ProgressWindow{PROP:Timer} = 10                          ! Assign timer interval
  SELF.SkipPreview = False
  Previewer.SetINIManager(INIMgr)
  Previewer.AllowUserZoom = True
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:CONVENIO.Close
  END
  IF SELF.Opened
    INIMgr.Update('IMPRIMIR_RECIBO_CANCELACION',ProgressWindow) ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.OpenReport PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  SYSTEM{PROP:PrintMode} = 3
  ReturnValue = PARENT.OpenReport()
  
  !!! Evolution Consulting FREE Templates Start!!!
   IF Not ReturnValue
       REPORT$?EcFechaReport{prop:text} = FORMAT(TODAY(),@d6)&' - '&FORMAT(CLOCK(),@t4)
          REPORT$?DatoEmpresa{prop:hide} = True
   END
  IF ReturnValue = Level:Benign
    SELF.Report{PROPPRINT:Extend}=True
  END
  RETURN ReturnValue


ThisWindow.SetStaticControlsAttributes PROCEDURE

  CODE
  PARENT.SetStaticControlsAttributes
  !XML STATIC
  SELF.Attribute.Set(?String2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String2,RepGen:XML,TargetAttr:TagName,'String2')
  SELF.Attribute.Set(?String2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?CON4:IDSOLICITUD,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?CON4:IDSOLICITUD,RepGen:XML,TargetAttr:TagName,'CON4:IDSOLICITUD')
  SELF.Attribute.Set(?CON4:IDSOLICITUD,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String1,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String1,RepGen:XML,TargetAttr:TagName,'String1')
  SELF.Attribute.Set(?String1,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String4,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String4,RepGen:XML,TargetAttr:TagName,'String4')
  SELF.Attribute.Set(?String4,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?CON4:FECHA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?CON4:FECHA,RepGen:XML,TargetAttr:TagName,'CON4:FECHA')
  SELF.Attribute.Set(?CON4:FECHA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String22,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String22,RepGen:XML,TargetAttr:TagName,'String22')
  SELF.Attribute.Set(?String22,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?CON4:IDSOCIO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?CON4:IDSOCIO,RepGen:XML,TargetAttr:TagName,'CON4:IDSOCIO')
  SELF.Attribute.Set(?CON4:IDSOCIO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagName,'SOC:NOMBRE')
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagName,'SOC:MATRICULA')
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String47,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String47,RepGen:XML,TargetAttr:TagName,'String47')
  SELF.Attribute.Set(?String47,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String25,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String25,RepGen:XML,TargetAttr:TagName,'String25')
  SELF.Attribute.Set(?String25,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?CON4:MONTO_TOTAL,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?CON4:MONTO_TOTAL,RepGen:XML,TargetAttr:TagName,'CON4:MONTO_TOTAL')
  SELF.Attribute.Set(?CON4:MONTO_TOTAL,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String29,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String29,RepGen:XML,TargetAttr:TagName,'String29')
  SELF.Attribute.Set(?String29,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String40,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String40,RepGen:XML,TargetAttr:TagName,'String40')
  SELF.Attribute.Set(?String40,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String35,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String35,RepGen:XML,TargetAttr:TagName,'String35')
  SELF.Attribute.Set(?String35,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String36,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String36,RepGen:XML,TargetAttr:TagName,'String36')
  SELF.Attribute.Set(?String36,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String37,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String37,RepGen:XML,TargetAttr:TagName,'String37')
  SELF.Attribute.Set(?String37,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String38,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String38,RepGen:XML,TargetAttr:TagName,'String38')
  SELF.Attribute.Set(?String38,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String39,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String39,RepGen:XML,TargetAttr:TagName,'String39')
  SELF.Attribute.Set(?String39,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String45,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String45,RepGen:XML,TargetAttr:TagName,'String45')
  SELF.Attribute.Set(?String45,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String26,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String26,RepGen:XML,TargetAttr:TagName,'String26')
  SELF.Attribute.Set(?String26,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String28,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String28,RepGen:XML,TargetAttr:TagName,'String28')
  SELF.Attribute.Set(?String28,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?CON4:IDTIPO_CONVENIO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?CON4:IDTIPO_CONVENIO,RepGen:XML,TargetAttr:TagName,'CON4:IDTIPO_CONVENIO')
  SELF.Attribute.Set(?CON4:IDTIPO_CONVENIO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?TIP:DESCRIPCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?TIP:DESCRIPCION,RepGen:XML,TargetAttr:TagName,'TIP:DESCRIPCION')
  SELF.Attribute.Set(?TIP:DESCRIPCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?CON4:CANCELADO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?CON4:CANCELADO,RepGen:XML,TargetAttr:TagName,'CON4:CANCELADO')
  SELF.Attribute.Set(?CON4:CANCELADO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?CON4:FECHA_CANCELADO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?CON4:FECHA_CANCELADO,RepGen:XML,TargetAttr:TagName,'CON4:FECHA_CANCELADO')
  SELF.Attribute.Set(?CON4:FECHA_CANCELADO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String42,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String42,RepGen:XML,TargetAttr:TagName,'String42')
  SELF.Attribute.Set(?String42,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?CON4:MONTO_CUOTA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?CON4:MONTO_CUOTA,RepGen:XML,TargetAttr:TagName,'CON4:MONTO_CUOTA')
  SELF.Attribute.Set(?CON4:MONTO_CUOTA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?CON4:CANTIDAD_CUOTAS,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?CON4:CANTIDAD_CUOTAS,RepGen:XML,TargetAttr:TagName,'CON4:CANTIDAD_CUOTAS')
  SELF.Attribute.Set(?CON4:CANTIDAD_CUOTAS,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String30,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String30,RepGen:XML,TargetAttr:TagName,'String30')
  SELF.Attribute.Set(?String30,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?CON5:ANO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?CON5:ANO,RepGen:XML,TargetAttr:TagName,'CON5:ANO')
  SELF.Attribute.Set(?CON5:ANO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?CON5:MES,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?CON5:MES,RepGen:XML,TargetAttr:TagName,'CON5:MES')
  SELF.Attribute.Set(?CON5:MES,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?CON5:NRO_CUOTA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?CON5:NRO_CUOTA,RepGen:XML,TargetAttr:TagName,'CON5:NRO_CUOTA')
  SELF.Attribute.Set(?CON5:NRO_CUOTA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?CON5:MONTO_CUOTA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?CON5:MONTO_CUOTA,RepGen:XML,TargetAttr:TagName,'CON5:MONTO_CUOTA')
  SELF.Attribute.Set(?CON5:MONTO_CUOTA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?CON5:DEUDA_INICIAL,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?CON5:DEUDA_INICIAL,RepGen:XML,TargetAttr:TagName,'CON5:DEUDA_INICIAL')
  SELF.Attribute.Set(?CON5:DEUDA_INICIAL,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?CON5:OBSERVACION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?CON5:OBSERVACION,RepGen:XML,TargetAttr:TagName,'CON5:OBSERVACION')
  SELF.Attribute.Set(?CON5:OBSERVACION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?CON5:CANCELADO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?CON5:CANCELADO,RepGen:XML,TargetAttr:TagName,'CON5:CANCELADO')
  SELF.Attribute.Set(?CON5:CANCELADO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String46,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String46,RepGen:XML,TargetAttr:TagName,'String46')
  SELF.Attribute.Set(?String46,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?CON4:MONTO_BONIFICADO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?CON4:MONTO_BONIFICADO,RepGen:XML,TargetAttr:TagName,'CON4:MONTO_BONIFICADO')
  SELF.Attribute.Set(?CON4:MONTO_BONIFICADO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String44,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String44,RepGen:XML,TargetAttr:TagName,'String44')
  SELF.Attribute.Set(?String44,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String43,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String43,RepGen:XML,TargetAttr:TagName,'String43')
  SELF.Attribute.Set(?String43,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?EcFechaReport,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?EcFechaReport,RepGen:XML,TargetAttr:TagName,'EcFechaReport')
  SELF.Attribute.Set(?EcFechaReport,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?DatoEmpresa,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?DatoEmpresa,RepGen:XML,TargetAttr:TagName,'DatoEmpresa')
  SELF.Attribute.Set(?DatoEmpresa,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PaginaNdeX,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PaginaNdeX,RepGen:XML,TargetAttr:TagName,'PaginaNdeX')
  SELF.Attribute.Set(?PaginaNdeX,RepGen:XML,TargetAttr:TagValueFromText,True)


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  ReturnValue = PARENT.TakeRecord()
  PRINT(RPT:detail1)
  RETURN ReturnValue


Previewer.Ask PROCEDURE

  CODE
  
  !!! Evolution Consulting FREE Templates Start!!!
    L:NroReg = Records(SELF.ImageQueue)
    EvoP_P(SELF.ImageQueue,L:NroReg)        
  
  !!! Evolution Consulting FREE Templates End!!!
  PARENT.Ask


XMLReporter.Setup PROCEDURE

  CODE
  PARENT.Setup
  SELF.SetFileName('')
  SELF.SetRootTag('Clarion_60_XML_Document')
  SELF.SetForceXMLHeader(True)
  SELF.SetSupportNameSpaces(False)
  SELF.SetUseCRLF(True)
  SELF.SetPagesAsDifferentFile(False)
  SELF.SetPagesAsParentTag(False)


HTMLReporter.SetUp PROCEDURE

  CODE
  PARENT.SetUp
  SELF.SetFileName('')
  SELF.SetDocumentName('Clarion Report')
  SELF.SetNavigationText('First','Last','Next','Prior','Select Page','Page_','Load Page')
  SELF.SetSubDirectory(1,'_Files','_Images')
  SELF.SetSingleFile(0)


TXTReporter.Setup PROCEDURE

  CODE
  PARENT.Setup
  SELF.SetFileName('')
  SELF.SetPagesAsDifferentFile(False)
  SELF.SetMargin(0,0,0,0)
  SELF.SetPageLen(0)
  SELF.SetCheckBoxString('[X]','[_]')
  SELF.SetRadioButtonString('(*)','(_)')
  SELF.SetLineString('|','|','-','-','/','\','\','/')
  SELF.SetTextFillString(' ',CHR(176),CHR(177),CHR(178),CHR(219))
  SELF.SetOmitGraph(False)


PDFReporter.SetUp PROCEDURE

  CODE
  PARENT.SetUp
  SELF.SetFileName('')
  SELF.SetDocumentInfo('CW Report','Gestion','IMPRIMIR_CONVENIO','IMPRIMIR_CONVENIO','','')
  SELF.SetPagesAsParentBookmark(False)
  SELF.SetScanCopyMode(False)
  SELF.CompressText   = True
  SELF.CompressImages = True

!!! <summary>
!!! Generated from procedure template - Window
!!! Actualizacion CONVENIO
!!! </summary>
UpdateCONVENIO1 PROCEDURE 

CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
BRW10::View:Browse   VIEW(CONVENIO_DETALLE)
                       PROJECT(CON5:NRO_CUOTA)
                       PROJECT(CON5:MES)
                       PROJECT(CON5:ANO)
                       PROJECT(CON5:MONTO_CUOTA)
                       PROJECT(CON5:DEUDA_INICIAL)
                       PROJECT(CON5:CANCELADO)
                       PROJECT(CON5:IDSOLICITUD)
                       PROJECT(CON5:PERIODO)
                     END
Queue:Browse         QUEUE                            !Queue declaration for browse/combo box using ?List
CON5:NRO_CUOTA         LIKE(CON5:NRO_CUOTA)           !List box control field - type derived from field
CON5:NRO_CUOTA_Icon    LONG                           !Entry's icon ID
CON5:MES               LIKE(CON5:MES)                 !List box control field - type derived from field
CON5:ANO               LIKE(CON5:ANO)                 !List box control field - type derived from field
CON5:MONTO_CUOTA       LIKE(CON5:MONTO_CUOTA)         !List box control field - type derived from field
CON5:DEUDA_INICIAL     LIKE(CON5:DEUDA_INICIAL)       !List box control field - type derived from field
CON5:CANCELADO         LIKE(CON5:CANCELADO)           !List box control field - type derived from field
CON5:IDSOLICITUD       LIKE(CON5:IDSOLICITUD)         !List box control field - type derived from field
CON5:PERIODO           LIKE(CON5:PERIODO)             !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
History::CON4:Record LIKE(CON4:RECORD),THREAD
QuickWindow          WINDOW('Cancelar  CONVENIO'),AT(,,356,265),FONT('Arial',8,,FONT:regular),RESIZE,CENTER,GRAY, |
  IMM,MDI,HLP('UpdateCONVENIO'),SYSTEM
                       PROMPT('IDSOLICITUD:'),AT(3,5),USE(?CON4:IDSOLICITUD:Prompt)
                       ENTRY(@n-14),AT(53,4,43,10),USE(CON4:IDSOLICITUD),DISABLE,REQ
                       GROUP('Aprobación'),AT(1,67,353,21),USE(?Group1),BOXED
                         PROMPT('OBSERVACION:'),AT(4,75),USE(?CON4:OBSERVACION:Prompt),TRN
                         ENTRY(@s100),AT(70,75,246,10),USE(CON4:OBSERVACION),DISABLE
                       END
                       GROUP('Montos '),AT(2,88,353,45),USE(?Group4),BOXED
                         PROMPT('MONTO TOTAL:'),AT(4,100),USE(?CON4:MONTO_TOTAL:Prompt)
                         ENTRY(@n-10.2),AT(63,100,43,10),USE(CON4:MONTO_TOTAL),DISABLE
                         PROMPT('CANTIDAD CUOTAS:'),AT(114,100),USE(?CON4:CANTIDAD_CUOTAS:Prompt)
                         ENTRY(@n-14),AT(189,100,43,10),USE(CON4:CANTIDAD_CUOTAS),DISABLE
                         PROMPT('MONTO CUOTA:'),AT(240,100),USE(?CON4:MONTO_CUOTA:Prompt)
                         ENTRY(@n-10.2),AT(301,100,43,10),USE(CON4:MONTO_CUOTA),DISABLE
                         PROMPT('GASTOS ADMINISTRATIVOS:'),AT(5,116),USE(?CON4:GASTOS_ADMINISTRATIVOS:Prompt)
                         ENTRY(@n-10.2),AT(105,116,43,10),USE(CON4:GASTOS_ADMINISTRATIVOS),DISABLE
                       END
                       GROUP('Detalle del Convenio'),AT(1,136,353,107),USE(?Group5),BOXED
                         LIST,AT(8,148,343,74),USE(?List),HVSCROLL,FORMAT('49L(2)|MI~NRO CUOTA~@n-7@21L(2)|M~MES' & |
  '~@s2@24L(2)|M~ANO~@s4@61L(2)|M~MONTO CUOTA~@n-10.2@59L(2)|M~DEUDA INICIAL~@n-10.2@49' & |
  'L(2)|M~CANCELADO~@s2@56L(2)|M~IDSOLICITUD~@n-7@56L(2)|M~PERIODO~@n-14@'),FROM(Queue:Browse), |
  IMM,MSG('Browsing Records'),VCR
                         STRING(@n$-10.2),AT(67,226),USE(CON4:MONTO_BONIFICADO)
                         PROMPT('Saldo Adeudado:'),AT(7,226),USE(?Prompt14)
                       END
                       BUTTON('&Cancelar Convenio'),AT(3,245,95,18),USE(?OK),LEFT,ICON('b.ico'),CURSOR('mano.cur'), |
  DEFAULT,FLAT,MSG('Confirma y Actualiza el Formulario'),TIP('Confirma y Actualiza el Formulario')
                       BUTTON('&Cancelar'),AT(299,250,55,14),USE(?Cancel),LEFT,ICON('cancelar.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Cancela Operacion'),TIP('Cancela Operacion')
                       GROUP('Convenio'),AT(1,17,355,49),USE(?Group3),BOXED
                         PROMPT('IDSOCIO:'),AT(3,25),USE(?CON4:IDSOCIO:Prompt),TRN
                         ENTRY(@n-14),AT(72,25,43,10),USE(CON4:IDSOCIO),DISABLE
                         STRING(@s30),AT(119,25),USE(SOC:NOMBRE)
                         PROMPT('MATRICULA:'),AT(260,25),USE(?Prompt10)
                         STRING(@n-7),AT(303,25),USE(SOC:MATRICULA)
                         STRING(@s50),AT(120,45),USE(TIP:DESCRIPCION)
                         PROMPT('IDTIPO CONVENIO:'),AT(3,45),USE(?CON4:IDTIPO_CONVENIO:Prompt),TRN
                         ENTRY(@n-14),AT(71,45,43,10),USE(CON4:IDTIPO_CONVENIO),DISABLE
                       END
                     END

ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Reset                  PROCEDURE(BYTE Force=0),DERIVED
Run                    PROCEDURE(),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeCompleted          PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
ToolbarForm          ToolbarUpdateClass                    ! Form Toolbar Manager
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

BRW10                CLASS(BrowseClass)                    ! Browse using ?List
Q                      &Queue:Browse                  !Reference to browse queue
ResetFromView          PROCEDURE(),DERIVED
SetQueueRecord         PROCEDURE(),DERIVED
                     END

BRW10::Sort0:Locator StepLocatorClass                      ! Default Locator
CurCtrlFeq          LONG
FieldColorQueue     QUEUE
Feq                   LONG
OldColor              LONG
                    END

  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
!---------------------------------------------------------------------------

ThisWindow.Ask PROCEDURE

  CODE
  CASE SELF.Request                                        ! Configure the action message text
  OF ViewRecord
    ActionMessage = 'Visualizando Registro'
  OF InsertRecord
    ActionMessage = 'Insertando Registro'
  OF ChangeRecord
    ActionMessage = 'Cambiando Registro'
  END
  QuickWindow{PROP:Text} = ActionMessage                   ! Display status message in title bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('UpdateCONVENIO1')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?CON4:IDSOLICITUD:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('CON5:NRO_CUOTA',CON5:NRO_CUOTA)                    ! Added by: BrowseBox(ABC)
  BIND('CON5:MONTO_CUOTA',CON5:MONTO_CUOTA)                ! Added by: BrowseBox(ABC)
  BIND('CON5:DEUDA_INICIAL',CON5:DEUDA_INICIAL)            ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(CON4:Record,History::CON4:Record)
  SELF.AddHistoryField(?CON4:IDSOLICITUD,1)
  SELF.AddHistoryField(?CON4:OBSERVACION,22)
  SELF.AddHistoryField(?CON4:MONTO_TOTAL,4)
  SELF.AddHistoryField(?CON4:CANTIDAD_CUOTAS,5)
  SELF.AddHistoryField(?CON4:MONTO_CUOTA,6)
  SELF.AddHistoryField(?CON4:GASTOS_ADMINISTRATIVOS,9)
  SELF.AddHistoryField(?CON4:MONTO_BONIFICADO,7)
  SELF.AddHistoryField(?CON4:IDSOCIO,2)
  SELF.AddHistoryField(?CON4:IDTIPO_CONVENIO,3)
  SELF.AddUpdateFile(Access:CONVENIO)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:CONVENIO.Open                                     ! File CONVENIO used by this procedure, so make sure it's RelationManager is open
  Relate:CONVENIO_DETALLE.Open                             ! File CONVENIO_DETALLE used by this procedure, so make sure it's RelationManager is open
  Relate:SOCIOS.Open                                       ! File SOCIOS used by this procedure, so make sure it's RelationManager is open
  Relate:TIPO_CONVENIO.Open                                ! File TIPO_CONVENIO used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:CONVENIO
  IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing ! Setup actions for ViewOnly Mode
    SELF.InsertAction = Insert:None
    SELF.DeleteAction = Delete:None
    SELF.ChangeAction = Change:None
    SELF.CancelAction = Cancel:Cancel
    SELF.OkControl = 0
  ELSE
    SELF.ChangeAction = Change:Caller                      ! Changes allowed
    SELF.CancelAction = Cancel:Cancel+Cancel:Query         ! Confirm cancel
    SELF.OkControl = ?OK
    IF SELF.PrimeUpdate() THEN RETURN Level:Notify.
  END
  BRW10.Init(?List,Queue:Browse.ViewPosition,BRW10::View:Browse,Queue:Browse,Relate:CONVENIO_DETALLE,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    ?CON4:IDSOLICITUD{PROP:ReadOnly} = True
    ?CON4:OBSERVACION{PROP:ReadOnly} = True
    ?CON4:MONTO_TOTAL{PROP:ReadOnly} = True
    ?CON4:CANTIDAD_CUOTAS{PROP:ReadOnly} = True
    ?CON4:MONTO_CUOTA{PROP:ReadOnly} = True
    ?CON4:GASTOS_ADMINISTRATIVOS{PROP:ReadOnly} = True
    ?CON4:IDSOCIO{PROP:ReadOnly} = True
    ?CON4:IDTIPO_CONVENIO{PROP:ReadOnly} = True
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  BRW10.Q &= Queue:Browse
  BRW10.RetainRow = 0
  BRW10.AddSortOrder(,CON5:FK_CONVENIO_DETALLE)            ! Add the sort order for CON5:FK_CONVENIO_DETALLE for sort order 1
  BRW10.AddRange(CON5:IDSOLICITUD,Relate:CONVENIO_DETALLE,Relate:CONVENIO) ! Add file relationship range limit for sort order 1
  BRW10.AddLocator(BRW10::Sort0:Locator)                   ! Browse has a locator for sort order 1
  BRW10::Sort0:Locator.Init(,CON5:IDSOLICITUD,,BRW10)      ! Initialize the browse locator using  using key: CON5:FK_CONVENIO_DETALLE , CON5:IDSOLICITUD
  BRW10.AppendOrder('CON5:PERIODO')                        ! Append an additional sort order
  BRW10.SetFilter('(CON5:CANCELADO = '''')')               ! Apply filter expression to browse
  ?List{PROP:IconList,1} = '~CANCEL.ICO'
  BRW10.AddField(CON5:NRO_CUOTA,BRW10.Q.CON5:NRO_CUOTA)    ! Field CON5:NRO_CUOTA is a hot field or requires assignment from browse
  BRW10.AddField(CON5:MES,BRW10.Q.CON5:MES)                ! Field CON5:MES is a hot field or requires assignment from browse
  BRW10.AddField(CON5:ANO,BRW10.Q.CON5:ANO)                ! Field CON5:ANO is a hot field or requires assignment from browse
  BRW10.AddField(CON5:MONTO_CUOTA,BRW10.Q.CON5:MONTO_CUOTA) ! Field CON5:MONTO_CUOTA is a hot field or requires assignment from browse
  BRW10.AddField(CON5:DEUDA_INICIAL,BRW10.Q.CON5:DEUDA_INICIAL) ! Field CON5:DEUDA_INICIAL is a hot field or requires assignment from browse
  BRW10.AddField(CON5:CANCELADO,BRW10.Q.CON5:CANCELADO)    ! Field CON5:CANCELADO is a hot field or requires assignment from browse
  BRW10.AddField(CON5:IDSOLICITUD,BRW10.Q.CON5:IDSOLICITUD) ! Field CON5:IDSOLICITUD is a hot field or requires assignment from browse
  BRW10.AddField(CON5:PERIODO,BRW10.Q.CON5:PERIODO)        ! Field CON5:PERIODO is a hot field or requires assignment from browse
  INIMgr.Fetch('UpdateCONVENIO1',QuickWindow)              ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  SELF.AddItem(ToolbarForm)
  BRW10.AddToolbarTarget(Toolbar)                          ! Browse accepts toolbar control
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:CONVENIO.Close
    Relate:CONVENIO_DETALLE.Close
    Relate:SOCIOS.Close
    Relate:TIPO_CONVENIO.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateCONVENIO1',QuickWindow)           ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF QuickWindow{Prop:AcceptAll} THEN RETURN.
  TIP:IDTIPO_CONVENIO = CON4:IDTIPO_CONVENIO               ! Assign linking field value
  Access:TIPO_CONVENIO.Fetch(TIP:PK_T_CONVENIO)
  SOC:IDSOCIO = CON4:IDSOCIO                               ! Assign linking field value
  Access:SOCIOS.Fetch(SOC:PK_SOCIOS)
  PARENT.Reset(Force)


ThisWindow.Run PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run()
  IF SELF.Request = ViewRecord                             ! In View Only mode always signal RequestCancelled
    ReturnValue = RequestCancelled
  END
  RETURN ReturnValue


ThisWindow.SetAlerts PROCEDURE

  CODE
  
  !!! Evolution Consulting FREE Templates Start!!!
     ALERT(EnterKey)
  
  !!! Evolution Consulting FREE Templates End!!!
  PARENT.SetAlerts


ThisWindow.TakeAccepted PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receive all EVENT:Accepted's
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
    CASE ACCEPTED()
    OF ?OK
      CON4:CANCELADO = 'SI'
      CON4:FECHA_CANCELADO = TODAY()
      
      !!! LOOP CONVENIO DETALLE
      CON5:IDSOLICITUD = CON4:IDSOLICITUD
      Set(CON5:FK_CONVENIO_DETALLE,CON5:FK_CONVENIO_DETALLE)
      LOOP
          IF ACCESS:CONVENIO_DETALLE.NEXT() THEN BREAK.
          IF CON5:IDSOLICITUD <> CON4:IDSOLICITUD THEN BREAK.
          IF CON5:CANCELADO = '' THEN
              CON5:CANCELADO = 'SI'
              CON5:OBSERVACION = 'CANCELACION ANTICIADA'
              PUT(CONVENIO_DETALLE)
          END
      END !LOOP
      
       
      
      
      
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?OK
      ThisWindow.Update()
      IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing THEN
         POST(EVENT:CloseWindow)
      END
    OF ?CON4:IDSOCIO
      IF Access:CONVENIO.TryValidateField(2)               ! Attempt to validate CON4:IDSOCIO in CONVENIO
        SELECT(?CON4:IDSOCIO)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?CON4:IDSOCIO
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?CON4:IDSOCIO{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?CON4:IDTIPO_CONVENIO
      IF Access:CONVENIO.TryValidateField(3)               ! Attempt to validate CON4:IDTIPO_CONVENIO in CONVENIO
        SELECT(?CON4:IDTIPO_CONVENIO)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?CON4:IDTIPO_CONVENIO
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?CON4:IDTIPO_CONVENIO{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeCompleted PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  ReturnValue = PARENT.TakeCompleted()
  !! IMPRIMO RECIBO
  GLO:IDSOLICITUD = CON4:IDSOLICITUD
  IMPRIMIR_RECIBO_CANCELACION
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeWindowEvent PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all window specific events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
    CASE EVENT()
    OF EVENT:AlertKey
      
      !!! Evolution Consulting FREE Templates Start!!!
       CASE KEYCODE()
         OF EnterKey
            CASE FOCUS(){Prop:Type}
              OF CREATE:Button
                 POST(EVENT:ACCEPTED,FOCUS())
              OF CREATE:text  
                 PRESSKEY(ShiftEnter)
              ELSE
                 IF FOCUS()<> ThisWindow.OkControl
                    PRESSKEY(TabKey)
                    RETURN(Level:Notify)
                 ELSE
                    POST(Event:Accepted,Self.OkControl)
                 END!IF
            END!CASE
       END!CASE
      
      !!! Evolution Consulting FREE Templates End!!!
    END
  ReturnValue = PARENT.TakeWindowEvent()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window


BRW10.ResetFromView PROCEDURE

CON4:MONTO_BONIFICADO:Sum REAL                             ! Sum variable for browse totals
  CODE
  SETCURSOR(Cursor:Wait)
  Relate:CONVENIO_DETALLE.SetQuickScan(1)
  SELF.Reset
  IF SELF.UseMRP
     IF SELF.View{PROP:IPRequestCount} = 0
          SELF.View{PROP:IPRequestCount} = 60
     END
  END
  LOOP
    IF SELF.UseMRP
       IF SELF.View{PROP:IPRequestCount} = 0
            SELF.View{PROP:IPRequestCount} = 60
       END
    END
    CASE SELF.Next()
    OF Level:Notify
      BREAK
    OF Level:Fatal
      SETCURSOR()
      RETURN
    END
    SELF.SetQueueRecord
    CON4:MONTO_BONIFICADO:Sum += CON5:MONTO_CUOTA
  END
  SELF.View{PROP:IPRequestCount} = 0
  CON4:MONTO_BONIFICADO = CON4:MONTO_BONIFICADO:Sum
  PARENT.ResetFromView
  Relate:CONVENIO_DETALLE.SetQuickScan(0)
  SETCURSOR()


BRW10.SetQueueRecord PROCEDURE

  CODE
  PARENT.SetQueueRecord
  
  IF (CON5:CANCELADO = 'SI')
    SELF.Q.CON5:NRO_CUOTA_Icon = 1                         ! Set icon from icon list
  ELSE
    SELF.Q.CON5:NRO_CUOTA_Icon = 0
  END


!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the CONVENIO File
!!! </summary>
CANCELAR_CONVENIO PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(CONVENIO)
                       PROJECT(CON4:IDSOLICITUD)
                       PROJECT(CON4:IDSOCIO)
                       PROJECT(CON4:IDTIPO_CONVENIO)
                       PROJECT(CON4:MONTO_TOTAL)
                       PROJECT(CON4:CANTIDAD_CUOTAS)
                       PROJECT(CON4:MONTO_CUOTA)
                       PROJECT(CON4:GASTOS_ADMINISTRATIVOS)
                       PROJECT(CON4:FECHA)
                       PROJECT(CON4:CANCELADO)
                       JOIN(TIP:PK_T_CONVENIO,CON4:IDTIPO_CONVENIO)
                         PROJECT(TIP:DESCRIPCION)
                         PROJECT(TIP:IDTIPO_CONVENIO)
                       END
                       JOIN(SOC:PK_SOCIOS,CON4:IDSOCIO)
                         PROJECT(SOC:NOMBRE)
                         PROJECT(SOC:MATRICULA)
                         PROJECT(SOC:IDSOCIO)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
CON4:IDSOLICITUD       LIKE(CON4:IDSOLICITUD)         !List box control field - type derived from field
CON4:IDSOCIO           LIKE(CON4:IDSOCIO)             !List box control field - type derived from field
SOC:NOMBRE             LIKE(SOC:NOMBRE)               !List box control field - type derived from field
SOC:MATRICULA          LIKE(SOC:MATRICULA)            !List box control field - type derived from field
CON4:IDTIPO_CONVENIO   LIKE(CON4:IDTIPO_CONVENIO)     !List box control field - type derived from field
TIP:DESCRIPCION        LIKE(TIP:DESCRIPCION)          !List box control field - type derived from field
CON4:MONTO_TOTAL       LIKE(CON4:MONTO_TOTAL)         !List box control field - type derived from field
CON4:CANTIDAD_CUOTAS   LIKE(CON4:CANTIDAD_CUOTAS)     !List box control field - type derived from field
CON4:MONTO_CUOTA       LIKE(CON4:MONTO_CUOTA)         !List box control field - type derived from field
CON4:GASTOS_ADMINISTRATIVOS LIKE(CON4:GASTOS_ADMINISTRATIVOS) !List box control field - type derived from field
CON4:FECHA             LIKE(CON4:FECHA)               !List box control field - type derived from field
CON4:CANCELADO         LIKE(CON4:CANCELADO)           !List box control field - type derived from field
TIP:IDTIPO_CONVENIO    LIKE(TIP:IDTIPO_CONVENIO)      !Related join file key field - type derived from field
SOC:IDSOCIO            LIKE(SOC:IDSOCIO)              !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Cancelar Convenio'),AT(,,529,198),FONT('Arial',8,,FONT:regular),RESIZE,CENTER,GRAY, |
  IMM,MDI,HLP('BrowseCONVENIO'),SYSTEM
                       LIST,AT(8,30,516,124),USE(?Browse:1),HVSCROLL,FORMAT('64R(2)|M~IDSOLICITUD~C(0)@n-14@[3' & |
  '4L(2)|M~IDSOCIO~C(0)@n-7@120L(2)|M~NOMBRE~C(0)@s30@56L(2)|M~MATRI~C(0)@n-5@](184)|M~' & |
  'COLEGIADOS~[25L(2)|M~IDTC~C(0)@n-5@200L(2)|M~DESCRIPCION~C(0)@s30@](150)|M~TIPO~56L(' & |
  '2)|M~MONTO DEUDA~C(0)@n$-10.2@64L(2)|M~CANT CUOTAS~C(0)@n-3@57L(2)|M~MONTO CUOTA~C(0' & |
  ')@n$-10.2@56L(2)|M~GASTOS ADM~C(0)@n$-10.2@80L(2)|M~FECHA~C(0)@d17@8L(2)|M~CANCELADO~C(0)@s2@'), |
  FROM(Queue:Browse:1),IMM,MSG('Administrador de CONVENIO'),VCR
                       BUTTON('&Ver'),AT(309,158,49,14),USE(?View:2),LEFT,ICON('v.ico'),CURSOR('mano.cur'),FLAT,MSG('Visualizar'), |
  TIP('Visualizar')
                       BUTTON('&Agregar'),AT(158,161,49,14),USE(?Insert:3),LEFT,ICON('a.ico'),CURSOR('mano.cur'), |
  DISABLE,FLAT,HIDE,MSG('Agrega Registro'),TIP('Agrega Registro')
                       BUTTON('&Cancelar Convenio'),AT(431,157,91,17),USE(?Change:3),LEFT,ICON('b.ico'),CURSOR('mano.cur'), |
  DEFAULT,FLAT,MSG('Cambia Registro'),TIP('Cambia Registro')
                       BUTTON('&Borrar'),AT(301,158,49,14),USE(?Delete:3),LEFT,ICON('b.ico'),CURSOR('mano.cur'),DISABLE, |
  FLAT,HIDE,MSG('Borra Registro'),TIP('Borra Registro')
                       SHEET,AT(4,1,524,175),USE(?CurrentTab)
                         TAB('CONVENIO'),USE(?Tab:2)
                           PROMPT('IDSOLICITUD:'),AT(133,17),USE(?CON4:IDSOLICITUD:Prompt)
                           ENTRY(@n-14),AT(183,16,60,10),USE(CON4:IDSOLICITUD),REQ
                         END
                         TAB('SOCIOS'),USE(?Tab:3)
                           PROMPT('IDSOCIO:'),AT(126,17),USE(?CON4:IDSOCIO:Prompt)
                           ENTRY(@n-14),AT(176,17,60,10),USE(CON4:IDSOCIO)
                         END
                       END
                       BUTTON('&Salir'),AT(478,180,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Salir'),TIP('Salir')
                       BUTTON('&Filtro'),AT(5,182,49,14),USE(?Query),LEFT,ICON('qkqbe.ico'),FLAT
                       BUTTON('E&xportar'),AT(58,181,52,15),USE(?EvoExportar),LEFT,ICON('export.ico'),FLAT
                       PROMPT('&Orden:'),AT(8,16),USE(?SortOrderList:Prompt)
                       LIST,AT(48,16,75,10),USE(?SortOrderList),DROP(20),FROM(''),MSG('Select the Sort Order'),TIP('Select the' & |
  ' Sort Order')
                     END

Loc::QHlist9 QUEUE,PRE(QHL9)
Id                         SHORT
Nombre                     STRING(100)
Longitud                   SHORT
Pict                       STRING(50)
Tot                 BYTE
                         END
QPar9 QUEUE,PRE(Q9)
FieldPar                 CSTRING(800)
                         END
QPar29 QUEUE,PRE(Qp29)
F2N                 CSTRING(300)
F2P                 CSTRING(100)
F2T                 BYTE
                         END
Loc::TituloListado9          STRING(100)
Loc::Titulo9          STRING(100)
SavPath9          STRING(2000)
Evo::Group9  GROUP,PRE()
Evo::Procedure9          STRING(100)
Evo::App9          STRING(100)
Evo::NroPage          LONG
   END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
QBE8                 QueryListClass                        ! QBE List Class. 
QBV8                 QueryListVisual                       ! QBE Visual Class
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
                     END

BRW1::Sort0:Locator  EntryLocatorClass                     ! Default Locator
BRW1::Sort1:Locator  EntryLocatorClass                     ! Conditional Locator - CHOICE(?CurrentTab) = 2
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

Ec::LoadI_9  SHORT
Gol_woI_9 WINDOW,AT(,,236,43),FONT('MS Sans Serif',8,,),CENTER,GRAY
       IMAGE('clock.ico'),AT(8,11),USE(?ImgoutI_9),CENTERED
       GROUP,AT(38,11,164,20),USE(?G::I_9),BOXED,BEVEL(-1)
         STRING('Preparando datos para Exportacion'),AT(63,11),USE(?StrOutI_9),TRN
         STRING('Aguarde un instante por Favor...'),AT(67,20),USE(?StrOut2I_9),TRN
       END
     END


  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
!---------------------------------------------------------------------------
PrintExBrowse9 ROUTINE

 OPEN(Gol_woI_9)
 DISPLAY()
 SETTARGET(QuickWindow)
 SETCURSOR(CURSOR:WAIT)
 EC::LoadI_9 = BRW1.FileLoaded
 IF Not  EC::LoadI_9
     BRW1.FileLoaded=True
     CLEAR(BRW1.LastItems,1)
     BRW1.ResetFromFile()
 END
 CLOSE(Gol_woI_9)
 SETCURSOR()
  Evo::App9          = 'Gestion'
  Evo::Procedure9          = GlobalErrors.GetProcedureName()& 9
 
  FREE(QPar9)
  Q9:FieldPar  = '1,2,3,4,5,6,7,8,9,10,11,12,'
  ADD(QPar9)  !!1
  Q9:FieldPar  = ';'
  ADD(QPar9)  !!2
  Q9:FieldPar  = 'Spanish'
  ADD(QPar9)  !!3
  Q9:FieldPar  = ''
  ADD(QPar9)  !!4
  Q9:FieldPar  = true
  ADD(QPar9)  !!5
  Q9:FieldPar  = ''
  ADD(QPar9)  !!6
  Q9:FieldPar  = true
  ADD(QPar9)  !!7
 !!!! Exportaciones
  Q9:FieldPar  = 'HTML|'
   Q9:FieldPar  = CLIP( Q9:FieldPar)&'EXCEL|'
   Q9:FieldPar  = CLIP( Q9:FieldPar)&'WORD|'
  Q9:FieldPar  = CLIP( Q9:FieldPar)&'ASCII|'
   Q9:FieldPar  = CLIP( Q9:FieldPar)&'XML|'
   Q9:FieldPar  = CLIP( Q9:FieldPar)&'PRT|'
  ADD(QPar9)  !!8
  Q9:FieldPar  = 'All'
  ADD(QPar9)   !.9.
  Q9:FieldPar  = ' 0'
  ADD(QPar9)   !.10
  Q9:FieldPar  = 0
  ADD(QPar9)   !.11
  Q9:FieldPar  = '1'
  ADD(QPar9)   !.12
 
  Q9:FieldPar  = ''
  ADD(QPar9)   !.13
 
  Q9:FieldPar  = ''
  ADD(QPar9)   !.14
 
  Q9:FieldPar  = ''
  ADD(QPar9)   !.15
 
   Q9:FieldPar  = '16'
  ADD(QPar9)   !.16
 
   Q9:FieldPar  = 1
  ADD(QPar9)   !.17
   Q9:FieldPar  = 2
  ADD(QPar9)   !.18
   Q9:FieldPar  = '2'
  ADD(QPar9)   !.19
   Q9:FieldPar  = 12
  ADD(QPar9)   !.20
 
   Q9:FieldPar  = 0 !Exporta excel sin borrar
  ADD(QPar9)   !.21
 
   Q9:FieldPar  = Evo::NroPage !Nro Pag. Desde Report (BExp)
  ADD(QPar9)   !.22
 
   CLEAR(Q9:FieldPar)
  ADD(QPar9)   ! 23 Caracteres Encoding para xml
 
  Q9:FieldPar  = '0'
  ADD(QPar9)   ! 24 Use Open Office
 
   Q9:FieldPar  = 'golmedo'
  ADD(QPar9) ! 25
 
 !---------------------------------------------------------------------------------------------
 !!Registration 
  Q9:FieldPar  = ' BrowseExport'
  ADD(QPar9)   ! 26  BrowseExport
  Q9:FieldPar  = ' '
  ADD(QPar9)   ! 27  
  Q9:FieldPar  = ' ' 
  ADD(QPar9)   ! 28  
  Q9:FieldPar  = 'BEXPORT' 
  ADD(QPar9)   ! 29 Gestion027.clw
 !!!!!
 
 
  FREE(QPar29)
       Qp29:F2N  = 'IDSOLICITUD'
  Qp29:F2P  = '@n-14'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'IDSOCIO'
  Qp29:F2P  = '@n-7'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'NOMBRE'
  Qp29:F2P  = '@s30'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'MATRI'
  Qp29:F2P  = '@n-5'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'IDTC'
  Qp29:F2P  = '@n-5'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'DESCRIPCION'
  Qp29:F2P  = '@s30'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'MONTO TOTAL'
  Qp29:F2P  = '@n-10.2'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'CANTIDAD CUOTAS'
  Qp29:F2P  = '@n-14'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'MONTO CUOTA'
  Qp29:F2P  = '@n-10.2'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'GASTOS ADMINISTRATIVOS'
  Qp29:F2P  = '@n-10.2'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'FECHA'
  Qp29:F2P  = '@d17'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'CANCELADO'
  Qp29:F2P  = '@s2'
  Qp29:F2T  = '0'
  ADD(QPar29)
  SysRec# = false
  FREE(Loc::QHlist9)
  LOOP
     SysRec# += 1
     IF ?Browse:1{PROPLIST:Exists,SysRec#} = 1
         GET(QPar29,SysRec#)
         QHL9:Id      = SysRec#
         QHL9:Nombre  = Qp29:F2N
         QHL9:Longitud= ?Browse:1{PropList:Width,SysRec#}  /2
         QHL9:Pict    = Qp29:F2P
         QHL9:Tot    = Qp29:F2T
         ADD(Loc::QHlist9)
      Else
        break
     END
  END
  Loc::Titulo9 ='CONVENIO'
 
 SavPath9 = PATH()
  Exportar(Loc::QHlist9,BRW1.Q,QPar9,0,Loc::Titulo9,Evo::Group9)
 IF Not EC::LoadI_9 Then  BRW1.FileLoaded=false.
 SETPATH(SavPath9)
 !!!! Fin Routina Templates Clarion

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('CANCELAR_CONVENIO')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('CON4:IDTIPO_CONVENIO',CON4:IDTIPO_CONVENIO)        ! Added by: BrowseBox(ABC)
  BIND('CON4:MONTO_TOTAL',CON4:MONTO_TOTAL)                ! Added by: BrowseBox(ABC)
  BIND('CON4:CANTIDAD_CUOTAS',CON4:CANTIDAD_CUOTAS)        ! Added by: BrowseBox(ABC)
  BIND('CON4:MONTO_CUOTA',CON4:MONTO_CUOTA)                ! Added by: BrowseBox(ABC)
  BIND('CON4:GASTOS_ADMINISTRATIVOS',CON4:GASTOS_ADMINISTRATIVOS) ! Added by: BrowseBox(ABC)
  BIND('TIP:IDTIPO_CONVENIO',TIP:IDTIPO_CONVENIO)          ! Added by: BrowseBox(ABC)
  BIND('SOC:IDSOCIO',SOC:IDSOCIO)                          ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:CONVENIO.Open                                     ! File CONVENIO used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:CONVENIO,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?CurrentTab{PROP:WIZARD}=True
  ?SortOrderList{PROP:FROM}=|
                CHOOSE(SUB(?Tab:2{PROP:TEXT},1,1)='&',SUB(?Tab:2{PROP:TEXT},2,LEN(?Tab:2{PROP:TEXT})-1),?Tab:2{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab:3{PROP:TEXT},1,1)='&',SUB(?Tab:3{PROP:TEXT},2,LEN(?Tab:3{PROP:TEXT})-1),?Tab:3{PROP:TEXT})&|
                ''
  ?SortOrderList{PROP:SELECTED}=1
  Do DefineListboxStyle
  QBE8.Init(QBV8, INIMgr,'BrowseCONVENIO', GlobalErrors)
  QBE8.QkSupport = True
  QBE8.QkMenuIcon = 'QkQBE.ico'
  QBE8.QkIcon = 'QkLoad.ico'
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,CON4:FK_CONVENIO_SOCIOS)              ! Add the sort order for CON4:FK_CONVENIO_SOCIOS for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(?CON4:IDSOCIO,CON4:IDSOCIO,,BRW1) ! Initialize the browse locator using ?CON4:IDSOCIO using key: CON4:FK_CONVENIO_SOCIOS , CON4:IDSOCIO
  BRW1.SetFilter('(CON4:CANCELADO='''')')                  ! Apply filter expression to browse
  BRW1.AddSortOrder(,CON4:PK_CONVENIO)                     ! Add the sort order for CON4:PK_CONVENIO for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(?CON4:IDSOLICITUD,CON4:IDSOLICITUD,,BRW1) ! Initialize the browse locator using ?CON4:IDSOLICITUD using key: CON4:PK_CONVENIO , CON4:IDSOLICITUD
  BRW1.SetFilter('(CON4:CANCELADO='''')')                  ! Apply filter expression to browse
  BRW1.AddField(CON4:IDSOLICITUD,BRW1.Q.CON4:IDSOLICITUD)  ! Field CON4:IDSOLICITUD is a hot field or requires assignment from browse
  BRW1.AddField(CON4:IDSOCIO,BRW1.Q.CON4:IDSOCIO)          ! Field CON4:IDSOCIO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:NOMBRE,BRW1.Q.SOC:NOMBRE)              ! Field SOC:NOMBRE is a hot field or requires assignment from browse
  BRW1.AddField(SOC:MATRICULA,BRW1.Q.SOC:MATRICULA)        ! Field SOC:MATRICULA is a hot field or requires assignment from browse
  BRW1.AddField(CON4:IDTIPO_CONVENIO,BRW1.Q.CON4:IDTIPO_CONVENIO) ! Field CON4:IDTIPO_CONVENIO is a hot field or requires assignment from browse
  BRW1.AddField(TIP:DESCRIPCION,BRW1.Q.TIP:DESCRIPCION)    ! Field TIP:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(CON4:MONTO_TOTAL,BRW1.Q.CON4:MONTO_TOTAL)  ! Field CON4:MONTO_TOTAL is a hot field or requires assignment from browse
  BRW1.AddField(CON4:CANTIDAD_CUOTAS,BRW1.Q.CON4:CANTIDAD_CUOTAS) ! Field CON4:CANTIDAD_CUOTAS is a hot field or requires assignment from browse
  BRW1.AddField(CON4:MONTO_CUOTA,BRW1.Q.CON4:MONTO_CUOTA)  ! Field CON4:MONTO_CUOTA is a hot field or requires assignment from browse
  BRW1.AddField(CON4:GASTOS_ADMINISTRATIVOS,BRW1.Q.CON4:GASTOS_ADMINISTRATIVOS) ! Field CON4:GASTOS_ADMINISTRATIVOS is a hot field or requires assignment from browse
  BRW1.AddField(CON4:FECHA,BRW1.Q.CON4:FECHA)              ! Field CON4:FECHA is a hot field or requires assignment from browse
  BRW1.AddField(CON4:CANCELADO,BRW1.Q.CON4:CANCELADO)      ! Field CON4:CANCELADO is a hot field or requires assignment from browse
  BRW1.AddField(TIP:IDTIPO_CONVENIO,BRW1.Q.TIP:IDTIPO_CONVENIO) ! Field TIP:IDTIPO_CONVENIO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:IDSOCIO,BRW1.Q.SOC:IDSOCIO)            ! Field SOC:IDSOCIO is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('CANCELAR_CONVENIO',QuickWindow)            ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.QueryControl = ?Query
  BRW1.UpdateQuery(QBE8,1)
  BRW1.AskProcedure = 1                                    ! Will call: UpdateCONVENIO1
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  SELF.SetAlerts()
  
    Clear(CWT#)
    LOOP
      CWT# +=1 
       IF ?Browse:1{PROPLIST:Exists,CWT#} = 1
          ?Browse:1{PROPLIST:Underline,CWT#} = true
       Else
          break
       END
    END
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:CONVENIO.Close
  END
  IF SELF.Opened
    INIMgr.Update('CANCELAR_CONVENIO',QuickWindow)         ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Run PROCEDURE(USHORT Number,BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run(Number,Request)
  IF SELF.Request = ViewRecord
    ReturnValue = RequestCancelled                         ! Always return RequestCancelled if the form was opened in ViewRecord mode
  ELSE
    GlobalRequest = Request
    UpdateCONVENIO1
    ReturnValue = GlobalResponse
  END
  RETURN ReturnValue


ThisWindow.SetAlerts PROCEDURE

  CODE
  
  !!! Evolution Consulting FREE Templates Start!!!
     ALERT(EnterKey)
  
  !!! Evolution Consulting FREE Templates End!!!
  PARENT.SetAlerts


ThisWindow.TakeAccepted PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receive all EVENT:Accepted's
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?EvoExportar
      ThisWindow.Update()
       Do PrintExBrowse9
    OF ?SortOrderList
      EXECUTE(CHOICE(?SortOrderList))
       SELECT(?Tab:2)
       SELECT(?Tab:3)
      END
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeWindowEvent PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all window specific events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
    CASE EVENT()
    OF EVENT:AlertKey
      
      !!! Evolution Consulting FREE Templates Start!!!
       CASE KEYCODE()
         OF EnterKey
            CASE FOCUS(){Prop:Type}
              OF CREATE:Button
                 POST(EVENT:ACCEPTED,FOCUS())
              OF CREATE:text  
                 PRESSKEY(ShiftEnter)
              ELSE
                 IF FOCUS()<> ThisWindow.OkControl
                    PRESSKEY(TabKey)
                    RETURN(Level:Notify)
                 ELSE
                    POST(Event:Accepted,Self.OkControl)
                 END!IF
            END!CASE
       END!CASE
      
      !!! Evolution Consulting FREE Templates End!!!
    END
  ReturnValue = PARENT.TakeWindowEvent()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


BRW1.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert:3
    SELF.ChangeControl=?Change:3
    SELF.DeleteControl=?Delete:3
  END
  SELF.ViewControl = ?View:2                               ! Setup the control used to initiate view only mode


BRW1.ResetSort PROCEDURE(BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  IF CHOICE(?CurrentTab) = 2
    RETURN SELF.SetSort(1,Force)
  ELSE
    RETURN SELF.SetSort(2,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


BRW1.SetAlerts PROCEDURE

  CODE
  SELF.EditViaPopup = False
  PARENT.SetAlerts


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Report
!!! Recibo de Pago 
!!! </summary>
IMPRIMIR_PAGO_CONVENIO PROCEDURE 

Progress:Thermometer BYTE                                  ! 
L:NroReg             LONG                                  ! 
Process:View         VIEW(PAGO_CONVENIO)
                       PROJECT(PAGCON:FECHA)
                       PROJECT(PAGCON:IDPAGO)
                       PROJECT(PAGCON:IDRECIBO)
                       PROJECT(PAGCON:IDSOLICITUD)
                       PROJECT(PAGCON:IDSUCURSAL)
                       PROJECT(PAGCON:MONTO_CUOTA)
                       PROJECT(PAGCON:NRO_CUOTA)
                       PROJECT(PAGCON:OBSERVACION)
                       PROJECT(PAGCON:IDSOCIO)
                       JOIN(SOC:PK_SOCIOS,PAGCON:IDSOCIO)
                         PROJECT(SOC:MATRICULA)
                         PROJECT(SOC:NOMBRE)
                       END
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

Report               REPORT,AT(1000,1896,6917,1417),PRE(RPT),PAPER(PAPER:A4),FONT('Arial',9,COLOR:Black,FONT:bold, |
  CHARSET:ANSI),THOUS
                       HEADER,AT(1000,1000,6927,1042),USE(?unnamed)
                         STRING('Recibo  Nº '),AT(4646,42),USE(?String1),FONT(,12,,FONT:bold),TRN
                         IMAGE('Logo.JPG'),AT(21,10,1771,1021),USE(?Image1)
                         STRING(@n-14),AT(5573,31),USE(PAGCON:IDPAGO),RIGHT(1)
                         STRING('Fecha:'),AT(5135,458),USE(?String15),TRN
                         STRING(@d17),AT(5573,458),USE(PAGCON:FECHA),RIGHT(1)
                       END
detail                 DETAIL,AT(0,0,,1552),USE(?unnamed:4)
                         LINE,AT(10,73,6896,0),USE(?Line1),COLOR(COLOR:Black)
                         STRING(@s30),AT(2719,354),USE(SOC:NOMBRE)
                         STRING(@n-10.2),AT(2677,563),USE(PAGCON:MONTO_CUOTA),LEFT
                         STRING(@n-14),AT(5635,563),USE(PAGCON:IDSOLICITUD),RIGHT(1)
                         STRING('El Colegio de Psicologos del Valle Inferior de rio Negro  .  recibe del Colegia' & |
  'do Matricula  Nº :'),AT(31,167,6010,188),USE(?String3),TRN
                         STRING(@n-14),AT(1698,354),USE(SOC:MATRICULA)
                         STRING('la suma de Pesos: '),AT(1573,563),USE(?String6),TRN
                         STRING('en concepto de pago del convenio  Nº:'),AT(3427,563),USE(?String8),TRN
                         STRING(@n-7),AT(1073,885),USE(PAGCON:IDRECIBO),RIGHT(1)
                         STRING(@n-5),AT(3708,885),USE(PAGCON:NRO_CUOTA),RIGHT(1)
                         STRING('de:'),AT(4229,885),USE(?String27),TRN
                         STRING('Nº Recibo: '),AT(21,885),USE(?String24),TRN
                         STRING(@n-3),AT(688,885),USE(PAGCON:IDSUCURSAL),RIGHT(1)
                         STRING('correspondiente a la cuota Nro. :'),AT(1729,885),USE(?String13),TRN
                         STRING(@s50),AT(4521,885,2260,188),USE(PAGCON:OBSERVACION)
                         LINE,AT(-20,1104,6927,0),USE(?Line3),COLOR(COLOR:Black)
                         STRING(@s100),AT(21,1188,6292,188),USE(REPORTE_LARGO),FONT(,8)
                         LINE,AT(21,1385,6896,0),USE(?Line2),COLOR(COLOR:Black)
                       END
                       FOOTER,AT(990,3313,6927,1094),USE(?unnamed:2)
                         STRING(@n-14),AT(1042,385),USE(GLO:IDUSUARIO),RIGHT(1)
                         STRING('Fecha:'),AT(21,10),USE(?ReportDatePrompt),TRN
                         STRING('<<-- Date Stamp -->'),AT(1021,10),USE(?ReportDateStamp),TRN
                         STRING('Hora:'),AT(31,188),USE(?ReportTimePrompt),TRN
                         STRING('<<-- Time Stamp -->'),AT(1031,188),USE(?ReportTimeStamp),TRN
                         STRING('Operador:'),AT(52,385),USE(?String22),TRN
                       END
                       FORM,AT(1000,1000,6927,3417),USE(?unnamed:3)
                       END
                     END
ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
OpenReport             PROCEDURE(),BYTE,PROC,DERIVED
SetStaticControlsAttributes PROCEDURE(),DERIVED
                     END

ThisReport           CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ProgressMgr          StepLongClass                         ! Progress Manager
Previewer            PrintPreviewClass                     ! Print Previewer
TargetSelector       ReportTargetSelectorClass             ! Report Target Selector
XMLReporter          CLASS(XMLReportGenerator)             ! XML
Setup                  PROCEDURE(),DERIVED
                     END

HTMLReporter         CLASS(HTMLReportGenerator)            ! HTML
SetUp                  PROCEDURE(),DERIVED
                     END

PDFReporter          CLASS(PDFReportGenerator)             ! PDF
SetUp                  PROCEDURE(),DERIVED
                     END

TXTReporter          CLASS(TextReportGenerator)            ! TXT
Setup                  PROCEDURE(),DERIVED
                     END


  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
!---------------------------------------------------------------------------

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('IMPRIMIR_PAGO_CONVENIO')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:PAGO_CONVENIO.Open                                ! File PAGO_CONVENIO used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('IMPRIMIR_PAGO_CONVENIO',ProgressWindow)    ! Restore window settings from non-volatile store
  TargetSelector.AddItem(XMLReporter.IReportGenerator)
  TargetSelector.AddItem(HTMLReporter.IReportGenerator)
  TargetSelector.AddItem(PDFReporter.IReportGenerator)
  TargetSelector.AddItem(TXTReporter.IReportGenerator)
  SELF.AddItem(TargetSelector)
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisReport.Init(Process:View, Relate:PAGO_CONVENIO, ?Progress:PctText, Progress:Thermometer, ProgressMgr, PAGCON:IDPAGO)
  ThisReport.AddSortOrder(PAGCON:PK_PAGO_CONVENIO)
  ThisReport.AddRange(PAGCON:IDPAGO,GLO:PAGO)
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:PAGO_CONVENIO.SetQuickScan(1,Propagate:OneMany)
  ProgressWindow{PROP:Timer} = 10                          ! Assign timer interval
  SELF.SkipPreview = False
  Previewer.SetINIManager(INIMgr)
  Previewer.AllowUserZoom = True
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:PAGO_CONVENIO.Close
  END
  IF SELF.Opened
    INIMgr.Update('IMPRIMIR_PAGO_CONVENIO',ProgressWindow) ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.OpenReport PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  SYSTEM{PROP:PrintMode} = 3
  ReturnValue = PARENT.OpenReport()
  IF ReturnValue = Level:Benign
    SELF.Report $ ?ReportDateStamp{PROP:Text} = FORMAT(TODAY(),@D17)
  END
  IF ReturnValue = Level:Benign
    SELF.Report $ ?ReportTimeStamp{PROP:Text} = FORMAT(CLOCK(),@T7)
  END
  IF ReturnValue = Level:Benign
    SELF.Report{PROPPRINT:Extend}=True
  END
  RETURN ReturnValue


ThisWindow.SetStaticControlsAttributes PROCEDURE

  CODE
  PARENT.SetStaticControlsAttributes
  !XML STATIC
  SELF.Attribute.Set(?String1,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String1,RepGen:XML,TargetAttr:TagName,'String1')
  SELF.Attribute.Set(?String1,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PAGCON:IDPAGO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PAGCON:IDPAGO,RepGen:XML,TargetAttr:TagName,'PAGCON:IDPAGO')
  SELF.Attribute.Set(?PAGCON:IDPAGO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String15,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String15,RepGen:XML,TargetAttr:TagName,'String15')
  SELF.Attribute.Set(?String15,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PAGCON:FECHA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PAGCON:FECHA,RepGen:XML,TargetAttr:TagName,'PAGCON:FECHA')
  SELF.Attribute.Set(?PAGCON:FECHA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagName,'SOC:NOMBRE')
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PAGCON:MONTO_CUOTA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PAGCON:MONTO_CUOTA,RepGen:XML,TargetAttr:TagName,'PAGCON:MONTO_CUOTA')
  SELF.Attribute.Set(?PAGCON:MONTO_CUOTA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PAGCON:IDSOLICITUD,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PAGCON:IDSOLICITUD,RepGen:XML,TargetAttr:TagName,'PAGCON:IDSOLICITUD')
  SELF.Attribute.Set(?PAGCON:IDSOLICITUD,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String3,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String3,RepGen:XML,TargetAttr:TagName,'String3')
  SELF.Attribute.Set(?String3,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagName,'SOC:MATRICULA')
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String6,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String6,RepGen:XML,TargetAttr:TagName,'String6')
  SELF.Attribute.Set(?String6,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String8,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String8,RepGen:XML,TargetAttr:TagName,'String8')
  SELF.Attribute.Set(?String8,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PAGCON:IDRECIBO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PAGCON:IDRECIBO,RepGen:XML,TargetAttr:TagName,'PAGCON:IDRECIBO')
  SELF.Attribute.Set(?PAGCON:IDRECIBO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PAGCON:NRO_CUOTA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PAGCON:NRO_CUOTA,RepGen:XML,TargetAttr:TagName,'PAGCON:NRO_CUOTA')
  SELF.Attribute.Set(?PAGCON:NRO_CUOTA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String27,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String27,RepGen:XML,TargetAttr:TagName,'String27')
  SELF.Attribute.Set(?String27,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String24,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String24,RepGen:XML,TargetAttr:TagName,'String24')
  SELF.Attribute.Set(?String24,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PAGCON:IDSUCURSAL,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PAGCON:IDSUCURSAL,RepGen:XML,TargetAttr:TagName,'PAGCON:IDSUCURSAL')
  SELF.Attribute.Set(?PAGCON:IDSUCURSAL,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String13,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String13,RepGen:XML,TargetAttr:TagName,'String13')
  SELF.Attribute.Set(?String13,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PAGCON:OBSERVACION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PAGCON:OBSERVACION,RepGen:XML,TargetAttr:TagName,'PAGCON:OBSERVACION')
  SELF.Attribute.Set(?PAGCON:OBSERVACION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?REPORTE_LARGO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?REPORTE_LARGO,RepGen:XML,TargetAttr:TagName,'REPORTE_LARGO')
  SELF.Attribute.Set(?REPORTE_LARGO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?GLO:IDUSUARIO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GLO:IDUSUARIO,RepGen:XML,TargetAttr:TagName,'GLO:IDUSUARIO')
  SELF.Attribute.Set(?GLO:IDUSUARIO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?ReportDatePrompt,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ReportDatePrompt,RepGen:XML,TargetAttr:TagName,'ReportDatePrompt')
  SELF.Attribute.Set(?ReportDatePrompt,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?ReportDateStamp,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ReportDateStamp,RepGen:XML,TargetAttr:TagName,'ReportDateStamp')
  SELF.Attribute.Set(?ReportDateStamp,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?ReportTimePrompt,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ReportTimePrompt,RepGen:XML,TargetAttr:TagName,'ReportTimePrompt')
  SELF.Attribute.Set(?ReportTimePrompt,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?ReportTimeStamp,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ReportTimeStamp,RepGen:XML,TargetAttr:TagName,'ReportTimeStamp')
  SELF.Attribute.Set(?ReportTimeStamp,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String22,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String22,RepGen:XML,TargetAttr:TagName,'String22')
  SELF.Attribute.Set(?String22,RepGen:XML,TargetAttr:TagValueFromText,True)


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  ReturnValue = PARENT.TakeRecord()
  PRINT(RPT:detail)
  RETURN ReturnValue


XMLReporter.Setup PROCEDURE

  CODE
  PARENT.Setup
  SELF.SetFileName('')
  SELF.SetRootTag('Clarion_60_XML_Document')
  SELF.SetForceXMLHeader(True)
  SELF.SetSupportNameSpaces(False)
  SELF.SetUseCRLF(True)
  SELF.SetPagesAsDifferentFile(False)
  SELF.SetPagesAsParentTag(False)


HTMLReporter.SetUp PROCEDURE

  CODE
  PARENT.SetUp
  SELF.SetFileName('')
  SELF.SetDocumentName('Clarion Report')
  SELF.SetNavigationText('First','Last','Next','Prior','Select Page','Page_','Load Page')
  SELF.SetSubDirectory(1,'_Files','_Images')
  SELF.SetSingleFile(0)


PDFReporter.SetUp PROCEDURE

  CODE
  PARENT.SetUp
  SELF.SetFileName('')
  SELF.SetDocumentInfo('CW Report','Gestion','IMPRIMIR_PAGO','IMPRIMIR_PAGO','','')
  SELF.SetPagesAsParentBookmark(False)
  SELF.SetScanCopyMode(False)
  SELF.CompressText   = True
  SELF.CompressImages = True


TXTReporter.Setup PROCEDURE

  CODE
  PARENT.Setup
  SELF.SetFileName('')
  SELF.SetPagesAsDifferentFile(False)
  SELF.SetMargin(0,0,0,0)
  SELF.SetPageLen(0)
  SELF.SetCheckBoxString('[X]','[_]')
  SELF.SetRadioButtonString('(*)','(_)')
  SELF.SetLineString('|','|','-','-','/','\','\','/')
  SELF.SetTextFillString(' ',CHR(176),CHR(177),CHR(178),CHR(219))
  SELF.SetOmitGraph(False)

!!! <summary>
!!! Generated from procedure template - Window
!!! Actualizacion PAGO_CONVENIO
!!! </summary>
UpdatePAGO_CONVENIO PROCEDURE 

CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
History::PAGCON:Record LIKE(PAGCON:RECORD),THREAD
QuickWindow          WINDOW('Actualizacion PAGO CONVENIO'),AT(,,273,184),FONT('MS Sans Serif',8,,FONT:regular), |
  RESIZE,CENTER,GRAY,IMM,MDI,HLP('UpdatePAGO_CONVENIO'),SYSTEM
                       PROMPT('IDSOCIO:'),AT(3,5),USE(?PAGCON:IDSOCIO:Prompt),TRN
                       ENTRY(@n-14),AT(57,5,64,10),USE(PAGCON:IDSOCIO),RIGHT(1)
                       BUTTON('...'),AT(124,4,12,12),USE(?CallLookup)
                       STRING(@s30),AT(140,5),USE(SOC:NOMBRE)
                       ENTRY(@n-14),AT(59,26,20,10),USE(PAGCON:IDSUCURSAL),RIGHT(1)
                       PROMPT('NRO. RECIBO:'),AT(3,26),USE(?PAGCON:IDRECIBO:Prompt)
                       ENTRY(@n-14),AT(83,25,64,10),USE(PAGCON:IDRECIBO),RIGHT(1)
                       LINE,AT(0,42,271,0),USE(?Line1),COLOR(COLOR:Black)
                       BUTTON('Elegir Cuota'),AT(98,46,77,22),USE(?Button4),LEFT,ICON('select.ico'),FLAT
                       LINE,AT(1,74,272,0),USE(?Line2),COLOR(COLOR:Black)
                       PROMPT('Nro. Solicitud: '),AT(82,82),USE(?Prompt4)
                       STRING(@n-14),AT(140,82),USE(GLO:IDSOLICITUD)
                       PROMPT('Monto Cuota a Pagar:'),AT(35,101),USE(?Prompt3),FONT(,14)
                       STRING(@n$-10.2),AT(165,101),USE(GLO:MONTO),FONT(,14,COLOR:Red,FONT:bold+FONT:underline)
                       PROMPT('FORMA DE PAGO:'),AT(15,129),USE(?PAGCON:IDSUBCUENTA:Prompt)
                       ENTRY(@n-14),AT(78,129,64,10),USE(PAGCON:IDSUBCUENTA),REQ
                       BUTTON('...'),AT(144,128,12,12),USE(?CallLookup:2)
                       STRING(@s50),AT(163,129),USE(SUB:DESCRIPCION)
                       LINE,AT(0,155,273,0),USE(?Line3),COLOR(COLOR:Black)
                       BUTTON('&Aceptar'),AT(76,161,49,14),USE(?OK),LEFT,ICON('ok.ico'),CURSOR('mano.cur'),DEFAULT, |
  FLAT,MSG('Confirma y Actualiza el Formulario'),TIP('Confirma y Actualiza el Formulario')
                       BUTTON('&Cancelar'),AT(130,161,55,14),USE(?Cancel),LEFT,ICON('cancelar.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Cancela Operacion'),TIP('Cancela Operacion')
                     END

ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeCompleted          PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
ToolbarForm          ToolbarUpdateClass                    ! Form Toolbar Manager
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

CurCtrlFeq          LONG
FieldColorQueue     QUEUE
Feq                   LONG
OldColor              LONG
                    END

  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
!---------------------------------------------------------------------------

ThisWindow.Ask PROCEDURE

  CODE
  CASE SELF.Request                                        ! Configure the action message text
  OF ViewRecord
    ActionMessage = 'Visualizando Registro'
  OF InsertRecord
    ActionMessage = 'Insertando Registro'
  OF ChangeRecord
    ActionMessage = 'Cambiando Registro'
  END
  QuickWindow{PROP:Text} = ActionMessage                   ! Display status message in title bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('UpdatePAGO_CONVENIO')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?PAGCON:IDSOCIO:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(PAGCON:Record,History::PAGCON:Record)
  SELF.AddHistoryField(?PAGCON:IDSOCIO,2)
  SELF.AddHistoryField(?PAGCON:IDSUCURSAL,13)
  SELF.AddHistoryField(?PAGCON:IDRECIBO,14)
  SELF.AddHistoryField(?PAGCON:IDSUBCUENTA,16)
  SELF.AddUpdateFile(Access:PAGO_CONVENIO)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:CAJA.Open                                         ! File CAJA used by this procedure, so make sure it's RelationManager is open
  Relate:CONVENIO.Open                                     ! File CONVENIO used by this procedure, so make sure it's RelationManager is open
  Relate:CONVENIO_DETALLE.Open                             ! File CONVENIO_DETALLE used by this procedure, so make sure it's RelationManager is open
  Relate:FONDOS.Open                                       ! File FONDOS used by this procedure, so make sure it's RelationManager is open
  Relate:INGRESOS.Open                                     ! File INGRESOS used by this procedure, so make sure it's RelationManager is open
  Relate:LIBDIARIO.Open                                    ! File LIBDIARIO used by this procedure, so make sure it's RelationManager is open
  Relate:PAGO_CONVENIO.Open                                ! File PAGO_CONVENIO used by this procedure, so make sure it's RelationManager is open
  Relate:RANKING.Open                                      ! File RANKING used by this procedure, so make sure it's RelationManager is open
  Relate:SOCIOS.Open                                       ! File SOCIOS used by this procedure, so make sure it's RelationManager is open
  Relate:SUBCUENTAS.Open                                   ! File SUBCUENTAS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:PAGO_CONVENIO
  IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing ! Setup actions for ViewOnly Mode
    SELF.InsertAction = Insert:None
    SELF.DeleteAction = Delete:None
    SELF.ChangeAction = Change:None
    SELF.CancelAction = Cancel:Cancel
    SELF.OkControl = 0
  ELSE
    SELF.ChangeAction = Change:Caller                      ! Changes allowed
    SELF.CancelAction = Cancel:Cancel+Cancel:Query         ! Confirm cancel
    SELF.OkControl = ?OK
    IF SELF.PrimeUpdate() THEN RETURN Level:Notify.
  END
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    ?PAGCON:IDSOCIO{PROP:ReadOnly} = True
    DISABLE(?CallLookup)
    ?PAGCON:IDSUCURSAL{PROP:ReadOnly} = True
    ?PAGCON:IDRECIBO{PROP:ReadOnly} = True
    DISABLE(?Button4)
    ?PAGCON:IDSUBCUENTA{PROP:ReadOnly} = True
    DISABLE(?CallLookup:2)
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdatePAGO_CONVENIO',QuickWindow)          ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  SELF.AddItem(ToolbarForm)
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:CAJA.Close
    Relate:CONVENIO.Close
    Relate:CONVENIO_DETALLE.Close
    Relate:FONDOS.Close
    Relate:INGRESOS.Close
    Relate:LIBDIARIO.Close
    Relate:PAGO_CONVENIO.Close
    Relate:RANKING.Close
    Relate:SOCIOS.Close
    Relate:SUBCUENTAS.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdatePAGO_CONVENIO',QuickWindow)       ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Run PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run()
  IF SELF.Request = ViewRecord                             ! In View Only mode always signal RequestCancelled
    ReturnValue = RequestCancelled
  END
  RETURN ReturnValue


ThisWindow.Run PROCEDURE(USHORT Number,BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run(Number,Request)
  IF SELF.Request = ViewRecord
    ReturnValue = RequestCancelled                         ! Always return RequestCancelled if the form was opened in ViewRecord mode
  ELSE
    GlobalRequest = Request
    EXECUTE Number
      SelectSOCIOS
      SelectSUBCUENTAS
    END
    ReturnValue = GlobalResponse
  END
  RETURN ReturnValue


ThisWindow.SetAlerts PROCEDURE

  CODE
  
  !!! Evolution Consulting FREE Templates Start!!!
     ALERT(EnterKey)
  
  !!! Evolution Consulting FREE Templates End!!!
  PARENT.SetAlerts


ThisWindow.TakeAccepted PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receive all EVENT:Accepted's
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
    CASE ACCEPTED()
    OF ?Button4
      GLO:IDSOCIO     = PAGCON:IDSOCIO
      GLO:IDSOLICITUD = PAGCON:IDSOLICITUD
      SelectCoutaConvenio()
    OF ?OK
      PAGCON:IDSOLICITUD = GLO:IDSOLICITUD
      PAGCON:MONTO_CUOTA = GLO:MONTO
      PAGCON:NRO_CUOTA   = GLO:NRO_CUOTA
      PAGCON:FECHA       =  TODAY()
      PAGCON:HORA        =  CLOCK()
      PAGCON:IDUSUARIO   =  GLO:IDUSUARIO
      PAGCON:MES    =  MONTH(TODAY())
      PAGCON:ANO    =  YEAR(TODAY())
      PAGCON:PERIODO =   FORMAT(PAGCON:ANO,@N04)&FORMAT(PAGCON:MES,@N02)
      PAGCON:OBSERVACION = GLO:FECHA_LARGO 
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?PAGCON:IDSOCIO
      SOC:IDSOCIO = PAGCON:IDSOCIO
      IF Access:SOCIOS.TryFetch(SOC:PK_SOCIOS)
        IF SELF.Run(1,SelectRecord) = RequestCompleted
          PAGCON:IDSOCIO = SOC:IDSOCIO
        ELSE
          SELECT(?PAGCON:IDSOCIO)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
      IF Access:PAGO_CONVENIO.TryValidateField(2)          ! Attempt to validate PAGCON:IDSOCIO in PAGO_CONVENIO
        SELECT(?PAGCON:IDSOCIO)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?PAGCON:IDSOCIO
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?PAGCON:IDSOCIO{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?CallLookup
      ThisWindow.Update()
      SOC:IDSOCIO = PAGCON:IDSOCIO
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        PAGCON:IDSOCIO = SOC:IDSOCIO
      END
      ThisWindow.Reset(1)
    OF ?PAGCON:IDSUBCUENTA
      IF PAGCON:IDSUBCUENTA OR ?PAGCON:IDSUBCUENTA{PROP:Req}
        SUB:IDSUBCUENTA = PAGCON:IDSUBCUENTA
        IF Access:SUBCUENTAS.TryFetch(SUB:INTEG_113)
          IF SELF.Run(2,SelectRecord) = RequestCompleted
            PAGCON:IDSUBCUENTA = SUB:IDSUBCUENTA
          ELSE
            SELECT(?PAGCON:IDSUBCUENTA)
            CYCLE
          END
        END
      END
      ThisWindow.Reset()
    OF ?CallLookup:2
      ThisWindow.Update()
      SUB:IDSUBCUENTA = PAGCON:IDSUBCUENTA
      IF SELF.Run(2,SelectRecord) = RequestCompleted
        PAGCON:IDSUBCUENTA = SUB:IDSUBCUENTA
      END
      ThisWindow.Reset(1)
    OF ?OK
      ThisWindow.Update()
      IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing THEN
         POST(EVENT:CloseWindow)
      END
      !!! CANCELA LA CUOTA EN CONVENIO Y DETALLE DE CONVENIO
      CON5:IDSOLICITUD  = GLO:IDSOLICITUD
      CON5:NRO_CUOTA    = GLO:NRO_CUOTA
      GET (CONVENIO_DETALLE,CON5:IDX_CONVENIO_DETALLE_SOL_NCUOTA)
      IF ERRORCODE() = 35 THEN
          MESSAGE('NO ENCONTRO DETALLE CONVENIO')
      ELSE
          CON5:CANCELADO = 'SI'
          GLO:CARGA_sTRING = CON5:OBSERVACION
          PUT(CONVENIO_DETALLE)
          IF CON5:DEUDA_INICIAL <= 0.1 THEN
                  CON4:IDSOLICITUD =  CON5:IDSOLICITUD
                  GET (CONVENIO,CON4:PK_CONVENIO)
                  IF ERRORCODE() = 35 THEN
                      MESSAGE('NO ENCONTRO EL CONVENIO')
                  ELSE
                     CON4:CANCELADO = 'SI'
                     CON4:FECHA_CANCELADO = TODAY()
                     PUT(CONVENIO)
                  END
              END
      END
      
      
      
      
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeCompleted PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  ReturnValue = PARENT.TakeCompleted()
  If  Self.Request=insertRecord AND SELF.RESPONSE = RequestCompleted Then
      
      !!! CARGO EN LA CAJA
      SUB:IDSUBCUENTA = PAGCON:IDSUBCUENTA
      ACCESS:SUBCUENTAS.TRYFETCH(SUB:INTEG_113)
       !!! MODIFICA EL FLUJO DE FONDOS
      FON:IDFONDO = SUB:IDFONDO
      ACCESS:FONDOS.TRYFETCH(FON:PK_FONDOS)
      FON:MONTO = FON:MONTO + GLO:MONTO
      FON:FECHA = TODAY()
      FON:HORA = CLOCK()
      ACCESS:FONDOS.UPDATE()
      !!!!
  
      !! BUSCO EL ID PROVEEDOR
      SOC:IDSOCIO = PAG:IDSOCIO
      ACCESS:SOCIOS.TRYFETCH(SOC:PK_SOCIOS)
      IDPROVEEDOR# = SOC:IDPROVEEDOR
      !! CARGO INGRESO
      RANKING{PROP:SQL} = 'DELETE FROM RANKING'
      ING:IDUSUARIO        =   PAGCON:IDUSUARIO
      ING:IDSUBCUENTA      =   PAGCON:IDSUBCUENTA
      ING:OBSERVACION      =   'PAGO CONVENIO '&CLIP(GLO:CARGA_sTRING)&' SOCIO '&PAGCON:IDSOCIO
      ING:MONTO            =   PAGCON:MONTO_CUOTA
      ING:FECHA            =   PAGCON:FECHA
      ING:HORA             =   PAGCON:HORA
      ING:MES              =   PAGCON:MES
      ING:ANO              =   PAGCON:ANO
      ING:PERIODO          =   PAGCON:PERIODO
      ING:IDPROVEEDOR      =   IDPROVEEDOR#
      ING:SUCURSAL         =   PAGCON:IDSUCURSAL
      ING:IDRECIBO         =   PAGCON:IDRECIBO
      !!! CARGA
      RANKING{PROP:SQL} = 'CALL SP_GEN_INGRESOS_ID'
      NEXT(RANKING)
      ING:IDINGRESO = RAN:C1
      !MESSAGE(ING:IDINGRESO)
      ACCESS:INGRESOS.INSERT()
  
      IF SUB:CAJA = 'SI' THEN
          !!! CARGO CAJA
          CAJ:IDSUBCUENTA = SUB:IDSUBCUENTA
          CAJ:IDUSUARIO = GLO:IDUSUARIO
          CAJ:DEBE =  GLO:MONTO
          CAJ:HABER = 0
          CAJ:OBSERVACION = 'PAGO CONVENIO '&CLIP(GLO:CARGA_sTRING)&' SOCIO '&PAGCON:IDSOCIO
          CAJ:FECHA = TODAY()
          CAJ:MES       =  MONTH(TODAY())
          CAJ:ANO       =  YEAR(TODAY())
          CAJ:PERIODO   =  CAJ:ANO&(FORMAT(CAJ:MES,@N02))
          CAJ:SUCURSAL  =  ING:SUCURSAL
          CAJ:RECIBO    =  ING:IDRECIBO
          CAJ:TIPO      =  'INGRESO'
          CAJ:IDTRANSACCION  = ING:IDINGRESO
          FON:IDFONDO = SUB:IDFONDO
          ACCESS:FONDOS.TRYFETCH(FON:PK_FONDOS)
          CAJ:MONTO = FON:MONTO
          !!! DISPARA STORE PROCEDURE
          RANKING{PROP:SQL} = 'CALL SP_GEN_CAJA_ID'
          NEXT(RANKING)
          CAJ:IDCAJA = RAN:C1
          ACCESS:CAJA.INSERT()
          RAN:C1 = 0
      END
      CUE:IDCUENTA = SUB:IDCUENTA
      ACCESS:CUENTAS.TRYFETCH(CUE:PK_CUENTAS)
      IF CUE:TIPO = 'INGRESO' THEN
          LIB:IDSUBCUENTA = PAGCON:IDSUBCUENTA
          LIB:DEBE = GLO:MONTO
          LIB:HABER = 0
          LIB:OBSERVACION = 'PAGO CONVENIO '&CLIP(GLO:CARGA_sTRING)& ' SOCIO '&PAGCON:IDSOCIO
          LIB:FECHA = TODAY()
          LIB:HORA = CLOCK()
          LIB:MES       =  MONTH(TODAY())
          LIB:ANO       =  YEAR(TODAY())
          LIB:PERIODO   =  LIB:ANO&(FORMAT(LIB:MES,@N02))
          LIB:SUCURSAL   =   ING:SUCURSAL
          LIB:RECIBO      =  ING:IDRECIBO
          LIB:IDPROVEEDOR =  ING:IDPROVEEDOR
          LIB:TIPO         =  'INGRESO'
          LIB:IDTRANSACCION =  ING:IDINGRESO
          FON:IDFONDO = SUB:IDFONDO
          ACCESS:FONDOS.TRYFETCH(FON:PK_FONDOS)
          LIB:FONDO = FON:MONTO 
          !!! DISPARA STORE PROCEDURE
          RANKING{PROP:SQL} = 'CALL SP_GEN_LIBDIARIO_ID'
          NEXT(RANKING)
          LIB:IDLIBDIARIO = RAN:C1
          !!!!!!!!!!!
          ACCESS:LIBDIARIO.INSERT()
      END
      !BUSCA EL NRO DE
      CLEAR (PAGCON:RECORD,1)                                               
      SET (PAGCON:PK_PAGO_CONVENIO,PAGCON:PK_PAGO_CONVENIO)
      PREVIOUS(PAGO_CONVENIO)
      IF ERRORCODE()
            MESSAGE('ENCONTRO EL REGISTRO DE PAGO')
      ELSE
          GLO:PAGO = PAGCON:IDPAGO 
          
      END
      CLEAR(PAGO_CONVENIO)
  
  
  
      IMPRIMIR_PAGO_CONVENIO
      GLO:IDSOLICITUD = 0
      GLO:MONTO     = 0
      GLO:NRO_CUOTA = 0
      GLO:FECHA_LARGO = ''
  END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeWindowEvent PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all window specific events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
    CASE EVENT()
    OF EVENT:AlertKey
      
      !!! Evolution Consulting FREE Templates Start!!!
       CASE KEYCODE()
         OF EnterKey
            CASE FOCUS(){Prop:Type}
              OF CREATE:Button
                 POST(EVENT:ACCEPTED,FOCUS())
              OF CREATE:text  
                 PRESSKEY(ShiftEnter)
              ELSE
                 IF FOCUS()<> ThisWindow.OkControl
                    PRESSKEY(TabKey)
                    RETURN(Level:Notify)
                 ELSE
                    POST(Event:Accepted,Self.OkControl)
                 END!IF
            END!CASE
       END!CASE
      
      !!! Evolution Consulting FREE Templates End!!!
    END
  ReturnValue = PARENT.TakeWindowEvent()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the CONVENIO_DETALLE File
!!! </summary>
SelectCoutaConvenio PROCEDURE 

CurrentTab           STRING(80)                            ! 
LOC:CANTIDAD_CUOTAS  BYTE                                  ! 
BRW1::View:Browse    VIEW(CONVENIO_DETALLE)
                       PROJECT(CON5:NRO_CUOTA)
                       PROJECT(CON5:MONTO_CUOTA)
                       PROJECT(CON5:MES)
                       PROJECT(CON5:ANO)
                       PROJECT(CON5:IDSOLICITUD)
                       PROJECT(CON5:IDSOCIO)
                       PROJECT(CON5:CANCELADO)
                       PROJECT(CON5:PERIODO)
                       PROJECT(CON5:OBSERVACION)
                       JOIN(CON4:PK_CONVENIO,CON5:IDSOLICITUD)
                         PROJECT(CON4:IDSOLICITUD)
                         PROJECT(CON4:IDTIPO_CONVENIO)
                         JOIN(TIP:PK_T_CONVENIO,CON4:IDTIPO_CONVENIO)
                           PROJECT(TIP:DESCRIPCION)
                           PROJECT(TIP:IDTIPO_CONVENIO)
                         END
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
CON5:NRO_CUOTA         LIKE(CON5:NRO_CUOTA)           !List box control field - type derived from field
CON5:MONTO_CUOTA       LIKE(CON5:MONTO_CUOTA)         !List box control field - type derived from field
CON5:MES               LIKE(CON5:MES)                 !List box control field - type derived from field
CON5:ANO               LIKE(CON5:ANO)                 !List box control field - type derived from field
TIP:DESCRIPCION        LIKE(TIP:DESCRIPCION)          !List box control field - type derived from field
CON5:IDSOLICITUD       LIKE(CON5:IDSOLICITUD)         !List box control field - type derived from field
CON5:IDSOCIO           LIKE(CON5:IDSOCIO)             !List box control field - type derived from field
CON5:CANCELADO         LIKE(CON5:CANCELADO)           !List box control field - type derived from field
CON5:PERIODO           LIKE(CON5:PERIODO)             !List box control field - type derived from field
CON5:OBSERVACION       LIKE(CON5:OBSERVACION)         !List box control field - type derived from field
CON4:IDSOLICITUD       LIKE(CON4:IDSOLICITUD)         !Related join file key field - type derived from field
TIP:IDTIPO_CONVENIO    LIKE(TIP:IDTIPO_CONVENIO)      !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Browse the CONVENIO_DETALLE File'),AT(,,307,232),FONT('MS Sans Serif',8,,FONT:regular), |
  RESIZE,CENTER,GRAY,IMM,MDI,HLP('SelectCoutaConvenio'),SYSTEM
                       LIST,AT(8,28,291,145),USE(?Browse:1),HVSCROLL,FORMAT('51L(2)|M~NRO CUOTA~C(0)@n-7@68L(1' & |
  ')|M~MONTO CUOTA~C(0)@n-10.2@23L(2)|M~MES~@s2@20L(2)|M~ANO~@s4@[200L(2)|M~TIPO CONVEN' & |
  'IO~C(0)@s50@47L(2)|M~IDSOLICITUD~C(0)@n-7@]|M~CONVENIO~64L(2)|M~IDSOCIO~C(0)@n-7@50L' & |
  '(2)|M~CANCELADO~C(0)@s2@56L(2)|M~PERIODO~C(0)@n-14@200L(2)|M~OBSERVACION~C(0)@s50@'),FROM(Queue:Browse:1), |
  IMM,MSG('Administrador de CONVENIO_DETALLE')
                       BUTTON('Elegir'),AT(7,209,54,16),USE(?Button2),LEFT,ICON('e.ico'),FLAT
                       SHEET,AT(4,4,300,202),USE(?CurrentTab)
                         TAB,USE(?Tab:2)
                           PROMPT('Cantidad de Cuotas Adeudadas:'),AT(12,183),USE(?Prompt1)
                           STRING(@n3),AT(115,183),USE(LOC:CANTIDAD_CUOTAS)
                         END
                       END
                       BUTTON('&Salir'),AT(145,209,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),DISABLE, |
  FLAT,HIDE,MSG('Salir'),TIP('Salir')
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
ResetFromView          PROCEDURE(),DERIVED
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END


  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
!---------------------------------------------------------------------------

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('SelectCoutaConvenio')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('CON5:NRO_CUOTA',CON5:NRO_CUOTA)                    ! Added by: BrowseBox(ABC)
  BIND('CON5:MONTO_CUOTA',CON5:MONTO_CUOTA)                ! Added by: BrowseBox(ABC)
  BIND('TIP:IDTIPO_CONVENIO',TIP:IDTIPO_CONVENIO)          ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:CONVENIO_DETALLE.Open                             ! File CONVENIO_DETALLE used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:CONVENIO_DETALLE,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,CON5:IDX_CONVENIO_DETALLE_SOCIO)      ! Add the sort order for CON5:IDX_CONVENIO_DETALLE_SOCIO for sort order 1
  BRW1.AddRange(CON5:IDSOCIO,GLO:IDSOCIO)                  ! Add single value range limit for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,CON5:PERIODO,,BRW1)            ! Initialize the browse locator using  using key: CON5:IDX_CONVENIO_DETALLE_SOCIO , CON5:PERIODO
  BRW1.AppendOrder('CON5:PERIODO')                         ! Append an additional sort order
  BRW1.SetFilter('( CON5:CANCELADO <<> ''SI'')')           ! Apply filter expression to browse
  BRW1.AddField(CON5:NRO_CUOTA,BRW1.Q.CON5:NRO_CUOTA)      ! Field CON5:NRO_CUOTA is a hot field or requires assignment from browse
  BRW1.AddField(CON5:MONTO_CUOTA,BRW1.Q.CON5:MONTO_CUOTA)  ! Field CON5:MONTO_CUOTA is a hot field or requires assignment from browse
  BRW1.AddField(CON5:MES,BRW1.Q.CON5:MES)                  ! Field CON5:MES is a hot field or requires assignment from browse
  BRW1.AddField(CON5:ANO,BRW1.Q.CON5:ANO)                  ! Field CON5:ANO is a hot field or requires assignment from browse
  BRW1.AddField(TIP:DESCRIPCION,BRW1.Q.TIP:DESCRIPCION)    ! Field TIP:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(CON5:IDSOLICITUD,BRW1.Q.CON5:IDSOLICITUD)  ! Field CON5:IDSOLICITUD is a hot field or requires assignment from browse
  BRW1.AddField(CON5:IDSOCIO,BRW1.Q.CON5:IDSOCIO)          ! Field CON5:IDSOCIO is a hot field or requires assignment from browse
  BRW1.AddField(CON5:CANCELADO,BRW1.Q.CON5:CANCELADO)      ! Field CON5:CANCELADO is a hot field or requires assignment from browse
  BRW1.AddField(CON5:PERIODO,BRW1.Q.CON5:PERIODO)          ! Field CON5:PERIODO is a hot field or requires assignment from browse
  BRW1.AddField(CON5:OBSERVACION,BRW1.Q.CON5:OBSERVACION)  ! Field CON5:OBSERVACION is a hot field or requires assignment from browse
  BRW1.AddField(CON4:IDSOLICITUD,BRW1.Q.CON4:IDSOLICITUD)  ! Field CON4:IDSOLICITUD is a hot field or requires assignment from browse
  BRW1.AddField(TIP:IDTIPO_CONVENIO,BRW1.Q.TIP:IDTIPO_CONVENIO) ! Field TIP:IDTIPO_CONVENIO is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('SelectCoutaConvenio',QuickWindow)          ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:CONVENIO_DETALLE.Close
  END
  IF SELF.Opened
    INIMgr.Update('SelectCoutaConvenio',QuickWindow)       ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.SetAlerts PROCEDURE

  CODE
  
  !!! Evolution Consulting FREE Templates Start!!!
     ALERT(EnterKey)
  
  !!! Evolution Consulting FREE Templates End!!!
  PARENT.SetAlerts


ThisWindow.TakeAccepted PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receive all EVENT:Accepted's
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
    CASE ACCEPTED()
    OF ?Button2
      GLO:NRO_CUOTA    = CON5:NRO_CUOTA
      GLO:IDSOLICITUD  = CON5:IDSOLICITUD
      GLO:MONTO        = CON5:MONTO_CUOTA
      GLO:FECHA_LARGO  = CON5:OBSERVACION
      
      
       POST(EVENT:CloseWindow)
    END
  ReturnValue = PARENT.TakeAccepted()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeWindowEvent PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all window specific events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
    CASE EVENT()
    OF EVENT:AlertKey
      
      !!! Evolution Consulting FREE Templates Start!!!
       CASE KEYCODE()
         OF EnterKey
            CASE FOCUS(){Prop:Type}
              OF CREATE:Button
                 POST(EVENT:ACCEPTED,FOCUS())
              OF CREATE:text  
                 PRESSKEY(ShiftEnter)
              ELSE
                 IF FOCUS()<> ThisWindow.OkControl
                    PRESSKEY(TabKey)
                    RETURN(Level:Notify)
                 ELSE
                    POST(Event:Accepted,Self.OkControl)
                 END!IF
            END!CASE
       END!CASE
      
      !!! Evolution Consulting FREE Templates End!!!
    END
  ReturnValue = PARENT.TakeWindowEvent()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


BRW1.ResetFromView PROCEDURE

LOC:CANTIDAD_CUOTAS:Cnt LONG                               ! Count variable for browse totals
  CODE
  SETCURSOR(Cursor:Wait)
  Relate:CONVENIO_DETALLE.SetQuickScan(1)
  SELF.Reset
  IF SELF.UseMRP
     IF SELF.View{PROP:IPRequestCount} = 0
          SELF.View{PROP:IPRequestCount} = 60
     END
  END
  LOOP
    IF SELF.UseMRP
       IF SELF.View{PROP:IPRequestCount} = 0
            SELF.View{PROP:IPRequestCount} = 60
       END
    END
    CASE SELF.Next()
    OF Level:Notify
      BREAK
    OF Level:Fatal
      SETCURSOR()
      RETURN
    END
    SELF.SetQueueRecord
    LOC:CANTIDAD_CUOTAS:Cnt += 1
  END
  SELF.View{PROP:IPRequestCount} = 0
  LOC:CANTIDAD_CUOTAS = LOC:CANTIDAD_CUOTAS:Cnt
  PARENT.ResetFromView
  Relate:CONVENIO_DETALLE.SetQuickScan(0)
  SETCURSOR()


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the PAGO_CONVENIO File
!!! </summary>
PAGO_CONVENIO PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(PAGO_CONVENIO)
                       PROJECT(PAGCON:IDPAGO)
                       PROJECT(PAGCON:IDSOCIO)
                       PROJECT(PAGCON:IDSOLICITUD)
                       PROJECT(PAGCON:NRO_CUOTA)
                       PROJECT(PAGCON:FECHA)
                       PROJECT(PAGCON:MONTO_CUOTA)
                       PROJECT(PAGCON:MES)
                       PROJECT(PAGCON:ANO)
                       PROJECT(PAGCON:PERIODO)
                       PROJECT(PAGCON:OBSERVACION)
                       JOIN(CON4:PK_CONVENIO,PAGCON:IDSOLICITUD)
                         PROJECT(CON4:IDSOLICITUD)
                         PROJECT(CON4:IDTIPO_CONVENIO)
                         JOIN(TIP:PK_T_CONVENIO,CON4:IDTIPO_CONVENIO)
                           PROJECT(TIP:DESCRIPCION)
                           PROJECT(TIP:IDTIPO_CONVENIO)
                         END
                       END
                       JOIN(SOC:PK_SOCIOS,PAGCON:IDSOCIO)
                         PROJECT(SOC:MATRICULA)
                         PROJECT(SOC:NOMBRE)
                         PROJECT(SOC:IDSOCIO)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
PAGCON:IDPAGO          LIKE(PAGCON:IDPAGO)            !List box control field - type derived from field
PAGCON:IDSOCIO         LIKE(PAGCON:IDSOCIO)           !List box control field - type derived from field
SOC:MATRICULA          LIKE(SOC:MATRICULA)            !List box control field - type derived from field
SOC:NOMBRE             LIKE(SOC:NOMBRE)               !List box control field - type derived from field
PAGCON:IDSOLICITUD     LIKE(PAGCON:IDSOLICITUD)       !List box control field - type derived from field
TIP:DESCRIPCION        LIKE(TIP:DESCRIPCION)          !List box control field - type derived from field
PAGCON:NRO_CUOTA       LIKE(PAGCON:NRO_CUOTA)         !List box control field - type derived from field
PAGCON:FECHA           LIKE(PAGCON:FECHA)             !List box control field - type derived from field
PAGCON:MONTO_CUOTA     LIKE(PAGCON:MONTO_CUOTA)       !List box control field - type derived from field
PAGCON:MES             LIKE(PAGCON:MES)               !List box control field - type derived from field
PAGCON:ANO             LIKE(PAGCON:ANO)               !List box control field - type derived from field
PAGCON:PERIODO         LIKE(PAGCON:PERIODO)           !List box control field - type derived from field
PAGCON:OBSERVACION     LIKE(PAGCON:OBSERVACION)       !List box control field - type derived from field
CON4:IDSOLICITUD       LIKE(CON4:IDSOLICITUD)         !Related join file key field - type derived from field
TIP:IDTIPO_CONVENIO    LIKE(TIP:IDTIPO_CONVENIO)      !Related join file key field - type derived from field
SOC:IDSOCIO            LIKE(SOC:IDSOCIO)              !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('CARGA DE  PAGO DE CONVENIO '),AT(,,472,208),FONT('Arial',8,,FONT:regular),RESIZE,CENTER, |
  GRAY,IMM,MDI,HLP('PAGO_CONVENIO'),SYSTEM
                       LIST,AT(8,40,458,124),USE(?Browse:1),HVSCROLL,FORMAT('35L(2)|M~IDPAGO~C(0)@n-7@[64L(2)|' & |
  'M~IDSOCIO~C(0)@n-7@56L(2)|M~MATRICULA~C(0)@n-7@120L(2)|M~NOMBRE~C(0)@s30@]|M~COLEGIA' & |
  'DO~[64L(2)|M~IDSOL~C(0)@n-7@126L(2)|M~SOL DESC.~C(0)@s30@](289)|M~SOLICITUD~49L(2)|M' & |
  '~NRO CUOTA~C(0)@n-5@40R(2)|M~FECHA~C(0)@d17@59L(1)|M~MONTO CUOTA~C(0)@n$-7.2@16L(2)|' & |
  'M~MES~@s2@20L(2)|M~ANO~@s4@64L(2)|M~PERIODO~C(0)@n-14@80L(2)|M~OBSERVACION~@s50@'),FROM(Queue:Browse:1), |
  IMM,MSG('Administrador de PAGO_CONVENIO'),VCR
                       BUTTON('&Ver'),AT(304,169,49,14),USE(?View:3),LEFT,ICON('v.ico'),CURSOR('mano.cur'),FLAT,MSG('Visualizar'), |
  TIP('Visualizar')
                       BUTTON('&Agregar'),AT(414,169,49,14),USE(?Insert:4),LEFT,ICON('a.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Agrega Registro'),TIP('Agrega Registro')
                       BUTTON('&Cambiar'),AT(225,168,49,14),USE(?Change:4),LEFT,ICON('c.ico'),CURSOR('mano.cur'), |
  DEFAULT,DISABLE,FLAT,HIDE,MSG('Cambia Registro'),TIP('Cambia Registro')
                       SHEET,AT(4,4,467,182),USE(?CurrentTab)
                         TAB('ID PAGO'),USE(?Tab:1)
                           PROMPT('IDPAGO:'),AT(9,25),USE(?PAGCON:IDPAGO:Prompt)
                           ENTRY(@n-14),AT(59,24,60,10),USE(PAGCON:IDPAGO),RIGHT(1)
                         END
                         TAB('SOCIO'),USE(?Tab:2)
                           PROMPT('IDSOCIO:'),AT(9,27),USE(?PAGCON:IDSOCIO:Prompt)
                           ENTRY(@n-14),AT(46,26,60,10),USE(PAGCON:IDSOCIO),RIGHT(1)
                         END
                         TAB('CONVENIO'),USE(?Tab:3)
                           PROMPT('IDSOLICITUD:'),AT(10,25),USE(?PAGCON:IDSOLICITUD:Prompt)
                           ENTRY(@n-14),AT(60,24,60,10),USE(PAGCON:IDSOLICITUD),RIGHT(1)
                         END
                       END
                       BUTTON('&Salir'),AT(415,191,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Salir'),TIP('Salir')
                       BUTTON('&Filtro'),AT(9,168,49,14),USE(?Query),LEFT,ICON('Q.ICO'),FLAT
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
QBE2                 QueryListClass                        ! QBE List Class. 
QBV2                 QueryListVisual                       ! QBE Visual Class
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
                     END

BRW1::Sort0:Locator  EntryLocatorClass                     ! Default Locator
BRW1::Sort1:Locator  EntryLocatorClass                     ! Conditional Locator - CHOICE(?CurrentTab) = 2
BRW1::Sort2:Locator  EntryLocatorClass                     ! Conditional Locator - CHOICE(?CurrentTab) = 3
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END


  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
!---------------------------------------------------------------------------

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('PAGO_CONVENIO')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('PAGCON:IDPAGO',PAGCON:IDPAGO)                      ! Added by: BrowseBox(ABC)
  BIND('PAGCON:NRO_CUOTA',PAGCON:NRO_CUOTA)                ! Added by: BrowseBox(ABC)
  BIND('PAGCON:MONTO_CUOTA',PAGCON:MONTO_CUOTA)            ! Added by: BrowseBox(ABC)
  BIND('TIP:IDTIPO_CONVENIO',TIP:IDTIPO_CONVENIO)          ! Added by: BrowseBox(ABC)
  BIND('SOC:IDSOCIO',SOC:IDSOCIO)                          ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:PAGO_CONVENIO.Open                                ! File PAGO_CONVENIO used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:PAGO_CONVENIO,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  QBE2.Init(QBV2, INIMgr,'PAGO_CONVENIO', GlobalErrors)
  QBE2.QkSupport = True
  QBE2.QkMenuIcon = 'QkQBE.ico'
  QBE2.QkIcon = 'QkLoad.ico'
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,PAGCON:FK_PAGO_CONVENIO_SOCIO)        ! Add the sort order for PAGCON:FK_PAGO_CONVENIO_SOCIO for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(?PAGCON:IDSOCIO,PAGCON:IDSOCIO,,BRW1) ! Initialize the browse locator using ?PAGCON:IDSOCIO using key: PAGCON:FK_PAGO_CONVENIO_SOCIO , PAGCON:IDSOCIO
  BRW1.AddSortOrder(,PAGCON:FK_PAGO_CONVENIO_CONVENIO)     ! Add the sort order for PAGCON:FK_PAGO_CONVENIO_CONVENIO for sort order 2
  BRW1.AddLocator(BRW1::Sort2:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort2:Locator.Init(?PAGCON:IDSOLICITUD,PAGCON:IDSOLICITUD,,BRW1) ! Initialize the browse locator using ?PAGCON:IDSOLICITUD using key: PAGCON:FK_PAGO_CONVENIO_CONVENIO , PAGCON:IDSOLICITUD
  BRW1.AddSortOrder(,PAGCON:PK_PAGO_CONVENIO)              ! Add the sort order for PAGCON:PK_PAGO_CONVENIO for sort order 3
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 3
  BRW1::Sort0:Locator.Init(?PAGCON:IDPAGO,PAGCON:IDPAGO,,BRW1) ! Initialize the browse locator using ?PAGCON:IDPAGO using key: PAGCON:PK_PAGO_CONVENIO , PAGCON:IDPAGO
  BRW1.AddField(PAGCON:IDPAGO,BRW1.Q.PAGCON:IDPAGO)        ! Field PAGCON:IDPAGO is a hot field or requires assignment from browse
  BRW1.AddField(PAGCON:IDSOCIO,BRW1.Q.PAGCON:IDSOCIO)      ! Field PAGCON:IDSOCIO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:MATRICULA,BRW1.Q.SOC:MATRICULA)        ! Field SOC:MATRICULA is a hot field or requires assignment from browse
  BRW1.AddField(SOC:NOMBRE,BRW1.Q.SOC:NOMBRE)              ! Field SOC:NOMBRE is a hot field or requires assignment from browse
  BRW1.AddField(PAGCON:IDSOLICITUD,BRW1.Q.PAGCON:IDSOLICITUD) ! Field PAGCON:IDSOLICITUD is a hot field or requires assignment from browse
  BRW1.AddField(TIP:DESCRIPCION,BRW1.Q.TIP:DESCRIPCION)    ! Field TIP:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(PAGCON:NRO_CUOTA,BRW1.Q.PAGCON:NRO_CUOTA)  ! Field PAGCON:NRO_CUOTA is a hot field or requires assignment from browse
  BRW1.AddField(PAGCON:FECHA,BRW1.Q.PAGCON:FECHA)          ! Field PAGCON:FECHA is a hot field or requires assignment from browse
  BRW1.AddField(PAGCON:MONTO_CUOTA,BRW1.Q.PAGCON:MONTO_CUOTA) ! Field PAGCON:MONTO_CUOTA is a hot field or requires assignment from browse
  BRW1.AddField(PAGCON:MES,BRW1.Q.PAGCON:MES)              ! Field PAGCON:MES is a hot field or requires assignment from browse
  BRW1.AddField(PAGCON:ANO,BRW1.Q.PAGCON:ANO)              ! Field PAGCON:ANO is a hot field or requires assignment from browse
  BRW1.AddField(PAGCON:PERIODO,BRW1.Q.PAGCON:PERIODO)      ! Field PAGCON:PERIODO is a hot field or requires assignment from browse
  BRW1.AddField(PAGCON:OBSERVACION,BRW1.Q.PAGCON:OBSERVACION) ! Field PAGCON:OBSERVACION is a hot field or requires assignment from browse
  BRW1.AddField(CON4:IDSOLICITUD,BRW1.Q.CON4:IDSOLICITUD)  ! Field CON4:IDSOLICITUD is a hot field or requires assignment from browse
  BRW1.AddField(TIP:IDTIPO_CONVENIO,BRW1.Q.TIP:IDTIPO_CONVENIO) ! Field TIP:IDTIPO_CONVENIO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:IDSOCIO,BRW1.Q.SOC:IDSOCIO)            ! Field SOC:IDSOCIO is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('PAGO_CONVENIO',QuickWindow)                ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.QueryControl = ?Query
  BRW1.UpdateQuery(QBE2,1)
  BRW1.AskProcedure = 3                                    ! Will call: UpdatePAGO_CONVENIO
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  SELF.SetAlerts()
  IF GLO:NIVEL < 3 THEN
      MESSAGE('SU NIVEL NO PERMITE ENTRAR A ESTE PROCEDIMIENTO','SEGURIDAD',ICON:EXCLAMATION,BUTTON:No,BUTTON:No,1)
      POST(EVENT:CLOSEWINDOW,1)
  END
     
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:PAGO_CONVENIO.Close
  END
  IF SELF.Opened
    INIMgr.Update('PAGO_CONVENIO',QuickWindow)             ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Run PROCEDURE(USHORT Number,BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run(Number,Request)
  IF SELF.Request = ViewRecord
    ReturnValue = RequestCancelled                         ! Always return RequestCancelled if the form was opened in ViewRecord mode
  ELSE
    GlobalRequest = Request
    EXECUTE Number
      SelectSOCIOS
      SelectCONVENIO
      UpdatePAGO_CONVENIO
    END
    ReturnValue = GlobalResponse
  END
  RETURN ReturnValue


ThisWindow.SetAlerts PROCEDURE

  CODE
  
  !!! Evolution Consulting FREE Templates Start!!!
     ALERT(EnterKey)
  
  !!! Evolution Consulting FREE Templates End!!!
  PARENT.SetAlerts


ThisWindow.TakeAccepted PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receive all EVENT:Accepted's
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?PAGCON:IDSOCIO
      PAGCON:IDSOCIO = PAGCON:IDSOCIO
      IF Access:PAGO_CONVENIO.TryFetch(PAGCON:FK_PAGO_CONVENIO_SOCIO)
        IF SELF.Run(1,SelectRecord) = RequestCompleted
          PAGCON:IDSOCIO = PAGCON:IDSOCIO
        ELSE
          SELECT(?PAGCON:IDSOCIO)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
    OF ?PAGCON:IDSOLICITUD
      IF PAGCON:IDSOLICITUD OR ?PAGCON:IDSOLICITUD{PROP:Req}
        PAGCON:IDSOLICITUD = PAGCON:IDSOLICITUD
        IF Access:PAGO_CONVENIO.TryFetch(PAGCON:FK_PAGO_CONVENIO_CONVENIO)
          IF SELF.Run(2,SelectRecord) = RequestCompleted
            PAGCON:IDSOLICITUD = PAGCON:IDSOLICITUD
          ELSE
            SELECT(?PAGCON:IDSOLICITUD)
            CYCLE
          END
        END
      END
      ThisWindow.Reset(0)
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeWindowEvent PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all window specific events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
    CASE EVENT()
    OF EVENT:AlertKey
      
      !!! Evolution Consulting FREE Templates Start!!!
       CASE KEYCODE()
         OF EnterKey
            CASE FOCUS(){Prop:Type}
              OF CREATE:Button
                 POST(EVENT:ACCEPTED,FOCUS())
              OF CREATE:text  
                 PRESSKEY(ShiftEnter)
              ELSE
                 IF FOCUS()<> ThisWindow.OkControl
                    PRESSKEY(TabKey)
                    RETURN(Level:Notify)
                 ELSE
                    POST(Event:Accepted,Self.OkControl)
                 END!IF
            END!CASE
       END!CASE
      
      !!! Evolution Consulting FREE Templates End!!!
    END
  ReturnValue = PARENT.TakeWindowEvent()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


BRW1.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert:4
    SELF.ChangeControl=?Change:4
  END
  SELF.ViewControl = ?View:3                               ! Setup the control used to initiate view only mode


BRW1.ResetSort PROCEDURE(BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  IF CHOICE(?CurrentTab) = 2
    RETURN SELF.SetSort(1,Force)
  ELSIF CHOICE(?CurrentTab) = 3
    RETURN SELF.SetSort(2,Force)
  ELSE
    RETURN SELF.SetSort(3,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

