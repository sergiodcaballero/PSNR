

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABPRHTML.INC'),ONCE
   INCLUDE('ABPRPDF.INC'),ONCE
   INCLUDE('ABQUERY.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABUTIL.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE
   INCLUDE('abprtext.inc'),ONCE
   INCLUDE('abprxml.inc'),ONCE
   INCLUDE('abrppsel.inc'),ONCE

                     MAP
                       INCLUDE('GESTION025.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION002.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION004.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION026.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Report
!!! </summary>
VER_PAGOS3 PROCEDURE (FILTRO,ORDEN)

Progress:Thermometer BYTE                                  ! 
L:NroReg             LONG                                  ! 
Process:View         VIEW(PAGOS)
                       PROJECT(PAG:ANO)
                       PROJECT(PAG:FECHA)
                       PROJECT(PAG:HORA)
                       PROJECT(PAG:IDFACTURA)
                       PROJECT(PAG:IDPAGOS)
                       PROJECT(PAG:IDRECIBO)
                       PROJECT(PAG:IDSOCIO)
                       PROJECT(PAG:MES)
                       PROJECT(PAG:MONTO)
                       PROJECT(PAG:SUCURSAL)
                       JOIN(FAC:PK_FACTURA,PAG:IDFACTURA)
                         PROJECT(FAC:ANO)
                         PROJECT(FAC:ESTADO)
                         PROJECT(FAC:IDFACTURA)
                         PROJECT(FAC:MES)
                         PROJECT(FAC:TOTAL)
                       END
                       JOIN(SOC:PK_SOCIOS,PAG:IDSOCIO)
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

Report               REPORT,AT(1000,2000,6250,7688),PRE(RPT),PAPER(PAPER:A4),FONT('Arial',8,,FONT:bold,CHARSET:ANSI), |
  THOUS
                       HEADER,AT(1000,1000,6250,1000),USE(?Header)
                         IMAGE('Logo.JPG'),AT(10,31,1396,896),USE(?Image1)
                         STRING('Reporte de Pagos'),AT(2542,802),USE(?String1),FONT(,10,,FONT:bold+FONT:underline), |
  TRN
                       END
Detail                 DETAIL,AT(0,0,,1583),USE(?Detail)
                         LINE,AT(10,10,6229,0),USE(?Line1),COLOR(COLOR:Black)
                         STRING('Nº Pago:'),AT(21,42),USE(?String12),TRN
                         STRING(@n-7),AT(521,52),USE(PAG:IDPAGOS)
                         STRING('Recibo:'),AT(1125,73),USE(?String13),TRN
                         STRING('Colegiado:'),AT(10,302),USE(?String14),TRN
                         STRING(@n-7),AT(646,302),USE(PAG:IDSOCIO)
                         STRING(@s30),AT(1177,302),USE(SOC:NOMBRE)
                         STRING(@s11),AT(3750,302),USE(SOC:MATRICULA)
                         STRING('Mes:'),AT(1229,594),USE(?String19),TRN
                         STRING('Hora:'),AT(4490,594),USE(?String22),TRN
                         GROUP('Datos de la Factura '),AT(21,844,6281,594),USE(?Group1),BOXED,TRN
                           STRING(@n-14),AT(740,979),USE(FAC:IDFACTURA),RIGHT(1)
                           STRING('Monto:'),AT(1771,979),USE(?String29),TRN
                           STRING(@n$-10.2),AT(2208,979),USE(FAC:TOTAL),DECIMAL(12)
                           STRING('Año:'),AT(4063,979),USE(?String31),TRN
                           STRING('Mes:'),AT(3063,979),USE(?String30),TRN
                           STRING('Nº Recibo S.:'),AT(52,979),USE(?String28),TRN
                           STRING(@s21),AT(583,1208),USE(FAC:ESTADO)
                           STRING('Estado:'),AT(73,1208),USE(?String32),TRN
                           STRING(@n-3),AT(3469,979),USE(FAC:MES),RIGHT(1)
                           STRING(@n-5),AT(4396,979),USE(FAC:ANO),RIGHT(1)
                         END
                         LINE,AT(21,1531,6219,0),USE(?Line3),COLOR(COLOR:Black)
                         LINE,AT(10,21,6229,0),USE(?Line2),COLOR(COLOR:Black)
                         STRING('Matricula:'),AT(3177,302),USE(?String17),TRN
                         STRING(@P####-P),AT(1583,63),USE(PAG:SUCURSAL)
                         STRING(@n-14),AT(1927,63),USE(PAG:IDRECIBO)
                         STRING(@n-14),AT(5177,83),USE(PAG:IDFACTURA)
                         STRING(@n$-10.2),AT(500,594),USE(PAG:MONTO)
                         STRING('Fecha Pago: '),AT(2875,594),USE(?String21),TRN
                         STRING('Año:'),AT(1833,594),USE(?String20),TRN
                         STRING('Monto:'),AT(63,594),USE(?String18),TRN
                         STRING(@t7),AT(4854,594),USE(PAG:HORA)
                         STRING(@d17),AT(3583,594),USE(PAG:FECHA)
                         STRING(@s4),AT(2250,594),USE(PAG:ANO)
                         STRING(@s2),AT(1542,594),USE(PAG:MES)
                       END
                       FOOTER,AT(1000,9688,6250,1000),USE(?Footer)
                         LINE,AT(10,135,7271,0),USE(?Line3:2),COLOR(COLOR:Black)
                         STRING('Fecha del Reporte:'),AT(21,219),USE(?EcFechaReport),FONT('Courier New',7),TRN
                         STRING('DatoEmpresa'),AT(2125,219),USE(?DatoEmpresa),FONT('Courier New',7),TRN
                         STRING('Evolution_Paginas_'),AT(5625,219),USE(?PaginaNdeX),FONT('Courier New',7),TRN
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
  GlobalErrors.SetProcedureName('VER_PAGOS3')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:PAGOS.Open                                        ! File PAGOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('VER_PAGOS3',ProgressWindow)                ! Restore window settings from non-volatile store
  TargetSelector.AddItem(XMLReporter.IReportGenerator)
  TargetSelector.AddItem(HTMLReporter.IReportGenerator)
  TargetSelector.AddItem(TXTReporter.IReportGenerator)
  TargetSelector.AddItem(PDFReporter.IReportGenerator)
  SELF.AddItem(TargetSelector)
  ThisReport.Init(Process:View, Relate:PAGOS, ?Progress:PctText, Progress:Thermometer)
  ThisReport.AddSortOrder()
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:PAGOS.SetQuickScan(1,Propagate:OneMany)
  ProgressWindow{PROP:Timer} = 10                          ! Assign timer interval
  SELF.SkipPreview = False
  Previewer.SetINIManager(INIMgr)
  Previewer.AllowUserZoom = True
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
    Relate:PAGOS.Close
  END
  IF SELF.Opened
    INIMgr.Update('VER_PAGOS3',ProgressWindow)             ! Save window data to non-volatile store
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
  SELF.Attribute.Set(?String12,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String12,RepGen:XML,TargetAttr:TagName,'String12')
  SELF.Attribute.Set(?String12,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PAG:IDPAGOS,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PAG:IDPAGOS,RepGen:XML,TargetAttr:TagName,'PAG:IDPAGOS')
  SELF.Attribute.Set(?PAG:IDPAGOS,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String13,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String13,RepGen:XML,TargetAttr:TagName,'String13')
  SELF.Attribute.Set(?String13,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String14,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String14,RepGen:XML,TargetAttr:TagName,'String14')
  SELF.Attribute.Set(?String14,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PAG:IDSOCIO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PAG:IDSOCIO,RepGen:XML,TargetAttr:TagName,'PAG:IDSOCIO')
  SELF.Attribute.Set(?PAG:IDSOCIO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagName,'SOC:NOMBRE')
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagName,'SOC:MATRICULA')
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String19,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String19,RepGen:XML,TargetAttr:TagName,'String19')
  SELF.Attribute.Set(?String19,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String22,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String22,RepGen:XML,TargetAttr:TagName,'String22')
  SELF.Attribute.Set(?String22,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?Group1,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?Group1,RepGen:XML,TargetAttr:TagNameFromText,True)
  SELF.Attribute.Set(?FAC:IDFACTURA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?FAC:IDFACTURA,RepGen:XML,TargetAttr:TagName,'FAC:IDFACTURA')
  SELF.Attribute.Set(?FAC:IDFACTURA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String29,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String29,RepGen:XML,TargetAttr:TagName,'String29')
  SELF.Attribute.Set(?String29,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?FAC:TOTAL,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?FAC:TOTAL,RepGen:XML,TargetAttr:TagName,'FAC:TOTAL')
  SELF.Attribute.Set(?FAC:TOTAL,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String31,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String31,RepGen:XML,TargetAttr:TagName,'String31')
  SELF.Attribute.Set(?String31,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String30,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String30,RepGen:XML,TargetAttr:TagName,'String30')
  SELF.Attribute.Set(?String30,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String28,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String28,RepGen:XML,TargetAttr:TagName,'String28')
  SELF.Attribute.Set(?String28,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?FAC:ESTADO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?FAC:ESTADO,RepGen:XML,TargetAttr:TagName,'FAC:ESTADO')
  SELF.Attribute.Set(?FAC:ESTADO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String32,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String32,RepGen:XML,TargetAttr:TagName,'String32')
  SELF.Attribute.Set(?String32,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?FAC:MES,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?FAC:MES,RepGen:XML,TargetAttr:TagName,'FAC:MES')
  SELF.Attribute.Set(?FAC:MES,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?FAC:ANO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?FAC:ANO,RepGen:XML,TargetAttr:TagName,'FAC:ANO')
  SELF.Attribute.Set(?FAC:ANO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String17,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String17,RepGen:XML,TargetAttr:TagName,'String17')
  SELF.Attribute.Set(?String17,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PAG:SUCURSAL,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PAG:SUCURSAL,RepGen:XML,TargetAttr:TagName,'PAG:SUCURSAL')
  SELF.Attribute.Set(?PAG:SUCURSAL,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PAG:IDRECIBO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PAG:IDRECIBO,RepGen:XML,TargetAttr:TagName,'PAG:IDRECIBO')
  SELF.Attribute.Set(?PAG:IDRECIBO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PAG:IDFACTURA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PAG:IDFACTURA,RepGen:XML,TargetAttr:TagName,'PAG:IDFACTURA')
  SELF.Attribute.Set(?PAG:IDFACTURA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PAG:MONTO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PAG:MONTO,RepGen:XML,TargetAttr:TagName,'PAG:MONTO')
  SELF.Attribute.Set(?PAG:MONTO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String21,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String21,RepGen:XML,TargetAttr:TagName,'String21')
  SELF.Attribute.Set(?String21,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String20,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String20,RepGen:XML,TargetAttr:TagName,'String20')
  SELF.Attribute.Set(?String20,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String18,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String18,RepGen:XML,TargetAttr:TagName,'String18')
  SELF.Attribute.Set(?String18,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PAG:HORA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PAG:HORA,RepGen:XML,TargetAttr:TagName,'PAG:HORA')
  SELF.Attribute.Set(?PAG:HORA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PAG:FECHA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PAG:FECHA,RepGen:XML,TargetAttr:TagName,'PAG:FECHA')
  SELF.Attribute.Set(?PAG:FECHA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PAG:ANO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PAG:ANO,RepGen:XML,TargetAttr:TagName,'PAG:ANO')
  SELF.Attribute.Set(?PAG:ANO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PAG:MES,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PAG:MES,RepGen:XML,TargetAttr:TagName,'PAG:MES')
  SELF.Attribute.Set(?PAG:MES,RepGen:XML,TargetAttr:TagValueFromText,True)
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
  SELF.SetCheckBoxString('[X]','[_]')
  SELF.SetRadioButtonString('(*)','(_)')
  SELF.SetLineString('|','|','-','-','/','\','\','/')
  SELF.SetTextFillString(' ',CHR(176),CHR(177),CHR(178),CHR(219))
  SELF.SetOmitGraph(False)


PDFReporter.SetUp PROCEDURE

  CODE
  PARENT.SetUp
  SELF.SetFileName('')
  SELF.SetDocumentInfo('CW Report','Gestion','VER_PAGOS3','VER_PAGOS3','','')
  SELF.SetPagesAsParentBookmark(False)
  SELF.SetScanCopyMode(False)
  SELF.CompressText   = True
  SELF.CompressImages = True

!!! <summary>
!!! Generated from procedure template - Window
!!! Actualizacion PAGOSXCIRCULO
!!! </summary>
UpdatePAGOSXCIRCULO PROCEDURE 

CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
History::PAG1:Record LIKE(PAG1:RECORD),THREAD
QuickWindow          WINDOW('Actualizacion PAGOS X  DISTRITO'),AT(,,283,63),FONT('MS Sans Serif',8,,FONT:regular), |
  RESIZE,CENTER,GRAY,IMM,MDI,HLP('UpdatePAGOSXCIRCULO'),SYSTEM
                       PROMPT('IDSOCIO:'),AT(2,5),USE(?PAG1:IDSOCIO:Prompt),TRN
                       ENTRY(@n-14),AT(55,5,64,10),USE(PAG1:IDSOCIO),RIGHT(1)
                       BUTTON('...'),AT(123,4,12,12),USE(?CallLookup)
                       STRING(@s30),AT(138,6),USE(SOC:NOMBRE)
                       BUTTON('...'),AT(122,17,12,12),USE(?CallLookup:2)
                       STRING(@s50),AT(138,18),USE(CIR:DESCRIPCION)
                       LINE,AT(1,35,282,0),USE(?Line1),COLOR(COLOR:Black)
                       PROMPT('ID DISTRITO:'),AT(2,18),USE(?PAG1:IDCIRCULO:Prompt),TRN
                       ENTRY(@n-14),AT(55,18,64,10),USE(PAG1:IDCIRCULO),RIGHT(1)
                       BUTTON('&Aceptar'),AT(80,41,49,14),USE(?OK),LEFT,ICON('ok.ico'),CURSOR('mano.cur'),DEFAULT, |
  FLAT,MSG('Confirma y Actualiza el Formulario'),TIP('Confirma y Actualiza el Formulario')
                       BUTTON('&Cancelar'),AT(133,41,69,14),USE(?Cancel),LEFT,ICON('cancelar.ico'),CURSOR('mano.cur'), |
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
  GlobalErrors.SetProcedureName('UpdatePAGOSXCIRCULO')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?PAG1:IDSOCIO:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(PAG1:Record,History::PAG1:Record)
  SELF.AddHistoryField(?PAG1:IDSOCIO,1)
  SELF.AddHistoryField(?PAG1:IDCIRCULO,2)
  SELF.AddUpdateFile(Access:PAGOSXCIRCULO)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:CIRCULO.Open                                      ! File CIRCULO used by this procedure, so make sure it's RelationManager is open
  Relate:PAGOSXCIRCULO.Open                                ! File PAGOSXCIRCULO used by this procedure, so make sure it's RelationManager is open
  Relate:SOCIOS.Open                                       ! File SOCIOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:PAGOSXCIRCULO
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
    ?PAG1:IDSOCIO{PROP:ReadOnly} = True
    DISABLE(?CallLookup)
    DISABLE(?CallLookup:2)
    ?PAG1:IDCIRCULO{PROP:ReadOnly} = True
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdatePAGOSXCIRCULO',QuickWindow)          ! Restore window settings from non-volatile store
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
    Relate:CIRCULO.Close
    Relate:PAGOSXCIRCULO.Close
    Relate:SOCIOS.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdatePAGOSXCIRCULO',QuickWindow)       ! Save window data to non-volatile store
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
      SelectCIRCULO
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
    OF ?PAG1:IDSOCIO
      SOC:IDSOCIO = PAG1:IDSOCIO
      IF Access:SOCIOS.TryFetch(SOC:PK_SOCIOS)
        IF SELF.Run(1,SelectRecord) = RequestCompleted
          PAG1:IDSOCIO = SOC:IDSOCIO
        ELSE
          SELECT(?PAG1:IDSOCIO)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
      IF Access:PAGOSXCIRCULO.TryValidateField(1)          ! Attempt to validate PAG1:IDSOCIO in PAGOSXCIRCULO
        SELECT(?PAG1:IDSOCIO)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?PAG1:IDSOCIO
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?PAG1:IDSOCIO{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?CallLookup
      ThisWindow.Update()
      SOC:IDSOCIO = PAG1:IDSOCIO
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        PAG1:IDSOCIO = SOC:IDSOCIO
      END
      ThisWindow.Reset(1)
    OF ?CallLookup:2
      ThisWindow.Update()
      CIR:IDCIRCULO = PAG1:IDCIRCULO
      IF SELF.Run(2,SelectRecord) = RequestCompleted
        PAG1:IDCIRCULO = CIR:IDCIRCULO
      END
      ThisWindow.Reset(1)
    OF ?PAG1:IDCIRCULO
      CIR:IDCIRCULO = PAG1:IDCIRCULO
      IF Access:CIRCULO.TryFetch(CIR:PK_CIRCULO)
        IF SELF.Run(2,SelectRecord) = RequestCompleted
          PAG1:IDCIRCULO = CIR:IDCIRCULO
        ELSE
          SELECT(?PAG1:IDCIRCULO)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
      IF Access:PAGOSXCIRCULO.TryValidateField(2)          ! Attempt to validate PAG1:IDCIRCULO in PAGOSXCIRCULO
        SELECT(?PAG1:IDCIRCULO)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?PAG1:IDCIRCULO
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?PAG1:IDCIRCULO{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
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
!!! Browse the PAGOSXCIRCULO File
!!! </summary>
ABMPAGOSXCIRCULO PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(PAGOSXCIRCULO)
                       PROJECT(PAG1:IDSOCIO)
                       PROJECT(PAG1:IDCIRCULO)
                       JOIN(SOC:PK_SOCIOS,PAG1:IDSOCIO)
                         PROJECT(SOC:MATRICULA)
                         PROJECT(SOC:NOMBRE)
                         PROJECT(SOC:IDSOCIO)
                       END
                       JOIN(CIR:PK_CIRCULO,PAG1:IDCIRCULO)
                         PROJECT(CIR:DESCRIPCION)
                         PROJECT(CIR:IDCIRCULO)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
PAG1:IDSOCIO           LIKE(PAG1:IDSOCIO)             !List box control field - type derived from field
SOC:MATRICULA          LIKE(SOC:MATRICULA)            !List box control field - type derived from field
SOC:NOMBRE             LIKE(SOC:NOMBRE)               !List box control field - type derived from field
PAG1:IDCIRCULO         LIKE(PAG1:IDCIRCULO)           !List box control field - type derived from field
CIR:DESCRIPCION        LIKE(CIR:DESCRIPCION)          !List box control field - type derived from field
SOC:IDSOCIO            LIKE(SOC:IDSOCIO)              !Related join file key field - type derived from field
CIR:IDCIRCULO          LIKE(CIR:IDCIRCULO)            !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Browse the PAGOS X  DISTRITO '),AT(,,421,208),FONT('MS Sans Serif',8,,FONT:regular), |
  RESIZE,CENTER,GRAY,IMM,MDI,HLP('ABMPAGOSXCIRCULO'),SYSTEM
                       LIST,AT(8,40,406,124),USE(?Browse:1),HVSCROLL,FORMAT('[39L(2)|M~IDSOCIO~C(0)@n-7@47L(2)' & |
  '|M~MATRICULA~C(0)@n-7@120L(2)|M~NOMBRE~C(0)@s30@](212)|M~COLEGIADO~[21L(2)|M~IDC~C(0' & |
  ')@n-3@200L(2)|M~DESCRIPCION~C(0)@s50@]|M~DESTRITO~'),FROM(Queue:Browse:1),IMM,MSG('Administra' & |
  'dor de PAGOSXCIRCULO'),VCR
                       BUTTON('&Ver'),AT(205,167,49,14),USE(?View:2),LEFT,ICON('v.ico'),CURSOR('mano.cur'),FLAT,MSG('Visualizar'), |
  TIP('Visualizar')
                       BUTTON('&Agregar'),AT(259,167,49,14),USE(?Insert:3),LEFT,ICON('a.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Agrega Registro'),TIP('Agrega Registro')
                       BUTTON('&Cambiar'),AT(311,167,49,14),USE(?Change:3),LEFT,ICON('c.ico'),CURSOR('mano.cur'), |
  DEFAULT,FLAT,MSG('Cambia Registro'),TIP('Cambia Registro')
                       BUTTON('&Borrar'),AT(365,167,49,14),USE(?Delete:3),LEFT,ICON('b.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Borra Registro'),TIP('Borra Registro')
                       BUTTON('E&xportar'),AT(7,190,52,15),USE(?EvoExportar),LEFT,ICON('export.ico'),FLAT
                       SHEET,AT(4,4,415,182),USE(?CurrentTab)
                         TAB('PAGOS X DISTRITO'),USE(?Tab:2)
                         END
                         TAB('SOCIO'),USE(?Tab:3)
                           PROMPT('IDSOCIO:'),AT(8,25),USE(?PAG1:IDSOCIO:Prompt)
                           ENTRY(@n-14),AT(58,24,60,10),USE(PAG1:IDSOCIO),RIGHT(1)
                           BUTTON('...'),AT(117,22,12,12),USE(?CallLookup:2)
                         END
                         TAB('DISTRITO'),USE(?Tab:4)
                           PROMPT('ID DISTRITO:'),AT(8,25),USE(?PAG1:IDCIRCULO:Prompt)
                           ENTRY(@n-14),AT(57,24,60,10),USE(PAG1:IDCIRCULO),RIGHT(1)
                           BUTTON('...'),AT(119,23,12,12),USE(?CallLookup)
                         END
                       END
                       BUTTON('&Salir'),AT(360,190,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Salir'),TIP('Salir')
                       BUTTON('&Filtro'),AT(9,167,49,14),USE(?Query),LEFT,ICON('q.ico'),FLAT
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
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::Sort1:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 2
BRW1::Sort2:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 3
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
  Q8:FieldPar  = '1,2,3,4,5,'
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
  ADD(QPar8)   ! 29 Gestion025.clw
 !!!!!
 
 
  FREE(QPar28)
       Qp28:F2N  = 'IDSOCIO'
  Qp28:F2P  = '@n-7'
  Qp28:F2T  = '0'
  ADD(QPar28)
       Qp28:F2N  = 'MATRICULA'
  Qp28:F2P  = '@n-7'
  Qp28:F2T  = '0'
  ADD(QPar28)
       Qp28:F2N  = 'NOMBRE'
  Qp28:F2P  = '@s30'
  Qp28:F2T  = '0'
  ADD(QPar28)
       Qp28:F2N  = 'IDC'
  Qp28:F2P  = '@n-3'
  Qp28:F2T  = '0'
  ADD(QPar28)
       Qp28:F2N  = 'DESCRIPCION'
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
  Loc::Titulo8 ='Administrator the PAGOSXCIRCULO'
 
 SavPath8 = PATH()
  Exportar(Loc::QHlist8,BRW1.Q,QPar8,0,Loc::Titulo8,Evo::Group8)
 IF Not EC::LoadI_8 Then  BRW1.FileLoaded=false.
 SETPATH(SavPath8)
 !!!! Fin Routina Templates Clarion

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('ABMPAGOSXCIRCULO')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('SOC:IDSOCIO',SOC:IDSOCIO)                          ! Added by: BrowseBox(ABC)
  BIND('CIR:IDCIRCULO',CIR:IDCIRCULO)                      ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:PAGOSXCIRCULO.Open                                ! File PAGOSXCIRCULO used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:PAGOSXCIRCULO,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  QBE7.Init(QBV7, INIMgr,'ABMPAGOSXCIRCULO', GlobalErrors)
  QBE7.QkSupport = True
  QBE7.QkMenuIcon = 'QkQBE.ico'
  QBE7.QkIcon = 'QkLoad.ico'
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,PAG1:FK_PAGOSXCIRCULO_SOCIO)          ! Add the sort order for PAG1:FK_PAGOSXCIRCULO_SOCIO for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,PAG1:IDSOCIO,,BRW1)            ! Initialize the browse locator using  using key: PAG1:FK_PAGOSXCIRCULO_SOCIO , PAG1:IDSOCIO
  BRW1.AddSortOrder(,PAG1:FK_PAGOSXCIRCULO_CIRCULO)        ! Add the sort order for PAG1:FK_PAGOSXCIRCULO_CIRCULO for sort order 2
  BRW1.AddLocator(BRW1::Sort2:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort2:Locator.Init(,PAG1:IDCIRCULO,,BRW1)          ! Initialize the browse locator using  using key: PAG1:FK_PAGOSXCIRCULO_CIRCULO , PAG1:IDCIRCULO
  BRW1.AddSortOrder(,PAG1:PK_PAGOSXCIRCULO)                ! Add the sort order for PAG1:PK_PAGOSXCIRCULO for sort order 3
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 3
  BRW1::Sort0:Locator.Init(,PAG1:IDSOCIO,,BRW1)            ! Initialize the browse locator using  using key: PAG1:PK_PAGOSXCIRCULO , PAG1:IDSOCIO
  BRW1.AddField(PAG1:IDSOCIO,BRW1.Q.PAG1:IDSOCIO)          ! Field PAG1:IDSOCIO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:MATRICULA,BRW1.Q.SOC:MATRICULA)        ! Field SOC:MATRICULA is a hot field or requires assignment from browse
  BRW1.AddField(SOC:NOMBRE,BRW1.Q.SOC:NOMBRE)              ! Field SOC:NOMBRE is a hot field or requires assignment from browse
  BRW1.AddField(PAG1:IDCIRCULO,BRW1.Q.PAG1:IDCIRCULO)      ! Field PAG1:IDCIRCULO is a hot field or requires assignment from browse
  BRW1.AddField(CIR:DESCRIPCION,BRW1.Q.CIR:DESCRIPCION)    ! Field CIR:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(SOC:IDSOCIO,BRW1.Q.SOC:IDSOCIO)            ! Field SOC:IDSOCIO is a hot field or requires assignment from browse
  BRW1.AddField(CIR:IDCIRCULO,BRW1.Q.CIR:IDCIRCULO)        ! Field CIR:IDCIRCULO is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('ABMPAGOSXCIRCULO',QuickWindow)             ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.QueryControl = ?Query
  BRW1.UpdateQuery(QBE7,1)
  BRW1.AskProcedure = 3                                    ! Will call: UpdatePAGOSXCIRCULO
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
    Relate:PAGOSXCIRCULO.Close
  END
  IF SELF.Opened
    INIMgr.Update('ABMPAGOSXCIRCULO',QuickWindow)          ! Save window data to non-volatile store
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
      SelectCIRCULO
      UpdatePAGOSXCIRCULO
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
    OF ?EvoExportar
      ThisWindow.Update()
       Do PrintExBrowse8
    OF ?PAG1:IDSOCIO
      PAG1:IDSOCIO = PAG1:IDSOCIO
      IF Access:PAGOSXCIRCULO.TryFetch(PAG1:FK_PAGOSXCIRCULO_SOCIO)
        IF SELF.Run(1,SelectRecord) = RequestCompleted
          PAG1:IDSOCIO = PAG1:IDSOCIO
        ELSE
          SELECT(?PAG1:IDSOCIO)
          CYCLE
        END
      END
      ThisWindow.Reset()
    OF ?CallLookup:2
      ThisWindow.Update()
      PAG1:IDSOCIO = PAG1:IDSOCIO
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        PAG1:IDSOCIO = PAG1:IDSOCIO
      END
      ThisWindow.Reset(1)
    OF ?PAG1:IDCIRCULO
      PAG1:IDCIRCULO = PAG1:IDCIRCULO
      IF Access:PAGOSXCIRCULO.TryFetch(PAG1:FK_PAGOSXCIRCULO_CIRCULO)
        IF SELF.Run(2,SelectRecord) = RequestCompleted
          PAG1:IDCIRCULO = PAG1:IDCIRCULO
        ELSE
          SELECT(?PAG1:IDCIRCULO)
          CYCLE
        END
      END
      ThisWindow.Reset()
    OF ?CallLookup
      ThisWindow.Update()
      PAG1:IDCIRCULO = PAG1:IDCIRCULO
      IF SELF.Run(2,SelectRecord) = RequestCompleted
        PAG1:IDCIRCULO = PAG1:IDCIRCULO
      END
      ThisWindow.Reset(1)
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


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Report
!!! Recibo de Pago 
!!! </summary>
IMPRIMIR_PAGO PROCEDURE 

Progress:Thermometer BYTE                                  ! 
L:NroReg             LONG                                  ! 
LOC:LETRAS           STRING(100)                           ! 
Process:View         VIEW(PAGOS)
                       PROJECT(PAG:FECHA)
                       PROJECT(PAG:IDPAGOS)
                       PROJECT(PAG:IDRECIBO)
                       PROJECT(PAG:MONTO)
                       PROJECT(PAG:IDSUBCUENTA)
                       PROJECT(PAG:IDSOCIO)
                       PROJECT(PAG:IDFACTURA)
                       JOIN(SUB:INTEG_113,PAG:IDSUBCUENTA)
                       END
                       JOIN(SOC:PK_SOCIOS,PAG:IDSOCIO)
                         PROJECT(SOC:CUIT)
                         PROJECT(SOC:DIRECCION)
                         PROJECT(SOC:NOMBRE)
                         PROJECT(SOC:TIPOIVA)
                         JOIN(TIP7:PK_TIPO_IVA,SOC:TIPOIVA)
                           PROJECT(TIP7:DECRIPCION)
                         END
                       END
                       JOIN(FAC:PK_FACTURA,PAG:IDFACTURA)
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
                         STRING('Fecha:'),AT(127,17),USE(?String22),FONT(,12),TRN
                         STRING(@d17),AT(141,17),USE(PAG:FECHA),FONT(,12),RIGHT(1)
                         STRING('Señor/es:'),AT(1,44),USE(?String14),TRN
                         STRING(@s30),AT(23,43,86,6),USE(SOC:NOMBRE)
                         STRING('Domicilio:'),AT(1,50),USE(?String16),TRN
                         STRING(@s100),AT(24,49,85,6),USE(SOC:DIRECCION)
                         TEXT,AT(14,69,162,34),USE(GLO:DETALLE_RECIBO),FONT('Arial',8,,FONT:regular,CHARSET:ANSI)
                         STRING(@n-10.2),AT(147,120),USE(PAG:MONTO,,?PAG:MONTO:2),FONT(,12,,FONT:bold)
                         STRING('Fecha:'),AT(121,161),USE(?String37),FONT(,12),TRN
                         STRING(@d17),AT(137,161),USE(PAG:FECHA,,?ING:FECHA:2),FONT(,12)
                         STRING('Señor/es:'),AT(1,182),USE(?String26),TRN
                         STRING(@s30),AT(20,182,71,6),USE(SOC:NOMBRE,,?SOC:NOMBRE:2)
                         STRING('Domicilio:'),AT(1,188),USE(?String27),TRN
                         STRING(@s100),AT(23,187,88,6),USE(SOC:DIRECCION,,?SOC:DIRECCION:2)
                         TEXT,AT(14,218,166,23),USE(GLO:DETALLE_RECIBO,,?GLO:DETALLE_RECIBO:2),FONT('Arial',8,,FONT:regular, |
  CHARSET:ANSI)
                         STRING('SON $:'),AT(119,255),USE(?String25),FONT(,12),TRN
                         STRING(@n-10.2),AT(135,255),USE(PAG:MONTO,,?PAG:MONTO:4),FONT(,12,,FONT:bold),LEFT(1)
                         STRING('Res. Carg. '),AT(1,269),USE(?String36),FONT(,8),TRN
                         STRING(@n-14),AT(15,269),USE(PAG:IDRECIBO),FONT(,8),TRN
                         STRING('SON $:'),AT(130,120),USE(?String19),FONT(,12),TRN
                         STRING('CUIT:'),AT(112,44),USE(?STRING1)
                         STRING('IVA:<0DH,0AH>'),AT(114,50,10,5),USE(?STRING2)
                         STRING(@s30),AT(125,50,57),USE(TIP7:DECRIPCION)
                         STRING(@P##-########-#P),AT(126,44),USE(SOC:CUIT)
                         STRING('CUIT:'),AT(118,182),USE(?STRING3)
                         STRING('IVA:<0DH,0AH>'),AT(118,188),USE(?STRING4)
                         STRING(@P##-########-#P),AT(129,182),USE(SOC:CUIT,,?SOC:CUIT:2)
                         STRING(@s30),AT(127,188,53),USE(TIP7:DECRIPCION,,?TIP7:DECRIPCION:2)
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
  GlobalErrors.SetProcedureName('IMPRIMIR_PAGO')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:PAGOS.Open                                        ! File PAGOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('IMPRIMIR_PAGO',ProgressWindow)             ! Restore window settings from non-volatile store
  TargetSelector.AddItem(XMLReporter.IReportGenerator)
  TargetSelector.AddItem(HTMLReporter.IReportGenerator)
  TargetSelector.AddItem(PDFReporter.IReportGenerator)
  TargetSelector.AddItem(TXTReporter.IReportGenerator)
  SELF.AddItem(TargetSelector)
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisReport.Init(Process:View, Relate:PAGOS, ?Progress:PctText, Progress:Thermometer, ProgressMgr, PAG:IDPAGOS)
  ThisReport.AddSortOrder(PAG:PK_PAGOS)
  ThisReport.AddRange(PAG:IDPAGOS,GLO:PAGO)
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:PAGOS.SetQuickScan(1,Propagate:OneMany)
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
    Relate:PAGOS.Close
  END
  IF SELF.Opened
    INIMgr.Update('IMPRIMIR_PAGO',ProgressWindow)          ! Save window data to non-volatile store
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
  SELF.Attribute.Set(?PAG:FECHA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PAG:FECHA,RepGen:XML,TargetAttr:TagName,'PAG:FECHA')
  SELF.Attribute.Set(?PAG:FECHA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String14,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String14,RepGen:XML,TargetAttr:TagName,'String14')
  SELF.Attribute.Set(?String14,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagName,'SOC:NOMBRE')
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String16,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String16,RepGen:XML,TargetAttr:TagName,'String16')
  SELF.Attribute.Set(?String16,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:DIRECCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:DIRECCION,RepGen:XML,TargetAttr:TagName,'SOC:DIRECCION')
  SELF.Attribute.Set(?SOC:DIRECCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?GLO:DETALLE_RECIBO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GLO:DETALLE_RECIBO,RepGen:XML,TargetAttr:TagName,'GLO:DETALLE_RECIBO')
  SELF.Attribute.Set(?GLO:DETALLE_RECIBO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PAG:MONTO:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PAG:MONTO:2,RepGen:XML,TargetAttr:TagName,'PAG:MONTO:2')
  SELF.Attribute.Set(?PAG:MONTO:2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String37,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String37,RepGen:XML,TargetAttr:TagName,'String37')
  SELF.Attribute.Set(?String37,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?ING:FECHA:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ING:FECHA:2,RepGen:XML,TargetAttr:TagName,'ING:FECHA:2')
  SELF.Attribute.Set(?ING:FECHA:2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String26,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String26,RepGen:XML,TargetAttr:TagName,'String26')
  SELF.Attribute.Set(?String26,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:NOMBRE:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:NOMBRE:2,RepGen:XML,TargetAttr:TagName,'SOC:NOMBRE:2')
  SELF.Attribute.Set(?SOC:NOMBRE:2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String27,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String27,RepGen:XML,TargetAttr:TagName,'String27')
  SELF.Attribute.Set(?String27,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:DIRECCION:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:DIRECCION:2,RepGen:XML,TargetAttr:TagName,'SOC:DIRECCION:2')
  SELF.Attribute.Set(?SOC:DIRECCION:2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?GLO:DETALLE_RECIBO:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GLO:DETALLE_RECIBO:2,RepGen:XML,TargetAttr:TagName,'GLO:DETALLE_RECIBO:2')
  SELF.Attribute.Set(?GLO:DETALLE_RECIBO:2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String25,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String25,RepGen:XML,TargetAttr:TagName,'String25')
  SELF.Attribute.Set(?String25,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PAG:MONTO:4,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PAG:MONTO:4,RepGen:XML,TargetAttr:TagName,'PAG:MONTO:4')
  SELF.Attribute.Set(?PAG:MONTO:4,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String36,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String36,RepGen:XML,TargetAttr:TagName,'String36')
  SELF.Attribute.Set(?String36,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PAG:IDRECIBO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PAG:IDRECIBO,RepGen:XML,TargetAttr:TagName,'PAG:IDRECIBO')
  SELF.Attribute.Set(?PAG:IDRECIBO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String19,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String19,RepGen:XML,TargetAttr:TagName,'String19')
  SELF.Attribute.Set(?String19,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?STRING1,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?STRING1,RepGen:XML,TargetAttr:TagName,'STRING1')
  SELF.Attribute.Set(?STRING1,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?STRING2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?STRING2,RepGen:XML,TargetAttr:TagName,'STRING2')
  SELF.Attribute.Set(?STRING2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?TIP7:DECRIPCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?TIP7:DECRIPCION,RepGen:XML,TargetAttr:TagName,'TIP7:DECRIPCION')
  SELF.Attribute.Set(?TIP7:DECRIPCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:CUIT,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:CUIT,RepGen:XML,TargetAttr:TagName,'SOC:CUIT')
  SELF.Attribute.Set(?SOC:CUIT,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?STRING3,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?STRING3,RepGen:XML,TargetAttr:TagName,'STRING3')
  SELF.Attribute.Set(?STRING3,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?STRING4,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?STRING4,RepGen:XML,TargetAttr:TagName,'STRING4')
  SELF.Attribute.Set(?STRING4,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:CUIT:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:CUIT:2,RepGen:XML,TargetAttr:TagName,'SOC:CUIT:2')
  SELF.Attribute.Set(?SOC:CUIT:2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?TIP7:DECRIPCION:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?TIP7:DECRIPCION:2,RepGen:XML,TargetAttr:TagName,'TIP7:DECRIPCION:2')
  SELF.Attribute.Set(?TIP7:DECRIPCION:2,RepGen:XML,TargetAttr:TagValueFromText,True)


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  LOC:LETRAS =PKSNumTexto(PAG:MONTO)
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
!!! Actualizacion PAGOS
!!! </summary>
UpdatePAGOS1 PROCEDURE 

!--------------------------------------------------------------------------
! Tagging Data
!--------------------------------------------------------------------------
DASBRW::11:TAGFLAG         BYTE(0)
DASBRW::11:TAGMOUSE        BYTE(0)
DASBRW::11:TAGDISPSTATUS   BYTE(0)
DASBRW::11:QUEUE          QUEUE
PUNTERO                       LIKE(PUNTERO)
                          END
!--------------------------------------------------------------------------
! Tagging Data
!--------------------------------------------------------------------------
CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
T                    STRING(1)                             ! 
BRW10::View:Browse   VIEW(FACTURA)
                       PROJECT(FAC:MES)
                       PROJECT(FAC:ANO)
                       PROJECT(FAC:TOTAL)
                       PROJECT(FAC:DESCUENTOCOBERTURA)
                       PROJECT(FAC:INTERES)
                       PROJECT(FAC:ESTADO)
                       PROJECT(FAC:IDFACTURA)
                       PROJECT(FAC:IDSOCIO)
                     END
Queue:Browse         QUEUE                            !Queue declaration for browse/combo box using ?List
T                      LIKE(T)                        !List box control field - type derived from local data
FAC:MES                LIKE(FAC:MES)                  !List box control field - type derived from field
FAC:ANO                LIKE(FAC:ANO)                  !List box control field - type derived from field
FAC:TOTAL              LIKE(FAC:TOTAL)                !List box control field - type derived from field
FAC:DESCUENTOCOBERTURA LIKE(FAC:DESCUENTOCOBERTURA)   !List box control field - type derived from field
FAC:INTERES            LIKE(FAC:INTERES)              !List box control field - type derived from field
FAC:ESTADO             LIKE(FAC:ESTADO)               !List box control field - type derived from field
FAC:IDFACTURA          LIKE(FAC:IDFACTURA)            !List box control field - type derived from field
FAC:IDSOCIO            LIKE(FAC:IDSOCIO)              !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
History::PAG:Record  LIKE(PAG:RECORD),THREAD
QuickWindow          WINDOW('Cargar Pagos'),AT(,,273,274),FONT('Arial',8,,FONT:regular),RESIZE,CENTER,GRAY,IMM, |
  MDI,HLP('UpdatePAGOS'),SYSTEM
                       PROMPT('IDSOCIO:'),AT(1,3),USE(?PAG:IDSOCIO:Prompt),TRN
                       ENTRY(@n-14),AT(35,3,43,10),USE(PAG:IDSOCIO)
                       BUTTON('...'),AT(81,2,12,12),USE(?CallLookup)
                       STRING(@s30),AT(96,3),USE(SOC:NOMBRE)
                       PROMPT('Matri.:'),AT(221,3),USE(?Prompt5)
                       STRING(@n-7),AT(243,3),USE(SOC:MATRICULA)
                       ENTRY(@n-14),AT(35,16,26,10),USE(PAG:SUCURSAL)
                       PROMPT('IDRECIBO:'),AT(1,17),USE(?PAG:IDRECIBO:Prompt),TRN
                       ENTRY(@n-14),AT(67,16,43,10),USE(PAG:IDRECIBO),REQ
                       CHECK('AFECTADA'),AT(118,17),USE(PAG:AFECTADA),VALUE('SI','NO')
                       BUTTON('Habilitar Selección'),AT(66,36,141,13),USE(?Button11)
                       GROUP('Elegir Cuotas Pagadas'),AT(1,52,265,135),USE(?Group1),BOXED,DISABLE
                         LIST,AT(7,60,255,100),USE(?List),HVSCROLL,FORMAT('17R|M~T~L(2)@s1@22L|M~MES~L(2)@n-3@22' & |
  'L|M~ANO~L(2)@n-5@40L|M~TOTAL~L(2)@n$-10.2@53L(1)|M~DESCUENTO~L(2)@n$-10.2@40L|M~INTE' & |
  'RES~L(2)@n$-10.2@84L|M~ESTADO~L(2)@s21@56L|M~IDFACTURA~L(2)@n-14@56L|M~IDSOCIO~L(2)@n-14@'), |
  FROM(Queue:Browse),IMM,MSG('Browsing Records'),VCR
                         BUTTON('&Marcar'),AT(7,164,32,13),USE(?DASTAG)
                         BUTTON('Todo'),AT(59,164,45,13),USE(?DASTAGAll)
                         BUTTON('Desm Todo'),AT(124,164,50,13),USE(?DASUNTAGALL)
                         BUTTON('&Rev tags'),AT(27,178,50,13),USE(?DASREVTAG),DISABLE,HIDE
                         BUTTON('Solo Marcado'),AT(194,164,70,13),USE(?DASSHOWTAG)
                       END
                       LINE,AT(1,205,270,0),USE(?Line1),COLOR(COLOR:Black)
                       PROMPT('Monto a Afectar: '),AT(43,211),USE(?Prompt4),FONT(,11,,FONT:bold)
                       STRING(@n$-10.2),AT(128,211),USE(GLO:MONTO),FONT('Arial',11,COLOR:Red,FONT:bold,CHARSET:ANSI)
                       PROMPT('Forma Pago:'),AT(13,229),USE(?PAG:IDSUBCUENTA:Prompt)
                       ENTRY(@n-14),AT(55,229,43,10),USE(PAG:IDSUBCUENTA)
                       BUTTON('...'),AT(103,228,12,12),USE(?CallLookup:2)
                       STRING(@s50),AT(119,229),USE(SUB:DESCRIPCION)
                       LINE,AT(1,249,267,0),USE(?Line2),COLOR(COLOR:Black)
                       BUTTON('Calculo Monto'),AT(81,189,115,13),USE(?Button12),DISABLE
                       BUTTON('&Aceptar'),AT(68,255,53,14),USE(?OK),LEFT,ICON('ok.ico'),CURSOR('mano.cur'),DEFAULT, |
  DISABLE,FLAT,HIDE,MSG('Confirma y Actualiza el Formulario'),TIP('Confirma y Actualiza' & |
  ' el Formulario')
                       BUTTON('&Cancelar'),AT(141,255,62,14),USE(?Cancel),LEFT,ICON('cancelar.ico'),CURSOR('mano.cur'), |
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
TakeFieldEvent         PROCEDURE(),BYTE,PROC,DERIVED
TakeNewSelection       PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
ToolbarForm          ToolbarUpdateClass                    ! Form Toolbar Manager
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

BRW10                CLASS(BrowseClass)                    ! Browse using ?List
Q                      &Queue:Browse                  !Reference to browse queue
SetQueueRecord         PROCEDURE(),DERIVED
TakeKey                PROCEDURE(),BYTE,PROC,DERIVED
ValidateRecord         PROCEDURE(),BYTE,DERIVED
                     END

BRW10::Sort0:Locator StepLocatorClass                      ! Default Locator
CurCtrlFeq          LONG
FieldColorQueue     QUEUE
Feq                   LONG
OldColor              LONG
                    END

  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!--------------------------------------------------------------------------
! DAS_Tagging
!--------------------------------------------------------------------------
DASBRW::11:DASTAGONOFF Routine
  GET(Queue:Browse,CHOICE(?List))
  BRW10.UpdateBuffer
   TAGS.PUNTERO = FAC:IDFACTURA
   GET(TAGS,TAGS.PUNTERO)
  IF ERRORCODE()
     TAGS.PUNTERO = FAC:IDFACTURA
     ADD(TAGS,TAGS.PUNTERO)
    T = '*'
  ELSE
    DELETE(TAGS)
    T = ''
  END
    Queue:Browse.T = T
  PUT(Queue:Browse)
  ThisWindow.Reset(1)
  SELECT(?List,CHOICE(?List))
  IF DASBRW::11:TAGMOUSE = 1 THEN
    DASBRW::11:TAGMOUSE = 0
  ELSE
  DASBRW::11:TAGFLAG = 1
  POST(EVENT:ScrollDown,?List)
  END
DASBRW::11:DASTAGALL Routine
  ?List{PROPLIST:MouseDownField} = 2
  SETCURSOR(CURSOR:Wait)
  BRW10.Reset
  FREE(TAGS)
  LOOP
    NEXT(BRW10::View:Browse)
    IF ERRORCODE()
      BREAK
    END
     TAGS.PUNTERO = FAC:IDFACTURA
     ADD(TAGS,TAGS.PUNTERO)
  END
  SETCURSOR
  BRW10.ResetSort(1)
  ThisWindow.Reset(1)
  SELECT(?List,CHOICE(?List))
DASBRW::11:DASUNTAGALL Routine
  ?List{PROPLIST:MouseDownField} = 2
  SETCURSOR(CURSOR:Wait)
  FREE(TAGS)
  BRW10.Reset
  SETCURSOR
  BRW10.ResetSort(1)
  ThisWindow.Reset(1)
  SELECT(?List,CHOICE(?List))
DASBRW::11:DASREVTAGALL Routine
  ?List{PROPLIST:MouseDownField} = 2
  SETCURSOR(CURSOR:Wait)
  FREE(DASBRW::11:QUEUE)
  LOOP QR# = 1 TO RECORDS(TAGS)
    GET(TAGS,QR#)
    DASBRW::11:QUEUE = TAGS
    ADD(DASBRW::11:QUEUE)
  END
  FREE(TAGS)
  BRW10.Reset
  LOOP
    NEXT(BRW10::View:Browse)
    IF ERRORCODE()
      BREAK
    END
     DASBRW::11:QUEUE.PUNTERO = FAC:IDFACTURA
     GET(DASBRW::11:QUEUE,DASBRW::11:QUEUE.PUNTERO)
    IF ERRORCODE()
       TAGS.PUNTERO = FAC:IDFACTURA
       ADD(TAGS,TAGS.PUNTERO)
    END
  END
  SETCURSOR
  BRW10.ResetSort(1)
  ThisWindow.Reset(1)
  SELECT(?List,CHOICE(?List))
DASBRW::11:DASSHOWTAG Routine
   CASE DASBRW::11:TAGDISPSTATUS
   OF 0
      DASBRW::11:TAGDISPSTATUS = 1    ! display tagged
      ?DASSHOWTAG{PROP:Text} = 'Showing Tagged'
      ?DASSHOWTAG{PROP:Msg}  = 'Showing Tagged'
      ?DASSHOWTAG{PROP:Tip}  = 'Showing Tagged'
   OF 1
      DASBRW::11:TAGDISPSTATUS = 2    ! display untagged
      ?DASSHOWTAG{PROP:Text} = 'Showing UnTagged'
      ?DASSHOWTAG{PROP:Msg}  = 'Showing UnTagged'
      ?DASSHOWTAG{PROP:Tip}  = 'Showing UnTagged'
   OF 2
      DASBRW::11:TAGDISPSTATUS = 0    ! display all
      ?DASSHOWTAG{PROP:Text} = 'Show All'
      ?DASSHOWTAG{PROP:Msg}  = 'Show All'
      ?DASSHOWTAG{PROP:Tip}  = 'Show All'
   END
   DISPLAY(?DASSHOWTAG{PROP:Text})
   BRW10.ResetSort(1)
   SELECT(?List,CHOICE(?List))
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
  GlobalErrors.SetProcedureName('UpdatePAGOS1')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?PAG:IDSOCIO:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('T',T)                                              ! Added by: BrowseBox(ABC)
  BIND('FAC:IDFACTURA',FAC:IDFACTURA)                      ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(PAG:Record,History::PAG:Record)
  SELF.AddHistoryField(?PAG:IDSOCIO,2)
  SELF.AddHistoryField(?PAG:SUCURSAL,3)
  SELF.AddHistoryField(?PAG:IDRECIBO,12)
  SELF.AddHistoryField(?PAG:AFECTADA,16)
  SELF.AddHistoryField(?PAG:IDSUBCUENTA,15)
  SELF.AddUpdateFile(Access:PAGOS)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:CAJA.Open                                         ! File CAJA used by this procedure, so make sure it's RelationManager is open
  Relate:CUENTAS.Open                                      ! File CUENTAS used by this procedure, so make sure it's RelationManager is open
  Relate:DETALLE_FACTURA.Open                              ! File DETALLE_FACTURA used by this procedure, so make sure it's RelationManager is open
  Relate:FACTURA.Open                                      ! File FACTURA used by this procedure, so make sure it's RelationManager is open
  Relate:FONDOS.Open                                       ! File FONDOS used by this procedure, so make sure it's RelationManager is open
  Relate:INFORME.Open                                      ! File INFORME used by this procedure, so make sure it's RelationManager is open
  Relate:INGRESOS.Open                                     ! File INGRESOS used by this procedure, so make sure it's RelationManager is open
  Relate:LIBDIARIO.Open                                    ! File LIBDIARIO used by this procedure, so make sure it's RelationManager is open
  Relate:PAGOS.Open                                        ! File PAGOS used by this procedure, so make sure it's RelationManager is open
  Relate:RANKING.Open                                      ! File RANKING used by this procedure, so make sure it's RelationManager is open
  Relate:SOCIOS.Open                                       ! File SOCIOS used by this procedure, so make sure it's RelationManager is open
  Relate:SUBCUENTAS.Open                                   ! File SUBCUENTAS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:PAGOS
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
  BRW10.Init(?List,Queue:Browse.ViewPosition,BRW10::View:Browse,Queue:Browse,Relate:FACTURA,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    ?PAG:IDSOCIO{PROP:ReadOnly} = True
    DISABLE(?CallLookup)
    ?PAG:SUCURSAL{PROP:ReadOnly} = True
    ?PAG:IDRECIBO{PROP:ReadOnly} = True
    DISABLE(?Button11)
    DISABLE(?DASTAG)
    DISABLE(?DASTAGAll)
    DISABLE(?DASUNTAGALL)
    DISABLE(?DASREVTAG)
    DISABLE(?DASSHOWTAG)
    ?PAG:IDSUBCUENTA{PROP:ReadOnly} = True
    DISABLE(?CallLookup:2)
    DISABLE(?Button12)
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  BRW10.Q &= Queue:Browse
  BRW10.RetainRow = 0
  BRW10.AddSortOrder(,FAC:FK_FACTURA_SOCIO)                ! Add the sort order for FAC:FK_FACTURA_SOCIO for sort order 1
  BRW10.AddRange(FAC:IDSOCIO,GLO:IDSOCIO)                  ! Add single value range limit for sort order 1
  BRW10.AddLocator(BRW10::Sort0:Locator)                   ! Browse has a locator for sort order 1
  BRW10::Sort0:Locator.Init(,FAC:IDSOCIO,,BRW10)           ! Initialize the browse locator using  using key: FAC:FK_FACTURA_SOCIO , FAC:IDSOCIO
  BRW10.AppendOrder('FAC:PERIODO')                         ! Append an additional sort order
  BRW10.SetFilter('(fac:estado = '''')')                   ! Apply filter expression to browse
  BRW10.AddField(T,BRW10.Q.T)                              ! Field T is a hot field or requires assignment from browse
  BRW10.AddField(FAC:MES,BRW10.Q.FAC:MES)                  ! Field FAC:MES is a hot field or requires assignment from browse
  BRW10.AddField(FAC:ANO,BRW10.Q.FAC:ANO)                  ! Field FAC:ANO is a hot field or requires assignment from browse
  BRW10.AddField(FAC:TOTAL,BRW10.Q.FAC:TOTAL)              ! Field FAC:TOTAL is a hot field or requires assignment from browse
  BRW10.AddField(FAC:DESCUENTOCOBERTURA,BRW10.Q.FAC:DESCUENTOCOBERTURA) ! Field FAC:DESCUENTOCOBERTURA is a hot field or requires assignment from browse
  BRW10.AddField(FAC:INTERES,BRW10.Q.FAC:INTERES)          ! Field FAC:INTERES is a hot field or requires assignment from browse
  BRW10.AddField(FAC:ESTADO,BRW10.Q.FAC:ESTADO)            ! Field FAC:ESTADO is a hot field or requires assignment from browse
  BRW10.AddField(FAC:IDFACTURA,BRW10.Q.FAC:IDFACTURA)      ! Field FAC:IDFACTURA is a hot field or requires assignment from browse
  BRW10.AddField(FAC:IDSOCIO,BRW10.Q.FAC:IDSOCIO)          ! Field FAC:IDSOCIO is a hot field or requires assignment from browse
  INIMgr.Fetch('UpdatePAGOS1',QuickWindow)                 ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  SELF.AddItem(ToolbarForm)
  BRW10.AddToolbarTarget(Toolbar)                          ! Browse accepts toolbar control
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
  ?List{Prop:Alrt,239} = SpaceKey
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
    Relate:CAJA.Close
    Relate:CUENTAS.Close
    Relate:DETALLE_FACTURA.Close
    Relate:FACTURA.Close
    Relate:FONDOS.Close
    Relate:INFORME.Close
    Relate:INGRESOS.Close
    Relate:LIBDIARIO.Close
    Relate:PAGOS.Close
    Relate:RANKING.Close
    Relate:SOCIOS.Close
    Relate:SUBCUENTAS.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdatePAGOS1',QuickWindow)              ! Save window data to non-volatile store
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
      SelectSUBCUENTAS_cuotas
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
    OF ?Button11
      GLO:IDSOCIO = SOC:IDSOCIO
      ENABLE(?Group1)
      ENABLE(?Button12)
      THISWINDOW.RESET(1)
    OF ?Button12
      !FREE(CARNET)
      GLO:MONTO = 0
      Loop i# = 1 to records(Tags)
          get(Tags,i#)
          FAC:IDFACTURA = tags:Puntero
          GET(FACTURA,FAC:PK_FACTURA)
          IF ERRORCODE() = 35 THEN
              MESSAGE('NO ENCONTRO FACTURA')
          ELSE
              !!! BUSCA POR PERIODO Y CALCULA INTERESES
              !!! SACO PERIODO MENOS PARA CARGAR INTERES
              MES# = MONTH (TODAY())
              ANO# = YEAR(TODAY())
              PERIODO$  = FORMAT(ANO#,@N04)&FORMAT(MES#,@N02)
              IF FAC:PERIODO >= PERIODO$ THEN
                  GLO:MONTO = GLO:MONTO + (FAC:TOTAL - FAC:DESCUENTOCOBERTURA)
              ELSE
                  GLO:MONTO = GLO:MONTO + FAC:TOTAL
              END
              GLO:IDSOLICITUD = FAC:IDFACTURA
            
          end
      end
      UNHIDE(?OK)
      ENABLE(?OK)
      disable(?Group1)
      disable(?Button11)
      THISWINDOW.RESET(1)
    OF ?OK
      GLO:DETALLE_RECIBO = ''
      PAG:MONTO     =  GLO:MONTO
      PAG:FECHA     =  today()
      PAG:HORA      =  clock()
      PAG:MES       =  MONTH(TODAY())
      PAG:ANO       =  YEAR(TODAY())
      PAG:PERIODO   =  PAG:ANO&(FORMAT(PAG:MES,@N02))
      PAG:IDUSUARIO =  GLO:IDUSUARIO
      PAG:MONTO_FACTURA  =  GLO:TOTAL
      PAG:INTERES_FACTURA = GLO:INTERES
      PAG:IDFACTURA = GLO:IDSOLICITUD
      
      If  Self.Request=ChangeRecord Then
          FAC:IDFACTURA = FACTURA#
          GET (FACTURA,FAC:PK_FACTURA)
          IF ERRORCODE() = 35 THEN
              HALT(0,'OCURRIO UN ERROR COMUNIQUESE CON EL ADMINISTRADOR DEL SISTEMA ')
          ELSE
              FAC:ESTADO = ''
              PUT(FACTURA)
              
          End
      END
      
      !! CONTROLO SI SE CARGO LA AFECTACION DEL PAGO
      IF PAG:AFECTADA = 'SI' THEN
          ING:SUCURSAL = PAG:SUCURSAL
          ING:IDRECIBO = PAG:IDRECIBO
          GET(INGRESOS,ING:IDX_INGRESOS_UNIQUE)
          IF ERRORCODE() = 35 THEN
              MESSAGE('NO SE AFECTO EL RECIBO A NINGUN INGRESO','...No Corresponde la afectación',ICON:EXCLAMATION)
              SELECT(?PAG:SUCURSAL)
              CYCLE
          ELSE
              IF ING:MONTO <> PAG:MONTO THEN
                  MESSAGE('EL MONTO DEL RECIBO EMITIDO NO ES IGUAL AL MONTO TOTAL QUE SE QUIERE EFECTAR',ICON:EXCLAMATION)
                  !HIDE(?OK)
                  !DISABLE(?OK)
                  !ENABLE(?Group1)
                  !ENABLE(?Button11)
                  !SELECT(?Cancel)
                  !CYCLE
                  
              END
          END
      else
          PAG:AFECTADA = 'NO' 
          !!! BUSCA SI EXISTE EL RECIBO
          ING:SUCURSAL = PAG:SUCURSAL
          ING:IDRECIBO = PAG:IDRECIBO
          GET(INGRESOS,ING:IDX_INGRESOS_UNIQUE)
          IF ERRORCODE() <> 35 THEN
              IF (ING:SUCURSAL = PAG:SUCURSAL) AND (ING:IDRECIBO = PAG:IDRECIBO) THEN
                  MESSAGE('EL NRO. DE RECIBO YA SE EMITIO','...No Corresponde la Recibo',ICON:EXCLAMATION)
                  SELECT(?PAG:SUCURSAL)
                  CYCLE
              END
          end
      END
      
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?PAG:IDSOCIO
      SOC:IDSOCIO = PAG:IDSOCIO
      IF Access:SOCIOS.TryFetch(SOC:PK_SOCIOS)
        IF SELF.Run(1,SelectRecord) = RequestCompleted
          PAG:IDSOCIO = SOC:IDSOCIO
        ELSE
          SELECT(?PAG:IDSOCIO)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
      IF Access:PAGOS.TryValidateField(2)                  ! Attempt to validate PAG:IDSOCIO in PAGOS
        SELECT(?PAG:IDSOCIO)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?PAG:IDSOCIO
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?PAG:IDSOCIO{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?CallLookup
      ThisWindow.Update()
      SOC:IDSOCIO = PAG:IDSOCIO
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        PAG:IDSOCIO = SOC:IDSOCIO
      END
      ThisWindow.Reset(1)
    OF ?DASTAG
      ThisWindow.Update()
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
        DO DASBRW::11:DASTAGONOFF
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
    OF ?DASTAGAll
      ThisWindow.Update()
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
        DO DASBRW::11:DASTAGALL
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
    OF ?DASUNTAGALL
      ThisWindow.Update()
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
        DO DASBRW::11:DASUNTAGALL
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
    OF ?DASREVTAG
      ThisWindow.Update()
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
        DO DASBRW::11:DASREVTAGALL
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
    OF ?DASSHOWTAG
      ThisWindow.Update()
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
        DO DASBRW::11:DASSHOWTAG
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
    OF ?PAG:IDSUBCUENTA
      SUB:IDSUBCUENTA = PAG:IDSUBCUENTA
      IF Access:SUBCUENTAS.TryFetch(SUB:INTEG_113)
        IF SELF.Run(2,SelectRecord) = RequestCompleted
          PAG:IDSUBCUENTA = SUB:IDSUBCUENTA
        ELSE
          SELECT(?PAG:IDSUBCUENTA)
          CYCLE
        END
      END
      ThisWindow.Reset()
      IF Access:PAGOS.TryValidateField(15)                 ! Attempt to validate PAG:IDSUBCUENTA in PAGOS
        SELECT(?PAG:IDSUBCUENTA)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?PAG:IDSUBCUENTA
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?PAG:IDSUBCUENTA{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?CallLookup:2
      ThisWindow.Update()
      SUB:IDSUBCUENTA = PAG:IDSUBCUENTA
      IF SELF.Run(2,SelectRecord) = RequestCompleted
        PAG:IDSUBCUENTA = SUB:IDSUBCUENTA
      END
      ThisWindow.Reset(1)
    OF ?OK
      ThisWindow.Update()
      IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing THEN
         POST(EVENT:CloseWindow)
      END
      !!!! MODIFICA EL ESTADO DE LA FACTURA ...
      !GLO:DETALLE_RECIBO  = ''
      CONTADOR# = 0
      CUENTA# = 0
      REPORTE_LARGO = ''
      P1# = 0
      P2# = 0
      Loop i# = 1 to records(Tags)
          get(Tags,i#)
          FAC:IDFACTURA = tags:Puntero
          GET(FACTURA,FAC:PK_FACTURA)
          IF ERRORCODE() = 35 THEN
              MESSAGE('NO ENCONTRO FACTURA')
          ELSE
             FAC:ESTADO = 'PAGADO'
             PUT(FACTURA)
             IF  GLO:DETALLE_RECIBO  = '' OR  CUENTA# = 1  THEN
                 !! BUSCA EN EL DETALLE SI ES UNA CUOTA O POSEE ADEMAS UN CONVENIO
                 DET:IDFACTURA = FAC:IDFACTURA
                 SET(DET:FK_DETALLE_FACTURA,DET:FK_DETALLE_FACTURA)
                 LOOP
                  IF ACCESS:DETALLE_FACTURA.NEXT() THEN BREAK.
                  IF DET:IDFACTURA <> FAC:IDFACTURA THEN BREAK.
                  IF clip(DET:CONCEPTO) = 'CUOTA' THEN
                      CUOTA" = 'C'!&CUOTA"
                  ELSE
                      CUOTA" = 'C/C'!&clip(DET:CONCEPTO)
                  END
                  END !! LOOP
                 
                 GLO:DETALLE_RECIBO = clip(GLO:DETALLE_RECIBO)&''&CLIP(CUOTA")&''&FAC:MES&'-'&FAC:ANO&','
                 CUENTA# = 1
             END
             CONTADOR# = CONTADOR# + 1
             GLO:CUENTA = CONTADOR#
             VL# = FAC:PERIODO
             !!!!!!!!! ORDENA
             IF CONTADOR# = 1 THEN
                  P1# = FAC:PERIODO
                  P2# = FAC:PERIODO
                  DESDE" = FAC:MES&'/'&FAC:ANO
                  HASTA" = FAC:MES&'/'&FAC:ANO
             ELSE
                  IF VL# > P1# THEN
                      IF VL# > P2# THEN
                          P2# = VL#
                          HASTA" = FAC:MES&'/'&FAC:ANO
                      END
                  ELSE
                      IF VL# < P1# THEN
                          P1# = VL#
                          DESDE" = FAC:MES&'/'&FAC:ANO
                      END
                 END
      
      
             END
             CUOTA" = ''
            
         end
      end
      IF GLO:CUENTA  > 0 THEN
            REPORTE_LARGO = CLIP(GLO:DETALLE_RECIBO) ! 'DESDE:'&CLIP(DESDE")&'-HASTA: '&CLIP(HASTA")
      
      ELSE
          REPORTE_LARGO  = CLIP(GLO:DETALLE_RECIBO)  ! 'PAGA CUOTA '&CLIP(HASTA")
      END
      
      !!! DESCUENTA EN SOCIOS
      SOC:IDSOCIO = FAC:IDSOCIO
      GET (SOCIOS,SOC:PK_SOCIOS)
      IF ERRORCODE() = 35 THEN
          MESSAGE ('NO ENCONTRO SOCIO')
      ELSE
          SOC:CANTIDAD = SOC:CANTIDAD - CONTADOR#
          PUT(SOCIOS)
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
      IF PAG:AFECTADA = 'NO' THEN !!! NO SE ASIENTA EN FINANZAS
                !!! CARGO EN LA CAJA
          SUB:IDSUBCUENTA = PAG:IDSUBCUENTA
          ACCESS:SUBCUENTAS.TRYFETCH(SUB:INTEG_113)
          !!! MODIFICA EL FLUJO DE FONDOS
          FON:IDFONDO = SUB:IDFONDO
          ACCESS:FONDOS.TRYFETCH(FON:PK_FONDOS)
          FON:MONTO = FON:MONTO + GLO:MONTO
          FON:FECHA = TODAY()
          FON:HORA = CLOCK()
          ACCESS:FONDOS.UPDATE()
  
          !! BUSCO EL ID PROVEEDOR
          SOC:IDSOCIO = PAG:IDSOCIO
          ACCESS:SOCIOS.TRYFETCH(SOC:PK_SOCIOS)
          IDPROVEEDOR# = SOC:IDPROVEEDOR
          !! CARGO INGRESO
          RANKING{PROP:SQL} = 'DELETE FROM RANKING'
          ING:IDUSUARIO        =   PAG:IDUSUARIO
          ING:IDSUBCUENTA      =   PAG:IDSUBCUENTA
          ING:OBSERVACION      =   'PAGO CUOTA MAT:'&SOC:MATRICULA&', CUOTA: '&FAC:MES&' AÑO: '&FAC:ANO
          ING:MONTO            =   GLO:MONTO
          ING:FECHA            =   PAG:FECHA
          ING:HORA             =   PAG:HORA
          ING:MES              =   PAG:MES
          ING:ANO              =   PAG:ANO
          ING:PERIODO          =   PAG:PERIODO
          ING:IDPROVEEDOR      =   IDPROVEEDOR#
          ING:SUCURSAL         =   PAG:SUCURSAL
          ING:IDRECIBO         =   PAG:IDRECIBO
          !!! CARGA
          RANKING{PROP:SQL} = 'CALL SP_GEN_INGRESOS_ID'
          NEXT(RANKING)
          ING:IDINGRESO = RAN:C1
          !MESSAGE(ING:IDINGRESO)
          ACCESS:INGRESOS.INSERT()
  
          !!!!   CARGA EN CAJA SI SE DE CAJA
          IF SUB:CAJA = 'SI' THEN
              !!! CARGO CAJA
              CAJ:IDSUBCUENTA = SUB:IDSUBCUENTA
              CAJ:IDUSUARIO = GLO:IDUSUARIO
              CAJ:DEBE =  GLO:MONTO
              CAJ:HABER = 0
              CAJ:OBSERVACION = 'PAGO CUOTA SOCIO '&PAG:IDSOCIO
              CAJ:FECHA = TODAY()
              CAJ:MES       =  MONTH(TODAY())
              CAJ:ANO       =  YEAR(TODAY())
              CAJ:PERIODO   =  CAJ:ANO&(FORMAT(CAJ:MES,@N02))
              CAJ:SUCURSAL  =   ING:SUCURSAL
              CAJ:RECIBO    =   ING:IDRECIBO
              CAJ:TIPO      =   'INGRESO'
              CAJ:IDTRANSACCION = ING:IDINGRESO
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
              LIB:IDSUBCUENTA = PAG:IDSUBCUENTA
              LIB:DEBE = GLO:MONTO
              LIB:HABER = 0
              LIB:OBSERVACION = 'PAGO CUOTA SOCIO '&PAG:IDSOCIO
              LIB:FECHA = TODAY()
              LIB:HORA = CLOCK()
              LIB:MES       =  MONTH(TODAY())
              LIB:ANO       =  YEAR(TODAY())
              LIB:PERIODO   =  LIB:ANO&(FORMAT(LIB:MES,@N02))
              LIB:SUCURSAL   =    ING:SUCURSAL
              LIB:RECIBO       =  ING:IDRECIBO
              LIB:IDPROVEEDOR  =  IDPROVEEDOR#
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
          !!! PARA CERRAR
          PAG:IDFACTURA = GLO:IDSOLICITUD
          GET(PAGOS,PAG:FK_PAGOS_FACTURA)
          IF ERRORCODE() = 35 THEN
              MESSAGE('NO ENCONTRO PAGO')
          ELSE
              GLO:PAGO = PAG:IDPAGOS
              IMPRIMIR_PAGO
          END
  
  
          GLO:IDSOLICITUD = 0
          GLO:MONTO     = 0
      ELSE
           !!! BUSCO EN INFORMES
          INF:SUCURSAL  = PAG:SUCURSAL
          INF:IDRECIBO  = PAG:IDRECIBO
          ACCESS:INFORME.TRYFETCH(INF:IDX_INFORME_RECIBO)
          INF:TERMINADO = 'SI'
          ACCESS:INFORME.UPDATE
  
      END
  END
  
  !!!LIBERO MEMORIA
  FREE(TAGS)
  
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
  OF ?List
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
    OF ?List
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
      IF KEYCODE() = MouseLeft AND (?List{PROPLIST:MouseDownRow} > 0) AND (DASBRW::11:TAGFLAG = 0)
        CASE ?List{PROPLIST:MouseDownField}
      
          OF 1
            DASBRW::11:TAGMOUSE = 1
            POST(EVENT:Accepted,?DASTAG)
               ?List{PROPLIST:MouseDownField} = 2
            CYCLE
         END
      END
      DASBRW::11:TAGFLAG = 0
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


BRW10.SetQueueRecord PROCEDURE

  CODE
  !--------------------------------------------------------------------------
  ! DAS_Tagging
  !--------------------------------------------------------------------------
     TAGS.PUNTERO = FAC:IDFACTURA
     GET(TAGS,TAGS.PUNTERO)
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


BRW10.TakeKey PROCEDURE

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


BRW10.ValidateRecord PROCEDURE

ReturnValue          BYTE,AUTO

BRW10::RecordStatus  BYTE,AUTO
  CODE
  ReturnValue = PARENT.ValidateRecord()
  BRW10::RecordStatus=ReturnValue
  IF BRW10::RecordStatus NOT=Record:OK THEN RETURN BRW10::RecordStatus.
  !--------------------------------------------------------------------------
  ! DAS_Tagging
  !--------------------------------------------------------------------------
     TAGS.PUNTERO = FAC:IDFACTURA
     GET(TAGS,TAGS.PUNTERO)
    EXECUTE DASBRW::11:TAGDISPSTATUS
       IF ERRORCODE() THEN BRW10::RecordStatus = RECORD:FILTERED END
       IF ~ERRORCODE() THEN BRW10::RecordStatus = RECORD:FILTERED END
    END
  !--------------------------------------------------------------------------
  ! DAS_Tagging
  !--------------------------------------------------------------------------
  ReturnValue=BRW10::RecordStatus
  RETURN ReturnValue

!!! <summary>
!!! Generated from procedure template - Window
!!! Select a SUBCUENTAS Record
!!! </summary>
SelectSUBCUENTAS_cuotas PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(SUBCUENTAS)
                       PROJECT(SUB:DESCRIPCION)
                       PROJECT(SUB:IDSUBCUENTA)
                       PROJECT(SUB:IDCUENTA)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
SUB:DESCRIPCION        LIKE(SUB:DESCRIPCION)          !List box control field - type derived from field
SUB:IDSUBCUENTA        LIKE(SUB:IDSUBCUENTA)          !List box control field - type derived from field
SUB:IDCUENTA           LIKE(SUB:IDCUENTA)             !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Select a SUBCUENTAS Record'),AT(,,236,198),FONT('MS Sans Serif',8,,FONT:regular),RESIZE, |
  CENTER,GRAY,IMM,MDI,HLP('SelectSUBCUENTAS'),SYSTEM
                       LIST,AT(8,30,220,124),USE(?Browse:1),HVSCROLL,FORMAT('163L(2)|M~DESCRIPCION~@s50@64L(2)' & |
  '|M~IDSUBCUENTA~C(0)@n-5@56L(2)|M~IDCUENTA~C(0)@n-5@'),FROM(Queue:Browse:1),IMM,MSG('Administra' & |
  'dor de SUBCUENTAS')
                       BUTTON('&Elegir'),AT(179,158,49,14),USE(?Select:2),LEFT,ICON('e.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Seleccionar'),TIP('Seleccionar')
                       SHEET,AT(4,4,228,172),USE(?CurrentTab)
                         TAB('CUENTA'),USE(?Tab:2)
                         END
                       END
                       BUTTON('&Salir'),AT(183,180,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
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
  GlobalErrors.SetProcedureName('SelectSUBCUENTAS_cuotas')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('SUB:IDSUBCUENTA',SUB:IDSUBCUENTA)                  ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:SUBCUENTAS.Open                                   ! File SUBCUENTAS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:SUBCUENTAS,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,SUB:INTEG_113)                        ! Add the sort order for SUB:INTEG_113 for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,SUB:IDSUBCUENTA,,BRW1)         ! Initialize the browse locator using  using key: SUB:INTEG_113 , SUB:IDSUBCUENTA
  BRW1.SetFilter('(SUB:IDCUENTA = 1)')                     ! Apply filter expression to browse
  BRW1.AddField(SUB:DESCRIPCION,BRW1.Q.SUB:DESCRIPCION)    ! Field SUB:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(SUB:IDSUBCUENTA,BRW1.Q.SUB:IDSUBCUENTA)    ! Field SUB:IDSUBCUENTA is a hot field or requires assignment from browse
  BRW1.AddField(SUB:IDCUENTA,BRW1.Q.SUB:IDCUENTA)          ! Field SUB:IDCUENTA is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('SelectSUBCUENTAS_cuotas',QuickWindow)      ! Restore window settings from non-volatile store
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
    Relate:SUBCUENTAS.Close
  END
  IF SELF.Opened
    INIMgr.Update('SelectSUBCUENTAS_cuotas',QuickWindow)   ! Save window data to non-volatile store
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


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the PAGOS file
!!! </summary>
PAGOS_AFECTADOS PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(PAGOS)
                       PROJECT(PAG:IDPAGOS)
                       PROJECT(PAG:IDSOCIO)
                       PROJECT(PAG:IDFACTURA)
                       PROJECT(PAG:SUCURSAL)
                       PROJECT(PAG:IDRECIBO)
                       PROJECT(PAG:MONTO)
                       PROJECT(PAG:FECHA)
                       PROJECT(PAG:HORA)
                       PROJECT(PAG:MES)
                       PROJECT(PAG:ANO)
                       JOIN(SOC:PK_SOCIOS,PAG:IDSOCIO)
                         PROJECT(SOC:MATRICULA)
                         PROJECT(SOC:NOMBRE)
                         PROJECT(SOC:IDSOCIO)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
PAG:IDPAGOS            LIKE(PAG:IDPAGOS)              !List box control field - type derived from field
PAG:IDSOCIO            LIKE(PAG:IDSOCIO)              !List box control field - type derived from field
SOC:MATRICULA          LIKE(SOC:MATRICULA)            !List box control field - type derived from field
SOC:NOMBRE             LIKE(SOC:NOMBRE)               !List box control field - type derived from field
PAG:IDFACTURA          LIKE(PAG:IDFACTURA)            !List box control field - type derived from field
PAG:SUCURSAL           LIKE(PAG:SUCURSAL)             !List box control field - type derived from field
PAG:IDRECIBO           LIKE(PAG:IDRECIBO)             !List box control field - type derived from field
PAG:MONTO              LIKE(PAG:MONTO)                !List box control field - type derived from field
PAG:FECHA              LIKE(PAG:FECHA)                !List box control field - type derived from field
PAG:HORA               LIKE(PAG:HORA)                 !List box control field - type derived from field
PAG:MES                LIKE(PAG:MES)                  !List box control field - type derived from field
PAG:ANO                LIKE(PAG:ANO)                  !List box control field - type derived from field
SOC:IDSOCIO            LIKE(SOC:IDSOCIO)              !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Browse the PAGOS file'),AT(,,358,198),FONT('MS Sans Serif',8,,FONT:regular),RESIZE, |
  CENTER,GRAY,IMM,MDI,HLP('BrowsePAGOS'),SYSTEM
                       LIST,AT(8,30,342,124),USE(?Browse:1),HVSCROLL,FORMAT('64R(2)|M~IDPAGOS~C(0)@n-14@[64R(2' & |
  ')|M~IDSOCIO~C(0)@n-14@56R(2)|M~MATRICULA~C(0)@n-14@120R(2)|M~NOMBRE~C(0)@s30@]|M~COL' & |
  'EGIADO~47L(2)|M~IDFACTURA~L(0)@n-7@[42L(2)|M~-~L(0)@n-5@56L(2)|M~IDRECIBO~L(0)@n-7@]' & |
  '(80)|M~RECIBO~36D(14)|M~MONTO~C(0)@n-7.2@50L(2)|M~FECHA~L(0)@d17@29L(2)|M~HORA~L(0)@' & |
  't7@16L(2)|M~MES~@s2@20L(2)|M~ANO~@s4@'),FROM(Queue:Browse:1),IMM,MSG('Administrador de PAGOS')
                       BUTTON('&Ver'),AT(191,159,49,14),USE(?View:2),LEFT,ICON('v.ico'),CURSOR('mano.cur'),FLAT,MSG('Visualizar'), |
  TIP('Visualizar')
                       BUTTON('&Agregar'),AT(251,160,49,14),USE(?Insert:3),LEFT,ICON('a.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Agrega Registro'),TIP('Agrega Registro')
                       BUTTON('&Cambiar'),AT(303,160,49,14),USE(?Change:3),LEFT,ICON('c.ico'),CURSOR('mano.cur'), |
  DEFAULT,FLAT,MSG('Cambia Registro'),TIP('Cambia Registro')
                       BUTTON('&Borrar'),AT(55,157,49,14),USE(?Delete:3),LEFT,ICON('b.ico'),CURSOR('mano.cur'),DISABLE, |
  FLAT,HIDE,MSG('Borra Registro'),TIP('Borra Registro')
                       SHEET,AT(4,4,350,172),USE(?CurrentTab)
                         TAB('PAGOS'),USE(?Tab:2)
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
                     END

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
  GlobalErrors.SetProcedureName('PAGOS_AFECTADOS')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('PAG:IDPAGOS',PAG:IDPAGOS)                          ! Added by: BrowseBox(ABC)
  BIND('SOC:IDSOCIO',SOC:IDSOCIO)                          ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:PAGOS.Open                                        ! File PAGOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:PAGOS,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,PAG:PK_PAGOS)                         ! Add the sort order for PAG:PK_PAGOS for sort order 1
  BRW1.AddField(PAG:IDPAGOS,BRW1.Q.PAG:IDPAGOS)            ! Field PAG:IDPAGOS is a hot field or requires assignment from browse
  BRW1.AddField(PAG:IDSOCIO,BRW1.Q.PAG:IDSOCIO)            ! Field PAG:IDSOCIO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:MATRICULA,BRW1.Q.SOC:MATRICULA)        ! Field SOC:MATRICULA is a hot field or requires assignment from browse
  BRW1.AddField(SOC:NOMBRE,BRW1.Q.SOC:NOMBRE)              ! Field SOC:NOMBRE is a hot field or requires assignment from browse
  BRW1.AddField(PAG:IDFACTURA,BRW1.Q.PAG:IDFACTURA)        ! Field PAG:IDFACTURA is a hot field or requires assignment from browse
  BRW1.AddField(PAG:SUCURSAL,BRW1.Q.PAG:SUCURSAL)          ! Field PAG:SUCURSAL is a hot field or requires assignment from browse
  BRW1.AddField(PAG:IDRECIBO,BRW1.Q.PAG:IDRECIBO)          ! Field PAG:IDRECIBO is a hot field or requires assignment from browse
  BRW1.AddField(PAG:MONTO,BRW1.Q.PAG:MONTO)                ! Field PAG:MONTO is a hot field or requires assignment from browse
  BRW1.AddField(PAG:FECHA,BRW1.Q.PAG:FECHA)                ! Field PAG:FECHA is a hot field or requires assignment from browse
  BRW1.AddField(PAG:HORA,BRW1.Q.PAG:HORA)                  ! Field PAG:HORA is a hot field or requires assignment from browse
  BRW1.AddField(PAG:MES,BRW1.Q.PAG:MES)                    ! Field PAG:MES is a hot field or requires assignment from browse
  BRW1.AddField(PAG:ANO,BRW1.Q.PAG:ANO)                    ! Field PAG:ANO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:IDSOCIO,BRW1.Q.SOC:IDSOCIO)            ! Field SOC:IDSOCIO is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('PAGOS_AFECTADOS',QuickWindow)              ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1                                    ! Will call: UpdatePAGOS1
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
    Relate:PAGOS.Close
  END
  IF SELF.Opened
    INIMgr.Update('PAGOS_AFECTADOS',QuickWindow)           ! Save window data to non-volatile store
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
    UpdatePAGOS1
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


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Process
!!! </summary>
GENERAR_ARCHIVO_BEBITO PROCEDURE 

Progress:Thermometer BYTE                                  ! 
Process:View         VIEW(SOCIOS)
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
  GlobalErrors.SetProcedureName('GENERAR_ARCHIVO_BEBITO')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:BANCO.Open                                        ! File BANCO used by this procedure, so make sure it's RelationManager is open
  Relate:BANCO_COD_REG.Open                                ! File BANCO_COD_REG used by this procedure, so make sure it's RelationManager is open
  Relate:BANCO_DEBITO.Open                                 ! File BANCO_DEBITO used by this procedure, so make sure it's RelationManager is open
  Relate:FACTURA.Open                                      ! File FACTURA used by this procedure, so make sure it's RelationManager is open
  Relate:SOCIOS.Open                                       ! File SOCIOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('GENERAR_ARCHIVO_BEBITO',ProgressWindow)    ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisProcess.Init(Process:View, Relate:SOCIOS, ?Progress:PctText, Progress:Thermometer, ProgressMgr, SOC:IDSOCIO)
  ThisProcess.AddSortOrder(SOC:PK_SOCIOS)
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  ?Progress:UserString{Prop:Text}=''
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
    Relate:BANCO.Close
    Relate:BANCO_COD_REG.Close
    Relate:BANCO_DEBITO.Close
    Relate:FACTURA.Close
    Relate:SOCIOS.Close
  END
  IF SELF.Opened
    INIMgr.Update('GENERAR_ARCHIVO_BEBITO',ProgressWindow) ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeRecord()
  if SOC:CBU <> '' then
      BAN:TRAFICO_INF         = 'EB'
      soc# = SOC:IDSOCIO
      BAN:CBU_B_4             = format(SOC:CBU,@N014)
      BAN:CUIT             = FORMAT(GLO:CUIT,@N011)
      !! BUSCA BANCO
      BAN2:IDBANCO = SOC:IDBANCO
      ACCESS:BANCO.TRYFETCH(BAN2:PK_BANCO)
      BAN:COD_BANCO           = FORMAT(BAN2:CODIGO_BANCO,@N03)
      BAN:CBU_B_1             = FORMAT(BAN2:CBU_BLOQUE_1,@N08)
      !! busca cod registro
      BAN3:ID_REGISTRO = BAN2:ID_REGISTRO
      ACCESS:BANCO_COD_REG.TRYFETCH(BAN3:PK_BANCO_COD_REG)
      BAN:COD_REGISTRO        = FORMAT(BAN3:COD_REGISTRO,@N02)
      !!!!!
      BAN:F_VENCIMIENTO       = FORMAT(FECHA_DESDE,@D11)
      BAN:EMPRESA             = FORMAT(BAN2:SUBEMPRESA,@N05)
      BAN:IDENTIFICADO        = UPPER(SOC:MATRICULA)
      BAN:MONEDA              = 'P'
      !! BUSCA IMPORTE
      FAC:IDSOCIO = soc#
      SET(FAC:FK_FACTURA_SOCIO,FAC:FK_FACTURA_SOCIO)
      LOOP
          IF ACCESS:FACTURA.NEXT() THEN BREAK.
          IF FAC:IDSOCIO <> soc# THEN BREAK.
          IF FAC:ESTADO = '' THEN
              BAN:IMPORTE             =  FORMAT(FAC:TOTAL,@N010v2)
              BAN:VENCIMIENTO         =  FAC:IDFACTURA
              BREAK
           END
      END
      !!!!!!!!!!!!!
      
      BAN:DESCRIPCION      = 'COL.PROF. '
      BAN:REFER_UNIVOCA    = '                      '
      BAN:NUEVO_CBU        = '               '
      BAN:CODIGO_RETORNO   ='   '
      ADD(BANCO_DEBITO)
      IF ERRORCODE() THEN MESSAGE(ERROR()).
  end
  RETURN ReturnValue

!!! <summary>
!!! Generated from procedure template - Window
!!! Window
!!! </summary>
GENERAR_LIQUIDACION PROCEDURE 

QuickWindow          WINDOW('Generar Liquidación al Banco'),AT(,,129,93),FONT('Arial Black',8,COLOR:Black,FONT:bold), |
  RESIZE,CENTER,GRAY,IMM,HLP('GENERAR_LIQUIDACION'),SYSTEM
                       BUTTON('...'),AT(107,3,12,12),USE(?Calendar),LEFT,ICON('CALENDAR.ICO'),FLAT
                       PROMPT('FECHA VTO:'),AT(2,5),USE(?FECHA_DESDE:Prompt)
                       ENTRY(@D6),AT(46,5,60,10),USE(FECHA_DESDE),RIGHT(1)
                       BUTTON('&Procesar'),AT(35,30,58,14),USE(?Ok),LEFT,ICON(ICON:NextPage),CURSOR('mano.cur'),FLAT, |
  MSG('Acepta Operacion'),TIP('Acepta Operacion')
                       BUTTON('&Cancelar'),AT(39,58,49,14),USE(?Cancel),LEFT,ICON('cancelar.ico'),CURSOR('mano.cur'), |
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

Calendar6            CalendarClass

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
  GlobalErrors.SetProcedureName('GENERAR_LIQUIDACION')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Calendar
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
  Relate:BANCO.Open                                        ! File BANCO used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('GENERAR_LIQUIDACION',QuickWindow)          ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:BANCO.Close
  END
  IF SELF.Opened
    INIMgr.Update('GENERAR_LIQUIDACION',QuickWindow)       ! Save window data to non-volatile store
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
    OF ?Calendar
      ThisWindow.Update()
      Calendar6.SelectOnClose = True
      Calendar6.Ask('Select a Date',FECHA_DESDE)
      IF Calendar6.Response = RequestCompleted THEN
      FECHA_DESDE=Calendar6.SelectedDate
      DISPLAY(?FECHA_DESDE)
      END
      ThisWindow.Reset(True)
    OF ?Ok
      ThisWindow.Update()
      START(GENERAR_ARCHIVO_BEBITO, 25000)
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
!!! Browse the FACTURA File
!!! </summary>
VER_FACTURAS PROCEDURE 

CurrentTab           STRING(80)                            ! 
LOC:CANTIDAD         LONG                                  ! 
LOC:MONTO            REAL                                  ! 
BRW1::View:Browse    VIEW(FACTURA)
                       PROJECT(FAC:IDFACTURA)
                       PROJECT(FAC:IDSOCIO)
                       PROJECT(FAC:TOTAL)
                       PROJECT(FAC:MES)
                       PROJECT(FAC:ANO)
                       PROJECT(FAC:PERIODO)
                       PROJECT(FAC:ESTADO)
                       PROJECT(FAC:FECHA)
                       JOIN(SOC:PK_SOCIOS,FAC:IDSOCIO)
                         PROJECT(SOC:MATRICULA)
                         PROJECT(SOC:NOMBRE)
                         PROJECT(SOC:IDSOCIO)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
FAC:IDFACTURA          LIKE(FAC:IDFACTURA)            !List box control field - type derived from field
FAC:IDFACTURA_Icon     LONG                           !Entry's icon ID
FAC:IDSOCIO            LIKE(FAC:IDSOCIO)              !List box control field - type derived from field
SOC:MATRICULA          LIKE(SOC:MATRICULA)            !List box control field - type derived from field
SOC:NOMBRE             LIKE(SOC:NOMBRE)               !List box control field - type derived from field
FAC:TOTAL              LIKE(FAC:TOTAL)                !List box control field - type derived from field
FAC:MES                LIKE(FAC:MES)                  !List box control field - type derived from field
FAC:ANO                LIKE(FAC:ANO)                  !List box control field - type derived from field
FAC:PERIODO            LIKE(FAC:PERIODO)              !List box control field - type derived from field
FAC:ESTADO             LIKE(FAC:ESTADO)               !List box control field - type derived from field
FAC:FECHA              LIKE(FAC:FECHA)                !Browse key field - type derived from field
SOC:IDSOCIO            LIKE(SOC:IDSOCIO)              !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW2::View:Browse    VIEW(DETALLE_FACTURA)
                       PROJECT(DET:IDFACTURA)
                       PROJECT(DET:CONCEPTO)
                       PROJECT(DET:MONTO)
                       PROJECT(DET:MES)
                       PROJECT(DET:ANO)
                     END
Queue:Browse         QUEUE                            !Queue declaration for browse/combo box using ?List
DET:IDFACTURA          LIKE(DET:IDFACTURA)            !List box control field - type derived from field
DET:CONCEPTO           LIKE(DET:CONCEPTO)             !List box control field - type derived from field
DET:MONTO              LIKE(DET:MONTO)                !List box control field - type derived from field
DET:MES                LIKE(DET:MES)                  !Primary key field - type derived from field
DET:ANO                LIKE(DET:ANO)                  !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Ver Facturas '),AT(,,525,275),FONT('Arial',8,,FONT:regular),RESIZE,CENTER,GRAY,IMM, |
  MDI,HLP('VER_FACTURAS'),SYSTEM
                       LIST,AT(8,40,512,124),USE(?Browse:1),HVSCROLL,FORMAT('43L(2)|MI~IDFACTURA~C(0)@n-7@[38L' & |
  '(2)|M~IDSOCIO~C(0)@n-7@30L(2)|M~MAT.~C(0)@s7@120L(2)|M~NOMBRE~C(0)@s30@]|M~COLEGIADO' & |
  '~36D(14)|M~TOTAL~C(0)@n$-10.2@18L(2)|M~MES~C(0)@n-3@23L(2)|M~AÑO~C(0)@n-5@39L(2)|M~P' & |
  'ERIODO~@s4@84L(2)|M~ESTADO~@s21@'),FROM(Queue:Browse:1),IMM,MSG('Administrador de FACTURA'), |
  VCR
                       GROUP('DETALLE FACTURA'),AT(5,189,517,69),USE(?Group1),BOXED
                         LIST,AT(7,197,511,58),USE(?List),VSCROLL,FORMAT('56L(2)|M~IDFACTURA~@n-14@200L(2)|M~CON' & |
  'CEPTO~@s50@28L(2)|M~MONTO~@n-10.2@'),FROM(Queue:Browse),IMM,MSG('Browsing Records'),VCR
                       END
                       BUTTON('&Imprimir Total '),AT(7,260,73,14),USE(?Button4),LEFT,ICON(ICON:Print1),FLAT
                       BUTTON('I&mprimir Detalle'),AT(85,260,80,14),USE(?Button5),LEFT,ICON(ICON:Print1),FLAT
                       BUTTON('&Filtro'),AT(9,167,49,14),USE(?Query),LEFT,ICON('qkqbe.ico'),FLAT
                       BUTTON('E&xportar'),AT(61,166,52,15),USE(?EvoExportar),LEFT,ICON('export.ico'),FLAT
                       PROMPT('Cantidad de Registros:'),AT(171,169),USE(?Prompt6)
                       STRING(@n-14),AT(247,169),USE(LOC:CANTIDAD)
                       PROMPT('Monto Vista:'),AT(305,169),USE(?Prompt7)
                       STRING(@n10.2),AT(349,169),USE(LOC:MONTO)
                       SHEET,AT(4,4,520,182),USE(?CurrentTab)
                         TAB('FACTURA'),USE(?Tab:1)
                           PROMPT('IDFACTURA:'),AT(127,23),USE(?FAC:IDFACTURA:Prompt)
                           ENTRY(@n-14),AT(176,23,60,10),USE(FAC:IDFACTURA),RIGHT(1)
                         END
                         TAB('SOCIO'),USE(?Tab:2)
                           PROMPT('IDSOCIO:'),AT(127,23),USE(?FAC:IDSOCIO:Prompt)
                           ENTRY(@n-14),AT(162,23,60,10),USE(FAC:IDSOCIO),RIGHT(1)
                           BUTTON('...'),AT(223,22,12,12),USE(?CallLookup)
                         END
                         TAB('ESTADO'),USE(?Tab:3)
                         END
                         TAB('FECHA'),USE(?Tab:4)
                         END
                         TAB('PERIODO'),USE(?Tab:5)
                           PROMPT('PERIODO:'),AT(125,23),USE(?FAC:PERIODO:Prompt)
                           ENTRY(@s11),AT(159,23,60,10),USE(FAC:PERIODO)
                         END
                       END
                       BUTTON('&Salir'),AT(474,260,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Salir'),TIP('Salir')
                       PROMPT('&Orden:'),AT(8,23),USE(?SortOrderList:Prompt)
                       LIST,AT(48,23,75,10),USE(?SortOrderList),DROP(20),FROM(''),MSG('Select the Sort Order'),TIP('Select the' & |
  ' Sort Order')
                     END

Loc::QHlist7 QUEUE,PRE(QHL7)
Id                         SHORT
Nombre                     STRING(100)
Longitud                   SHORT
Pict                       STRING(50)
Tot                 BYTE
                         END
QPar7 QUEUE,PRE(Q7)
FieldPar                 CSTRING(800)
                         END
QPar27 QUEUE,PRE(Qp27)
F2N                 CSTRING(300)
F2P                 CSTRING(100)
F2T                 BYTE
                         END
Loc::TituloListado7          STRING(100)
Loc::Titulo7          STRING(100)
SavPath7          STRING(2000)
Evo::Group7  GROUP,PRE()
Evo::Procedure7          STRING(100)
Evo::App7          STRING(100)
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
ResetFromView          PROCEDURE(),DERIVED
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
SetQueueRecord         PROCEDURE(),DERIVED
                     END

BRW1::Sort0:Locator  EntryLocatorClass                     ! Default Locator
BRW1::Sort1:Locator  EntryLocatorClass                     ! Conditional Locator - CHOICE(?CurrentTab) = 2
BRW1::Sort2:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 3
BRW1::Sort3:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 4
BRW1::Sort4:Locator  EntryLocatorClass                     ! Conditional Locator - CHOICE(?CurrentTab) = 5
BRW2                 CLASS(BrowseClass)                    ! Browse using ?List
Q                      &Queue:Browse                  !Reference to browse queue
                     END

BRW2::Sort0:Locator  StepLocatorClass                      ! Default Locator
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

Ec::LoadI_7  SHORT
Gol_woI_7 WINDOW,AT(,,236,43),FONT('MS Sans Serif',8,,),CENTER,GRAY
       IMAGE('clock.ico'),AT(8,11),USE(?ImgoutI_7),CENTERED
       GROUP,AT(38,11,164,20),USE(?G::I_7),BOXED,BEVEL(-1)
         STRING('Preparando datos para Exportacion'),AT(63,11),USE(?StrOutI_7),TRN
         STRING('Aguarde un instante por Favor...'),AT(67,20),USE(?StrOut2I_7),TRN
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
PrintExBrowse7 ROUTINE

 OPEN(Gol_woI_7)
 DISPLAY()
 SETTARGET(QuickWindow)
 SETCURSOR(CURSOR:WAIT)
 EC::LoadI_7 = BRW1.FileLoaded
 IF Not  EC::LoadI_7
     BRW1.FileLoaded=True
     CLEAR(BRW1.LastItems,1)
     BRW1.ResetFromFile()
 END
 CLOSE(Gol_woI_7)
 SETCURSOR()
  Evo::App7          = 'Gestion'
  Evo::Procedure7          = GlobalErrors.GetProcedureName()& 7
 
  FREE(QPar7)
  Q7:FieldPar  = '1,3,4,5,6,7,8,9,10,'
  ADD(QPar7)  !!1
  Q7:FieldPar  = ';'
  ADD(QPar7)  !!2
  Q7:FieldPar  = 'Spanish'
  ADD(QPar7)  !!3
  Q7:FieldPar  = ''
  ADD(QPar7)  !!4
  Q7:FieldPar  = true
  ADD(QPar7)  !!5
  Q7:FieldPar  = ''
  ADD(QPar7)  !!6
  Q7:FieldPar  = true
  ADD(QPar7)  !!7
 !!!! Exportaciones
  Q7:FieldPar  = 'HTML|'
   Q7:FieldPar  = CLIP( Q7:FieldPar)&'EXCEL|'
   Q7:FieldPar  = CLIP( Q7:FieldPar)&'WORD|'
  Q7:FieldPar  = CLIP( Q7:FieldPar)&'ASCII|'
   Q7:FieldPar  = CLIP( Q7:FieldPar)&'XML|'
   Q7:FieldPar  = CLIP( Q7:FieldPar)&'PRT|'
  ADD(QPar7)  !!8
  Q7:FieldPar  = 'All'
  ADD(QPar7)   !.9.
  Q7:FieldPar  = ' 0'
  ADD(QPar7)   !.10
  Q7:FieldPar  = 0
  ADD(QPar7)   !.11
  Q7:FieldPar  = '1'
  ADD(QPar7)   !.12
 
  Q7:FieldPar  = ''
  ADD(QPar7)   !.13
 
  Q7:FieldPar  = ''
  ADD(QPar7)   !.14
 
  Q7:FieldPar  = ''
  ADD(QPar7)   !.15
 
   Q7:FieldPar  = '16'
  ADD(QPar7)   !.16
 
   Q7:FieldPar  = 1
  ADD(QPar7)   !.17
   Q7:FieldPar  = 2
  ADD(QPar7)   !.18
   Q7:FieldPar  = '2'
  ADD(QPar7)   !.19
   Q7:FieldPar  = 12
  ADD(QPar7)   !.20
 
   Q7:FieldPar  = 0 !Exporta excel sin borrar
  ADD(QPar7)   !.21
 
   Q7:FieldPar  = Evo::NroPage !Nro Pag. Desde Report (BExp)
  ADD(QPar7)   !.22
 
   CLEAR(Q7:FieldPar)
  ADD(QPar7)   ! 23 Caracteres Encoding para xml
 
  Q7:FieldPar  = '0'
  ADD(QPar7)   ! 24 Use Open Office
 
   Q7:FieldPar  = 'golmedo'
  ADD(QPar7) ! 25
 
 !---------------------------------------------------------------------------------------------
 !!Registration 
  Q7:FieldPar  = ' BrowseExport'
  ADD(QPar7)   ! 26  BrowseExport
  Q7:FieldPar  = ' '
  ADD(QPar7)   ! 27  
  Q7:FieldPar  = ' ' 
  ADD(QPar7)   ! 28  
  Q7:FieldPar  = 'BEXPORT' 
  ADD(QPar7)   ! 29 Gestion025.clw
 !!!!!
 
 
  FREE(QPar27)
       Qp27:F2N  = 'IDFACTURA'
  Qp27:F2P  = '@n-7'
  Qp27:F2T  = '0'
  ADD(QPar27)
       Qp27:F2N  = 'IDSOCIO'
  Qp27:F2P  = '@n-7'
  Qp27:F2T  = '0'
  ADD(QPar27)
       Qp27:F2N  = 'MAT.'
  Qp27:F2P  = '@n-7'
  Qp27:F2T  = '0'
  ADD(QPar27)
       Qp27:F2N  = 'NOMBRE'
  Qp27:F2P  = '@s30'
  Qp27:F2T  = '0'
  ADD(QPar27)
       Qp27:F2N  = 'TOTAL'
  Qp27:F2P  = '@n$-7.2'
  Qp27:F2T  = '0'
  ADD(QPar27)
       Qp27:F2N  = 'MES'
  Qp27:F2P  = '@n-3'
  Qp27:F2T  = '0'
  ADD(QPar27)
       Qp27:F2N  = 'AÑO'
  Qp27:F2P  = '@n-5'
  Qp27:F2T  = '0'
  ADD(QPar27)
       Qp27:F2N  = 'PERIODO'
  Qp27:F2P  = '@s4'
  Qp27:F2T  = '0'
  ADD(QPar27)
       Qp27:F2N  = 'ESTADO'
  Qp27:F2P  = '@s21'
  Qp27:F2T  = '0'
  ADD(QPar27)
  SysRec# = false
  FREE(Loc::QHlist7)
  LOOP
     SysRec# += 1
     IF ?Browse:1{PROPLIST:Exists,SysRec#} = 1
         GET(QPar27,SysRec#)
         QHL7:Id      = SysRec#
         QHL7:Nombre  = Qp27:F2N
         QHL7:Longitud= ?Browse:1{PropList:Width,SysRec#}  /2
         QHL7:Pict    = Qp27:F2P
         QHL7:Tot    = Qp27:F2T
         ADD(Loc::QHlist7)
      Else
        break
     END
  END
  Loc::Titulo7 ='FACTURACION'
 
 SavPath7 = PATH()
  Exportar(Loc::QHlist7,BRW1.Q,QPar7,0,Loc::Titulo7,Evo::Group7)
 IF Not EC::LoadI_7 Then  BRW1.FileLoaded=false.
 SETPATH(SavPath7)
 !!!! Fin Routina Templates Clarion

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('VER_FACTURAS')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('FAC:IDFACTURA',FAC:IDFACTURA)                      ! Added by: BrowseBox(ABC)
  BIND('SOC:IDSOCIO',SOC:IDSOCIO)                          ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:DETALLE_FACTURA.Open                              ! File DETALLE_FACTURA used by this procedure, so make sure it's RelationManager is open
  Relate:FACTURA.Open                                      ! File FACTURA used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:FACTURA,SELF) ! Initialize the browse manager
  BRW2.Init(?List,Queue:Browse.ViewPosition,BRW2::View:Browse,Queue:Browse,Relate:DETALLE_FACTURA,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?CurrentTab{PROP:WIZARD}=True
  ?SortOrderList{PROP:FROM}=|
                CHOOSE(SUB(?Tab:1{PROP:TEXT},1,1)='&',SUB(?Tab:1{PROP:TEXT},2,LEN(?Tab:1{PROP:TEXT})-1),?Tab:1{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab:2{PROP:TEXT},1,1)='&',SUB(?Tab:2{PROP:TEXT},2,LEN(?Tab:2{PROP:TEXT})-1),?Tab:2{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab:3{PROP:TEXT},1,1)='&',SUB(?Tab:3{PROP:TEXT},2,LEN(?Tab:3{PROP:TEXT})-1),?Tab:3{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab:4{PROP:TEXT},1,1)='&',SUB(?Tab:4{PROP:TEXT},2,LEN(?Tab:4{PROP:TEXT})-1),?Tab:4{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab:5{PROP:TEXT},1,1)='&',SUB(?Tab:5{PROP:TEXT},2,LEN(?Tab:5{PROP:TEXT})-1),?Tab:5{PROP:TEXT})&|
                ''
  ?SortOrderList{PROP:SELECTED}=1
  Do DefineListboxStyle
  QBE8.Init(QBV8, INIMgr,'VER_FACTURAS', GlobalErrors)
  QBE8.QkSupport = True
  QBE8.QkMenuIcon = 'QkQBE.ico'
  QBE8.QkIcon = 'QkLoad.ico'
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,FAC:FK_FACTURA_SOCIO)                 ! Add the sort order for FAC:FK_FACTURA_SOCIO for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(?FAC:IDSOCIO,FAC:IDSOCIO,,BRW1) ! Initialize the browse locator using ?FAC:IDSOCIO using key: FAC:FK_FACTURA_SOCIO , FAC:IDSOCIO
  BRW1.AddSortOrder(,FAC:IDX_FACTURA_ESTADO)               ! Add the sort order for FAC:IDX_FACTURA_ESTADO for sort order 2
  BRW1.AddLocator(BRW1::Sort2:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort2:Locator.Init(,FAC:ESTADO,,BRW1)              ! Initialize the browse locator using  using key: FAC:IDX_FACTURA_ESTADO , FAC:ESTADO
  BRW1.AddSortOrder(,FAC:IDX_FACTURA_FECHA)                ! Add the sort order for FAC:IDX_FACTURA_FECHA for sort order 3
  BRW1.AddLocator(BRW1::Sort3:Locator)                     ! Browse has a locator for sort order 3
  BRW1::Sort3:Locator.Init(,FAC:FECHA,,BRW1)               ! Initialize the browse locator using  using key: FAC:IDX_FACTURA_FECHA , FAC:FECHA
  BRW1.AddSortOrder(,FAC:IDX_FACTURA_PERIODO)              ! Add the sort order for FAC:IDX_FACTURA_PERIODO for sort order 4
  BRW1.AddLocator(BRW1::Sort4:Locator)                     ! Browse has a locator for sort order 4
  BRW1::Sort4:Locator.Init(?FAC:PERIODO,FAC:PERIODO,,BRW1) ! Initialize the browse locator using ?FAC:PERIODO using key: FAC:IDX_FACTURA_PERIODO , FAC:PERIODO
  BRW1.AddSortOrder(,FAC:PK_FACTURA)                       ! Add the sort order for FAC:PK_FACTURA for sort order 5
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 5
  BRW1::Sort0:Locator.Init(?FAC:IDFACTURA,FAC:IDFACTURA,,BRW1) ! Initialize the browse locator using ?FAC:IDFACTURA using key: FAC:PK_FACTURA , FAC:IDFACTURA
  ?Browse:1{PROP:IconList,1} = '~Aceptar.ICO'
  BRW1.AddField(FAC:IDFACTURA,BRW1.Q.FAC:IDFACTURA)        ! Field FAC:IDFACTURA is a hot field or requires assignment from browse
  BRW1.AddField(FAC:IDSOCIO,BRW1.Q.FAC:IDSOCIO)            ! Field FAC:IDSOCIO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:MATRICULA,BRW1.Q.SOC:MATRICULA)        ! Field SOC:MATRICULA is a hot field or requires assignment from browse
  BRW1.AddField(SOC:NOMBRE,BRW1.Q.SOC:NOMBRE)              ! Field SOC:NOMBRE is a hot field or requires assignment from browse
  BRW1.AddField(FAC:TOTAL,BRW1.Q.FAC:TOTAL)                ! Field FAC:TOTAL is a hot field or requires assignment from browse
  BRW1.AddField(FAC:MES,BRW1.Q.FAC:MES)                    ! Field FAC:MES is a hot field or requires assignment from browse
  BRW1.AddField(FAC:ANO,BRW1.Q.FAC:ANO)                    ! Field FAC:ANO is a hot field or requires assignment from browse
  BRW1.AddField(FAC:PERIODO,BRW1.Q.FAC:PERIODO)            ! Field FAC:PERIODO is a hot field or requires assignment from browse
  BRW1.AddField(FAC:ESTADO,BRW1.Q.FAC:ESTADO)              ! Field FAC:ESTADO is a hot field or requires assignment from browse
  BRW1.AddField(FAC:FECHA,BRW1.Q.FAC:FECHA)                ! Field FAC:FECHA is a hot field or requires assignment from browse
  BRW1.AddField(SOC:IDSOCIO,BRW1.Q.SOC:IDSOCIO)            ! Field SOC:IDSOCIO is a hot field or requires assignment from browse
  BRW2.Q &= Queue:Browse
  BRW2.RetainRow = 0
  BRW2.AddSortOrder(,DET:FK_DETALLE_FACTURA)               ! Add the sort order for DET:FK_DETALLE_FACTURA for sort order 1
  BRW2.AddRange(DET:IDFACTURA,Relate:DETALLE_FACTURA,Relate:FACTURA) ! Add file relationship range limit for sort order 1
  BRW2.AddLocator(BRW2::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW2::Sort0:Locator.Init(,DET:IDFACTURA,,BRW2)           ! Initialize the browse locator using  using key: DET:FK_DETALLE_FACTURA , DET:IDFACTURA
  BRW2.AddField(DET:IDFACTURA,BRW2.Q.DET:IDFACTURA)        ! Field DET:IDFACTURA is a hot field or requires assignment from browse
  BRW2.AddField(DET:CONCEPTO,BRW2.Q.DET:CONCEPTO)          ! Field DET:CONCEPTO is a hot field or requires assignment from browse
  BRW2.AddField(DET:MONTO,BRW2.Q.DET:MONTO)                ! Field DET:MONTO is a hot field or requires assignment from browse
  BRW2.AddField(DET:MES,BRW2.Q.DET:MES)                    ! Field DET:MES is a hot field or requires assignment from browse
  BRW2.AddField(DET:ANO,BRW2.Q.DET:ANO)                    ! Field DET:ANO is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('VER_FACTURAS',QuickWindow)                 ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.QueryControl = ?Query
  BRW1.UpdateQuery(QBE8,1)
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW2.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
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
    Relate:DETALLE_FACTURA.Close
    Relate:FACTURA.Close
  END
  IF SELF.Opened
    INIMgr.Update('VER_FACTURAS',QuickWindow)              ! Save window data to non-volatile store
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
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Button4
      ThisWindow.Update()
      Imprimir_Ver_Factura(BRW1.VIEW{PROP:FILTER},BRW1.VIEW{PROP:ORDER})
      ThisWindow.Reset
    OF ?Button5
      ThisWindow.Update()
      Imprimir_Ver_Factura_detalle(BRW1.VIEW{PROP:FILTER},BRW1.VIEW{PROP:ORDER})
      ThisWindow.Reset
    OF ?EvoExportar
      ThisWindow.Update()
       Do PrintExBrowse7
    OF ?FAC:IDSOCIO
      SOC:IDSOCIO = FAC:IDSOCIO
      IF Access:SOCIOS.TryFetch(SOC:PK_SOCIOS)
        IF SELF.Run(1,SelectRecord) = RequestCompleted
          FAC:IDSOCIO = SOC:IDSOCIO
        ELSE
          SELECT(?FAC:IDSOCIO)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
    OF ?CallLookup
      ThisWindow.Update()
      SOC:IDSOCIO = FAC:IDSOCIO
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        FAC:IDSOCIO = SOC:IDSOCIO
      END
      ThisWindow.Reset(1)
    OF ?SortOrderList
      EXECUTE(CHOICE(?SortOrderList))
       SELECT(?Tab:1)
       SELECT(?Tab:2)
       SELECT(?Tab:3)
       SELECT(?Tab:4)
       SELECT(?Tab:5)
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


BRW1.ResetFromView PROCEDURE

LOC:CANTIDAD:Cnt     LONG                                  ! Count variable for browse totals
LOC:MONTO:Sum        REAL                                  ! Sum variable for browse totals
  CODE
  SETCURSOR(Cursor:Wait)
  Relate:FACTURA.SetQuickScan(1)
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
    LOC:CANTIDAD:Cnt += 1
    LOC:MONTO:Sum += FAC:TOTAL
  END
  SELF.View{PROP:IPRequestCount} = 0
  LOC:CANTIDAD = LOC:CANTIDAD:Cnt
  LOC:MONTO = LOC:MONTO:Sum
  PARENT.ResetFromView
  Relate:FACTURA.SetQuickScan(0)
  SETCURSOR()


BRW1.ResetSort PROCEDURE(BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  IF CHOICE(?CurrentTab) = 2
    RETURN SELF.SetSort(1,Force)
  ELSIF CHOICE(?CurrentTab) = 3
    RETURN SELF.SetSort(2,Force)
  ELSIF CHOICE(?CurrentTab) = 4
    RETURN SELF.SetSort(3,Force)
  ELSIF CHOICE(?CurrentTab) = 5
    RETURN SELF.SetSort(4,Force)
  ELSE
    RETURN SELF.SetSort(5,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


BRW1.SetQueueRecord PROCEDURE

  CODE
  PARENT.SetQueueRecord
  
  IF (FAC:ESTADO = 'PAGADO')
    SELF.Q.FAC:IDFACTURA_Icon = 1                          ! Set icon from icon list
  ELSE
    SELF.Q.FAC:IDFACTURA_Icon = 0
  END


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

