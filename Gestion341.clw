

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABPRHTML.INC'),ONCE
   INCLUDE('ABPRPDF.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('abprtext.inc'),ONCE
   INCLUDE('abprxml.inc'),ONCE
   INCLUDE('abrppsel.inc'),ONCE

                     MAP
                       INCLUDE('GESTION341.INC'),ONCE        !Local module procedure declarations
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

