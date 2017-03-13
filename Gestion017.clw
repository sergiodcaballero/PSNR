

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
                       INCLUDE('GESTION017.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION002.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION012.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Report
!!! Report the AUDITORIA File
!!! </summary>
IMPRIMIR_AUDITORIA PROCEDURE (FILTRO,ORDEN)

Progress:Thermometer BYTE                                  ! 
Process:View         VIEW(AUDITORIA)
                       PROJECT(AUD:ACCION)
                       PROJECT(AUD:FECHA)
                       PROJECT(AUD:HORA)
                       PROJECT(AUD:IDSOCIO)
                       JOIN(SOC:PK_SOCIOS,AUD:IDSOCIO)
                         PROJECT(SOC:MATRICULA)
                         PROJECT(SOC:NOMBRE)
                       END
                     END
ProgressWindow       WINDOW('Reporte de AUDITORIA'),AT(,,142,59),FONT('MS Sans Serif',8,,FONT:regular),DOUBLE,CENTER, |
  GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100),SMOOTH
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancelar'),AT(43,42,55,15),USE(?Progress:Cancel),LEFT,ICON('cancel.ICO'),FLAT,MSG('Cancela Reporte'), |
  TIP('Cancela Reporte')
                     END

Report               REPORT('AUDITORIA Report'),AT(250,854,7750,10333),PRE(RPT),PAPER(PAPER:A4),FONT('MS Sans Serif', |
  8,,FONT:regular),THOUS
                       HEADER,AT(250,250,7750,604),USE(?Header),FONT('MS Sans Serif',8,,FONT:regular)
                         STRING('Reporte de  AUDITORIA'),AT(0,20,7750,220),USE(?ReportTitle),FONT('MS Sans Serif',8, |
  ,FONT:regular),CENTER
                         BOX,AT(0,350,7750,250),USE(?HeaderBox),COLOR(COLOR:Black)
                         STRING('ACCION'),AT(990,385,500,167),USE(?HeaderTitle:1),TRN
                         STRING('COLEGIADO'),AT(4594,385,729,167),USE(?HeaderTitle:2),TRN
                         STRING('FECHA'),AT(6667,385,500,167),USE(?HeaderTitle:3),TRN
                         STRING('HORA'),AT(7219,385,500,167),USE(?HeaderTitle:4),TRN
                       END
Detail                 DETAIL,AT(,,7750,208),USE(?Detail)
                         LINE,AT(0,0,0,210),USE(?DetailLine:0),COLOR(COLOR:Black)
                         LINE,AT(7750,0,0,210),USE(?DetailLine:4),COLOR(COLOR:Black)
                         STRING(@s100),AT(31,21,3646,167),USE(AUD:ACCION),LEFT
                         STRING(@n-7),AT(3750,21,375,167),USE(AUD:IDSOCIO),RIGHT
                         STRING(@d17),AT(6563,21,740,167),USE(AUD:FECHA),RIGHT
                         STRING(@t7),AT(7302,21,406,167),USE(AUD:HORA),RIGHT
                         STRING(@s30),AT(4667,21),USE(SOC:NOMBRE)
                         STRING(@n-7),AT(4219,21),USE(SOC:MATRICULA)
                         LINE,AT(0,210,7750,0),USE(?DetailEndLine),COLOR(COLOR:Black)
                       END
                       FOOTER,AT(250,11188,7750,250),USE(?Footer)
                         STRING('Fecha:'),AT(115,52,344,135),USE(?ReportDatePrompt),FONT('Arial',8,,FONT:regular),TRN
                         STRING('<<-- Date Stamp -->'),AT(490,52,927,135),USE(?ReportDateStamp),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING('Hora:'),AT(1625,52,271,135),USE(?ReportTimePrompt),FONT('Arial',8,,FONT:regular),TRN
                         STRING('<<-- Time Stamp -->'),AT(1927,52,927,135),USE(?ReportTimeStamp),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING(@pPag. <<#p),AT(6950,52,700,135),USE(?PageCount),FONT('Arial',8,,FONT:regular),PAGENO
                       END
                       FORM,AT(250,250,7750,11188),USE(?Form),FONT('MS Sans Serif',8,,FONT:regular)
                         IMAGE,AT(0,0,7750,11188),USE(?FormImage),TILED
                       END
                     END
ProcessSortSelectionVariable         STRING(100)           ! Used in the sort order selection
ProcessSortSelectionCanceled         BYTE                  ! Used in the sort order selection to know if it was canceled
ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
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
ProcessSortSelectionWindow    ROUTINE
 DATA
SortSelectionWindow WINDOW('Selecciona Orden'),AT(,,165,92),FONT('Microsoft Sans Serif',8,,),CENTER,GRAY,DOUBLE
       PROMPT('Seleccion de Orden de Proceso.'),AT(5,4,156,18),FONT(,,,FONT:bold),USE(?SortMessage:Prompt)
       LIST,AT(5,26,155,42),FONT('Microsoft Sans Serif',8,,FONT:bold),USE(ProcessSortSelectionVariable,,?SortSelectionList),VSCROLL,FORMAT('100L@s100@'),FROM('')
       BUTTON('&Aceptar'),AT(51,74,52,14),ICON('SOK.ICO'),MSG('Aceptar'),TIP('Aceptar'),USE(?SButtonOk),LEFT,FLAT
       BUTTON('&Cancelar'),AT(107,74,52,14),ICON('SCANCEL.ICO'),MSG('Cancela operacion'),TIP('Cancela operacion'),USE(?SButtonCancel),LEFT,FLAT
     END
 CODE
      ProcessSortSelectionCanceled=1
      ProcessSortSelectionVariable=''
      OPEN(SortSelectionWindow)
      ?SortSelectionList{PROP:FROM}=''&|
      'PK_AUDITORIA' & |
      '|' & 'FK_AUDITORIA_SOCIOS' & |
      '|' & 'FK_AUDITORIA_USUARIO' & |
      '|' & 'IDX_AUDITRIA_ACCION' & |
      ''
      ?SortSelectionList{PROP:Selected}=1
      ?SortSelectionList{Prop:Alrt,252} = MouseLeft2

      ACCEPT
        CASE EVENT()
        OF Event:OpenWindow
            CYCLE
        OF Event:Timer
            CYCLE
        END
        CASE FIELD()
        OF ?SortSelectionList
          IF KEYCODE() = MouseLeft2
              ProcessSortSelectionCanceled=0
              POST(Event:CloseWindow)
          END
        END
        CASE ACCEPTED()
        OF ?SButtonCancel
            ProcessSortSelectionVariable=''
            ProcessSortSelectionCanceled=1
            POST(Event:CloseWindow)
        OF ?SButtonOk
            ProcessSortSelectionCanceled=0
            POST(Event:CloseWindow)
        END
      END
      CLOSE(SortSelectionWindow)
 IF ProcessSortSelectionCanceled THEN
    ProcessSortSelectionVariable=''
 END
 EXIT

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('IMPRIMIR_AUDITORIA')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Do ProcessSortSelectionWindow
  IF ProcessSortSelectionCanceled THEN
     RETURN LEvel:Fatal
  END
  Relate:AUDITORIA.Open                                    ! File AUDITORIA used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('IMPRIMIR_AUDITORIA',ProgressWindow)        ! Restore window settings from non-volatile store
  TargetSelector.AddItem(XMLReporter.IReportGenerator)
  TargetSelector.AddItem(HTMLReporter.IReportGenerator)
  TargetSelector.AddItem(TXTReporter.IReportGenerator)
  TargetSelector.AddItem(PDFReporter.IReportGenerator)
  SELF.AddItem(TargetSelector)
  ThisReport.Init(Process:View, Relate:AUDITORIA, ?Progress:PctText, Progress:Thermometer)
  ThisReport.AddSortOrder()
  IF (UPPER(CLIP(ProcessSortSelectionVariable))=UPPER('PK_AUDITORIA')) THEN
     ThisReport.AppendOrder('+AUD:IDAUDITORIA')
  ELSIF (UPPER(CLIP(ProcessSortSelectionVariable))=UPPER('FK_AUDITORIA_SOCIOS')) THEN
     ThisReport.AppendOrder('+AUD:IDSOCIO')
  ELSIF (UPPER(CLIP(ProcessSortSelectionVariable))=UPPER('FK_AUDITORIA_USUARIO')) THEN
     ThisReport.AppendOrder('+AUD:IDUSUARIO')
  ELSIF (UPPER(CLIP(ProcessSortSelectionVariable))=UPPER('IDX_AUDITRIA_ACCION')) THEN
     ThisReport.AppendOrder('+AUD:ACCION')
  END
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:AUDITORIA.SetQuickScan(1,Propagate:OneMany)
  ProgressWindow{PROP:Timer} = 10                          ! Assign timer interval
  SELF.SkipPreview = False
  SELF.Zoom = PageWidth
  Previewer.SetINIManager(INIMgr)
  Previewer.AllowUserZoom = True
  Previewer.Maximize = True
  SELF.SetAlerts()
  THISREPORT.SETFILTER(FILTRO)
  THISREPORT.SETORDER(ORDEN)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:AUDITORIA.Close
  END
  IF SELF.Opened
    INIMgr.Update('IMPRIMIR_AUDITORIA',ProgressWindow)     ! Save window data to non-volatile store
  END
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
  SELF.Attribute.Set(?ReportTitle,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ReportTitle,RepGen:XML,TargetAttr:TagName,'ReportTitle')
  SELF.Attribute.Set(?ReportTitle,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?HeaderTitle:1,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?HeaderTitle:1,RepGen:XML,TargetAttr:TagName,'HeaderTitle:1')
  SELF.Attribute.Set(?HeaderTitle:1,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?HeaderTitle:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?HeaderTitle:2,RepGen:XML,TargetAttr:TagName,'HeaderTitle:2')
  SELF.Attribute.Set(?HeaderTitle:2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?HeaderTitle:3,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?HeaderTitle:3,RepGen:XML,TargetAttr:TagName,'HeaderTitle:3')
  SELF.Attribute.Set(?HeaderTitle:3,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?HeaderTitle:4,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?HeaderTitle:4,RepGen:XML,TargetAttr:TagName,'HeaderTitle:4')
  SELF.Attribute.Set(?HeaderTitle:4,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?AUD:ACCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?AUD:ACCION,RepGen:XML,TargetAttr:TagName,'AUD:ACCION')
  SELF.Attribute.Set(?AUD:ACCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?AUD:IDSOCIO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?AUD:IDSOCIO,RepGen:XML,TargetAttr:TagName,'AUD:IDSOCIO')
  SELF.Attribute.Set(?AUD:IDSOCIO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?AUD:FECHA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?AUD:FECHA,RepGen:XML,TargetAttr:TagName,'AUD:FECHA')
  SELF.Attribute.Set(?AUD:FECHA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?AUD:HORA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?AUD:HORA,RepGen:XML,TargetAttr:TagName,'AUD:HORA')
  SELF.Attribute.Set(?AUD:HORA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagName,'SOC:NOMBRE')
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagName,'SOC:MATRICULA')
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagValueFromText,True)
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
  SELF.Attribute.Set(?PageCount,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PageCount,RepGen:XML,TargetAttr:TagName,'PageCount')
  SELF.Attribute.Set(?PageCount,RepGen:XML,TargetAttr:TagValueFromText,True)


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
  SELF.SetCheckBoxString('[X]','[_]')
  SELF.SetRadioButtonString('(*)','(_)')
  SELF.SetLineString('|','|','-','-','/','\','\','/')
  SELF.SetTextFillString(' ',CHR(176),CHR(177),CHR(178),CHR(219))
  SELF.SetOmitGraph(False)


PDFReporter.SetUp PROCEDURE

  CODE
  PARENT.SetUp
  SELF.SetFileName('')
  SELF.SetDocumentInfo('CW Report','Gestion','IMPRIMIR_AUDITORIA','IMPRIMIR_AUDITORIA','','')
  SELF.SetPagesAsParentBookmark(False)
  SELF.SetScanCopyMode(False)
  SELF.CompressText   = True
  SELF.CompressImages = True

!!! <summary>
!!! Generated from procedure template - Source
!!! CARGA EMAIL SOCIO
!!! </summary>
CARGA_EMAIL          PROCEDURE                             ! Declare Procedure

  CODE
    !!! BUSCA EL CORREO ELECTRONICO PARA ENVIAR POR EMAIL
    SOC:IDSOCIO = GLO:IDSOCIO 
    GET (SOCIOS,SOC:PK_SOCIOS)
    IF ERRORCODE()= 35 THEN
        MESSAGE('NO SE ENCONTRO EL SOCIO')
    ELSE
        GLO:EMAIL = SOC:EMAIL
    END
!!! <summary>
!!! Generated from procedure template - Window
!!! Window
!!! </summary>
CUPON_DE_PAGO3:IMPRIMIR PROCEDURE 

BRW6::View:Browse    VIEW(LOTE)
                       PROJECT(LOT:IDLOTE)
                       PROJECT(LOT:FECHA)
                       PROJECT(LOT:HORA)
                     END
Queue:Browse         QUEUE                            !Queue declaration for browse/combo box using ?List
LOT:IDLOTE             LIKE(LOT:IDLOTE)               !List box control field - type derived from field
LOT:FECHA              LIKE(LOT:FECHA)                !List box control field - type derived from field
LOT:HORA               LIKE(LOT:HORA)                 !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Imprimir Cupones'),AT(,,255,186),FONT('Arial',8,,FONT:regular),RESIZE,CENTER,GRAY, |
  IMM,MDI,HLP('CUPON_DE_PAGO3:IMPRIMIR'),SYSTEM
                       GROUP('Imprimir Lote'),AT(4,4,247,105),USE(?Group1),BOXED
                         LIST,AT(7,15,241,68),USE(?List),FORMAT('56L(2)|M~IDLOTE~@n-7@69L(2)|M~FECHA~@d17@20L(2)' & |
  '|M~HORA~@t7@'),FROM(Queue:Browse),IMM,MSG('Browsing Records'),VCR
                         BUTTON('Imprimir Lote '),AT(7,87,63,20),USE(?Button3),LEFT,ICON(ICON:Print1),FLAT
                       END
                       GROUP('Por Odontólogo'),AT(3,110,249,55),USE(?Group2),BOXED
                         PROMPT('IDSOCIO:'),AT(15,124),USE(?GLO:IDSOCIO:Prompt)
                         ENTRY(@n-14),AT(50,124,60,10),USE(GLO:IDSOCIO),REQ
                         BUTTON('...'),AT(112,123,12,12),USE(?CallLookup)
                         STRING(@s30),AT(127,124),USE(SOC:NOMBRE)
                         BUTTON('Imprimir'),AT(14,147,59,14),USE(?Button5),LEFT,ICON(ICON:Print1),FLAT
                       END
                       BUTTON('&Cancelar'),AT(189,167,62,14),USE(?Cancel),LEFT,ICON('cancelar.ico'),CURSOR('mano.cur'), |
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

BRW6                 CLASS(BrowseClass)                    ! Browse using ?List
Q                      &Queue:Browse                  !Reference to browse queue
                     END

BRW6::Sort0:Locator  StepLocatorClass                      ! Default Locator

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
  GlobalErrors.SetProcedureName('CUPON_DE_PAGO3:IMPRIMIR')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?List
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:LOTE.Open                                         ! File LOTE used by this procedure, so make sure it's RelationManager is open
  Relate:SOCIOS.Open                                       ! File SOCIOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW6.Init(?List,Queue:Browse.ViewPosition,BRW6::View:Browse,Queue:Browse,Relate:LOTE,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  BRW6.Q &= Queue:Browse
  BRW6.RetainRow = 0
  BRW6.AddSortOrder(,LOT:PK_LOTE)                          ! Add the sort order for LOT:PK_LOTE for sort order 1
  BRW6.AddLocator(BRW6::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW6::Sort0:Locator.Init(,LOT:IDLOTE,,BRW6)              ! Initialize the browse locator using  using key: LOT:PK_LOTE , LOT:IDLOTE
  BRW6.AddField(LOT:IDLOTE,BRW6.Q.LOT:IDLOTE)              ! Field LOT:IDLOTE is a hot field or requires assignment from browse
  BRW6.AddField(LOT:FECHA,BRW6.Q.LOT:FECHA)                ! Field LOT:FECHA is a hot field or requires assignment from browse
  BRW6.AddField(LOT:HORA,BRW6.Q.LOT:HORA)                  ! Field LOT:HORA is a hot field or requires assignment from browse
  INIMgr.Fetch('CUPON_DE_PAGO3:IMPRIMIR',QuickWindow)      ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW6.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:LOTE.Close
    Relate:SOCIOS.Close
  END
  IF SELF.Opened
    INIMgr.Update('CUPON_DE_PAGO3:IMPRIMIR',QuickWindow)   ! Save window data to non-volatile store
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
    SelectSOCIOS
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
      GLO:IDLOTE = LOT:IDLOTE
    OF ?Button5
      CARGA_EMAIL()
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Button3
      ThisWindow.Update()
      START(CUPON_DE_PAGO4:IMPRIMIR, 25000)
      ThisWindow.Reset
    OF ?GLO:IDSOCIO
      IF GLO:IDSOCIO OR ?GLO:IDSOCIO{PROP:Req}
        SOC:IDSOCIO = GLO:IDSOCIO
        IF Access:SOCIOS.TryFetch(SOC:PK_SOCIOS)
          IF SELF.Run(1,SelectRecord) = RequestCompleted
            GLO:IDSOCIO = SOC:IDSOCIO
          ELSE
            SELECT(?GLO:IDSOCIO)
            CYCLE
          END
        END
      END
      ThisWindow.Reset()
    OF ?CallLookup
      ThisWindow.Update()
      SOC:IDSOCIO = GLO:IDSOCIO
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        GLO:IDSOCIO = SOC:IDSOCIO
      END
      ThisWindow.Reset(1)
    OF ?Button5
      ThisWindow.Update()
      START(CUPON_DE_PAGO5:IMPRIMIR, 25000)
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
CUPON_DE_PAGO5:IMPRIMIR PROCEDURE 

Progress:Thermometer BYTE                                  ! 
LOC:FECHA_VENCIMIENTO LONG                                 ! 
L:NroReg             LONG                                  ! 
Process:View         VIEW(FACTURAXCUPON)
                       PROJECT(FAC2:IDSOCIO)
                       PROJECT(FAC2:IDFACTURA)
                       JOIN(SOC:PK_SOCIOS,FAC2:IDSOCIO)
                         PROJECT(SOC:IDSOCIO)
                         PROJECT(SOC:MATRICULA)
                         PROJECT(SOC:NOMBRE)
                       END
                       JOIN(FAC:PK_FACTURA,FAC2:IDFACTURA)
                         PROJECT(FAC:ANO)
                         PROJECT(FAC:IDFACTURA)
                         PROJECT(FAC:MES)
                       END
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

Report               REPORT,AT(302,240,7885,13490),PRE(RPT),PAPER(PAPER:LEGAL),FONT('Arial',8,,FONT:regular,CHARSET:ANSI), |
  THOUS
Detail                 DETAIL,AT(,,,3177),USE(?Detail)
                         IMAGE('Logo_nombre.JPG'),AT(63,177,2500,531),USE(?Image1)
                         STRING(@P##-########-#P),AT(3083,719),USE(GLO:CUIT,,?GLO:CUIT:2)
                         IMAGE('Logo_nombre.JPG'),AT(2740,167,2500,531),USE(?Image2)
                         IMAGE('Logo_nombre.JPG'),AT(5344,167,2500,531),USE(?Image3)
                         STRING(@n-14),AT(7052,719),USE(FAC:IDFACTURA,,?FAC:IDFACTURA:3),LEFT(1)
                         STRING(@P##-########-#P),AT(375,719),USE(GLO:CUIT),TRN
                         STRING(@n-14),AT(1844,719),USE(FAC:IDFACTURA),LEFT(1)
                         STRING(@n-14),AT(4479,719),USE(FAC:IDFACTURA,,?FAC:IDFACTURA:2),LEFT(1)
                         STRING('C.U.I.T: '),AT(0,719),USE(?String2),TRN
                         STRING('C.U.I.T: '),AT(2688,719),USE(?String24),TRN
                         STRING('C.U.I.T: '),AT(5323,719),USE(?String25),TRN
                         STRING(@P##-########-#P),AT(5698,719),USE(GLO:CUIT,,?GLO:CUIT:3)
                         STRING('Nro. Cupón:'),AT(3906,719),USE(?String67),TRN
                         STRING('Nro. Cupón:'),AT(1260,719),USE(?String66),TRN
                         LINE,AT(2656,10,0,3156),USE(?Line1),COLOR(COLOR:Black)
                         STRING('Cta. Cte. Nro.'),AT(10,938),USE(?String3),TRN
                         STRING('Cta. Cte. Nro.'),AT(2688,938),USE(?String26),TRN
                         STRING('Cta. Cte. Nro.'),AT(5344,938),USE(?String27),TRN
                         STRING('Nro. Cupón:'),AT(6531,719),USE(?String68),TRN
                         STRING(@s255),AT(10,1125,2646,177),USE(GLO:DIRECCION),TRN
                         STRING(@s255),AT(5333,1125,2510,177),USE(GLO:DIRECCION,,?GLO:DIRECCION:3),TRN
                         STRING(@s255),AT(2688,1125,2625,177),USE(GLO:DIRECCION,,?GLO:DIRECCION:2),TRN
                         LINE,AT(5313,3167,0,-3156),USE(?Line2),COLOR(COLOR:Black)
                         LINE,AT(10,3156,7865,0),USE(?Line3),COLOR(COLOR:Black)
                         STRING('Apellido y Nombre:'),AT(10,1313),USE(?String5),TRN
                         STRING('Apellido y Nombre:'),AT(5333,1313),USE(?String34),TRN
                         STRING('Apellido y Nombre:'),AT(2688,1313),USE(?String35),TRN
                         STRING(@s30),AT(5333,1500,2063,177),USE(SOC:NOMBRE,,?SOC:NOMBRE:3),LEFT(1)
                         STRING('BANCO MACRO BANSUD Convenio Nro.: XXXXX'),AT(2708,0),USE(?String22),TRN
                         STRING(@s30),AT(10,1500,2010,177),USE(SOC:NOMBRE),LEFT(1)
                         STRING(@s30),AT(2688,1500),USE(SOC:NOMBRE,,?SOC:NOMBRE:2),LEFT(1)
                         STRING('BANCO MACRO BANSUD Convenio Nro.: XXXXX'),AT(5333,0),USE(?String23),TRN
                         STRING(@s7),AT(354,1688),USE(SOC:IDSOCIO)
                         STRING('Mat.:'),AT(917,1688),USE(?String9),TRN
                         STRING('Socio:'),AT(10,1688),USE(?String7),TRN
                         STRING('Periodo:'),AT(10,1875),USE(?String11),TRN
                         STRING(@P/ ####P),AT(760,1875),USE(FAC:ANO),RIGHT(1)
                         STRING('Periodo:'),AT(2688,1875),USE(?String45),TRN
                         STRING(@s3),AT(3156,1875),USE(FAC:MES,,?FAC:MES:3),RIGHT(1)
                         STRING('Peridodo:'),AT(5344,1875),USE(?String50),TRN
                         STRING(@s3),AT(500,1875),USE(FAC:MES,,?FAC:MES:2),RIGHT(1)
                         STRING(@s7),AT(3875,1688),USE(SOC:MATRICULA,,?SOC:MATRICULA:3)
                         STRING('Vencimiento:'),AT(1250,1875),USE(?String15),TRN
                         STRING('Vencimiento:'),AT(3927,1875),USE(?String51),TRN
                         STRING(@s3),AT(5896,1875),USE(FAC:MES,,?FAC:MES:4),RIGHT(1)
                         STRING(@P/ ####P),AT(3458,1875),USE(FAC:ANO,,?FAC:ANO:2),RIGHT(1)
                         STRING(@P/ ####P),AT(6167,1875),USE(FAC:ANO,,?FAC:ANO:3),RIGHT(1)
                         BOX,AT(948,2104,740,198),USE(?Box6),COLOR(COLOR:Black)
                         STRING(@D6),AT(7250,1875),USE(LOC:FECHA_VENCIMIENTO,,?LOC:FECHA_VENCIMIENTO:3),RIGHT(1)
                         BOX,AT(6260,2104,740,198),USE(?Box12),COLOR(COLOR:Black)
                         STRING(@D6),AT(4688,1875),USE(LOC:FECHA_VENCIMIENTO,,?LOC:FECHA_VENCIMIENTO:2),RIGHT(1)
                         STRING('Vencimiento:'),AT(6604,1875),USE(?String52),TRN
                         STRING(@D6),AT(1917,1875),USE(LOC:FECHA_VENCIMIENTO),RIGHT(1)
                         STRING('Cuota Social:'),AT(10,2115),USE(?String16),TRN
                         STRING('Cuota Social:'),AT(5344,2115),USE(?String54),TRN
                         BOX,AT(6260,2323,740,198),USE(?Box11),COLOR(COLOR:Black)
                         BOX,AT(3750,2323,740,198),USE(?Box8),COLOR(COLOR:Black)
                         STRING('Cuota Convenio:'),AT(2688,2344),USE(?String69),TRN
                         STRING('Cuota Convenio:'),AT(5344,2344),USE(?String70),TRN
                         BOX,AT(6260,2542,740,198),USE(?Box10),COLOR(COLOR:Black)
                         BOX,AT(3750,2542,740,198),USE(?Box7),COLOR(COLOR:Black)
                         STRING('Cuota Social:'),AT(2688,2115),USE(?String53),TRN
                         BOX,AT(3750,2104,740,198),USE(?Box9),COLOR(COLOR:Black)
                         BOX,AT(938,2323,740,198),USE(?Box5),COLOR(COLOR:Black)
                         STRING('Cuota Convenio:'),AT(10,2344),USE(?String65),TRN
                         BOX,AT(938,2542,740,198),USE(?Box4),COLOR(COLOR:Black)
                         STRING('Total Depositado:'),AT(5344,2781),USE(?String62),TRN
                         STRING('Talón Para el Socio'),AT(5969,2990),USE(?String64),TRN
                         STRING('Talón Para el Colegio de Odontólogos'),AT(3094,2990),USE(?String63),TRN
                         BOX,AT(6260,2771,740,198),USE(?Box3),COLOR(COLOR:Black)
                         STRING('Descuento:'),AT(2688,2552),USE(?String59),TRN
                         STRING('Descuento:'),AT(5344,2552),USE(?String60),TRN
                         STRING('Descuento:'),AT(10,2552),USE(?String19),TRN
                         BOX,AT(938,2771,740,198),USE(?Box1),COLOR(COLOR:Black)
                         BOX,AT(3750,2771,740,198),USE(?Box2),COLOR(COLOR:Black)
                         STRING('Total Depositado:'),AT(10,2781),USE(?String20),TRN
                         STRING('Total Depositado:'),AT(2688,2781),USE(?String61),TRN
                         STRING('Talón Para el Banco'),AT(365,2990),USE(?String21),TRN
                         STRING(@s7),AT(1208,1688),USE(SOC:MATRICULA)
                         STRING(@s7),AT(5688,1688),USE(SOC:IDSOCIO,,?SOC:IDSOCIO:3)
                         STRING('Socio:'),AT(5344,1688),USE(?String39),TRN
                         STRING('Mat.:'),AT(3615,1688),USE(?String38),TRN
                         STRING('Socio:'),AT(2688,1688),USE(?String37),TRN
                         STRING(@s7),AT(3010,1688),USE(SOC:IDSOCIO,,?SOC:IDSOCIO:2)
                         STRING('Mat.:'),AT(6375,1688),USE(?String40),TRN
                         STRING(@s7),AT(6625,1688),USE(SOC:MATRICULA,,?SOC:MATRICULA:2)
                         STRING('BANCO MACRO BANSUD Convenio Nro.: XXXXX'),AT(10,0),USE(?String1),FONT(,8),TRN
                       END
                       FORM,AT(292,240,7906,13500),USE(?Form)
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
  GlobalErrors.SetProcedureName('CUPON_DE_PAGO5:IMPRIMIR')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:FACTURAXCUPON.Open                                ! File FACTURAXCUPON used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('CUPON_DE_PAGO5:IMPRIMIR',ProgressWindow)   ! Restore window settings from non-volatile store
  TargetSelector.AddItem(XMLReporter.IReportGenerator)
  TargetSelector.AddItem(HTMLReporter.IReportGenerator)
  TargetSelector.AddItem(TXTReporter.IReportGenerator)
  TargetSelector.AddItem(PDFReporter.IReportGenerator)
  SELF.AddItem(TargetSelector)
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisReport.Init(Process:View, Relate:FACTURAXCUPON, ?Progress:PctText, Progress:Thermometer, ProgressMgr, FAC2:IDSOCIO)
  ThisReport.AddSortOrder(FAC2:FK_FACTURAXCUPON_SOCIO)
  ThisReport.AddRange(FAC2:IDSOCIO,GLO:IDSOCIO)
  ThisReport.SetFilter('FAC:ESTADO = ''''')
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:FACTURAXCUPON.SetQuickScan(1,Propagate:OneMany)
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
    Relate:FACTURAXCUPON.Close
  END
  IF SELF.Opened
    INIMgr.Update('CUPON_DE_PAGO5:IMPRIMIR',ProgressWindow) ! Save window data to non-volatile store
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
  SELF.Attribute.Set(?GLO:CUIT:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GLO:CUIT:2,RepGen:XML,TargetAttr:TagName,'GLO:CUIT:2')
  SELF.Attribute.Set(?GLO:CUIT:2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?FAC:IDFACTURA:3,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?FAC:IDFACTURA:3,RepGen:XML,TargetAttr:TagName,'FAC:IDFACTURA:3')
  SELF.Attribute.Set(?FAC:IDFACTURA:3,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?GLO:CUIT,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GLO:CUIT,RepGen:XML,TargetAttr:TagName,'GLO:CUIT')
  SELF.Attribute.Set(?GLO:CUIT,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?FAC:IDFACTURA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?FAC:IDFACTURA,RepGen:XML,TargetAttr:TagName,'FAC:IDFACTURA')
  SELF.Attribute.Set(?FAC:IDFACTURA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?FAC:IDFACTURA:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?FAC:IDFACTURA:2,RepGen:XML,TargetAttr:TagName,'FAC:IDFACTURA:2')
  SELF.Attribute.Set(?FAC:IDFACTURA:2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String2,RepGen:XML,TargetAttr:TagName,'String2')
  SELF.Attribute.Set(?String2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String24,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String24,RepGen:XML,TargetAttr:TagName,'String24')
  SELF.Attribute.Set(?String24,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String25,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String25,RepGen:XML,TargetAttr:TagName,'String25')
  SELF.Attribute.Set(?String25,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?GLO:CUIT:3,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GLO:CUIT:3,RepGen:XML,TargetAttr:TagName,'GLO:CUIT:3')
  SELF.Attribute.Set(?GLO:CUIT:3,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String67,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String67,RepGen:XML,TargetAttr:TagName,'String67')
  SELF.Attribute.Set(?String67,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String66,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String66,RepGen:XML,TargetAttr:TagName,'String66')
  SELF.Attribute.Set(?String66,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String3,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String3,RepGen:XML,TargetAttr:TagName,'String3')
  SELF.Attribute.Set(?String3,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String26,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String26,RepGen:XML,TargetAttr:TagName,'String26')
  SELF.Attribute.Set(?String26,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String27,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String27,RepGen:XML,TargetAttr:TagName,'String27')
  SELF.Attribute.Set(?String27,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String68,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String68,RepGen:XML,TargetAttr:TagName,'String68')
  SELF.Attribute.Set(?String68,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?GLO:DIRECCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GLO:DIRECCION,RepGen:XML,TargetAttr:TagName,'GLO:DIRECCION')
  SELF.Attribute.Set(?GLO:DIRECCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?GLO:DIRECCION:3,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GLO:DIRECCION:3,RepGen:XML,TargetAttr:TagName,'GLO:DIRECCION:3')
  SELF.Attribute.Set(?GLO:DIRECCION:3,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?GLO:DIRECCION:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GLO:DIRECCION:2,RepGen:XML,TargetAttr:TagName,'GLO:DIRECCION:2')
  SELF.Attribute.Set(?GLO:DIRECCION:2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String5,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String5,RepGen:XML,TargetAttr:TagName,'String5')
  SELF.Attribute.Set(?String5,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String34,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String34,RepGen:XML,TargetAttr:TagName,'String34')
  SELF.Attribute.Set(?String34,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String35,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String35,RepGen:XML,TargetAttr:TagName,'String35')
  SELF.Attribute.Set(?String35,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:NOMBRE:3,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:NOMBRE:3,RepGen:XML,TargetAttr:TagName,'SOC:NOMBRE:3')
  SELF.Attribute.Set(?SOC:NOMBRE:3,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String22,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String22,RepGen:XML,TargetAttr:TagName,'String22')
  SELF.Attribute.Set(?String22,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagName,'SOC:NOMBRE')
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:NOMBRE:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:NOMBRE:2,RepGen:XML,TargetAttr:TagName,'SOC:NOMBRE:2')
  SELF.Attribute.Set(?SOC:NOMBRE:2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String23,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String23,RepGen:XML,TargetAttr:TagName,'String23')
  SELF.Attribute.Set(?String23,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:IDSOCIO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:IDSOCIO,RepGen:XML,TargetAttr:TagName,'SOC:IDSOCIO')
  SELF.Attribute.Set(?SOC:IDSOCIO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String9,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String9,RepGen:XML,TargetAttr:TagName,'String9')
  SELF.Attribute.Set(?String9,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String7,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String7,RepGen:XML,TargetAttr:TagName,'String7')
  SELF.Attribute.Set(?String7,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String11,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String11,RepGen:XML,TargetAttr:TagName,'String11')
  SELF.Attribute.Set(?String11,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?FAC:ANO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?FAC:ANO,RepGen:XML,TargetAttr:TagName,'FAC:ANO')
  SELF.Attribute.Set(?FAC:ANO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String45,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String45,RepGen:XML,TargetAttr:TagName,'String45')
  SELF.Attribute.Set(?String45,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?FAC:MES:3,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?FAC:MES:3,RepGen:XML,TargetAttr:TagName,'FAC:MES:3')
  SELF.Attribute.Set(?FAC:MES:3,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String50,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String50,RepGen:XML,TargetAttr:TagName,'String50')
  SELF.Attribute.Set(?String50,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?FAC:MES:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?FAC:MES:2,RepGen:XML,TargetAttr:TagName,'FAC:MES:2')
  SELF.Attribute.Set(?FAC:MES:2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:MATRICULA:3,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:MATRICULA:3,RepGen:XML,TargetAttr:TagName,'SOC:MATRICULA:3')
  SELF.Attribute.Set(?SOC:MATRICULA:3,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String15,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String15,RepGen:XML,TargetAttr:TagName,'String15')
  SELF.Attribute.Set(?String15,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String51,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String51,RepGen:XML,TargetAttr:TagName,'String51')
  SELF.Attribute.Set(?String51,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?FAC:MES:4,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?FAC:MES:4,RepGen:XML,TargetAttr:TagName,'FAC:MES:4')
  SELF.Attribute.Set(?FAC:MES:4,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?FAC:ANO:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?FAC:ANO:2,RepGen:XML,TargetAttr:TagName,'FAC:ANO:2')
  SELF.Attribute.Set(?FAC:ANO:2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?FAC:ANO:3,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?FAC:ANO:3,RepGen:XML,TargetAttr:TagName,'FAC:ANO:3')
  SELF.Attribute.Set(?FAC:ANO:3,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?LOC:FECHA_VENCIMIENTO:3,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?LOC:FECHA_VENCIMIENTO:3,RepGen:XML,TargetAttr:TagName,'LOC:FECHA_VENCIMIENTO:3')
  SELF.Attribute.Set(?LOC:FECHA_VENCIMIENTO:3,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?LOC:FECHA_VENCIMIENTO:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?LOC:FECHA_VENCIMIENTO:2,RepGen:XML,TargetAttr:TagName,'LOC:FECHA_VENCIMIENTO:2')
  SELF.Attribute.Set(?LOC:FECHA_VENCIMIENTO:2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String52,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String52,RepGen:XML,TargetAttr:TagName,'String52')
  SELF.Attribute.Set(?String52,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?LOC:FECHA_VENCIMIENTO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?LOC:FECHA_VENCIMIENTO,RepGen:XML,TargetAttr:TagName,'LOC:FECHA_VENCIMIENTO')
  SELF.Attribute.Set(?LOC:FECHA_VENCIMIENTO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String16,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String16,RepGen:XML,TargetAttr:TagName,'String16')
  SELF.Attribute.Set(?String16,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String54,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String54,RepGen:XML,TargetAttr:TagName,'String54')
  SELF.Attribute.Set(?String54,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String69,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String69,RepGen:XML,TargetAttr:TagName,'String69')
  SELF.Attribute.Set(?String69,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String70,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String70,RepGen:XML,TargetAttr:TagName,'String70')
  SELF.Attribute.Set(?String70,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String53,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String53,RepGen:XML,TargetAttr:TagName,'String53')
  SELF.Attribute.Set(?String53,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String65,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String65,RepGen:XML,TargetAttr:TagName,'String65')
  SELF.Attribute.Set(?String65,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String62,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String62,RepGen:XML,TargetAttr:TagName,'String62')
  SELF.Attribute.Set(?String62,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String64,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String64,RepGen:XML,TargetAttr:TagName,'String64')
  SELF.Attribute.Set(?String64,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String63,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String63,RepGen:XML,TargetAttr:TagName,'String63')
  SELF.Attribute.Set(?String63,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String59,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String59,RepGen:XML,TargetAttr:TagName,'String59')
  SELF.Attribute.Set(?String59,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String60,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String60,RepGen:XML,TargetAttr:TagName,'String60')
  SELF.Attribute.Set(?String60,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String19,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String19,RepGen:XML,TargetAttr:TagName,'String19')
  SELF.Attribute.Set(?String19,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String20,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String20,RepGen:XML,TargetAttr:TagName,'String20')
  SELF.Attribute.Set(?String20,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String61,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String61,RepGen:XML,TargetAttr:TagName,'String61')
  SELF.Attribute.Set(?String61,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String21,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String21,RepGen:XML,TargetAttr:TagName,'String21')
  SELF.Attribute.Set(?String21,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagName,'SOC:MATRICULA')
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:IDSOCIO:3,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:IDSOCIO:3,RepGen:XML,TargetAttr:TagName,'SOC:IDSOCIO:3')
  SELF.Attribute.Set(?SOC:IDSOCIO:3,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String39,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String39,RepGen:XML,TargetAttr:TagName,'String39')
  SELF.Attribute.Set(?String39,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String38,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String38,RepGen:XML,TargetAttr:TagName,'String38')
  SELF.Attribute.Set(?String38,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String37,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String37,RepGen:XML,TargetAttr:TagName,'String37')
  SELF.Attribute.Set(?String37,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:IDSOCIO:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:IDSOCIO:2,RepGen:XML,TargetAttr:TagName,'SOC:IDSOCIO:2')
  SELF.Attribute.Set(?SOC:IDSOCIO:2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String40,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String40,RepGen:XML,TargetAttr:TagName,'String40')
  SELF.Attribute.Set(?String40,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:MATRICULA:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:MATRICULA:2,RepGen:XML,TargetAttr:TagName,'SOC:MATRICULA:2')
  SELF.Attribute.Set(?SOC:MATRICULA:2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String1,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String1,RepGen:XML,TargetAttr:TagName,'String1')
  SELF.Attribute.Set(?String1,RepGen:XML,TargetAttr:TagValueFromText,True)


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  LOC:FECHA_VENCIMIENTO = DATE(FAC:MES,10,FAC:ANO)
  TOMA# = LOC:FECHA_VENCIMIENTO +30
  LOC:FECHA_VENCIMIENTO = DATE(MONTH(TOMA#),10,YEAR(TOMA#))
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
                 LocE::Titulo     = 'CUPON DE PAGO DE CUOTA'
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
           LocE::Subject   = 'CUPON DE PAGO DE CUOTA'
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
          LOcE::Qpar.QP:Par  = 'CUPON DE PAGO DE CUOTA'
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
                 LocE::Titulo     = 'CUPON DE PAGO DE CUOTA'
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
                 LocE::Titulo     = 'CUPON DE PAGO DE CUOTA'
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
          LOcE::Qpar.QP:Par  = 'CUPON DE PAGO DE CUOTA'
          ADD(LocE::Qpar)
          LocE::FileName = ''
          EXPORTWORD(QAtach,LocE::Qpar,LocE::FileSend)
          IF LocE::FileSend
             LocE::Flags     = False
             LocE::Body      = ''
             LocE::Subject   = 'CUPON DE PAGO DE CUOTA'
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
  SELF.SetDocumentInfo('CW Report','Gestion','CUPON_DE_PAGO4:IMPRIMIR','CUPON_DE_PAGO4:IMPRIMIR','','')
  SELF.SetPagesAsParentBookmark(False)
  SELF.SetScanCopyMode(False)
  SELF.CompressText   = True
  SELF.CompressImages = True

!!! <summary>
!!! Generated from procedure template - Report
!!! </summary>
CUPON_DE_PAGO4:IMPRIMIR PROCEDURE 

Progress:Thermometer BYTE                                  ! 
LOC:FECHA_VENCIMIENTO LONG                                 ! 
L:NroReg             LONG                                  ! 
Process:View         VIEW(FACTURAXCUPON)
                       PROJECT(FAC2:IDLOTE)
                       PROJECT(FAC2:IDSOCIO)
                       PROJECT(FAC2:IDFACTURA)
                       JOIN(SOC:PK_SOCIOS,FAC2:IDSOCIO)
                         PROJECT(SOC:IDSOCIO)
                         PROJECT(SOC:MATRICULA)
                         PROJECT(SOC:NOMBRE)
                       END
                       JOIN(FAC:PK_FACTURA,FAC2:IDFACTURA)
                         PROJECT(FAC:ANO)
                         PROJECT(FAC:IDFACTURA)
                         PROJECT(FAC:MES)
                       END
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

Report               REPORT,AT(302,240,7885,13490),PRE(RPT),PAPER(PAPER:LEGAL),FONT('Arial',8,,FONT:regular,CHARSET:ANSI), |
  THOUS
Detail                 DETAIL,AT(,,,3177),USE(?Detail)
                         IMAGE('Logo_nombre.jpg'),AT(63,177,2500,531),USE(?Image1)
                         STRING(@P##-########-#P),AT(3083,719),USE(GLO:CUIT,,?GLO:CUIT:2)
                         IMAGE('Logo_nombre.jpg'),AT(2740,167,2500,531),USE(?Image2)
                         IMAGE('Logo_nombre.jpg'),AT(5344,167,2500,531),USE(?Image3)
                         STRING(@n-14),AT(7052,719),USE(FAC:IDFACTURA,,?FAC:IDFACTURA:3),LEFT(1)
                         STRING(@P##-########-#P),AT(375,719),USE(GLO:CUIT),TRN
                         STRING(@n-14),AT(1844,719),USE(FAC:IDFACTURA),LEFT(1)
                         STRING(@n-14),AT(4479,719),USE(FAC:IDFACTURA,,?FAC:IDFACTURA:2),LEFT(1)
                         STRING('C.U.I.T: '),AT(0,719),USE(?String2),TRN
                         STRING('C.U.I.T: '),AT(2688,719),USE(?String24),TRN
                         STRING('C.U.I.T: '),AT(5323,719),USE(?String25),TRN
                         STRING(@P##-########-#P),AT(5698,719),USE(GLO:CUIT,,?GLO:CUIT:3)
                         STRING('Nro. Cupón:'),AT(3906,719),USE(?String67),TRN
                         STRING('Nro. Cupón:'),AT(1260,719),USE(?String66),TRN
                         LINE,AT(2656,10,0,3156),USE(?Line1),COLOR(COLOR:Black)
                         STRING('Cta. Cte. Nro.'),AT(10,938),USE(?String3),TRN
                         STRING('Cta. Cte. Nro.'),AT(2688,938),USE(?String26),TRN
                         STRING('Cta. Cte. Nro.'),AT(5344,938),USE(?String27),TRN
                         STRING('Nro. Cupón:'),AT(6531,719),USE(?String68),TRN
                         STRING(@s255),AT(10,1125,2646,177),USE(GLO:DIRECCION),TRN
                         STRING(@s255),AT(5333,1125,2510,177),USE(GLO:DIRECCION,,?GLO:DIRECCION:3),TRN
                         STRING(@s255),AT(2688,1125,2625,177),USE(GLO:DIRECCION,,?GLO:DIRECCION:2),TRN
                         LINE,AT(5313,3167,0,-3156),USE(?Line2),COLOR(COLOR:Black)
                         LINE,AT(10,3156,7865,0),USE(?Line3),COLOR(COLOR:Black)
                         STRING('Apellido y Nombre:'),AT(10,1313),USE(?String5),TRN
                         STRING('Apellido y Nombre:'),AT(5333,1313),USE(?String34),TRN
                         STRING('Apellido y Nombre:'),AT(2688,1313),USE(?String35),TRN
                         STRING(@s30),AT(5333,1500,2063,177),USE(SOC:NOMBRE,,?SOC:NOMBRE:3),LEFT(1)
                         STRING('BANCO MACRO BANSUD Convenio Nro.: XXXXX'),AT(2708,0),USE(?String22),TRN
                         STRING(@s30),AT(10,1500,2010,177),USE(SOC:NOMBRE),LEFT(1)
                         STRING(@s30),AT(2688,1500),USE(SOC:NOMBRE,,?SOC:NOMBRE:2),LEFT(1)
                         STRING('BANCO MACRO BANSUD Convenio Nro.: XXXXX'),AT(5333,0),USE(?String23),TRN
                         STRING(@s7),AT(354,1688),USE(SOC:IDSOCIO)
                         STRING('Mat.:'),AT(917,1688),USE(?String9),TRN
                         STRING('Socio:'),AT(10,1688),USE(?String7),TRN
                         STRING('Periodo:'),AT(10,1875),USE(?String11),TRN
                         STRING(@P/ ####P),AT(760,1875),USE(FAC:ANO),RIGHT(1)
                         STRING('Periodo:'),AT(2688,1875),USE(?String45),TRN
                         STRING(@s3),AT(3156,1875),USE(FAC:MES,,?FAC:MES:3),RIGHT(1)
                         STRING('Peridodo:'),AT(5344,1875),USE(?String50),TRN
                         STRING(@s3),AT(500,1875),USE(FAC:MES,,?FAC:MES:2),RIGHT(1)
                         STRING(@s7),AT(3875,1688),USE(SOC:MATRICULA,,?SOC:MATRICULA:3)
                         STRING('Vencimiento:'),AT(1250,1875),USE(?String15),TRN
                         STRING('Vencimiento:'),AT(3927,1875),USE(?String51),TRN
                         STRING(@s3),AT(5896,1875),USE(FAC:MES,,?FAC:MES:4),RIGHT(1)
                         STRING(@P/ ####P),AT(3458,1875),USE(FAC:ANO,,?FAC:ANO:2),RIGHT(1)
                         STRING(@P/ ####P),AT(6167,1875),USE(FAC:ANO,,?FAC:ANO:3),RIGHT(1)
                         BOX,AT(948,2104,740,198),USE(?Box6),COLOR(COLOR:Black)
                         STRING(@D6),AT(7250,1875),USE(LOC:FECHA_VENCIMIENTO,,?LOC:FECHA_VENCIMIENTO:3),RIGHT(1)
                         BOX,AT(6260,2104,740,198),USE(?Box12),COLOR(COLOR:Black)
                         STRING(@D6),AT(4688,1875),USE(LOC:FECHA_VENCIMIENTO,,?LOC:FECHA_VENCIMIENTO:2),RIGHT(1)
                         STRING('Vencimiento:'),AT(6604,1875),USE(?String52),TRN
                         STRING(@D6),AT(1917,1875),USE(LOC:FECHA_VENCIMIENTO),RIGHT(1)
                         STRING('Cuota Social:'),AT(10,2115),USE(?String16),TRN
                         STRING('Cuota Social:'),AT(5344,2115),USE(?String54),TRN
                         BOX,AT(6260,2323,740,198),USE(?Box11),COLOR(COLOR:Black)
                         BOX,AT(3750,2323,740,198),USE(?Box8),COLOR(COLOR:Black)
                         STRING('Cuota Convenio:'),AT(2688,2344),USE(?String69),TRN
                         STRING('Cuota Convenio:'),AT(5344,2344),USE(?String70),TRN
                         BOX,AT(6260,2542,740,198),USE(?Box10),COLOR(COLOR:Black)
                         BOX,AT(3750,2542,740,198),USE(?Box7),COLOR(COLOR:Black)
                         STRING('Cuota Social:'),AT(2688,2115),USE(?String53),TRN
                         BOX,AT(3750,2104,740,198),USE(?Box9),COLOR(COLOR:Black)
                         BOX,AT(938,2323,740,198),USE(?Box5),COLOR(COLOR:Black)
                         STRING('Cuota Convenio:'),AT(10,2344),USE(?String65),TRN
                         BOX,AT(938,2542,740,198),USE(?Box4),COLOR(COLOR:Black)
                         STRING('Total Depositado:'),AT(5344,2781),USE(?String62),TRN
                         STRING('Talón Para el Socio'),AT(5969,2990),USE(?String64),TRN
                         STRING('Talón Para el Colegio de Odontólogos'),AT(3094,2990),USE(?String63),TRN
                         BOX,AT(6260,2771,740,198),USE(?Box3),COLOR(COLOR:Black)
                         STRING('Descuento:'),AT(2688,2552),USE(?String59),TRN
                         STRING('Descuento:'),AT(5344,2552),USE(?String60),TRN
                         STRING('Descuento:'),AT(10,2552),USE(?String19),TRN
                         BOX,AT(938,2771,740,198),USE(?Box1),COLOR(COLOR:Black)
                         BOX,AT(3750,2771,740,198),USE(?Box2),COLOR(COLOR:Black)
                         STRING('Total Depositado:'),AT(10,2781),USE(?String20),TRN
                         STRING('Total Depositado:'),AT(2688,2781),USE(?String61),TRN
                         STRING('Talón Para el Banco'),AT(365,2990),USE(?String21),TRN
                         STRING(@s7),AT(1208,1688),USE(SOC:MATRICULA)
                         STRING(@s7),AT(5688,1688),USE(SOC:IDSOCIO,,?SOC:IDSOCIO:3)
                         STRING('Socio:'),AT(5344,1688),USE(?String39),TRN
                         STRING('Mat.:'),AT(3615,1688),USE(?String38),TRN
                         STRING('Socio:'),AT(2688,1688),USE(?String37),TRN
                         STRING(@s7),AT(3010,1688),USE(SOC:IDSOCIO,,?SOC:IDSOCIO:2)
                         STRING('Mat.:'),AT(6375,1688),USE(?String40),TRN
                         STRING(@s7),AT(6625,1688),USE(SOC:MATRICULA,,?SOC:MATRICULA:2)
                         STRING('BANCO MACRO BANSUD Convenio Nro.: XXXXX'),AT(10,0),USE(?String1),FONT(,8),TRN
                       END
                       FORM,AT(292,240,7906,13500),USE(?Form)
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
  GlobalErrors.SetProcedureName('CUPON_DE_PAGO4:IMPRIMIR')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:FACTURAXCUPON.Open                                ! File FACTURAXCUPON used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('CUPON_DE_PAGO4:IMPRIMIR',ProgressWindow)   ! Restore window settings from non-volatile store
  TargetSelector.AddItem(XMLReporter.IReportGenerator)
  TargetSelector.AddItem(HTMLReporter.IReportGenerator)
  TargetSelector.AddItem(TXTReporter.IReportGenerator)
  TargetSelector.AddItem(PDFReporter.IReportGenerator)
  SELF.AddItem(TargetSelector)
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisReport.Init(Process:View, Relate:FACTURAXCUPON, ?Progress:PctText, Progress:Thermometer, ProgressMgr, FAC2:IDLOTE)
  ThisReport.AddSortOrder(FAC2:FK_FACTURAXCUPON_LOTE)
  ThisReport.AddRange(FAC2:IDLOTE,GLO:IDLOTE)
  ThisReport.SetFilter('FAC:ESTADO = ''''')
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:FACTURAXCUPON.SetQuickScan(1,Propagate:OneMany)
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
    Relate:FACTURAXCUPON.Close
  END
  IF SELF.Opened
    INIMgr.Update('CUPON_DE_PAGO4:IMPRIMIR',ProgressWindow) ! Save window data to non-volatile store
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
  SELF.Attribute.Set(?GLO:CUIT:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GLO:CUIT:2,RepGen:XML,TargetAttr:TagName,'GLO:CUIT:2')
  SELF.Attribute.Set(?GLO:CUIT:2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?FAC:IDFACTURA:3,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?FAC:IDFACTURA:3,RepGen:XML,TargetAttr:TagName,'FAC:IDFACTURA:3')
  SELF.Attribute.Set(?FAC:IDFACTURA:3,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?GLO:CUIT,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GLO:CUIT,RepGen:XML,TargetAttr:TagName,'GLO:CUIT')
  SELF.Attribute.Set(?GLO:CUIT,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?FAC:IDFACTURA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?FAC:IDFACTURA,RepGen:XML,TargetAttr:TagName,'FAC:IDFACTURA')
  SELF.Attribute.Set(?FAC:IDFACTURA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?FAC:IDFACTURA:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?FAC:IDFACTURA:2,RepGen:XML,TargetAttr:TagName,'FAC:IDFACTURA:2')
  SELF.Attribute.Set(?FAC:IDFACTURA:2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String2,RepGen:XML,TargetAttr:TagName,'String2')
  SELF.Attribute.Set(?String2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String24,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String24,RepGen:XML,TargetAttr:TagName,'String24')
  SELF.Attribute.Set(?String24,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String25,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String25,RepGen:XML,TargetAttr:TagName,'String25')
  SELF.Attribute.Set(?String25,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?GLO:CUIT:3,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GLO:CUIT:3,RepGen:XML,TargetAttr:TagName,'GLO:CUIT:3')
  SELF.Attribute.Set(?GLO:CUIT:3,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String67,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String67,RepGen:XML,TargetAttr:TagName,'String67')
  SELF.Attribute.Set(?String67,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String66,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String66,RepGen:XML,TargetAttr:TagName,'String66')
  SELF.Attribute.Set(?String66,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String3,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String3,RepGen:XML,TargetAttr:TagName,'String3')
  SELF.Attribute.Set(?String3,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String26,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String26,RepGen:XML,TargetAttr:TagName,'String26')
  SELF.Attribute.Set(?String26,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String27,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String27,RepGen:XML,TargetAttr:TagName,'String27')
  SELF.Attribute.Set(?String27,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String68,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String68,RepGen:XML,TargetAttr:TagName,'String68')
  SELF.Attribute.Set(?String68,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?GLO:DIRECCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GLO:DIRECCION,RepGen:XML,TargetAttr:TagName,'GLO:DIRECCION')
  SELF.Attribute.Set(?GLO:DIRECCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?GLO:DIRECCION:3,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GLO:DIRECCION:3,RepGen:XML,TargetAttr:TagName,'GLO:DIRECCION:3')
  SELF.Attribute.Set(?GLO:DIRECCION:3,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?GLO:DIRECCION:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GLO:DIRECCION:2,RepGen:XML,TargetAttr:TagName,'GLO:DIRECCION:2')
  SELF.Attribute.Set(?GLO:DIRECCION:2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String5,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String5,RepGen:XML,TargetAttr:TagName,'String5')
  SELF.Attribute.Set(?String5,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String34,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String34,RepGen:XML,TargetAttr:TagName,'String34')
  SELF.Attribute.Set(?String34,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String35,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String35,RepGen:XML,TargetAttr:TagName,'String35')
  SELF.Attribute.Set(?String35,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:NOMBRE:3,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:NOMBRE:3,RepGen:XML,TargetAttr:TagName,'SOC:NOMBRE:3')
  SELF.Attribute.Set(?SOC:NOMBRE:3,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String22,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String22,RepGen:XML,TargetAttr:TagName,'String22')
  SELF.Attribute.Set(?String22,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagName,'SOC:NOMBRE')
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:NOMBRE:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:NOMBRE:2,RepGen:XML,TargetAttr:TagName,'SOC:NOMBRE:2')
  SELF.Attribute.Set(?SOC:NOMBRE:2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String23,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String23,RepGen:XML,TargetAttr:TagName,'String23')
  SELF.Attribute.Set(?String23,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:IDSOCIO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:IDSOCIO,RepGen:XML,TargetAttr:TagName,'SOC:IDSOCIO')
  SELF.Attribute.Set(?SOC:IDSOCIO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String9,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String9,RepGen:XML,TargetAttr:TagName,'String9')
  SELF.Attribute.Set(?String9,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String7,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String7,RepGen:XML,TargetAttr:TagName,'String7')
  SELF.Attribute.Set(?String7,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String11,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String11,RepGen:XML,TargetAttr:TagName,'String11')
  SELF.Attribute.Set(?String11,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?FAC:ANO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?FAC:ANO,RepGen:XML,TargetAttr:TagName,'FAC:ANO')
  SELF.Attribute.Set(?FAC:ANO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String45,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String45,RepGen:XML,TargetAttr:TagName,'String45')
  SELF.Attribute.Set(?String45,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?FAC:MES:3,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?FAC:MES:3,RepGen:XML,TargetAttr:TagName,'FAC:MES:3')
  SELF.Attribute.Set(?FAC:MES:3,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String50,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String50,RepGen:XML,TargetAttr:TagName,'String50')
  SELF.Attribute.Set(?String50,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?FAC:MES:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?FAC:MES:2,RepGen:XML,TargetAttr:TagName,'FAC:MES:2')
  SELF.Attribute.Set(?FAC:MES:2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:MATRICULA:3,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:MATRICULA:3,RepGen:XML,TargetAttr:TagName,'SOC:MATRICULA:3')
  SELF.Attribute.Set(?SOC:MATRICULA:3,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String15,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String15,RepGen:XML,TargetAttr:TagName,'String15')
  SELF.Attribute.Set(?String15,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String51,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String51,RepGen:XML,TargetAttr:TagName,'String51')
  SELF.Attribute.Set(?String51,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?FAC:MES:4,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?FAC:MES:4,RepGen:XML,TargetAttr:TagName,'FAC:MES:4')
  SELF.Attribute.Set(?FAC:MES:4,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?FAC:ANO:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?FAC:ANO:2,RepGen:XML,TargetAttr:TagName,'FAC:ANO:2')
  SELF.Attribute.Set(?FAC:ANO:2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?FAC:ANO:3,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?FAC:ANO:3,RepGen:XML,TargetAttr:TagName,'FAC:ANO:3')
  SELF.Attribute.Set(?FAC:ANO:3,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?LOC:FECHA_VENCIMIENTO:3,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?LOC:FECHA_VENCIMIENTO:3,RepGen:XML,TargetAttr:TagName,'LOC:FECHA_VENCIMIENTO:3')
  SELF.Attribute.Set(?LOC:FECHA_VENCIMIENTO:3,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?LOC:FECHA_VENCIMIENTO:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?LOC:FECHA_VENCIMIENTO:2,RepGen:XML,TargetAttr:TagName,'LOC:FECHA_VENCIMIENTO:2')
  SELF.Attribute.Set(?LOC:FECHA_VENCIMIENTO:2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String52,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String52,RepGen:XML,TargetAttr:TagName,'String52')
  SELF.Attribute.Set(?String52,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?LOC:FECHA_VENCIMIENTO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?LOC:FECHA_VENCIMIENTO,RepGen:XML,TargetAttr:TagName,'LOC:FECHA_VENCIMIENTO')
  SELF.Attribute.Set(?LOC:FECHA_VENCIMIENTO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String16,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String16,RepGen:XML,TargetAttr:TagName,'String16')
  SELF.Attribute.Set(?String16,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String54,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String54,RepGen:XML,TargetAttr:TagName,'String54')
  SELF.Attribute.Set(?String54,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String69,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String69,RepGen:XML,TargetAttr:TagName,'String69')
  SELF.Attribute.Set(?String69,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String70,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String70,RepGen:XML,TargetAttr:TagName,'String70')
  SELF.Attribute.Set(?String70,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String53,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String53,RepGen:XML,TargetAttr:TagName,'String53')
  SELF.Attribute.Set(?String53,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String65,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String65,RepGen:XML,TargetAttr:TagName,'String65')
  SELF.Attribute.Set(?String65,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String62,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String62,RepGen:XML,TargetAttr:TagName,'String62')
  SELF.Attribute.Set(?String62,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String64,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String64,RepGen:XML,TargetAttr:TagName,'String64')
  SELF.Attribute.Set(?String64,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String63,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String63,RepGen:XML,TargetAttr:TagName,'String63')
  SELF.Attribute.Set(?String63,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String59,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String59,RepGen:XML,TargetAttr:TagName,'String59')
  SELF.Attribute.Set(?String59,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String60,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String60,RepGen:XML,TargetAttr:TagName,'String60')
  SELF.Attribute.Set(?String60,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String19,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String19,RepGen:XML,TargetAttr:TagName,'String19')
  SELF.Attribute.Set(?String19,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String20,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String20,RepGen:XML,TargetAttr:TagName,'String20')
  SELF.Attribute.Set(?String20,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String61,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String61,RepGen:XML,TargetAttr:TagName,'String61')
  SELF.Attribute.Set(?String61,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String21,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String21,RepGen:XML,TargetAttr:TagName,'String21')
  SELF.Attribute.Set(?String21,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagName,'SOC:MATRICULA')
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:IDSOCIO:3,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:IDSOCIO:3,RepGen:XML,TargetAttr:TagName,'SOC:IDSOCIO:3')
  SELF.Attribute.Set(?SOC:IDSOCIO:3,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String39,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String39,RepGen:XML,TargetAttr:TagName,'String39')
  SELF.Attribute.Set(?String39,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String38,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String38,RepGen:XML,TargetAttr:TagName,'String38')
  SELF.Attribute.Set(?String38,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String37,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String37,RepGen:XML,TargetAttr:TagName,'String37')
  SELF.Attribute.Set(?String37,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:IDSOCIO:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:IDSOCIO:2,RepGen:XML,TargetAttr:TagName,'SOC:IDSOCIO:2')
  SELF.Attribute.Set(?SOC:IDSOCIO:2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String40,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String40,RepGen:XML,TargetAttr:TagName,'String40')
  SELF.Attribute.Set(?String40,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:MATRICULA:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:MATRICULA:2,RepGen:XML,TargetAttr:TagName,'SOC:MATRICULA:2')
  SELF.Attribute.Set(?SOC:MATRICULA:2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String1,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String1,RepGen:XML,TargetAttr:TagName,'String1')
  SELF.Attribute.Set(?String1,RepGen:XML,TargetAttr:TagValueFromText,True)


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  LOC:FECHA_VENCIMIENTO = DATE(FAC:MES,10,FAC:ANO)
  TOMA# = LOC:FECHA_VENCIMIENTO +30
  LOC:FECHA_VENCIMIENTO = DATE(MONTH(TOMA#),10,YEAR(TOMA#))
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
  SELF.SetCheckBoxString('[X]','[_]')
  SELF.SetRadioButtonString('(*)','(_)')
  SELF.SetLineString('|','|','-','-','/','\','\','/')
  SELF.SetTextFillString(' ',CHR(176),CHR(177),CHR(178),CHR(219))
  SELF.SetOmitGraph(False)


PDFReporter.SetUp PROCEDURE

  CODE
  PARENT.SetUp
  SELF.SetFileName('')
  SELF.SetDocumentInfo('CW Report','Gestion','CUPON_DE_PAGO4:IMPRIMIR','CUPON_DE_PAGO4:IMPRIMIR','','')
  SELF.SetPagesAsParentBookmark(False)
  SELF.SetScanCopyMode(False)
  SELF.CompressText   = True
  SELF.CompressImages = True

!!! <summary>
!!! Generated from procedure template - Window
!!! Window
!!! </summary>
REPORTE_COLEGIADOxOS PROCEDURE 

QuickWindow          WINDOW('Generar Reporte de Colegioados por Obra Social'),AT(,,211,86),FONT('Arial Black',8, |
  COLOR:Black,FONT:bold),RESIZE,CENTER,GRAY,IMM,MDI,HLP('REPORTE_COLEGIADOxOS'),SYSTEM
                       PROMPT('IDOS:'),AT(21,13),USE(?Glo:IDOS:Prompt)
                       ENTRY(@n-7),AT(45,12,41,10),USE(Glo:IDOS),REQ
                       BUTTON('...'),AT(88,11,12,12),USE(?CallLookup)
                       STRING(@s30),AT(102,14),USE(OBR:NOMPRE_CORTO)
                       BUTTON('&Generar Reporte'),AT(68,40,71,14),USE(?Ok),LEFT,ICON(ICON:Print1),CURSOR('mano.cur'), |
  FLAT,MSG('Acepta Operacion'),TIP('Acepta Operacion')
                       BUTTON('&Cancelar'),AT(81,64,49,14),USE(?Cancel),LEFT,ICON('cancelar.ico'),CURSOR('mano.cur'), |
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
  GlobalErrors.SetProcedureName('REPORTE_COLEGIADOxOS')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Glo:IDOS:Prompt
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
  Relate:OBRA_SOCIAL.Open                                  ! File OBRA_SOCIAL used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('REPORTE_COLEGIADOxOS',QuickWindow)         ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:OBRA_SOCIAL.Close
  END
  IF SELF.Opened
    INIMgr.Update('REPORTE_COLEGIADOxOS',QuickWindow)      ! Save window data to non-volatile store
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
    SelectOBRA_SOCIAL
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
      open(RANKING)
      EMPTY(RANKING)
      IF ERRORCODE() THEN
          MESSAGE('LA TABLA OBRA SOCIAL ESTA SIENDO UTILIZADA POR OTRA TERMINA | ESPERE UNOS INSTANTES Y VUELVA A EJECUTAR ESTE PROCESO','CONTROL DE SISTEMA',ICON:EXCLAMATION)
          CYCLE
      ELSE
          CLOSE(RANKING)
      END
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Glo:IDOS
      IF Glo:IDOS OR ?Glo:IDOS{PROP:Req}
        OBR:IDOS = Glo:IDOS
        IF Access:OBRA_SOCIAL.TryFetch(OBR:PK_OBRA_SOCIAL)
          IF SELF.Run(1,SelectRecord) = RequestCompleted
            Glo:IDOS = OBR:IDOS
          ELSE
            SELECT(?Glo:IDOS)
            CYCLE
          END
        END
      END
      ThisWindow.Reset()
    OF ?CallLookup
      ThisWindow.Update()
      OBR:IDOS = Glo:IDOS
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        Glo:IDOS = OBR:IDOS
      END
      ThisWindow.Reset(1)
    OF ?Ok
      ThisWindow.Update()
      REPORTE_COLEGIOADOXOS_2()
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
!!! Browse the RANKING File
!!! </summary>
REPORTE_COLEGIADOXOS_3 PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(RANKING)
                       PROJECT(RAN:C3)
                       PROJECT(RAN:C4)
                       PROJECT(RAN:C5)
                       PROJECT(RAN:C7)
                       PROJECT(RAN:C8)
                       PROJECT(RAN:C1)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
RAN:C3                 LIKE(RAN:C3)                   !List box control field - type derived from field
RAN:C4                 LIKE(RAN:C4)                   !List box control field - type derived from field
RAN:C5                 LIKE(RAN:C5)                   !List box control field - type derived from field
RAN:C7                 LIKE(RAN:C7)                   !List box control field - type derived from field
RAN:C8                 LIKE(RAN:C8)                   !List box control field - type derived from field
RAN:C1                 LIKE(RAN:C1)                   !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('REPORTE COLEGIOADO POR OS'),AT(,,523,329),FONT('MS Sans Serif',8,,FONT:regular),RESIZE, |
  CENTER,GRAY,IMM,MDI,HLP('REPORTE_COLEGIADOXOS_3'),SYSTEM
                       LIST,AT(8,51,504,250),USE(?Browse:1),HVSCROLL,FORMAT('48L(2)|M~MATRICULA~@s4@80L(2)|M~N' & |
  'OMBRE~@s50@117L(2)|M~SIGLAS~@s50@208L(2)|M~OBRA SOCIAL~@s50@80L(2)|M~PRONTO PAGO~@s50@'), |
  FROM(Queue:Browse:1),IMM,MSG('Administrador de RANKING')
                       BUTTON('&Filtro'),AT(0,307,58,17),USE(?Query),LEFT,ICON('qbe.ico'),FLAT
                       BUTTON('E&xportar'),AT(48,310,52,15),USE(?EvoExportar),LEFT,ICON('export.ico'),FLAT
                       SHEET,AT(4,4,517,302),USE(?CurrentTab)
                         TAB('COLEGIADO'),USE(?Tab:1)
                           PROMPT('NOMBRE COLEGIADO:'),AT(11,31),USE(?RAN:C4:Prompt)
                           ENTRY(@s50),AT(100,28,159,12),USE(RAN:C4)
                         END
                         TAB('NOMBRE CORTO OS'),USE(?Tab:2)
                           PROMPT('NOMBRE CORTO OS:'),AT(12,31),USE(?RAN:C6:Prompt)
                           ENTRY(@s50),AT(90,30,159,12),USE(RAN:C6)
                         END
                       END
                       BUTTON('&Salir'),AT(474,312,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Salir'),TIP('Salir')
                     END

Loc::QHlist6 QUEUE,PRE(QHL6)
Id                         SHORT
Nombre                     STRING(100)
Longitud                   SHORT
Pict                       STRING(50)
Tot                 BYTE
                         END
QPar6 QUEUE,PRE(Q6)
FieldPar                 CSTRING(800)
                         END
QPar26 QUEUE,PRE(Qp26)
F2N                 CSTRING(300)
F2P                 CSTRING(100)
F2T                 BYTE
                         END
Loc::TituloListado6          STRING(100)
Loc::Titulo6          STRING(100)
SavPath6          STRING(2000)
Evo::Group6  GROUP,PRE()
Evo::Procedure6          STRING(100)
Evo::App6          STRING(100)
Evo::NroPage          LONG
   END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
QBE5                 QueryListClass                        ! QBE List Class. 
QBV5                 QueryListVisual                       ! QBE Visual Class
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
                     END

BRW1::Sort0:Locator  FilterLocatorClass                    ! Default Locator
BRW1::Sort1:Locator  FilterLocatorClass                    ! Conditional Locator - CHOICE(?CurrentTab) = 2
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

Ec::LoadI_6  SHORT
Gol_woI_6 WINDOW,AT(,,236,43),FONT('MS Sans Serif',8,,),CENTER,GRAY
       IMAGE('clock.ico'),AT(8,11),USE(?ImgoutI_6),CENTERED
       GROUP,AT(38,11,164,20),USE(?G::I_6),BOXED,BEVEL(-1)
         STRING('Preparando datos para Exportacion'),AT(63,11),USE(?StrOutI_6),TRN
         STRING('Aguarde un instante por Favor...'),AT(67,20),USE(?StrOut2I_6),TRN
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
PrintExBrowse6 ROUTINE

 OPEN(Gol_woI_6)
 DISPLAY()
 SETTARGET(QuickWindow)
 SETCURSOR(CURSOR:WAIT)
 EC::LoadI_6 = BRW1.FileLoaded
 IF Not  EC::LoadI_6
     BRW1.FileLoaded=True
     CLEAR(BRW1.LastItems,1)
     BRW1.ResetFromFile()
 END
 CLOSE(Gol_woI_6)
 SETCURSOR()
  Evo::App6          = 'Gestion'
  Evo::Procedure6          = GlobalErrors.GetProcedureName()& 6
 
  FREE(QPar6)
  Q6:FieldPar  = '1,2,3,4,5,'
  ADD(QPar6)  !!1
  Q6:FieldPar  = ';'
  ADD(QPar6)  !!2
  Q6:FieldPar  = 'Spanish'
  ADD(QPar6)  !!3
  Q6:FieldPar  = ''
  ADD(QPar6)  !!4
  Q6:FieldPar  = true
  ADD(QPar6)  !!5
  Q6:FieldPar  = ''
  ADD(QPar6)  !!6
  Q6:FieldPar  = true
  ADD(QPar6)  !!7
 !!!! Exportaciones
  Q6:FieldPar  = 'HTML|'
   Q6:FieldPar  = CLIP( Q6:FieldPar)&'EXCEL|'
   Q6:FieldPar  = CLIP( Q6:FieldPar)&'WORD|'
  Q6:FieldPar  = CLIP( Q6:FieldPar)&'ASCII|'
   Q6:FieldPar  = CLIP( Q6:FieldPar)&'XML|'
   Q6:FieldPar  = CLIP( Q6:FieldPar)&'PRT|'
  ADD(QPar6)  !!8
  Q6:FieldPar  = 'All'
  ADD(QPar6)   !.9.
  Q6:FieldPar  = ' 0'
  ADD(QPar6)   !.10
  Q6:FieldPar  = 0
  ADD(QPar6)   !.11
  Q6:FieldPar  = '1'
  ADD(QPar6)   !.12
 
  Q6:FieldPar  = ''
  ADD(QPar6)   !.13
 
  Q6:FieldPar  = ''
  ADD(QPar6)   !.14
 
  Q6:FieldPar  = ''
  ADD(QPar6)   !.15
 
   Q6:FieldPar  = '16'
  ADD(QPar6)   !.16
 
   Q6:FieldPar  = 1
  ADD(QPar6)   !.17
   Q6:FieldPar  = 2
  ADD(QPar6)   !.18
   Q6:FieldPar  = '2'
  ADD(QPar6)   !.19
   Q6:FieldPar  = 12
  ADD(QPar6)   !.20
 
   Q6:FieldPar  = 0 !Exporta excel sin borrar
  ADD(QPar6)   !.21
 
   Q6:FieldPar  = Evo::NroPage !Nro Pag. Desde Report (BExp)
  ADD(QPar6)   !.22
 
   CLEAR(Q6:FieldPar)
  ADD(QPar6)   ! 23 Caracteres Encoding para xml
 
  Q6:FieldPar  = '0'
  ADD(QPar6)   ! 24 Use Open Office
 
   Q6:FieldPar  = 'golmedo'
  ADD(QPar6) ! 25
 
 !---------------------------------------------------------------------------------------------
 !!Registration 
  Q6:FieldPar  = ' BrowseExport'
  ADD(QPar6)   ! 26  BrowseExport
  Q6:FieldPar  = ' '
  ADD(QPar6)   ! 27  
  Q6:FieldPar  = ' ' 
  ADD(QPar6)   ! 28  
  Q6:FieldPar  = 'BEXPORT' 
  ADD(QPar6)   ! 29 Gestion017.clw
 !!!!!
 
 
  FREE(QPar26)
       Qp26:F2N  = 'MATRICULA'
  Qp26:F2P  = '@s4'
  Qp26:F2T  = '0'
  ADD(QPar26)
       Qp26:F2N  = 'NOMBRE'
  Qp26:F2P  = '@s50'
  Qp26:F2T  = '0'
  ADD(QPar26)
       Qp26:F2N  = 'SIGLAS'
  Qp26:F2P  = '@s50'
  Qp26:F2T  = '0'
  ADD(QPar26)
       Qp26:F2N  = 'OBRA SOCIAL'
  Qp26:F2P  = '@s50'
  Qp26:F2T  = '0'
  ADD(QPar26)
       Qp26:F2N  = 'PRONTO PAGO'
  Qp26:F2P  = '@s50'
  Qp26:F2T  = '0'
  ADD(QPar26)
  SysRec# = false
  FREE(Loc::QHlist6)
  LOOP
     SysRec# += 1
     IF ?Browse:1{PROPLIST:Exists,SysRec#} = 1
         GET(QPar26,SysRec#)
         QHL6:Id      = SysRec#
         QHL6:Nombre  = Qp26:F2N
         QHL6:Longitud= ?Browse:1{PropList:Width,SysRec#}  /2
         QHL6:Pict    = Qp26:F2P
         QHL6:Tot    = Qp26:F2T
         ADD(Loc::QHlist6)
      Else
        break
     END
  END
  Loc::Titulo6 ='LISTADO DE COLEGIADOS POR OBRA SOCIAL'
 
 SavPath6 = PATH()
  Exportar(Loc::QHlist6,BRW1.Q,QPar6,1,Loc::Titulo6,Evo::Group6)
 IF Not EC::LoadI_6 Then  BRW1.FileLoaded=false.
 SETPATH(SavPath6)
 !!!! Fin Routina Templates Clarion

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('REPORTE_COLEGIADOXOS_3')
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
  Relate:RANKING.Open                                      ! File RANKING used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:RANKING,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  QBE5.Init(QBV5, INIMgr,'REPORTE_COLEGIADOXOS_3', GlobalErrors)
  QBE5.QkSupport = True
  QBE5.QkMenuIcon = 'QkQBE.ico'
  QBE5.QkIcon = 'QkLoad.ico'
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,RAN:IDX_C5)                           ! Add the sort order for RAN:IDX_C5 for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,RAN:C5,,BRW1)                  ! Initialize the browse locator using  using key: RAN:IDX_C5 , RAN:C5
  BRW1.AddSortOrder(,RAN:IDX_C4)                           ! Add the sort order for RAN:IDX_C4 for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(?RAN:C4,RAN:C4,,BRW1)           ! Initialize the browse locator using ?RAN:C4 using key: RAN:IDX_C4 , RAN:C4
  BRW1.AddField(RAN:C3,BRW1.Q.RAN:C3)                      ! Field RAN:C3 is a hot field or requires assignment from browse
  BRW1.AddField(RAN:C4,BRW1.Q.RAN:C4)                      ! Field RAN:C4 is a hot field or requires assignment from browse
  BRW1.AddField(RAN:C5,BRW1.Q.RAN:C5)                      ! Field RAN:C5 is a hot field or requires assignment from browse
  BRW1.AddField(RAN:C7,BRW1.Q.RAN:C7)                      ! Field RAN:C7 is a hot field or requires assignment from browse
  BRW1.AddField(RAN:C8,BRW1.Q.RAN:C8)                      ! Field RAN:C8 is a hot field or requires assignment from browse
  BRW1.AddField(RAN:C1,BRW1.Q.RAN:C1)                      ! Field RAN:C1 is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('REPORTE_COLEGIADOXOS_3',QuickWindow)       ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.QueryControl = ?Query
  BRW1.UpdateQuery(QBE5,1)
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
    Relate:RANKING.Close
  END
  IF SELF.Opened
    INIMgr.Update('REPORTE_COLEGIADOXOS_3',QuickWindow)    ! Save window data to non-volatile store
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
    OF ?EvoExportar
      ThisWindow.Update()
       Do PrintExBrowse6
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
!!! Generated from procedure template - Process
!!! </summary>
REPORTE_COLEGIOADOXOS_2 PROCEDURE 

Progress:Thermometer BYTE                                  ! 
Process:View         VIEW(SOCIOSXOS)
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),DOUBLE,CENTER,GRAY,IMM,MDI,SYSTEM,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel),DISABLE,HIDE
                     END

ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeCloseEvent         PROCEDURE(),BYTE,PROC,DERIVED
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
  GlobalErrors.SetProcedureName('REPORTE_COLEGIOADOXOS_2')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:OBRA_SOCIAL.Open                                  ! File OBRA_SOCIAL used by this procedure, so make sure it's RelationManager is open
  Relate:RANKING.Open                                      ! File RANKING used by this procedure, so make sure it's RelationManager is open
  Relate:SOCIOS.Open                                       ! File SOCIOS used by this procedure, so make sure it's RelationManager is open
  Relate:SOCIOSXOS.Open                                    ! File SOCIOSXOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('REPORTE_COLEGIOADOXOS_2',ProgressWindow)   ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisProcess.Init(Process:View, Relate:SOCIOSXOS, ?Progress:PctText, Progress:Thermometer, ProgressMgr, SOC3:IDOS)
  ThisProcess.AddSortOrder(SOC3:FK_SOCIOSXOS_OS)
  ThisProcess.AddRange(SOC3:IDOS,Glo:IDOS)
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  ?Progress:UserString{Prop:Text}=''
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(SOCIOSXOS,'QUICKSCAN=on')
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:OBRA_SOCIAL.Close
    Relate:RANKING.Close
    Relate:SOCIOS.Close
    Relate:SOCIOSXOS.Close
  END
  IF SELF.Opened
    INIMgr.Update('REPORTE_COLEGIOADOXOS_2',ProgressWindow) ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.TakeCloseEvent PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeCloseEvent()
  REPORTE_COLEGIADOXOS_3()
  RETURN ReturnValue


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeRecord()
  !! Cargo Ranking
  
  RAN:C1 = RAN:C1 +1
  !! CARGA SOCIO
  SOC:IDSOCIO = SOC3:IDSOCIOS
  ACCESS:SOCIOS.TRYFETCH(SOC:PK_SOCIOS)
  RAN:C3 = SOC:MATRICULA
  RAN:C4 = SOC:NOMBRE
  
  !! CARGA oS
  OBR:IDOS = SOC3:IDOS
  ACCESS:OBRA_SOCIAL.TRYFETCH(OBR:PK_OBRA_SOCIAL)
  RAN:C5  =  OBR:NOMPRE_CORTO
  RAN:C7  =  OBR:NOMBRE
  RAN:C8  =  OBR:PRONTO_PAGO
  ACCESS:RANKING.INSERT()
  RETURN ReturnValue

!!! <summary>
!!! Generated from procedure template - Window
!!! </summary>
INFORMES PROCEDURE 

LOC:TAREA            BYTE                                  ! 
BRW2::View:Browse    VIEW(INFORME)
                       PROJECT(INF:INFORME)
                       PROJECT(INF:FECHA)
                       PROJECT(INF:TERMINADO)
                       PROJECT(INF:IDINFORME)
                     END
Queue:Browse         QUEUE                            !Queue declaration for browse/combo box using ?List
INF:INFORME            LIKE(INF:INFORME)              !List box control field - type derived from field
INF:FECHA              LIKE(INF:FECHA)                !List box control field - type derived from field
INF:TERMINADO          LIKE(INF:TERMINADO)            !List box control field - type derived from field
INF:IDINFORME          LIKE(INF:IDINFORME)            !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Window               WINDOW('Informes'),AT(,,395,214),FONT('MS Sans Serif',8,,FONT:regular),CENTER,GRAY
                       LIST,AT(3,5,385,159),USE(?List),HVSCROLL,FORMAT('279L(2)|M~INFORME~@s255@40L(2)|M~FECHA' & |
  '~@d17@8L(2)|M~TERMINADO~@s2@56L(2)|M~IDINFORME~@n-14@'),FROM(Queue:Browse),IMM,MSG('Browsing Records'), |
  VCR
                       PROMPT('Tareas Pendientes:'),AT(7,169),USE(?Prompt1),FONT(,,,FONT:bold)
                       STRING(@n3),AT(87,169),USE(LOC:TAREA),FONT(,,,FONT:bold)
                       BUTTON('Tarea Realizada'),AT(6,185,85,18),USE(?Button2),LEFT,ICON(ICON:Tick),FLAT
                       BUTTON('&Salir'),AT(296,185,57,18),USE(?CancelButton),LEFT,ICON('salir.ico'),FLAT
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW2                 CLASS(BrowseClass)                    ! Browse using ?List
Q                      &Queue:Browse                  !Reference to browse queue
ResetFromView          PROCEDURE(),DERIVED
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
  GlobalErrors.SetProcedureName('INFORMES')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?List
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('INF:IDINFORME',INF:IDINFORME)                      ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  Relate:INFORME.Open                                      ! File INFORME used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW2.Init(?List,Queue:Browse.ViewPosition,BRW2::View:Browse,Queue:Browse,Relate:INFORME,SELF) ! Initialize the browse manager
  SELF.Open(Window)                                        ! Open window
  Do DefineListboxStyle
  BRW2.Q &= Queue:Browse
  BRW2.RetainRow = 0
  BRW2.AddSortOrder(,)                                     ! Add the sort order for  for sort order 1
  BRW2.SetFilter('(INF:TERMINADO = '''')')                 ! Apply filter expression to browse
  BRW2.AddField(INF:INFORME,BRW2.Q.INF:INFORME)            ! Field INF:INFORME is a hot field or requires assignment from browse
  BRW2.AddField(INF:FECHA,BRW2.Q.INF:FECHA)                ! Field INF:FECHA is a hot field or requires assignment from browse
  BRW2.AddField(INF:TERMINADO,BRW2.Q.INF:TERMINADO)        ! Field INF:TERMINADO is a hot field or requires assignment from browse
  BRW2.AddField(INF:IDINFORME,BRW2.Q.INF:IDINFORME)        ! Field INF:IDINFORME is a hot field or requires assignment from browse
  INIMgr.Fetch('INFORMES',Window)                          ! Restore window settings from non-volatile store
  BRW2.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
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
    INIMgr.Update('INFORMES',Window)                       ! Save window data to non-volatile store
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
      A# = INF:IDINFORME
      INF:IDINFORME = A#
      ACCESS:INFORME.TRYFETCH(INF:PK_INFORME)
      INF:TERMINADO = 'SI'
      ACCEsS:INFORME.UPDATE()
      thiswindow.reset(1)
    OF ?CancelButton
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


BRW2.ResetFromView PROCEDURE

LOC:TAREA:Cnt        LONG                                  ! Count variable for browse totals
  CODE
  SETCURSOR(Cursor:Wait)
  Relate:INFORME.SetQuickScan(1)
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
    LOC:TAREA:Cnt += 1
  END
  SELF.View{PROP:IPRequestCount} = 0
  LOC:TAREA = LOC:TAREA:Cnt
  PARENT.ResetFromView
  Relate:INFORME.SetQuickScan(0)
  SETCURSOR()

!!! <summary>
!!! Generated from procedure template - Report
!!! Print the SERVICIOS File
!!! </summary>
Reporte:SERVICIOS PROCEDURE 

Progress:Thermometer BYTE                                  ! 
Process:View         VIEW(SERVICIOS)
                       PROJECT(SER:DESCRIPCION)
                       PROJECT(SER:DESCUENTO)
                       PROJECT(SER:IDSERVICIOS)
                       PROJECT(SER:INTERES)
                       PROJECT(SER:MONTO)
                     END
ProgressWindow       WINDOW('Reporte de SERVICIOS'),AT(,,142,59),FONT('MS Sans Serif',8,,FONT:regular),DOUBLE,CENTER, |
  GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100),SMOOTH
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancelar'),AT(43,42,55,15),USE(?Progress:Cancel),LEFT,ICON('cancel.ICO'),FLAT,MSG('Cancela Reporte'), |
  TIP('Cancela Reporte')
                     END

Report               REPORT('SERVICIOS Report'),AT(250,850,7750,10333),PRE(RPT),PAPER(PAPER:A4),FONT('MS Sans Serif', |
  8,,FONT:regular),THOUS
                       HEADER,AT(250,250,7750,604),USE(?Header),FONT('MS Sans Serif',8,,FONT:regular)
                         STRING('Reporte de  SERVICIOS'),AT(0,20,7750,220),USE(?ReportTitle),FONT('MS Sans Serif',8, |
  ,FONT:regular),CENTER
                         BOX,AT(0,350,7750,250),USE(?HeaderBox),COLOR(COLOR:Black)
                         LINE,AT(1550,350,0,250),USE(?HeaderLine:1),COLOR(COLOR:Black)
                         LINE,AT(3100,350,0,250),USE(?HeaderLine:2),COLOR(COLOR:Black)
                         LINE,AT(4650,350,0,250),USE(?HeaderLine:3),COLOR(COLOR:Black)
                         LINE,AT(6200,350,0,250),USE(?HeaderLine:4),COLOR(COLOR:Black)
                         STRING('IDSERVICIOS'),AT(50,390,1450,170),USE(?HeaderTitle:1),TRN
                         STRING('DESCRIPCION'),AT(1600,390,1450,170),USE(?HeaderTitle:2),TRN
                         STRING('MONTO'),AT(3150,390,1450,170),USE(?HeaderTitle:3),TRN
                         STRING('DESCUENTO'),AT(4700,390,1450,170),USE(?HeaderTitle:4),TRN
                         STRING('INTERES'),AT(6250,390,1450,170),USE(?HeaderTitle:5),TRN
                       END
Detail                 DETAIL,AT(,,7750,208),USE(?Detail)
                         LINE,AT(0,0,0,210),USE(?DetailLine:0),COLOR(COLOR:Black)
                         LINE,AT(1550,0,0,210),USE(?DetailLine:1),COLOR(COLOR:Black)
                         LINE,AT(3100,0,0,210),USE(?DetailLine:2),COLOR(COLOR:Black)
                         LINE,AT(4650,0,0,210),USE(?DetailLine:3),COLOR(COLOR:Black)
                         LINE,AT(6200,0,0,210),USE(?DetailLine:4),COLOR(COLOR:Black)
                         LINE,AT(7750,0,0,210),USE(?DetailLine:5),COLOR(COLOR:Black)
                         STRING(@n-14),AT(50,50,1450,170),USE(SER:IDSERVICIOS)
                         STRING(@s50),AT(1600,50,1450,170),USE(SER:DESCRIPCION)
                         STRING(@n-10.2),AT(3150,50,1450,170),USE(SER:MONTO)
                         STRING(@n-14),AT(4700,50,1450,170),USE(SER:DESCUENTO)
                         STRING(@n-7.2),AT(6250,50,1450,170),USE(SER:INTERES)
                         LINE,AT(0,210,7750,0),USE(?DetailEndLine),COLOR(COLOR:Black)
                       END
                       FOOTER,AT(250,11188,7750,250),USE(?Footer)
                         STRING('Fecha:'),AT(115,52,344,135),USE(?ReportDatePrompt),FONT('Arial',8,,FONT:regular),TRN
                         STRING('<<-- Date Stamp -->'),AT(490,52,927,135),USE(?ReportDateStamp),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING('Hora:'),AT(1625,52,271,135),USE(?ReportTimePrompt),FONT('Arial',8,,FONT:regular),TRN
                         STRING('<<-- Time Stamp -->'),AT(1927,52,927,135),USE(?ReportTimeStamp),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING(@pPag. <<#p),AT(6950,52,700,135),USE(?PageCount),FONT('Arial',8,,FONT:regular),PAGENO
                       END
                       FORM,AT(250,250,7750,11188),USE(?Form),FONT('MS Sans Serif',8,,FONT:regular)
                         IMAGE,AT(0,0,7750,11188),USE(?FormImage),TILED
                       END
                     END
ProcessSortSelectionVariable         STRING(100)           ! Used in the sort order selection
ProcessSortSelectionCanceled         BYTE                  ! Used in the sort order selection to know if it was canceled
ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
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
ProcessSortSelectionWindow    ROUTINE
 DATA
SortSelectionWindow WINDOW('Selecciona Orden'),AT(,,165,92),FONT('Microsoft Sans Serif',8,,),CENTER,GRAY,DOUBLE
       PROMPT('Seleccion de Orden de Proceso.'),AT(5,4,156,18),FONT(,,,FONT:bold),USE(?SortMessage:Prompt)
       LIST,AT(5,26,155,42),FONT('Microsoft Sans Serif',8,,FONT:bold),USE(ProcessSortSelectionVariable,,?SortSelectionList),VSCROLL,FORMAT('100L@s100@'),FROM('')
       BUTTON('&Aceptar'),AT(51,74,52,14),ICON('SOK.ICO'),MSG('Aceptar'),TIP('Aceptar'),USE(?SButtonOk),LEFT,FLAT
       BUTTON('&Cancelar'),AT(107,74,52,14),ICON('SCANCEL.ICO'),MSG('Cancela operacion'),TIP('Cancela operacion'),USE(?SButtonCancel),LEFT,FLAT
     END
 CODE
      ProcessSortSelectionCanceled=1
      ProcessSortSelectionVariable=''
      OPEN(SortSelectionWindow)
      ?SortSelectionList{PROP:FROM}=''&|
      'PK_SERVICIOS' & |
      '|' & 'IDX_SERVICIOS_DESCRIPCION' & |
      ''
      ?SortSelectionList{PROP:Selected}=1
      ?SortSelectionList{Prop:Alrt,252} = MouseLeft2

      ACCEPT
        CASE EVENT()
        OF Event:OpenWindow
            CYCLE
        OF Event:Timer
            CYCLE
        END
        CASE FIELD()
        OF ?SortSelectionList
          IF KEYCODE() = MouseLeft2
              ProcessSortSelectionCanceled=0
              POST(Event:CloseWindow)
          END
        END
        CASE ACCEPTED()
        OF ?SButtonCancel
            ProcessSortSelectionVariable=''
            ProcessSortSelectionCanceled=1
            POST(Event:CloseWindow)
        OF ?SButtonOk
            ProcessSortSelectionCanceled=0
            POST(Event:CloseWindow)
        END
      END
      CLOSE(SortSelectionWindow)
 IF ProcessSortSelectionCanceled THEN
    ProcessSortSelectionVariable=''
 END
 EXIT

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('Reporte:SERVICIOS')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Do ProcessSortSelectionWindow
  IF ProcessSortSelectionCanceled THEN
     RETURN LEvel:Fatal
  END
  Relate:SERVICIOS.Open                                    ! File SERVICIOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('Reporte:SERVICIOS',ProgressWindow)         ! Restore window settings from non-volatile store
  TargetSelector.AddItem(XMLReporter.IReportGenerator)
  TargetSelector.AddItem(HTMLReporter.IReportGenerator)
  TargetSelector.AddItem(TXTReporter.IReportGenerator)
  TargetSelector.AddItem(PDFReporter.IReportGenerator)
  SELF.AddItem(TargetSelector)
  ThisReport.Init(Process:View, Relate:SERVICIOS, ?Progress:PctText, Progress:Thermometer)
  ThisReport.AddSortOrder()
  IF (UPPER(CLIP(ProcessSortSelectionVariable))=UPPER('PK_SERVICIOS')) THEN
     ThisReport.AppendOrder('+SER:IDSERVICIOS')
  ELSIF (UPPER(CLIP(ProcessSortSelectionVariable))=UPPER('IDX_SERVICIOS_DESCRIPCION')) THEN
     ThisReport.AppendOrder('+SER:DESCRIPCION')
  END
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:SERVICIOS.SetQuickScan(1,Propagate:OneMany)
  ProgressWindow{PROP:Timer} = 10                          ! Assign timer interval
  SELF.SkipPreview = False
  SELF.Zoom = PageWidth
  Previewer.SetINIManager(INIMgr)
  Previewer.AllowUserZoom = True
  Previewer.Maximize = True
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:SERVICIOS.Close
  END
  IF SELF.Opened
    INIMgr.Update('Reporte:SERVICIOS',ProgressWindow)      ! Save window data to non-volatile store
  END
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
  SELF.Attribute.Set(?ReportTitle,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ReportTitle,RepGen:XML,TargetAttr:TagName,'ReportTitle')
  SELF.Attribute.Set(?ReportTitle,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?HeaderTitle:1,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?HeaderTitle:1,RepGen:XML,TargetAttr:TagName,'HeaderTitle:1')
  SELF.Attribute.Set(?HeaderTitle:1,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?HeaderTitle:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?HeaderTitle:2,RepGen:XML,TargetAttr:TagName,'HeaderTitle:2')
  SELF.Attribute.Set(?HeaderTitle:2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?HeaderTitle:3,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?HeaderTitle:3,RepGen:XML,TargetAttr:TagName,'HeaderTitle:3')
  SELF.Attribute.Set(?HeaderTitle:3,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?HeaderTitle:4,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?HeaderTitle:4,RepGen:XML,TargetAttr:TagName,'HeaderTitle:4')
  SELF.Attribute.Set(?HeaderTitle:4,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?HeaderTitle:5,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?HeaderTitle:5,RepGen:XML,TargetAttr:TagName,'HeaderTitle:5')
  SELF.Attribute.Set(?HeaderTitle:5,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SER:IDSERVICIOS,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SER:IDSERVICIOS,RepGen:XML,TargetAttr:TagName,'SER:IDSERVICIOS')
  SELF.Attribute.Set(?SER:IDSERVICIOS,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SER:DESCRIPCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SER:DESCRIPCION,RepGen:XML,TargetAttr:TagName,'SER:DESCRIPCION')
  SELF.Attribute.Set(?SER:DESCRIPCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SER:MONTO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SER:MONTO,RepGen:XML,TargetAttr:TagName,'SER:MONTO')
  SELF.Attribute.Set(?SER:MONTO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SER:DESCUENTO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SER:DESCUENTO,RepGen:XML,TargetAttr:TagName,'SER:DESCUENTO')
  SELF.Attribute.Set(?SER:DESCUENTO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SER:INTERES,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SER:INTERES,RepGen:XML,TargetAttr:TagName,'SER:INTERES')
  SELF.Attribute.Set(?SER:INTERES,RepGen:XML,TargetAttr:TagValueFromText,True)
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
  SELF.Attribute.Set(?PageCount,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PageCount,RepGen:XML,TargetAttr:TagName,'PageCount')
  SELF.Attribute.Set(?PageCount,RepGen:XML,TargetAttr:TagValueFromText,True)


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
  SELF.SetCheckBoxString('[X]','[_]')
  SELF.SetRadioButtonString('(*)','(_)')
  SELF.SetLineString('|','|','-','-','/','\','\','/')
  SELF.SetTextFillString(' ',CHR(176),CHR(177),CHR(178),CHR(219))
  SELF.SetOmitGraph(False)


PDFReporter.SetUp PROCEDURE

  CODE
  PARENT.SetUp
  SELF.SetFileName('')
  SELF.SetDocumentInfo('CW Report','Gestion','Reporte:SERVICIOS','Reporte:SERVICIOS','','')
  SELF.SetPagesAsParentBookmark(False)
  SELF.SetScanCopyMode(False)
  SELF.CompressText   = True
  SELF.CompressImages = True

