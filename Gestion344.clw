

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPRHTML.INC'),ONCE
   INCLUDE('ABPRPDF.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('abprtext.inc'),ONCE
   INCLUDE('abprxml.inc'),ONCE
   INCLUDE('abrppsel.inc'),ONCE

                     MAP
                       INCLUDE('GESTION344.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Report
!!! </summary>
IMPRIMIR_COMPROBANTE_INGRESO PROCEDURE 

Progress:Thermometer BYTE                                  ! 
LOC:LETRAS           STRING(100)                           ! 
Process:View         VIEW(INGRESOS)
                       PROJECT(ING:FECHA)
                       PROJECT(ING:IDINGRESO)
                       PROJECT(ING:IDRECIBO)
                       PROJECT(ING:MONTO)
                       PROJECT(ING:OBSERVACION)
                       PROJECT(ING:IDSUBCUENTA)
                       PROJECT(ING:IDPROVEEDOR)
                       JOIN(SUB:INTEG_113,ING:IDSUBCUENTA)
                       END
                       JOIN(PRO2:PK_PROVEEDOR,ING:IDPROVEEDOR)
                         PROJECT(PRO2:CUIT)
                         PROJECT(PRO2:DESCRIPCION)
                         PROJECT(PRO2:DIRECCION)
                         PROJECT(PRO2:IDTIPOIVA)
                         JOIN(TIP7:PK_TIPO_IVA,PRO2:IDTIPOIVA)
                           PROJECT(TIP7:DECRIPCION)
                         END
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
detail                 DETAIL,AT(0,0,,279),USE(?unnamed:4),FONT('Arial',10,,FONT:regular,CHARSET:ANSI)
                         STRING('Fecha:'),AT(124,20),USE(?String22),FONT(,12),TRN
                         STRING(@d17),AT(138,20),USE(ING:FECHA),FONT(,12),RIGHT(1)
                         STRING('Señor/es:'),AT(1,44),USE(?String14),TRN
                         STRING('C.U.I.T.:'),AT(122,44),USE(?String9),TRN
                         STRING(@s50),AT(23,43,94,6),USE(PRO2:DESCRIPCION)
                         STRING('Domicilio:'),AT(1,49),USE(?String16),TRN
                         STRING(@s50),AT(24,49,96,6),USE(PRO2:DIRECCION)
                         STRING('Fecha:'),AT(120,161),USE(?String37),FONT(,12),TRN
                         STRING(@d17),AT(134,161),USE(ING:FECHA,,?ING:FECHA:2),FONT(,12)
                         STRING('Señor/es:'),AT(1,182),USE(?String26),TRN
                         STRING(@s50),AT(20,182,94,6),USE(PRO2:DESCRIPCION,,?PRO2:DESCRIPCION:2)
                         STRING('Domicilio:'),AT(1,187),USE(?String27),TRN
                         STRING(@s50),AT(23,187,88,6),USE(PRO2:DIRECCION,,?PRO2:DIRECCION:2)
                         STRING('C.U.I.T:'),AT(118,182),USE(?String28),TRN
                         STRING('SON $:'),AT(103,260),USE(?String25),FONT(,12),TRN
                         STRING(@n-13.2),AT(118,260),USE(ING:MONTO,,?ING:MONTO:4),FONT(,12,,FONT:bold),LEFT(1)
                         STRING('Res. Carg. '),AT(1,269),USE(?String36),FONT(,8),TRN
                         STRING(@n-14),AT(15,269),USE(ING:IDRECIBO),FONT(,8),TRN
                         STRING('SON $:'),AT(116,116),USE(?String19),FONT(,12),TRN
                         STRING(@n$-13.2),AT(132,116),USE(ING:MONTO,,?ING:MONTO:2),FONT(,14,,FONT:bold)
                         STRING(@P##-########-#P),AT(136,44),USE(PRO2:CUIT)
                         STRING('IVA:<0DH,0AH>'),AT(122,49),USE(?STRING1)
                         STRING('IVA:<0DH,0AH>'),AT(118,187),USE(?STRING2)
                         STRING(@s20),AT(128,187,38),USE(TIP7:DECRIPCION,,?TIP7:DECRIPCION:2)
                         TEXT,AT(24,66,144,35),USE(ING:OBSERVACION)
                         TEXT,AT(19,209,144,29),USE(ING:OBSERVACION,,?ING:OBSERVACION:2)
                         STRING(@s30),AT(132,49,48),USE(TIP7:DECRIPCION)
                         STRING(@P##-########-#P),AT(132,182),USE(PRO2:CUIT,,?PRO2:CUIT:2)
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
  GlobalErrors.SetProcedureName('IMPRIMIR_COMPROBANTE_INGRESO')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('GLO:PAGO',GLO:PAGO)                                ! Added by: Report
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:INGRESOS.Open                                     ! File INGRESOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('IMPRIMIR_COMPROBANTE_INGRESO',ProgressWindow) ! Restore window settings from non-volatile store
  TargetSelector.AddItem(XMLReporter.IReportGenerator)
  TargetSelector.AddItem(HTMLReporter.IReportGenerator)
  TargetSelector.AddItem(TXTReporter.IReportGenerator)
  TargetSelector.AddItem(PDFReporter.IReportGenerator)
  SELF.AddItem(TargetSelector)
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisReport.Init(Process:View, Relate:INGRESOS, ?Progress:PctText, Progress:Thermometer, ProgressMgr, ING:IDINGRESO)
  ThisReport.AddSortOrder(ING:PK_INGRESOS)
  ThisReport.SetFilter('GLO:PAGO = ING:IDINGRESO')
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
    INIMgr.Update('IMPRIMIR_COMPROBANTE_INGRESO',ProgressWindow) ! Save window data to non-volatile store
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
  SELF.Attribute.Set(?PRO2:DESCRIPCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PRO2:DESCRIPCION,RepGen:XML,TargetAttr:TagName,'PRO2:DESCRIPCION')
  SELF.Attribute.Set(?PRO2:DESCRIPCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String16,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String16,RepGen:XML,TargetAttr:TagName,'String16')
  SELF.Attribute.Set(?String16,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PRO2:DIRECCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PRO2:DIRECCION,RepGen:XML,TargetAttr:TagName,'PRO2:DIRECCION')
  SELF.Attribute.Set(?PRO2:DIRECCION,RepGen:XML,TargetAttr:TagValueFromText,True)
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
  SELF.Attribute.Set(?String25,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String25,RepGen:XML,TargetAttr:TagName,'String25')
  SELF.Attribute.Set(?String25,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?ING:MONTO:4,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ING:MONTO:4,RepGen:XML,TargetAttr:TagName,'ING:MONTO:4')
  SELF.Attribute.Set(?ING:MONTO:4,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String36,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String36,RepGen:XML,TargetAttr:TagName,'String36')
  SELF.Attribute.Set(?String36,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?ING:IDRECIBO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ING:IDRECIBO,RepGen:XML,TargetAttr:TagName,'ING:IDRECIBO')
  SELF.Attribute.Set(?ING:IDRECIBO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String19,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String19,RepGen:XML,TargetAttr:TagName,'String19')
  SELF.Attribute.Set(?String19,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?ING:MONTO:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ING:MONTO:2,RepGen:XML,TargetAttr:TagName,'ING:MONTO:2')
  SELF.Attribute.Set(?ING:MONTO:2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PRO2:CUIT,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PRO2:CUIT,RepGen:XML,TargetAttr:TagName,'PRO2:CUIT')
  SELF.Attribute.Set(?PRO2:CUIT,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?STRING1,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?STRING1,RepGen:XML,TargetAttr:TagName,'STRING1')
  SELF.Attribute.Set(?STRING1,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?STRING2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?STRING2,RepGen:XML,TargetAttr:TagName,'STRING2')
  SELF.Attribute.Set(?STRING2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?TIP7:DECRIPCION:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?TIP7:DECRIPCION:2,RepGen:XML,TargetAttr:TagName,'TIP7:DECRIPCION:2')
  SELF.Attribute.Set(?TIP7:DECRIPCION:2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?ING:OBSERVACION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ING:OBSERVACION,RepGen:XML,TargetAttr:TagName,'ING:OBSERVACION')
  SELF.Attribute.Set(?ING:OBSERVACION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?ING:OBSERVACION:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ING:OBSERVACION:2,RepGen:XML,TargetAttr:TagName,'ING:OBSERVACION:2')
  SELF.Attribute.Set(?ING:OBSERVACION:2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?TIP7:DECRIPCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?TIP7:DECRIPCION,RepGen:XML,TargetAttr:TagName,'TIP7:DECRIPCION')
  SELF.Attribute.Set(?TIP7:DECRIPCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PRO2:CUIT:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PRO2:CUIT:2,RepGen:XML,TargetAttr:TagName,'PRO2:CUIT:2')
  SELF.Attribute.Set(?PRO2:CUIT:2,RepGen:XML,TargetAttr:TagValueFromText,True)


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  LOC:LETRAS = PKSNumTexto(ING:MONTO)
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

