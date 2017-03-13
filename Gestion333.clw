

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPRHTML.INC'),ONCE
   INCLUDE('ABPRPDF.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('abprtext.inc'),ONCE
   INCLUDE('abprxml.inc'),ONCE
   INCLUDE('abrppsel.inc'),ONCE

                     MAP
                       INCLUDE('GESTION333.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Report
!!! </summary>
IMPRIMIR_CONSTANCIA PROCEDURE 

Progress:Thermometer BYTE                                  ! 
L:NroReg             LONG                                  ! 
Process:View         VIEW(CONSULTORIO)
                       PROJECT(CON2:DIRECCION)
                       PROJECT(CON2:FECHA)
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
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

Report               REPORT,AT(500,2292,7240,7396),PRE(RPT),PAPER(PAPER:A4),FONT('Arial',12,,FONT:regular,CHARSET:ANSI), |
  THOUS
                       HEADER,AT(469,479,7271,1813),USE(?Header),FONT('Arial',10,,FONT:bold,CHARSET:ANSI)
                         IMAGE('Logo.jpg'),AT(42,31,1792,1521),USE(?Image1)
                         STRING('Ley:'),AT(1896,1354),USE(?String3),TRN
                         STRING(@s10),AT(2271,1354),USE(GLO:LEY)
                         STRING('Per. Jur.'),AT(3740,1354),USE(?String4),TRN
                         STRING(@s10),AT(4583,1354),USE(GLO:PER_JUR)
                         STRING(@s255),AT(10,1563,7260,208),USE(GLO:DIRECCION),CENTER
                         LINE,AT(10,1771,7250,0),USE(?Line1),COLOR(COLOR:Black)
                       END
Detail                 DETAIL,AT(0,0,,5010),USE(?Detail)
                         STRING('Matricula: '),AT(73,250),USE(?String23),TRN
                         STRING(@s100),AT(2896,250,4292,229),USE(SOC:NOMBRE)
                         STRING('Dirección: '),AT(73,510),USE(?String27),TRN
                         STRING(@s50),AT(865,521,4760,229),USE(CON2:DIRECCION)
                         STRING('Localidad: '),AT(52,813),USE(?String29),TRN
                         STRING(@s50),AT(906,823),USE(LOC:DESCRIPCION)
                         GROUP('Datos de Consultorio a Habilitar '),AT(10,0,7229,1177),USE(?Group1),BOXED,TRN
                         END
                         STRING('Apellido y Nombre:'),AT(1479,240),USE(?String25),TRN
                         STRING(@n-5),AT(781,229,615,229),USE(SOC:MATRICULA)
                         STRING('Por medio de la presente dejo constancia, en carácter de declaración jurada, qu' & |
  'e las descripciones'),AT(10,1198,7208,229),USE(?String6),TRN
                         STRING('técnicas, las documentales aportadas y/o fotografías ilustrativas que adjunto a' & |
  ' la presente solicitud'),AT(10,1479,7448,229),USE(?String7),TRN
                         STRING('de habilitación de consultorio por ante las autoridades del Colegio de Psicólog' & |
  'os del Valle Inferior'),AT(10,1760,7208,229),USE(?String8),TRN
                         STRING('de la Provincia de Río Negro, en fecha'),AT(10,2042),USE(?String10),TRN
                         STRING(', dan cuenta fehaciente de las condiciones'),AT(3792,2042),USE(?String18),TRN
                         STRING(@d17),AT(2854,2042),USE(CON2:FECHA)
                         STRING('actuales del consultorio a ser habilitado.'),AT(10,2323),USE(?String11),TRN
                         STRING('Asimismo dejo expresado mi compromiso de dar notificación fehaciente de todo cambio'), |
  AT(10,2604),USE(?String12),TRN
                         STRING('o modificación que se presente en el lugar de prestación del servicio que conforme esta'), |
  AT(10,2885),USE(?String13),TRN
                         STRING(' presentación se efectúe a futuro.'),AT(10,3188),USE(?String14),TRN
                         STRING('En la Ciudad de Viedma, '),AT(31,3510),USE(?String15),TRN
                         STRING(@s50),AT(2010,3510,4781,229),USE(GLO:FECHA_LARGO)
                         STRING('Aclaración y Firma Matriculado: .{80}'),AT(1573,4615),USE(?String17),TRN
                       END
                       FOOTER,AT(479,9677,7260,1323),USE(?Footer)
                         LINE,AT(10,10,7271,0),USE(?Line3),COLOR(COLOR:Black)
                         STRING('Fecha del Reporte:'),AT(10,42),USE(?EcFechaReport),FONT('Courier New',7),TRN
                         STRING('DatoEmpresa'),AT(2115,42),USE(?DatoEmpresa),FONT('Courier New',7),TRN
                         STRING('Evolution_Paginas_'),AT(5625,42),USE(?PaginaNdeX),FONT('Courier New',7),TRN
                       END
                       FORM,AT(479,479,7250,10510),USE(?Form)
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
  GlobalErrors.SetProcedureName('IMPRIMIR_CONSTANCIA')
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
  INIMgr.Fetch('IMPRIMIR_CONSTANCIA',ProgressWindow)       ! Restore window settings from non-volatile store
  TargetSelector.AddItem(XMLReporter.IReportGenerator)
  TargetSelector.AddItem(HTMLReporter.IReportGenerator)
  TargetSelector.AddItem(TXTReporter.IReportGenerator)
  TargetSelector.AddItem(PDFReporter.IReportGenerator)
  SELF.AddItem(TargetSelector)
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisReport.Init(Process:View, Relate:CONSULTORIO, ?Progress:PctText, Progress:Thermometer, ProgressMgr, CON2:IDCONSULTORIO)
  ThisReport.AddSortOrder(CON2:PK_CONSULTORIO)
  ThisReport.AddRange(CON2:IDCONSULTORIO,GLO:IDSOLICITUD)
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:CONSULTORIO.SetQuickScan(1,Propagate:OneMany)
  ProgressWindow{PROP:Timer} = 10                          ! Assign timer interval
  SELF.SkipPreview = False
  Previewer.SetINIManager(INIMgr)
  Previewer.AllowUserZoom = True
  SELF.SetAlerts()
  EXECUTE (TODAY() % 7) + 1
  GLO:DIA_REPORT= 'Domingo'
  GLO:DIA_REPORT= 'Lunes'
  GLO:DIA_REPORT= 'Martes'
  GLO:DIA_REPORT= 'Miercoles'
  GLO:DIA_REPORT= 'Jueves'
  GLO:DIA_REPORT= 'Viernes'
  GLO:DIA_REPORT= 'Sabado'
  END
  
  EXECUTE (MONTH(TODAY()))
  GLO:MES_REPORT = 'Enero'
  GLO:MES_REPORT = 'Febrero'
  GLO:MES_REPORT = 'Marzo'
  GLO:MES_REPORT = 'Abril'
  GLO:MES_REPORT = 'Mayo'
  GLO:MES_REPORT = 'Junio'
  GLO:MES_REPORT = 'Julio'
  GLO:MES_REPORT = 'Agosto'
  GLO:MES_REPORT = 'Septiembre'
  GLO:MES_REPORT = 'Octubre'
  GLO:MES_REPORT = 'Noviembre'
  GLO:MES_REPORT = 'Diciembre'
  END
  GLO:ANO_REPORT = Year(today())
  
  GLO:FECHA_LARGO = CLIP(GLO:DIA_REPORT) & ' ' & DAY(TODAY()) & ' de ' &CLIP(GLO:MES_REPORT)&' '&Year(today())
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
    INIMgr.Update('IMPRIMIR_CONSTANCIA',ProgressWindow)    ! Save window data to non-volatile store
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
  SELF.Attribute.Set(?String3,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String3,RepGen:XML,TargetAttr:TagName,'String3')
  SELF.Attribute.Set(?String3,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?GLO:LEY,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GLO:LEY,RepGen:XML,TargetAttr:TagName,'GLO:LEY')
  SELF.Attribute.Set(?GLO:LEY,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String4,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String4,RepGen:XML,TargetAttr:TagName,'String4')
  SELF.Attribute.Set(?String4,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?GLO:PER_JUR,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GLO:PER_JUR,RepGen:XML,TargetAttr:TagName,'GLO:PER_JUR')
  SELF.Attribute.Set(?GLO:PER_JUR,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?GLO:DIRECCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GLO:DIRECCION,RepGen:XML,TargetAttr:TagName,'GLO:DIRECCION')
  SELF.Attribute.Set(?GLO:DIRECCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String23,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String23,RepGen:XML,TargetAttr:TagName,'String23')
  SELF.Attribute.Set(?String23,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagName,'SOC:NOMBRE')
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String27,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String27,RepGen:XML,TargetAttr:TagName,'String27')
  SELF.Attribute.Set(?String27,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?CON2:DIRECCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?CON2:DIRECCION,RepGen:XML,TargetAttr:TagName,'CON2:DIRECCION')
  SELF.Attribute.Set(?CON2:DIRECCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String29,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String29,RepGen:XML,TargetAttr:TagName,'String29')
  SELF.Attribute.Set(?String29,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?LOC:DESCRIPCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?LOC:DESCRIPCION,RepGen:XML,TargetAttr:TagName,'LOC:DESCRIPCION')
  SELF.Attribute.Set(?LOC:DESCRIPCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?Group1,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?Group1,RepGen:XML,TargetAttr:TagNameFromText,True)
  SELF.Attribute.Set(?String25,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String25,RepGen:XML,TargetAttr:TagName,'String25')
  SELF.Attribute.Set(?String25,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagName,'SOC:MATRICULA')
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String6,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String6,RepGen:XML,TargetAttr:TagName,'String6')
  SELF.Attribute.Set(?String6,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String7,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String7,RepGen:XML,TargetAttr:TagName,'String7')
  SELF.Attribute.Set(?String7,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String8,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String8,RepGen:XML,TargetAttr:TagName,'String8')
  SELF.Attribute.Set(?String8,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String10,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String10,RepGen:XML,TargetAttr:TagName,'String10')
  SELF.Attribute.Set(?String10,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String18,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String18,RepGen:XML,TargetAttr:TagName,'String18')
  SELF.Attribute.Set(?String18,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?CON2:FECHA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?CON2:FECHA,RepGen:XML,TargetAttr:TagName,'CON2:FECHA')
  SELF.Attribute.Set(?CON2:FECHA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String11,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String11,RepGen:XML,TargetAttr:TagName,'String11')
  SELF.Attribute.Set(?String11,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String12,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String12,RepGen:XML,TargetAttr:TagName,'String12')
  SELF.Attribute.Set(?String12,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String13,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String13,RepGen:XML,TargetAttr:TagName,'String13')
  SELF.Attribute.Set(?String13,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String14,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String14,RepGen:XML,TargetAttr:TagName,'String14')
  SELF.Attribute.Set(?String14,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String15,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String15,RepGen:XML,TargetAttr:TagName,'String15')
  SELF.Attribute.Set(?String15,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?GLO:FECHA_LARGO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GLO:FECHA_LARGO,RepGen:XML,TargetAttr:TagName,'GLO:FECHA_LARGO')
  SELF.Attribute.Set(?GLO:FECHA_LARGO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String17,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String17,RepGen:XML,TargetAttr:TagName,'String17')
  SELF.Attribute.Set(?String17,RepGen:XML,TargetAttr:TagValueFromText,True)
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
  SELF.SetDocumentInfo('CW Report','Gestion','IMPRIMIR_CONSTANCIA','IMPRIMIR_CONSTANCIA','','')
  SELF.SetPagesAsParentBookmark(False)
  SELF.SetScanCopyMode(False)
  SELF.CompressText   = True
  SELF.CompressImages = True

