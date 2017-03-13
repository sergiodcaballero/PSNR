

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABDROPS.INC'),ONCE
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
                       INCLUDE('GESTION023.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION022.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Report
!!! </summary>
IDENTIFICACION_TAGS PROCEDURE 

Progress:Thermometer BYTE                                  ! 
Process:View         VIEW(PROVEEDORES)
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

Report               REPORT,AT(417,490,7833,10479),PRE(RPT),PAPER(PAPER:A4),FONT('Arial',10,,FONT:regular,CHARSET:ANSI), |
  THOUS
Detail                 DETAIL,AT(10,,3385,2385),USE(?Detail),FONT('Arial',8,,FONT:bold,CHARSET:ANSI)
                         IMAGE('Logo2.jpg'),AT(10,10,2052,865),USE(?Image1)
                         STRING(' LEY Nº 169/57'),AT(2438,448),USE(?String16),TRN
                         STRING('Per. Juridica: A- 121'),AT(2219,594),USE(?String15),TRN
                         LINE,AT(10,885,3323,0),USE(?Line1),COLOR(COLOR:Black)
                         STRING('Curso'),AT(42,917),USE(?String8),TRN
                         STRING(@s50),AT(31,1156,3344,219),USE(LOCALI),FONT(,12),CENTER
                         STRING(@s30),AT(21,1667,3354,229),USE(NOMBRE),FONT(,12,,FONT:bold),CENTER
                         BOX,AT(10,0,3375,2427),USE(?Box2),COLOR(COLOR:Black)
                       END
                     END
ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Next                   PROCEDURE(),BYTE,PROC,DERIVED
OpenReport             PROCEDURE(),BYTE,PROC,DERIVED
SetStaticControlsAttributes PROCEDURE(),DERIVED
                     END

ThisReport           CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

Previewer            PrintPreviewClass                     ! Print Previewer
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
  GlobalErrors.SetProcedureName('IDENTIFICACION_TAGS')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:PROVEEDORES.Open                                  ! File PROVEEDORES used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('IDENTIFICACION_TAGS',ProgressWindow)       ! Restore window settings from non-volatile store
  TargetSelector.AddItem(XMLReporter.IReportGenerator)
  TargetSelector.AddItem(HTMLReporter.IReportGenerator)
  TargetSelector.AddItem(TXTReporter.IReportGenerator)
  TargetSelector.AddItem(PDFReporter.IReportGenerator)
  SELF.AddItem(TargetSelector)
  ThisReport.Init(Process:View, Relate:PROVEEDORES, ?Progress:PctText, Progress:Thermometer, RECORDS(CARNET))
  ThisReport.AddSortOrder()
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
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
    Relate:PROVEEDORES.Close
  END
  IF SELF.Opened
    INIMgr.Update('IDENTIFICACION_TAGS',ProgressWindow)    ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Next PROCEDURE

ReturnValue          BYTE,AUTO

Progress BYTE,AUTO
  CODE
      ThisReport.RecordsProcessed+=1
      GET(CARNET,ThisReport.RecordsProcessed)
      IF ERRORCODE() THEN
         ReturnValue = Level:Notify
      ELSE
         ReturnValue = Level:Benign
      END
      IF ReturnValue = Level:Notify
          IF ThisReport.RecordsProcessed>RECORDS(CARNET)
             SELF.Response = RequestCompleted
             POST(EVENT:CloseWindow)
             RETURN Level:Notify
          ELSE
             SELF.Response = RequestCancelled
             POST(EVENT:CloseWindow)
             RETURN Level:Fatal
          END
      ELSE
         Progress = ThisReport.RecordsProcessed / ThisReport.RecordsToProcess*100
         IF Progress > 100 THEN Progress = 100.
         IF Progress <> Progress:Thermometer
           Progress:Thermometer = Progress
           DISPLAY()
         END
      END
      RETURN Level:Benign
  ReturnValue = PARENT.Next()
  RETURN ReturnValue


ThisWindow.OpenReport PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  SYSTEM{PROP:PrintMode} = 3
  ReturnValue = PARENT.OpenReport()
  IF ReturnValue = Level:Benign
    SELF.Report{PROPPRINT:Extend}=True
  END
  RETURN ReturnValue


ThisWindow.SetStaticControlsAttributes PROCEDURE

  CODE
  PARENT.SetStaticControlsAttributes
  !XML STATIC
  SELF.Attribute.Set(?String16,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String16,RepGen:XML,TargetAttr:TagName,'String16')
  SELF.Attribute.Set(?String16,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String15,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String15,RepGen:XML,TargetAttr:TagName,'String15')
  SELF.Attribute.Set(?String15,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String8,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String8,RepGen:XML,TargetAttr:TagName,'String8')
  SELF.Attribute.Set(?String8,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?LOCALI,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?LOCALI,RepGen:XML,TargetAttr:TagName,'LOCALI')
  SELF.Attribute.Set(?LOCALI,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?NOMBRE,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?NOMBRE,RepGen:XML,TargetAttr:TagName,'NOMBRE')
  SELF.Attribute.Set(?NOMBRE,RepGen:XML,TargetAttr:TagValueFromText,True)


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  ReturnValue = PARENT.TakeRecord()
  PRINT(RPT:Detail)
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
  SELF.SetDocumentInfo('CW Report','Gestion','CARNET2','CARNET2','','')
  SELF.SetPagesAsParentBookmark(False)
  SELF.SetScanCopyMode(False)
  SELF.CompressText   = True
  SELF.CompressImages = True

!!! <summary>
!!! Generated from procedure template - Process
!!! </summary>
IMPORTAR_INGRESOS PROCEDURE 

Progress:Thermometer BYTE                                  ! 
Process:View         VIEW(EXP_INGRESOS)
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
                     END

ThisProcess          CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ProgressMgr          StepClass                             ! Progress Manager

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
  GlobalErrors.SetProcedureName('IMPORTAR_INGRESOS')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:CAJA.Open                                         ! File CAJA used by this procedure, so make sure it's RelationManager is open
  Relate:EXP_INGRESOS.Open                                 ! File EXP_INGRESOS used by this procedure, so make sure it's RelationManager is open
  Relate:FONDOS.Open                                       ! File FONDOS used by this procedure, so make sure it's RelationManager is open
  Relate:INGRESOS.Open                                     ! File INGRESOS used by this procedure, so make sure it's RelationManager is open
  Relate:LIBDIARIO.Open                                    ! File LIBDIARIO used by this procedure, so make sure it's RelationManager is open
  Relate:RANKING.Open                                      ! File RANKING used by this procedure, so make sure it's RelationManager is open
  Relate:SUBCUENTAS.Open                                   ! File SUBCUENTAS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('IMPORTAR_INGRESOS',ProgressWindow)         ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ThisProcess.Init(Process:View, Relate:EXP_INGRESOS, ?Progress:PctText, Progress:Thermometer)
  ThisProcess.AddSortOrder()
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  ?Progress:UserString{Prop:Text}=''
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(EXP_INGRESOS,'QUICKSCAN=on')
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:CAJA.Close
    Relate:EXP_INGRESOS.Close
    Relate:FONDOS.Close
    Relate:INGRESOS.Close
    Relate:LIBDIARIO.Close
    Relate:RANKING.Close
    Relate:SUBCUENTAS.Close
  END
  IF SELF.Opened
    INIMgr.Update('IMPORTAR_INGRESOS',ProgressWindow)      ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeRecord()
  ING:SUCURSAL   = ING1:SUCURSAL
  ING:IDRECIBO   = ING1:IDRECIBO
  GET (INGRESOS,ING:IDX_INGRESOS_UNIQUE)
  IF ERRORCODE() = 35 THEN
      ING:IDUSUARIO          =  ING1:IDUSUARIO
      ING:IDSUBCUENTA        =  ING1:IDSUBCUENTA
      ING:OBSERVACION        =  ING1:OBSERVACION
      ING:MONTO              =  ING1:MONTO
      ING:FECHA              =  ING1:FECHA
      ING:HORA               =  ING1:HORA
      ING:MES                =  ING1:MES
      ING:ANO                =  ING1:ANO
      ING:PERIODO            =  ING1:PERIODO
      ING:IDPROVEEDOR        =  ING1:IDPROVEEDOR
      ING:SUCURSAL           =  ING1:SUCURSAL
      ING:IDRECIBO           =  ING1:IDRECIBO
      !!! CARGA
      RANKING{PROP:SQL} = 'DELETE FROM RANKING'
      RANKING{PROP:SQL} = 'CALL SP_GEN_INGRESOS_ID'
      NEXT(RANKING)
      ING:IDINGRESO = RAN:C1
      !MESSAGE(ING:IDINGRESO)
      ACCESS:INGRESOS.INSERT()
  
      !!! CARGO LIBRO DIARIA
      LIB:IDSUBCUENTA = ING1:IDSUBCUENTA
      LIB:DEBE = ING1:MONTO
      LIB:HABER = 0
      LIB:OBSERVACION = ING1:OBSERVACION
      LIB:FECHA = ING1:FECHA
      LIB:HORA = ING1:HORA
      LIB:MES       =  MONTH(ING1:FECHA)
      LIB:ANO       =  YEAR(ING1:FECHA)
      LIB:PERIODO   =  LIB:ANO&(FORMAT(LIB:MES,@N02))
      !! BUSCA FONDOS..   Y ACTUALIZA YA QUE ESTAMOS
      SUB:IDSUBCUENTA = ING1:IDSUBCUENTA
      ACCESS:SUBCUENTAS.TRYFETCH(SUB:INTEG_113)
      FON:IDFONDO = SUB:IDFONDO
      CAJA# =   SUB:IDFONDO
      ACCESS:FONDOS.TRYFETCH(FON:PK_FONDOS)
      FON:MONTO = FON:MONTO + ING1:MONTO
      FONDO$ = FON:MONTO 
      FON:FECHA = TODAY()
      FON:HORA = CLOCK()
      ACCESS:FONDOS.UPDATE()
              
      LIB:FONDO = FON:MONTO + ING1:MONTO
      !!! DISPARA STORE PROCEDURE
      RANKING{PROP:SQL} = 'DELETE FROM RANKING'
      RANKING{PROP:SQL} = 'CALL SP_GEN_LIBDIARIO_ID'
      NEXT(RANKING)
      LIB:IDLIBDIARIO = RAN:C1
      !!!!!!!!!!!
      ACCESS:LIBDIARIO.INSERT()
  
      !! CARGO CAJA
  
      IF  CAJA# = 1 THEN
          CAJ:IDSUBCUENTA = ING1:IDSUBCUENTA
          CAJ:IDUSUARIO = ING1:IDUSUARIO
          CAJ:DEBE  =  ING1:MONTO
          CAJ:HABER = 0
          CAJ:OBSERVACION = ING1:OBSERVACION
          CAJ:FECHA = ING1:FECHA
          CAJ:MES       =  MONTH(ING1:FECHA)
          CAJ:ANO       =  YEAR(ING1:HORA)
          CAJ:PERIODO   =  CAJ:ANO&(FORMAT(CAJ:MES,@N02))
          CAJ:SUCURSAL  =  ING1:SUCURSAL
          CAJ:RECIBO  =  ING1:IDRECIBO
          CAJ:MONTO =  FONDO$
          !!! DISPARA STORE PROCEDURE
          RANKING{PROP:SQL} = 'CALL SP_GEN_CAJA_ID'
          NEXT(RANKING)
          CAJ:IDCAJA = RAN:C1
          ACCESS:CAJA.INSERT()
     END
  END
  
  
  
  RETURN ReturnValue

!!! <summary>
!!! Generated from procedure template - Process
!!! </summary>
IMPORTAR_INSCRIPCION_DETALLE PROCEDURE 

Progress:Thermometer BYTE                                  ! 
Process:View         VIEW(EXP_CURSO_INSCRIPCION_DETALLE)
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeCloseEvent         PROCEDURE(),BYTE,PROC,DERIVED
                     END

ThisProcess          CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ProgressMgr          StepClass                             ! Progress Manager

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
  GlobalErrors.SetProcedureName('IMPORTAR_INSCRIPCION_DETALLE')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:CURSO_INSCRIPCION_DETALLE.SetOpenRelated()
  Relate:CURSO_INSCRIPCION_DETALLE.Open                    ! File CURSO_INSCRIPCION_DETALLE used by this procedure, so make sure it's RelationManager is open
  Relate:EXP_CURSO_INSCRIPCION_DETALLE.Open                ! File EXP_CURSO_INSCRIPCION_DETALLE used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('IMPORTAR_INSCRIPCION_DETALLE',ProgressWindow) ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ThisProcess.Init(Process:View, Relate:EXP_CURSO_INSCRIPCION_DETALLE, ?Progress:PctText, Progress:Thermometer)
  ThisProcess.AddSortOrder()
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  ?Progress:UserString{Prop:Text}=''
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(EXP_CURSO_INSCRIPCION_DETALLE,'QUICKSCAN=on')
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:CURSO_INSCRIPCION_DETALLE.Close
    Relate:EXP_CURSO_INSCRIPCION_DETALLE.Close
  END
  IF SELF.Opened
    INIMgr.Update('IMPORTAR_INSCRIPCION_DETALLE',ProgressWindow) ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.TakeCloseEvent PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeCloseEvent()
  IMPORTAR_INGRESOS()
  RETURN ReturnValue


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeRecord()
  CURD:IDINSCRIPCION   = CURD1:IDINSCRIPCION
  CURD:IDCURSO         = CURD1:IDCURSO
  CURD:ID_MODULO       = CURD1:ID_MODULO
  GET(CURSO_INSCRIPCION_DETALLE,CURD:PK_CURSO_INSCRIPCION_DETALLE)
  IF ERRORCODE() = 35 THEN
      CURD:IDINSCRIPCION          =    CURD1:IDINSCRIPCION
      CURD:IDCURSO                =    CURD1:IDCURSO
      CURD:ID_MODULO              =    CURD1:ID_MODULO
      CURD:FECHA_INSCRIPCION      =    CURD1:FECHA_INSCRIPCION
      CURD:PRESENTE               =    CURD1:PRESENTE
      CURD:NOTA                   =    CURD1:NOTA
      CURD:MONTO                  =    CURD1:MONTO
      CURD:PAGADO                 =    CURD1:PAGADO
      CURD:FECHA_PAGO             =    CURD1:FECHA_PAGO
      CURD:HORA_PAGO              =    CURD1:HORA_PAGO
      CURD:USUARIO_PAGO           =    CURD1:USUARIO_PAGO
      CURD:IDSUBCUENTA            =    CURD1:IDSUBCUENTA
      CURD:DESCUENTO              =    CURD1:DESCUENTO
      CURD:SUCURSAL               =    CURD1:SUCURSAL
      CURD:IDRECIBO               =    CURD1:IDRECIBO
      ACCESS:CURSO_INSCRIPCION_DETALLE.INSERT()
   ELSE
      CURD:PRESENTE               =    CURD1:PRESENTE
      CURD:NOTA                   =    CURD1:NOTA
      CURD:MONTO                  =    CURD1:MONTO
      CURD:PAGADO                 =    CURD1:PAGADO
      CURD:FECHA_PAGO             =    CURD1:FECHA_PAGO
      CURD:HORA_PAGO              =    CURD1:HORA_PAGO
      CURD:USUARIO_PAGO           =    CURD1:USUARIO_PAGO
      CURD:IDSUBCUENTA            =    CURD1:IDSUBCUENTA
      CURD:DESCUENTO              =    CURD1:DESCUENTO
      CURD:SUCURSAL               =    CURD1:SUCURSAL
      CURD:IDRECIBO               =    CURD1:IDRECIBO
      ACCESS:CURSO_INSCRIPCION_DETALLE.UPDATE()
  END
  
  RETURN ReturnValue

!!! <summary>
!!! Generated from procedure template - Process
!!! </summary>
IMPORTAR_INSCRIPCION PROCEDURE 

Progress:Thermometer BYTE                                  ! 
Process:View         VIEW(EXP_CURSO_INSCRIPCION)
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeCloseEvent         PROCEDURE(),BYTE,PROC,DERIVED
                     END

ThisProcess          CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ProgressMgr          StepClass                             ! Progress Manager

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
  GlobalErrors.SetProcedureName('IMPORTAR_INSCRIPCION')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:CURSO_INSCRIPCION.Open                            ! File CURSO_INSCRIPCION used by this procedure, so make sure it's RelationManager is open
  Relate:CURSO_INSCRIPCION_DETALLE.SetOpenRelated()
  Relate:CURSO_INSCRIPCION_DETALLE.Open                    ! File CURSO_INSCRIPCION_DETALLE used by this procedure, so make sure it's RelationManager is open
  Relate:EXP_CURSO_INSCRIPCION.Open                        ! File EXP_CURSO_INSCRIPCION used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('IMPORTAR_INSCRIPCION',ProgressWindow)      ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ThisProcess.Init(Process:View, Relate:EXP_CURSO_INSCRIPCION, ?Progress:PctText, Progress:Thermometer)
  ThisProcess.AddSortOrder()
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  ?Progress:UserString{Prop:Text}=''
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(EXP_CURSO_INSCRIPCION,'QUICKSCAN=on')
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:CURSO_INSCRIPCION.Close
    Relate:CURSO_INSCRIPCION_DETALLE.Close
    Relate:EXP_CURSO_INSCRIPCION.Close
  END
  IF SELF.Opened
    INIMgr.Update('IMPORTAR_INSCRIPCION',ProgressWindow)   ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.TakeCloseEvent PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeCloseEvent()
  IMPORTAR_INSCRIPCION_DETALLE()
  RETURN ReturnValue


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeRecord()
  CURI:ID_PROVEEDOR  =   CURI1:ID_PROVEEDOR
  CURI:IDCURSO       =   CURI1:IDCURSO
  get(CURSO_INSCRIPCION,CURI:IDX_CONTROL)
  IF ERRORCODE() = 35 THEN
      CURI:IDINSCRIPCION     =  CURI1:IDINSCRIPCION
      CURI:ID_PROVEEDOR      =  CURI1:ID_PROVEEDOR
      CURI:IDCURSO           =  CURI1:IDCURSO
      CURI:FECHA             =  CURI1:FECHA
      CURI:HORA              =  CURI1:HORA
      CURI:IDUSUARIO         =  CURI1:IDUSUARIO
      CURI:MONTO_TOTAL       =  CURI1:MONTO_TOTAL
      CURI:TERMINADO         =  CURI1:TERMINADO
      CURI:DESCUENTO         =  CURI1:DESCUENTO
      CURI:PAGADO_TOTAL      =  CURI1:PAGADO_TOTAL
      CURI:CUOTAS            =  CURI1:CUOTAS
      CURI:MONTO_CUOTA       =  CURI1:MONTO_CUOTA
      CURI:MONTO_CUOTA       =  CURI1:OBSERVACION
      ACCESS:CURSO_INSCRIPCION.INSERT()
  ELSE
      CURI:MONTO_TOTAL     =   CURI1:MONTO_TOTAL
      CURI:TERMINADO       =   CURI1:TERMINADO
      CURI:DESCUENTO       =   CURI1:DESCUENTO
      CURI:PAGADO_TOTAL    =   CURI1:PAGADO_TOTAL
      CURI:CUOTAS          =   CURI1:CUOTAS
      CURI:MONTO_CUOTA     =   CURI1:MONTO_CUOTA
      CURI:OBSERVACION     =   CURI1:OBSERVACION
      ACCESS:CURSO_INSCRIPCION.UPDATE()
  END
  RETURN ReturnValue

!!! <summary>
!!! Generated from procedure template - Process
!!! </summary>
IMPORTAR_PROVEEDORES PROCEDURE 

Progress:Thermometer BYTE                                  ! 
Process:View         VIEW(EXP_PROVEEDORES)
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeCloseEvent         PROCEDURE(),BYTE,PROC,DERIVED
                     END

ThisProcess          CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ProgressMgr          StepClass                             ! Progress Manager

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
  GlobalErrors.SetProcedureName('IMPORTAR_PROVEEDORES')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:EXP_CURSO_INSCRIPCION.Open                        ! File EXP_CURSO_INSCRIPCION used by this procedure, so make sure it's RelationManager is open
  Relate:EXP_INGRESOS.Open                                 ! File EXP_INGRESOS used by this procedure, so make sure it's RelationManager is open
  Relate:EXP_PROVEEDORES.Open                              ! File EXP_PROVEEDORES used by this procedure, so make sure it's RelationManager is open
  Relate:PROVEEDORES.Open                                  ! File PROVEEDORES used by this procedure, so make sure it's RelationManager is open
  Relate:RANKING.Open                                      ! File RANKING used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('IMPORTAR_PROVEEDORES',ProgressWindow)      ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ThisProcess.Init(Process:View, Relate:EXP_PROVEEDORES, ?Progress:PctText, Progress:Thermometer)
  ThisProcess.AddSortOrder()
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  ?Progress:UserString{Prop:Text}=''
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(EXP_PROVEEDORES,'QUICKSCAN=on')
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:EXP_CURSO_INSCRIPCION.Close
    Relate:EXP_INGRESOS.Close
    Relate:EXP_PROVEEDORES.Close
    Relate:PROVEEDORES.Close
    Relate:RANKING.Close
  END
  IF SELF.Opened
    INIMgr.Update('IMPORTAR_PROVEEDORES',ProgressWindow)   ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.TakeCloseEvent PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeCloseEvent()
  IMPORTAR_INSCRIPCION()
  RETURN ReturnValue


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeRecord()
  IF PRO21:IDPROVEEDOR >= 30000 THEN
      GLO:IDRECIBO = PRO21:IDPROVEEDOR
      PRO2:DESCRIPCION             =   PRO21:DESCRIPCION
      PRO2:DIRECCION               =   PRO21:DIRECCION
      PRO2:TELEFONO                =   PRO21:TELEFONO
      PRO2:EMAIL                   =   PRO21:EMAIL
      PRO2:CUIT                    =   PRO21:CUIT
      PRO2:FECHA                   =   PRO21:FECHA
      PRO2:HORA                    =   PRO21:HORA
      PRO2:IDUSUARIO               =   PRO21:IDUSUARIO
      PRO2:IDTIPOIVA               =   PRO21:IDTIPOIVA
      PRO2:FECHA_BAJA              =   PRO21:FECHA_BAJA
      PRO2:OBSERVACION             =   PRO21:OBSERVACION
      PRO2:IDTIPO_PROVEEDOR        =   3
      !!! SACA EL ID DE PROVEEDOR
      RANKING{PROP:SQL} = 'DELETE FROM RANKING'
      RANKING{PROP:SQL} = 'CALL SP_GEN_PROVEEDORES_ID'
      NEXT(RANKING)
      PRO2:IDPROVEEDOR = RAN:C1
      ACCESS:PROVEEDORES.INSERT()
  
      !!! GUARDO EL IDPROVEEDORE
      GLO:IDSOCIO = PRO2:IDPROVEEDOR
  
      !!! BUSCO EN INGRESOS TPS Y LO CAMBIO POR EL NUEVO
      ING1:IDPROVEEDOR =  GLO:IDRECIBO
      SET(ING1:FK_INGRESOS_PROVEEDOR,ING1:FK_INGRESOS_PROVEEDOR)
      LOOP
          IF ACCESS:EXP_INGRESOS.NEXT() THEN BREAK.
          IF ING1:IDPROVEEDOR <>  GLO:IDRECIBO THEN BREAK.
          ING1:IDPROVEEDOR =   GLO:IDSOCIO
          ACCESS:EXP_INGRESOS.UPDATE()
      END
      !!!!!!
      !!! BUSCO EN INSCRIPTOS  TPS Y LO CAMBIO POR EL NUEVO
      CURI1:ID_PROVEEDOR =  GLO:IDRECIBO
      SET(CURI1:FK_CURSO_INSCRIPCION_PROVEEDOR,CURI1:FK_CURSO_INSCRIPCION_PROVEEDOR)
      LOOP
          IF ACCESS:EXP_CURSO_INSCRIPCION.NEXT() THEN BREAK.
          IF CURI1:ID_PROVEEDOR <>  GLO:IDRECIBO THEN BREAK.
          CURI1:ID_PROVEEDOR =   GLO:IDSOCIO
          ACCESS:EXP_CURSO_INSCRIPCION.UPDATE()
      END
      !!!!!!
  END
  
  RETURN ReturnValue

!!! <summary>
!!! Generated from procedure template - Window
!!! Window
!!! </summary>
IMPORT_CURSO PROCEDURE 

QuickWindow          WINDOW('Importación de Datos de Curso Externo '),AT(,,184,70),FONT('MS Sans Serif',8,,FONT:regular), |
  RESIZE,CENTER,GRAY,IMM,HLP('IMPORT_CURSO'),SYSTEM
                       BUTTON('&Procesar '),AT(55,6,75,14),USE(?Ok),LEFT,ICON('ok.ico'),CURSOR('mano.cur'),FLAT,MSG('Acepta Operacion'), |
  TIP('Acepta Operacion')
                       BUTTON('&Cancelar'),AT(67,34,49,14),USE(?Cancel),LEFT,ICON('cancelar.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Cancela Operacion'),TIP('Cancela Operacion')
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
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
  GlobalErrors.SetProcedureName('IMPORT_CURSO')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Ok
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Ok,RequestCancelled)                    ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Ok,RequestCompleted)                    ! Add the close control to the window manger
  END
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('IMPORT_CURSO',QuickWindow)                 ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.Opened
    INIMgr.Update('IMPORT_CURSO',QuickWindow)              ! Save window data to non-volatile store
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
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Ok
      ThisWindow.Update()
      START(IMPORTAR_PROVEEDORES, 25000)
      ThisWindow.Reset
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
!!! Certificados_Cursos
!!! </summary>
Certificados_Cursos PROCEDURE 

FDCB6::View:FileDropCombo VIEW(CURSO_MODULOS)
                       PROJECT(CUR2:ID_MODULO)
                       PROJECT(CUR2:DESCRIPCION)
                       PROJECT(CUR2:IDCURSO)
                     END
Queue:FileDropCombo  QUEUE                            !Queue declaration for browse/combo box using ?CUR2:ID_MODULO
CUR2:ID_MODULO         LIKE(CUR2:ID_MODULO)           !List box control field - type derived from field
CUR2:DESCRIPCION       LIKE(CUR2:DESCRIPCION)         !List box control field - type derived from field
CUR2:IDCURSO           LIKE(CUR2:IDCURSO)             !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Imprimir Certificado de Módulos'),AT(,,260,160),FONT('MS Sans Serif',8,,FONT:regular), |
  RESIZE,CENTER,GRAY,IMM,MDI,HLP('Certificados_Cursos'),SYSTEM
                       PROMPT('Seleccionar Curso:'),AT(9,10),USE(?CUR:IDCURSO:Prompt)
                       BUTTON('...'),AT(135,10,12,12),USE(?CallLookup)
                       ENTRY(@n-14),AT(73,11,60,10),USE(GLO:IDCURSO),REQ
                       COMBO(@n-7),AT(69,30,188,10),USE(CUR2:ID_MODULO),DROP(5),FORMAT('49L(2)|M~ID MODULO~@n-' & |
  '7@200L(2)|M~DESCRIPCION~@s50@56L(2)|M~IDCURSO~@n-5@'),FROM(Queue:FileDropCombo),IMM
                       STRING(@s50),AT(-5,58,265,10),USE(CUR2:DESCRIPCION),FONT('Arial',10,,FONT:bold,CHARSET:ANSI), |
  CENTER
                       PROMPT('Seleccionar Módulo:'),AT(2,30),USE(?Prompt2)
                       BUTTON('&Listar Inscriptos al Curso'),AT(64,79,111,14),USE(?Ok),LEFT,ICON(ICON:Print1),CURSOR('mano.cur'), |
  FLAT,MSG('Acepta Operacion'),TIP('Acepta Operacion')
                       BUTTON('&Cancelar'),AT(96,112,49,14),USE(?Cancel),LEFT,ICON('cancelar.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Cancela Operacion'),TIP('Cancela Operacion')
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
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

FDCB6                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo           !Reference to browse queue type
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
  GlobalErrors.SetProcedureName('Certificados_Cursos')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?CUR:IDCURSO:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Ok,RequestCancelled)                    ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Ok,RequestCompleted)                    ! Add the close control to the window manger
  END
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:CURSO.Open                                        ! File CURSO used by this procedure, so make sure it's RelationManager is open
  Relate:CURSO_MODULOS.Open                                ! File CURSO_MODULOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('Certificados_Cursos',QuickWindow)          ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  FDCB6.Init(CUR2:ID_MODULO,?CUR2:ID_MODULO,Queue:FileDropCombo.ViewPosition,FDCB6::View:FileDropCombo,Queue:FileDropCombo,Relate:CURSO_MODULOS,ThisWindow,GlobalErrors,0,1,0)
  FDCB6.Q &= Queue:FileDropCombo
  FDCB6.AddSortOrder(CUR2:FK_CURSO_MODULOS_CURSO)
  FDCB6.AppendOrder('CUR2:DESCRIPCION')
  FDCB6.AddRange(CUR2:IDCURSO,)
  FDCB6.AddField(CUR2:ID_MODULO,FDCB6.Q.CUR2:ID_MODULO) !List box control field - type derived from field
  FDCB6.AddField(CUR2:DESCRIPCION,FDCB6.Q.CUR2:DESCRIPCION) !List box control field - type derived from field
  FDCB6.AddField(CUR2:IDCURSO,FDCB6.Q.CUR2:IDCURSO) !List box control field - type derived from field
  ThisWindow.AddItem(FDCB6.WindowComponent)
  FDCB6.DefaultFill = 0
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:CURSO.Close
    Relate:CURSO_MODULOS.Close
  END
  IF SELF.Opened
    INIMgr.Update('Certificados_Cursos',QuickWindow)       ! Save window data to non-volatile store
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
    SelectCURSO
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
    OF ?Ok
      GLO:ID_MODULO = CUR2:ID_MODULO
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?CallLookup
      ThisWindow.Update()
      CUR:IDCURSO = GLO:IDCURSO
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        GLO:IDCURSO = CUR:IDCURSO
      END
      ThisWindow.Reset(1)
    OF ?GLO:IDCURSO
      IF GLO:IDCURSO OR ?GLO:IDCURSO{PROP:Req}
        CUR:IDCURSO = GLO:IDCURSO
        IF Access:CURSO.TryFetch(CUR:PK_CURSO)
          IF SELF.Run(1,SelectRecord) = RequestCompleted
            GLO:IDCURSO = CUR:IDCURSO
          ELSE
            SELECT(?GLO:IDCURSO)
            CYCLE
          END
        END
      END
      ThisWindow.Reset()
    OF ?Ok
      ThisWindow.Update()
      START(Imprimir_Certificados_Modulos_Curso, 25000)
      ThisWindow.Reset
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
!!! Generated from procedure template - Report
!!! </summary>
Imprimir_Certificado_Curso PROCEDURE 

Progress:Thermometer BYTE                                  ! 
Process:View         VIEW(PROVEEDORES)
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

Report               REPORT,AT(1000,2427,6250,7260),PRE(RPT),PAPER(PAPER:A4),FONT('Arial',10,,FONT:regular,CHARSET:ANSI), |
  THOUS
                       HEADER,AT(1000,1000,6250,1427),USE(?Header)
                         IMAGE('logo.jpg'),AT(10,31,1615,854),USE(?Image1)
                         BOX,AT(21,948,6240,52),USE(?Box1),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         STRING('Certificado de Asistencia'),AT(1865,1094),USE(?String4),FONT('Arial',14,,FONT:bold, |
  CHARSET:ANSI),TRN
                       END
Detail                 DETAIL,AT(0,0,,5844),USE(?Detail)
                         STRING('El Colegio de Psicólogos del Valle Inferior de Rió Negro'),AT(396,83),USE(?String5), |
  FONT(,12,,FONT:bold),TRN
                         STRING('CERTIFICA'),AT(2552,396),USE(?String6),FONT(,14,,FONT:bold),TRN
                         STRING(@n-14.),AT(4604,938),USE(N_DOCUMENTO)
                         STRING('que el Sr./Sra.'),AT(573,938),USE(?String7),TRN
                         STRING(@s50),AT(1438,1521,3750,208),USE(DIRECCION),FONT(,12,,FONT:bold)
                         STRING('perteneciente al Curso'),AT(73,1813),USE(?String11),TRN
                         STRING('organizado por el Colegio de Psicólogos del Valle Inferior de Rió Negro'),AT(21,2104), |
  USE(?String13),TRN
                         STRING('desde el'),AT(4427,2104),USE(?String14),TRN
                         STRING(@d17),AT(5063,2104),USE(FECHA_ALTA)
                         STRING(@n-4),AT(3177,2427),USE(CP),RIGHT(1)
                         STRING('de horas.'),AT(3594,2427),USE(?String20),TRN
                         STRING('Y para que conste, se expide el presente certificado, en la ciudad de '),AT(573,2896), |
  USE(?String21),TRN
                         STRING('Viedma,'),AT(52,3219),USE(?String23),TRN
                         STRING(@s50),AT(667,3219),USE(GLO:FECHA_LARGO)
                         STRING(', con una duración total de '),AT(1490,2427),USE(?String18),TRN
                         STRING(@d6),AT(688,2427),USE(FOLIO)
                         STRING(', hasta el'),AT(63,2427),USE(?String16),TRN
                         STRING(@s50),AT(1531,1813,3844,208),USE(LOCALI),FONT(,,,FONT:bold)
                         STRING(@s30),AT(1563,938),USE(NOMBRE),LEFT
                         STRING('ha realizado de forma satisfactoria, la asistencia al dictado del Módulo'),AT(73,1229), |
  USE(?String10),TRN
                         STRING(', con DNI '),AT(3823,938),USE(?String8),TRN
                         STRING(@n-4),AT(979,1521),USE(MATRICULA),FONT(,12,,FONT:bold)
                       END
                       FOOTER,AT(1000,9688,6250,1000),USE(?Footer)
                       END
                       FORM,AT(1000,1000,6250,9688),USE(?Form)
                       END
                     END
ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Next                   PROCEDURE(),BYTE,PROC,DERIVED
OpenReport             PROCEDURE(),BYTE,PROC,DERIVED
SetStaticControlsAttributes PROCEDURE(),DERIVED
                     END

ThisReport           CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

Previewer            PrintPreviewClass                     ! Print Previewer
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
  GlobalErrors.SetProcedureName('Imprimir_Certificado_Curso')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:PROVEEDORES.Open                                  ! File PROVEEDORES used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('Imprimir_Certificado_Curso',ProgressWindow) ! Restore window settings from non-volatile store
  TargetSelector.AddItem(XMLReporter.IReportGenerator)
  TargetSelector.AddItem(HTMLReporter.IReportGenerator)
  TargetSelector.AddItem(TXTReporter.IReportGenerator)
  TargetSelector.AddItem(PDFReporter.IReportGenerator)
  SELF.AddItem(TargetSelector)
  ThisReport.Init(Process:View, Relate:PROVEEDORES, ?Progress:PctText, Progress:Thermometer, RECORDS(CARNET))
  ThisReport.AddSortOrder()
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  ProgressWindow{PROP:Timer} = 10                          ! Assign timer interval
  SELF.SkipPreview = False
  Previewer.SetINIManager(INIMgr)
  Previewer.AllowUserZoom = True
  SELF.SetAlerts()
  EXECUTE (TODAY() % 7) + 1
  Dia"= 'Domingo'
  Dia"= 'Lunes'
  Dia"= 'Martes'
  Dia"= 'Miercoles'
  Dia"= 'Jueves'
  Dia"= 'Viernes'
  Dia"= 'Sabado'
  END
  
  EXECUTE (MONTH(TODAY()))
  Mes" = 'Enero'
  Mes" = 'Febrero'
  Mes" = 'Marzo'
  Mes" = 'Abril'
  Mes" = 'Mayo'
  Mes" = 'Junio'
  Mes" = 'Julio'
  Mes" = 'Agosto'
  Mes" = 'Septiembre'
  Mes" = 'Octubre'
  Mes" = 'Noviembre'
  Mes" = 'Diciembre'
  END
  GLO:FECHA_LARGO = CLIP(Dia") & ' ' & DAY(TODAY()) & ' de ' &CLIP(Mes")&' '&Year(today())
  
  
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:PROVEEDORES.Close
  END
  IF SELF.Opened
    INIMgr.Update('Imprimir_Certificado_Curso',ProgressWindow) ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Next PROCEDURE

ReturnValue          BYTE,AUTO

Progress BYTE,AUTO
  CODE
      ThisReport.RecordsProcessed+=1
      GET(CARNET,ThisReport.RecordsProcessed)
      IF ERRORCODE() THEN
         ReturnValue = Level:Notify
      ELSE
         ReturnValue = Level:Benign
      END
      IF ReturnValue = Level:Notify
          IF ThisReport.RecordsProcessed>RECORDS(CARNET)
             SELF.Response = RequestCompleted
             POST(EVENT:CloseWindow)
             RETURN Level:Notify
          ELSE
             SELF.Response = RequestCancelled
             POST(EVENT:CloseWindow)
             RETURN Level:Fatal
          END
      ELSE
         Progress = ThisReport.RecordsProcessed / ThisReport.RecordsToProcess*100
         IF Progress > 100 THEN Progress = 100.
         IF Progress <> Progress:Thermometer
           Progress:Thermometer = Progress
           DISPLAY()
         END
      END
      RETURN Level:Benign
  ReturnValue = PARENT.Next()
  RETURN ReturnValue


ThisWindow.OpenReport PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  SYSTEM{PROP:PrintMode} = 3
  ReturnValue = PARENT.OpenReport()
  IF ReturnValue = Level:Benign
    SELF.Report{PROPPRINT:Extend}=True
  END
  RETURN ReturnValue


ThisWindow.SetStaticControlsAttributes PROCEDURE

  CODE
  PARENT.SetStaticControlsAttributes
  !XML STATIC
  SELF.Attribute.Set(?String4,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String4,RepGen:XML,TargetAttr:TagName,'String4')
  SELF.Attribute.Set(?String4,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String5,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String5,RepGen:XML,TargetAttr:TagName,'String5')
  SELF.Attribute.Set(?String5,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String6,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String6,RepGen:XML,TargetAttr:TagName,'String6')
  SELF.Attribute.Set(?String6,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?N_DOCUMENTO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?N_DOCUMENTO,RepGen:XML,TargetAttr:TagName,'N_DOCUMENTO')
  SELF.Attribute.Set(?N_DOCUMENTO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String7,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String7,RepGen:XML,TargetAttr:TagName,'String7')
  SELF.Attribute.Set(?String7,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?DIRECCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?DIRECCION,RepGen:XML,TargetAttr:TagName,'DIRECCION')
  SELF.Attribute.Set(?DIRECCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String11,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String11,RepGen:XML,TargetAttr:TagName,'String11')
  SELF.Attribute.Set(?String11,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String13,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String13,RepGen:XML,TargetAttr:TagName,'String13')
  SELF.Attribute.Set(?String13,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String14,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String14,RepGen:XML,TargetAttr:TagName,'String14')
  SELF.Attribute.Set(?String14,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?FECHA_ALTA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?FECHA_ALTA,RepGen:XML,TargetAttr:TagName,'FECHA_ALTA')
  SELF.Attribute.Set(?FECHA_ALTA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?CP,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?CP,RepGen:XML,TargetAttr:TagName,'CP')
  SELF.Attribute.Set(?CP,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String20,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String20,RepGen:XML,TargetAttr:TagName,'String20')
  SELF.Attribute.Set(?String20,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String21,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String21,RepGen:XML,TargetAttr:TagName,'String21')
  SELF.Attribute.Set(?String21,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String23,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String23,RepGen:XML,TargetAttr:TagName,'String23')
  SELF.Attribute.Set(?String23,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?GLO:FECHA_LARGO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GLO:FECHA_LARGO,RepGen:XML,TargetAttr:TagName,'GLO:FECHA_LARGO')
  SELF.Attribute.Set(?GLO:FECHA_LARGO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String18,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String18,RepGen:XML,TargetAttr:TagName,'String18')
  SELF.Attribute.Set(?String18,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?FOLIO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?FOLIO,RepGen:XML,TargetAttr:TagName,'FOLIO')
  SELF.Attribute.Set(?FOLIO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String16,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String16,RepGen:XML,TargetAttr:TagName,'String16')
  SELF.Attribute.Set(?String16,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?LOCALI,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?LOCALI,RepGen:XML,TargetAttr:TagName,'LOCALI')
  SELF.Attribute.Set(?LOCALI,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?NOMBRE,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?NOMBRE,RepGen:XML,TargetAttr:TagName,'NOMBRE')
  SELF.Attribute.Set(?NOMBRE,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String10,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String10,RepGen:XML,TargetAttr:TagName,'String10')
  SELF.Attribute.Set(?String10,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String8,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String8,RepGen:XML,TargetAttr:TagName,'String8')
  SELF.Attribute.Set(?String8,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?MATRICULA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?MATRICULA,RepGen:XML,TargetAttr:TagName,'MATRICULA')
  SELF.Attribute.Set(?MATRICULA,RepGen:XML,TargetAttr:TagValueFromText,True)


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  ReturnValue = PARENT.TakeRecord()
  PRINT(RPT:Detail)
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
  SELF.SetDocumentInfo('CW Report','Gestion','Imprimir_Certificado_Curso','Imprimir_Certificado_Curso','','')
  SELF.SetPagesAsParentBookmark(False)
  SELF.SetScanCopyMode(False)
  SELF.CompressText   = True
  SELF.CompressImages = True

!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the CURSO_INSCRIPCION_DETALLE File
!!! </summary>
Imprimir_Certificados_Modulos_Curso PROCEDURE 

!--------------------------------------------------------------------------
! Tagging Data
!--------------------------------------------------------------------------
DASBRW::6:TAGFLAG          BYTE(0)
DASBRW::6:TAGMOUSE         BYTE(0)
DASBRW::6:TAGDISPSTATUS    BYTE(0)
DASBRW::6:QUEUE           QUEUE
PUNTERO                       LIKE(PUNTERO)
PUNTERO2                      LIKE(PUNTERO2)
PUNTERO3                      LIKE(PUNTERO3)
                          END
!--------------------------------------------------------------------------
! Tagging Data
!--------------------------------------------------------------------------
CurrentTab           STRING(80)                            ! 
T                    STRING(1)                             ! 
LOC:NOMBRE           CSTRING(51)                           ! 
BRW1::View:Browse    VIEW(CURSO_INSCRIPCION_DETALLE)
                       PROJECT(CURD:PRESENTE)
                       PROJECT(CURD:NOTA)
                       PROJECT(CURD:PAGADO)
                       PROJECT(CURD:IDINSCRIPCION)
                       PROJECT(CURD:IDCURSO)
                       PROJECT(CURD:ID_MODULO)
                       JOIN(CURI:PK_CURSO_INSCRIPCION,CURD:IDINSCRIPCION)
                         PROJECT(CURI:IDINSCRIPCION)
                         PROJECT(CURI:ID_PROVEEDOR)
                         JOIN(PRO2:PK_PROVEEDOR,CURI:ID_PROVEEDOR)
                           PROJECT(PRO2:DESCRIPCION)
                           PROJECT(PRO2:IDPROVEEDOR)
                         END
                       END
                       JOIN(CUR2:PK_CURSO_MODULOS,CURD:ID_MODULO)
                         PROJECT(CUR2:FECHA_FIN)
                         PROJECT(CUR2:ID_MODULO)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
T                      LIKE(T)                        !List box control field - type derived from local data
PRO2:DESCRIPCION       LIKE(PRO2:DESCRIPCION)         !List box control field - type derived from field
CUR2:FECHA_FIN         LIKE(CUR2:FECHA_FIN)           !List box control field - type derived from field
CURD:PRESENTE          LIKE(CURD:PRESENTE)            !List box control field - type derived from field
CURD:NOTA              LIKE(CURD:NOTA)                !List box control field - type derived from field
CURD:PAGADO            LIKE(CURD:PAGADO)              !List box control field - type derived from field
CURD:IDINSCRIPCION     LIKE(CURD:IDINSCRIPCION)       !List box control field - type derived from field
CURD:IDCURSO           LIKE(CURD:IDCURSO)             !List box control field - type derived from field
CURD:ID_MODULO         LIKE(CURD:ID_MODULO)           !List box control field - type derived from field
CURI:IDINSCRIPCION     LIKE(CURI:IDINSCRIPCION)       !Related join file key field - type derived from field
PRO2:IDPROVEEDOR       LIKE(PRO2:IDPROVEEDOR)         !Related join file key field - type derived from field
CUR2:ID_MODULO         LIKE(CUR2:ID_MODULO)           !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Listado de Inscriptos en Módulo'),AT(,,453,312),FONT('Arial',8,,FONT:bold),RESIZE, |
  CENTER,GRAY,IMM,MDI,HLP('Imprimir_Certificados_Modulos_Curso'),SYSTEM
                       STRING(@s50),AT(0,1,390,14),USE(CUR2:DESCRIPCION),FONT('Arial',12,,FONT:bold),CENTER
                       BUTTON('&Filtro'),AT(7,262,56,14),USE(?Query),LEFT,ICON('qbe.ico'),FLAT
                       BUTTON('&Marcar'),AT(55,265,82,13),USE(?DASTAG),FLAT
                       BUTTON('Marcar &Todo'),AT(143,265,82,13),USE(?DASTAGAll),FLAT
                       BUTTON('&Demarcar Todo'),AT(55,280,82,13),USE(?DASUNTAGALL),FLAT
                       BUTTON('&Revertir'),AT(142,280,82,13),USE(?DASREVTAG),FLAT
                       BUTTON('Mostrar solo Marcados'),AT(228,265,82,13),USE(?DASSHOWTAG),FLAT
                       BUTTON('Imprimir Certificado'),AT(314,264,82,21),USE(?Button8),LEFT,ICON(ICON:Print1),FLAT
                       SHEET,AT(4,17,446,242),USE(?CurrentTab)
                         TAB('Modulo de Inscriptos Pagado'),USE(?Tab:2)
                           PROMPT('NOMBRE ALUMNO:'),AT(8,37),USE(?LOC:NOMBRE:Prompt)
                           ENTRY(@s50),AT(71,37,159,10),USE(LOC:NOMBRE),UPR
                           BUTTON('Filtrar Nombre que Comience con ....'),AT(232,33,91,17),USE(?Button9),LEFT,ICON(ICON:Zoom), |
  FLAT
                           LIST,AT(7,52,440,201),USE(?Browse:1),HVSCROLL,FORMAT('14L(2)|M@s1@200L(2)|M~INSCRIPTO~@' & |
  's50@52L(2)|M~FECHA FIN~@d17@51L(2)|M~PRESENTE~@s2@36D(16)|M~NOTA~C(0)@n-7.2@28L(2)|M' & |
  '~PAGADO~@s2@64R(2)|M~IDINSCRIPCION~C(0)@n-14@64R(2)|M~IDCURSO~C(0)@n-14@64R(2)|M~ID_' & |
  'MODULO~C(0)@n-14@'),FROM(Queue:Browse:1),IMM,MSG('Administrador de CURSO_INSCRIPCION_DETALLE'), |
  VCR
                         END
                       END
                       BUTTON('&Salir'),AT(401,281,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Salir'),TIP('Salir')
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeFieldEvent         PROCEDURE(),BYTE,PROC,DERIVED
TakeNewSelection       PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
QBE5                 QueryListClass                        ! QBE List Class. 
QBV5                 QueryListVisual                       ! QBE Visual Class
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
SetQueueRecord         PROCEDURE(),DERIVED
TakeKey                PROCEDURE(),BYTE,PROC,DERIVED
ValidateRecord         PROCEDURE(),BYTE,DERIVED
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END


  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!--------------------------------------------------------------------------
! DAS_Tagging
!--------------------------------------------------------------------------
DASBRW::6:DASTAGONOFF Routine
  GET(Queue:Browse:1,CHOICE(?Browse:1))
  BRW1.UpdateBuffer
   TAGS.PUNTERO = CURD:IDINSCRIPCION
   TAGS.PUNTERO2 = CURD:IDCURSO
   TAGS.PUNTERO3 = CURD:ID_MODULO
   GET(TAGS,TAGS.PUNTERO,TAGS.PUNTERO2,TAGS.PUNTERO3)
  IF ERRORCODE()
     TAGS.PUNTERO = CURD:IDINSCRIPCION
     TAGS.PUNTERO2 = CURD:IDCURSO
     TAGS.PUNTERO3 = CURD:ID_MODULO
     ADD(TAGS,TAGS.PUNTERO,TAGS.PUNTERO2,TAGS.PUNTERO3)
    T = '*'
  ELSE
    DELETE(TAGS)
    T = ''
  END
    Queue:Browse:1.T = T
  PUT(Queue:Browse:1)
  ThisWindow.Reset(1)
  SELECT(?Browse:1,CHOICE(?Browse:1))
  IF DASBRW::6:TAGMOUSE = 1 THEN
    DASBRW::6:TAGMOUSE = 0
  ELSE
  DASBRW::6:TAGFLAG = 1
  POST(EVENT:ScrollDown,?Browse:1)
  END
DASBRW::6:DASTAGALL Routine
  ?Browse:1{PROPLIST:MouseDownField} = 2
  SETCURSOR(CURSOR:Wait)
  BRW1.Reset
  FREE(TAGS)
  LOOP
    NEXT(BRW1::View:Browse)
    IF ERRORCODE()
      BREAK
    END
     TAGS.PUNTERO = CURD:IDINSCRIPCION
     TAGS.PUNTERO2 = CURD:IDCURSO
     TAGS.PUNTERO3 = CURD:ID_MODULO
     ADD(TAGS,TAGS.PUNTERO,TAGS.PUNTERO2,TAGS.PUNTERO3)
  END
  SETCURSOR
  BRW1.ResetSort(1)
  ThisWindow.Reset(1)
  SELECT(?Browse:1,CHOICE(?Browse:1))
DASBRW::6:DASUNTAGALL Routine
  ?Browse:1{PROPLIST:MouseDownField} = 2
  SETCURSOR(CURSOR:Wait)
  FREE(TAGS)
  BRW1.Reset
  SETCURSOR
  BRW1.ResetSort(1)
  ThisWindow.Reset(1)
  SELECT(?Browse:1,CHOICE(?Browse:1))
DASBRW::6:DASREVTAGALL Routine
  ?Browse:1{PROPLIST:MouseDownField} = 2
  SETCURSOR(CURSOR:Wait)
  FREE(DASBRW::6:QUEUE)
  LOOP QR# = 1 TO RECORDS(TAGS)
    GET(TAGS,QR#)
    DASBRW::6:QUEUE = TAGS
    ADD(DASBRW::6:QUEUE)
  END
  FREE(TAGS)
  BRW1.Reset
  LOOP
    NEXT(BRW1::View:Browse)
    IF ERRORCODE()
      BREAK
    END
     DASBRW::6:QUEUE.PUNTERO = CURD:IDINSCRIPCION
     DASBRW::6:QUEUE.PUNTERO2 = CURD:IDCURSO
     DASBRW::6:QUEUE.PUNTERO3 = CURD:ID_MODULO
     GET(DASBRW::6:QUEUE,DASBRW::6:QUEUE.PUNTERO,DASBRW::6:QUEUE.PUNTERO2,DASBRW::6:QUEUE.PUNTERO3)
    IF ERRORCODE()
       TAGS.PUNTERO = CURD:IDINSCRIPCION
       TAGS.PUNTERO2 = CURD:IDCURSO
       TAGS.PUNTERO3 = CURD:ID_MODULO
       ADD(TAGS,TAGS.PUNTERO,TAGS.PUNTERO2,TAGS.PUNTERO3)
    END
  END
  SETCURSOR
  BRW1.ResetSort(1)
  ThisWindow.Reset(1)
  SELECT(?Browse:1,CHOICE(?Browse:1))
DASBRW::6:DASSHOWTAG Routine
   CASE DASBRW::6:TAGDISPSTATUS
   OF 0
      DASBRW::6:TAGDISPSTATUS = 1    ! display tagged
      ?DASSHOWTAG{PROP:Text} = 'Showing Tagged'
      ?DASSHOWTAG{PROP:Msg}  = 'Showing Tagged'
      ?DASSHOWTAG{PROP:Tip}  = 'Showing Tagged'
   OF 1
      DASBRW::6:TAGDISPSTATUS = 2    ! display untagged
      ?DASSHOWTAG{PROP:Text} = 'Showing UnTagged'
      ?DASSHOWTAG{PROP:Msg}  = 'Showing UnTagged'
      ?DASSHOWTAG{PROP:Tip}  = 'Showing UnTagged'
   OF 2
      DASBRW::6:TAGDISPSTATUS = 0    ! display all
      ?DASSHOWTAG{PROP:Text} = 'Show All'
      ?DASSHOWTAG{PROP:Msg}  = 'Show All'
      ?DASSHOWTAG{PROP:Tip}  = 'Show All'
   END
   DISPLAY(?DASSHOWTAG{PROP:Text})
   BRW1.ResetSort(1)
   SELECT(?Browse:1,CHOICE(?Browse:1))
   EXIT
!--------------------------------------------------------------------------
! DAS_Tagging
!--------------------------------------------------------------------------
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
  GlobalErrors.SetProcedureName('Imprimir_Certificados_Modulos_Curso')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?CUR2:DESCRIPCION
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('GLO:IDCURSO',GLO:IDCURSO)                          ! Added by: BrowseBox(ABC)
  BIND('CURD:ID_MODULO',CURD:ID_MODULO)                    ! Added by: DAS_TagBrowseABC(DAS_TagingABC)
  BIND('GLO:ID_MODULO',GLO:ID_MODULO)                      ! Added by: BrowseBox(ABC)
  BIND('T',T)                                              ! Added by: BrowseBox(ABC)
  BIND('CUR2:FECHA_FIN',CUR2:FECHA_FIN)                    ! Added by: BrowseBox(ABC)
  BIND('CUR2:ID_MODULO',CUR2:ID_MODULO)                    ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:CURSO.Open                                        ! File CURSO used by this procedure, so make sure it's RelationManager is open
  Relate:CURSO_INSCRIPCION_DETALLE.SetOpenRelated()
  Relate:CURSO_INSCRIPCION_DETALLE.Open                    ! File CURSO_INSCRIPCION_DETALLE used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:CURSO_INSCRIPCION_DETALLE,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  QBE5.Init(QBV5, INIMgr,'Imprimir_Certificados_Modulos_Curso', GlobalErrors)
  QBE5.QkSupport = True
  QBE5.QkMenuIcon = 'QkQBE.ico'
  QBE5.QkIcon = 'QkLoad.ico'
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,CURD:PK_CURSO_INSCRIPCION_DETALLE)    ! Add the sort order for CURD:PK_CURSO_INSCRIPCION_DETALLE for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,CURD:IDINSCRIPCION,,BRW1)      ! Initialize the browse locator using  using key: CURD:PK_CURSO_INSCRIPCION_DETALLE , CURD:IDINSCRIPCION
  BRW1.SetFilter('(CURD:IDCURSO = GLO:IDCURSO AND  CURD:ID_MODULO = GLO:ID_MODULO   AND CURD:PAGADO = ''SI'')') ! Apply filter expression to browse
  BRW1.AddField(T,BRW1.Q.T)                                ! Field T is a hot field or requires assignment from browse
  BRW1.AddField(PRO2:DESCRIPCION,BRW1.Q.PRO2:DESCRIPCION)  ! Field PRO2:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(CUR2:FECHA_FIN,BRW1.Q.CUR2:FECHA_FIN)      ! Field CUR2:FECHA_FIN is a hot field or requires assignment from browse
  BRW1.AddField(CURD:PRESENTE,BRW1.Q.CURD:PRESENTE)        ! Field CURD:PRESENTE is a hot field or requires assignment from browse
  BRW1.AddField(CURD:NOTA,BRW1.Q.CURD:NOTA)                ! Field CURD:NOTA is a hot field or requires assignment from browse
  BRW1.AddField(CURD:PAGADO,BRW1.Q.CURD:PAGADO)            ! Field CURD:PAGADO is a hot field or requires assignment from browse
  BRW1.AddField(CURD:IDINSCRIPCION,BRW1.Q.CURD:IDINSCRIPCION) ! Field CURD:IDINSCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(CURD:IDCURSO,BRW1.Q.CURD:IDCURSO)          ! Field CURD:IDCURSO is a hot field or requires assignment from browse
  BRW1.AddField(CURD:ID_MODULO,BRW1.Q.CURD:ID_MODULO)      ! Field CURD:ID_MODULO is a hot field or requires assignment from browse
  BRW1.AddField(CURI:IDINSCRIPCION,BRW1.Q.CURI:IDINSCRIPCION) ! Field CURI:IDINSCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(PRO2:IDPROVEEDOR,BRW1.Q.PRO2:IDPROVEEDOR)  ! Field PRO2:IDPROVEEDOR is a hot field or requires assignment from browse
  BRW1.AddField(CUR2:ID_MODULO,BRW1.Q.CUR2:ID_MODULO)      ! Field CUR2:ID_MODULO is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('Imprimir_Certificados_Modulos_Curso',QuickWindow) ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.QueryControl = ?Query
  BRW1.UpdateQuery(QBE5,1)
  SELF.SetAlerts()
  !--------------------------------------------------------------------------
  ! Tagging Init
  !--------------------------------------------------------------------------
  FREE(TAGS)
  ?DASSHOWTAG{PROP:Text} = 'Show All'
  ?DASSHOWTAG{PROP:Msg}  = 'Show All'
  ?DASSHOWTAG{PROP:Tip}  = 'Show All'
  !--------------------------------------------------------------------------
  ! Tagging Init
  !--------------------------------------------------------------------------
  ?Browse:1{Prop:Alrt,239} = SpaceKey
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
  !--------------------------------------------------------------------------
  ! Tagging Kill
  !--------------------------------------------------------------------------
  FREE(TAGS)
  !--------------------------------------------------------------------------
  ! Tagging Kill
  !--------------------------------------------------------------------------
    Relate:CURSO.Close
    Relate:CURSO_INSCRIPCION_DETALLE.Close
  END
  IF SELF.Opened
    INIMgr.Update('Imprimir_Certificados_Modulos_Curso',QuickWindow) ! Save window data to non-volatile store
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
    OF ?Button8
      FREE(CARNET)
      Loop i# = 1 to records(Tags)
          get(Tags,i#)
          CURD:IDINSCRIPCION = tags:Puntero
          CURD:IDCURSO       = tags:PUNTERO2
          CURD:ID_MODULO     = tags:PUNTERO3
          ACCESS:CURSO_INSCRIPCION_DETALLE.TRYFETCH(CURD:PK_CURSO_INSCRIPCION_DETALLE)
          MODULO# =  CURD:ID_MODULO
          CURSO# = CURD:IDCURSO
          !!! BUSCAR PROVEEDOR
          CURI:IDINSCRIPCION = CURD:IDINSCRIPCION
          ACCESS:CURSO_INSCRIPCION.TRYFETCH(CURI:PK_CURSO_INSCRIPCION)
          PRO2:IDPROVEEDOR = CURI:ID_PROVEEDOR
          ACCESS:PROVEEDORES.TRYFETCH(PRO2:PK_PROVEEDOR)
          NOMBRE     =    PRO2:DESCRIPCION
          N_DOCUMENTO = PRO2:CUIT
          !! BUSCAR MODULO DE CURSO
          CUR2:ID_MODULO = MODULO#
          ACCESS:CURSO_MODULOS.TRYFETCH(CUR2:PK_CURSO_MODULOS)
          MATRICULA  =    CUR2:NUMERO_MODULO
          DIRECCION  =    CUR2:DESCRIPCION
          FECHA_ALTA =    CUR2:FECHA_INICIO
          FOLIO      =    CUR2:FECHA_FIN
          CP         =    CUR2:CANTIDAD_HORAS
          CUR:IDCURSO =   CURSO#
          ACCESS:CURSO.TRYFETCH(CUR:PK_CURSO)
          LOCALI = CUR:DESCRIPCION
          ADD(CARNET)
      end
    OF ?Button9
      IF Loc:Nombre <> '' THEN
          BRW1.VIEW{PROP:SQLFILTER}= 'C.DESCRIPCION LIKE'''&CLIP(Loc:Nombre)&'%'' AND A.IDCURSO = '''&GLO:IDCURSO&''' AND A.ID_MODULO = '''&GLO:ID_MODULO&''''
          
      ELSE
          BRW1.VIEW{PROP:SQLFILTER}= ''
      END
      THISWINDOW.RESET(1)
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?DASTAG
      ThisWindow.Update()
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
        DO DASBRW::6:DASTAGONOFF
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
    OF ?DASTAGAll
      ThisWindow.Update()
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
        DO DASBRW::6:DASTAGALL
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
    OF ?DASUNTAGALL
      ThisWindow.Update()
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
        DO DASBRW::6:DASUNTAGALL
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
    OF ?DASREVTAG
      ThisWindow.Update()
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
        DO DASBRW::6:DASREVTAGALL
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
    OF ?DASSHOWTAG
      ThisWindow.Update()
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
        DO DASBRW::6:DASSHOWTAG
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
    OF ?Button8
      ThisWindow.Update()
      START(Imprimir_Certificado_Curso, 25000)
      ThisWindow.Reset
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeFieldEvent PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all field specific events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  CASE FIELD()
  OF ?Browse:1
    CASE EVENT()
    OF EVENT:PreAlertKey
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
      IF Keycode() = SpaceKey
         POST(EVENT:Accepted,?DASTAG)
         CYCLE
      END
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
    END
  END
  ReturnValue = PARENT.TakeFieldEvent()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeNewSelection PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all NewSelection events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  ReturnValue = PARENT.TakeNewSelection()
    CASE FIELD()
    OF ?Browse:1
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
      IF KEYCODE() = MouseLeft AND (?Browse:1{PROPLIST:MouseDownRow} > 0) AND (DASBRW::6:TAGFLAG = 0)
        CASE ?Browse:1{PROPLIST:MouseDownField}
      
          OF 1
            DASBRW::6:TAGMOUSE = 1
            POST(EVENT:Accepted,?DASTAG)
               ?Browse:1{PROPLIST:MouseDownField} = 2
            CYCLE
         END
      END
      DASBRW::6:TAGFLAG = 0
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


BRW1.SetQueueRecord PROCEDURE

  CODE
  !--------------------------------------------------------------------------
  ! DAS_Tagging
  !--------------------------------------------------------------------------
     TAGS.PUNTERO = CURD:IDINSCRIPCION
     TAGS.PUNTERO2 = CURD:IDCURSO
     TAGS.PUNTERO3 = CURD:ID_MODULO
     GET(TAGS,TAGS.PUNTERO,TAGS.PUNTERO2,TAGS.PUNTERO3)
    IF ERRORCODE()
      T = ''
    ELSE
      T = '*'
    END
  !--------------------------------------------------------------------------
  ! DAS_Tagging
  !--------------------------------------------------------------------------
  PARENT.SetQueueRecord()      !FIX FOR CFW 4 (DASTAG)
  PARENT.SetQueueRecord


BRW1.TakeKey PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  !--------------------------------------------------------------------------
  ! DAS_Tagging
  !--------------------------------------------------------------------------
  IF Keycode() = SpaceKey
    RETURN ReturnValue
  END
  !--------------------------------------------------------------------------
  ! DAS_Tagging
  !--------------------------------------------------------------------------
  ReturnValue = PARENT.TakeKey()
  RETURN ReturnValue


BRW1.ValidateRecord PROCEDURE

ReturnValue          BYTE,AUTO

BRW1::RecordStatus   BYTE,AUTO
  CODE
  ReturnValue = PARENT.ValidateRecord()
  BRW1::RecordStatus=ReturnValue
  IF BRW1::RecordStatus NOT=Record:OK THEN RETURN BRW1::RecordStatus.
  !--------------------------------------------------------------------------
  ! DAS_Tagging
  !--------------------------------------------------------------------------
     TAGS.PUNTERO = CURD:IDINSCRIPCION
     TAGS.PUNTERO2 = CURD:IDCURSO
     TAGS.PUNTERO3 = CURD:ID_MODULO
     GET(TAGS,TAGS.PUNTERO,TAGS.PUNTERO2,TAGS.PUNTERO3)
    EXECUTE DASBRW::6:TAGDISPSTATUS
       IF ERRORCODE() THEN BRW1::RecordStatus = RECORD:FILTERED END
       IF ~ERRORCODE() THEN BRW1::RecordStatus = RECORD:FILTERED END
    END
  !--------------------------------------------------------------------------
  ! DAS_Tagging
  !--------------------------------------------------------------------------
  ReturnValue=BRW1::RecordStatus
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the CURSO_INSCRIPCION_DETALLE File
!!! </summary>
CERTIFICADOXALUMNO PROCEDURE 

!--------------------------------------------------------------------------
! Tagging Data
!--------------------------------------------------------------------------
DASBRW::6:TAGFLAG          BYTE(0)
DASBRW::6:TAGMOUSE         BYTE(0)
DASBRW::6:TAGDISPSTATUS    BYTE(0)
DASBRW::6:QUEUE           QUEUE
PUNTERO                       LIKE(PUNTERO)
PUNTERO2                      LIKE(PUNTERO2)
PUNTERO3                      LIKE(PUNTERO3)
                          END
!--------------------------------------------------------------------------
! Tagging Data
!--------------------------------------------------------------------------
CurrentTab           STRING(80)                            ! 
T                    STRING(1)                             ! 
LOC:NOMBRE           CSTRING(51)                           ! 
BRW1::View:Browse    VIEW(CURSO_INSCRIPCION_DETALLE)
                       PROJECT(CURD:PRESENTE)
                       PROJECT(CURD:NOTA)
                       PROJECT(CURD:PAGADO)
                       PROJECT(CURD:IDINSCRIPCION)
                       PROJECT(CURD:IDCURSO)
                       PROJECT(CURD:ID_MODULO)
                       JOIN(CURI:PK_CURSO_INSCRIPCION,CURD:IDINSCRIPCION)
                         PROJECT(CURI:IDINSCRIPCION)
                         PROJECT(CURI:ID_PROVEEDOR)
                         JOIN(PRO2:PK_PROVEEDOR,CURI:ID_PROVEEDOR)
                           PROJECT(PRO2:DESCRIPCION)
                           PROJECT(PRO2:IDPROVEEDOR)
                         END
                       END
                       JOIN(CUR2:PK_CURSO_MODULOS,CURD:ID_MODULO)
                         PROJECT(CUR2:DESCRIPCION)
                         PROJECT(CUR2:FECHA_FIN)
                         PROJECT(CUR2:ID_MODULO)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
T                      LIKE(T)                        !List box control field - type derived from local data
CUR2:DESCRIPCION       LIKE(CUR2:DESCRIPCION)         !List box control field - type derived from field
PRO2:DESCRIPCION       LIKE(PRO2:DESCRIPCION)         !List box control field - type derived from field
CUR2:FECHA_FIN         LIKE(CUR2:FECHA_FIN)           !List box control field - type derived from field
CURD:PRESENTE          LIKE(CURD:PRESENTE)            !List box control field - type derived from field
CURD:NOTA              LIKE(CURD:NOTA)                !List box control field - type derived from field
CURD:PAGADO            LIKE(CURD:PAGADO)              !List box control field - type derived from field
CURD:IDINSCRIPCION     LIKE(CURD:IDINSCRIPCION)       !List box control field - type derived from field
CURD:IDCURSO           LIKE(CURD:IDCURSO)             !List box control field - type derived from field
CURD:ID_MODULO         LIKE(CURD:ID_MODULO)           !List box control field - type derived from field
CURI:IDINSCRIPCION     LIKE(CURI:IDINSCRIPCION)       !Related join file key field - type derived from field
PRO2:IDPROVEEDOR       LIKE(PRO2:IDPROVEEDOR)         !Related join file key field - type derived from field
CUR2:ID_MODULO         LIKE(CUR2:ID_MODULO)           !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Certificado de Módulos por Alumno'),AT(,,453,312),FONT('Arial',8,,FONT:bold),RESIZE, |
  CENTER,GRAY,IMM,MDI,HLP('Imprimir_Certificados_Modulos_Curso'),SYSTEM
                       STRING(@s50),AT(0,1,390,14),USE(CUR2:DESCRIPCION),FONT('Arial',12,,FONT:bold),CENTER
                       BUTTON('&Filtro'),AT(7,262,56,14),USE(?Query),LEFT,ICON('qbe.ico'),FLAT
                       BUTTON('&Marcar'),AT(55,265,82,13),USE(?DASTAG),FLAT
                       BUTTON('Marcar &Todo'),AT(143,265,82,13),USE(?DASTAGAll),FLAT
                       BUTTON('&Demarcar Todo'),AT(55,280,82,13),USE(?DASUNTAGALL),FLAT
                       BUTTON('&Revertir'),AT(142,280,82,13),USE(?DASREVTAG),FLAT
                       BUTTON('Mostrar solo Marcados'),AT(228,265,82,13),USE(?DASSHOWTAG),FLAT
                       BUTTON('Imprimir Certificado'),AT(314,264,82,21),USE(?Button8),LEFT,ICON(ICON:Print1),FLAT
                       SHEET,AT(4,17,446,242),USE(?CurrentTab)
                         TAB('Modulo de Inscriptos Pagado'),USE(?Tab:2)
                           PROMPT('NOMBRE ALUMNO:'),AT(8,37),USE(?LOC:NOMBRE:Prompt)
                           ENTRY(@s50),AT(71,37,159,10),USE(LOC:NOMBRE),UPR
                           BUTTON('Filtrar Nombre que Comience con ....'),AT(232,33,91,17),USE(?Button9),LEFT,ICON(ICON:Zoom), |
  FLAT
                           LIST,AT(7,52,440,201),USE(?Browse:1),HVSCROLL,FORMAT('14L(2)|M@s1@123L(2)|M~MODULO~@s50' & |
  '@200L(2)|M~INSCRIPTO~@s50@52L(2)|M~FECHA FIN~@d17@51L(2)|M~PRESENTE~@s2@36D(16)|M~NO' & |
  'TA~C(0)@n-7.2@28L(2)|M~PAGADO~@s2@64R(2)|M~IDINSCRIPCION~C(0)@n-14@64R(2)|M~IDCURSO~' & |
  'C(0)@n-14@64R(2)|M~ID_MODULO~C(0)@n-14@'),FROM(Queue:Browse:1),IMM,MSG('Administrado' & |
  'r de CURSO_INSCRIPCION_DETALLE'),VCR
                         END
                       END
                       BUTTON('&Salir'),AT(401,281,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Salir'),TIP('Salir')
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeFieldEvent         PROCEDURE(),BYTE,PROC,DERIVED
TakeNewSelection       PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
QBE5                 QueryListClass                        ! QBE List Class. 
QBV5                 QueryListVisual                       ! QBE Visual Class
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
SetQueueRecord         PROCEDURE(),DERIVED
TakeKey                PROCEDURE(),BYTE,PROC,DERIVED
ValidateRecord         PROCEDURE(),BYTE,DERIVED
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END


  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!--------------------------------------------------------------------------
! DAS_Tagging
!--------------------------------------------------------------------------
DASBRW::6:DASTAGONOFF Routine
  GET(Queue:Browse:1,CHOICE(?Browse:1))
  BRW1.UpdateBuffer
   TAGS.PUNTERO = CURD:IDINSCRIPCION
   TAGS.PUNTERO2 = CURD:IDCURSO
   TAGS.PUNTERO3 = CURD:ID_MODULO
   GET(TAGS,TAGS.PUNTERO,TAGS.PUNTERO2,TAGS.PUNTERO3)
  IF ERRORCODE()
     TAGS.PUNTERO = CURD:IDINSCRIPCION
     TAGS.PUNTERO2 = CURD:IDCURSO
     TAGS.PUNTERO3 = CURD:ID_MODULO
     ADD(TAGS,TAGS.PUNTERO,TAGS.PUNTERO2,TAGS.PUNTERO3)
    T = '*'
  ELSE
    DELETE(TAGS)
    T = ''
  END
    Queue:Browse:1.T = T
  PUT(Queue:Browse:1)
  ThisWindow.Reset(1)
  SELECT(?Browse:1,CHOICE(?Browse:1))
  IF DASBRW::6:TAGMOUSE = 1 THEN
    DASBRW::6:TAGMOUSE = 0
  ELSE
  DASBRW::6:TAGFLAG = 1
  POST(EVENT:ScrollDown,?Browse:1)
  END
DASBRW::6:DASTAGALL Routine
  ?Browse:1{PROPLIST:MouseDownField} = 2
  SETCURSOR(CURSOR:Wait)
  BRW1.Reset
  FREE(TAGS)
  LOOP
    NEXT(BRW1::View:Browse)
    IF ERRORCODE()
      BREAK
    END
     TAGS.PUNTERO = CURD:IDINSCRIPCION
     TAGS.PUNTERO2 = CURD:IDCURSO
     TAGS.PUNTERO3 = CURD:ID_MODULO
     ADD(TAGS,TAGS.PUNTERO,TAGS.PUNTERO2,TAGS.PUNTERO3)
  END
  SETCURSOR
  BRW1.ResetSort(1)
  ThisWindow.Reset(1)
  SELECT(?Browse:1,CHOICE(?Browse:1))
DASBRW::6:DASUNTAGALL Routine
  ?Browse:1{PROPLIST:MouseDownField} = 2
  SETCURSOR(CURSOR:Wait)
  FREE(TAGS)
  BRW1.Reset
  SETCURSOR
  BRW1.ResetSort(1)
  ThisWindow.Reset(1)
  SELECT(?Browse:1,CHOICE(?Browse:1))
DASBRW::6:DASREVTAGALL Routine
  ?Browse:1{PROPLIST:MouseDownField} = 2
  SETCURSOR(CURSOR:Wait)
  FREE(DASBRW::6:QUEUE)
  LOOP QR# = 1 TO RECORDS(TAGS)
    GET(TAGS,QR#)
    DASBRW::6:QUEUE = TAGS
    ADD(DASBRW::6:QUEUE)
  END
  FREE(TAGS)
  BRW1.Reset
  LOOP
    NEXT(BRW1::View:Browse)
    IF ERRORCODE()
      BREAK
    END
     DASBRW::6:QUEUE.PUNTERO = CURD:IDINSCRIPCION
     DASBRW::6:QUEUE.PUNTERO2 = CURD:IDCURSO
     DASBRW::6:QUEUE.PUNTERO3 = CURD:ID_MODULO
     GET(DASBRW::6:QUEUE,DASBRW::6:QUEUE.PUNTERO,DASBRW::6:QUEUE.PUNTERO2,DASBRW::6:QUEUE.PUNTERO3)
    IF ERRORCODE()
       TAGS.PUNTERO = CURD:IDINSCRIPCION
       TAGS.PUNTERO2 = CURD:IDCURSO
       TAGS.PUNTERO3 = CURD:ID_MODULO
       ADD(TAGS,TAGS.PUNTERO,TAGS.PUNTERO2,TAGS.PUNTERO3)
    END
  END
  SETCURSOR
  BRW1.ResetSort(1)
  ThisWindow.Reset(1)
  SELECT(?Browse:1,CHOICE(?Browse:1))
DASBRW::6:DASSHOWTAG Routine
   CASE DASBRW::6:TAGDISPSTATUS
   OF 0
      DASBRW::6:TAGDISPSTATUS = 1    ! display tagged
      ?DASSHOWTAG{PROP:Text} = 'Showing Tagged'
      ?DASSHOWTAG{PROP:Msg}  = 'Showing Tagged'
      ?DASSHOWTAG{PROP:Tip}  = 'Showing Tagged'
   OF 1
      DASBRW::6:TAGDISPSTATUS = 2    ! display untagged
      ?DASSHOWTAG{PROP:Text} = 'Showing UnTagged'
      ?DASSHOWTAG{PROP:Msg}  = 'Showing UnTagged'
      ?DASSHOWTAG{PROP:Tip}  = 'Showing UnTagged'
   OF 2
      DASBRW::6:TAGDISPSTATUS = 0    ! display all
      ?DASSHOWTAG{PROP:Text} = 'Show All'
      ?DASSHOWTAG{PROP:Msg}  = 'Show All'
      ?DASSHOWTAG{PROP:Tip}  = 'Show All'
   END
   DISPLAY(?DASSHOWTAG{PROP:Text})
   BRW1.ResetSort(1)
   SELECT(?Browse:1,CHOICE(?Browse:1))
   EXIT
!--------------------------------------------------------------------------
! DAS_Tagging
!--------------------------------------------------------------------------
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
  GlobalErrors.SetProcedureName('CERTIFICADOXALUMNO')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?CUR2:DESCRIPCION
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('T',T)                                              ! Added by: BrowseBox(ABC)
  BIND('CUR2:FECHA_FIN',CUR2:FECHA_FIN)                    ! Added by: BrowseBox(ABC)
  BIND('CURD:ID_MODULO',CURD:ID_MODULO)                    ! Added by: BrowseBox(ABC)
  BIND('CUR2:ID_MODULO',CUR2:ID_MODULO)                    ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:CURSO.Open                                        ! File CURSO used by this procedure, so make sure it's RelationManager is open
  Relate:CURSO_INSCRIPCION_DETALLE.SetOpenRelated()
  Relate:CURSO_INSCRIPCION_DETALLE.Open                    ! File CURSO_INSCRIPCION_DETALLE used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:CURSO_INSCRIPCION_DETALLE,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  QBE5.Init(QBV5, INIMgr,'Imprimir_Certificados_Modulos_Curso', GlobalErrors)
  QBE5.QkSupport = True
  QBE5.QkMenuIcon = 'QkQBE.ico'
  QBE5.QkIcon = 'QkLoad.ico'
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,CURD:PK_CURSO_INSCRIPCION_DETALLE)    ! Add the sort order for CURD:PK_CURSO_INSCRIPCION_DETALLE for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,CURD:IDINSCRIPCION,,BRW1)      ! Initialize the browse locator using  using key: CURD:PK_CURSO_INSCRIPCION_DETALLE , CURD:IDINSCRIPCION
  BRW1.SetFilter('(CURD:PAGADO = ''SI'')')                 ! Apply filter expression to browse
  BRW1.AddField(T,BRW1.Q.T)                                ! Field T is a hot field or requires assignment from browse
  BRW1.AddField(CUR2:DESCRIPCION,BRW1.Q.CUR2:DESCRIPCION)  ! Field CUR2:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(PRO2:DESCRIPCION,BRW1.Q.PRO2:DESCRIPCION)  ! Field PRO2:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(CUR2:FECHA_FIN,BRW1.Q.CUR2:FECHA_FIN)      ! Field CUR2:FECHA_FIN is a hot field or requires assignment from browse
  BRW1.AddField(CURD:PRESENTE,BRW1.Q.CURD:PRESENTE)        ! Field CURD:PRESENTE is a hot field or requires assignment from browse
  BRW1.AddField(CURD:NOTA,BRW1.Q.CURD:NOTA)                ! Field CURD:NOTA is a hot field or requires assignment from browse
  BRW1.AddField(CURD:PAGADO,BRW1.Q.CURD:PAGADO)            ! Field CURD:PAGADO is a hot field or requires assignment from browse
  BRW1.AddField(CURD:IDINSCRIPCION,BRW1.Q.CURD:IDINSCRIPCION) ! Field CURD:IDINSCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(CURD:IDCURSO,BRW1.Q.CURD:IDCURSO)          ! Field CURD:IDCURSO is a hot field or requires assignment from browse
  BRW1.AddField(CURD:ID_MODULO,BRW1.Q.CURD:ID_MODULO)      ! Field CURD:ID_MODULO is a hot field or requires assignment from browse
  BRW1.AddField(CURI:IDINSCRIPCION,BRW1.Q.CURI:IDINSCRIPCION) ! Field CURI:IDINSCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(PRO2:IDPROVEEDOR,BRW1.Q.PRO2:IDPROVEEDOR)  ! Field PRO2:IDPROVEEDOR is a hot field or requires assignment from browse
  BRW1.AddField(CUR2:ID_MODULO,BRW1.Q.CUR2:ID_MODULO)      ! Field CUR2:ID_MODULO is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('CERTIFICADOXALUMNO',QuickWindow)           ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.QueryControl = ?Query
  BRW1.UpdateQuery(QBE5,1)
  SELF.SetAlerts()
  !--------------------------------------------------------------------------
  ! Tagging Init
  !--------------------------------------------------------------------------
  FREE(TAGS)
  ?DASSHOWTAG{PROP:Text} = 'Show All'
  ?DASSHOWTAG{PROP:Msg}  = 'Show All'
  ?DASSHOWTAG{PROP:Tip}  = 'Show All'
  !--------------------------------------------------------------------------
  ! Tagging Init
  !--------------------------------------------------------------------------
  ?Browse:1{Prop:Alrt,239} = SpaceKey
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
  !--------------------------------------------------------------------------
  ! Tagging Kill
  !--------------------------------------------------------------------------
  FREE(TAGS)
  !--------------------------------------------------------------------------
  ! Tagging Kill
  !--------------------------------------------------------------------------
    Relate:CURSO.Close
    Relate:CURSO_INSCRIPCION_DETALLE.Close
  END
  IF SELF.Opened
    INIMgr.Update('CERTIFICADOXALUMNO',QuickWindow)        ! Save window data to non-volatile store
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
    OF ?Button8
      FREE(CARNET)
      Loop i# = 1 to records(Tags)
          get(Tags,i#)
          CURD:IDINSCRIPCION = tags:Puntero
          CURD:IDCURSO       = tags:PUNTERO2
          CURD:ID_MODULO     = tags:PUNTERO3
          ACCESS:CURSO_INSCRIPCION_DETALLE.TRYFETCH(CURD:PK_CURSO_INSCRIPCION_DETALLE)
          MODULO# =  CURD:ID_MODULO
          CURSO# = CURD:IDCURSO
          !!! BUSCAR PROVEEDOR
          CURI:IDINSCRIPCION = CURD:IDINSCRIPCION
          ACCESS:CURSO_INSCRIPCION.TRYFETCH(CURI:PK_CURSO_INSCRIPCION)
          PRO2:IDPROVEEDOR = CURI:ID_PROVEEDOR
          ACCESS:PROVEEDORES.TRYFETCH(PRO2:PK_PROVEEDOR)
          NOMBRE     =    PRO2:DESCRIPCION
          N_DOCUMENTO = PRO2:CUIT
          !! BUSCAR MODULO DE CURSO
          CUR2:ID_MODULO = MODULO#
          ACCESS:CURSO_MODULOS.TRYFETCH(CUR2:PK_CURSO_MODULOS)
          MATRICULA  =    CUR2:NUMERO_MODULO
          DIRECCION  =    CUR2:DESCRIPCION
          FECHA_ALTA =    CUR2:FECHA_INICIO
          FOLIO      =    CUR2:FECHA_FIN
          CP         =    CUR2:CANTIDAD_HORAS
          CUR:IDCURSO =   CURSO#
          ACCESS:CURSO.TRYFETCH(CUR:PK_CURSO)
          LOCALI = CUR:DESCRIPCION
          ADD(CARNET)
      end
    OF ?Button9
      IF Loc:Nombre <> '' THEN
          BRW1.VIEW{PROP:SQLFILTER}= 'C.DESCRIPCION LIKE'''&CLIP(Loc:Nombre)&'%'' AND A.PAGADO = ''SI'''
          
      ELSE
          BRW1.VIEW{PROP:SQLFILTER}= ''
      END
      THISWINDOW.RESET(1)
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?DASTAG
      ThisWindow.Update()
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
        DO DASBRW::6:DASTAGONOFF
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
    OF ?DASTAGAll
      ThisWindow.Update()
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
        DO DASBRW::6:DASTAGALL
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
    OF ?DASUNTAGALL
      ThisWindow.Update()
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
        DO DASBRW::6:DASUNTAGALL
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
    OF ?DASREVTAG
      ThisWindow.Update()
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
        DO DASBRW::6:DASREVTAGALL
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
    OF ?DASSHOWTAG
      ThisWindow.Update()
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
        DO DASBRW::6:DASSHOWTAG
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
    OF ?Button8
      ThisWindow.Update()
      START(Imprimir_Certificado_Curso, 25000)
      ThisWindow.Reset
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeFieldEvent PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all field specific events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  CASE FIELD()
  OF ?Browse:1
    CASE EVENT()
    OF EVENT:PreAlertKey
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
      IF Keycode() = SpaceKey
         POST(EVENT:Accepted,?DASTAG)
         CYCLE
      END
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
    END
  END
  ReturnValue = PARENT.TakeFieldEvent()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeNewSelection PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all NewSelection events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  ReturnValue = PARENT.TakeNewSelection()
    CASE FIELD()
    OF ?Browse:1
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
      IF KEYCODE() = MouseLeft AND (?Browse:1{PROPLIST:MouseDownRow} > 0) AND (DASBRW::6:TAGFLAG = 0)
        CASE ?Browse:1{PROPLIST:MouseDownField}
      
          OF 1
            DASBRW::6:TAGMOUSE = 1
            POST(EVENT:Accepted,?DASTAG)
               ?Browse:1{PROPLIST:MouseDownField} = 2
            CYCLE
         END
      END
      DASBRW::6:TAGFLAG = 0
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


BRW1.SetQueueRecord PROCEDURE

  CODE
  !--------------------------------------------------------------------------
  ! DAS_Tagging
  !--------------------------------------------------------------------------
     TAGS.PUNTERO = CURD:IDINSCRIPCION
     TAGS.PUNTERO2 = CURD:IDCURSO
     TAGS.PUNTERO3 = CURD:ID_MODULO
     GET(TAGS,TAGS.PUNTERO,TAGS.PUNTERO2,TAGS.PUNTERO3)
    IF ERRORCODE()
      T = ''
    ELSE
      T = '*'
    END
  !--------------------------------------------------------------------------
  ! DAS_Tagging
  !--------------------------------------------------------------------------
  PARENT.SetQueueRecord()      !FIX FOR CFW 4 (DASTAG)
  PARENT.SetQueueRecord


BRW1.TakeKey PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  !--------------------------------------------------------------------------
  ! DAS_Tagging
  !--------------------------------------------------------------------------
  IF Keycode() = SpaceKey
    RETURN ReturnValue
  END
  !--------------------------------------------------------------------------
  ! DAS_Tagging
  !--------------------------------------------------------------------------
  ReturnValue = PARENT.TakeKey()
  RETURN ReturnValue


BRW1.ValidateRecord PROCEDURE

ReturnValue          BYTE,AUTO

BRW1::RecordStatus   BYTE,AUTO
  CODE
  ReturnValue = PARENT.ValidateRecord()
  BRW1::RecordStatus=ReturnValue
  IF BRW1::RecordStatus NOT=Record:OK THEN RETURN BRW1::RecordStatus.
  !--------------------------------------------------------------------------
  ! DAS_Tagging
  !--------------------------------------------------------------------------
     TAGS.PUNTERO = CURD:IDINSCRIPCION
     TAGS.PUNTERO2 = CURD:IDCURSO
     TAGS.PUNTERO3 = CURD:ID_MODULO
     GET(TAGS,TAGS.PUNTERO,TAGS.PUNTERO2,TAGS.PUNTERO3)
    EXECUTE DASBRW::6:TAGDISPSTATUS
       IF ERRORCODE() THEN BRW1::RecordStatus = RECORD:FILTERED END
       IF ~ERRORCODE() THEN BRW1::RecordStatus = RECORD:FILTERED END
    END
  !--------------------------------------------------------------------------
  ! DAS_Tagging
  !--------------------------------------------------------------------------
  ReturnValue=BRW1::RecordStatus
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

