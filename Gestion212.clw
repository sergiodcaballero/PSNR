

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPRHTML.INC'),ONCE
   INCLUDE('ABPRPDF.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('abprtext.inc'),ONCE
   INCLUDE('abprxml.inc'),ONCE
   INCLUDE('abrppsel.inc'),ONCE

                     MAP
                       INCLUDE('GESTION212.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Report
!!! Recibo de Pago 
!!! </summary>
IMPRIMIR_PAGO_CURSO PROCEDURE 

Progress:Thermometer BYTE                                  ! 
L:NroReg             LONG                                  ! 
LOC:LETRAS           STRING(100)                           ! 
Process:View         VIEW(INGRESOS)
                       PROJECT(ING:FECHA)
                       PROJECT(ING:IDINGRESO)
                       PROJECT(ING:IDRECIBO)
                       PROJECT(ING:MONTO)
                       PROJECT(ING:IDPROVEEDOR)
                       JOIN(PRO2:PK_PROVEEDOR,ING:IDPROVEEDOR)
                         PROJECT(PRO2:CUIT)
                         PROJECT(PRO2:DESCRIPCION)
                         PROJECT(PRO2:DIRECCION)
                       END
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

Report               REPORT,AT(16,5,182,278),PRE(RPT),PAPER(PAPER:A4),FONT('Arial',9,COLOR:Black,FONT:bold,CHARSET:ANSI), |
  MM
detail                 DETAIL,AT(,,,279),USE(?unnamed:4),FONT('Arial',10,,FONT:regular,CHARSET:ANSI)
                         STRING('Fecha:'),AT(124,24),USE(?String22),FONT(,12),TRN
                         STRING(@d17),AT(138,24),USE(ING:FECHA),FONT(,12),RIGHT(1)
                         STRING('Señor/es:'),AT(1,44),USE(?String14),TRN
                         STRING('C.U.I.T.:'),AT(137,52),USE(?String9),TRN
                         STRING(@P##-########-#P),AT(152,52),USE(PRO2:CUIT)
                         STRING(@s50),AT(23,44,94,6),USE(PRO2:DESCRIPCION)
                         STRING('La suma de:'),AT(1,63),USE(?String17),TRN
                         STRING(@n$-13.2),AT(22,63),USE(ING:MONTO)
                         STRING('Domicilio:'),AT(1,52),USE(?String16),TRN
                         STRING(@s50),AT(24,52,96,6),USE(PRO2:DIRECCION)
                         STRING('--'),AT(44,63),USE(?String34),TRN
                         STRING('En concepto de :'),AT(1,76),USE(?String18),TRN
                         TEXT,AT(30,77,143,21),USE(REPORTE_LARGO),BOXED
                         STRING(@s100),AT(49,63,127,6),USE(LOC:LETRAS),TRN
                         STRING('Aclaración:.{86}'),AT(73,126),USE(?String21),TRN
                         STRING('Fecha:'),AT(120,161),USE(?String37),FONT(,12),TRN
                         STRING(@d17),AT(134,161),USE(ING:FECHA,,?ING:FECHA:2),FONT(,12)
                         STRING('Señor/es:'),AT(1,182),USE(?String26),TRN
                         STRING(@s50),AT(20,182,115,6),USE(PRO2:DESCRIPCION,,?PRO2:DESCRIPCION:2)
                         STRING('Domicilio:'),AT(1,190),USE(?String27),TRN
                         STRING(@s50),AT(23,190,88,6),USE(PRO2:DIRECCION,,?PRO2:DIRECCION:2)
                         STRING('C.U.I.T:'),AT(125,190),USE(?String28),TRN
                         STRING(@P##-########-#P),AT(137,190),USE(PRO2:CUIT,,?PRO2:CUIT:2)
                         STRING('--'),AT(45,213),USE(?String35),TRN
                         STRING('La suma de: '),AT(1,213),USE(?String29),TRN
                         STRING(@n-13.2),AT(25,213),USE(ING:MONTO,,?ING:MONTO:3),FONT(,,,FONT:bold),LEFT(1)
                         STRING(@s100),AT(51,213,117,6),USE(LOC:LETRAS,,?LOC:LETRAS:2)
                         STRING('En concepto de:'),AT(1,228),USE(?String30),TRN
                         TEXT,AT(28,230,143,21),USE(REPORTE_LARGO,,?REPORTE_LARGO:2),BOXED
                         STRING('SON $:'),AT(6,260),USE(?String25),FONT(,12),TRN
                         STRING(@n-13.2),AT(21,260),USE(ING:MONTO,,?ING:MONTO:4),FONT(,12,,FONT:bold),LEFT(1)
                         STRING('Firma:.{92}'),AT(74,256),USE(?String23),TRN
                         STRING('Aclaración:.{86}'),AT(73,265),USE(?String24),TRN
                         STRING('Res. Carg. '),AT(1,269),USE(?String36),FONT(,8),TRN
                         STRING(@n-14),AT(15,269),USE(ING:IDRECIBO),FONT(,8),TRN
                         STRING('Firma:.{92}'),AT(74,117),USE(?String20),TRN
                         STRING('SON $:'),AT(1,120),USE(?String19),FONT(,12),TRN
                         STRING(@n$-13.2),AT(17,120),USE(ING:MONTO,,?ING:MONTO:2),FONT(,14,,FONT:bold)
                       END
                       FORM,AT(16,5,182,278),USE(?unnamed:3)
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
  GlobalErrors.SetProcedureName('IMPRIMIR_PAGO_CURSO')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:INGRESOS.Open                                     ! File INGRESOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('IMPRIMIR_PAGO_CURSO',ProgressWindow)       ! Restore window settings from non-volatile store
  TargetSelector.AddItem(XMLReporter.IReportGenerator)
  TargetSelector.AddItem(HTMLReporter.IReportGenerator)
  TargetSelector.AddItem(PDFReporter.IReportGenerator)
  TargetSelector.AddItem(TXTReporter.IReportGenerator)
  SELF.AddItem(TargetSelector)
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisReport.Init(Process:View, Relate:INGRESOS, ?Progress:PctText, Progress:Thermometer, ProgressMgr, ING:IDINGRESO)
  ThisReport.AddSortOrder(ING:PK_INGRESOS)
  ThisReport.AddRange(ING:IDINGRESO,)
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:INGRESOS.SetQuickScan(1,Propagate:OneMany)
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
    Relate:INGRESOS.Close
  END
  IF SELF.Opened
    INIMgr.Update('IMPRIMIR_PAGO_CURSO',ProgressWindow)    ! Save window data to non-volatile store
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
  SELF.Attribute.Set(?String22,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String22,RepGen:XML,TargetAttr:TagName,'String22')
  SELF.Attribute.Set(?String22,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?ING:FECHA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ING:FECHA,RepGen:XML,TargetAttr:TagName,'ING:FECHA')
  SELF.Attribute.Set(?ING:FECHA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String14,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String14,RepGen:XML,TargetAttr:TagName,'String14')
  SELF.Attribute.Set(?String14,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String9,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String9,RepGen:XML,TargetAttr:TagName,'String9')
  SELF.Attribute.Set(?String9,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PRO2:CUIT,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PRO2:CUIT,RepGen:XML,TargetAttr:TagName,'PRO2:CUIT')
  SELF.Attribute.Set(?PRO2:CUIT,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PRO2:DESCRIPCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PRO2:DESCRIPCION,RepGen:XML,TargetAttr:TagName,'PRO2:DESCRIPCION')
  SELF.Attribute.Set(?PRO2:DESCRIPCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String17,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String17,RepGen:XML,TargetAttr:TagName,'String17')
  SELF.Attribute.Set(?String17,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?ING:MONTO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ING:MONTO,RepGen:XML,TargetAttr:TagName,'ING:MONTO')
  SELF.Attribute.Set(?ING:MONTO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String16,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String16,RepGen:XML,TargetAttr:TagName,'String16')
  SELF.Attribute.Set(?String16,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PRO2:DIRECCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PRO2:DIRECCION,RepGen:XML,TargetAttr:TagName,'PRO2:DIRECCION')
  SELF.Attribute.Set(?PRO2:DIRECCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String34,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String34,RepGen:XML,TargetAttr:TagName,'String34')
  SELF.Attribute.Set(?String34,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String18,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String18,RepGen:XML,TargetAttr:TagName,'String18')
  SELF.Attribute.Set(?String18,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?REPORTE_LARGO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?REPORTE_LARGO,RepGen:XML,TargetAttr:TagName,'REPORTE_LARGO')
  SELF.Attribute.Set(?REPORTE_LARGO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?LOC:LETRAS,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?LOC:LETRAS,RepGen:XML,TargetAttr:TagName,'LOC:LETRAS')
  SELF.Attribute.Set(?LOC:LETRAS,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String21,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String21,RepGen:XML,TargetAttr:TagName,'String21')
  SELF.Attribute.Set(?String21,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String37,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String37,RepGen:XML,TargetAttr:TagName,'String37')
  SELF.Attribute.Set(?String37,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?ING:FECHA:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ING:FECHA:2,RepGen:XML,TargetAttr:TagName,'ING:FECHA:2')
  SELF.Attribute.Set(?ING:FECHA:2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String26,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String26,RepGen:XML,TargetAttr:TagName,'String26')
  SELF.Attribute.Set(?String26,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PRO2:DESCRIPCION:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PRO2:DESCRIPCION:2,RepGen:XML,TargetAttr:TagName,'PRO2:DESCRIPCION:2')
  SELF.Attribute.Set(?PRO2:DESCRIPCION:2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String27,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String27,RepGen:XML,TargetAttr:TagName,'String27')
  SELF.Attribute.Set(?String27,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PRO2:DIRECCION:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PRO2:DIRECCION:2,RepGen:XML,TargetAttr:TagName,'PRO2:DIRECCION:2')
  SELF.Attribute.Set(?PRO2:DIRECCION:2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String28,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String28,RepGen:XML,TargetAttr:TagName,'String28')
  SELF.Attribute.Set(?String28,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PRO2:CUIT:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PRO2:CUIT:2,RepGen:XML,TargetAttr:TagName,'PRO2:CUIT:2')
  SELF.Attribute.Set(?PRO2:CUIT:2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String35,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String35,RepGen:XML,TargetAttr:TagName,'String35')
  SELF.Attribute.Set(?String35,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String29,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String29,RepGen:XML,TargetAttr:TagName,'String29')
  SELF.Attribute.Set(?String29,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?ING:MONTO:3,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ING:MONTO:3,RepGen:XML,TargetAttr:TagName,'ING:MONTO:3')
  SELF.Attribute.Set(?ING:MONTO:3,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?LOC:LETRAS:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?LOC:LETRAS:2,RepGen:XML,TargetAttr:TagName,'LOC:LETRAS:2')
  SELF.Attribute.Set(?LOC:LETRAS:2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String30,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String30,RepGen:XML,TargetAttr:TagName,'String30')
  SELF.Attribute.Set(?String30,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?REPORTE_LARGO:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?REPORTE_LARGO:2,RepGen:XML,TargetAttr:TagName,'REPORTE_LARGO:2')
  SELF.Attribute.Set(?REPORTE_LARGO:2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String25,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String25,RepGen:XML,TargetAttr:TagName,'String25')
  SELF.Attribute.Set(?String25,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?ING:MONTO:4,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ING:MONTO:4,RepGen:XML,TargetAttr:TagName,'ING:MONTO:4')
  SELF.Attribute.Set(?ING:MONTO:4,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String23,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String23,RepGen:XML,TargetAttr:TagName,'String23')
  SELF.Attribute.Set(?String23,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String24,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String24,RepGen:XML,TargetAttr:TagName,'String24')
  SELF.Attribute.Set(?String24,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String36,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String36,RepGen:XML,TargetAttr:TagName,'String36')
  SELF.Attribute.Set(?String36,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?ING:IDRECIBO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ING:IDRECIBO,RepGen:XML,TargetAttr:TagName,'ING:IDRECIBO')
  SELF.Attribute.Set(?ING:IDRECIBO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String20,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String20,RepGen:XML,TargetAttr:TagName,'String20')
  SELF.Attribute.Set(?String20,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String19,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String19,RepGen:XML,TargetAttr:TagName,'String19')
  SELF.Attribute.Set(?String19,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?ING:MONTO:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ING:MONTO:2,RepGen:XML,TargetAttr:TagName,'ING:MONTO:2')
  SELF.Attribute.Set(?ING:MONTO:2,RepGen:XML,TargetAttr:TagValueFromText,True)


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  LOC:LETRAS =PKSNumTexto(ING:MONTO)
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

