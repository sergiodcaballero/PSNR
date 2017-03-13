

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABPRHTML.INC'),ONCE
   INCLUDE('ABPRPDF.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('abprtext.inc'),ONCE
   INCLUDE('abprxml.inc'),ONCE
   INCLUDE('abrppsel.inc'),ONCE

                     MAP
                       INCLUDE('GESTION189.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Report
!!! </summary>
IMPRIMIR_CANTIDAD_DEUDA_SOCIO2 PROCEDURE 

Progress:Thermometer BYTE                                  ! 
L:NroReg             LONG                                  ! 
Process:View         VIEW(SOCIOS)
                       PROJECT(SOC:BAJA_TEMPORARIA)
                       PROJECT(SOC:CANTIDAD)
                       PROJECT(SOC:MATRICULA)
                       PROJECT(SOC:NOMBRE)
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

Report               REPORT,AT(1000,2625,6250,7063),PRE(RPT),PAPER(PAPER:A4),FONT('Arial',10,,FONT:regular,CHARSET:ANSI), |
  THOUS
                       HEADER,AT(1000,1000,6250,1625),USE(?Header)
                         IMAGE('logo.jpg'),AT(10,10,1427,948),USE(?Image1)
                         STRING('CUOTAS ADEUDADAS POR COLEGIADO'),AT(1281,906),USE(?String1),FONT(,14,,FONT:bold+FONT:underline), |
  TRN
                         BOX,AT(10,1333,6365,271),USE(?Box1),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING('Nombre'),AT(917,1344),USE(?String10),TRN
                         STRING('Cant Cuotas'),AT(5323,1344),USE(?String12),TRN
                         STRING('Baja Temp'),AT(3802,1344),USE(?String13),TRN
                         STRING('Matricula'),AT(2667,1344),USE(?String11),TRN
                       END
Detail                 DETAIL,AT(0,0,,250),USE(?Detail)
                         STRING(@s30),AT(21,0),USE(SOC:NOMBRE)
                         STRING(@n-14),AT(5177,0),USE(SOC:CANTIDAD)
                         STRING(@s2),AT(4021,0),USE(SOC:BAJA_TEMPORARIA)
                         LINE,AT(10,219,6229,0),USE(?Line1),COLOR(COLOR:Black)
                         STRING(@n-7),AT(2667,0),USE(SOC:MATRICULA)
                       END
                       FOOTER,AT(1000,9688,6250,1000),USE(?Footer)
                         STRING('Cantidad de Registros: '),AT(10,-10),USE(?String5),TRN
                         STRING(@n-7),AT(1469,0),USE(SOC:CANTIDAD,,?SOC:CANTIDAD:2),CNT
                         LINE,AT(21,219,7271,0),USE(?Line3),COLOR(COLOR:Black)
                         STRING('Fecha del Reporte:'),AT(31,302),USE(?EcFechaReport),FONT('Courier New',7),TRN
                         STRING('DatoEmpresa'),AT(2135,302),USE(?DatoEmpresa),FONT('Courier New',7),TRN
                         STRING('Evolution_Paginas_'),AT(5302,281),USE(?PaginaNdeX),FONT('Courier New',7),TRN
                       END
                       FORM,AT(1000,1000,6250,9688),USE(?Form)
                       END
                     END
ProcessSortSelectionVariable         STRING(1024)          ! Used in the sort order selection
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
ProcessSortSelectionWindow    ROUTINE
 DATA
SortSelectionQueue       QUEUE
SQDS_Order                STRING(1)
SQDS_Description          STRING(50)
SQDS_Field                STRING(100)
SQDS_Sort                 SHORT
                         END
SQDSIndex                SHORT(0)
SortSelectionWindow WINDOW('Select the Order'),AT(,,203,92),FONT('Microsoft Sans Serif',8,,),CENTER,GRAY,DOUBLE
       PROMPT('Select the order to process the data.'),AT(6,4,162,18),FONT(,,,FONT:bold),USE(?SortMessage:Prompt)
       LIST,AT(5,26,162,42),FONT('Microsoft Sans Serif',8,,FONT:bold),USE(?SortSelectionList),VSCROLL,FORMAT('6C@s1@100L@s100@')
       BUTTON,AT(173,28,25,13),ICON('SUP.ICO'),MSG('Move field up'),TIP('Move field up'),USE(?SButtonUp),LEFT,FLAT
       BUTTON,AT(173,41,25,13),ICON('SDOWN.ICO'),MSG('Move field down'),TIP('Move field down'),USE(?SButtonDown),LEFT,FLAT
       BUTTON,AT(173,54,25,13),ICON('SCH-ORD.ICO'),MSG('Change Order'),TIP('Change Order'),USE(?SButtonChangeOrder),LEFT,FLAT
       BUTTON('&OK'),AT(58,74,52,14),ICON('SOK.ICO'),MSG('Accept data and close the window'),TIP('Accept data and close the window'),USE(?SButtonOk),LEFT,FLAT
       BUTTON('&Cancel'),AT(114,74,52,14),ICON('SCANCEL.ICO'),MSG('Cancel operation'),TIP('Cancel operation'),USE(?SButtonCancel),LEFT,FLAT
     END
 CODE
      ! Loading the order fields into the queue
      SortSelectionQueue.SQDS_Order      ='+'
      SortSelectionQueue.SQDS_Description='Nombre'
      SortSelectionQueue.SQDS_Field      ='SOC:NOMBRE'
      SortSelectionQueue.SQDS_Sort       =1
      ADD(SortSelectionQueue)
      SortSelectionQueue.SQDS_Order      ='+'
      SortSelectionQueue.SQDS_Description='Matricula'
      SortSelectionQueue.SQDS_Field      ='SOC:MATRICULA'
      SortSelectionQueue.SQDS_Sort       =2
      ADD(SortSelectionQueue)
      SortSelectionQueue.SQDS_Order      ='-'
      SortSelectionQueue.SQDS_Description='Cantidad'
      SortSelectionQueue.SQDS_Field      ='SOC:CANTIDAD'
      SortSelectionQueue.SQDS_Sort       =3
      ADD(SortSelectionQueue)

      ProcessSortSelectionCanceled=1
      ProcessSortSelectionVariable=''
      OPEN(SortSelectionWindow)
      ?SortSelectionList{PROP:FROM}=SortSelectionQueue
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
              SQDSIndex=?SortSelectionList{PROP:Selected}
              GET(SortSelectionQueue,SQDSIndex)
              IF NOT ERRORCODE() THEN
                 IF SortSelectionQueue.SQDS_Order='-' THEN
                    SortSelectionQueue.SQDS_Order='+'
                 ELSE
                    SortSelectionQueue.SQDS_Order='-'
                 END
                 PUT(SortSelectionQueue)
                 DISPLAY()
              END
          END
        END
        CASE ACCEPTED()
        OF ?SButtonCancel
            ProcessSortSelectionVariable=''
            ProcessSortSelectionCanceled=1
            POST(Event:CloseWindow)
        OF ?SButtonOk
            ProcessSortSelectionCanceled=0
            ProcessSortSelectionVariable=''
            LOOP SQDSIndex=1 TO RECORDS(SortSelectionQueue)
                 GET(SortSelectionQueue,SQDSIndex)
                 IF NOT ERRORCODE() THEN
                    IF CLIP(ProcessSortSelectionVariable) THEN
                       ProcessSortSelectionVariable = CLIP(ProcessSortSelectionVariable)&','&SortSelectionQueue.SQDS_Order&SortSelectionQueue.SQDS_Field
                    ELSE
                       ProcessSortSelectionVariable = SortSelectionQueue.SQDS_Order&SortSelectionQueue.SQDS_Field
                    END
                 END
            END
            POST(Event:CloseWindow)
        OF ?SButtonDown
           SQDSIndex=?SortSelectionList{PROP:Selected}
           GET(SortSelectionQueue,SQDSIndex)
           IF NOT ERRORCODE() THEN
              IF SortSelectionQueue.SQDS_Sort<>RECORDS(SortSelectionQueue) THEN
                 SortSelectionQueue.SQDS_Sort=SortSelectionQueue.SQDS_Sort+1
                 PUT(SortSelectionQueue)
                 GET(SortSelectionQueue,SQDSIndex+1)
                 SortSelectionQueue.SQDS_Sort=SortSelectionQueue.SQDS_Sort-1
                 PUT(SortSelectionQueue)
                 SORT(SortSelectionQueue,SortSelectionQueue.SQDS_Sort)
                 ?SortSelectionList{PROP:Selected}=SQDSIndex+1
                 DISPLAY()
              END
           END
        OF ?SButtonUp
           SQDSIndex=?SortSelectionList{PROP:Selected}
           GET(SortSelectionQueue,SQDSIndex)
           IF NOT ERRORCODE() THEN
              IF SortSelectionQueue.SQDS_Sort<>1 THEN
                 SortSelectionQueue.SQDS_Sort=SortSelectionQueue.SQDS_Sort-1
                 PUT(SortSelectionQueue)
                 GET(SortSelectionQueue,SQDSIndex-1)
                 SortSelectionQueue.SQDS_Sort=SortSelectionQueue.SQDS_Sort+1
                 PUT(SortSelectionQueue)
                 SORT(SortSelectionQueue,SortSelectionQueue.SQDS_Sort)
                 ?SortSelectionList{PROP:Selected}=SQDSIndex-1
                 DISPLAY()
              END
           END
        OF ?SButtonChangeOrder
           SQDSIndex=?SortSelectionList{PROP:Selected}
           GET(SortSelectionQueue,SQDSIndex)
           IF NOT ERRORCODE() THEN
              IF SortSelectionQueue.SQDS_Order='-' THEN
                 SortSelectionQueue.SQDS_Order='+'
              ELSE
                 SortSelectionQueue.SQDS_Order='-'
              END
              PUT(SortSelectionQueue)
              DISPLAY()
           END
        END
      END
      CLOSE(SortSelectionWindow)
      FREE(SortSelectionQueue)
 IF ProcessSortSelectionCanceled THEN
    ProcessSortSelectionVariable=''
 END
 EXIT

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('IMPRIMIR_CANTIDAD_DEUDA_SOCIO2')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('GLO:MONTO',GLO:MONTO)                              ! Added by: Report
  BIND('GLO:PAGO',GLO:PAGO)                                ! Added by: Report
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Do ProcessSortSelectionWindow
  IF ProcessSortSelectionCanceled THEN
     RETURN LEvel:Fatal
  END
  Relate:SOCIOS.Open                                       ! File SOCIOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('IMPRIMIR_CANTIDAD_DEUDA_SOCIO2',ProgressWindow) ! Restore window settings from non-volatile store
  TargetSelector.AddItem(XMLReporter.IReportGenerator)
  TargetSelector.AddItem(HTMLReporter.IReportGenerator)
  TargetSelector.AddItem(TXTReporter.IReportGenerator)
  TargetSelector.AddItem(PDFReporter.IReportGenerator)
  SELF.AddItem(TargetSelector)
  ThisReport.Init(Process:View, Relate:SOCIOS, ?Progress:PctText, Progress:Thermometer)
  ThisReport.AddSortOrder()
  IF (CLIP(ProcessSortSelectionVariable))
     ThisReport.AppendOrder(CLIP(ProcessSortSelectionVariable))
  END
  ThisReport.SetFilter('SOC:CANTIDAD >= GLO:MONTO and SOC:CANTIDAD <<= GLO:PAGO AND SOC:BAJA = ''NO''')
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:SOCIOS.SetQuickScan(1,Propagate:OneMany)
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
    Relate:SOCIOS.Close
  END
  IF SELF.Opened
    INIMgr.Update('IMPRIMIR_CANTIDAD_DEUDA_SOCIO2',ProgressWindow) ! Save window data to non-volatile store
  END
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
  SELF.Attribute.Set(?String1,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String1,RepGen:XML,TargetAttr:TagName,'String1')
  SELF.Attribute.Set(?String1,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String10,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String10,RepGen:XML,TargetAttr:TagName,'String10')
  SELF.Attribute.Set(?String10,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String12,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String12,RepGen:XML,TargetAttr:TagName,'String12')
  SELF.Attribute.Set(?String12,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String13,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String13,RepGen:XML,TargetAttr:TagName,'String13')
  SELF.Attribute.Set(?String13,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String11,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String11,RepGen:XML,TargetAttr:TagName,'String11')
  SELF.Attribute.Set(?String11,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagName,'SOC:NOMBRE')
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:CANTIDAD,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:CANTIDAD,RepGen:XML,TargetAttr:TagName,'SOC:CANTIDAD')
  SELF.Attribute.Set(?SOC:CANTIDAD,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:BAJA_TEMPORARIA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:BAJA_TEMPORARIA,RepGen:XML,TargetAttr:TagName,'SOC:BAJA_TEMPORARIA')
  SELF.Attribute.Set(?SOC:BAJA_TEMPORARIA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagName,'SOC:MATRICULA')
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String5,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String5,RepGen:XML,TargetAttr:TagName,'String5')
  SELF.Attribute.Set(?String5,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:CANTIDAD:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:CANTIDAD:2,RepGen:XML,TargetAttr:TagName,'SOC:CANTIDAD:2')
  SELF.Attribute.Set(?SOC:CANTIDAD:2,RepGen:XML,TargetAttr:TagValueFromText,True)
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
  SELF.SetDocumentInfo('CW Report','Gestion','IMPRIMIR_CANTIDAD_DEUDA_SOCIO2','IMPRIMIR_CANTIDAD_DEUDA_SOCIO2','','')
  SELF.SetPagesAsParentBookmark(False)
  SELF.SetScanCopyMode(False)
  SELF.CompressText   = True
  SELF.CompressImages = True

