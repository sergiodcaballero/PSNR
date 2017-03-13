

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABPRHTML.INC'),ONCE
   INCLUDE('ABPRPDF.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('abprtext.inc'),ONCE
   INCLUDE('abprxml.inc'),ONCE
   INCLUDE('abrppsel.inc'),ONCE

                     MAP
                       INCLUDE('GESTION155.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Report
!!! Print the RENUNCIA File
!!! </summary>
Reporte:RENUNCIA PROCEDURE 

Progress:Thermometer BYTE                                  ! 
Process:View         VIEW(RENUNCIA)
                       PROJECT(REN:ACTA)
                       PROJECT(REN:FECHA)
                       PROJECT(REN:FOLIO)
                       PROJECT(REN:HORA)
                       PROJECT(REN:IDRENUNCIA)
                       PROJECT(REN:IDSOCIO)
                       PROJECT(REN:LIBRO)
                       JOIN(SOC:PK_SOCIOS,REN:IDSOCIO)
                         PROJECT(SOC:NOMBRE)
                       END
                     END
ProgressWindow       WINDOW('Reporte de RENUNCIA'),AT(,,142,59),FONT('MS Sans Serif',8,,FONT:regular),DOUBLE,CENTER, |
  GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100),SMOOTH
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancelar'),AT(43,42,55,15),USE(?Progress:Cancel),LEFT,ICON('cancel.ICO'),FLAT,MSG('Cancela Reporte'), |
  TIP('Cancela Reporte')
                     END

Report               REPORT('RENUNCIA Report'),AT(250,850,7750,10333),PRE(RPT),PAPER(PAPER:A4),FONT('MS Sans Serif', |
  8,,FONT:regular),THOUS
                       HEADER,AT(250,250,7750,604),USE(?Header),FONT('MS Sans Serif',8,,FONT:regular)
                         STRING('Reporte de  RENUNCIA'),AT(0,20,7750,220),USE(?ReportTitle),FONT('MS Sans Serif',8, |
  ,FONT:regular),CENTER
                         BOX,AT(0,350,7750,250),USE(?HeaderBox),COLOR(COLOR:Black)
                         LINE,AT(771,354,0,250),USE(?HeaderLine:1),COLOR(COLOR:Black)
                         LINE,AT(2906,350,0,250),USE(?HeaderLine:3),COLOR(COLOR:Black)
                         LINE,AT(3875,350,0,250),USE(?HeaderLine:4),COLOR(COLOR:Black)
                         LINE,AT(4843,350,0,250),USE(?HeaderLine:5),COLOR(COLOR:Black)
                         LINE,AT(5812,350,0,250),USE(?HeaderLine:6),COLOR(COLOR:Black)
                         LINE,AT(6781,350,0,250),USE(?HeaderLine:7),COLOR(COLOR:Black)
                         STRING('IDRENUNCIA'),AT(52,385,729,167),USE(?HeaderTitle:1),TRN
                         STRING('IDSOCIO'),AT(1018,390,868,170),USE(?HeaderTitle:2),TRN
                         STRING('LIBRO'),AT(2956,390,868,170),USE(?HeaderTitle:4),TRN
                         STRING('FOLIO'),AT(3925,390,868,170),USE(?HeaderTitle:5),TRN
                         STRING('ACTA'),AT(4893,390,868,170),USE(?HeaderTitle:6),TRN
                         STRING('FECHA'),AT(5862,390,868,170),USE(?HeaderTitle:7),TRN
                         STRING('HORA'),AT(6831,390,868,170),USE(?HeaderTitle:8),TRN
                       END
Detail                 DETAIL,AT(,,7750,208),USE(?Detail)
                         LINE,AT(0,0,0,210),USE(?DetailLine:0),COLOR(COLOR:Black)
                         LINE,AT(792,10,0,210),USE(?DetailLine:1),COLOR(COLOR:Black)
                         LINE,AT(2906,0,0,210),USE(?DetailLine:3),COLOR(COLOR:Black)
                         LINE,AT(3875,0,0,210),USE(?DetailLine:4),COLOR(COLOR:Black)
                         LINE,AT(4843,0,0,210),USE(?DetailLine:5),COLOR(COLOR:Black)
                         LINE,AT(5812,0,0,210),USE(?DetailLine:6),COLOR(COLOR:Black)
                         LINE,AT(6781,0,0,210),USE(?DetailLine:7),COLOR(COLOR:Black)
                         LINE,AT(7750,0,0,210),USE(?DetailLine:8),COLOR(COLOR:Black)
                         STRING(@n-7),AT(52,31,531,167),USE(REN:IDRENUNCIA)
                         STRING(@n-7),AT(833,31,531,167),USE(REN:IDSOCIO)
                         STRING(@s25),AT(1292,31),USE(SOC:NOMBRE)
                         STRING(@s50),AT(2958,31,868,170),USE(REN:LIBRO)
                         STRING(@n-14),AT(3927,31,868,170),USE(REN:FOLIO)
                         STRING(@s50),AT(4896,31,868,170),USE(REN:ACTA)
                         STRING(@d17),AT(5865,31,868,170),USE(REN:FECHA)
                         STRING(@T4),AT(6823,31,868,170),USE(REN:HORA)
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
      'PK_RENUNCIA' & |
      '|' & 'FK_RENUNCIA_SOCIOS' & |
      '|' & 'FK_RENUNCIA_USUARIO' & |
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
  GlobalErrors.SetProcedureName('Reporte:RENUNCIA')
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
  Relate:RENUNCIA.Open                                     ! File RENUNCIA used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('Reporte:RENUNCIA',ProgressWindow)          ! Restore window settings from non-volatile store
  TargetSelector.AddItem(XMLReporter.IReportGenerator)
  TargetSelector.AddItem(HTMLReporter.IReportGenerator)
  TargetSelector.AddItem(TXTReporter.IReportGenerator)
  TargetSelector.AddItem(PDFReporter.IReportGenerator)
  SELF.AddItem(TargetSelector)
  ThisReport.Init(Process:View, Relate:RENUNCIA, ?Progress:PctText, Progress:Thermometer)
  ThisReport.AddSortOrder()
  IF (UPPER(CLIP(ProcessSortSelectionVariable))=UPPER('PK_RENUNCIA')) THEN
     ThisReport.AppendOrder('+REN:IDRENUNCIA')
  ELSIF (UPPER(CLIP(ProcessSortSelectionVariable))=UPPER('FK_RENUNCIA_SOCIOS')) THEN
     ThisReport.AppendOrder('+REN:IDSOCIO')
  ELSIF (UPPER(CLIP(ProcessSortSelectionVariable))=UPPER('FK_RENUNCIA_USUARIO')) THEN
     ThisReport.AppendOrder('+REN:IDUSUARIO')
  END
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:RENUNCIA.SetQuickScan(1,Propagate:OneMany)
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
    Relate:RENUNCIA.Close
  END
  IF SELF.Opened
    INIMgr.Update('Reporte:RENUNCIA',ProgressWindow)       ! Save window data to non-volatile store
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
  SELF.Attribute.Set(?HeaderTitle:4,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?HeaderTitle:4,RepGen:XML,TargetAttr:TagName,'HeaderTitle:4')
  SELF.Attribute.Set(?HeaderTitle:4,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?HeaderTitle:5,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?HeaderTitle:5,RepGen:XML,TargetAttr:TagName,'HeaderTitle:5')
  SELF.Attribute.Set(?HeaderTitle:5,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?HeaderTitle:6,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?HeaderTitle:6,RepGen:XML,TargetAttr:TagName,'HeaderTitle:6')
  SELF.Attribute.Set(?HeaderTitle:6,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?HeaderTitle:7,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?HeaderTitle:7,RepGen:XML,TargetAttr:TagName,'HeaderTitle:7')
  SELF.Attribute.Set(?HeaderTitle:7,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?HeaderTitle:8,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?HeaderTitle:8,RepGen:XML,TargetAttr:TagName,'HeaderTitle:8')
  SELF.Attribute.Set(?HeaderTitle:8,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?REN:IDRENUNCIA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?REN:IDRENUNCIA,RepGen:XML,TargetAttr:TagName,'REN:IDRENUNCIA')
  SELF.Attribute.Set(?REN:IDRENUNCIA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?REN:IDSOCIO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?REN:IDSOCIO,RepGen:XML,TargetAttr:TagName,'REN:IDSOCIO')
  SELF.Attribute.Set(?REN:IDSOCIO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagName,'SOC:NOMBRE')
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?REN:LIBRO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?REN:LIBRO,RepGen:XML,TargetAttr:TagName,'REN:LIBRO')
  SELF.Attribute.Set(?REN:LIBRO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?REN:FOLIO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?REN:FOLIO,RepGen:XML,TargetAttr:TagName,'REN:FOLIO')
  SELF.Attribute.Set(?REN:FOLIO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?REN:ACTA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?REN:ACTA,RepGen:XML,TargetAttr:TagName,'REN:ACTA')
  SELF.Attribute.Set(?REN:ACTA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?REN:FECHA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?REN:FECHA,RepGen:XML,TargetAttr:TagName,'REN:FECHA')
  SELF.Attribute.Set(?REN:FECHA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?REN:HORA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?REN:HORA,RepGen:XML,TargetAttr:TagName,'REN:HORA')
  SELF.Attribute.Set(?REN:HORA,RepGen:XML,TargetAttr:TagValueFromText,True)
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
  SELF.SetDocumentInfo('CW Report','Gestion','Reporte:RENUNCIA','Reporte:RENUNCIA','','')
  SELF.SetPagesAsParentBookmark(False)
  SELF.SetScanCopyMode(False)
  SELF.CompressText   = True
  SELF.CompressImages = True

