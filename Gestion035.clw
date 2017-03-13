

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
                       INCLUDE('GESTION035.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION022.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Report
!!! Imprime Consultorio con Adherentes
!!! </summary>
imprimir_consultorio_adherente PROCEDURE (FILTRO, ORDEN)

Progress:Thermometer BYTE                                  ! 
L:NroReg             LONG                                  ! 
Process:View         VIEW(CONSULTORIO)
                       PROJECT(CON2:FECHA_VTO)
                       PROJECT(CON2:IDCONSULTORIO)
                       PROJECT(CON2:TELEFONO)
                       PROJECT(CON2:IDSOCIO)
                       PROJECT(CON2:IDLOCALIDAD)
                       JOIN(SOC:PK_SOCIOS,CON2:IDSOCIO)
                         PROJECT(SOC:DIRECCION)
                         PROJECT(SOC:MATRICULA)
                         PROJECT(SOC:NOMBRE)
                       END
                       JOIN(CON1:FK_CONSULTRIO_ADHERENTE_CONSUL,CON2:IDCONSULTORIO)
                         PROJECT(CON1:FECHA)
                         PROJECT(CON1:IDSOCIO)
                         JOIN(SOC1:PK_SOCIOS,CON1:IDSOCIO)
                           PROJECT(SOC1:MATRICULA)
                           PROJECT(SOC1:NOMBRE)
                         END
                       END
                       JOIN(LOC:PK_LOCALIDAD,CON2:IDLOCALIDAD)
                         PROJECT(LOC:DESCRIPCION)
                       END
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

Report               REPORT,AT(1000,1635,6250,8677),PRE(RPT),PAPER(PAPER:A4),FONT('Arial',8,,FONT:bold,CHARSET:ANSI), |
  THOUS
                       HEADER,AT(1031,333,6250,1302),USE(?Header)
                         IMAGE('Logo.jpg'),AT(42,42,1677,1187),USE(?IMAGE1)
                         STRING('Reporte de Consultorios'),AT(2365,854),USE(?STRING1),FONT(,14)
                         LINE,AT(0,1219,6219,0),USE(?LINE3)
                       END
break1                 BREAK(CON2:IDCONSULTORIO),USE(?BREAK1)
                         HEADER,AT(0,0,6250,1312),USE(?GROUPHEADER1)
                           STRING(@n-5),AT(979,31),USE(CON2:IDCONSULTORIO)
                           STRING('Id Consultorio:<0DH,0AH>'),AT(10,42),USE(?STRING2)
                           STRING('Colegiado Titular:<0DH,0AH>'),AT(1531,42),USE(?STRING3)
                           STRING(@n-5),AT(2698,52),USE(SOC:MATRICULA)
                           STRING(@s100),AT(3250,52,2948),USE(SOC:NOMBRE)
                           STRING('Dirección:'),AT(31,302),USE(?STRING4)
                           STRING(@s100),AT(708,292,5396),USE(SOC:DIRECCION)
                           STRING('Localidad:<0DH,0AH>'),AT(-10,573,615),USE(?STRING5)
                           STRING(@s50),AT(667,573),USE(LOC:DESCRIPCION)
                           STRING('Fecha Vto:<0DH,0AH>'),AT(4708,573),USE(?STRING6)
                           STRING(@d17),AT(5375,573),USE(CON2:FECHA_VTO)
                           STRING(@P####-#########P),AT(3490,573),USE(CON2:TELEFONO)
                           STRING('Teléfono:'),AT(2896,573),USE(?STRING7)
                           STRING('Id Socio'),AT(146,1083),USE(?STRING8)
                           STRING('Matricula'),AT(979,1083),USE(?STRING9)
                           STRING('Nombre'),AT(1760,1083),USE(?STRING10)
                           STRING('Fecha Alta'),AT(4906,1083),USE(?STRING11)
                           LINE,AT(0,1052,6240,0),USE(?LINE1)
                           LINE,AT(-51,1260,6260,0),USE(?LINE2)
                           STRING('Adherentes'),AT(31,844),USE(?STRING12),FONT(,,,FONT:bold+FONT:underline)
                         END
detail1                  DETAIL,AT(0,0,6250,240),USE(?DETAIL1)
                           STRING(@d17),AT(4865,0),USE(CON1:FECHA),RIGHT(1)
                           STRING(@n-5),AT(1042,0),USE(SOC1:MATRICULA)
                           STRING(@s100),AT(1760,0,2969),USE(SOC1:NOMBRE)
                           STRING(@n-7),AT(135,0),USE(CON1:IDSOCIO),RIGHT(1)
                           LINE,AT(0,167,6187,0),USE(?LINE4)
                         END
                         FOOTER,AT(0,0,6250,354),USE(?GROUPFOOTER1)
                           STRING('Cantidad Aherentes:'),AT(10,31),USE(?STRING13)
                           STRING(@n-5),AT(1260,31),USE(CON1:IDSOCIO,,?CON1:IDSOCIO:2),RIGHT(1),CNT,RESET(break1)
                           BOX,AT(-10,208,6225,104),USE(?BOX1),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         END
                       END
                       FOOTER,AT(1010,10333,6250,1000),USE(?Footer)
                         STRING('Cantidad de Consultorios:'),AT(10,31),USE(?STRING14)
                         STRING(@n-5),AT(1573,31),USE(CON2:IDCONSULTORIO,,?CON2:IDCONSULTORIO:2),CNT
                         LINE,AT(0,281,6177,0),USE(?Line3:2),COLOR(COLOR:Black)
                         STRING('Fecha del Reporte:'),AT(31,312),USE(?EcFechaReport),FONT('Courier New',7),TRN
                         STRING('DatoEmpresa'),AT(2542,312),USE(?DatoEmpresa),FONT('Courier New',7),TRN
                         STRING('Evolution_Paginas_'),AT(5292,312),USE(?PaginaNdeX),FONT('Courier New',7),TRN
                       END
                       FORM,AT(1000,302,6250,11021),USE(?Form)
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
  GlobalErrors.SetProcedureName('imprimir_consultorio_adherente')
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
  INIMgr.Fetch('imprimir_consultorio_adherente',ProgressWindow) ! Restore window settings from non-volatile store
  TargetSelector.AddItem(XMLReporter.IReportGenerator)
  TargetSelector.AddItem(HTMLReporter.IReportGenerator)
  TargetSelector.AddItem(TXTReporter.IReportGenerator)
  TargetSelector.AddItem(PDFReporter.IReportGenerator)
  SELF.AddItem(TargetSelector)
  ThisReport.Init(Process:View, Relate:CONSULTORIO, ?Progress:PctText, Progress:Thermometer)
  ThisReport.AddSortOrder()
  ThisReport.SetFilter('CON2:FECHA_VTO >= today()  AND CON2:ACTIVO <<> ''NO''')
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:CONSULTORIO.SetQuickScan(1,Propagate:OneMany)
  ProgressWindow{PROP:Timer} = 10                          ! Assign timer interval
  SELF.SkipPreview = False
  Previewer.SetINIManager(INIMgr)
  Previewer.AllowUserZoom = True
  SELF.SetAlerts()
  ThisReport.SetFilter(FILTRO) ! o ThisProcess....
  ThisReport.SetOrder(ORDEN)
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
    INIMgr.Update('imprimir_consultorio_adherente',ProgressWindow) ! Save window data to non-volatile store
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
  SELF.Attribute.Set(?STRING1,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?STRING1,RepGen:XML,TargetAttr:TagName,'STRING1')
  SELF.Attribute.Set(?STRING1,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?CON2:IDCONSULTORIO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?CON2:IDCONSULTORIO,RepGen:XML,TargetAttr:TagName,'CON2:IDCONSULTORIO')
  SELF.Attribute.Set(?CON2:IDCONSULTORIO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?STRING2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?STRING2,RepGen:XML,TargetAttr:TagName,'STRING2')
  SELF.Attribute.Set(?STRING2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?STRING3,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?STRING3,RepGen:XML,TargetAttr:TagName,'STRING3')
  SELF.Attribute.Set(?STRING3,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagName,'SOC:MATRICULA')
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagName,'SOC:NOMBRE')
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?STRING4,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?STRING4,RepGen:XML,TargetAttr:TagName,'STRING4')
  SELF.Attribute.Set(?STRING4,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:DIRECCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:DIRECCION,RepGen:XML,TargetAttr:TagName,'SOC:DIRECCION')
  SELF.Attribute.Set(?SOC:DIRECCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?STRING5,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?STRING5,RepGen:XML,TargetAttr:TagName,'STRING5')
  SELF.Attribute.Set(?STRING5,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?LOC:DESCRIPCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?LOC:DESCRIPCION,RepGen:XML,TargetAttr:TagName,'LOC:DESCRIPCION')
  SELF.Attribute.Set(?LOC:DESCRIPCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?STRING6,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?STRING6,RepGen:XML,TargetAttr:TagName,'STRING6')
  SELF.Attribute.Set(?STRING6,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?CON2:FECHA_VTO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?CON2:FECHA_VTO,RepGen:XML,TargetAttr:TagName,'CON2:FECHA_VTO')
  SELF.Attribute.Set(?CON2:FECHA_VTO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?CON2:TELEFONO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?CON2:TELEFONO,RepGen:XML,TargetAttr:TagName,'CON2:TELEFONO')
  SELF.Attribute.Set(?CON2:TELEFONO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?STRING7,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?STRING7,RepGen:XML,TargetAttr:TagName,'STRING7')
  SELF.Attribute.Set(?STRING7,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?STRING8,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?STRING8,RepGen:XML,TargetAttr:TagName,'STRING8')
  SELF.Attribute.Set(?STRING8,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?STRING9,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?STRING9,RepGen:XML,TargetAttr:TagName,'STRING9')
  SELF.Attribute.Set(?STRING9,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?STRING10,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?STRING10,RepGen:XML,TargetAttr:TagName,'STRING10')
  SELF.Attribute.Set(?STRING10,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?STRING11,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?STRING11,RepGen:XML,TargetAttr:TagName,'STRING11')
  SELF.Attribute.Set(?STRING11,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?STRING12,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?STRING12,RepGen:XML,TargetAttr:TagName,'STRING12')
  SELF.Attribute.Set(?STRING12,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?CON1:FECHA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?CON1:FECHA,RepGen:XML,TargetAttr:TagName,'CON1:FECHA')
  SELF.Attribute.Set(?CON1:FECHA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC1:MATRICULA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC1:MATRICULA,RepGen:XML,TargetAttr:TagName,'SOC1:MATRICULA')
  SELF.Attribute.Set(?SOC1:MATRICULA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC1:NOMBRE,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC1:NOMBRE,RepGen:XML,TargetAttr:TagName,'SOC1:NOMBRE')
  SELF.Attribute.Set(?SOC1:NOMBRE,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?CON1:IDSOCIO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?CON1:IDSOCIO,RepGen:XML,TargetAttr:TagName,'CON1:IDSOCIO')
  SELF.Attribute.Set(?CON1:IDSOCIO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?STRING13,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?STRING13,RepGen:XML,TargetAttr:TagName,'STRING13')
  SELF.Attribute.Set(?STRING13,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?CON1:IDSOCIO:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?CON1:IDSOCIO:2,RepGen:XML,TargetAttr:TagName,'CON1:IDSOCIO:2')
  SELF.Attribute.Set(?CON1:IDSOCIO:2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?STRING14,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?STRING14,RepGen:XML,TargetAttr:TagName,'STRING14')
  SELF.Attribute.Set(?STRING14,RepGen:XML,TargetAttr:TagValueFromText,True)
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
  SELF.SetDocumentInfo('CW Report','Gestion','imprimir_consultorio_adherente','imprimir_consultorio_adherente','','')
  SELF.SetPagesAsParentBookmark(False)
  SELF.SetScanCopyMode(False)
  SELF.CompressText   = True
  SELF.CompressImages = True

!!! <summary>
!!! Generated from procedure template - Window
!!! Actualizacion COBERTURA
!!! </summary>
UpdateCOBERTURA PROCEDURE 

CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
History::COB:Record  LIKE(COB:RECORD),THREAD
QuickWindow          WINDOW('Actualizacion COBERTURA'),AT(,,158,116),FONT('MS Sans Serif',8,,FONT:regular),RESIZE, |
  CENTER,GRAY,IMM,MDI,HLP('UpdateCOBERTURA'),SYSTEM
                       BUTTON('&Aceptar'),AT(51,100,49,14),USE(?OK),LEFT,ICON('ok.ico'),CURSOR('mano.cur'),DEFAULT, |
  FLAT,MSG('Confirma y Actualiza el Formulario'),TIP('Confirma y Actualiza el Formulario')
                       BUTTON('&Cancelar'),AT(105,100,49,14),USE(?Cancel),LEFT,ICON('cancelar.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Cancela Operacion'),TIP('Cancela Operacion')
                       PROMPT('DESCRIPCION:'),AT(5,4),USE(?COB:DESCRIPCION:Prompt),TRN
                       ENTRY(@s20),AT(58,4,84,10),USE(COB:DESCRIPCION)
                       PROMPT('MONTO:'),AT(5,18),USE(?COB:MONTO:Prompt),TRN
                       ENTRY(@n-14),AT(58,19,64,10),USE(COB:MONTO)
                       PROMPT('DESCUENTO:'),AT(5,32),USE(?COB:DESCUENTO:Prompt),TRN
                       ENTRY(@n-14),AT(58,34,64,10),USE(COB:DESCUENTO)
                       PROMPT('INTERES:'),AT(5,49),USE(?COB:INTERES:Prompt)
                       ENTRY(@n-10.2),AT(58,49,64,10),USE(COB:INTERES),DECIMAL(12)
                       OPTION('FORMA PAGO'),AT(1,66,152,28),USE(COB:FORMA_PAGO),BOXED
                         RADIO('ANUAL '),AT(9,79),USE(?COB:FORMA_PAGO:Radio1)
                         RADIO(' MENSUAL'),AT(92,79),USE(?COB:FORMA_PAGO:Radio2)
                       END
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
  GlobalErrors.SetProcedureName('UpdateCOBERTURA')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?OK
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(COB:Record,History::COB:Record)
  SELF.AddHistoryField(?COB:DESCRIPCION,2)
  SELF.AddHistoryField(?COB:MONTO,3)
  SELF.AddHistoryField(?COB:DESCUENTO,4)
  SELF.AddHistoryField(?COB:INTERES,6)
  SELF.AddHistoryField(?COB:FORMA_PAGO,5)
  SELF.AddUpdateFile(Access:COBERTURA)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:COBERTURA.Open                                    ! File COBERTURA used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:COBERTURA
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
    ?COB:DESCRIPCION{PROP:ReadOnly} = True
    ?COB:MONTO{PROP:ReadOnly} = True
    ?COB:DESCUENTO{PROP:ReadOnly} = True
    ?COB:INTERES{PROP:ReadOnly} = True
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdateCOBERTURA',QuickWindow)              ! Restore window settings from non-volatile store
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
    Relate:COBERTURA.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateCOBERTURA',QuickWindow)           ! Save window data to non-volatile store
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
!!! Browse the COBERTURA file
!!! </summary>
BrowseCOBERTURA PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(COBERTURA)
                       PROJECT(COB:IDCOBERTURA)
                       PROJECT(COB:DESCRIPCION)
                       PROJECT(COB:MONTO)
                       PROJECT(COB:DESCUENTO)
                       PROJECT(COB:FORMA_PAGO)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
COB:IDCOBERTURA        LIKE(COB:IDCOBERTURA)          !List box control field - type derived from field
COB:DESCRIPCION        LIKE(COB:DESCRIPCION)          !List box control field - type derived from field
COB:MONTO              LIKE(COB:MONTO)                !List box control field - type derived from field
COB:DESCUENTO          LIKE(COB:DESCUENTO)            !List box control field - type derived from field
COB:FORMA_PAGO         LIKE(COB:FORMA_PAGO)           !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('ABM COBERTURA'),AT(,,280,198),FONT('MS Sans Serif',8,,FONT:regular),RESIZE,CENTER, |
  GRAY,IMM,MDI,HLP('BrowseCOBERTURA'),SYSTEM
                       LIST,AT(8,30,264,124),USE(?Browse:1),HVSCROLL,FORMAT('64R(2)|M~IDCOBERTURA~C(0)@n-14@80' & |
  'L(2)|M~DESCRIPCION~@s20@64R(2)|M~MONTO~C(0)@n-14@64R(2)|M~DESCUENTO~C(0)@n-14@76L(2)' & |
  '|M~FORMA PAGO~C(0)@s19@'),FROM(Queue:Browse:1),IMM,MSG('Administrador de COBERTURA')
                       BUTTON('&Ver'),AT(64,158,49,14),USE(?View:2),LEFT,ICON('v.ico'),CURSOR('mano.cur'),FLAT,MSG('Visualizar'), |
  TIP('Visualizar')
                       BUTTON('&Agregar'),AT(117,158,49,14),USE(?Insert:3),LEFT,ICON('a.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Agrega Registro'),TIP('Agrega Registro')
                       BUTTON('&Cambiar'),AT(170,158,49,14),USE(?Change:3),LEFT,ICON('c.ico'),CURSOR('mano.cur'), |
  DEFAULT,FLAT,MSG('Cambia Registro'),TIP('Cambia Registro')
                       BUTTON('&Borrar'),AT(223,158,49,14),USE(?Delete:3),LEFT,ICON('b.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Borra Registro'),TIP('Borra Registro')
                       SHEET,AT(4,4,272,172),USE(?CurrentTab)
                         TAB('ID'),USE(?Tab:2)
                         END
                         TAB('COBERTURA'),USE(?Tab:3)
                         END
                         TAB('MONTO'),USE(?Tab:4)
                         END
                       END
                       BUTTON('&Salir'),AT(227,180,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Salir'),TIP('Salir')
                       PROMPT('&Orden:'),AT(8,13),USE(?SortOrderList:Prompt)
                       LIST,AT(48,13,75,10),USE(?SortOrderList),DROP(20),FROM(''),MSG('Select the Sort Order'),TIP('Select the' & |
  ' Sort Order')
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
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::Sort1:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 2
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
  GlobalErrors.SetProcedureName('BrowseCOBERTURA')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('COB:IDCOBERTURA',COB:IDCOBERTURA)                  ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:COBERTURA.Open                                    ! File COBERTURA used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:COBERTURA,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?CurrentTab{PROP:WIZARD}=True
  ?SortOrderList{PROP:FROM}=|
                CHOOSE(SUB(?Tab:2{PROP:TEXT},1,1)='&',SUB(?Tab:2{PROP:TEXT},2,LEN(?Tab:2{PROP:TEXT})-1),?Tab:2{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab:3{PROP:TEXT},1,1)='&',SUB(?Tab:3{PROP:TEXT},2,LEN(?Tab:3{PROP:TEXT})-1),?Tab:3{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab:4{PROP:TEXT},1,1)='&',SUB(?Tab:4{PROP:TEXT},2,LEN(?Tab:4{PROP:TEXT})-1),?Tab:4{PROP:TEXT})&|
                ''
  ?SortOrderList{PROP:SELECTED}=1
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,COB:IDX_COBERTURA)                    ! Add the sort order for COB:IDX_COBERTURA for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,COB:DESCRIPCION,,BRW1)         ! Initialize the browse locator using  using key: COB:IDX_COBERTURA , COB:DESCRIPCION
  BRW1.AddSortOrder(,COB:IDX_MONTO)                        ! Add the sort order for COB:IDX_MONTO for sort order 2
  BRW1.AddLocator(BRW1::Sort2:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort2:Locator.Init(,COB:MONTO,,BRW1)               ! Initialize the browse locator using  using key: COB:IDX_MONTO , COB:MONTO
  BRW1.AddSortOrder(,COB:PK_COBERTURA)                     ! Add the sort order for COB:PK_COBERTURA for sort order 3
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 3
  BRW1::Sort0:Locator.Init(,COB:IDCOBERTURA,,BRW1)         ! Initialize the browse locator using  using key: COB:PK_COBERTURA , COB:IDCOBERTURA
  BRW1.AddField(COB:IDCOBERTURA,BRW1.Q.COB:IDCOBERTURA)    ! Field COB:IDCOBERTURA is a hot field or requires assignment from browse
  BRW1.AddField(COB:DESCRIPCION,BRW1.Q.COB:DESCRIPCION)    ! Field COB:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(COB:MONTO,BRW1.Q.COB:MONTO)                ! Field COB:MONTO is a hot field or requires assignment from browse
  BRW1.AddField(COB:DESCUENTO,BRW1.Q.COB:DESCUENTO)        ! Field COB:DESCUENTO is a hot field or requires assignment from browse
  BRW1.AddField(COB:FORMA_PAGO,BRW1.Q.COB:FORMA_PAGO)      ! Field COB:FORMA_PAGO is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowseCOBERTURA',QuickWindow)              ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1                                    ! Will call: UpdateCOBERTURA
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  SELF.SetAlerts()
  IF GLO:NIVEL < 4 THEN
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
    Relate:COBERTURA.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowseCOBERTURA',QuickWindow)           ! Save window data to non-volatile store
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
    UpdateCOBERTURA
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
    OF ?SortOrderList
      EXECUTE(CHOICE(?SortOrderList))
       SELECT(?Tab:2)
       SELECT(?Tab:3)
       SELECT(?Tab:4)
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

!!! <summary>
!!! Generated from procedure template - Window
!!! Actualizacion INGRESOS
!!! </summary>
UpdateINGRESOS PROCEDURE 

CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
LOC:CUENTA           LONG,NAME('IDCUENTA | READONLY')      ! 
loc:monto            STRING(20)                            ! 
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
History::ING:Record  LIKE(ING:RECORD),THREAD
QuickWindow          WINDOW('Actualizacion INGRESOS'),AT(,,351,173),FONT('MS Sans Serif',8,,FONT:regular),RESIZE, |
  CENTER,GRAY,IMM,MDI,HLP('UpdateINGRESOS'),SYSTEM
                       COMBO(@s20),AT(64,6,217,10),USE(CUE:IDCUENTA),DROP(5),FORMAT('23L(2)|M~IDC~@n-5@200L(2)' & |
  '|M~DESCRIPCION~@s50@200L(2)|M~TIPO~@s8@'),FROM(Queue:FileDropCombo),IMM
                       BUTTON('HABILITAR INGRESO'),AT(104,23,101,20),USE(?Button3),LEFT,ICON(ICON:Tick),FLAT
                       ENTRY(@N-14B),AT(63,54,64,10),USE(ING:IDSUBCUENTA),DISABLE
                       BUTTON('...'),AT(129,53,12,12),USE(?CallLookup),DISABLE
                       ENTRY(@N$-13.2),AT(63,69,65,10),USE(ING:MONTO),INS,DISABLE
                       ENTRY(@P####P),AT(63,84,28,10),USE(ING:SUCURSAL)
                       ENTRY(@n-14),AT(95,84,64,10),USE(ING:IDRECIBO)
                       PROMPT('Nº RECIBO:'),AT(5,84),USE(?Prompt6)
                       ENTRY(@n-14),AT(63,99,64,10),USE(ING:IDPROVEEDOR)
                       BUTTON('...'),AT(128,98,12,12),USE(?CallLookup:2)
                       BUTTON('&Aceptar'),AT(249,156,49,14),USE(?OK),LEFT,ICON('ok.ico'),CURSOR('mano.cur'),DEFAULT, |
  DISABLE,FLAT,MSG('Confirma y Actualiza el Formulario'),TIP('Confirma y Actualiza el Formulario')
                       BUTTON('&Cancelar'),AT(301,156,49,14),USE(?Cancel),LEFT,ICON('cancelar.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Cancela Operacion'),TIP('Cancela Operacion')
                       STRING(@s50),AT(146,54,177,10),USE(SUB:DESCRIPCION)
                       STRING(@s50),AT(143,99,179,10),USE(PRO2:DESCRIPCION)
                       PROMPT('IDPROVEEDOR:'),AT(3,99),USE(?ING:IDPROVEEDOR:Prompt)
                       PROMPT('ELEGIR CUENTA:'),AT(3,6),USE(?Prompt4)
                       LINE,AT(1,48,350,0),USE(?Line1),COLOR(COLOR:Black)
                       PROMPT('IDSUBCUENTA:'),AT(3,54),USE(?ING:IDSUBCUENTA:Prompt),TRN
                       PROMPT('OBSERVACION:'),AT(3,114),USE(?ING:OBSERVACION:Prompt),TRN
                       LINE,AT(0,152,351,0),USE(?Line2),COLOR(COLOR:Black)
                       PROMPT('MONTO:'),AT(3,69),USE(?ING:MONTO:Prompt),TRN
                       TEXT,AT(64,119,259,28),USE(ING:OBSERVACION)
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
  GlobalErrors.SetProcedureName('UpdateINGRESOS')
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
  SELF.AddHistoryFile(ING:Record,History::ING:Record)
  SELF.AddHistoryField(?ING:IDSUBCUENTA,3)
  SELF.AddHistoryField(?ING:MONTO,5)
  SELF.AddHistoryField(?ING:SUCURSAL,12)
  SELF.AddHistoryField(?ING:IDRECIBO,13)
  SELF.AddHistoryField(?ING:IDPROVEEDOR,11)
  SELF.AddHistoryField(?ING:OBSERVACION,4)
  SELF.AddUpdateFile(Access:INGRESOS)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:CAJA.Open                                         ! File CAJA used by this procedure, so make sure it's RelationManager is open
  Relate:CUENTAS.Open                                      ! File CUENTAS used by this procedure, so make sure it's RelationManager is open
  Relate:FONDOS.Open                                       ! File FONDOS used by this procedure, so make sure it's RelationManager is open
  Relate:INFORME.Open                                      ! File INFORME used by this procedure, so make sure it's RelationManager is open
  Relate:INGRESOS.Open                                     ! File INGRESOS used by this procedure, so make sure it's RelationManager is open
  Relate:LIBDIARIO.Open                                    ! File LIBDIARIO used by this procedure, so make sure it's RelationManager is open
  Relate:PROVEEDORES.Open                                  ! File PROVEEDORES used by this procedure, so make sure it's RelationManager is open
  Relate:RANKING.Open                                      ! File RANKING used by this procedure, so make sure it's RelationManager is open
  Relate:SUBCUENTAS.Open                                   ! File SUBCUENTAS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:INGRESOS
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
    ?ING:IDSUBCUENTA{PROP:ReadOnly} = True
    DISABLE(?CallLookup)
    ?ING:MONTO{PROP:ReadOnly} = True
    ?ING:SUCURSAL{PROP:ReadOnly} = True
    ?ING:IDRECIBO{PROP:ReadOnly} = True
    ?ING:IDPROVEEDOR{PROP:ReadOnly} = True
    DISABLE(?CallLookup:2)
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdateINGRESOS',QuickWindow)               ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  SELF.AddItem(ToolbarForm)
  FDCB8.Init(CUE:IDCUENTA,?CUE:IDCUENTA,Queue:FileDropCombo.ViewPosition,FDCB8::View:FileDropCombo,Queue:FileDropCombo,Relate:CUENTAS,ThisWindow,GlobalErrors,0,1,0)
  FDCB8.Q &= Queue:FileDropCombo
  FDCB8.AddSortOrder(CUE:PK_CUENTAS)
  FDCB8.SetFilter('CUE:TIPO = ''INGRESO''')
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
    Relate:INFORME.Close
    Relate:INGRESOS.Close
    Relate:LIBDIARIO.Close
    Relate:PROVEEDORES.Close
    Relate:RANKING.Close
    Relate:SUBCUENTAS.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateINGRESOS',QuickWindow)            ! Save window data to non-volatile store
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
      SelectSUBCUENTAS_INGRESOS
      SelectPROVEEDORES
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
      IF CUE:TIPO = 'INGRESO' THEN
          GLO:CUENTA = CUE:IDCUENTA
          ENABLE(?ING:IDSUBCUENTA)
          ENABLE(?ING:MONTO)
          ENABLE(?ING:OBSERVACION)
          ENABLE (?CallLookup)
          ENABLE(?OK)
          DISABLE(?Button3)
          DISABLE(?CUE:IDCUENTA)
      END
    OF ?OK
      If  Self.Request=insertRecord THEN
          ING:IDUSUARIO   =  GLO:IDUSUARIO
          ING:FECHA       =  TODAY()
          ING:HORA        =  CLOCK()
          ING:MES       =  MONTH(TODAY())
          ING:ANO       =  YEAR(TODAY())
          ING:PERIODO   =  ING:ANO&(FORMAT(ING:MES,@N02))
          loc:monto = ING:MONTO
      END
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?ING:IDSUBCUENTA
      SUB:IDSUBCUENTA = ING:IDSUBCUENTA
      IF Access:SUBCUENTAS.TryFetch(SUB:INTEG_113)
        IF SELF.Run(1,SelectRecord) = RequestCompleted
          ING:IDSUBCUENTA = SUB:IDSUBCUENTA
        ELSE
          SELECT(?ING:IDSUBCUENTA)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
      IF Access:INGRESOS.TryValidateField(3)               ! Attempt to validate ING:IDSUBCUENTA in INGRESOS
        SELECT(?ING:IDSUBCUENTA)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?ING:IDSUBCUENTA
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?ING:IDSUBCUENTA{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?CallLookup
      ThisWindow.Update()
      SUB:IDSUBCUENTA = ING:IDSUBCUENTA
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        ING:IDSUBCUENTA = SUB:IDSUBCUENTA
      END
      ThisWindow.Reset(1)
    OF ?ING:IDPROVEEDOR
      IF ING:IDPROVEEDOR OR ?ING:IDPROVEEDOR{PROP:Req}
        PRO2:IDPROVEEDOR = ING:IDPROVEEDOR
        IF Access:PROVEEDORES.TryFetch(PRO2:PK_PROVEEDOR)
          IF SELF.Run(2,SelectRecord) = RequestCompleted
            ING:IDPROVEEDOR = PRO2:IDPROVEEDOR
          ELSE
            SELECT(?ING:IDPROVEEDOR)
            CYCLE
          END
        END
      END
      ThisWindow.Reset()
    OF ?CallLookup:2
      ThisWindow.Update()
      PRO2:IDPROVEEDOR = ING:IDPROVEEDOR
      IF SELF.Run(2,SelectRecord) = RequestCompleted
        ING:IDPROVEEDOR = PRO2:IDPROVEEDOR
      END
      ThisWindow.Reset(1)
    OF ?OK
      ThisWindow.Update()
      IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing THEN
         POST(EVENT:CloseWindow)
      END
      If  Self.Request=insertRecord THEN
              !!! CARGA
          RANKING{PROP:SQL} = 'CALL SP_GEN_INGRESOS_ID'
          NEXT(RANKING)
          ING:IDINGRESO = RAN:C1
          GLO:PAGO = ING:IDINGRESO
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
      
      SUB:IDSUBCUENTA = ING:IDSUBCUENTA
      ACCESS:SUBCUENTAS.TRYFETCH(SUB:INTEG_113)
      !!! AGREGA EN INFORMES
      IF SUB:INFORME = 'SI' THEN
          INF:FECHA        = TODAY()
          INF:HORA         = CLOCK()
          INF:MONTO =  loc:monto
          INF:INFORME      = 'Nº INGRESO :'&ING:IDINGRESO&', Monto: $'&INF:MONTO&' Obs.:'&ING:OBSERVACION
          INF:IDUSUARIO    = GLO:IDUSUARIO
          INF:SUCURSAL     =  ING:SUCURSAL
          INF:IDRECIBO     =  ING:IDRECIBO
          ACCESS:INFORME.INSERT()
      END
      !!! MODIFICA EL FLUJO DE FONDOS
      FON:IDFONDO = SUB:IDFONDO
      ACCESS:FONDOS.TRYFETCH(FON:PK_FONDOS)
      FON:MONTO = FON:MONTO + ING:MONTO
      FON:FECHA = TODAY()
      FON:HORA = CLOCK()
      ACCESS:FONDOS.UPDATE()
      !!!!
      IF SUB:CAJA = 'SI' THEN
          !!! CARGO CAJA
          CAJ:IDSUBCUENTA = SUB:IDSUBCUENTA
          CAJ:IDUSUARIO = GLO:IDUSUARIO
          CAJ:DEBE =  loc:monto
          CAJ:HABER = 0
          CAJ:OBSERVACION = ING:OBSERVACION
          CAJ:FECHA = TODAY()
          CAJ:MES       =  MONTH(TODAY())
          CAJ:ANO       =  YEAR(TODAY())
          CAJ:PERIODO   =  CAJ:ANO&(FORMAT(CAJ:MES,@N02))
          FON:IDFONDO = SUB:IDFONDO
          ACCESS:FONDOS.TRYFETCH(FON:PK_FONDOS)
          CAJ:MONTO = FON:MONTO
          CAJ:SUCURSAL  =   ING:SUCURSAL
          CAJ:RECIBO    =   ING:IDRECIBO
          CAJ:TIPO      =   'INGRESO'
          CAJ:IDTRANSACCION  = GLO:PAGO
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
          LIB:IDSUBCUENTA = ING:IDSUBCUENTA
          LIB:DEBE = loc:monto
          LIB:HABER = 0
          LIB:OBSERVACION = ING:OBSERVACION
          LIB:FECHA = TODAY()
          LIB:HORA = CLOCK()
          LIB:MES       =  MONTH(TODAY())
          LIB:ANO       =  YEAR(TODAY())
          LIB:PERIODO   =  LIB:ANO&(FORMAT(LIB:MES,@N02))
          FON:IDFONDO = SUB:IDFONDO
          ACCESS:FONDOS.TRYFETCH(FON:PK_FONDOS)
          LIB:FONDO = FON:MONTO
          LIB:SUCURSAL       =  ING:SUCURSAL
          LIB:RECIBO         =  ING:IDRECIBO
          LIB:IDPROVEEDOR    =  ING:IDPROVEEDOR
          LIB:TIPO           =  'INGRESO'
          LIB:IDTRANSACCION = GLO:PAGO
  
          !!! DISPARA STORE PROCEDURE
          RANKING{PROP:SQL} = 'CALL SP_GEN_LIBDIARIO_ID'
          NEXT(RANKING)
          LIB:IDLIBDIARIO = RAN:C1
          !!!!!!!!!!!
          ACCESS:LIBDIARIO.INSERT()
          RAN:C1 = 0
      END
      IMPRIMIR_COMPROBANTE_INGRESO
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
!!! Select a SUBCUENTAS Record
!!! </summary>
SelectSUBCUENTAS_INGRESOS PROCEDURE 

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
  GlobalErrors.SetProcedureName('SelectSUBCUENTAS_INGRESOS')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('GLO:CUENTA',GLO:CUENTA)                            ! Added by: BrowseBox(ABC)
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
  BRW1.SetFilter('(SUB:IDCUENTA = GLO:CUENTA)')            ! Apply filter expression to browse
  BRW1.AddField(SUB:DESCRIPCION,BRW1.Q.SUB:DESCRIPCION)    ! Field SUB:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(SUB:IDSUBCUENTA,BRW1.Q.SUB:IDSUBCUENTA)    ! Field SUB:IDSUBCUENTA is a hot field or requires assignment from browse
  BRW1.AddField(SUB:IDCUENTA,BRW1.Q.SUB:IDCUENTA)          ! Field SUB:IDCUENTA is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('SelectSUBCUENTAS_INGRESOS',QuickWindow)    ! Restore window settings from non-volatile store
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
    INIMgr.Update('SelectSUBCUENTAS_INGRESOS',QuickWindow) ! Save window data to non-volatile store
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
!!! Administrador de INGRESOS
!!! </summary>
ABM_INGRESOS PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(INGRESOS)
                       PROJECT(ING:IDINGRESO)
                       PROJECT(ING:MONTO)
                       PROJECT(ING:SUCURSAL)
                       PROJECT(ING:IDRECIBO)
                       PROJECT(ING:IDSUBCUENTA)
                       PROJECT(ING:OBSERVACION)
                       PROJECT(ING:FECHA)
                       PROJECT(ING:HORA)
                       PROJECT(ING:IDPROVEEDOR)
                       JOIN(PRO2:PK_PROVEEDOR,ING:IDPROVEEDOR)
                         PROJECT(PRO2:DESCRIPCION)
                         PROJECT(PRO2:IDPROVEEDOR)
                       END
                       JOIN(USU:PK_USUARIO,ING:IDINGRESO)
                         PROJECT(USU:IDUSUARIO)
                       END
                       JOIN(SUB:INTEG_113,ING:IDSUBCUENTA)
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
ING:IDINGRESO          LIKE(ING:IDINGRESO)            !List box control field - type derived from field
ING:IDINGRESO_Icon     LONG                           !Entry's icon ID
ING:MONTO              LIKE(ING:MONTO)                !List box control field - type derived from field
ING:SUCURSAL           LIKE(ING:SUCURSAL)             !List box control field - type derived from field
ING:IDRECIBO           LIKE(ING:IDRECIBO)             !List box control field - type derived from field
ING:IDSUBCUENTA        LIKE(ING:IDSUBCUENTA)          !List box control field - type derived from field
SUB:DESCRIPCION        LIKE(SUB:DESCRIPCION)          !List box control field - type derived from field
CUE:DESCRIPCION        LIKE(CUE:DESCRIPCION)          !List box control field - type derived from field
CUE:TIPO               LIKE(CUE:TIPO)                 !List box control field - type derived from field
ING:OBSERVACION        LIKE(ING:OBSERVACION)          !List box control field - type derived from field
ING:FECHA              LIKE(ING:FECHA)                !List box control field - type derived from field
ING:HORA               LIKE(ING:HORA)                 !List box control field - type derived from field
ING:IDPROVEEDOR        LIKE(ING:IDPROVEEDOR)          !List box control field - type derived from field
PRO2:DESCRIPCION       LIKE(PRO2:DESCRIPCION)         !List box control field - type derived from field
USU:IDUSUARIO          LIKE(USU:IDUSUARIO)            !List box control field - type derived from field
PRO2:IDPROVEEDOR       LIKE(PRO2:IDPROVEEDOR)         !Related join file key field - type derived from field
SUB:IDSUBCUENTA        LIKE(SUB:IDSUBCUENTA)          !Related join file key field - type derived from field
CUE:IDCUENTA           LIKE(CUE:IDCUENTA)             !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Administrador de INGRESOS'),AT(,,529,273),FONT('MS Sans Serif',8,,FONT:regular),RESIZE, |
  CENTER,GRAY,IMM,MDI,HLP('ABM_INGRESOS'),SYSTEM
                       LIST,AT(8,39,506,177),USE(?Browse:1),HVSCROLL,FORMAT('64R(2)|MI~IDINGRESO~C(0)@n-14@51L' & |
  '|M~MONTO~C@n$-13.2@[27L|M@P####-P@56L|M@n-14@](80)|M~Nº RECIBO~[25L(2)|M~ID SC~C(0)@' & |
  'n-5@127L(2)|M~SUBCUENTA~C(0)@s30@130L(2)|M~CUENTA~C(0)@s30@44L(2)|M~TIPO~C(0)@s10@]|' & |
  'M~CUENTA~208L(2)|M~OBSERVACION~@s50@51L(2)|M~FECHA~C(0)@d17@80L(2)|M~HORA~C(0)@t7@[2' & |
  '5L(2)|M~IDP~C(0)@n-5@200L(2)|M~DESC PROV~C(0)@s50@]|M~Proveedor~56L(2)|M~IDUSUARIO~C(0)@n-14@'), |
  FROM(Queue:Browse:1),IMM,MSG('Administrador de INGRESOS'),VCR
                       BUTTON('&Ver'),AT(337,224,49,14),USE(?View:2),LEFT,ICON('v.ico'),CURSOR('mano.cur'),FLAT,MSG('Visualizar'), |
  TIP('Visualizar')
                       BUTTON('&Agregar'),AT(401,224,49,14),USE(?Insert:3),LEFT,ICON('a.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Agrega Registro'),TIP('Agrega Registro')
                       BUTTON('&Filtro'),AT(2,247,68,18),USE(?Query),LEFT,ICON('qbe.ico'),FLAT
                       BUTTON('E&xportar'),AT(77,247,68,18),USE(?EvoExportar),LEFT,ICON('export.ico'),FLAT
                       BUTTON('Anular Recibo'),AT(261,220,71,21),USE(?Button7),LEFT,ICON('cancel.ico'),FLAT
                       SHEET,AT(0,0,521,243),USE(?CurrentTab)
                         TAB('INGRESOS'),USE(?Tab:2)
                           BUTTON('Anular '),AT(459,222,58,18),USE(?Button6),LEFT,ICON(ICON:Hand),DISABLE,FLAT
                         END
                         TAB('INGRESOS SUBCUENTA'),USE(?Tab:3)
                         END
                         TAB('FECHA'),USE(?Tab:4)
                           PROMPT('FECHA:'),AT(11,23),USE(?ING:FECHA:Prompt)
                           ENTRY(@d17),AT(39,22,60,10),USE(ING:FECHA)
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
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
SetQueueRecord         PROCEDURE(),DERIVED
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
  Q8:FieldPar  = '1,3,4,5,6,7,8,9,10,11,12,13,14,15,'
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
  ADD(QPar8)   ! 29 Gestion035.clw
 !!!!!
 
 
  FREE(QPar28)
       Qp28:F2N  = 'IDINGRESO'
  Qp28:F2P  = '@n-14'
  Qp28:F2T  = '0'
  ADD(QPar28)
       Qp28:F2N  = 'MONTO'
  Qp28:F2P  = '@n-7.2'
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
       Qp28:F2N  = 'ID SC'
  Qp28:F2P  = '@n-5'
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
       Qp28:F2N  = 'IDUSUARIO'
  Qp28:F2P  = '@n-14'
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
  GlobalErrors.SetProcedureName('ABM_INGRESOS')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('USU:IDUSUARIO',USU:IDUSUARIO)                      ! Added by: BrowseBox(ABC)
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
  Relate:INGRESOS.Open                                     ! File INGRESOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:INGRESOS,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  QBE7.Init(QBV7, INIMgr,'ABM_INGRESOS', GlobalErrors)
  QBE7.QkSupport = True
  QBE7.QkMenuIcon = 'QkQBE.ico'
  QBE7.QkIcon = 'QkLoad.ico'
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,ING:FK_INGRESOS_SUBCUENTA)            ! Add the sort order for ING:FK_INGRESOS_SUBCUENTA for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,ING:IDSUBCUENTA,,BRW1)         ! Initialize the browse locator using  using key: ING:FK_INGRESOS_SUBCUENTA , ING:IDSUBCUENTA
  BRW1.AddSortOrder(,ING:IDX_INGRESOS_FECHA)               ! Add the sort order for ING:IDX_INGRESOS_FECHA for sort order 2
  BRW1.AddLocator(BRW1::Sort2:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort2:Locator.Init(?ING:FECHA,ING:FECHA,,BRW1)     ! Initialize the browse locator using ?ING:FECHA using key: ING:IDX_INGRESOS_FECHA , ING:FECHA
  BRW1.AddSortOrder(,ING:PK_INGRESOS)                      ! Add the sort order for ING:PK_INGRESOS for sort order 3
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 3
  BRW1::Sort0:Locator.Init(,ING:IDINGRESO,,BRW1)           ! Initialize the browse locator using  using key: ING:PK_INGRESOS , ING:IDINGRESO
  ?Browse:1{PROP:IconList,1} = '~CANCEL.ICO'
  BRW1.AddField(ING:IDINGRESO,BRW1.Q.ING:IDINGRESO)        ! Field ING:IDINGRESO is a hot field or requires assignment from browse
  BRW1.AddField(ING:MONTO,BRW1.Q.ING:MONTO)                ! Field ING:MONTO is a hot field or requires assignment from browse
  BRW1.AddField(ING:SUCURSAL,BRW1.Q.ING:SUCURSAL)          ! Field ING:SUCURSAL is a hot field or requires assignment from browse
  BRW1.AddField(ING:IDRECIBO,BRW1.Q.ING:IDRECIBO)          ! Field ING:IDRECIBO is a hot field or requires assignment from browse
  BRW1.AddField(ING:IDSUBCUENTA,BRW1.Q.ING:IDSUBCUENTA)    ! Field ING:IDSUBCUENTA is a hot field or requires assignment from browse
  BRW1.AddField(SUB:DESCRIPCION,BRW1.Q.SUB:DESCRIPCION)    ! Field SUB:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(CUE:DESCRIPCION,BRW1.Q.CUE:DESCRIPCION)    ! Field CUE:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(CUE:TIPO,BRW1.Q.CUE:TIPO)                  ! Field CUE:TIPO is a hot field or requires assignment from browse
  BRW1.AddField(ING:OBSERVACION,BRW1.Q.ING:OBSERVACION)    ! Field ING:OBSERVACION is a hot field or requires assignment from browse
  BRW1.AddField(ING:FECHA,BRW1.Q.ING:FECHA)                ! Field ING:FECHA is a hot field or requires assignment from browse
  BRW1.AddField(ING:HORA,BRW1.Q.ING:HORA)                  ! Field ING:HORA is a hot field or requires assignment from browse
  BRW1.AddField(ING:IDPROVEEDOR,BRW1.Q.ING:IDPROVEEDOR)    ! Field ING:IDPROVEEDOR is a hot field or requires assignment from browse
  BRW1.AddField(PRO2:DESCRIPCION,BRW1.Q.PRO2:DESCRIPCION)  ! Field PRO2:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(USU:IDUSUARIO,BRW1.Q.USU:IDUSUARIO)        ! Field USU:IDUSUARIO is a hot field or requires assignment from browse
  BRW1.AddField(PRO2:IDPROVEEDOR,BRW1.Q.PRO2:IDPROVEEDOR)  ! Field PRO2:IDPROVEEDOR is a hot field or requires assignment from browse
  BRW1.AddField(SUB:IDSUBCUENTA,BRW1.Q.SUB:IDSUBCUENTA)    ! Field SUB:IDSUBCUENTA is a hot field or requires assignment from browse
  BRW1.AddField(CUE:IDCUENTA,BRW1.Q.CUE:IDCUENTA)          ! Field CUE:IDCUENTA is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('ABM_INGRESOS',QuickWindow)                 ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.QueryControl = ?Query
  BRW1.UpdateQuery(QBE7,1)
  BRW1.AskProcedure = 1                                    ! Will call: UpdateINGRESOS
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
    Relate:INGRESOS.Close
  END
  IF SELF.Opened
    INIMgr.Update('ABM_INGRESOS',QuickWindow)              ! Save window data to non-volatile store
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
    UpdateINGRESOS
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
    OF ?Button7
      ThisWindow.Update()
      GlobalRequest = ChangeRecord
      ANULAR_INGRESOS()
      ThisWindow.Reset
      BRW1.RESETFROMFILE()
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


BRW1.SetQueueRecord PROCEDURE

  CODE
  PARENT.SetQueueRecord
  
  IF (ING:IDSUBCUENTA = 6)
    SELF.Q.ING:IDINGRESO_Icon = 1                          ! Set icon from icon list
  ELSE
    SELF.Q.ING:IDINGRESO_Icon = 0
  END


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Window
!!! Actualizacion INGRESOS
!!! </summary>
ANULAR_INGRESOS PROCEDURE 

CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
LOC:CUENTA           LONG,NAME('IDCUENTA | READONLY')      ! 
History::ING:Record  LIKE(ING:RECORD),THREAD
QuickWindow          WINDOW('ANULAR RECIBOS'),AT(,,351,62),FONT('MS Sans Serif',8,,FONT:regular),RESIZE,CENTER, |
  GRAY,IMM,MDI,HLP('UpdateINGRESOS'),SYSTEM
                       ENTRY(@N$-13.2),AT(63,18,65,10),USE(ING:MONTO),INS,DISABLE
                       PROMPT('Nº RECIBO:'),AT(5,3),USE(?Prompt6)
                       STRING(@P####-P),AT(53,3),USE(ING:SUCURSAL)
                       STRING(@n-14),AT(78,3),USE(ING:IDRECIBO)
                       BUTTON('&Aceptar'),AT(249,40,49,14),USE(?OK),LEFT,ICON('ok.ico'),CURSOR('mano.cur'),DEFAULT, |
  FLAT,MSG('Confirma y Actualiza el Formulario'),TIP('Confirma y Actualiza el Formulario')
                       BUTTON('&Cancelar'),AT(301,40,49,14),USE(?Cancel),LEFT,ICON('cancelar.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Cancela Operacion'),TIP('Cancela Operacion')
                       LINE,AT(0,33,338,0),USE(?Line2),COLOR(COLOR:Black)
                       PROMPT('MONTO:'),AT(3,18),USE(?ING:MONTO:Prompt),TRN
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
  GlobalErrors.SetProcedureName('ANULAR_INGRESOS')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?ING:MONTO
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(ING:Record,History::ING:Record)
  SELF.AddHistoryField(?ING:MONTO,5)
  SELF.AddHistoryField(?ING:SUCURSAL,12)
  SELF.AddHistoryField(?ING:IDRECIBO,13)
  SELF.AddUpdateFile(Access:INGRESOS)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:CAJA.Open                                         ! File CAJA used by this procedure, so make sure it's RelationManager is open
  Relate:INGRESOS.Open                                     ! File INGRESOS used by this procedure, so make sure it's RelationManager is open
  Relate:LIBDIARIO.Open                                    ! File LIBDIARIO used by this procedure, so make sure it's RelationManager is open
  Relate:RANKING.Open                                      ! File RANKING used by this procedure, so make sure it's RelationManager is open
  Relate:SUBCUENTAS.Open                                   ! File SUBCUENTAS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:INGRESOS
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
    ?ING:MONTO{PROP:ReadOnly} = True
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('ANULAR_INGRESOS',QuickWindow)              ! Restore window settings from non-volatile store
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
    Relate:INGRESOS.Close
    Relate:LIBDIARIO.Close
    Relate:RANKING.Close
    Relate:SUBCUENTAS.Close
  END
  IF SELF.Opened
    INIMgr.Update('ANULAR_INGRESOS',QuickWindow)           ! Save window data to non-volatile store
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
      IF ING:IDSUBCUENTA <> 17 THEN
      
          !!! RESTA EL INGRESO EN FONDO
          SUB:IDSUBCUENTA = ING:IDSUBCUENTA
          ACCESS:SUBCUENTAS.TRYFETCH(SUB:INTEG_113)
          FON:IDFONDO = SUB:IDFONDO
          ACCESS:FONDOS.TRYFETCH(FON:PK_FONDOS)
          FON:MONTO = FON:MONTO - ING:MONTO
          ACCESS:FONDOS.UPDATE()
          !!!!
          ING:IDSUBCUENTA = 17
          ING:MONTO = 0
          !! BUSCO USUARIO
          USU:IDUSUARIO = GLO:IDUSUARIO
          ACCESS:USUARIO.TRYFETCH(USU:PK_USUARIO)
          USUARIO" = CLIP(USU:DESCRIPCION)
          !!
          DIA" = FORMAT(TODAY(),@D6)
          HORA" = FORMAT(CLOCK(),@T4)
          ING:OBSERVACION = 'ANULADO  POR '&CLIP(USUARIO")&', FECHA: '&CLIP(DIA")&', HORA: '&CLIP(HORA")
      
          !!! ANULO EN LIBRO DIARIO
          LIB:TIPO  =         'INGRESO'
          LIB:IDTRANSACCION =  ING:IDINGRESO
          ACCESS:LIBDIARIO.TRYFETCH(LIB:IDX_LIBDIARIO_UNIQUE_TRANSAC)
          LIB:DEBE = 0
          LIB:HABER = 0
          LIB:OBSERVACION = ING:OBSERVACION
          LIB:IDSUBCUENTA = 17
          LIB:FONDO =   FON:MONTO
          ACCESS:LIBDIARIO.UPDATE()
          !!  ANULO EN CAJA
          CAJ:TIPO            = 'INGRESO'
          CAJ:IDTRANSACCION   = ING:IDINGRESO
          GET(CAJA,CAJ:IDX_UNIQUE_TRANSAC)
          IF ERRORCODE() <> 35 THEN
              CAJ:DEBE          = 0
              CAJ:HABER         = 0
              CAJ:OBSERVACION   =  ING:OBSERVACION
              CAJ:IDSUBCUENTA = 17
              CAJ:MONTO = FON:MONTO 
              ACCESS:CAJA.UPDATE()
          END
          !!!!
      ELSE
          MESSAGE ('EL RECIBO YA ESTA ANULADO')
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
!!! Generated from procedure template - Report
!!! </summary>
IMPRIMIR_RECIBOS_EMITIDOS2 PROCEDURE 

Progress:Thermometer BYTE                                  ! 
L:NroReg             LONG                                  ! 
Process:View         VIEW(INGRESOS)
                       PROJECT(ING:FECHA)
                       PROJECT(ING:IDRECIBO)
                       PROJECT(ING:MONTO)
                       PROJECT(ING:OBSERVACION)
                       PROJECT(ING:SUCURSAL)
                       PROJECT(ING:IDSUBCUENTA)
                       PROJECT(ING:IDPROVEEDOR)
                       JOIN(SUB:INTEG_113,ING:IDSUBCUENTA)
                       END
                       JOIN(PRO2:PK_PROVEEDOR,ING:IDPROVEEDOR)
                         PROJECT(PRO2:DESCRIPCION)
                       END
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

Report               REPORT,AT(229,1833,7740,8146),PRE(RPT),PAPER(PAPER:A4),FONT('Arial',8,,FONT:regular,CHARSET:ANSI), |
  THOUS
                       HEADER,AT(219,458,7771,1385),USE(?Header)
                         IMAGE('logo.jpg'),AT(0,42,2010,1073),USE(?Image1)
                         STRING('RECIBOS EMITIDOS '),AT(2938,656),USE(?String7),FONT(,14,,FONT:bold+FONT:underline), |
  TRN
                         STRING(@D6),AT(4990,938),USE(FECHA_HASTA),RIGHT(1)
                         LINE,AT(0,1146,7813,0),USE(?Line2),COLOR(COLOR:Black)
                         STRING('Fecha'),AT(1354,1177),USE(?String14),TRN
                         STRING('Proveedor'),AT(2344,1177),USE(?String13),TRN
                         STRING('Detalle'),AT(5302,1177),USE(?String15),TRN
                         STRING('Nº Recibo'),AT(208,1177),USE(?String12),TRN
                         STRING('Monto'),AT(7292,1177),USE(?String16),TRN
                         LINE,AT(0,1354,7813,0),USE(?Line3),COLOR(COLOR:Black)
                         STRING('Fecha Desde: '),AT(2188,938),USE(?String8),TRN
                         STRING('Fecha Hasta:'),AT(4260,938),USE(?String9),TRN
                         STRING(@D6),AT(2906,938),USE(FECHA_DESDE),RIGHT(1)
                       END
Detail                 DETAIL,AT(0,0,,240),USE(?Detail)
                         STRING(@n-10),AT(354,21),USE(ING:IDRECIBO)
                         STRING(@p####-p),AT(21,21),USE(ING:SUCURSAL)
                         STRING(@s50),AT(1771,0,2083,208),USE(PRO2:DESCRIPCION)
                         STRING(@s50),AT(3958,0,3021,208),USE(ING:OBSERVACION)
                         STRING(@n$-13.2),AT(6979,21),USE(ING:MONTO),RIGHT(12)
                         LINE,AT(10,208,7719,0),USE(?Line1),COLOR(COLOR:Black)
                         STRING(@d17),AT(1156,21),USE(ING:FECHA)
                       END
                       FOOTER,AT(240,9990,7740,1000),USE(?Footer)
                         STRING('Total Monto Recibos en Periodo:'),AT(1833,10),USE(?String20),TRN
                         STRING(@n$-13.2),AT(3490,10),USE(ING:MONTO,,?ING:MONTO:2),SUM
                         LINE,AT(0,208,7708,0),USE(?Line3:2),COLOR(COLOR:Black)
                         STRING('Fecha del Reporte:'),AT(0,313),USE(?EcFechaReport),FONT('Courier New',7),TRN
                         STRING('DatoEmpresa'),AT(3583,313),USE(?DatoEmpresa),FONT('Courier New',7),TRN
                         STRING('Evolution_Paginas_'),AT(6771,313),USE(?PaginaNdeX),FONT('Courier New',7),TRN
                       END
                       FORM,AT(240,469,7750,10521),USE(?Form)
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

ProgressMgr          StepRealClass                         ! Progress Manager
Previewer            CLASS(PrintPreviewClass)              ! Print Previewer
Ask                    PROCEDURE(),DERIVED
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

!Comienzo Codigo CW Templates
!------------------------------------------------------------------------------------------------------------
?Exportarword  EQUATE(-1025)

QHList QUEUE,PRE(QHL)
Id                         SHORT
Nombre                     STRING(100)
Longitud                   SHORT
Pict                       STRING(50)
TextColor             SHORT
TextBack             SHORT
TextFont               STRING(20)
TextFontSize      SHORT
FTextColor             SHORT
FTextBack             SHORT
FTextFont               STRING(20)
FTextFontSize      SHORT
                         END
Titulo                     STRING(100)
QPAR QUEUE,PRE(Q)
FieldPar                 CSTRING(200)
                         END
evo::any     ANY
evo::envio   CSTRING(5000)
evo::path    CSTRING(5000)

Evo::Group  GROUP,PRE()
Evo::Aplication STRING(100)
Evo::Procedure STRING(100)
Evo::Html   BYTE
Evo::xls   BYTE
Evo::doc  BYTE
Evo::Ascii BYTE
Evo::xml   BYTE
Evo:typexport STRING(10)
   END


EVO:QDatos               QUEUE,PRE(QDat)
Col1                       CSTRING(100)
Col2                       CSTRING(100)
Col3                       CSTRING(100)
Col4                       CSTRING(100)
Col5                       CSTRING(100)
Col6                       CSTRING(100)
Col7                       CSTRING(100)
Col8                       CSTRING(100)
Col9                       CSTRING(100)
Col10                      CSTRING(100)
Col11                      CSTRING(100)
Col12                      CSTRING(100)
Col13                      CSTRING(100)
Col14                      CSTRING(100)
Col15                      CSTRING(100)
Col16                      CSTRING(100)
Col17                      CSTRING(100)
Col18                      CSTRING(100)
Col19                      CSTRING(100)
Col20                      CSTRING(100)
Col21                      CSTRING(100)
Col22                      CSTRING(100)
Col23                      CSTRING(100)
Col24                      CSTRING(100)
Col25                      CSTRING(100)
Col26                      CSTRING(100)
Col27                      CSTRING(100)
Col28                      CSTRING(100)
Col29                      CSTRING(100)
Col30                      CSTRING(100)
Col31                      CSTRING(100)
Col32                      CSTRING(100)
Col33                      CSTRING(100)
Col34                      CSTRING(100)
Col35                      CSTRING(100)
Col36                      CSTRING(100)
Col37                      CSTRING(100)
Col38                      CSTRING(100)
Col39                      CSTRING(100)
Col40                      CSTRING(100)
Col41                      CSTRING(100)
Col42                      CSTRING(100)
Col43                      CSTRING(100)
Col44                      CSTRING(100)
Col45                      CSTRING(100)
Col46                      CSTRING(100)
Col47                      CSTRING(100)
Col48                      CSTRING(100)
Col49                      CSTRING(100)
Col50                      CSTRING(100)
 END
!Fin Codigo  CW Templates
!------------------------------------------------------------------------------------------------------------

  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
!---------------------------------------------------------------------------
QCargaExport ROUTINE
!Comienzo Codigo CW Templates
!------------------------------------------------------------------------------------------------------------
             Evo::Any &= WHAT(EVO:QDatos,1)
             Evo::Any  = FECHA_HASTA
             Evo::Any &= WHAT(EVO:QDatos,2)
             Evo::Any  = FECHA_DESDE
             Evo::Any &= WHAT(EVO:QDatos,3)
             Evo::Any  = ING:IDRECIBO
             Evo::Any &= WHAT(EVO:QDatos,4)
             Evo::Any  = ING:SUCURSAL
             Evo::Any &= WHAT(EVO:QDatos,5)
             Evo::Any  = PRO2:DESCRIPCION
             Evo::Any &= WHAT(EVO:QDatos,6)
             Evo::Any  = ING:OBSERVACION
             Evo::Any &= WHAT(EVO:QDatos,7)
             Evo::Any  = ING:MONTO
             Evo::Any &= WHAT(EVO:QDatos,8)
             Evo::Any  = ING:FECHA
             Evo::Any &= WHAT(EVO:QDatos,9)
             Evo::Any  = ING:MONTO
        ADD(EVO:QDatos)
        ASSERT (NOT ErrorCode())
!Fin Codigo  CW Templates
!------------------------------------------------------------------------------------------------------------
CargaParametros ROUTINE
        FREE(QHList)
           QHL:Id      = 1
           QHL:Nombre  = 'FECHA_HASTA'
           QHL:Longitud= 100
           QHL:Pict    = '@d6'
           QHL:TextColor  = 0
           QHL:TextBack   = 0
           QHL:TextFont   = '2'
           QHL:TextFontSize   = 8
           QHL:FTextColor        = 0
           QHL:FTextBack         = 0
           QHL:FTextFont          ='2'
            QHL:FTextFontSize  =8
           ADD(QHList)
           QHL:Id      = 2
           QHL:Nombre  = 'FECHA_DESDE'
           QHL:Longitud= 100
           QHL:Pict    = '@d6'
           QHL:TextColor  = 0
           QHL:TextBack   = 0
           QHL:TextFont   = '2'
           QHL:TextFontSize   = 8
           QHL:FTextColor        = 0
           QHL:FTextBack         = 0
           QHL:FTextFont          ='2'
            QHL:FTextFontSize  =8
           ADD(QHList)
           QHL:Id      = 3
           QHL:Nombre  = 'IDRECIBO'
           QHL:Longitud= 100
           QHL:Pict    = '@n-14'
           QHL:TextColor  = 0
           QHL:TextBack   = 0
           QHL:TextFont   = '2'
           QHL:TextFontSize   = 8
           QHL:FTextColor        = 0
           QHL:FTextBack         = 0
           QHL:FTextFont          ='2'
            QHL:FTextFontSize  =8
           ADD(QHList)
           QHL:Id      = 4
           QHL:Nombre  = 'SUCURSAL'
           QHL:Longitud= 100
           QHL:Pict    = '@n-14'
           QHL:TextColor  = 0
           QHL:TextBack   = 0
           QHL:TextFont   = '2'
           QHL:TextFontSize   = 8
           QHL:FTextColor        = 0
           QHL:FTextBack         = 0
           QHL:FTextFont          ='2'
            QHL:FTextFontSize  =8
           ADD(QHList)
           QHL:Id      = 5
           QHL:Nombre  = 'DESCRIPCION'
           QHL:Longitud= 100
           QHL:Pict    = '@s50'
           QHL:TextColor  = 0
           QHL:TextBack   = 0
           QHL:TextFont   = '2'
           QHL:TextFontSize   = 8
           QHL:FTextColor        = 0
           QHL:FTextBack         = 0
           QHL:FTextFont          ='2'
            QHL:FTextFontSize  =8
           ADD(QHList)
           QHL:Id      = 6
           QHL:Nombre  = 'OBSERVACION'
           QHL:Longitud= 100
           QHL:Pict    = '@s50'
           QHL:TextColor  = 0
           QHL:TextBack   = 0
           QHL:TextFont   = '2'
           QHL:TextFontSize   = 8
           QHL:FTextColor        = 0
           QHL:FTextBack         = 0
           QHL:FTextFont          ='2'
            QHL:FTextFontSize  =8
           ADD(QHList)
           QHL:Id      = 7
           QHL:Nombre  = 'MONTO'
           QHL:Longitud= 100
           QHL:Pict    = '@n-13.2'
           QHL:TextColor  = 0
           QHL:TextBack   = 0
           QHL:TextFont   = '2'
           QHL:TextFontSize   = 8
           QHL:FTextColor        = 0
           QHL:FTextBack         = 0
           QHL:FTextFont          ='2'
            QHL:FTextFontSize  =8
           ADD(QHList)
           QHL:Id      = 8
           QHL:Nombre  = 'FECHA'
           QHL:Longitud= 100
           QHL:Pict    = '@d17'
           QHL:TextColor  = 0
           QHL:TextBack   = 0
           QHL:TextFont   = '2'
           QHL:TextFontSize   = 8
           QHL:FTextColor        = 0
           QHL:FTextBack         = 0
           QHL:FTextFont          ='2'
            QHL:FTextFontSize  =8
           ADD(QHList)
           QHL:Id      = 9
           QHL:Nombre  = 'MONTO'
           QHL:Longitud= 100
           QHL:Pict    = '@n-13.2'
           QHL:TextColor  = 0
           QHL:TextBack   = 0
           QHL:TextFont   = '2'
           QHL:TextFontSize   = 8
           QHL:FTextColor        = 0
           QHL:FTextBack         = 0
           QHL:FTextFont          ='2'
            QHL:FTextFontSize  =8
           ADD(QHList)
        !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        FREE(QPar)
        Q:FieldPar  = '1,2,3,4,5,6,7,8,9,'
        ADD(QPar)!.1.
        Q:FieldPar  = ';'
        ADD(QPar)!.2.
        Q:FieldPar  = 'Spanish'
        ADD(QPar)!.3.
        Q:FieldPar  = ''
        ADD(QPar)!.4.
        Q:FieldPar  = true
        ADD(QPar)!.5.
        Q:FieldPar  = ''
        ADD(QPar)!.6.
        Q:FieldPar  = 9
        ADD(QPar)!.7.
        Q:FieldPar  = 'FREE'
        ADD(QPar)   !.8.
        Titulo = 'Recibos Emitidos'
        Q:FieldPar  = 'REPORT'
        ADD(QPar)   !.9.
        Q:FieldPar  = 1 !Order
         ADD(QPar)   !.10
         Q:FieldPar  = 0
         ADD(QPar)   !.11
         Q:FieldPar  = '1'
         ADD(QPar)   !.12

         Q:FieldPar  = ''
         ADD(QPar)   !.13

         Q:FieldPar  = ''
         ADD(QPar)   !.14

         Q:FieldPar  = ''
         ADD(QPar)   !.15

         Q:FieldPar  = '16'
        ADD(QPar)   !.16

        Q:FieldPar  =  1
        ADD(QPar)   !.17.
        Q:FieldPar  =  2
        ADD(QPar)   !.18.
        Q:FieldPar  =  '2'
        ADD(QPar)   !.19.
        Q:FieldPar  =  12
        ADD(QPar)   !.20.
        Q:FieldPar  = 0 !Exporta a excel sin borrar
        ADD(QPar)     !.21
        Q:FieldPar  = 0         !Nro Pag. Desde Report (BExp)
        ADD(QPar)     !.22
        Q:FieldPar  = 0
        ADD(QPar)     !.23 Caracteres Encoding para xml
        Q:FieldPar  = 1
        ADD(QPar)      !24
        Q:FieldPar  = '13021968'
        ADD(QPar)     !.25
  !---------------------------------------------------------------------------------------------
!!Registration 
        Q:FieldPar  = ' ReportExport'
        ADD(QPar)   ! 26  
        Q:FieldPar  =  ' '
        ADD(QPar)   ! 27  
        Q:FieldPar  =  ' ' 
        ADD(QPar)   ! 28  
        Q:FieldPar  =  'REXPORT' 
        ADD(QPar)   ! 29 Gestion035.clw
        
        !.30 en adelante
      ! 30 en adelante

!!! Parametros Grupo
        Evo::Aplication          = 'Gestion'
        Evo::Procedure          = GlobalErrors.GetProcedureName()& 7
        Evo::Html   = 0
        Evo::xls   = 1
        Evo::doc   = 1
        Evo::xml   = 0
        Evo::Ascii   = 0
        Evo:typexport = 'All'


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('IMPRIMIR_RECIBOS_EMITIDOS2')
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
  INIMgr.Fetch('IMPRIMIR_RECIBOS_EMITIDOS2',ProgressWindow) ! Restore window settings from non-volatile store
  TargetSelector.AddItem(XMLReporter.IReportGenerator)
  TargetSelector.AddItem(HTMLReporter.IReportGenerator)
  TargetSelector.AddItem(TXTReporter.IReportGenerator)
  TargetSelector.AddItem(PDFReporter.IReportGenerator)
  SELF.AddItem(TargetSelector)
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisReport.Init(Process:View, Relate:INGRESOS, ?Progress:PctText, Progress:Thermometer, ProgressMgr, ING:FECHA)
  ThisReport.AddSortOrder(ING:IDX_INGRESOS_FECHA)
  ThisReport.AddRange(ING:FECHA,FECHA_DESDE,FECHA_HASTA)
  ThisReport.AppendOrder('ING:SUCURSAL,ING:IDRECIBO')
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
    INIMgr.Update('IMPRIMIR_RECIBOS_EMITIDOS2',ProgressWindow) ! Save window data to non-volatile store
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
  SELF.Attribute.Set(?String7,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String7,RepGen:XML,TargetAttr:TagName,'String7')
  SELF.Attribute.Set(?String7,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?FECHA_HASTA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?FECHA_HASTA,RepGen:XML,TargetAttr:TagName,'FECHA_HASTA')
  SELF.Attribute.Set(?FECHA_HASTA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String14,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String14,RepGen:XML,TargetAttr:TagName,'String14')
  SELF.Attribute.Set(?String14,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String13,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String13,RepGen:XML,TargetAttr:TagName,'String13')
  SELF.Attribute.Set(?String13,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String15,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String15,RepGen:XML,TargetAttr:TagName,'String15')
  SELF.Attribute.Set(?String15,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String12,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String12,RepGen:XML,TargetAttr:TagName,'String12')
  SELF.Attribute.Set(?String12,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String16,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String16,RepGen:XML,TargetAttr:TagName,'String16')
  SELF.Attribute.Set(?String16,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String8,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String8,RepGen:XML,TargetAttr:TagName,'String8')
  SELF.Attribute.Set(?String8,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String9,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String9,RepGen:XML,TargetAttr:TagName,'String9')
  SELF.Attribute.Set(?String9,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?FECHA_DESDE,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?FECHA_DESDE,RepGen:XML,TargetAttr:TagName,'FECHA_DESDE')
  SELF.Attribute.Set(?FECHA_DESDE,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?ING:IDRECIBO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ING:IDRECIBO,RepGen:XML,TargetAttr:TagName,'ING:IDRECIBO')
  SELF.Attribute.Set(?ING:IDRECIBO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?ING:SUCURSAL,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ING:SUCURSAL,RepGen:XML,TargetAttr:TagName,'ING:SUCURSAL')
  SELF.Attribute.Set(?ING:SUCURSAL,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PRO2:DESCRIPCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PRO2:DESCRIPCION,RepGen:XML,TargetAttr:TagName,'PRO2:DESCRIPCION')
  SELF.Attribute.Set(?PRO2:DESCRIPCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?ING:OBSERVACION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ING:OBSERVACION,RepGen:XML,TargetAttr:TagName,'ING:OBSERVACION')
  SELF.Attribute.Set(?ING:OBSERVACION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?ING:MONTO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ING:MONTO,RepGen:XML,TargetAttr:TagName,'ING:MONTO')
  SELF.Attribute.Set(?ING:MONTO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?ING:FECHA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ING:FECHA,RepGen:XML,TargetAttr:TagName,'ING:FECHA')
  SELF.Attribute.Set(?ING:FECHA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String20,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String20,RepGen:XML,TargetAttr:TagName,'String20')
  SELF.Attribute.Set(?String20,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?ING:MONTO:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ING:MONTO:2,RepGen:XML,TargetAttr:TagName,'ING:MONTO:2')
  SELF.Attribute.Set(?ING:MONTO:2,RepGen:XML,TargetAttr:TagValueFromText,True)
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
   Do QCargaExport
  RETURN ReturnValue


Previewer.Ask PROCEDURE

  CODE
  
  !!! Evolution Consulting FREE Templates Start!!!
    L:NroReg = Records(SELF.ImageQueue)
    EvoP_P(SELF.ImageQueue,L:NroReg)        
  
  !!! Evolution Consulting FREE Templates End!!!
  PARENT.Ask


Previewer.Open PROCEDURE

  CODE
  PARENT.Open
  !Comienzo Codigo CW Templates
  !------------------------------------------------------------------------------------------------------------
    CREATE(?Exportarword,CREATE:Item)
    ?Exportarword{PROP:Use} = LASTFIELD()+300
    ?Exportarword{PROP:Text} = 'Exportacion'
    UNHIDE(?Exportarword)
  !Fin Codigo  CW Templates
  !------------------------------------------------------------------------------------------------------------


Previewer.TakeEvent PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeEvent()
  CASE EVENT()
    OF EVENT:Accepted
      CASE FIELD()
        OF ?Exportarword
  !Comienzo Codigo CW Templates
  !------------------------------------------------------------------------------------------------------------
          Do CargaParametros
              evo::path  = PATH()
              EcRptExport(QHList,EVO:QDatos,QPar,0,Titulo,Evo::Group)
              SETPATH(evo::path)
      END!CASE
  END!CASE
  RETURN Level:Benign
  !Fin Codigo  CW Templates
  !------------------------------------------------------------------------------------------------------------
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
  SELF.SetDocumentInfo('CW Report','Gestion','IMPRIMIR_RECIBOS_EMITIDOS2','IMPRIMIR_RECIBOS_EMITIDOS2','','')
  SELF.SetPagesAsParentBookmark(False)
  SELF.SetScanCopyMode(False)
  SELF.CompressText   = True
  SELF.CompressImages = True

!!! <summary>
!!! Generated from procedure template - Window
!!! </summary>
RECIBOS_EMITIDOS_WINDOWS PROCEDURE 

Window               WINDOW('LISTADO DE RECIBOS EMITIDOS'),AT(,,256,90),FONT('MS Sans Serif',8,,FONT:regular),CENTER, |
  GRAY
                       PROMPT('FECHA DESDE:'),AT(12,8),USE(?FECHA_DESDE:Prompt)
                       ENTRY(@D6),AT(67,8,60,10),USE(FECHA_DESDE),RIGHT(1)
                       PROMPT('FECHA HASTA:'),AT(134,9),USE(?FECHA_HASTA:Prompt)
                       ENTRY(@D6),AT(190,9,60,10),USE(FECHA_HASTA),RIGHT(1)
                       BUTTON('Imprimir '),AT(99,36,58,22),USE(?Button2),LEFT,ICON(ICON:Print1),FLAT
                       BUTTON('&SALIR'),AT(103,62,58,22),USE(?CancelButton),LEFT,ICON('SALIR.ICO'),FLAT
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass

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
  GlobalErrors.SetProcedureName('RECIBOS_EMITIDOS_WINDOWS')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?FECHA_DESDE:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  Relate:RANKING.Open                                      ! File RANKING used by this procedure, so make sure it's RelationManager is open
  Relate:SQL.Open                                          ! File SQL used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(Window)                                        ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('RECIBOS_EMITIDOS_WINDOWS',Window)          ! Restore window settings from non-volatile store
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:RANKING.Close
    Relate:SQL.Close
  END
  IF SELF.Opened
    INIMgr.Update('RECIBOS_EMITIDOS_WINDOWS',Window)       ! Save window data to non-volatile store
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
    OF ?CancelButton
       POST(EVENT:CloseWindow)
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Button2
      ThisWindow.Update()
      START(IMPRIMIR_RECIBOS_EMITIDOS2, 25000)
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

