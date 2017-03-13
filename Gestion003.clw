

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABPRHTML.INC'),ONCE
   INCLUDE('ABPRPDF.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABUTIL.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE
   INCLUDE('abprtext.inc'),ONCE
   INCLUDE('abprxml.inc'),ONCE
   INCLUDE('abrppsel.inc'),ONCE

                     MAP
                       INCLUDE('GESTION003.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION004.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Report
!!! </summary>
IMPRIMIR_CONSULTORIO_CANTIDAD PROCEDURE 

Progress:Thermometer BYTE                                  ! 
L:NroReg             LONG                                  ! 
Process:View         VIEW(CONSULTORIO)
                       PROJECT(CON2:IDCONSULTORIO)
                       PROJECT(CON2:IDSOCIO)
                       JOIN(SOC:PK_SOCIOS,CON2:IDSOCIO)
                         PROJECT(SOC:IDSOCIO)
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

Report               REPORT,AT(1000,2000,6250,7688),PRE(RPT),PAPER(PAPER:A4),FONT('Arial',10,,FONT:regular,CHARSET:ANSI), |
  THOUS
                       HEADER,AT(1000,1000,6250,1000),USE(?Header)
                         STRING('REPORTE OFICINAS  POR COLEGIADO'),AT(1854,365),USE(?String9),FONT(,,,FONT:bold+FONT:underline), |
  TRN
                         LINE,AT(10,729,6229,0),USE(?Line5),COLOR(COLOR:Black)
                         STRING('NOMBRE'),AT(2792,750),USE(?String12),TRN
                         STRING('MATRICULA'),AT(1375,771),USE(?String11),TRN
                         STRING('ID SOCIO'),AT(115,771),USE(?String10),TRN
                         STRING('CANTIDAD'),AT(4906,802),USE(?String13),TRN
                         LINE,AT(10,969,6229,0),USE(?Line4),COLOR(COLOR:Black)
                       END
break1                 BREAK(SOC:IDSOCIO)
detail1                  DETAIL,AT(,,,0)
                           STRING(@n-14),AT(417,83),USE(CON2:IDCONSULTORIO),DISABLE,HIDE
                         END
                         FOOTER,AT(,,,250)
                           STRING(@s7),AT(1198,21),USE(SOC:MATRICULA)
                           STRING(@s30),AT(2365,21),USE(SOC:NOMBRE)
                           STRING(@n-14),AT(42,21),USE(SOC:IDSOCIO)
                           STRING(@n-14),AT(5135,21),USE(CON2:IDCONSULTORIO,,?CON2:IDCONSULTORIO:2),CNT,RESET(break1)
                           LINE,AT(10,229,6229,0),USE(?Line1),COLOR(COLOR:Black)
                         END
                       END
                       FOOTER,AT(1000,9688,6250,1000),USE(?Footer)
                         LINE,AT(10,10,7271,0),USE(?Line3),COLOR(COLOR:Black)
                         STRING('Fecha del Reporte:'),AT(21,31),USE(?EcFechaReport),FONT('Courier New',7),TRN
                         STRING('DatoEmpresa'),AT(2125,31),USE(?DatoEmpresa),FONT('Courier New',7),TRN
                         STRING('Evolution_Paginas_'),AT(5625,31),USE(?PaginaNdeX),FONT('Courier New',7),TRN
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
  GlobalErrors.SetProcedureName('IMPRIMIR_CONSULTORIO_CANTIDAD')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:CONSULTORIO.Open                                  ! File CONSULTORIO used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('IMPRIMIR_CONSULTORIO_CANTIDAD',ProgressWindow) ! Restore window settings from non-volatile store
  TargetSelector.AddItem(XMLReporter.IReportGenerator)
  TargetSelector.AddItem(HTMLReporter.IReportGenerator)
  TargetSelector.AddItem(TXTReporter.IReportGenerator)
  TargetSelector.AddItem(PDFReporter.IReportGenerator)
  SELF.AddItem(TargetSelector)
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisReport.Init(Process:View, Relate:CONSULTORIO, ?Progress:PctText, Progress:Thermometer, ProgressMgr, CON2:IDSOCIO)
  ThisReport.AddSortOrder(CON2:FK_CONSULTORIO_SOCIOS)
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:CONSULTORIO.SetQuickScan(1,Propagate:OneMany)
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
    Relate:CONSULTORIO.Close
  END
  IF SELF.Opened
    INIMgr.Update('IMPRIMIR_CONSULTORIO_CANTIDAD',ProgressWindow) ! Save window data to non-volatile store
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
  SELF.Attribute.Set(?String9,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String9,RepGen:XML,TargetAttr:TagName,'String9')
  SELF.Attribute.Set(?String9,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String12,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String12,RepGen:XML,TargetAttr:TagName,'String12')
  SELF.Attribute.Set(?String12,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String11,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String11,RepGen:XML,TargetAttr:TagName,'String11')
  SELF.Attribute.Set(?String11,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String10,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String10,RepGen:XML,TargetAttr:TagName,'String10')
  SELF.Attribute.Set(?String10,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String13,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String13,RepGen:XML,TargetAttr:TagName,'String13')
  SELF.Attribute.Set(?String13,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagName,'SOC:MATRICULA')
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagName,'SOC:NOMBRE')
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:IDSOCIO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:IDSOCIO,RepGen:XML,TargetAttr:TagName,'SOC:IDSOCIO')
  SELF.Attribute.Set(?SOC:IDSOCIO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?CON2:IDCONSULTORIO:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?CON2:IDCONSULTORIO:2,RepGen:XML,TargetAttr:TagName,'CON2:IDCONSULTORIO:2')
  SELF.Attribute.Set(?CON2:IDCONSULTORIO:2,RepGen:XML,TargetAttr:TagValueFromText,True)
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
  SELF.SetCheckBoxString('[X]','[_]')
  SELF.SetRadioButtonString('(*)','(_)')
  SELF.SetLineString('|','|','-','-','/','\','\','/')
  SELF.SetTextFillString(' ',CHR(176),CHR(177),CHR(178),CHR(219))
  SELF.SetOmitGraph(False)


PDFReporter.SetUp PROCEDURE

  CODE
  PARENT.SetUp
  SELF.SetFileName('')
  SELF.SetDocumentInfo('CW Report','Gestion','IMPRIMIR_CONSULTORIO_CANTIDAD','IMPRIMIR_CONSULTORIO_CANTIDAD','','')
  SELF.SetPagesAsParentBookmark(False)
  SELF.SetScanCopyMode(False)
  SELF.CompressText   = True
  SELF.CompressImages = True

!!! <summary>
!!! Generated from procedure template - Report
!!! Report the CONSULTORIO SOCIO
!!! </summary>
IMPRIMIR_CONSULTORIO_SOCIO PROCEDURE 

Progress:Thermometer BYTE                                  ! 
Process:View         VIEW(CONSULTORIO)
                       PROJECT(CON2:DIRECCION)
                       PROJECT(CON2:IDCONSULTORIO)
                       PROJECT(CON2:IDLOCALIDAD)
                       PROJECT(CON2:IDSOCIO)
                       JOIN(LOC:PK_LOCALIDAD,CON2:IDLOCALIDAD)
                         PROJECT(LOC:DESCRIPCION)
                       END
                       JOIN(SOC:PK_SOCIOS,CON2:IDSOCIO)
                         PROJECT(SOC:MATRICULA)
                         PROJECT(SOC:NOMBRE)
                       END
                     END
ProgressWindow       WINDOW('Reporte de CONSULTORIO'),AT(,,142,59),FONT('MS Sans Serif',8,,FONT:regular),DOUBLE, |
  CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100),SMOOTH
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancelar'),AT(43,42,55,15),USE(?Progress:Cancel),LEFT,ICON('cancel.ICO'),FLAT,MSG('Cancela Reporte'), |
  TIP('Cancela Reporte')
                     END

Report               REPORT('CONSULTORIO Report'),AT(250,854,7750,9719),PRE(RPT),PAPER(PAPER:A4),FONT('Arial',8, |
  ,FONT:bold),THOUS
                       HEADER,AT(250,250,7750,604),USE(?Header),FONT('Arial',8,,FONT:bold)
                         STRING('Reporte de Oficinas'),AT(0,21,7750,219),USE(?ReportTitle),FONT('MS Sans Serif',8,, |
  FONT:regular),CENTER
                         BOX,AT(10,344,7750,250),USE(?HeaderBox),COLOR(COLOR:Black)
                         STRING('ID OF.'),AT(52,385,552,167),USE(?HeaderTitle:1),TRN
                         STRING('NOMBRE'),AT(2365,385,667,167),USE(?HeaderTitle:2),TRN
                         STRING('LOCALIDAD'),AT(4063,385,646,167),USE(?HeaderTitle:3),TRN
                         STRING('DIRECCION'),AT(6323,385,729,167),USE(?HeaderTitle:4),TRN
                         STRING('SOCIO'),AT(698,385),USE(?String18),TRN
                         STRING('MATRIC.'),AT(1177,385),USE(?String19),TRN
                       END
Detail                 DETAIL,AT(,,7750,208),USE(?Detail)
                         LINE,AT(0,0,0,208),USE(?DetailLine:0),COLOR(COLOR:Black)
                         LINE,AT(7750,0,0,208),USE(?DetailLine:4),COLOR(COLOR:Black)
                         STRING(@n-7),AT(42,21,510,167),USE(CON2:IDCONSULTORIO),LEFT
                         STRING(@s7),AT(1198,21),USE(SOC:MATRICULA)
                         STRING(@s30),AT(1740,21),USE(SOC:NOMBRE)
                         STRING(@n-5),AT(3771,21),USE(CON2:IDLOCALIDAD)
                         STRING(@s20),AT(4219,21),USE(LOC:DESCRIPCION)
                         STRING(@n-7),AT(656,21),USE(CON2:IDSOCIO)
                         STRING(@s30),AT(5698,21),USE(CON2:DIRECCION)
                         LINE,AT(0,208,7750,0),USE(?DetailEndLine),COLOR(COLOR:Black)
                       END
                       FOOTER,AT(229,10573,7750,542),USE(?Footer),FONT('Arial',8,,FONT:bold,CHARSET:ANSI)
                         STRING('CANTIDAD DE CONSULTORIOS:'),AT(2615,31),USE(?String20),TRN
                         STRING(@n-14),AT(4323,21),USE(CON2:IDCONSULTORIO,,?CON2:IDCONSULTORIO:2),CNT
                         STRING('Fecha:'),AT(115,281,344,135),USE(?ReportDatePrompt),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING('<<-- Date Stamp -->'),AT(490,281,927,135),USE(?ReportDateStamp),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING('Hora:'),AT(1625,281,271,135),USE(?ReportTimePrompt),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING('<<-- Time Stamp -->'),AT(1927,281,927,135),USE(?ReportTimeStamp),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING(@pPag. <<#p),AT(6948,281,698,135),USE(?PageCount),FONT('Arial',8,,FONT:regular),PAGENO
                       END
                       FORM,AT(229,250,7750,10844),USE(?Form),FONT('MS Sans Serif',8,,FONT:regular)
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
      'PK_CONSULTORIO' & |
      '|' & 'FK_CONSULTORIO_INSPECTOR' & |
      '|' & 'FK_CONSULTORIO_LOCALIDAD' & |
      '|' & 'FK_CONSULTORIO_SOCIOS' & |
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
  GlobalErrors.SetProcedureName('IMPRIMIR_CONSULTORIO_SOCIO')
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
  Relate:CONSULTORIO.Open                                  ! File CONSULTORIO used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('IMPRIMIR_CONSULTORIO_SOCIO',ProgressWindow) ! Restore window settings from non-volatile store
  TargetSelector.AddItem(XMLReporter.IReportGenerator)
  TargetSelector.AddItem(HTMLReporter.IReportGenerator)
  TargetSelector.AddItem(TXTReporter.IReportGenerator)
  TargetSelector.AddItem(PDFReporter.IReportGenerator)
  SELF.AddItem(TargetSelector)
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisReport.Init(Process:View, Relate:CONSULTORIO, ?Progress:PctText, Progress:Thermometer, ProgressMgr, CON2:IDSOCIO)
  ThisReport.AddSortOrder(CON2:FK_CONSULTORIO_SOCIOS)
  ThisReport.AddRange(CON2:IDSOCIO,GLO:IDSOCIO)
  IF (UPPER(CLIP(ProcessSortSelectionVariable))=UPPER('PK_CONSULTORIO')) THEN
     ThisReport.AppendOrder('+CON2:IDCONSULTORIO')
  ELSIF (UPPER(CLIP(ProcessSortSelectionVariable))=UPPER('FK_CONSULTORIO_INSPECTOR')) THEN
     ThisReport.AppendOrder('+CON2:IDINSPECTOR')
  ELSIF (UPPER(CLIP(ProcessSortSelectionVariable))=UPPER('FK_CONSULTORIO_LOCALIDAD')) THEN
     ThisReport.AppendOrder('+CON2:IDLOCALIDAD')
  ELSIF (UPPER(CLIP(ProcessSortSelectionVariable))=UPPER('FK_CONSULTORIO_SOCIOS')) THEN
     ThisReport.AppendOrder('+CON2:IDSOCIO')
  END
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:CONSULTORIO.SetQuickScan(1,Propagate:OneMany)
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
    Relate:CONSULTORIO.Close
  END
  IF SELF.Opened
    INIMgr.Update('IMPRIMIR_CONSULTORIO_SOCIO',ProgressWindow) ! Save window data to non-volatile store
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
  SELF.Attribute.Set(?String18,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String18,RepGen:XML,TargetAttr:TagName,'String18')
  SELF.Attribute.Set(?String18,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String19,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String19,RepGen:XML,TargetAttr:TagName,'String19')
  SELF.Attribute.Set(?String19,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?CON2:IDCONSULTORIO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?CON2:IDCONSULTORIO,RepGen:XML,TargetAttr:TagName,'CON2:IDCONSULTORIO')
  SELF.Attribute.Set(?CON2:IDCONSULTORIO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagName,'SOC:MATRICULA')
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagName,'SOC:NOMBRE')
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?CON2:IDLOCALIDAD,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?CON2:IDLOCALIDAD,RepGen:XML,TargetAttr:TagName,'CON2:IDLOCALIDAD')
  SELF.Attribute.Set(?CON2:IDLOCALIDAD,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?LOC:DESCRIPCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?LOC:DESCRIPCION,RepGen:XML,TargetAttr:TagName,'LOC:DESCRIPCION')
  SELF.Attribute.Set(?LOC:DESCRIPCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?CON2:IDSOCIO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?CON2:IDSOCIO,RepGen:XML,TargetAttr:TagName,'CON2:IDSOCIO')
  SELF.Attribute.Set(?CON2:IDSOCIO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?CON2:DIRECCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?CON2:DIRECCION,RepGen:XML,TargetAttr:TagName,'CON2:DIRECCION')
  SELF.Attribute.Set(?CON2:DIRECCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String20,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String20,RepGen:XML,TargetAttr:TagName,'String20')
  SELF.Attribute.Set(?String20,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?CON2:IDCONSULTORIO:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?CON2:IDCONSULTORIO:2,RepGen:XML,TargetAttr:TagName,'CON2:IDCONSULTORIO:2')
  SELF.Attribute.Set(?CON2:IDCONSULTORIO:2,RepGen:XML,TargetAttr:TagValueFromText,True)
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
  SELF.SetDocumentInfo('CW Report','Gestion','Reporte:CONSULTORIO','Reporte:CONSULTORIO','','')
  SELF.SetPagesAsParentBookmark(False)
  SELF.SetScanCopyMode(False)
  SELF.CompressText   = True
  SELF.CompressImages = True

!!! <summary>
!!! Generated from procedure template - Report
!!! Print the COBERTURA File
!!! </summary>
Reporte:COBERTURA PROCEDURE 

Progress:Thermometer BYTE                                  ! 
Process:View         VIEW(COBERTURA)
                       PROJECT(COB:DESCRIPCION)
                       PROJECT(COB:DESCUENTO)
                       PROJECT(COB:IDCOBERTURA)
                       PROJECT(COB:MONTO)
                     END
ProgressWindow       WINDOW('Reporte de COBERTURA'),AT(,,142,59),FONT('MS Sans Serif',8,,FONT:regular),DOUBLE,CENTER, |
  GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100),SMOOTH
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancelar'),AT(43,42,55,15),USE(?Progress:Cancel),LEFT,ICON('cancel.ICO'),FLAT,MSG('Cancela Reporte'), |
  TIP('Cancela Reporte')
                     END

Report               REPORT('COBERTURA Report'),AT(250,850,7750,10338),PRE(RPT),PAPER(PAPER:A4),FONT('MS Sans Serif', |
  8,,FONT:regular),THOUS
                       HEADER,AT(250,250,7750,600),USE(?Header),FONT('MS Sans Serif',8,,FONT:regular)
                         STRING('Reporte de  COBERTURA'),AT(0,20,7750,220),USE(?ReportTitle),FONT('MS Sans Serif',8, |
  ,FONT:regular),CENTER
                         BOX,AT(0,350,7750,250),USE(?HeaderBox),COLOR(COLOR:Black)
                         LINE,AT(1937,350,0,250),USE(?HeaderLine:1),COLOR(COLOR:Black)
                         LINE,AT(3875,350,0,250),USE(?HeaderLine:2),COLOR(COLOR:Black)
                         LINE,AT(5812,350,0,250),USE(?HeaderLine:3),COLOR(COLOR:Black)
                         STRING('IDCOBERTURA'),AT(50,390,1837,170),USE(?HeaderTitle:1),TRN
                         STRING('DESCRIPCION'),AT(1987,390,1837,170),USE(?HeaderTitle:2),TRN
                         STRING('MONTO'),AT(3925,390,1837,170),USE(?HeaderTitle:3),TRN
                         STRING('DESCUENTO'),AT(5862,390,1837,170),USE(?HeaderTitle:4),TRN
                       END
Detail                 DETAIL,AT(,,7750,210),USE(?Detail)
                         LINE,AT(0,0,0,210),USE(?DetailLine:0),COLOR(COLOR:Black)
                         LINE,AT(1937,0,0,210),USE(?DetailLine:1),COLOR(COLOR:Black)
                         LINE,AT(3875,0,0,210),USE(?DetailLine:2),COLOR(COLOR:Black)
                         LINE,AT(5812,0,0,210),USE(?DetailLine:3),COLOR(COLOR:Black)
                         LINE,AT(7750,0,0,210),USE(?DetailLine:4),COLOR(COLOR:Black)
                         STRING(@n-14),AT(50,50,1837,170),USE(COB:IDCOBERTURA)
                         STRING(@s20),AT(1987,50,1837,170),USE(COB:DESCRIPCION)
                         STRING(@n-14),AT(3925,50,1837,170),USE(COB:MONTO)
                         STRING(@n-14),AT(5862,50,1837,170),USE(COB:DESCUENTO)
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
      'PK_COBERTURA' & |
      '|' & 'IDX_COBERTURA' & |
      '|' & 'IDX_MONTO' & |
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
  GlobalErrors.SetProcedureName('Reporte:COBERTURA')
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
  Relate:COBERTURA.Open                                    ! File COBERTURA used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('Reporte:COBERTURA',ProgressWindow)         ! Restore window settings from non-volatile store
  TargetSelector.AddItem(XMLReporter.IReportGenerator)
  TargetSelector.AddItem(HTMLReporter.IReportGenerator)
  TargetSelector.AddItem(TXTReporter.IReportGenerator)
  TargetSelector.AddItem(PDFReporter.IReportGenerator)
  SELF.AddItem(TargetSelector)
  ThisReport.Init(Process:View, Relate:COBERTURA, ?Progress:PctText, Progress:Thermometer)
  ThisReport.AddSortOrder()
  IF (UPPER(CLIP(ProcessSortSelectionVariable))=UPPER('PK_COBERTURA')) THEN
     ThisReport.AppendOrder('+COB:IDCOBERTURA')
  ELSIF (UPPER(CLIP(ProcessSortSelectionVariable))=UPPER('IDX_COBERTURA')) THEN
     ThisReport.AppendOrder('+COB:DESCRIPCION')
  ELSIF (UPPER(CLIP(ProcessSortSelectionVariable))=UPPER('IDX_MONTO')) THEN
     ThisReport.AppendOrder('+COB:MONTO')
  END
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:COBERTURA.SetQuickScan(1,Propagate:OneMany)
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
    Relate:COBERTURA.Close
  END
  IF SELF.Opened
    INIMgr.Update('Reporte:COBERTURA',ProgressWindow)      ! Save window data to non-volatile store
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
  SELF.Attribute.Set(?COB:IDCOBERTURA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?COB:IDCOBERTURA,RepGen:XML,TargetAttr:TagName,'COB:IDCOBERTURA')
  SELF.Attribute.Set(?COB:IDCOBERTURA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?COB:DESCRIPCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?COB:DESCRIPCION,RepGen:XML,TargetAttr:TagName,'COB:DESCRIPCION')
  SELF.Attribute.Set(?COB:DESCRIPCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?COB:MONTO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?COB:MONTO,RepGen:XML,TargetAttr:TagName,'COB:MONTO')
  SELF.Attribute.Set(?COB:MONTO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?COB:DESCUENTO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?COB:DESCUENTO,RepGen:XML,TargetAttr:TagName,'COB:DESCUENTO')
  SELF.Attribute.Set(?COB:DESCUENTO,RepGen:XML,TargetAttr:TagValueFromText,True)
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
  SELF.SetDocumentInfo('CW Report','Gestion','Reporte:COBERTURA','Reporte:COBERTURA','','')
  SELF.SetPagesAsParentBookmark(False)
  SELF.SetScanCopyMode(False)
  SELF.CompressText   = True
  SELF.CompressImages = True

!!! <summary>
!!! Generated from procedure template - Window
!!! Select a TIPO_IVA Record
!!! </summary>
SelectTIPO_IVA PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(TIPO_IVA)
                       PROJECT(TIP7:IDTIPOIVA)
                       PROJECT(TIP7:DECRIPCION)
                       PROJECT(TIP7:RETENCION)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
TIP7:IDTIPOIVA         LIKE(TIP7:IDTIPOIVA)           !List box control field - type derived from field
TIP7:DECRIPCION        LIKE(TIP7:DECRIPCION)          !List box control field - type derived from field
TIP7:RETENCION         LIKE(TIP7:RETENCION)           !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Select a TIPO_IVA Record'),AT(,,193,198),FONT('MS Sans Serif',8,,FONT:regular),RESIZE, |
  CENTER,GRAY,IMM,MDI,HLP('SelectTIPO_IVA'),SYSTEM
                       LIST,AT(8,30,152,124),USE(?Browse:1),HVSCROLL,FORMAT('40R(2)|M~IDTIPOIVA~C(0)@n-3@80L(2' & |
  ')|M~DECRIPCION~L(2)@s30@40D(12)|M~RETENCION~C(0)@n-7.2@'),FROM(Queue:Browse:1),IMM,MSG('Administra' & |
  'dor de TIPO_IVA')
                       BUTTON('&Elegir'),AT(111,158,49,14),USE(?Select:2),LEFT,ICON('e.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Seleccionar'),TIP('Seleccionar')
                       SHEET,AT(4,4,160,172),USE(?CurrentTab)
                         TAB('DESCRIPCION'),USE(?Tab:1)
                         END
                         TAB('ID'),USE(?Tab:2)
                         END
                       END
                       BUTTON('&Salir'),AT(115,180,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
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
  GlobalErrors.SetProcedureName('SelectTIPO_IVA')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('TIP7:IDTIPOIVA',TIP7:IDTIPOIVA)                    ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:TIPO_IVA.Open                                     ! File TIPO_IVA used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:TIPO_IVA,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,TIP7:IDX_TIPOIVA_DESCRIPCION)         ! Add the sort order for TIP7:IDX_TIPOIVA_DESCRIPCION for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,TIP7:DECRIPCION,,BRW1)         ! Initialize the browse locator using  using key: TIP7:IDX_TIPOIVA_DESCRIPCION , TIP7:DECRIPCION
  BRW1.AddSortOrder(,TIP7:IDX_TIPOIVA_DESCRIPCION)         ! Add the sort order for TIP7:IDX_TIPOIVA_DESCRIPCION for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(,TIP7:DECRIPCION,,BRW1)         ! Initialize the browse locator using  using key: TIP7:IDX_TIPOIVA_DESCRIPCION , TIP7:DECRIPCION
  BRW1.AddField(TIP7:IDTIPOIVA,BRW1.Q.TIP7:IDTIPOIVA)      ! Field TIP7:IDTIPOIVA is a hot field or requires assignment from browse
  BRW1.AddField(TIP7:DECRIPCION,BRW1.Q.TIP7:DECRIPCION)    ! Field TIP7:DECRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(TIP7:RETENCION,BRW1.Q.TIP7:RETENCION)      ! Field TIP7:RETENCION is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('SelectTIPO_IVA',QuickWindow)               ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:TIPO_IVA.Close
  END
  IF SELF.Opened
    INIMgr.Update('SelectTIPO_IVA',QuickWindow)            ! Save window data to non-volatile store
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
!!! Actualizacion SOCIOS
!!! </summary>
UpdateSOCIOS PROCEDURE 

CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
History::SOC:Record  LIKE(SOC:RECORD),THREAD
QuickWindow          WINDOW('Actualizacion Colegiados'),AT(,,521,312),FONT('Arial',8,,FONT:regular),RESIZE,CENTER, |
  GRAY,IMM,MDI,HLP('UpdateSOCIOS'),SYSTEM
                       GROUP('DATOS PERSONALES'),AT(0,1,518,67),USE(?Group4),BOXED
                         PROMPT('TIPO DOC:'),AT(335,12),USE(?SOC:ID_TIPO_DOC:Prompt),TRN
                         ENTRY(@n-14),AT(375,12,21,10),USE(SOC:ID_TIPO_DOC)
                         PROMPT('N DOCUMENTO:'),AT(399,12),USE(?SOC:N_DOCUMENTO:Prompt),TRN
                         ENTRY(@n-14),AT(451,12,64,10),USE(SOC:N_DOCUMENTO),REQ
                         PROMPT('MATRICULA:'),AT(2,12),USE(?SOC:MATRICULA:Prompt)
                         ENTRY(@n-5),AT(44,12,28,10),USE(SOC:MATRICULA),REQ
                         PROMPT('APELLIDO:'),AT(75,12),USE(?SOC:APELLIDO:Prompt)
                         ENTRY(@s50),AT(111,12,61,10),USE(SOC:APELLIDO),UPR
                         PROMPT('NOMBRES:'),AT(175,12),USE(?SOC:NOMBRES:Prompt)
                         ENTRY(@s50),AT(212,12,119,10),USE(SOC:NOMBRES),UPR
                         PROMPT('DIRECCION:'),AT(4,26),USE(?SOC:DIRECCION:Prompt),TRN
                         ENTRY(@s100),AT(67,26,199,10),USE(SOC:DIRECCION),UPR
                         PROMPT('LOCALIDAD:'),AT(271,26),USE(?SOC:IDLOCALIDAD:Prompt),TRN
                         ENTRY(@n-14),AT(325,26,23,10),USE(SOC:IDLOCALIDAD)
                         BUTTON('...'),AT(351,25,12,12),USE(?CallLookup:2)
                         STRING(@s20),AT(367,26,88,10),USE(LOC:DESCRIPCION)
                         PROMPT('ZONA:'),AT(4,40),USE(?SOC:IDZONA:Prompt),TRN
                         ENTRY(@n-14),AT(41,40,22,10),USE(SOC:IDZONA)
                         BUTTON('...'),AT(64,39,12,12),USE(?CallLookup:3)
                         STRING(@s20),AT(82,40),USE(ZON:DESCRIPCION)
                         PROMPT('TELEFONO:'),AT(173,40),USE(?SOC:TELEFONO:Prompt),TRN
                         STRING(@s10),AT(216,40),USE(LOC:COD_TELEFONICO)
                         ENTRY(@s30),AT(264,40,69,10),USE(SOC:TELEFONO)
                         PROMPT('FECHA NACIMIENTO:'),AT(357,40),USE(?SOC:FECHA_NACIMIENTO:Prompt),TRN
                         ENTRY(@d17),AT(433,40,59,10),USE(SOC:FECHA_NACIMIENTO)
                         BUTTON('...'),AT(495,39,12,12),USE(?Calendar)
                         PROMPT('SEXO:'),AT(4,54),USE(?SOC:SEXO:Prompt)
                         COMBO(@s1),AT(31,54,39,10),USE(SOC:SEXO),DROP(10),FROM('M|F')
                         PROMPT('EMAIL:'),AT(78,54),USE(?SOC:EMAIL:Prompt),TRN
                         ENTRY(@s50),AT(107,54,203,10),USE(SOC:EMAIL)
                         PROMPT('LUGAR NAC.:'),AT(314,54),USE(?SOC:LUGAR_NACIMIENTO:Prompt)
                         ENTRY(@s50),AT(360,54,156,10),USE(SOC:LUGAR_NACIMIENTO),UPR
                       END
                       GROUP('LABORALES'),AT(0,68,518,58),USE(?Group5),BOXED
                         PROMPT('LUGAR TRABAJO:'),AT(5,74),USE(?SOC:LUGAR_TRABAJO:Prompt)
                         ENTRY(@s50),AT(87,74,354,10),USE(SOC:LUGAR_TRABAJO),UPR
                         PROMPT('DIRECCION LABORAL:'),AT(4,87),USE(?SOC:DIRECCION_LABORAL:Prompt),TRN
                         ENTRY(@s50),AT(88,87,167,10),USE(SOC:DIRECCION_LABORAL),UPR
                         PROMPT('TELEFONO LABORAL:'),AT(264,87),USE(?SOC:TELEFONO_LABORAL:Prompt),TRN
                         ENTRY(@s30),AT(348,87,48,10),USE(SOC:TELEFONO_LABORAL)
                         PROMPT('ID CIRCULO:'),AT(4,99),USE(?SOC:IDCIRCULO:Prompt),TRN
                         ENTRY(@n-14),AT(49,100,33,9),USE(SOC:IDCIRCULO)
                         BUTTON('...'),AT(85,99,12,12),USE(?CallLookup:4)
                         STRING(@s30),AT(103,99),USE(CIR:DESCRIPCION)
                         PROMPT('TELEFONO CELULAR:'),AT(265,99),USE(?SOC:CELULAR:Prompt)
                         ENTRY(@s50),AT(347,99,77,10),USE(SOC:CELULAR)
                         PROMPT('ID MINISTERIO:'),AT(3,112),USE(?SOC:IDMINISTERIO:Prompt)
                         ENTRY(@n-14),AT(53,112,21,10),USE(SOC:IDMINISTERIO)
                         BUTTON('...'),AT(77,111,12,12),USE(?CallLookup:7)
                         STRING(@s50),AT(92,113,146,10),USE(MIN:DESCRIPCION)
                         BUTTON('...'),AT(383,111,12,12),USE(?CallLookup:8)
                         PROMPT('IDCENTRO_SALUD:'),AT(274,114),USE(?SOC:IDCS:Prompt)
                         ENTRY(@s20),AT(338,113,45,10),USE(SOC:IDCS)
                         STRING(@s50),AT(397,113,117,10),USE(MCS:DESCRIPCION)
                       END
                       GROUP('CUOTA'),AT(2,127,518,38),USE(?Group6),BOXED
                         ENTRY(@n-14),AT(40,138,18,10),USE(SOC:IDCOBERTURA)
                         ENTRY(@P##-########-#P),AT(168,138,61,10),USE(SOC:CUIT)
                         ENTRY(@n-14),AT(265,138,21,10),USE(SOC:TIPOIVA),RIGHT(1)
                         ENTRY(@n-14),AT(346,138,21,10),USE(SOC:IDBANCO),REQ
                         ENTRY(@N022),AT(420,138,95,10),USE(SOC:CBU)
                         ENTRY(@n-14),AT(40,152,48,10),USE(SOC:ANSSAL),RIGHT(1)
                         PROMPT('CUIT:'),AT(150,139),USE(?SOC:CUIT:Prompt)
                         PROMPT('IDCUOTA:'),AT(5,139),USE(?SOC:IDCOBERTURA:Prompt),TRN
                         BUTTON('...'),AT(60,137,12,12),USE(?CallLookup:5)
                         STRING(@s20),AT(74,138,51,10),USE(COB:DESCRIPCION)
                         STRING(@n-5),AT(127,138),USE(COB:MONTO)
                         PROMPT('TIPOIVA:'),AT(235,138),USE(?SOC:TIPOIVA:Prompt)
                         BUTTON('...'),AT(291,137,12,12),USE(?CallLookup:9)
                         PROMPT('IDBANCO:'),AT(308,138),USE(?SOC:IDBANCO:Prompt)
                         BUTTON('...'),AT(371,137,12,12),USE(?CallLookup:10)
                         PROMPT('CBU:'),AT(395,138),USE(?SOC:CBU:Prompt)
                         PROMPT('ANSSAL:'),AT(5,153),USE(?SOC:SSALUD:Prompt)
                       END
                       GROUP('TITULO'),AT(1,165,517,41),USE(?Group3),BOXED
                         PROMPT('IDINSTITUCION:'),AT(4,177),USE(?SOC:IDINSTITUCION:Prompt),TRN
                         ENTRY(@n-14),AT(56,177,64,10),USE(SOC:IDINSTITUCION)
                         BUTTON('...'),AT(121,177,12,12),USE(?CallLookup)
                         STRING(@s50),AT(135,177,173,10),USE(INS2:NOMBRE)
                         PROMPT('F. EGRESO:'),AT(311,177),USE(?SOC:FECHA_EGRESO:Prompt)
                         ENTRY(@d17),AT(351,177,62,10),USE(SOC:FECHA_EGRESO),REQ
                         PROMPT('F. TITULO:'),AT(416,177),USE(?SOC:FECHA_TITULO:Prompt)
                         ENTRY(@d17),AT(451,177,62,10),USE(SOC:FECHA_TITULO)
                         PROMPT('IDTIPOTITULO:'),AT(6,193),USE(?SOC:IDTIPOTITULO:Prompt)
                         ENTRY(@n-14),AT(55,193,21,10),USE(SOC:IDTIPOTITULO)
                         BUTTON('...'),AT(80,193,12,12),USE(?CallLookup:6)
                         STRING(@s50),AT(94,193),USE(TIP6:DESCRIPCION)
                         OPTION('TIPO TITULO'),AT(245,186,121,18),USE(SOC:TIPO_TITULO),BOXED
                           RADIO('PROFESIONAL'),AT(249,193),USE(?SOC:TIPO_TITULO:Radio1)
                           RADIO('TECNICO'),AT(319,193),USE(?SOC:TIPO_TITULO:Radio2)
                         END
                       END
                       GROUP('LEGALES'),AT(0,205,518,21),USE(?Group2),BOXED
                         PROMPT('FECHA ALTA COL:'),AT(309,213),USE(?SOC:FECHA_ALTA:Prompt)
                         ENTRY(@d17),AT(375,213,41,10),USE(SOC:FECHA_ALTA)
                         PROMPT('LIBRO:'),AT(9,213),USE(?SOC:LIBRO:Prompt)
                         ENTRY(@n-14),AT(41,213,21,10),USE(SOC:LIBRO)
                         PROMPT('FOLIO:'),AT(77,213),USE(?SOC:FOLIO:Prompt)
                         ENTRY(@n-14),AT(105,213,21,10),USE(SOC:FOLIO)
                         PROMPT('PROVISORIO:'),AT(422,213),USE(?SOC:PROVISORIO:Prompt)
                         ENTRY(@s1),AT(472,213,21,10),USE(SOC:PROVISORIO),UPR
                         PROMPT('FECHA ALTA MINISTERIO:'),AT(149,213),USE(?SOC:FIN_COB:Prompt)
                         ENTRY(@d17),AT(235,213,43,10),USE(SOC:FECHA_ALTA_MIN)
                       END
                       GROUP('BAJAS '),AT(1,227,518,37),USE(?Group1),BOXED
                         PROMPT('FIN COBERTURA:'),AT(5,235),USE(?SOC:FIN_COBERTURA:Prompt),TRN
                         ENTRY(@d17),AT(74,235,64,10),USE(SOC:FIN_COBERTURA)
                         BUTTON('...'),AT(140,235,12,12),USE(?Calendar:2)
                         PROMPT('FECHA BAJADEFINITIVA:'),AT(300,235),USE(?SOC:FECHA_BAJA:Prompt),TRN
                         ENTRY(@d17),AT(386,235,64,10),USE(SOC:FECHA_BAJA)
                         BUTTON('...'),AT(453,235,12,12),USE(?Calendar:3)
                         PROMPT('BAJA TEMPORARIA:'),AT(158,235),USE(?SOC:BAJA_TEMPORARIA:Prompt)
                         COMBO(@s2),AT(226,235,39,10),USE(SOC:BAJA_TEMPORARIA),DROP(10),FROM('NO|SI')
                         PROMPT('OBSERVACION:'),AT(5,247),USE(?SOC:OBSERVACION:Prompt),TRN
                         ENTRY(@s100),AT(68,247,266,10),USE(SOC:OBSERVACION)
                       END
                       GROUP('OTRAS'),AT(0,263,518,32),USE(?Group7),BOXED
                         PROMPT('OTRAS MATRICULAS:'),AT(5,271),USE(?SOC:OTRAS_MATRICULAS:Prompt)
                         ENTRY(@s50),AT(93,271,420,10),USE(SOC:OTRAS_MATRICULAS)
                         PROMPT('OTRAS CERTIFICACIONES:'),AT(4,283),USE(?SOC:OTRAS_CERTIFICACIONES:Prompt)
                         ENTRY(@s50),AT(93,283,420,10),USE(SOC:OTRAS_CERTIFICACIONES)
                       END
                       BUTTON('&Aceptar'),AT(188,297,53,14),USE(?OK),LEFT,ICON('ok.ico'),CURSOR('mano.cur'),DEFAULT, |
  FLAT,MSG('Confirma y Actualiza el Formulario'),TIP('Confirma y Actualiza el Formulario')
                       BUTTON('&Cancelar'),AT(311,298,63,14),USE(?Cancel),LEFT,ICON('cancelar.ico'),CURSOR('mano.cur'), |
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

Calendar10           CalendarClass
Calendar13           CalendarClass
Calendar14           CalendarClass
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
  GlobalErrors.SetProcedureName('UpdateSOCIOS')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?SOC:ID_TIPO_DOC:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(SOC:Record,History::SOC:Record)
  SELF.AddHistoryField(?SOC:ID_TIPO_DOC,31)
  SELF.AddHistoryField(?SOC:N_DOCUMENTO,8)
  SELF.AddHistoryField(?SOC:MATRICULA,2)
  SELF.AddHistoryField(?SOC:APELLIDO,57)
  SELF.AddHistoryField(?SOC:NOMBRES,58)
  SELF.AddHistoryField(?SOC:DIRECCION,9)
  SELF.AddHistoryField(?SOC:IDLOCALIDAD,5)
  SELF.AddHistoryField(?SOC:IDZONA,3)
  SELF.AddHistoryField(?SOC:TELEFONO,26)
  SELF.AddHistoryField(?SOC:FECHA_NACIMIENTO,12)
  SELF.AddHistoryField(?SOC:SEXO,23)
  SELF.AddHistoryField(?SOC:EMAIL,11)
  SELF.AddHistoryField(?SOC:LUGAR_NACIMIENTO,43)
  SELF.AddHistoryField(?SOC:LUGAR_TRABAJO,48)
  SELF.AddHistoryField(?SOC:DIRECCION_LABORAL,27)
  SELF.AddHistoryField(?SOC:TELEFONO_LABORAL,28)
  SELF.AddHistoryField(?SOC:IDCIRCULO,32)
  SELF.AddHistoryField(?SOC:CELULAR,44)
  SELF.AddHistoryField(?SOC:IDMINISTERIO,46)
  SELF.AddHistoryField(?SOC:IDCS,47)
  SELF.AddHistoryField(?SOC:IDCOBERTURA,4)
  SELF.AddHistoryField(?SOC:CUIT,52)
  SELF.AddHistoryField(?SOC:TIPOIVA,51)
  SELF.AddHistoryField(?SOC:IDBANCO,53)
  SELF.AddHistoryField(?SOC:CBU,54)
  SELF.AddHistoryField(?SOC:ANSSAL,55)
  SELF.AddHistoryField(?SOC:IDINSTITUCION,37)
  SELF.AddHistoryField(?SOC:FECHA_EGRESO,38)
  SELF.AddHistoryField(?SOC:FECHA_TITULO,42)
  SELF.AddHistoryField(?SOC:IDTIPOTITULO,45)
  SELF.AddHistoryField(?SOC:TIPO_TITULO,49)
  SELF.AddHistoryField(?SOC:FECHA_ALTA,10)
  SELF.AddHistoryField(?SOC:LIBRO,33)
  SELF.AddHistoryField(?SOC:FOLIO,34)
  SELF.AddHistoryField(?SOC:PROVISORIO,36)
  SELF.AddHistoryField(?SOC:FECHA_ALTA_MIN,56)
  SELF.AddHistoryField(?SOC:FIN_COBERTURA,29)
  SELF.AddHistoryField(?SOC:FECHA_BAJA,15)
  SELF.AddHistoryField(?SOC:BAJA_TEMPORARIA,39)
  SELF.AddHistoryField(?SOC:OBSERVACION,16)
  SELF.AddHistoryField(?SOC:OTRAS_MATRICULAS,40)
  SELF.AddHistoryField(?SOC:OTRAS_CERTIFICACIONES,41)
  SELF.AddUpdateFile(Access:SOCIOS)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:BANCO.Open                                        ! File BANCO used by this procedure, so make sure it's RelationManager is open
  Relate:CIRCULO.Open                                      ! File CIRCULO used by this procedure, so make sure it's RelationManager is open
  Relate:COBERTURA.Open                                    ! File COBERTURA used by this procedure, so make sure it's RelationManager is open
  Relate:INSTITUCION.Open                                  ! File INSTITUCION used by this procedure, so make sure it's RelationManager is open
  Relate:LOCALIDAD.Open                                    ! File LOCALIDAD used by this procedure, so make sure it's RelationManager is open
  Relate:MCENTRO_SALUD.Open                                ! File MCENTRO_SALUD used by this procedure, so make sure it's RelationManager is open
  Relate:MINISTERIO.Open                                   ! File MINISTERIO used by this procedure, so make sure it's RelationManager is open
  Relate:PROVEEDORES.Open                                  ! File PROVEEDORES used by this procedure, so make sure it's RelationManager is open
  Relate:RANKING.Open                                      ! File RANKING used by this procedure, so make sure it's RelationManager is open
  Relate:SOCIOS.Open                                       ! File SOCIOS used by this procedure, so make sure it's RelationManager is open
  Relate:TIPO_DOC.Open                                     ! File TIPO_DOC used by this procedure, so make sure it's RelationManager is open
  Relate:TIPO_IVA.Open                                     ! File TIPO_IVA used by this procedure, so make sure it's RelationManager is open
  Relate:TIPO_TITULO.Open                                  ! File TIPO_TITULO used by this procedure, so make sure it's RelationManager is open
  Relate:USUARIO.Open                                      ! File USUARIO used by this procedure, so make sure it's RelationManager is open
  Relate:ZONA_VIVIENDA.Open                                ! File ZONA_VIVIENDA used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:SOCIOS
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
    ?SOC:ID_TIPO_DOC{PROP:ReadOnly} = True
    ?SOC:N_DOCUMENTO{PROP:ReadOnly} = True
    ?SOC:MATRICULA{PROP:ReadOnly} = True
    ?SOC:APELLIDO{PROP:ReadOnly} = True
    ?SOC:NOMBRES{PROP:ReadOnly} = True
    ?SOC:DIRECCION{PROP:ReadOnly} = True
    ?SOC:IDLOCALIDAD{PROP:ReadOnly} = True
    DISABLE(?CallLookup:2)
    ?SOC:IDZONA{PROP:ReadOnly} = True
    DISABLE(?CallLookup:3)
    ?SOC:TELEFONO{PROP:ReadOnly} = True
    ?SOC:FECHA_NACIMIENTO{PROP:ReadOnly} = True
    DISABLE(?Calendar)
    ?SOC:SEXO{PROP:ReadOnly} = True
    ?SOC:EMAIL{PROP:ReadOnly} = True
    ?SOC:LUGAR_NACIMIENTO{PROP:ReadOnly} = True
    ?SOC:LUGAR_TRABAJO{PROP:ReadOnly} = True
    ?SOC:DIRECCION_LABORAL{PROP:ReadOnly} = True
    ?SOC:TELEFONO_LABORAL{PROP:ReadOnly} = True
    ?SOC:IDCIRCULO{PROP:ReadOnly} = True
    DISABLE(?CallLookup:4)
    ?SOC:CELULAR{PROP:ReadOnly} = True
    ?SOC:IDMINISTERIO{PROP:ReadOnly} = True
    DISABLE(?CallLookup:7)
    DISABLE(?CallLookup:8)
    ?SOC:IDCS{PROP:ReadOnly} = True
    ?SOC:IDCOBERTURA{PROP:ReadOnly} = True
    ?SOC:CUIT{PROP:ReadOnly} = True
    ?SOC:TIPOIVA{PROP:ReadOnly} = True
    ?SOC:IDBANCO{PROP:ReadOnly} = True
    ?SOC:CBU{PROP:ReadOnly} = True
    ?SOC:ANSSAL{PROP:ReadOnly} = True
    DISABLE(?CallLookup:5)
    DISABLE(?CallLookup:9)
    DISABLE(?CallLookup:10)
    ?SOC:IDINSTITUCION{PROP:ReadOnly} = True
    DISABLE(?CallLookup)
    ?SOC:FECHA_EGRESO{PROP:ReadOnly} = True
    ?SOC:FECHA_TITULO{PROP:ReadOnly} = True
    ?SOC:IDTIPOTITULO{PROP:ReadOnly} = True
    DISABLE(?CallLookup:6)
    ?SOC:FECHA_ALTA{PROP:ReadOnly} = True
    ?SOC:LIBRO{PROP:ReadOnly} = True
    ?SOC:FOLIO{PROP:ReadOnly} = True
    ?SOC:PROVISORIO{PROP:ReadOnly} = True
    ?SOC:FECHA_ALTA_MIN{PROP:ReadOnly} = True
    ?SOC:FIN_COBERTURA{PROP:ReadOnly} = True
    DISABLE(?Calendar:2)
    ?SOC:FECHA_BAJA{PROP:ReadOnly} = True
    DISABLE(?Calendar:3)
    DISABLE(?SOC:BAJA_TEMPORARIA)
    ?SOC:OBSERVACION{PROP:ReadOnly} = True
    ?SOC:OTRAS_MATRICULAS{PROP:ReadOnly} = True
    ?SOC:OTRAS_CERTIFICACIONES{PROP:ReadOnly} = True
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdateSOCIOS',QuickWindow)                 ! Restore window settings from non-volatile store
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
    Relate:BANCO.Close
    Relate:CIRCULO.Close
    Relate:COBERTURA.Close
    Relate:INSTITUCION.Close
    Relate:LOCALIDAD.Close
    Relate:MCENTRO_SALUD.Close
    Relate:MINISTERIO.Close
    Relate:PROVEEDORES.Close
    Relate:RANKING.Close
    Relate:SOCIOS.Close
    Relate:TIPO_DOC.Close
    Relate:TIPO_IVA.Close
    Relate:TIPO_TITULO.Close
    Relate:USUARIO.Close
    Relate:ZONA_VIVIENDA.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateSOCIOS',QuickWindow)              ! Save window data to non-volatile store
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
      SelectTIPO_DOC
      SelectLOCALIDAD
      SelectZONA_VIVIENDA
      SelectCIRCULO
      SelectMINISTERIO
      SelectMCENTRO_SALUD
      SelectCOBERTURA
      SelectTIPO_IVA
      SelectBANCO
      SelectINSTITUCION
      SelectTIPO_TITULO
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
    OF ?OK
      IF  Self.Request = InsertRecord THEN
         IF SOC:FECHA_TITULO = 0 THEN
          SOC:FIN_COBERTURA = TODAY() + 180
          SOC:OBSERVACION = 'ALTA PROVISORIA'
          SOC:PROVISORIO = 'S'
         END
         SOC:MES = MONTH (TODAY())
         SOC:ANO = YEAR(TODAY())
         PREIODO$        = FORMAT(SOC:ANO,@N04)&FORMAT(SOC:MES,@N02)
         SOC:PERIODO_ALTA = PREIODO$
         !SOC:FECHA_ALTA = TODAY() Se carga a mano
         SOC:HORA_ALTA = CLOCK()
         SOC:IDUSUARIO = GLO:IDUSUARIO
         SOC:BAJA = 'NO'
         SOC:BAJA_TEMPORARIA = 'NO'
         
         
      
          !!! CARGA EL NRO DE PROVEEDOR POR STRORE PROCEDURE --- LO CARGA POR EL TAKE COMPLETED
          RANKING{PROP:SQL} = 'CALL SP_GEN_PROVEEDORES_ID'
          NEXT(RANKING)
          SOC:IDPROVEEDOR = RAN:C1
      
      ELSE
          IF  Self.Request = ChangeRecord THEN  !!!! SI SE MODIFICA EL REGISTRO
              IF SOC:FECHA_BAJA <> 0 THEN
                  SOC:BAJA = 'SI'
              ELSE
                  SOC:BAJA = 'NO'
              END
              IF SOC:BAJA_TEMPORARIA = 'SI'
                  SOC:DIRECCION_LABORAL = 'SUSPENCIÓN TEMPORARIA'
              END
              PRO2:IDPROVEEDOR = SOC:IDPROVEEDOR
              ACCESS:PROVEEDORES.TRYFETCH(PRO2:PK_PROVEEDOR)
              PRO2:DIRECCION = SOC:DIRECCION
              PRO2:TELEFONO =  SOC:TELEFONO 
              PRO2:EMAIL    =  SOC:EMAIL
              PRO2:CUIT     =  SOC:CUIT
              PRO2:IDTIPOIVA = SOC:TIPOIVA
              Access:PROVEEDORES.UPDATE()
              
              
              
          END
      
      END
      SOC:NOMBRE = CLIP(SOC:APELLIDO)&' '&CLIP(SOC:NOMBRES)
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?SOC:ID_TIPO_DOC
      TIP3:ID_TIPO_DOC = SOC:ID_TIPO_DOC
      IF Access:TIPO_DOC.TryFetch(TIP3:PK_TIPO_DOC)
        IF SELF.Run(1,SelectRecord) = RequestCompleted
          SOC:ID_TIPO_DOC = TIP3:ID_TIPO_DOC
        ELSE
          SELECT(?SOC:ID_TIPO_DOC)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
      IF Access:SOCIOS.TryValidateField(31)                ! Attempt to validate SOC:ID_TIPO_DOC in SOCIOS
        SELECT(?SOC:ID_TIPO_DOC)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?SOC:ID_TIPO_DOC
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?SOC:ID_TIPO_DOC{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?SOC:IDLOCALIDAD
      LOC:IDLOCALIDAD = SOC:IDLOCALIDAD
      IF Access:LOCALIDAD.TryFetch(LOC:PK_LOCALIDAD)
        IF SELF.Run(2,SelectRecord) = RequestCompleted
          SOC:IDLOCALIDAD = LOC:IDLOCALIDAD
        ELSE
          SELECT(?SOC:IDLOCALIDAD)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
      IF Access:SOCIOS.TryValidateField(5)                 ! Attempt to validate SOC:IDLOCALIDAD in SOCIOS
        SELECT(?SOC:IDLOCALIDAD)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?SOC:IDLOCALIDAD
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?SOC:IDLOCALIDAD{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?CallLookup:2
      ThisWindow.Update()
      LOC:IDLOCALIDAD = SOC:IDLOCALIDAD
      IF SELF.Run(2,SelectRecord) = RequestCompleted
        SOC:IDLOCALIDAD = LOC:IDLOCALIDAD
      END
      ThisWindow.Reset(1)
    OF ?SOC:IDZONA
      ZON:IDZONA = SOC:IDZONA
      IF Access:ZONA_VIVIENDA.TryFetch(ZON:PK_ZONA_VIVIENDA)
        IF SELF.Run(3,SelectRecord) = RequestCompleted
          SOC:IDZONA = ZON:IDZONA
        ELSE
          SELECT(?SOC:IDZONA)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
      IF Access:SOCIOS.TryValidateField(3)                 ! Attempt to validate SOC:IDZONA in SOCIOS
        SELECT(?SOC:IDZONA)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?SOC:IDZONA
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?SOC:IDZONA{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?CallLookup:3
      ThisWindow.Update()
      ZON:IDZONA = SOC:IDZONA
      IF SELF.Run(3,SelectRecord) = RequestCompleted
        SOC:IDZONA = ZON:IDZONA
      END
      ThisWindow.Reset(1)
    OF ?Calendar
      ThisWindow.Update()
      Calendar10.SelectOnClose = True
      Calendar10.Ask('Select a Date',SOC:FECHA_NACIMIENTO)
      IF Calendar10.Response = RequestCompleted THEN
      SOC:FECHA_NACIMIENTO=Calendar10.SelectedDate
      DISPLAY(?SOC:FECHA_NACIMIENTO)
      END
      ThisWindow.Reset(True)
    OF ?SOC:IDCIRCULO
      CIR:IDCIRCULO = SOC:IDCIRCULO
      IF Access:CIRCULO.TryFetch(CIR:PK_CIRCULO)
        IF SELF.Run(4,SelectRecord) = RequestCompleted
          SOC:IDCIRCULO = CIR:IDCIRCULO
        ELSE
          SELECT(?SOC:IDCIRCULO)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
      IF Access:SOCIOS.TryValidateField(32)                ! Attempt to validate SOC:IDCIRCULO in SOCIOS
        SELECT(?SOC:IDCIRCULO)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?SOC:IDCIRCULO
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?SOC:IDCIRCULO{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?CallLookup:4
      ThisWindow.Update()
      CIR:IDCIRCULO = SOC:IDCIRCULO
      IF SELF.Run(4,SelectRecord) = RequestCompleted
        SOC:IDCIRCULO = CIR:IDCIRCULO
      END
      ThisWindow.Reset(1)
    OF ?SOC:IDMINISTERIO
      IF SOC:IDMINISTERIO OR ?SOC:IDMINISTERIO{PROP:Req}
        MIN:IDMINISTERIO = SOC:IDMINISTERIO
        IF Access:MINISTERIO.TryFetch(MIN:PK_MINISTERIO)
          IF SELF.Run(5,SelectRecord) = RequestCompleted
            SOC:IDMINISTERIO = MIN:IDMINISTERIO
          ELSE
            SELECT(?SOC:IDMINISTERIO)
            CYCLE
          END
        END
      END
      ThisWindow.Reset()
    OF ?CallLookup:7
      ThisWindow.Update()
      MIN:IDMINISTERIO = SOC:IDMINISTERIO
      IF SELF.Run(5,SelectRecord) = RequestCompleted
        SOC:IDMINISTERIO = MIN:IDMINISTERIO
      END
      ThisWindow.Reset(1)
    OF ?CallLookup:8
      ThisWindow.Update()
      MCS:IDCENTRO_SALUD = SOC:IDCS
      IF SELF.Run(6,SelectRecord) = RequestCompleted
        SOC:IDCS = MCS:IDCENTRO_SALUD
      END
      ThisWindow.Reset(1)
    OF ?SOC:IDCS
      IF SOC:IDCS OR ?SOC:IDCS{PROP:Req}
        MCS:IDCENTRO_SALUD = SOC:IDCS
        IF Access:MCENTRO_SALUD.TryFetch(MCS:PK_CENTRO_SALUD)
          IF SELF.Run(6,SelectRecord) = RequestCompleted
            SOC:IDCS = MCS:IDCENTRO_SALUD
          ELSE
            SELECT(?SOC:IDCS)
            CYCLE
          END
        END
      END
      ThisWindow.Reset()
    OF ?SOC:IDCOBERTURA
      COB:IDCOBERTURA = SOC:IDCOBERTURA
      IF Access:COBERTURA.TryFetch(COB:PK_COBERTURA)
        IF SELF.Run(7,SelectRecord) = RequestCompleted
          SOC:IDCOBERTURA = COB:IDCOBERTURA
        ELSE
          SELECT(?SOC:IDCOBERTURA)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
      IF Access:SOCIOS.TryValidateField(4)                 ! Attempt to validate SOC:IDCOBERTURA in SOCIOS
        SELECT(?SOC:IDCOBERTURA)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?SOC:IDCOBERTURA
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?SOC:IDCOBERTURA{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?SOC:TIPOIVA
      IF SOC:TIPOIVA OR ?SOC:TIPOIVA{PROP:Req}
        TIP7:IDTIPOIVA = SOC:TIPOIVA
        IF Access:TIPO_IVA.TryFetch(TIP7:PK_TIPO_IVA)
          IF SELF.Run(8,SelectRecord) = RequestCompleted
            SOC:TIPOIVA = TIP7:IDTIPOIVA
          ELSE
            SELECT(?SOC:TIPOIVA)
            CYCLE
          END
        END
      END
      ThisWindow.Reset()
    OF ?SOC:IDBANCO
      BAN2:IDBANCO = SOC:IDBANCO
      IF Access:BANCO.TryFetch(BAN2:PK_BANCO)
        IF SELF.Run(9,SelectRecord) = RequestCompleted
          SOC:IDBANCO = BAN2:IDBANCO
        ELSE
          SELECT(?SOC:IDBANCO)
          CYCLE
        END
      END
      ThisWindow.Reset()
      IF Access:SOCIOS.TryValidateField(53)                ! Attempt to validate SOC:IDBANCO in SOCIOS
        SELECT(?SOC:IDBANCO)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?SOC:IDBANCO
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?SOC:IDBANCO{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?CallLookup:5
      ThisWindow.Update()
      COB:IDCOBERTURA = SOC:IDCOBERTURA
      IF SELF.Run(7,SelectRecord) = RequestCompleted
        SOC:IDCOBERTURA = COB:IDCOBERTURA
      END
      ThisWindow.Reset(1)
    OF ?CallLookup:9
      ThisWindow.Update()
      TIP7:IDTIPOIVA = SOC:TIPOIVA
      IF SELF.Run(8,SelectRecord) = RequestCompleted
        SOC:TIPOIVA = TIP7:IDTIPOIVA
      END
      ThisWindow.Reset(1)
    OF ?CallLookup:10
      ThisWindow.Update()
      BAN2:IDBANCO = SOC:IDBANCO
      IF SELF.Run(9,SelectRecord) = RequestCompleted
        SOC:IDBANCO = BAN2:IDBANCO
      END
      ThisWindow.Reset(1)
    OF ?SOC:IDINSTITUCION
      INS2:IDINSTITUCION = SOC:IDINSTITUCION
      IF Access:INSTITUCION.TryFetch(INS2:PK_INSTITUCION)
        IF SELF.Run(10,SelectRecord) = RequestCompleted
          SOC:IDINSTITUCION = INS2:IDINSTITUCION
        ELSE
          SELECT(?SOC:IDINSTITUCION)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
      IF Access:SOCIOS.TryValidateField(37)                ! Attempt to validate SOC:IDINSTITUCION in SOCIOS
        SELECT(?SOC:IDINSTITUCION)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?SOC:IDINSTITUCION
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?SOC:IDINSTITUCION{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?CallLookup
      ThisWindow.Update()
      INS2:IDINSTITUCION = SOC:IDINSTITUCION
      IF SELF.Run(10,SelectRecord) = RequestCompleted
        SOC:IDINSTITUCION = INS2:IDINSTITUCION
      END
      ThisWindow.Reset(1)
    OF ?SOC:IDTIPOTITULO
      TIP6:IDTIPOTITULO = SOC:IDTIPOTITULO
      IF Access:TIPO_TITULO.TryFetch(TIP6:PK_TIPO_TITULO)
        IF SELF.Run(11,SelectRecord) = RequestCompleted
          SOC:IDTIPOTITULO = TIP6:IDTIPOTITULO
        ELSE
          SELECT(?SOC:IDTIPOTITULO)
          CYCLE
        END
      END
      ThisWindow.Reset()
      IF Access:SOCIOS.TryValidateField(45)                ! Attempt to validate SOC:IDTIPOTITULO in SOCIOS
        SELECT(?SOC:IDTIPOTITULO)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?SOC:IDTIPOTITULO
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?SOC:IDTIPOTITULO{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?CallLookup:6
      ThisWindow.Update()
      TIP6:IDTIPOTITULO = SOC:IDTIPOTITULO
      IF SELF.Run(11,SelectRecord) = RequestCompleted
        SOC:IDTIPOTITULO = TIP6:IDTIPOTITULO
      END
      ThisWindow.Reset(1)
    OF ?Calendar:2
      ThisWindow.Update()
      Calendar13.SelectOnClose = True
      Calendar13.Ask('Select a Date',SOC:FIN_COBERTURA)
      IF Calendar13.Response = RequestCompleted THEN
      SOC:FIN_COBERTURA=Calendar13.SelectedDate
      DISPLAY(?SOC:FIN_COBERTURA)
      END
      ThisWindow.Reset(True)
    OF ?Calendar:3
      ThisWindow.Update()
      Calendar14.SelectOnClose = True
      Calendar14.Ask('Select a Date',SOC:FECHA_BAJA)
      IF Calendar14.Response = RequestCompleted THEN
      SOC:FECHA_BAJA=Calendar14.SelectedDate
      DISPLAY(?SOC:FECHA_BAJA)
      END
      ThisWindow.Reset(True)
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
      PRO2:IDPROVEEDOR = SOC:IDPROVEEDOR  
      PRO2:DESCRIPCION  = SOC:NOMBRE
      PRO2:DIRECCION    = SOC:DIRECCION
      PRO2:TELEFONO     = SOC:TELEFONO
      PRO2:EMAIL        = SOC:EMAIL
      PRO2:CUIT         = SOC:CUIT
      PRO2:FECHA        = SOC:FECHA_ALTA
      PRO2:HORA         = SOC:HORA_ALTA
      PRO2:IDUSUARIO    = SOC:IDUSUARIO
      PRO2:IDTIPOIVA    = SOC:TIPOIVA
      PRO2:IDTIPO_PROVEEDOR = 2
      ADD(PROVEEDORES)
      IF ERRORCODE() THEN
          MESSAGE('NO SE CARGO PROVEEDOR | AVISAR A PROVEEDOR DEL SISTEMA NO GENERAR PAGOS PARA ESTE SOCIO')
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
!!! Select a TIPO_DOC Record
!!! </summary>
SelectTIPO_DOC PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(TIPO_DOC)
                       PROJECT(TIP3:ID_TIPO_DOC)
                       PROJECT(TIP3:DESCRIPCION)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
TIP3:ID_TIPO_DOC       LIKE(TIP3:ID_TIPO_DOC)         !List box control field - type derived from field
TIP3:DESCRIPCION       LIKE(TIP3:DESCRIPCION)         !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Select a TIPO_DOC Record'),AT(,,158,198),FONT('MS Sans Serif',8,,FONT:regular),RESIZE, |
  CENTER,GRAY,IMM,MDI,HLP('SelectTIPO_DOC'),SYSTEM
                       LIST,AT(8,30,142,124),USE(?Browse:1),HVSCROLL,FORMAT('64R(2)|M~ID TIPO DOC~C(0)@n-14@80' & |
  'L(2)|M~DESCRIPCION~L(2)@s20@'),FROM(Queue:Browse:1),IMM,MSG('Administrador de TIPO_DOC')
                       BUTTON('&Elegir'),AT(101,158,49,14),USE(?Select:2),LEFT,ICON('e.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Seleccionar'),TIP('Seleccionar')
                       SHEET,AT(4,4,150,172),USE(?CurrentTab)
                         TAB('TIPO'),USE(?Tab:2)
                         END
                         TAB('DESCIPCION'),USE(?Tab:3)
                         END
                       END
                       BUTTON('&Salir'),AT(105,180,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Salir'),TIP('Salir')
                       PROMPT('&Orden:'),AT(8,13),USE(?SortOrderList:Prompt)
                       LIST,AT(48,13,75,10),USE(?SortOrderList),DROP(20),FROM(''),MSG('Select the Sort Order'),TIP('Select the' & |
  ' Sort Order')
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
  GlobalErrors.SetProcedureName('SelectTIPO_DOC')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('TIP3:ID_TIPO_DOC',TIP3:ID_TIPO_DOC)                ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:TIPO_DOC.Open                                     ! File TIPO_DOC used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:TIPO_DOC,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?CurrentTab{PROP:WIZARD}=True
  ?SortOrderList{PROP:FROM}=|
                CHOOSE(SUB(?Tab:2{PROP:TEXT},1,1)='&',SUB(?Tab:2{PROP:TEXT},2,LEN(?Tab:2{PROP:TEXT})-1),?Tab:2{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab:3{PROP:TEXT},1,1)='&',SUB(?Tab:3{PROP:TEXT},2,LEN(?Tab:3{PROP:TEXT})-1),?Tab:3{PROP:TEXT})&|
                ''
  ?SortOrderList{PROP:SELECTED}=1
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,TIP3:IDX_TIPO_DOC_DESCIPCION)         ! Add the sort order for TIP3:IDX_TIPO_DOC_DESCIPCION for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,TIP3:DESCRIPCION,,BRW1)        ! Initialize the browse locator using  using key: TIP3:IDX_TIPO_DOC_DESCIPCION , TIP3:DESCRIPCION
  BRW1.AddSortOrder(,TIP3:PK_TIPO_DOC)                     ! Add the sort order for TIP3:PK_TIPO_DOC for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(,TIP3:ID_TIPO_DOC,,BRW1)        ! Initialize the browse locator using  using key: TIP3:PK_TIPO_DOC , TIP3:ID_TIPO_DOC
  BRW1.AddField(TIP3:ID_TIPO_DOC,BRW1.Q.TIP3:ID_TIPO_DOC)  ! Field TIP3:ID_TIPO_DOC is a hot field or requires assignment from browse
  BRW1.AddField(TIP3:DESCRIPCION,BRW1.Q.TIP3:DESCRIPCION)  ! Field TIP3:DESCRIPCION is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('SelectTIPO_DOC',QuickWindow)               ! Restore window settings from non-volatile store
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
    Relate:TIPO_DOC.Close
  END
  IF SELF.Opened
    INIMgr.Update('SelectTIPO_DOC',QuickWindow)            ! Save window data to non-volatile store
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
!!! Select a ZONA_VIVIENDA Record
!!! </summary>
SelectZONA_VIVIENDA PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(ZONA_VIVIENDA)
                       PROJECT(ZON:IDZONA)
                       PROJECT(ZON:DESCRIPCION)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
ZON:IDZONA             LIKE(ZON:IDZONA)               !List box control field - type derived from field
ZON:DESCRIPCION        LIKE(ZON:DESCRIPCION)          !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Select a ZONA_VIVIENDA Record'),AT(,,158,198),FONT('MS Sans Serif',8,,FONT:regular), |
  RESIZE,CENTER,GRAY,IMM,MDI,HLP('SelectZONA_VIVIENDA'),SYSTEM
                       LIST,AT(8,30,142,124),USE(?Browse:1),HVSCROLL,FORMAT('64R(2)|M~IDZONA~C(0)@n-14@80L(2)|' & |
  'M~DESCRIPCION~L(2)@s20@'),FROM(Queue:Browse:1),IMM,MSG('Administrador de ZONA_VIVIENDA')
                       BUTTON('&Elegir'),AT(101,158,49,14),USE(?Select:2),LEFT,ICON('e.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Seleccionar'),TIP('Seleccionar')
                       SHEET,AT(4,4,150,172),USE(?CurrentTab)
                         TAB('PK_ZONA_VIVIENDA'),USE(?Tab:2)
                         END
                         TAB('IDX_ZONA_VIVIENDA'),USE(?Tab:3)
                         END
                       END
                       BUTTON('&Salir'),AT(105,180,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Salir'),TIP('Salir')
                       PROMPT('&Orden:'),AT(8,13),USE(?SortOrderList:Prompt)
                       LIST,AT(48,13,75,10),USE(?SortOrderList),DROP(20),FROM(''),MSG('Select the Sort Order'),TIP('Select the' & |
  ' Sort Order')
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
  GlobalErrors.SetProcedureName('SelectZONA_VIVIENDA')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('ZON:IDZONA',ZON:IDZONA)                            ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:ZONA_VIVIENDA.Open                                ! File ZONA_VIVIENDA used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:ZONA_VIVIENDA,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?CurrentTab{PROP:WIZARD}=True
  ?SortOrderList{PROP:FROM}=|
                CHOOSE(SUB(?Tab:2{PROP:TEXT},1,1)='&',SUB(?Tab:2{PROP:TEXT},2,LEN(?Tab:2{PROP:TEXT})-1),?Tab:2{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab:3{PROP:TEXT},1,1)='&',SUB(?Tab:3{PROP:TEXT},2,LEN(?Tab:3{PROP:TEXT})-1),?Tab:3{PROP:TEXT})&|
                ''
  ?SortOrderList{PROP:SELECTED}=1
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,ZON:IDX_ZONA_VIVIENDA)                ! Add the sort order for ZON:IDX_ZONA_VIVIENDA for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,ZON:DESCRIPCION,,BRW1)         ! Initialize the browse locator using  using key: ZON:IDX_ZONA_VIVIENDA , ZON:DESCRIPCION
  BRW1.AddSortOrder(,ZON:PK_ZONA_VIVIENDA)                 ! Add the sort order for ZON:PK_ZONA_VIVIENDA for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(,ZON:IDZONA,,BRW1)              ! Initialize the browse locator using  using key: ZON:PK_ZONA_VIVIENDA , ZON:IDZONA
  BRW1.AddField(ZON:IDZONA,BRW1.Q.ZON:IDZONA)              ! Field ZON:IDZONA is a hot field or requires assignment from browse
  BRW1.AddField(ZON:DESCRIPCION,BRW1.Q.ZON:DESCRIPCION)    ! Field ZON:DESCRIPCION is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('SelectZONA_VIVIENDA',QuickWindow)          ! Restore window settings from non-volatile store
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
    Relate:ZONA_VIVIENDA.Close
  END
  IF SELF.Opened
    INIMgr.Update('SelectZONA_VIVIENDA',QuickWindow)       ! Save window data to non-volatile store
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
!!! Select a TIPO_TITULO Record
!!! </summary>
SelectTIPO_TITULO PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(TIPO_TITULO)
                       PROJECT(TIP6:IDTIPOTITULO)
                       PROJECT(TIP6:DESCRIPCION)
                       PROJECT(TIP6:CORTO)
                       PROJECT(TIP6:IDNIVELFORMACION)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
TIP6:IDTIPOTITULO      LIKE(TIP6:IDTIPOTITULO)        !List box control field - type derived from field
TIP6:DESCRIPCION       LIKE(TIP6:DESCRIPCION)         !List box control field - type derived from field
TIP6:CORTO             LIKE(TIP6:CORTO)               !List box control field - type derived from field
TIP6:IDNIVELFORMACION  LIKE(TIP6:IDNIVELFORMACION)    !Browse key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Seleccionar  TIPO TITULO '),AT(,,264,198),FONT('MS Sans Serif',8,,FONT:regular),RESIZE, |
  CENTER,GRAY,IMM,MDI,HLP('SelectTIPO_TITULO'),SYSTEM
                       LIST,AT(8,30,248,124),USE(?Browse:1),HVSCROLL,FORMAT('28L(2)|M~ID~C(0)@n-5@145L(2)|M~DE' & |
  'SCRIPCION~@s50@44L(2)|M~CORTO~@s10@'),FROM(Queue:Browse:1),IMM,MSG('Administrador de' & |
  ' TIPO_TITULO')
                       BUTTON('&Elegir'),AT(207,158,49,14),USE(?Select:2),LEFT,ICON('e.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Seleccionar'),TIP('Seleccionar')
                       SHEET,AT(4,4,256,172),USE(?CurrentTab)
                         TAB('ID'),USE(?Tab:2)
                         END
                       END
                       BUTTON('&Salir'),AT(211,180,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
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
  GlobalErrors.SetProcedureName('SelectTIPO_TITULO')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('TIP6:IDTIPOTITULO',TIP6:IDTIPOTITULO)              ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:TIPO_TITULO.Open                                  ! File TIPO_TITULO used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:TIPO_TITULO,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,TIP6:FK_TIPO_TITULO_NIVEL_FORMACION)  ! Add the sort order for TIP6:FK_TIPO_TITULO_NIVEL_FORMACION for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,TIP6:IDNIVELFORMACION,,BRW1)   ! Initialize the browse locator using  using key: TIP6:FK_TIPO_TITULO_NIVEL_FORMACION , TIP6:IDNIVELFORMACION
  BRW1.AddSortOrder(,TIP6:PK_TIPO_TITULO)                  ! Add the sort order for TIP6:PK_TIPO_TITULO for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(,TIP6:IDTIPOTITULO,,BRW1)       ! Initialize the browse locator using  using key: TIP6:PK_TIPO_TITULO , TIP6:IDTIPOTITULO
  BRW1.AddField(TIP6:IDTIPOTITULO,BRW1.Q.TIP6:IDTIPOTITULO) ! Field TIP6:IDTIPOTITULO is a hot field or requires assignment from browse
  BRW1.AddField(TIP6:DESCRIPCION,BRW1.Q.TIP6:DESCRIPCION)  ! Field TIP6:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(TIP6:CORTO,BRW1.Q.TIP6:CORTO)              ! Field TIP6:CORTO is a hot field or requires assignment from browse
  BRW1.AddField(TIP6:IDNIVELFORMACION,BRW1.Q.TIP6:IDNIVELFORMACION) ! Field TIP6:IDNIVELFORMACION is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('SelectTIPO_TITULO',QuickWindow)            ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:TIPO_TITULO.Close
  END
  IF SELF.Opened
    INIMgr.Update('SelectTIPO_TITULO',QuickWindow)         ! Save window data to non-volatile store
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
!!! Select a MINISTERIO Record
!!! </summary>
SelectMINISTERIO PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(MINISTERIO)
                       PROJECT(MIN:DESCRIPCION)
                       PROJECT(MIN:DIRECCION)
                       PROJECT(MIN:IDMINISTERIO)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
MIN:DESCRIPCION        LIKE(MIN:DESCRIPCION)          !List box control field - type derived from field
MIN:DIRECCION          LIKE(MIN:DIRECCION)            !List box control field - type derived from field
MIN:IDMINISTERIO       LIKE(MIN:IDMINISTERIO)         !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Select a MINISTERIO Record'),AT(,,377,198),FONT('MS Sans Serif',8,,FONT:regular),RESIZE, |
  CENTER,GRAY,IMM,MDI,HLP('SelectMINISTERIO'),SYSTEM
                       LIST,AT(8,30,355,124),USE(?Browse:1),HVSCROLL,FORMAT('203L(2)|M~DESCRIPCION~@s50@138L(2' & |
  ')|M~DIRECCION~@s50@64L(2)|M~IDMINISTERIO~C(0)@n-5@'),FROM(Queue:Browse:1),IMM,MSG('Browsing t' & |
  'he MINISTERIO file')
                       BUTTON('&Seleccionar'),AT(289,158,74,14),USE(?Select:2),LEFT,ICON('WASELECT.ICO'),FLAT,MSG('Select the Record'), |
  TIP('Select the Record')
                       SHEET,AT(4,4,365,172),USE(?CurrentTab)
                         TAB('POR MINISTERIO'),USE(?Tab:2)
                         END
                       END
                       BUTTON('&Cerrar'),AT(305,182,49,14),USE(?Close),LEFT,ICON('WACLOSE.ICO'),FLAT,MSG('Close Window'), |
  TIP('Close Window')
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
BRW1::Sort0:StepClass StepStringClass                      ! Default Step Manager
BRW1::Sort1:StepClass StepStringClass                      ! Conditional Step Manager - CHOICE(?CurrentTab) = 2
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
  GlobalErrors.SetProcedureName('SelectMINISTERIO')
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
  Relate:MINISTERIO.Open                                   ! File MINISTERIO used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:MINISTERIO,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1::Sort1:StepClass.Init(+ScrollSort:AllowAlpha,ScrollBy:Runtime) ! Moveable thumb based upon MIN:DESCRIPCION for sort order 1
  BRW1.AddSortOrder(BRW1::Sort1:StepClass,MIN:IDX_DECRIPCION) ! Add the sort order for MIN:IDX_DECRIPCION for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,MIN:DESCRIPCION,1,BRW1)        ! Initialize the browse locator using  using key: MIN:IDX_DECRIPCION , MIN:DESCRIPCION
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha,ScrollBy:Runtime) ! Moveable thumb based upon MIN:DESCRIPCION for sort order 2
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,MIN:IDX_DECRIPCION) ! Add the sort order for MIN:IDX_DECRIPCION for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(,MIN:DESCRIPCION,1,BRW1)        ! Initialize the browse locator using  using key: MIN:IDX_DECRIPCION , MIN:DESCRIPCION
  BRW1.AddField(MIN:DESCRIPCION,BRW1.Q.MIN:DESCRIPCION)    ! Field MIN:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(MIN:DIRECCION,BRW1.Q.MIN:DIRECCION)        ! Field MIN:DIRECCION is a hot field or requires assignment from browse
  BRW1.AddField(MIN:IDMINISTERIO,BRW1.Q.MIN:IDMINISTERIO)  ! Field MIN:IDMINISTERIO is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('SelectMINISTERIO',QuickWindow)             ! Restore window settings from non-volatile store
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
    Relate:MINISTERIO.Close
  END
  IF SELF.Opened
    INIMgr.Update('SelectMINISTERIO',QuickWindow)          ! Save window data to non-volatile store
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
!!! Select a LOCALIDAD Record
!!! </summary>
SelectLOCALIDAD PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(LOCALIDAD)
                       PROJECT(LOC:IDLOCALIDAD)
                       PROJECT(LOC:DESCRIPCION)
                       PROJECT(LOC:CP)
                       PROJECT(LOC:CPNUEVO)
                       PROJECT(LOC:IDPAIS)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
LOC:IDLOCALIDAD        LIKE(LOC:IDLOCALIDAD)          !List box control field - type derived from field
LOC:DESCRIPCION        LIKE(LOC:DESCRIPCION)          !List box control field - type derived from field
LOC:CP                 LIKE(LOC:CP)                   !List box control field - type derived from field
LOC:CPNUEVO            LIKE(LOC:CPNUEVO)              !List box control field - type derived from field
LOC:IDPAIS             LIKE(LOC:IDPAIS)               !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Select a LOCALIDAD Record'),AT(,,358,198),FONT('MS Sans Serif',8,,FONT:regular),RESIZE, |
  CENTER,GRAY,IMM,MDI,HLP('SelectLOCALIDAD'),SYSTEM
                       LIST,AT(8,47,342,106),USE(?Browse:1),HVSCROLL,FORMAT('64R(2)|M~IDLOCALIDAD~C(0)@n-14@80' & |
  'L(2)|M~DESCRIPCION~L(2)@s20@64R(2)|M~CP~C(0)@n-14@80L(2)|M~CPNUEVO~L(2)@s20@64R(2)|M' & |
  '~IDPAIS~C(0)@n-14@'),FROM(Queue:Browse:1),IMM,MSG('Administrador de LOCALIDAD')
                       BUTTON('&Elegir'),AT(301,158,49,14),USE(?Select:2),LEFT,ICON('e.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Seleccionar'),TIP('Seleccionar')
                       SHEET,AT(4,4,350,172),USE(?CurrentTab)
                         TAB('LOCALIDAD'),USE(?Tab:1)
                         END
                         TAB('NOMBRE'),USE(?Tab:2)
                         END
                       END
                       BUTTON('&Salir'),AT(305,180,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Salir'),TIP('Salir')
                       PROMPT('&Orden:'),AT(8,27),USE(?SortOrderList:Prompt)
                       LIST,AT(48,27,75,10),USE(?SortOrderList),DROP(20),FROM(''),MSG('Select the Sort Order'),TIP('Select the' & |
  ' Sort Order')
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
  GlobalErrors.SetProcedureName('SelectLOCALIDAD')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('LOC:IDLOCALIDAD',LOC:IDLOCALIDAD)                  ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:LOCALIDAD.Open                                    ! File LOCALIDAD used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:LOCALIDAD,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?CurrentTab{PROP:WIZARD}=True
  ?SortOrderList{PROP:FROM}=|
                CHOOSE(SUB(?Tab:1{PROP:TEXT},1,1)='&',SUB(?Tab:1{PROP:TEXT},2,LEN(?Tab:1{PROP:TEXT})-1),?Tab:1{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab:2{PROP:TEXT},1,1)='&',SUB(?Tab:2{PROP:TEXT},2,LEN(?Tab:2{PROP:TEXT})-1),?Tab:2{PROP:TEXT})&|
                ''
  ?SortOrderList{PROP:SELECTED}=1
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,LOC:NOMBRE)                           ! Add the sort order for LOC:NOMBRE for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,LOC:DESCRIPCION,,BRW1)         ! Initialize the browse locator using  using key: LOC:NOMBRE , LOC:DESCRIPCION
  BRW1.AddSortOrder(,LOC:PK_LOCALIDAD)                     ! Add the sort order for LOC:PK_LOCALIDAD for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(,LOC:IDLOCALIDAD,,BRW1)         ! Initialize the browse locator using  using key: LOC:PK_LOCALIDAD , LOC:IDLOCALIDAD
  BRW1.AddField(LOC:IDLOCALIDAD,BRW1.Q.LOC:IDLOCALIDAD)    ! Field LOC:IDLOCALIDAD is a hot field or requires assignment from browse
  BRW1.AddField(LOC:DESCRIPCION,BRW1.Q.LOC:DESCRIPCION)    ! Field LOC:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(LOC:CP,BRW1.Q.LOC:CP)                      ! Field LOC:CP is a hot field or requires assignment from browse
  BRW1.AddField(LOC:CPNUEVO,BRW1.Q.LOC:CPNUEVO)            ! Field LOC:CPNUEVO is a hot field or requires assignment from browse
  BRW1.AddField(LOC:IDPAIS,BRW1.Q.LOC:IDPAIS)              ! Field LOC:IDPAIS is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('SelectLOCALIDAD',QuickWindow)              ! Restore window settings from non-volatile store
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
    Relate:LOCALIDAD.Close
  END
  IF SELF.Opened
    INIMgr.Update('SelectLOCALIDAD',QuickWindow)           ! Save window data to non-volatile store
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
    OF ?SortOrderList
      EXECUTE(CHOICE(?SortOrderList))
       SELECT(?Tab:1)
       SELECT(?Tab:2)
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

