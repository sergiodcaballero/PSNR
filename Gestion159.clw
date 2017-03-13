

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABPRHTML.INC'),ONCE
   INCLUDE('ABPRPDF.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('abprtext.inc'),ONCE
   INCLUDE('abprxml.inc'),ONCE
   INCLUDE('abrppsel.inc'),ONCE

                     MAP
                       INCLUDE('GESTION159.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Report
!!! Print the PADRONXESPECIALIDAD File
!!! </summary>
Reporte:PADRONXESPECIALIDAD PROCEDURE 

Progress:Thermometer BYTE                                  ! 
Process:View         VIEW(PADRONXESPECIALIDAD)
                       PROJECT(PAD:IDESPECIALIDAD)
                       PROJECT(PAD:IDSOCIO)
                       JOIN(SOC:PK_SOCIOS,PAD:IDSOCIO)
                         PROJECT(SOC:MATRICULA)
                         PROJECT(SOC:NOMBRE)
                       END
                       JOIN(ESP:PK_ESPECIALIDAD,PAD:IDESPECIALIDAD)
                         PROJECT(ESP:DESCRIPCION)
                       END
                     END
ProgressWindow       WINDOW('Reporte de PADRONXESPECIALIDAD'),AT(,,142,59),FONT('MS Sans Serif',8,,FONT:regular), |
  DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100),SMOOTH
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancelar'),AT(43,42,55,15),USE(?Progress:Cancel),LEFT,ICON('cancel.ICO'),FLAT,MSG('Cancela Reporte'), |
  TIP('Cancela Reporte')
                     END

Report               REPORT('PADRONXESPECIALIDAD Report'),AT(250,850,7750,10333),PRE(RPT),PAPER(PAPER:A4),FONT('MS Sans Serif', |
  8,,FONT:regular),THOUS
                       HEADER,AT(250,250,7750,604),USE(?Header),FONT('MS Sans Serif',8,,FONT:regular)
                         STRING('Reporte de  PADRON POR ESPECIALIDAD'),AT(0,20,7750,220),USE(?ReportTitle),FONT('MS Sans Serif', |
  8,,FONT:regular),CENTER
                         BOX,AT(0,350,7750,250),USE(?HeaderBox),COLOR(COLOR:Black)
                         LINE,AT(3875,350,0,250),USE(?HeaderLine:1),COLOR(COLOR:Black)
                         STRING('IDESPECIALIDAD'),AT(52,396,3775,170),USE(?HeaderTitle:1),TRN
                         STRING('NOMBRE'),AT(6385,396),USE(?String15),TRN
                         STRING('MATRIC.'),AT(4854,396),USE(?String14),TRN
                         STRING('IDSOCIO'),AT(3927,396,542,167),USE(?HeaderTitle:2),TRN
                       END
Detail                 DETAIL,AT(,,7750,208),USE(?Detail)
                         LINE,AT(0,0,0,210),USE(?DetailLine:0),COLOR(COLOR:Black)
                         LINE,AT(3875,0,0,210),USE(?DetailLine:1),COLOR(COLOR:Black)
                         LINE,AT(7750,0,0,210),USE(?DetailLine:2),COLOR(COLOR:Black)
                         STRING(@s50),AT(469,21,3177,167),USE(ESP:DESCRIPCION)
                         STRING(@n-7),AT(4781,21),USE(SOC:MATRICULA)
                         STRING(@s30),AT(5677,21,1948,167),USE(SOC:NOMBRE)
                         STRING(@n-7),AT(31,21,469,167),USE(PAD:IDESPECIALIDAD)
                         STRING(@n-7),AT(3927,21,479,167),USE(PAD:IDSOCIO)
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
      'PK_ESPXSOC' & |
      '|' & 'FK_PADRONXESPECIALIDAD_ESP' & |
      '|' & 'FK_PADRONXESPECIALIDAD_SOCI' & |
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
  GlobalErrors.SetProcedureName('Reporte:PADRONXESPECIALIDAD')
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
  Relate:PADRONXESPECIALIDAD.Open                          ! File PADRONXESPECIALIDAD used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('Reporte:PADRONXESPECIALIDAD',ProgressWindow) ! Restore window settings from non-volatile store
  TargetSelector.AddItem(XMLReporter.IReportGenerator)
  TargetSelector.AddItem(HTMLReporter.IReportGenerator)
  TargetSelector.AddItem(TXTReporter.IReportGenerator)
  TargetSelector.AddItem(PDFReporter.IReportGenerator)
  SELF.AddItem(TargetSelector)
  ThisReport.Init(Process:View, Relate:PADRONXESPECIALIDAD, ?Progress:PctText, Progress:Thermometer)
  ThisReport.AddSortOrder()
  IF (UPPER(CLIP(ProcessSortSelectionVariable))=UPPER('PK_ESPXSOC')) THEN
     ThisReport.AppendOrder('+PAD:IDESPECIALIDAD,+PAD:IDSOCIO')
  ELSIF (UPPER(CLIP(ProcessSortSelectionVariable))=UPPER('FK_PADRONXESPECIALIDAD_ESP')) THEN
     ThisReport.AppendOrder('+PAD:IDESPECIALIDAD')
  ELSIF (UPPER(CLIP(ProcessSortSelectionVariable))=UPPER('FK_PADRONXESPECIALIDAD_SOCI')) THEN
     ThisReport.AppendOrder('+PAD:IDSOCIO')
  END
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:PADRONXESPECIALIDAD.SetQuickScan(1,Propagate:OneMany)
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
    Relate:PADRONXESPECIALIDAD.Close
  END
  IF SELF.Opened
    INIMgr.Update('Reporte:PADRONXESPECIALIDAD',ProgressWindow) ! Save window data to non-volatile store
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
  SELF.Attribute.Set(?String15,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String15,RepGen:XML,TargetAttr:TagName,'String15')
  SELF.Attribute.Set(?String15,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String14,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String14,RepGen:XML,TargetAttr:TagName,'String14')
  SELF.Attribute.Set(?String14,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?HeaderTitle:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?HeaderTitle:2,RepGen:XML,TargetAttr:TagName,'HeaderTitle:2')
  SELF.Attribute.Set(?HeaderTitle:2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?ESP:DESCRIPCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ESP:DESCRIPCION,RepGen:XML,TargetAttr:TagName,'ESP:DESCRIPCION')
  SELF.Attribute.Set(?ESP:DESCRIPCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagName,'SOC:MATRICULA')
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagName,'SOC:NOMBRE')
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PAD:IDESPECIALIDAD,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PAD:IDESPECIALIDAD,RepGen:XML,TargetAttr:TagName,'PAD:IDESPECIALIDAD')
  SELF.Attribute.Set(?PAD:IDESPECIALIDAD,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PAD:IDSOCIO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PAD:IDSOCIO,RepGen:XML,TargetAttr:TagName,'PAD:IDSOCIO')
  SELF.Attribute.Set(?PAD:IDSOCIO,RepGen:XML,TargetAttr:TagValueFromText,True)
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
  SELF.SetDocumentInfo('CW Report','Gestion','Reporte:PADRONXESPECIALIDAD','Reporte:PADRONXESPECIALIDAD','','')
  SELF.SetPagesAsParentBookmark(False)
  SELF.SetScanCopyMode(False)
  SELF.CompressText   = True
  SELF.CompressImages = True

