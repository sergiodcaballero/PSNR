

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
                       INCLUDE('GESTION037.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION022.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION035.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Report
!!! --FINANZAS --
!!! </summary>
IMPRIMIR_COMPROBANTE_EGRESO PROCEDURE 

Progress:Thermometer BYTE                                  ! 
L:NroReg             LONG                                  ! 
Process:View         VIEW(GASTOS)
                       PROJECT(GAS:FECHA)
                       PROJECT(GAS:IDGASTOS)
                       PROJECT(GAS:MONTO)
                       PROJECT(GAS:OBSERVACION)
                       PROJECT(GAS:IDUSUARIO)
                       PROJECT(GAS:IDSUBCUENTA)
                       JOIN(USU:PK_USUARIO,GAS:IDUSUARIO)
                         PROJECT(USU:DESCRIPCION)
                       END
                       JOIN(SUB:INTEG_113,GAS:IDSUBCUENTA)
                         PROJECT(SUB:DESCRIPCION)
                       END
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

Report               REPORT,AT(1000,2438,6250,7250),PRE(RPT),PAPER(PAPER:A4),FONT('Arial',10,,FONT:regular,CHARSET:ANSI), |
  THOUS
                       HEADER,AT(1000,1000,6250,1417),USE(?Header)
                         IMAGE('Logo.JPG'),AT(10,10,1458,1052),USE(?Image1)
                         STRING(@n-14),AT(5010,42),USE(GAS:IDGASTOS)
                         STRING('NRO. COMPROBANTE:'),AT(3500,63),USE(?String2),TRN
                         STRING(@d17),AT(5010,260),USE(GAS:FECHA)
                         STRING('FECHA:'),AT(4469,271),USE(?String3),TRN
                         STRING('COMPROBANTE DE GASTOS'),AT(2208,896),USE(?String1),FONT(,,,FONT:bold+FONT:underline), |
  TRN
                         LINE,AT(31,1135,6219,0),USE(?Line1),COLOR(COLOR:Black)
                         STRING('TIPO DE GASTOS'),AT(781,1177),USE(?String9),TRN
                         STRING('OBSERVACION'),AT(3729,1177),USE(?String10),TRN
                         STRING('MONTO'),AT(5688,1177),USE(?String11),TRN
                         LINE,AT(21,1396,6219,0),USE(?Line2),COLOR(COLOR:Black)
                       END
Detail                 DETAIL,AT(0,0,,271),USE(?Detail)
                         STRING(@s50),AT(2719,0),USE(GAS:OBSERVACION)
                         STRING(@s50),AT(31,0,2563,208),USE(SUB:DESCRIPCION)
                         STRING(@n$-13.2),AT(5281,0),USE(GAS:MONTO)
                         LINE,AT(10,219,6229,0),USE(?Line3),COLOR(COLOR:Black)
                       END
                       FOOTER,AT(1000,9688,6250,1469),USE(?Footer)
                         LINE,AT(4573,562,1583,0),USE(?Line4),COLOR(COLOR:Black)
                         STRING('FIRMA AUTORIZACION'),AT(4635,635),USE(?String12),TRN
                         STRING('USUARIO:'),AT(52,927),USE(?String16),FONT(,8),TRN
                         STRING(@s20),AT(594,927),USE(USU:DESCRIPCION),FONT(,8)
                         LINE,AT(62,1146,7271,0),USE(?Line3:2),COLOR(COLOR:Black)
                         STRING('Fecha del Reporte:'),AT(73,1229),USE(?EcFechaReport),FONT('Courier New',7),TRN
                         STRING('DatoEmpresa'),AT(2177,1229),USE(?DatoEmpresa),FONT('Courier New',7),TRN
                         STRING('Evolution_Paginas_'),AT(5677,1229),USE(?PaginaNdeX),FONT('Courier New',7),TRN
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
  GlobalErrors.SetProcedureName('IMPRIMIR_COMPROBANTE_EGRESO')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('GLO:PAGO',GLO:PAGO)                                ! Added by: Report
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:GASTOS.Open                                       ! File GASTOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('IMPRIMIR_COMPROBANTE_EGRESO',ProgressWindow) ! Restore window settings from non-volatile store
  TargetSelector.AddItem(XMLReporter.IReportGenerator)
  TargetSelector.AddItem(HTMLReporter.IReportGenerator)
  TargetSelector.AddItem(TXTReporter.IReportGenerator)
  TargetSelector.AddItem(PDFReporter.IReportGenerator)
  SELF.AddItem(TargetSelector)
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisReport.Init(Process:View, Relate:GASTOS, ?Progress:PctText, Progress:Thermometer, ProgressMgr, GAS:IDGASTOS)
  ThisReport.AddSortOrder(GAS:PK_GASTOS)
  ThisReport.SetFilter('GLO:PAGO = GAS:IDGASTOS')
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:GASTOS.SetQuickScan(1,Propagate:OneMany)
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
    Relate:GASTOS.Close
  END
  IF SELF.Opened
    INIMgr.Update('IMPRIMIR_COMPROBANTE_EGRESO',ProgressWindow) ! Save window data to non-volatile store
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
  SELF.Attribute.Set(?GAS:IDGASTOS,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GAS:IDGASTOS,RepGen:XML,TargetAttr:TagName,'GAS:IDGASTOS')
  SELF.Attribute.Set(?GAS:IDGASTOS,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String2,RepGen:XML,TargetAttr:TagName,'String2')
  SELF.Attribute.Set(?String2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?GAS:FECHA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GAS:FECHA,RepGen:XML,TargetAttr:TagName,'GAS:FECHA')
  SELF.Attribute.Set(?GAS:FECHA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String3,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String3,RepGen:XML,TargetAttr:TagName,'String3')
  SELF.Attribute.Set(?String3,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String1,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String1,RepGen:XML,TargetAttr:TagName,'String1')
  SELF.Attribute.Set(?String1,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String9,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String9,RepGen:XML,TargetAttr:TagName,'String9')
  SELF.Attribute.Set(?String9,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String10,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String10,RepGen:XML,TargetAttr:TagName,'String10')
  SELF.Attribute.Set(?String10,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String11,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String11,RepGen:XML,TargetAttr:TagName,'String11')
  SELF.Attribute.Set(?String11,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?GAS:OBSERVACION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GAS:OBSERVACION,RepGen:XML,TargetAttr:TagName,'GAS:OBSERVACION')
  SELF.Attribute.Set(?GAS:OBSERVACION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SUB:DESCRIPCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SUB:DESCRIPCION,RepGen:XML,TargetAttr:TagName,'SUB:DESCRIPCION')
  SELF.Attribute.Set(?SUB:DESCRIPCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?GAS:MONTO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GAS:MONTO,RepGen:XML,TargetAttr:TagName,'GAS:MONTO')
  SELF.Attribute.Set(?GAS:MONTO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String12,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String12,RepGen:XML,TargetAttr:TagName,'String12')
  SELF.Attribute.Set(?String12,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String16,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String16,RepGen:XML,TargetAttr:TagName,'String16')
  SELF.Attribute.Set(?String16,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?USU:DESCRIPCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?USU:DESCRIPCION,RepGen:XML,TargetAttr:TagName,'USU:DESCRIPCION')
  SELF.Attribute.Set(?USU:DESCRIPCION,RepGen:XML,TargetAttr:TagValueFromText,True)
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
  PRINT(RPT:Detail)
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
  SELF.SetDocumentInfo('CW Report','Gestion','IMPRIMIR_COMPROBANTE_INGRESO','IMPRIMIR_COMPROBANTE_INGRESO','','')
  SELF.SetPagesAsParentBookmark(False)
  SELF.SetScanCopyMode(False)
  SELF.CompressText   = True
  SELF.CompressImages = True

!!! <summary>
!!! Generated from procedure template - Window
!!! Actualizacion INGRESOS
!!! </summary>
UpdateEGRESOS PROCEDURE 

CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
LOC:CUENTA           LONG,NAME('IDCUENTA | READONLY')      ! 
FDCB8::View:FileDropCombo VIEW(CUENTAS)
                       PROJECT(CUE:IDCUENTA)
                       PROJECT(CUE:DESCRIPCION)
                       PROJECT(CUE:TIPO)
                     END
Queue:FileDropCombo  QUEUE                            !Queue declaration for browse/combo box using ?CUE:IDCUENTA
CUE:IDCUENTA           LIKE(CUE:IDCUENTA)             !List box control field - type derived from field
CUE:DESCRIPCION        LIKE(CUE:DESCRIPCION)          !List box control field - type derived from field
CUE:TIPO               LIKE(CUE:TIPO)                 !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
History::GAS:Record  LIKE(GAS:RECORD),THREAD
QuickWindow          WINDOW('HABILITAR INGRESO'),AT(,,353,179),FONT('MS Sans Serif',8,,FONT:regular),RESIZE,CENTER, |
  GRAY,IMM,MDI,HLP('UpdateINGRESOS'),SYSTEM
                       COMBO(@s20),AT(68,6,217,10),USE(CUE:IDCUENTA),DROP(5),FORMAT('23L(2)|M~IDC~@n-5@200L(2)' & |
  '|M~DESCRIPCION~@s50@200L(2)|M~TIPO~@s8@'),FROM(Queue:FileDropCombo),IMM
                       BUTTON('HABILITAR EGRESO'),AT(104,23,101,20),USE(?Button3),LEFT,ICON(ICON:Tick),FLAT
                       BUTTON('...'),AT(129,53,12,12),USE(?CallLookup),DISABLE
                       STRING(@s50),AT(146,54,179,10),USE(SUB:DESCRIPCION)
                       ENTRY(@n$-13.2),AT(64,69,60,10),USE(GAS:MONTO),DISABLE,REQ
                       ENTRY(@n-14),AT(64,83,60,10),USE(GAS:IDPROVEEDOR)
                       BUTTON('...'),AT(129,81,12,12),USE(?CallLookup:2)
                       ENTRY(@P####-P),AT(64,97,22,10),USE(GAS:SUCURSAL)
                       ENTRY(@n-14),AT(90,97,60,10),USE(GAS:IDRECIBO),RIGHT(1)
                       ENTRY(@n-14),AT(236,97,32,10),USE(GAS:IDTIPO_COMPROBANTE),RIGHT(1)
                       ENTRY(@d17),AT(64,110,60,10),USE(GAS:FECHA),REQ
                       COMBO(@s2),AT(236,110,29,10),USE(GAS:LETRA),DROP(10),FROM('X|A|B|C|T'),REQ
                       ENTRY(@s50),AT(64,125,257,10),USE(GAS:OBSERVACION),DISABLE
                       BUTTON('&Aceptar'),AT(247,145,49,14),USE(?OK),LEFT,ICON('ok.ico'),CURSOR('mano.cur'),DEFAULT, |
  DISABLE,FLAT,MSG('Confirma y Actualiza el Formulario'),TIP('Confirma y Actualiza el Formulario')
                       BUTTON('&Cancelar'),AT(299,145,49,14),USE(?Cancel),LEFT,ICON('cancelar.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Cancela Operacion'),TIP('Cancela Operacion')
                       PROMPT('ELEGIR CUENTA:'),AT(3,6),USE(?Prompt4)
                       LINE,AT(1,48,350,0),USE(?Line1),COLOR(COLOR:Black)
                       PROMPT('OBSERVACION:'),AT(6,125),USE(?ING:OBSERVACION:Prompt),TRN
                       PROMPT('ID RECIBO:'),AT(6,97),USE(?GAS:SUCURSAL:Prompt)
                       PROMPT('TIPO COMPROBANTE:'),AT(157,97),USE(?GAS:IDTIPO_COMPROBANTE:Prompt)
                       BUTTON('...'),AT(271,96,12,12),USE(?CallLookup:3)
                       STRING(@s15),AT(287,97),USE(TIPCOM:DESCRIPCION)
                       PROMPT('LETRA:'),AT(209,110),USE(?GAS:LETRA:Prompt)
                       PROMPT('FECHA COMP:'),AT(6,110),USE(?GAS:FECHA:Prompt)
                       LINE,AT(3,141,349,0),USE(?Line2),COLOR(COLOR:Black)
                       PROMPT('MONTO:'),AT(6,68),USE(?ING:MONTO:Prompt),TRN
                       PROMPT('IDPROVEEDOR:'),AT(6,83),USE(?GAS:IDPROVEEDOR:Prompt)
                       STRING(@s50),AT(145,82,180,10),USE(PRO2:DESCRIPCION)
                       PROMPT('IDSUBCUENTA:'),AT(6,55),USE(?IDSUBCUENTA:Prompt)
                       ENTRY(@n-14),AT(64,55,60,10),USE(GAS:IDSUBCUENTA),DISABLE
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

FDCB8                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo           !Reference to browse queue type
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
  GlobalErrors.SetProcedureName('UpdateEGRESOS')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?CUE:IDCUENTA
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(GAS:Record,History::GAS:Record)
  SELF.AddHistoryField(?GAS:MONTO,5)
  SELF.AddHistoryField(?GAS:IDPROVEEDOR,11)
  SELF.AddHistoryField(?GAS:SUCURSAL,12)
  SELF.AddHistoryField(?GAS:IDRECIBO,13)
  SELF.AddHistoryField(?GAS:IDTIPO_COMPROBANTE,14)
  SELF.AddHistoryField(?GAS:FECHA,6)
  SELF.AddHistoryField(?GAS:LETRA,15)
  SELF.AddHistoryField(?GAS:OBSERVACION,4)
  SELF.AddHistoryField(?GAS:IDSUBCUENTA,3)
  SELF.AddUpdateFile(Access:GASTOS)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:CAJA.Open                                         ! File CAJA used by this procedure, so make sure it's RelationManager is open
  Relate:CUENTAS.Open                                      ! File CUENTAS used by this procedure, so make sure it's RelationManager is open
  Relate:FONDOS.Open                                       ! File FONDOS used by this procedure, so make sure it's RelationManager is open
  Relate:GASTOS.Open                                       ! File GASTOS used by this procedure, so make sure it's RelationManager is open
  Relate:LIBDIARIO.Open                                    ! File LIBDIARIO used by this procedure, so make sure it's RelationManager is open
  Relate:PROVEEDORES.Open                                  ! File PROVEEDORES used by this procedure, so make sure it's RelationManager is open
  Relate:RANKING.Open                                      ! File RANKING used by this procedure, so make sure it's RelationManager is open
  Relate:SUBCUENTAS.Open                                   ! File SUBCUENTAS used by this procedure, so make sure it's RelationManager is open
  Relate:TIPO_COMPROBANTE.Open                             ! File TIPO_COMPROBANTE used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:GASTOS
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
    DISABLE(?CUE:IDCUENTA)
    DISABLE(?Button3)
    DISABLE(?CallLookup)
    ?GAS:MONTO{PROP:ReadOnly} = True
    ?GAS:IDPROVEEDOR{PROP:ReadOnly} = True
    DISABLE(?CallLookup:2)
    ?GAS:SUCURSAL{PROP:ReadOnly} = True
    ?GAS:IDRECIBO{PROP:ReadOnly} = True
    ?GAS:IDTIPO_COMPROBANTE{PROP:ReadOnly} = True
    ?GAS:FECHA{PROP:ReadOnly} = True
    DISABLE(?GAS:LETRA)
    ?GAS:OBSERVACION{PROP:ReadOnly} = True
    DISABLE(?CallLookup:3)
    ?GAS:IDSUBCUENTA{PROP:ReadOnly} = True
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdateEGRESOS',QuickWindow)                ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  SELF.AddItem(ToolbarForm)
  FDCB8.Init(CUE:IDCUENTA,?CUE:IDCUENTA,Queue:FileDropCombo.ViewPosition,FDCB8::View:FileDropCombo,Queue:FileDropCombo,Relate:CUENTAS,ThisWindow,GlobalErrors,0,1,0)
  FDCB8.Q &= Queue:FileDropCombo
  FDCB8.AddSortOrder(CUE:PK_CUENTAS)
  FDCB8.SetFilter('CUE:TIPO = ''EGRESO''')
  FDCB8.AddField(CUE:IDCUENTA,FDCB8.Q.CUE:IDCUENTA) !List box control field - type derived from field
  FDCB8.AddField(CUE:DESCRIPCION,FDCB8.Q.CUE:DESCRIPCION) !List box control field - type derived from field
  FDCB8.AddField(CUE:TIPO,FDCB8.Q.CUE:TIPO) !List box control field - type derived from field
  ThisWindow.AddItem(FDCB8.WindowComponent)
  FDCB8.DefaultFill = 0
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:CAJA.Close
    Relate:CUENTAS.Close
    Relate:FONDOS.Close
    Relate:GASTOS.Close
    Relate:LIBDIARIO.Close
    Relate:PROVEEDORES.Close
    Relate:RANKING.Close
    Relate:SUBCUENTAS.Close
    Relate:TIPO_COMPROBANTE.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateEGRESOS',QuickWindow)             ! Save window data to non-volatile store
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
      SelectPROVEEDORES
      SelectTIPO_COMPROBANTE
      SelectSUBCUENTAS_INGRESOS
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
    OF ?Button3
      IF CUE:TIPO = 'EGRESO' THEN
          GLO:CUENTA = CUE:IDCUENTA
          ENABLE(?GAS:IDSUBCUENTA)
          ENABLE(?GAS:MONTO)
          ENABLE(?GAS:OBSERVACION)
          ENABLE (?CallLookup)
          ENABLE(?OK)
          DISABLE(?Button3)
          DISABLE(?CUE:IDCUENTA)
      END
    OF ?OK
      If  Self.Request=insertRecord THEN
          GAS:IDUSUARIO =  GLO:IDUSUARIO
          !GAS:FECHA       =  TODAY()
          GAS:HORA        =  CLOCK()
          GAS:MES       =  MONTH(TODAY())
          GAS:ANO       =  YEAR(TODAY())
          GAS:PERIODO  =  ING:ANO&(FORMAT(ING:MES,@N02))
          !!! CARGA
          RANKING{PROP:SQL} = 'CALL SP_GEN_GASTOS_ID'
          NEXT(RANKING)
          GAS:IDGASTOS = RAN:C1
          GLO:PAGO = GAS:IDGASTOS
      END
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?CallLookup
      ThisWindow.Update()
      SUB:IDSUBCUENTA = GAS:IDSUBCUENTA
      IF SELF.Run(3,SelectRecord) = RequestCompleted
        GAS:IDSUBCUENTA = SUB:IDSUBCUENTA
      END
      ThisWindow.Reset(1)
    OF ?GAS:IDPROVEEDOR
      IF GAS:IDPROVEEDOR OR ?GAS:IDPROVEEDOR{PROP:Req}
        PRO2:IDPROVEEDOR = GAS:IDPROVEEDOR
        IF Access:PROVEEDORES.TryFetch(PRO2:PK_PROVEEDOR)
          IF SELF.Run(1,SelectRecord) = RequestCompleted
            GAS:IDPROVEEDOR = PRO2:IDPROVEEDOR
          ELSE
            SELECT(?GAS:IDPROVEEDOR)
            CYCLE
          END
        END
      END
      ThisWindow.Reset()
    OF ?CallLookup:2
      ThisWindow.Update()
      PRO2:IDPROVEEDOR = GAS:IDPROVEEDOR
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        GAS:IDPROVEEDOR = PRO2:IDPROVEEDOR
      END
      ThisWindow.Reset(1)
    OF ?GAS:IDTIPO_COMPROBANTE
      TIPCOM:IDTIPO_COMPROBANTE = GAS:IDTIPO_COMPROBANTE
      IF Access:TIPO_COMPROBANTE.TryFetch(TIPCOM:PK_TIPO_COMPROBANTE)
        IF SELF.Run(2,SelectRecord) = RequestCompleted
          GAS:IDTIPO_COMPROBANTE = TIPCOM:IDTIPO_COMPROBANTE
        ELSE
          SELECT(?GAS:IDTIPO_COMPROBANTE)
          CYCLE
        END
      END
      ThisWindow.Reset()
      IF Access:GASTOS.TryValidateField(14)                ! Attempt to validate GAS:IDTIPO_COMPROBANTE in GASTOS
        SELECT(?GAS:IDTIPO_COMPROBANTE)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?GAS:IDTIPO_COMPROBANTE
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?GAS:IDTIPO_COMPROBANTE{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?OK
      ThisWindow.Update()
      IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing THEN
         POST(EVENT:CloseWindow)
      END
    OF ?CallLookup:3
      ThisWindow.Update()
      TIPCOM:IDTIPO_COMPROBANTE = GAS:IDTIPO_COMPROBANTE
      IF SELF.Run(2,SelectRecord) = RequestCompleted
        GAS:IDTIPO_COMPROBANTE = TIPCOM:IDTIPO_COMPROBANTE
      END
      ThisWindow.Reset(1)
    OF ?GAS:IDSUBCUENTA
      SUB:IDSUBCUENTA = GAS:IDSUBCUENTA
      IF Access:SUBCUENTAS.TryFetch(SUB:INTEG_113)
        IF SELF.Run(3,SelectRecord) = RequestCompleted
          GAS:IDSUBCUENTA = SUB:IDSUBCUENTA
        ELSE
          SELECT(?GAS:IDSUBCUENTA)
          CYCLE
        END
      END
      ThisWindow.Reset()
      IF Access:GASTOS.TryValidateField(3)                 ! Attempt to validate GAS:IDSUBCUENTA in GASTOS
        SELECT(?GAS:IDSUBCUENTA)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?GAS:IDSUBCUENTA
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?GAS:IDSUBCUENTA{PROP:FontColor} = FieldColorQueue.OldColor
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
  If  Self.Request=insertRecord AND SELF.RESPONSE = RequestCompleted Then
   !!! CARGO EN LA CAJA
      
      SUB:IDSUBCUENTA = GAS:IDSUBCUENTA
      ACCESS:SUBCUENTAS.TRYFETCH(SUB:INTEG_113)
      !!! MODIFICA EL FLUJO DE FONDOS
      FON:IDFONDO = SUB:IDFONDO 
      ACCESS:FONDOS.TRYFETCH(FON:PK_FONDOS)
      FON:MONTO = FON:MONTO - GAS:MONTO
      FON:FECHA = TODAY()
      FON:HORA = CLOCK()
      ACCESS:FONDOS.UPDATE()
      !!!!
      IF SUB:CAJA = 'SI' THEN
          !!! CARGO CAJA
          CAJ:IDSUBCUENTA = GAS:IDSUBCUENTA
          CAJ:IDUSUARIO = GLO:IDUSUARIO
          CAJ:HABER =  GAS:MONTO
          CAJ:DEBE = 0
          CAJ:OBSERVACION = GAS:OBSERVACION
          CAJ:FECHA = TODAY()
          CAJ:MES       =  MONTH(TODAY())
          CAJ:ANO       =  YEAR(TODAY())
          CAJ:PERIODO   =  CAJ:ANO&(FORMAT(CAJ:MES,@N02))
          CAJ:SUCURSAL  =   GAS:SUCURSAL
          CAJ:RECIBO    =   GAS:IDRECIBO
          CAJ:TIPO      =   'EGRESO'
          CAJ:IDTRANSACCION  = GLO:PAGO
          ! BUSCO EN FONDOS
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
      IF CUE:TIPO = 'EGRESO' THEN
          LIB:IDSUBCUENTA = GAS:IDSUBCUENTA
          LIB:HABER = GAS:MONTO
          LIB:DEBE = 0
          LIB:OBSERVACION = GAS:OBSERVACION
          LIB:FECHA = TODAY()
          LIB:HORA = CLOCK()
          LIB:MES       =  MONTH(TODAY())
          LIB:ANO       =  YEAR(TODAY())
          LIB:PERIODO   =  LIB:ANO&(FORMAT(LIB:MES,@N02))
          FON:IDFONDO = SUB:IDFONDO
          ACCESS:FONDOS.TRYFETCH(FON:PK_FONDOS)
          LIB:FONDO  =  FON:MONTO
          LIB:SUCURSAL       =  GAS:SUCURSAL
          LIB:RECIBO         =  GAS:IDRECIBO
          LIB:IDPROVEEDOR    =  GAS:IDPROVEEDOR
          LIB:TIPO =  'EGRESO'
          LIB:IDTRANSACCION  = GLO:PAGO
          !!! DISPARA STORE PROCEDURE
          RANKING{PROP:SQL} = 'CALL SP_GEN_LIBDIARIO_ID'
          NEXT(RANKING)
          LIB:IDLIBDIARIO = RAN:C1
          !!!!!!!!!!!
          ACCESS:LIBDIARIO.INSERT()
          RAN:C1 = 0
      END
  
      IMPRIMIR_COMPROBANTE_EGRESO
  END
  GLO:PAGO = 0
  
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
!!! Select a TIPO_COMPROBANTE Record
!!! </summary>
SelectTIPO_COMPROBANTE PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(TIPO_COMPROBANTE)
                       PROJECT(TIPCOM:IDTIPO_COMPROBANTE)
                       PROJECT(TIPCOM:DESCRIPCION)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
TIPCOM:IDTIPO_COMPROBANTE LIKE(TIPCOM:IDTIPO_COMPROBANTE) !List box control field - type derived from field
TIPCOM:DESCRIPCION     LIKE(TIPCOM:DESCRIPCION)       !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Select a TIPO COMPROBANTE'),AT(,,164,198),FONT('Arial',8,COLOR:Black,FONT:bold),RESIZE, |
  CENTER,GRAY,IMM,MDI,HLP('SelectTIPO_COMPROBANTE'),SYSTEM
                       LIST,AT(8,30,148,124),USE(?Browse:1),HVSCROLL,FORMAT('22L(2)|M~ID~C(0)@n-3@80L(2)|M~DES' & |
  'CRIPCION~@s20@'),FROM(Queue:Browse:1),IMM,MSG('Administrador de TIPO_COMPROBANTE')
                       BUTTON('&Elegir'),AT(107,158,49,14),USE(?Select:2),LEFT,ICON('e.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Seleccionar'),TIP('Seleccionar')
                       SHEET,AT(4,4,156,172),USE(?CurrentTab)
                         TAB('TIPO COMPROBANTE'),USE(?Tab:1)
                         END
                       END
                       BUTTON('&Salir'),AT(111,180,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Salir'),TIP('Salir')
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::Sort1:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 2
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
  GlobalErrors.SetProcedureName('SelectTIPO_COMPROBANTE')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('TIPCOM:IDTIPO_COMPROBANTE',TIPCOM:IDTIPO_COMPROBANTE) ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:TIPO_COMPROBANTE.Open                             ! File TIPO_COMPROBANTE used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:TIPO_COMPROBANTE,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,TIPCOM:PK_TIPO_COMPROBANTE)           ! Add the sort order for TIPCOM:PK_TIPO_COMPROBANTE for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,TIPCOM:IDTIPO_COMPROBANTE,,BRW1) ! Initialize the browse locator using  using key: TIPCOM:PK_TIPO_COMPROBANTE , TIPCOM:IDTIPO_COMPROBANTE
  BRW1.AddSortOrder(,TIPCOM:IDX_TIPO_COMPROBANTE_DEC)      ! Add the sort order for TIPCOM:IDX_TIPO_COMPROBANTE_DEC for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(,TIPCOM:DESCRIPCION,,BRW1)      ! Initialize the browse locator using  using key: TIPCOM:IDX_TIPO_COMPROBANTE_DEC , TIPCOM:DESCRIPCION
  BRW1.AddField(TIPCOM:IDTIPO_COMPROBANTE,BRW1.Q.TIPCOM:IDTIPO_COMPROBANTE) ! Field TIPCOM:IDTIPO_COMPROBANTE is a hot field or requires assignment from browse
  BRW1.AddField(TIPCOM:DESCRIPCION,BRW1.Q.TIPCOM:DESCRIPCION) ! Field TIPCOM:DESCRIPCION is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('SelectTIPO_COMPROBANTE',QuickWindow)       ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:TIPO_COMPROBANTE.Close
  END
  IF SELF.Opened
    INIMgr.Update('SelectTIPO_COMPROBANTE',QuickWindow)    ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.SetAlerts PROCEDURE

  CODE
  
  !!! Evolution Consulting FREE Templates Start!!!
     ALERT(EnterKey)
  
  !!! Evolution Consulting FREE Templates End!!!
  PARENT.SetAlerts


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
  SELF.SelectControl = ?Select:2
  SELF.HideSelect = 1                                      ! Hide the select button when disabled
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)


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


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window


!!! <summary>
!!! Generated from procedure template - Window
!!! Administrador de INGRESOS
!!! </summary>
ABM_EGRESOS PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(GASTOS)
                       PROJECT(GAS:IDGASTOS)
                       PROJECT(GAS:LETRA)
                       PROJECT(GAS:SUCURSAL)
                       PROJECT(GAS:IDRECIBO)
                       PROJECT(GAS:MONTO)
                       PROJECT(GAS:IDSUBCUENTA)
                       PROJECT(GAS:OBSERVACION)
                       PROJECT(GAS:FECHA)
                       PROJECT(GAS:HORA)
                       PROJECT(GAS:IDPROVEEDOR)
                       PROJECT(GAS:IDTIPO_COMPROBANTE)
                       JOIN(PRO2:PK_PROVEEDOR,GAS:IDPROVEEDOR)
                         PROJECT(PRO2:DESCRIPCION)
                         PROJECT(PRO2:IDPROVEEDOR)
                       END
                       JOIN(TIPCOM:PK_TIPO_COMPROBANTE,GAS:IDTIPO_COMPROBANTE)
                         PROJECT(TIPCOM:DESCRIPCION)
                         PROJECT(TIPCOM:IDTIPO_COMPROBANTE)
                       END
                       JOIN(SUB:INTEG_113,GAS:IDSUBCUENTA)
                         PROJECT(SUB:DESCRIPCION)
                         PROJECT(SUB:IDSUBCUENTA)
                         PROJECT(SUB:IDCUENTA)
                         JOIN(CUE:PK_CUENTAS,SUB:IDCUENTA)
                           PROJECT(CUE:DESCRIPCION)
                           PROJECT(CUE:TIPO)
                           PROJECT(CUE:IDCUENTA)
                         END
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
GAS:IDGASTOS           LIKE(GAS:IDGASTOS)             !List box control field - type derived from field
TIPCOM:DESCRIPCION     LIKE(TIPCOM:DESCRIPCION)       !List box control field - type derived from field
GAS:LETRA              LIKE(GAS:LETRA)                !List box control field - type derived from field
GAS:SUCURSAL           LIKE(GAS:SUCURSAL)             !List box control field - type derived from field
GAS:IDRECIBO           LIKE(GAS:IDRECIBO)             !List box control field - type derived from field
GAS:MONTO              LIKE(GAS:MONTO)                !List box control field - type derived from field
GAS:IDSUBCUENTA        LIKE(GAS:IDSUBCUENTA)          !List box control field - type derived from field
SUB:DESCRIPCION        LIKE(SUB:DESCRIPCION)          !List box control field - type derived from field
CUE:DESCRIPCION        LIKE(CUE:DESCRIPCION)          !List box control field - type derived from field
CUE:TIPO               LIKE(CUE:TIPO)                 !List box control field - type derived from field
GAS:OBSERVACION        LIKE(GAS:OBSERVACION)          !List box control field - type derived from field
GAS:FECHA              LIKE(GAS:FECHA)                !List box control field - type derived from field
GAS:HORA               LIKE(GAS:HORA)                 !List box control field - type derived from field
GAS:IDPROVEEDOR        LIKE(GAS:IDPROVEEDOR)          !List box control field - type derived from field
PRO2:DESCRIPCION       LIKE(PRO2:DESCRIPCION)         !List box control field - type derived from field
PRO2:IDPROVEEDOR       LIKE(PRO2:IDPROVEEDOR)         !Related join file key field - type derived from field
TIPCOM:IDTIPO_COMPROBANTE LIKE(TIPCOM:IDTIPO_COMPROBANTE) !Related join file key field - type derived from field
SUB:IDSUBCUENTA        LIKE(SUB:IDSUBCUENTA)          !Related join file key field - type derived from field
CUE:IDCUENTA           LIKE(CUE:IDCUENTA)             !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Administrador de Egresos'),AT(,,529,273),FONT('MS Sans Serif',8,,FONT:regular),RESIZE, |
  CENTER,GRAY,IMM,MDI,HLP('ABM_INGRESOS'),SYSTEM
                       LIST,AT(8,36,506,180),USE(?Browse:1),HVSCROLL,FORMAT('43L(2)|M~IDGASTOS~C(0)@n-7@80L(2)' & |
  '|M~COMPROBANTE~@s20@30L(2)|M~LETRA~@s2@26L(2)|M~SUC~@P####-P@56L(2)|M~RECIBO~@n-14@4' & |
  '0L|M~MONTO~C@n$-13.2@56L(2)|M~IDSC~C(0)@n-7@127L(2)|M~SUBCUENTA~C(0)@s30@130L(2)|M~C' & |
  'UENTA~C(0)@s30@44L(2)|M~TIPO~C(0)@s10@200L(2)|M~OBSERVACION~@s50@40L(2)|M~FECHA~C(0)' & |
  '@d17@20L(2)|M~HORA~C(0)@t7@[56L(2)|M~IDP~C(0)@n-5@200L(2)|M~DESC PROV~C(0)@s50@]|M~PROVEEDOR~'), |
  FROM(Queue:Browse:1),IMM,MSG('Administrador de INGRESOS'),VCR
                       BUTTON('&Ver'),AT(416,223,49,14),USE(?View:2),LEFT,ICON('v.ico'),CURSOR('mano.cur'),FLAT,MSG('Visualizar'), |
  TIP('Visualizar')
                       BUTTON('&Agregar'),AT(468,223,49,14),USE(?Insert:3),LEFT,ICON('a.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Agrega Registro'),TIP('Agrega Registro')
                       BUTTON('&Filtro'),AT(2,247,68,18),USE(?Query),LEFT,ICON('qbe.ico'),FLAT
                       BUTTON('E&xportar'),AT(77,247,68,18),USE(?EvoExportar),LEFT,ICON('export.ico'),FLAT
                       BUTTON('Anular OPA'),AT(332,222,58,18),USE(?Button6),LEFT,ICON(ICON:Cross),FLAT
                       SHEET,AT(0,0,521,243),USE(?CurrentTab)
                         TAB('Egresos'),USE(?Tab:1)
                         END
                         TAB('Egresos Sub Cuenta'),USE(?Tab:2)
                         END
                         TAB('Fecha Egreso'),USE(?Tab:3)
                           PROMPT('FECHA:'),AT(9,20),USE(?GAS:FECHA:Prompt)
                           ENTRY(@d17),AT(43,20,60,10),USE(GAS:FECHA)
                         END
                       END
                       BUTTON('&Salir'),AT(479,257,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Salir'),TIP('Salir')
                     END

Loc::QHlist8 QUEUE,PRE(QHL8)
Id                         SHORT
Nombre                     STRING(100)
Longitud                   SHORT
Pict                       STRING(50)
Tot                 BYTE
                         END
QPar8 QUEUE,PRE(Q8)
FieldPar                 CSTRING(800)
                         END
QPar28 QUEUE,PRE(Qp28)
F2N                 CSTRING(300)
F2P                 CSTRING(100)
F2T                 BYTE
                         END
Loc::TituloListado8          STRING(100)
Loc::Titulo8          STRING(100)
SavPath8          STRING(2000)
Evo::Group8  GROUP,PRE()
Evo::Procedure8          STRING(100)
Evo::App8          STRING(100)
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
QBE7                 QueryListClass                        ! QBE List Class. 
QBV7                 QueryListVisual                       ! QBE Visual Class
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
AskRecord              PROCEDURE(BYTE Request),BYTE,PROC,DERIVED
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::Sort1:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 2
BRW1::Sort2:Locator  EntryLocatorClass                     ! Conditional Locator - CHOICE(?CurrentTab) = 3
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

Ec::LoadI_8  SHORT
Gol_woI_8 WINDOW,AT(,,236,43),FONT('MS Sans Serif',8,,),CENTER,GRAY
       IMAGE('clock.ico'),AT(8,11),USE(?ImgoutI_8),CENTERED
       GROUP,AT(38,11,164,20),USE(?G::I_8),BOXED,BEVEL(-1)
         STRING('Preparando datos para Exportacion'),AT(63,11),USE(?StrOutI_8),TRN
         STRING('Aguarde un instante por Favor...'),AT(67,20),USE(?StrOut2I_8),TRN
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
PrintExBrowse8 ROUTINE

 OPEN(Gol_woI_8)
 DISPLAY()
 SETTARGET(QuickWindow)
 SETCURSOR(CURSOR:WAIT)
 EC::LoadI_8 = BRW1.FileLoaded
 IF Not  EC::LoadI_8
     BRW1.FileLoaded=True
     CLEAR(BRW1.LastItems,1)
     BRW1.ResetFromFile()
 END
 CLOSE(Gol_woI_8)
 SETCURSOR()
  Evo::App8          = 'Gestion'
  Evo::Procedure8          = GlobalErrors.GetProcedureName()& 8
 
  FREE(QPar8)
  Q8:FieldPar  = '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,'
  ADD(QPar8)  !!1
  Q8:FieldPar  = ';'
  ADD(QPar8)  !!2
  Q8:FieldPar  = 'Spanish'
  ADD(QPar8)  !!3
  Q8:FieldPar  = ''
  ADD(QPar8)  !!4
  Q8:FieldPar  = true
  ADD(QPar8)  !!5
  Q8:FieldPar  = ''
  ADD(QPar8)  !!6
  Q8:FieldPar  = true
  ADD(QPar8)  !!7
 !!!! Exportaciones
  Q8:FieldPar  = 'HTML|'
   Q8:FieldPar  = CLIP( Q8:FieldPar)&'EXCEL|'
   Q8:FieldPar  = CLIP( Q8:FieldPar)&'WORD|'
  Q8:FieldPar  = CLIP( Q8:FieldPar)&'ASCII|'
   Q8:FieldPar  = CLIP( Q8:FieldPar)&'XML|'
   Q8:FieldPar  = CLIP( Q8:FieldPar)&'PRT|'
  ADD(QPar8)  !!8
  Q8:FieldPar  = 'All'
  ADD(QPar8)   !.9.
  Q8:FieldPar  = ' 0'
  ADD(QPar8)   !.10
  Q8:FieldPar  = 0
  ADD(QPar8)   !.11
  Q8:FieldPar  = '1'
  ADD(QPar8)   !.12
 
  Q8:FieldPar  = ''
  ADD(QPar8)   !.13
 
  Q8:FieldPar  = ''
  ADD(QPar8)   !.14
 
  Q8:FieldPar  = ''
  ADD(QPar8)   !.15
 
   Q8:FieldPar  = '16'
  ADD(QPar8)   !.16
 
   Q8:FieldPar  = 1
  ADD(QPar8)   !.17
   Q8:FieldPar  = 2
  ADD(QPar8)   !.18
   Q8:FieldPar  = '2'
  ADD(QPar8)   !.19
   Q8:FieldPar  = 12
  ADD(QPar8)   !.20
 
   Q8:FieldPar  = 0 !Exporta excel sin borrar
  ADD(QPar8)   !.21
 
   Q8:FieldPar  = Evo::NroPage !Nro Pag. Desde Report (BExp)
  ADD(QPar8)   !.22
 
   CLEAR(Q8:FieldPar)
  ADD(QPar8)   ! 23 Caracteres Encoding para xml
 
  Q8:FieldPar  = '0'
  ADD(QPar8)   ! 24 Use Open Office
 
   Q8:FieldPar  = 'golmedo'
  ADD(QPar8) ! 25
 
 !---------------------------------------------------------------------------------------------
 !!Registration 
  Q8:FieldPar  = ' BrowseExport'
  ADD(QPar8)   ! 26  BrowseExport
  Q8:FieldPar  = ' '
  ADD(QPar8)   ! 27  
  Q8:FieldPar  = ' ' 
  ADD(QPar8)   ! 28  
  Q8:FieldPar  = 'BEXPORT' 
  ADD(QPar8)   ! 29 Gestion037.clw
 !!!!!
 
 
  FREE(QPar28)
       Qp28:F2N  = 'IDGASTOS'
  Qp28:F2P  = '@n-7'
  Qp28:F2T  = '0'
  ADD(QPar28)
       Qp28:F2N  = 'COMPROBANTE'
  Qp28:F2P  = '@s20'
  Qp28:F2T  = '0'
  ADD(QPar28)
       Qp28:F2N  = 'LETRA'
  Qp28:F2P  = '@s2'
  Qp28:F2T  = '0'
  ADD(QPar28)
       Qp28:F2N  = ''
  Qp28:F2P  = '@P####-P'
  Qp28:F2T  = '0'
  ADD(QPar28)
       Qp28:F2N  = ''
  Qp28:F2P  = '@n-14'
  Qp28:F2T  = '0'
  ADD(QPar28)
       Qp28:F2N  = 'MONTO'
  Qp28:F2P  = '@n$-10.2'
  Qp28:F2T  = '0'
  ADD(QPar28)
       Qp28:F2N  = 'IDSC'
  Qp28:F2P  = '@n-7'
  Qp28:F2T  = '0'
  ADD(QPar28)
       Qp28:F2N  = 'SUBCUENTA'
  Qp28:F2P  = '@s30'
  Qp28:F2T  = '0'
  ADD(QPar28)
       Qp28:F2N  = 'CUENTA'
  Qp28:F2P  = '@s30'
  Qp28:F2T  = '0'
  ADD(QPar28)
       Qp28:F2N  = 'TIPO'
  Qp28:F2P  = '@s10'
  Qp28:F2T  = '0'
  ADD(QPar28)
       Qp28:F2N  = 'OBSERVACION'
  Qp28:F2P  = '@s50'
  Qp28:F2T  = '0'
  ADD(QPar28)
       Qp28:F2N  = 'FECHA'
  Qp28:F2P  = '@d17'
  Qp28:F2T  = '0'
  ADD(QPar28)
       Qp28:F2N  = 'HORA'
  Qp28:F2P  = '@t7'
  Qp28:F2T  = '0'
  ADD(QPar28)
       Qp28:F2N  = 'IDP'
  Qp28:F2P  = '@n-5'
  Qp28:F2T  = '0'
  ADD(QPar28)
       Qp28:F2N  = 'DESC PROV'
  Qp28:F2P  = '@s50'
  Qp28:F2T  = '0'
  ADD(QPar28)
  SysRec# = false
  FREE(Loc::QHlist8)
  LOOP
     SysRec# += 1
     IF ?Browse:1{PROPLIST:Exists,SysRec#} = 1
         GET(QPar28,SysRec#)
         QHL8:Id      = SysRec#
         QHL8:Nombre  = Qp28:F2N
         QHL8:Longitud= ?Browse:1{PropList:Width,SysRec#}  /2
         QHL8:Pict    = Qp28:F2P
         QHL8:Tot    = Qp28:F2T
         ADD(Loc::QHlist8)
      Else
        break
     END
  END
  Loc::Titulo8 ='Administrator the INGRESOS'
 
 SavPath8 = PATH()
  Exportar(Loc::QHlist8,BRW1.Q,QPar8,0,Loc::Titulo8,Evo::Group8)
 IF Not EC::LoadI_8 Then  BRW1.FileLoaded=false.
 SETPATH(SavPath8)
 !!!! Fin Routina Templates Clarion

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('ABM_EGRESOS')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('TIPCOM:IDTIPO_COMPROBANTE',TIPCOM:IDTIPO_COMPROBANTE) ! Added by: BrowseBox(ABC)
  BIND('SUB:IDSUBCUENTA',SUB:IDSUBCUENTA)                  ! Added by: BrowseBox(ABC)
  BIND('CUE:IDCUENTA',CUE:IDCUENTA)                        ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:GASTOS.Open                                       ! File GASTOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:GASTOS,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  QBE7.Init(QBV7, INIMgr,'ABM_INGRESOS', GlobalErrors)
  QBE7.QkSupport = True
  QBE7.QkMenuIcon = 'QkQBE.ico'
  QBE7.QkIcon = 'QkLoad.ico'
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,GAS:FK_GASTOS_SUBCUENTA)              ! Add the sort order for GAS:FK_GASTOS_SUBCUENTA for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,GAS:IDSUBCUENTA,,BRW1)         ! Initialize the browse locator using  using key: GAS:FK_GASTOS_SUBCUENTA , GAS:IDSUBCUENTA
  BRW1.AddSortOrder(,GAS:IDX_GASTOS_FECHA)                 ! Add the sort order for GAS:IDX_GASTOS_FECHA for sort order 2
  BRW1.AddLocator(BRW1::Sort2:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort2:Locator.Init(?GAS:FECHA,GAS:FECHA,,BRW1)     ! Initialize the browse locator using ?GAS:FECHA using key: GAS:IDX_GASTOS_FECHA , GAS:FECHA
  BRW1.AddSortOrder(,GAS:PK_GASTOS)                        ! Add the sort order for GAS:PK_GASTOS for sort order 3
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 3
  BRW1::Sort0:Locator.Init(,GAS:IDGASTOS,,BRW1)            ! Initialize the browse locator using  using key: GAS:PK_GASTOS , GAS:IDGASTOS
  BRW1.AddField(GAS:IDGASTOS,BRW1.Q.GAS:IDGASTOS)          ! Field GAS:IDGASTOS is a hot field or requires assignment from browse
  BRW1.AddField(TIPCOM:DESCRIPCION,BRW1.Q.TIPCOM:DESCRIPCION) ! Field TIPCOM:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(GAS:LETRA,BRW1.Q.GAS:LETRA)                ! Field GAS:LETRA is a hot field or requires assignment from browse
  BRW1.AddField(GAS:SUCURSAL,BRW1.Q.GAS:SUCURSAL)          ! Field GAS:SUCURSAL is a hot field or requires assignment from browse
  BRW1.AddField(GAS:IDRECIBO,BRW1.Q.GAS:IDRECIBO)          ! Field GAS:IDRECIBO is a hot field or requires assignment from browse
  BRW1.AddField(GAS:MONTO,BRW1.Q.GAS:MONTO)                ! Field GAS:MONTO is a hot field or requires assignment from browse
  BRW1.AddField(GAS:IDSUBCUENTA,BRW1.Q.GAS:IDSUBCUENTA)    ! Field GAS:IDSUBCUENTA is a hot field or requires assignment from browse
  BRW1.AddField(SUB:DESCRIPCION,BRW1.Q.SUB:DESCRIPCION)    ! Field SUB:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(CUE:DESCRIPCION,BRW1.Q.CUE:DESCRIPCION)    ! Field CUE:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(CUE:TIPO,BRW1.Q.CUE:TIPO)                  ! Field CUE:TIPO is a hot field or requires assignment from browse
  BRW1.AddField(GAS:OBSERVACION,BRW1.Q.GAS:OBSERVACION)    ! Field GAS:OBSERVACION is a hot field or requires assignment from browse
  BRW1.AddField(GAS:FECHA,BRW1.Q.GAS:FECHA)                ! Field GAS:FECHA is a hot field or requires assignment from browse
  BRW1.AddField(GAS:HORA,BRW1.Q.GAS:HORA)                  ! Field GAS:HORA is a hot field or requires assignment from browse
  BRW1.AddField(GAS:IDPROVEEDOR,BRW1.Q.GAS:IDPROVEEDOR)    ! Field GAS:IDPROVEEDOR is a hot field or requires assignment from browse
  BRW1.AddField(PRO2:DESCRIPCION,BRW1.Q.PRO2:DESCRIPCION)  ! Field PRO2:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(PRO2:IDPROVEEDOR,BRW1.Q.PRO2:IDPROVEEDOR)  ! Field PRO2:IDPROVEEDOR is a hot field or requires assignment from browse
  BRW1.AddField(TIPCOM:IDTIPO_COMPROBANTE,BRW1.Q.TIPCOM:IDTIPO_COMPROBANTE) ! Field TIPCOM:IDTIPO_COMPROBANTE is a hot field or requires assignment from browse
  BRW1.AddField(SUB:IDSUBCUENTA,BRW1.Q.SUB:IDSUBCUENTA)    ! Field SUB:IDSUBCUENTA is a hot field or requires assignment from browse
  BRW1.AddField(CUE:IDCUENTA,BRW1.Q.CUE:IDCUENTA)          ! Field CUE:IDCUENTA is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('ABM_EGRESOS',QuickWindow)                  ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.QueryControl = ?Query
  BRW1.UpdateQuery(QBE7,1)
  BRW1.AskProcedure = 1                                    ! Will call: UpdateEGRESOS
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
  IF GLO:NIVEL < 5 THEN
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
    Relate:GASTOS.Close
  END
  IF SELF.Opened
    INIMgr.Update('ABM_EGRESOS',QuickWindow)               ! Save window data to non-volatile store
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
    UpdateEGRESOS
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
       Do PrintExBrowse8
    OF ?Button6
      ThisWindow.Update()
      GlobalRequest = ChangeRecord
      ANULAR_GASTOS()
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


BRW1.AskRecord PROCEDURE(BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  IF Request = InsertRecord
      BEEP
      MESSAGE('ATENCION: SE VA A DAR ALTA ','ALTA',ICON:EXCLAMATION)
  ELSIF Request = ChangeRecord
      BEEP
      MESSAGE('ATENCION: SE VA A ACTUALIZAR ','CAMBIO',ICON:EXCLAMATION)
  ELSIF Request = DeleteRecord
      BEEP
      MESSAGE('ATENCION: SE VA A DAR DE BAJA ','BAJA',ICON:EXCLAMATION)
  END
  ReturnValue = PARENT.AskRecord(Request)
  RETURN ReturnValue


BRW1.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert:3
  END
  SELF.ViewControl = ?View:2                               ! Setup the control used to initiate view only mode


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

!!! <summary>
!!! Generated from procedure template - Window
!!! Actualizacion INGRESOS
!!! </summary>
ANULAR_GASTOS PROCEDURE 

CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
LOC:CUENTA           LONG,NAME('IDCUENTA | READONLY')      ! 
History::GAS:Record  LIKE(GAS:RECORD),THREAD
QuickWindow          WINDOW('ANULAR ORDENES DE PAGO '),AT(,,351,62),FONT('MS Sans Serif',8,,FONT:regular),RESIZE, |
  CENTER,GRAY,IMM,MDI,HLP('UpdateINGRESOS'),SYSTEM
                       PROMPT('Nº RECIBO:'),AT(5,3),USE(?Prompt6)
                       STRING(@P####-P),AT(50,4),USE(GAS:SUCURSAL)
                       STRING(@n-14),AT(75,3),USE(GAS:IDRECIBO)
                       BUTTON('&Aceptar'),AT(249,40,49,14),USE(?OK),LEFT,ICON('ok.ico'),CURSOR('mano.cur'),DEFAULT, |
  FLAT,MSG('Confirma y Actualiza el Formulario'),TIP('Confirma y Actualiza el Formulario')
                       BUTTON('&Cancelar'),AT(301,40,49,14),USE(?Cancel),LEFT,ICON('cancelar.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Cancela Operacion'),TIP('Cancela Operacion')
                       LINE,AT(0,33,338,0),USE(?Line2),COLOR(COLOR:Black)
                       PROMPT('MONTO:'),AT(3,18),USE(?ING:MONTO:Prompt),TRN
                       STRING(@n-13.2),AT(36,16,47,11),USE(GAS:MONTO)
                     END

ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
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
  GlobalErrors.SetProcedureName('ANULAR_GASTOS')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Prompt6
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(GAS:Record,History::GAS:Record)
  SELF.AddHistoryField(?GAS:SUCURSAL,12)
  SELF.AddHistoryField(?GAS:IDRECIBO,13)
  SELF.AddHistoryField(?GAS:MONTO,5)
  SELF.AddUpdateFile(Access:GASTOS)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:CAJA.Open                                         ! File CAJA used by this procedure, so make sure it's RelationManager is open
  Relate:GASTOS.Open                                       ! File GASTOS used by this procedure, so make sure it's RelationManager is open
  Relate:LIBDIARIO.Open                                    ! File LIBDIARIO used by this procedure, so make sure it's RelationManager is open
  Relate:RANKING.Open                                      ! File RANKING used by this procedure, so make sure it's RelationManager is open
  Relate:SUBCUENTAS.Open                                   ! File SUBCUENTAS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:GASTOS
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
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('ANULAR_GASTOS',QuickWindow)                ! Restore window settings from non-volatile store
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
    Relate:GASTOS.Close
    Relate:LIBDIARIO.Close
    Relate:RANKING.Close
    Relate:SUBCUENTAS.Close
  END
  IF SELF.Opened
    INIMgr.Update('ANULAR_GASTOS',QuickWindow)             ! Save window data to non-volatile store
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
      IF GAS:IDSUBCUENTA <> 18 THEN
      
          !!! RESTA EL INGRESO EN FONDO
          SUB:IDSUBCUENTA = GAS:IDSUBCUENTA
          ACCESS:SUBCUENTAS.TRYFETCH(SUB:INTEG_113)
          FON:IDFONDO = SUB:IDFONDO
          ACCESS:FONDOS.TRYFETCH(FON:PK_FONDOS)
          FON:MONTO = FON:MONTO + GAS:MONTO
          ACCESS:FONDOS.UPDATE()
          !!!!
          GAS:IDSUBCUENTA = 18
          GAS:MONTO = 0
          !! BUSCO USUARIO
          USU:IDUSUARIO = GLO:IDUSUARIO
          ACCESS:USUARIO.TRYFETCH(USU:PK_USUARIO)
          USUARIO" = CLIP(USU:DESCRIPCION)
          !!
          DIA" = FORMAT(TODAY(),@D6)
          HORA" = FORMAT(CLOCK(),@T4)
          GAS:OBSERVACION = 'ANULADO  POR '&CLIP(USUARIO")&', FECHA: '&CLIP(DIA")&', HORA: '&CLIP(HORA")
           !!! ANULO EN LIBRO DIARIO
          LIB:TIPO  =         'EGRESO'
          LIB:IDTRANSACCION =  GAS:IDGASTOS
          ACCESS:LIBDIARIO.TRYFETCH(LIB:IDX_LIBDIARIO_UNIQUE_TRANSAC)
          LIB:DEBE = 0
          LIB:HABER = 0
          LIB:OBSERVACION = GAS:OBSERVACION
          LIB:IDSUBCUENTA = 18
          LIB:FONDO = FON:MONTO
          ACCESS:LIBDIARIO.UPDATE()
          !!  ANULO EN CAJA
          CAJ:TIPO            = 'EGRESO'
          CAJ:IDTRANSACCION   = GAS:IDGASTOS
          GET(CAJA,CAJ:IDX_UNIQUE_TRANSAC)
          IF ERRORCODE() <> 35 THEN
              CAJ:DEBE          = 0
              CAJ:HABER         = 0
              CAJ:OBSERVACION   =  GAS:OBSERVACION
              CAJ:IDSUBCUENTA = 18
              CAJ:MONTO = FON:MONTO 
              ACCESS:CAJA.UPDATE()
          END
      
      ELSE
          MESSAGE ('LA OPA YA ESTA ANULADO')
          SELECT(?Cancel)
          CYCLE
      END
            
      
      
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?OK
      ThisWindow.Update()
      IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing THEN
         POST(EVENT:CloseWindow)
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


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Window
!!! Administrador de PROVEEDORES
!!! </summary>
ABM_PROVEEDOR PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(PROVEEDORES)
                       PROJECT(PRO2:IDPROVEEDOR)
                       PROJECT(PRO2:DESCRIPCION)
                       PROJECT(PRO2:CUIT)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
PRO2:IDPROVEEDOR       LIKE(PRO2:IDPROVEEDOR)         !List box control field - type derived from field
PRO2:DESCRIPCION       LIKE(PRO2:DESCRIPCION)         !List box control field - type derived from field
PRO2:CUIT              LIKE(PRO2:CUIT)                !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Administrador de PROVEEDORES'),AT(,,358,198),FONT('MS Sans Serif',8,,FONT:regular), |
  RESIZE,CENTER,GRAY,IMM,MDI,HLP('ABM_PROVEEDOR'),SYSTEM
                       LIST,AT(8,41,342,113),USE(?Browse:1),HVSCROLL,FORMAT('56L(2)|M~IDPROVEEDOR~C(0)@n-7@200' & |
  'L(2)|M~DESCRIPCION~@s50@44L(2)|M~CUIT~@p##-########-#p@'),FROM(Queue:Browse:1),IMM,MSG('Administra' & |
  'dor de PROVEEDORES')
                       BUTTON('&Ver'),AT(142,158,49,14),USE(?View:2),LEFT,ICON('v.ico'),CURSOR('mano.cur'),FLAT,MSG('Visualizar'), |
  TIP('Visualizar')
                       BUTTON('&Agregar'),AT(195,158,49,14),USE(?Insert:3),LEFT,ICON('a.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Agrega Registro'),TIP('Agrega Registro')
                       BUTTON('&Cambiar'),AT(248,158,49,14),USE(?Change:3),LEFT,ICON('c.ico'),CURSOR('mano.cur'), |
  DEFAULT,FLAT,MSG('Cambia Registro'),TIP('Cambia Registro')
                       BUTTON('&Borrar'),AT(301,158,49,14),USE(?Delete:3),LEFT,ICON('b.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Borra Registro'),TIP('Borra Registro')
                       SHEET,AT(4,4,350,172),USE(?CurrentTab)
                         TAB('RAZON SOCIAL'),USE(?Tab:1)
                           PROMPT('RAZON SOCIAL:'),AT(11,24),USE(?PRO2:DESCRIPCION:Prompt)
                           ENTRY(@s50),AT(67,24,277,10),USE(PRO2:DESCRIPCION),UPR
                         END
                         TAB('CUIT'),USE(?Tab:2)
                           PROMPT('CUIT:'),AT(9,26),USE(?PRO2:CUIT:Prompt)
                           ENTRY(@p##-########-#p),AT(35,25,54,10),USE(PRO2:CUIT)
                         END
                         TAB('ID'),USE(?Tab:3)
                           PROMPT('IDPROVEEDOR:'),AT(12,27),USE(?PRO2:IDPROVEEDOR:Prompt)
                           ENTRY(@n-14),AT(68,26,54,10),USE(PRO2:IDPROVEEDOR),REQ
                         END
                       END
                       BUTTON('&Salir'),AT(305,180,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Salir'),TIP('Salir')
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
                     END

BRW1::Sort0:Locator  FilterLocatorClass                    ! Default Locator
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
  GlobalErrors.SetProcedureName('ABM_PROVEEDOR')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:PROVEEDORES.Open                                  ! File PROVEEDORES used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:PROVEEDORES,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,PRO2:IDX_PROVEEDORES_CUIT)            ! Add the sort order for PRO2:IDX_PROVEEDORES_CUIT for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(?PRO2:CUIT,PRO2:CUIT,,BRW1)     ! Initialize the browse locator using ?PRO2:CUIT using key: PRO2:IDX_PROVEEDORES_CUIT , PRO2:CUIT
  BRW1.AddSortOrder(,PRO2:PK_PROVEEDOR)                    ! Add the sort order for PRO2:PK_PROVEEDOR for sort order 2
  BRW1.AddLocator(BRW1::Sort2:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort2:Locator.Init(?PRO2:IDPROVEEDOR,PRO2:IDPROVEEDOR,,BRW1) ! Initialize the browse locator using ?PRO2:IDPROVEEDOR using key: PRO2:PK_PROVEEDOR , PRO2:IDPROVEEDOR
  BRW1.AddSortOrder(,PRO2:IDX_PROVEEDORES_DESCRIPCION)     ! Add the sort order for PRO2:IDX_PROVEEDORES_DESCRIPCION for sort order 3
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 3
  BRW1::Sort0:Locator.Init(?PRO2:DESCRIPCION,PRO2:DESCRIPCION,,BRW1) ! Initialize the browse locator using ?PRO2:DESCRIPCION using key: PRO2:IDX_PROVEEDORES_DESCRIPCION , PRO2:DESCRIPCION
  BRW1.AddField(PRO2:IDPROVEEDOR,BRW1.Q.PRO2:IDPROVEEDOR)  ! Field PRO2:IDPROVEEDOR is a hot field or requires assignment from browse
  BRW1.AddField(PRO2:DESCRIPCION,BRW1.Q.PRO2:DESCRIPCION)  ! Field PRO2:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(PRO2:CUIT,BRW1.Q.PRO2:CUIT)                ! Field PRO2:CUIT is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('ABM_PROVEEDOR',QuickWindow)                ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1                                    ! Will call: UpdatePROVEEDORES
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
    INIMgr.Update('ABM_PROVEEDOR',QuickWindow)             ! Save window data to non-volatile store
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
    UpdatePROVEEDORES
    ReturnValue = GlobalResponse
  END
  RETURN ReturnValue


ThisWindow.SetAlerts PROCEDURE

  CODE
  
  !!! Evolution Consulting FREE Templates Start!!!
     ALERT(EnterKey)
  
  !!! Evolution Consulting FREE Templates End!!!
  PARENT.SetAlerts


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

!!! <summary>
!!! Generated from procedure template - Window
!!! Actualizacion INFORME
!!! </summary>
Formulario_INFORME PROCEDURE 

CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
History::INF:Record  LIKE(INF:RECORD),THREAD
QuickWindow          WINDOW('Actualizacion INFORME'),AT(,,221,78),FONT('Arial',8,COLOR:Black,FONT:bold),RESIZE, |
  CENTER,GRAY,IMM,MDI,HLP('Formulario_INFORME'),SYSTEM
                       PROMPT('INFORME:'),AT(1,2),USE(?INF:INFORME:Prompt),TRN
                       TEXT,AT(54,2,157,30),USE(INF:INFORME)
                       CHECK('Terminado'),AT(54,39),USE(INF:TERMINADO),VALUE('SI','')
                       BUTTON('&Aceptar'),AT(53,63,49,14),USE(?OK),LEFT,ICON('ok.ico'),CURSOR('mano.cur'),DEFAULT, |
  FLAT,MSG('Confirma y Actualiza el Formulario'),TIP('Confirma y Actualiza el Formulario')
                       BUTTON('&Cancelar'),AT(121,63,49,14),USE(?Cancel),LEFT,ICON('cancelar.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Cancela Operacion'),TIP('Cancela Operacion')
                     END

ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
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
  GlobalErrors.SetProcedureName('Formulario_INFORME')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?INF:INFORME:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(INF:Record,History::INF:Record)
  SELF.AddHistoryField(?INF:INFORME,4)
  SELF.AddHistoryField(?INF:TERMINADO,6)
  SELF.AddUpdateFile(Access:INFORME)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:INFORME.Open                                      ! File INFORME used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:INFORME
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
    ?INF:TERMINADO{PROP:ReadOnly} = True
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('Formulario_INFORME',QuickWindow)           ! Restore window settings from non-volatile store
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
    Relate:INFORME.Close
  END
  IF SELF.Opened
    INIMgr.Update('Formulario_INFORME',QuickWindow)        ! Save window data to non-volatile store
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
      INF:FECHA       = TODAY()
      INF:HORA        = CLOCK()
      INF:IDUSUARIO   = GLO:IDUSUARIO
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?OK
      ThisWindow.Update()
      IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing THEN
         POST(EVENT:CloseWindow)
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


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Window
!!! Administrador de INFORME
!!! </summary>
ABM_INFORMES PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(INFORME)
                       PROJECT(INF:INFORME)
                       PROJECT(INF:FECHA)
                       PROJECT(INF:HORA)
                       PROJECT(INF:TERMINADO)
                       PROJECT(INF:IDINFORME)
                       PROJECT(INF:IDUSUARIO)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
INF:INFORME            LIKE(INF:INFORME)              !List box control field - type derived from field
INF:INFORME_Icon       LONG                           !Entry's icon ID
INF:FECHA              LIKE(INF:FECHA)                !List box control field - type derived from field
INF:HORA               LIKE(INF:HORA)                 !List box control field - type derived from field
INF:TERMINADO          LIKE(INF:TERMINADO)            !List box control field - type derived from field
INF:IDINFORME          LIKE(INF:IDINFORME)            !List box control field - type derived from field
INF:IDUSUARIO          LIKE(INF:IDUSUARIO)            !Browse key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Administrador de INFORME'),AT(,,358,198),FONT('Arial',8,COLOR:Black,FONT:bold),RESIZE, |
  CENTER,GRAY,IMM,MDI,HLP('ABM_INFORMES'),SYSTEM
                       LIST,AT(8,30,342,124),USE(?Browse:1),HVSCROLL,FORMAT('330L(2)|MI~INFORME~@s255@50L(2)|M' & |
  '~FECHA~C(0)@d17@43L(2)|M~HORA~C(0)@t7@40L(2)|M~TERMINADO~@s2@64R(2)|M~IDINFORME~C(0)@n-7@'), |
  FROM(Queue:Browse:1),IMM,MSG('Administrador de INFORME')
                       BUTTON('&Ver'),AT(142,158,49,14),USE(?View:2),LEFT,ICON('v.ico'),CURSOR('mano.cur'),FLAT,MSG('Visualizar'), |
  TIP('Visualizar')
                       BUTTON('&Agregar'),AT(195,158,49,14),USE(?Insert:3),LEFT,ICON('a.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Agrega Registro'),TIP('Agrega Registro')
                       BUTTON('&Cambiar'),AT(248,158,49,14),USE(?Change:3),LEFT,ICON('c.ico'),CURSOR('mano.cur'), |
  DEFAULT,FLAT,MSG('Cambia Registro'),TIP('Cambia Registro')
                       BUTTON('&Borrar'),AT(301,158,49,14),USE(?Delete:3),LEFT,ICON('b.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Borra Registro'),TIP('Borra Registro')
                       SHEET,AT(4,4,350,172),USE(?CurrentTab)
                         TAB('FECHA'),USE(?Tab:1)
                         END
                         TAB('INFORME'),USE(?Tab:2)
                         END
                       END
                       BUTTON('&Salir'),AT(305,180,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Salir'),TIP('Salir')
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
SetQueueRecord         PROCEDURE(),DERIVED
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::Sort2:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 3
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
  GlobalErrors.SetProcedureName('ABM_INFORMES')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('INF:IDINFORME',INF:IDINFORME)                      ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:INFORME.Open                                      ! File INFORME used by this procedure, so make sure it's RelationManager is open
  Relate:USUARIO.Open                                      ! File USUARIO used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:INFORME,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,INF:FK_INFORME_USUARIO)               ! Add the sort order for INF:FK_INFORME_USUARIO for sort order 1
  BRW1.AddRange(INF:IDUSUARIO,Relate:INFORME,Relate:USUARIO) ! Add file relationship range limit for sort order 1
  BRW1.AddSortOrder(,INF:PK_INFORME)                       ! Add the sort order for INF:PK_INFORME for sort order 2
  BRW1.AddLocator(BRW1::Sort2:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort2:Locator.Init(,INF:IDINFORME,,BRW1)           ! Initialize the browse locator using  using key: INF:PK_INFORME , INF:IDINFORME
  BRW1.AddSortOrder(,INF:INFORME_IDX_FECHA)                ! Add the sort order for INF:INFORME_IDX_FECHA for sort order 3
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 3
  BRW1::Sort0:Locator.Init(,INF:FECHA,,BRW1)               ! Initialize the browse locator using  using key: INF:INFORME_IDX_FECHA , INF:FECHA
  ?Browse:1{PROP:IconList,1} = '~bullet_ball_green.ico'
  BRW1.AddField(INF:INFORME,BRW1.Q.INF:INFORME)            ! Field INF:INFORME is a hot field or requires assignment from browse
  BRW1.AddField(INF:FECHA,BRW1.Q.INF:FECHA)                ! Field INF:FECHA is a hot field or requires assignment from browse
  BRW1.AddField(INF:HORA,BRW1.Q.INF:HORA)                  ! Field INF:HORA is a hot field or requires assignment from browse
  BRW1.AddField(INF:TERMINADO,BRW1.Q.INF:TERMINADO)        ! Field INF:TERMINADO is a hot field or requires assignment from browse
  BRW1.AddField(INF:IDINFORME,BRW1.Q.INF:IDINFORME)        ! Field INF:IDINFORME is a hot field or requires assignment from browse
  BRW1.AddField(INF:IDUSUARIO,BRW1.Q.INF:IDUSUARIO)        ! Field INF:IDUSUARIO is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('ABM_INFORMES',QuickWindow)                 ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1                                    ! Will call: Formulario_INFORME
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:INFORME.Close
    Relate:USUARIO.Close
  END
  IF SELF.Opened
    INIMgr.Update('ABM_INFORMES',QuickWindow)              ! Save window data to non-volatile store
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
    Formulario_INFORME
    ReturnValue = GlobalResponse
  END
  RETURN ReturnValue


ThisWindow.SetAlerts PROCEDURE

  CODE
  
  !!! Evolution Consulting FREE Templates Start!!!
     ALERT(EnterKey)
  
  !!! Evolution Consulting FREE Templates End!!!
  PARENT.SetAlerts


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
  ELSIF CHOICE(?CurrentTab) = 3
    RETURN SELF.SetSort(2,Force)
  ELSE
    RETURN SELF.SetSort(3,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


BRW1.SetAlerts PROCEDURE

  CODE
  SELF.EditViaPopup = False
  PARENT.SetAlerts


BRW1.SetQueueRecord PROCEDURE

  CODE
  PARENT.SetQueueRecord
  
  IF (INF:TERMINADO = 'SI')
    SELF.Q.INF:INFORME_Icon = 1                            ! Set icon from icon list
  ELSE
    SELF.Q.INF:INFORME_Icon = 0
  END


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Window
!!! Select a CONSULTORIO Record
!!! </summary>
SelectCONSULTORIO1 PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(CONSULTORIO)
                       PROJECT(CON2:IDCONSULTORIO)
                       PROJECT(CON2:IDLOCALIDAD)
                       PROJECT(CON2:IDSOCIO)
                       PROJECT(CON2:DIRECCION)
                       PROJECT(CON2:FECHA)
                       PROJECT(CON2:LIBRO)
                       PROJECT(CON2:FOLIO)
                       PROJECT(CON2:ACTA)
                       PROJECT(CON2:IDINSPECTOR)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
CON2:IDCONSULTORIO     LIKE(CON2:IDCONSULTORIO)       !List box control field - type derived from field
CON2:IDLOCALIDAD       LIKE(CON2:IDLOCALIDAD)         !List box control field - type derived from field
CON2:IDSOCIO           LIKE(CON2:IDSOCIO)             !List box control field - type derived from field
CON2:DIRECCION         LIKE(CON2:DIRECCION)           !List box control field - type derived from field
CON2:FECHA             LIKE(CON2:FECHA)               !List box control field - type derived from field
CON2:LIBRO             LIKE(CON2:LIBRO)               !List box control field - type derived from field
CON2:FOLIO             LIKE(CON2:FOLIO)               !List box control field - type derived from field
CON2:ACTA              LIKE(CON2:ACTA)                !List box control field - type derived from field
CON2:IDINSPECTOR       LIKE(CON2:IDINSPECTOR)         !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Select a CONSULTORIO Record'),AT(,,358,198),FONT('MS Sans Serif',8,,FONT:regular), |
  RESIZE,CENTER,GRAY,IMM,MDI,HLP('SelectCONSULTORIO'),SYSTEM
                       LIST,AT(8,30,342,124),USE(?Browse:1),HVSCROLL,FORMAT('64R(2)|M~IDCONSULTORIO~C(0)@n-14@' & |
  '64R(2)|M~IDLOCALIDAD~C(0)@n-14@64R(2)|M~IDSOCIO~C(0)@n-14@80L(2)|M~DIRECCION~L(2)@s5' & |
  '0@80R(2)|M~FECHA~C(0)@d17@64R(2)|M~LIBRO~C(0)@n-14@64R(2)|M~FOLIO~C(0)@n-14@80L(2)|M' & |
  '~ACTA~L(2)@s20@64R(2)|M~IDINSPECTOR~C(0)@n-14@'),FROM(Queue:Browse:1),IMM,MSG('Administra' & |
  'dor de CONSULTORIO')
                       BUTTON('&Elegir'),AT(301,158,49,14),USE(?Select:2),LEFT,ICON('e.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Seleccionar'),TIP('Seleccionar')
                       SHEET,AT(4,4,350,172),USE(?CurrentTab)
                         TAB('PK_CONSULTORIO'),USE(?Tab:2)
                         END
                         TAB('FK_CONSULTORIO_INSPECTOR'),USE(?Tab:3)
                         END
                         TAB('FK_CONSULTORIO_LOCALIDAD'),USE(?Tab:4)
                         END
                         TAB('FK_CONSULTORIO_SOCIOS'),USE(?Tab:5)
                         END
                       END
                       BUTTON('&Salir'),AT(305,180,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Salir'),TIP('Salir')
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::Sort1:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 2
BRW1::Sort2:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 3
BRW1::Sort3:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 4
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
  GlobalErrors.SetProcedureName('SelectCONSULTORIO1')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('CON2:IDCONSULTORIO',CON2:IDCONSULTORIO)            ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:CONSULTORIO.Open                                  ! File CONSULTORIO used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:CONSULTORIO,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,CON2:FK_CONSULTORIO_INSPECTOR)        ! Add the sort order for CON2:FK_CONSULTORIO_INSPECTOR for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,CON2:IDINSPECTOR,,BRW1)        ! Initialize the browse locator using  using key: CON2:FK_CONSULTORIO_INSPECTOR , CON2:IDINSPECTOR
  BRW1.AddSortOrder(,CON2:FK_CONSULTORIO_LOCALIDAD)        ! Add the sort order for CON2:FK_CONSULTORIO_LOCALIDAD for sort order 2
  BRW1.AddLocator(BRW1::Sort2:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort2:Locator.Init(,CON2:IDLOCALIDAD,,BRW1)        ! Initialize the browse locator using  using key: CON2:FK_CONSULTORIO_LOCALIDAD , CON2:IDLOCALIDAD
  BRW1.AddSortOrder(,CON2:FK_CONSULTORIO_SOCIOS)           ! Add the sort order for CON2:FK_CONSULTORIO_SOCIOS for sort order 3
  BRW1.AddLocator(BRW1::Sort3:Locator)                     ! Browse has a locator for sort order 3
  BRW1::Sort3:Locator.Init(,CON2:IDSOCIO,,BRW1)            ! Initialize the browse locator using  using key: CON2:FK_CONSULTORIO_SOCIOS , CON2:IDSOCIO
  BRW1.AddSortOrder(,CON2:PK_CONSULTORIO)                  ! Add the sort order for CON2:PK_CONSULTORIO for sort order 4
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 4
  BRW1::Sort0:Locator.Init(,CON2:IDCONSULTORIO,,BRW1)      ! Initialize the browse locator using  using key: CON2:PK_CONSULTORIO , CON2:IDCONSULTORIO
  BRW1.AddField(CON2:IDCONSULTORIO,BRW1.Q.CON2:IDCONSULTORIO) ! Field CON2:IDCONSULTORIO is a hot field or requires assignment from browse
  BRW1.AddField(CON2:IDLOCALIDAD,BRW1.Q.CON2:IDLOCALIDAD)  ! Field CON2:IDLOCALIDAD is a hot field or requires assignment from browse
  BRW1.AddField(CON2:IDSOCIO,BRW1.Q.CON2:IDSOCIO)          ! Field CON2:IDSOCIO is a hot field or requires assignment from browse
  BRW1.AddField(CON2:DIRECCION,BRW1.Q.CON2:DIRECCION)      ! Field CON2:DIRECCION is a hot field or requires assignment from browse
  BRW1.AddField(CON2:FECHA,BRW1.Q.CON2:FECHA)              ! Field CON2:FECHA is a hot field or requires assignment from browse
  BRW1.AddField(CON2:LIBRO,BRW1.Q.CON2:LIBRO)              ! Field CON2:LIBRO is a hot field or requires assignment from browse
  BRW1.AddField(CON2:FOLIO,BRW1.Q.CON2:FOLIO)              ! Field CON2:FOLIO is a hot field or requires assignment from browse
  BRW1.AddField(CON2:ACTA,BRW1.Q.CON2:ACTA)                ! Field CON2:ACTA is a hot field or requires assignment from browse
  BRW1.AddField(CON2:IDINSPECTOR,BRW1.Q.CON2:IDINSPECTOR)  ! Field CON2:IDINSPECTOR is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('SelectCONSULTORIO1',QuickWindow)           ! Restore window settings from non-volatile store
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
    Relate:CONSULTORIO.Close
  END
  IF SELF.Opened
    INIMgr.Update('SelectCONSULTORIO1',QuickWindow)        ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.SetAlerts PROCEDURE

  CODE
  
  !!! Evolution Consulting FREE Templates Start!!!
     ALERT(EnterKey)
  
  !!! Evolution Consulting FREE Templates End!!!
  PARENT.SetAlerts


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
  SELF.SelectControl = ?Select:2
  SELF.HideSelect = 1                                      ! Hide the select button when disabled
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)


BRW1.ResetSort PROCEDURE(BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  IF CHOICE(?CurrentTab) = 2
    RETURN SELF.SetSort(1,Force)
  ELSIF CHOICE(?CurrentTab) = 3
    RETURN SELF.SetSort(2,Force)
  ELSIF CHOICE(?CurrentTab) = 4
    RETURN SELF.SetSort(3,Force)
  ELSE
    RETURN SELF.SetSort(4,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Report
!!! </summary>
IMPRIMIR_CERTIFICADO_HABILITACION4 PROCEDURE 

Progress:Thermometer BYTE                                  ! 
loc:fecha            STRING(100)                           ! 
loc:fecha_val        LONG                                  ! 
loc:fecha_hab        LONG                                  ! 
Process:View         VIEW(CONSULTRIO_ADHERENTE)
                       PROJECT(CON1:FECHA)
                       PROJECT(CON1:IDCONSUL_ADE)
                       PROJECT(CON1:LIBRO)
                       PROJECT(CON1:NRO)
                       PROJECT(CON1:IDSOCIO)
                       PROJECT(CON1:IDCONSULTORIO)
                       JOIN(SOC:PK_SOCIOS,CON1:IDSOCIO)
                         PROJECT(SOC:FECHA_ALTA)
                         PROJECT(SOC:FOLIO)
                         PROJECT(SOC:LIBRO)
                         PROJECT(SOC:MATRICULA)
                         PROJECT(SOC:NOMBRE)
                         PROJECT(SOC:IDTIPOTITULO)
                         JOIN(TIP6:PK_TIPO_TITULO,SOC:IDTIPOTITULO)
                         END
                       END
                       JOIN(CON2:PK_CONSULTORIO,CON1:IDCONSULTORIO)
                         PROJECT(CON2:DIRECCION)
                         PROJECT(CON2:FECHA)
                         PROJECT(CON2:FOLIO)
                         PROJECT(CON2:LIBRO)
                         PROJECT(CON2:IDLOCALIDAD)
                         JOIN(LOC:PK_LOCALIDAD,CON2:IDLOCALIDAD)
                           PROJECT(LOC:DESCRIPCION)
                         END
                       END
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

Report               REPORT,AT(479,3115,11063,4479),PRE(RPT),PAPER(PAPER:A4),LANDSCAPE,FONT('Arial',14,,FONT:bold, |
  CHARSET:ANSI),THOUS
                       HEADER,AT(479,1073,11063,2052),USE(?Header)
                         STRING(@s255),AT(10,1188,10542,281),USE(GLO:DIRECCION),CENTER,TRN
                         BOX,AT(10,1458,10542,52),USE(?Box1),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         STRING('CERTIFICADO DE HABILITACION DE CONSULTORIO'),AT(2833,1625),USE(?String6),FONT(,16, |
  ,FONT:bold+FONT:underline),TRN
                         STRING('Para ser exhibido en consultorio'),AT(4563,1885),USE(?String17),FONT(,10),TRN
                       END
Detail                 DETAIL,AT(0,0,,4271),USE(?Detail)
                         STRING('El Colegio Psicólogos del Valle Inferior de la Pcia. de Río Negro certifica que:'), |
  AT(21,63,7698,281),USE(?String7),TRN
                         STRING(@s20),AT(21,2323,2302,281),USE(LOC:DESCRIPCION),LEFT
                         STRING(', de la localidad de'),AT(8667,1917),USE(?String20),TRN
                         STRING(@s40),AT(4031,1938,4635,240),USE(CON2:DIRECCION),LEFT
                         STRING(', según inscripción en el Libro de Habilitaciones  Nº'),AT(2323,2323),USE(?String28), |
  TRN
                         STRING(', folio'),AT(7667,2323),USE(?String31),TRN
                         STRING(@d17),AT(9448,2323),USE(CON2:FECHA)
                         STRING(' la habilitación del consultorio ubicado en'),AT(21,1917),USE(?String35),TRN
                         LINE,AT(7823,3594,1958,0),USE(?Line2),COLOR(COLOR:Black)
                         LINE,AT(906,3615,1813,0),USE(?Line1),COLOR(COLOR:Black)
                         STRING(@n-3),AT(8188,2323,323,281),USE(CON2:FOLIO),LEFT
                         STRING('Presidente'),AT(8188,3635),USE(?String34),TRN
                         STRING('Secretaria '),AT(1292,3635),USE(?String33),TRN
                         STRING(', de fecha'),AT(8510,2323),USE(?String32),TRN
                         STRING(@n-4),AT(7260,2323,417,281),USE(CON2:LIBRO),LEFT
                         STRING(@s50),AT(21,448,5625,208),USE(SOC:NOMBRE),FONT(,,,FONT:bold),LEFT(2)
                         STRING(@n-3),AT(3385,771),USE(SOC:LIBRO),LEFT
                         STRING(@d17),AT(5750,750),USE(SOC:FECHA_ALTA)
                         STRING(', habiendo cumplido con todos los '),AT(6802,760),USE(?String25),TRN
                         STRING(@n-4),AT(4292,760),USE(SOC:FOLIO),LEFT
                         STRING(', folio'),AT(3771,760),USE(?String23),TRN
                         STRING(', registrado/a en esta Institución bajo el número de'),AT(5844,417),USE(?String18), |
  TRN
                         STRING('matricula: '),AT(21,760),USE(?String14),TRN
                         STRING('VIEDMA,'),AT(42,3948),USE(?String19),TRN
                         STRING(@s50),AT(1125,3979,5833,208),USE(GLO:FECHA_LARGO)
                         STRING(@s4),AT(979,760,458,281),USE(SOC:MATRICULA),LEFT
                         STRING('requisitos previos para el ejercicio de la Psicología en Jurisdiscción de la Pr' & |
  'ovincia de Río Negro conforme a la Ley'),AT(21,1146),USE(?String26),TRN
                         STRING(', del Libro Nº'),AT(6542,1531),USE(?String37),TRN
                         STRING(@n-3),AT(7771,1531,323,281),USE(CON1:LIBRO)
                         STRING('Nº '),AT(21,1531),USE(?String27),TRN
                         STRING(@s5),AT(229,1531,583,281),USE(GLO:LEY),LEFT
                         STRING(', le ha sido otorgada en caracter de Adherente bajo el Nº'),AT(802,1531),USE(?String29), |
  TRN
                         STRING(@n-3),AT(6208,1531),USE(CON1:NRO),LEFT(1)
                         STRING(@d17),AT(8667,1531),USE(CON1:FECHA),RIGHT(1)
                         STRING(',fecha'),AT(8094,1531),USE(?String40),TRN
                         STRING(', de fecha'),AT(4792,760),USE(?String24),TRN
                         STRING(', libro de colegiados'),AT(1438,760),USE(?String22),TRN
                       END
                     END
LocE::Direccion            STRING(5000)
LocE::DireccionCC          STRING(5000)
LocE::DireccionCCO         STRING(5000)
LocE::Subject              STRING(255)
LocE::Body                 STRING(2048)
LocE::FileName             STRING(5000)
LocE::Retorno              LONG
LocE::Flags                SHORT
LocE::Dialogo              BYTE
QAtach                   QUEUE
Attach                     CSTRING(5000)
                         END
Loc::Attach                 string(5000)
Loc::Cadena                 String(1)
Loc::Archivo                string(500)

LocE::GolDesde          SHORT
LocE::GolHasta          SHORT
LocE::Cancelar          BYTE
LocE::Atach             STRING(10000)
LocE::FileSend          STRING(5000)
LocE::Titulo            STRING(500)
LocE::NombreFile        STRING(500)
LocE::Qpar      QUEUE,PRE(QP)
Par                     CSTRING(1000)
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
Open                   PROCEDURE(),DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
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

?Menu_eMail     EQUATE(-1026)
?EnviarxMailWMF     EQUATE(-1027)
?EnviarxMailWord    EQUATE(-1028)
?EnviaraWord        EQUATE(-1029)
Gol_wo WINDOW,AT(,,236,43),FONT('Tahoma',8,,FONT:regular),CENTER,GRAY
       IMAGE('Mail.ico'),AT(8,7),USE(?Imgout),CENTERED
       PROGRESS,USE(?ProgOutlook),AT(38,9,164,9),RANGE(0,100)
       GROUP,AT(38,21,164,9),USE(?Group1),BOXED,BEVEL(-1)
         STRING('Generando Archivos de Mail'),AT(76,21),USE(?StrOut),TRN
       END
     END
WGolPrompt WINDOW,AT(,,160,80),FONT('Tahoma',8,,FONT:bold),CENTER,GRAY
       GROUP,AT(2,2,156,76),USE(?Group_gol),BOXED,BEVEL(-1)
         IMAGE('mail.ico'),AT(5,5,30,17),USE(?Image_gol),CENTERED
         GROUP,AT(36,8,88,36),USE(?Group2),BOXED,BEVEL(1,1)
           PROMPT('Pagina Desde:'),AT(43,14),USE(?Prompt_gol)
           SPIN(@n02),AT(92,14,25,10),USE(LocE::GolDesde),RANGE(1,100),STEP(1)
           PROMPT('Pagina Hasta:'),AT(43,28),USE(?Prompt_Gol2)
           SPIN(@n02),AT(92,28,25,10),USE(LocE::GolHasta),RANGE(1,100),STEP(1)
         END
         BUTTON('Enviar'),AT(27,59,50,14),USE(?Enviar),LEFT,ICON('wizok.ico')
         BUTTON('Cancelar'),AT(83,59,50,14),USE(?Cancelar),LEFT,ICON('wizcncl.ico')
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
!!! Inicio Ec. Templates
SendMailPrompt     ROUTINE
  OPEN(WGolPrompt)
  ALERT(EnterKey)
      POST(Event:OpenWindow)
      ACCEPT
        CASE EVENT()
        OF Event:OpenWindow
            CYCLE
        OF EVENT:AlertKey
           CASE KEYCODE()
             OF EnterKey
                MiControl# = FOCUS()
                CASE MiControl#{Prop:Type}
                  OF CREATE:Button
                     POST(EVENT:ACCEPTED,MiControl#)
                  ELSE
                     IF FOCUS()<> ?Enviar
                        PRESSKEY(TabKey)
                        CYCLE
                     ELSE
                        POST(Event:Accepted,?Enviar)
                     END!IF
                END!CASE
           END!CASE
        END!CASE EVENT
        CASE FIELD()
        OF ?Enviar
          CASE Event()
          OF Event:Accepted
            POST(Event:CloseWindow)
          OF EVENT:AlertKey
             CASE KEYCODE()
               OF EnterKey
                  MiControl# = FOCUS()
                  CASE MiControl#{Prop:Type}
                    OF CREATE:Button
                       POST(EVENT:ACCEPTED,MiControl#)
                    ELSE
                       IF FOCUS()<> ?Enviar
                          PRESSKEY(TabKey)
                          CYCLE
                       ELSE
                          ! Se presiono el ENTER estando posicionado el OK
                          POST(Event:Accepted,?Enviar)
                       END!IF
                  END!CASE
             END!CASE
          END
        OF ?Cancelar
          CASE Event()
          OF Event:Accepted
            LocE::Cancelar = True
            POST(Event:CloseWindow)
          OF EVENT:AlertKey
             CASE KEYCODE()
               OF EnterKey
                  MiControl# = FOCUS()
                  CASE MiControl#{Prop:Type}
                    OF CREATE:Button
                       POST(EVENT:ACCEPTED,MiControl#)
                    ELSE
                       IF FOCUS()<> ?Enviar
                          PRESSKEY(TabKey)
                          CYCLE
                       ELSE
                          POST(Event:Accepted,?Enviar)
                       END!IF
                  END!CASE
             END!CASE
          END
        END
      END !END ACCEPT
  CLOSE(WGolPrompt)
!************ Fin de ROUTINE Ec_Mail*********************

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('IMPRIMIR_CERTIFICADO_HABILITACION4')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:CONF_EMP.Open                                     ! File CONF_EMP used by this procedure, so make sure it's RelationManager is open
  Relate:CONSULTRIO_ADHERENTE.Open                         ! File CONSULTRIO_ADHERENTE used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('IMPRIMIR_CERTIFICADO_HABILITACION4',ProgressWindow) ! Restore window settings from non-volatile store
  TargetSelector.AddItem(XMLReporter.IReportGenerator)
  TargetSelector.AddItem(HTMLReporter.IReportGenerator)
  TargetSelector.AddItem(TXTReporter.IReportGenerator)
  TargetSelector.AddItem(PDFReporter.IReportGenerator)
  SELF.AddItem(TargetSelector)
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisReport.Init(Process:View, Relate:CONSULTRIO_ADHERENTE, ?Progress:PctText, Progress:Thermometer, ProgressMgr, CON1:IDCONSUL_ADE)
  ThisReport.AddSortOrder(CON1:PK_CONSULTRIO_ADHERENTE)
  ThisReport.AddRange(CON1:IDCONSUL_ADE,GLO:IDSOLICITUD)
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:CONSULTRIO_ADHERENTE.SetQuickScan(1,Propagate:OneMany)
  ProgressWindow{PROP:Timer} = 10                          ! Assign timer interval
  SELF.SkipPreview = False
  Previewer.SetINIManager(INIMgr)
  Previewer.AllowUserZoom = True
  SELF.SetAlerts()
  COF:RAZON_SOCIAL = 'Colegio de Psicólogos del Valle Inferior de Rió Negro'
  EXECUTE (MONTH(CON1:FECHA))
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
  loc:fecha_hab = CON1:FECHA
  LOC:FECHA = DAY(CON1:FECHA) & ' de ' &CLIP(Mes")&' '&Year(CON1:FECHA)
  loc:fecha_val = CON1:FECHA  +  1824
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:CONF_EMP.Close
    Relate:CONSULTRIO_ADHERENTE.Close
  END
  IF SELF.Opened
    INIMgr.Update('IMPRIMIR_CERTIFICADO_HABILITACION4',ProgressWindow) ! Save window data to non-volatile store
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
    SELF.Report{PROPPRINT:Extend}=True
  END
  RETURN ReturnValue


ThisWindow.SetStaticControlsAttributes PROCEDURE

  CODE
  PARENT.SetStaticControlsAttributes
  !XML STATIC
  SELF.Attribute.Set(?GLO:DIRECCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GLO:DIRECCION,RepGen:XML,TargetAttr:TagName,'GLO:DIRECCION')
  SELF.Attribute.Set(?GLO:DIRECCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String6,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String6,RepGen:XML,TargetAttr:TagName,'String6')
  SELF.Attribute.Set(?String6,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String17,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String17,RepGen:XML,TargetAttr:TagName,'String17')
  SELF.Attribute.Set(?String17,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String7,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String7,RepGen:XML,TargetAttr:TagName,'String7')
  SELF.Attribute.Set(?String7,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?LOC:DESCRIPCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?LOC:DESCRIPCION,RepGen:XML,TargetAttr:TagName,'LOC:DESCRIPCION')
  SELF.Attribute.Set(?LOC:DESCRIPCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String20,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String20,RepGen:XML,TargetAttr:TagName,'String20')
  SELF.Attribute.Set(?String20,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?CON2:DIRECCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?CON2:DIRECCION,RepGen:XML,TargetAttr:TagName,'CON2:DIRECCION')
  SELF.Attribute.Set(?CON2:DIRECCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String28,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String28,RepGen:XML,TargetAttr:TagName,'String28')
  SELF.Attribute.Set(?String28,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String31,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String31,RepGen:XML,TargetAttr:TagName,'String31')
  SELF.Attribute.Set(?String31,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?CON2:FECHA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?CON2:FECHA,RepGen:XML,TargetAttr:TagName,'CON2:FECHA')
  SELF.Attribute.Set(?CON2:FECHA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String35,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String35,RepGen:XML,TargetAttr:TagName,'String35')
  SELF.Attribute.Set(?String35,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?CON2:FOLIO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?CON2:FOLIO,RepGen:XML,TargetAttr:TagName,'CON2:FOLIO')
  SELF.Attribute.Set(?CON2:FOLIO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String34,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String34,RepGen:XML,TargetAttr:TagName,'String34')
  SELF.Attribute.Set(?String34,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String33,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String33,RepGen:XML,TargetAttr:TagName,'String33')
  SELF.Attribute.Set(?String33,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String32,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String32,RepGen:XML,TargetAttr:TagName,'String32')
  SELF.Attribute.Set(?String32,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?CON2:LIBRO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?CON2:LIBRO,RepGen:XML,TargetAttr:TagName,'CON2:LIBRO')
  SELF.Attribute.Set(?CON2:LIBRO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagName,'SOC:NOMBRE')
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:LIBRO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:LIBRO,RepGen:XML,TargetAttr:TagName,'SOC:LIBRO')
  SELF.Attribute.Set(?SOC:LIBRO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:FECHA_ALTA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:FECHA_ALTA,RepGen:XML,TargetAttr:TagName,'SOC:FECHA_ALTA')
  SELF.Attribute.Set(?SOC:FECHA_ALTA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String25,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String25,RepGen:XML,TargetAttr:TagName,'String25')
  SELF.Attribute.Set(?String25,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:FOLIO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:FOLIO,RepGen:XML,TargetAttr:TagName,'SOC:FOLIO')
  SELF.Attribute.Set(?SOC:FOLIO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String23,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String23,RepGen:XML,TargetAttr:TagName,'String23')
  SELF.Attribute.Set(?String23,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String18,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String18,RepGen:XML,TargetAttr:TagName,'String18')
  SELF.Attribute.Set(?String18,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String14,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String14,RepGen:XML,TargetAttr:TagName,'String14')
  SELF.Attribute.Set(?String14,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String19,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String19,RepGen:XML,TargetAttr:TagName,'String19')
  SELF.Attribute.Set(?String19,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?GLO:FECHA_LARGO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GLO:FECHA_LARGO,RepGen:XML,TargetAttr:TagName,'GLO:FECHA_LARGO')
  SELF.Attribute.Set(?GLO:FECHA_LARGO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagName,'SOC:MATRICULA')
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String26,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String26,RepGen:XML,TargetAttr:TagName,'String26')
  SELF.Attribute.Set(?String26,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String37,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String37,RepGen:XML,TargetAttr:TagName,'String37')
  SELF.Attribute.Set(?String37,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?CON1:LIBRO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?CON1:LIBRO,RepGen:XML,TargetAttr:TagName,'CON1:LIBRO')
  SELF.Attribute.Set(?CON1:LIBRO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String27,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String27,RepGen:XML,TargetAttr:TagName,'String27')
  SELF.Attribute.Set(?String27,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?GLO:LEY,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GLO:LEY,RepGen:XML,TargetAttr:TagName,'GLO:LEY')
  SELF.Attribute.Set(?GLO:LEY,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String29,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String29,RepGen:XML,TargetAttr:TagName,'String29')
  SELF.Attribute.Set(?String29,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?CON1:NRO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?CON1:NRO,RepGen:XML,TargetAttr:TagName,'CON1:NRO')
  SELF.Attribute.Set(?CON1:NRO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?CON1:FECHA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?CON1:FECHA,RepGen:XML,TargetAttr:TagName,'CON1:FECHA')
  SELF.Attribute.Set(?CON1:FECHA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String40,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String40,RepGen:XML,TargetAttr:TagName,'String40')
  SELF.Attribute.Set(?String40,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String24,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String24,RepGen:XML,TargetAttr:TagName,'String24')
  SELF.Attribute.Set(?String24,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String22,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String22,RepGen:XML,TargetAttr:TagName,'String22')
  SELF.Attribute.Set(?String22,RepGen:XML,TargetAttr:TagValueFromText,True)


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  COF:RAZON_SOCIAL = 'Colegio de Psicólogos del Valle Inferior de Rió Negro'
  loc:fecha_Val = CON2:FECHA_HABILITACION + 1824
  ReturnValue = PARENT.TakeRecord()
  PRINT(RPT:Detail)
  RETURN ReturnValue


Previewer.Open PROCEDURE

  CODE
  PARENT.Open
  CREATE(?Menu_eMail,CREATE:Menu)
  ?Menu_eMail{PROP:text} = 'Enviar x eMail'
  ?Menu_eMail{PROP:use} = LASTFIELD()+301
  UNHIDE(?Menu_eMail)
  
  if 'Enviar Imagenes [WMF]' <> '' !!! Activa Envio de Imagen
    CREATE(?EnviarxMailWmf,CREATE:Item,?Menu_eMail)
    ?EnviarxMailwmf{PROP:use} = LASTFIELD()+302
    ?EnviarxMailwmf{PROP:text} = 'Enviar Imagenes [WMF]'
  UNHIDE(?EnviarxMailwmf)
  end
  
  if 'Enviar Reporte en Word' <> '' !!! Activa Envio de Imagen a Word
    CREATE(?EnviarxMailWord,CREATE:Item,?Menu_eMail)
    ?EnviarxMailWord{PROP:use} = LASTFIELD()+303
    ?EnviarxMailWord{PROP:text} = 'Enviar Reporte en Word'
    UNHIDE(?EnviarxMailWord)
  end
  
  if 'Enviar Reporte a Word' <> '' !!! Activa Envio de Imagen a Word
  CREATE(?EnviaraWord,CREATE:Item,?Menu_eMail)
  ?EnviaraWord{PROP:use} = LASTFIELD()+304
  ?EnviaraWord{PROP:text} = 'Enviar Reporte a Word'
  UNHIDE(?EnviaraWord)
  end


Previewer.TakeEvent PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeEvent()
  LocE::GolDesde =1
  LocE::GolHasta =RECORDS(SELF.ImageQueue)
  LocE::Cancelar = False
  case event()
    of EVENT:Accepted
    Case field()
     of ?EnviarxMailWmf
           Do SendMailPrompt
      IF NOT LocE::Cancelar
           FREE(QAtach)
           OPEN(Gol_wo)
           DISPLAY()
           !!!!!!! manejo de WMF
           get(SELF.ImageQueue,POINTER(SELF.ImageQueue))
           loop a# = 1 to RECORDS(SELF.ImageQueue)
           IF a# >=LocE::GolDesde and a# <=LocE::GolHasta
              IF a# > 40 THEN BREAK.
              get(SELF.ImageQueue,a#)
              if self.InPageList(a#)
                 P# = INSTRING('.',SELF.ImageQueue,1,2)
                 LocE::Titulo     = 'CERTIFICADO DE CONSULTORIO'
                 LocE::NombreFile = 'P('&SUB(LocE::Titulo,1,2)&')H'&a#&'.WMF'
                 IF EXISTS(CLIP(LocE::NombreFile)) Then REMOVE(CLIP(LocE::NombreFile)).
                 COPY(SELF.ImageQueue,CLIP(LocE::NombreFile))
                 IF ERRORCODE() THEN MESSAGE(ERROR()).
                 QAtach.Attach = PATH()&'\'& CLIP(LocE::NombreFile)
                 ADD(QAtach)
                 IF ERRORCODE() THEN MESSAGE(ERROR()).
                    LocE::Atach = CLIP(LocE::Atach)&';' & CLIP(LocE::NombreFile)
                 end
              END
           end
           LocE::Flags     = False
           LocE::Subject   = 'CERTIFICADO DE CONSULTORIO'
           LocE::Body      = ''
           CLOSE(Gol_wo)
           LocE::Direccion = GLO:EMAIL
           LocE::Dialogo  = 1
           SAVEPath"   = PATH()
           IF LocE::Dialogo THEN LocE::Flags  =MAPI_DIALOG.
            E#  = SendMail(LocE::Dialogo,LocE::Direccion,LocE::Subject,LocE::Body,LocE::DireccionCC,QAtach)
           SETPATH(SAVEPath")
           POST(Event:CloseWindow)
       END !! NOT LocE::Cancelar
     Of ?EnviaraWord
      Do SendMailPrompt
      IF NOT LocE::Cancelar
          FREE(LocE::Qpar)
          FREE(QAtach)
          LOcE::Qpar.QP:Par  = 'CERTIFICADO DE CONSULTORIO'
          ADD(LocE::Qpar)
          LOcE::Qpar.QP:Par  = false
          ADD(LocE::Qpar)
          LOcE::Qpar.QP:Par  = ''
          ADD(LocE::Qpar)
          LOcE::Qpar.QP:Par  = ''
          ADD(LocE::Qpar)
          LOcE::Qpar.QP:Par  =         0
          ADD(LocE::Qpar)
          OPEN(Gol_wo)
          DISPLAY()
           !!!!!!! manejo de WMF
           get(SELF.ImageQueue,POINTER(SELF.ImageQueue))
           loop a# = 1 to RECORDS(SELF.ImageQueue)
           IF a# >=LocE::GolDesde and a# <=LocE::GolHasta
              IF a# > 40 THEN BREAK.
              get(SELF.ImageQueue,a#)
              if self.InPageList(a#)
                 P# = INSTRING('.',SELF.ImageQueue,1,2)
                 LocE::Titulo     = 'CERTIFICADO DE CONSULTORIO'
                 LocE::NombreFile = 'P('&SUB(LocE::Titulo,1,2)&')H'&a#&'.WMF'
                 IF EXISTS(CLIP(LocE::NombreFile)) Then REMOVE(CLIP(LocE::NombreFile)).
                 COPY(SELF.ImageQueue,CLIP(LocE::NombreFile))
                 IF ERRORCODE() THEN MESSAGE(ERROR()).
                 QAtach.Attach = PATH()&'\'& CLIP(LocE::NombreFile)
                 ADD(QAtach)
                 IF ERRORCODE() THEN MESSAGE(ERROR()).
                    LocE::Atach = CLIP(LocE::Atach)&';' & CLIP(LocE::NombreFile)
                 end
              END
           end
          LocE::FileName = ''
          EXPORTWORD(QAtach,LocE::Qpar,LocE::FileSend)
          SETPATH(SAVEPath")
          CLOSE(Gol_wo)
          POST(Event:CloseWindow)
       END
     of ?EnviarxMailWord
      Do SendMailPrompt
      IF NOT LocE::Cancelar
          FREE(LocE::Qpar)
          FREE(QAtach)
          OPEN(Gol_wo)
          DISPLAY()
           !!!!!!! manejo de WMF
           get(SELF.ImageQueue,POINTER(SELF.ImageQueue))
           loop a# = 1 to RECORDS(SELF.ImageQueue)
           IF a# >=LocE::GolDesde and a# <=LocE::GolHasta
              IF a# > 40 THEN BREAK.
              get(SELF.ImageQueue,a#)
              if self.InPageList(a#)
                 P# = INSTRING('.',SELF.ImageQueue,1,2)
                 LocE::Titulo     = 'CERTIFICADO DE CONSULTORIO'
                 LocE::NombreFile = 'P('&SUB(LocE::Titulo,1,2)&')H'&a#&'.WMF'
                 IF EXISTS(CLIP(LocE::NombreFile)) Then REMOVE(CLIP(LocE::Nombrefile)).
                 COPY(SELF.ImageQueue,CLIP(LocE::Nombrefile))
                 IF ERRORCODE() THEN MESSAGE(ERROR()).
                 QAtach.Attach = PATH()&'\'& CLIP(LocE::nombrefile)
                 ADD(QAtach)
                 IF ERRORCODE() THEN MESSAGE(ERROR()).
                    LocE::Atach = CLIP(LocE::Atach)&';' & CLIP(LocE::nombrefile)
                 end
              END
           end
          LOcE::Qpar.QP:Par  = 'CERTIFICADO DE CONSULTORIO'
          ADD(LocE::Qpar)
          LocE::FileName = ''
          EXPORTWORD(QAtach,LocE::Qpar,LocE::FileSend)
          IF LocE::FileSend
             LocE::Flags     = False
             LocE::Body      = ''
             LocE::Subject   = 'CERTIFICADO DE CONSULTORIO'
             FREE(QAtach)
             QAtach.Attach = PATH() & '\' & Sub(LocE::Subject,1,5) & '.doc'
             ADD(QAtach)
             LocE::Direccion = GLO:EMAIL
             LocE::Dialogo  = 1
             SAVEPath"   = PATH()
             IF LocE::Dialogo THEN LocE::Flags  +=MAPI_DIALOG.
             E#  = SendMail(LocE::Dialogo,LocE::Direccion,LocE::Subject,LocE::Body,LocE::DireccionCC,QAtach)
             SETPATH(SAVEPath")
             CLOSE(Gol_wo)
             POST(Event:CloseWindow)
          END
       END
    END !! CASE Field
  end!Case Event
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
  SELF.SetDocumentInfo('CW Report','Gestion','IMPRIMIR_CERTIFICADO_HABILITACION','IMPRIMIR_CERTIFICADO_HABILITACION','','')
  SELF.SetPagesAsParentBookmark(False)
  SELF.SetScanCopyMode(False)
  SELF.CompressText   = True
  SELF.CompressImages = True

