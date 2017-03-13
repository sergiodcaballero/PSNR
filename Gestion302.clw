

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPRHTML.INC'),ONCE
   INCLUDE('ABPRPDF.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('abprtext.inc'),ONCE
   INCLUDE('abprxml.inc'),ONCE
   INCLUDE('abrppsel.inc'),ONCE

                     MAP
                       INCLUDE('GESTION302.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Report
!!! </summary>
IMPRIMIR_RENUNCIA_DEFINITIVA PROCEDURE 

Progress:Thermometer BYTE                                  ! 
Process:View         VIEW(RENUNCIA)
                       PROJECT(REN:ACTA)
                       PROJECT(REN:FECHA)
                       PROJECT(REN:FOLIO)
                       PROJECT(REN:IDSOCIO)
                       PROJECT(REN:LIBRO)
                       JOIN(SOC:PK_SOCIOS,REN:IDSOCIO)
                         PROJECT(SOC:MATRICULA)
                         PROJECT(SOC:NOMBRE)
                         PROJECT(SOC:IDTIPOTITULO)
                         JOIN(TIP6:PK_TIPO_TITULO,SOC:IDTIPOTITULO)
                           PROJECT(TIP6:CORTO)
                         END
                       END
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

Report               REPORT,AT(1000,2031,6250,8313),PRE(RPT),PAPER(PAPER:A4),FONT('Arial',10,,FONT:regular,CHARSET:ANSI), |
  THOUS
                       HEADER,AT(1000,1000,6250,1156),USE(?Header)
                         IMAGE('Logo.JPG'),AT(10,31,1490,708),USE(?Image1)
                         STRING(@s255),AT(83,729,6177,208),USE(GLO:DIRECCION),CENTER,TRN
                         BOX,AT(10,948,6438,52),USE(?Box1),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                       END
Detail                 DETAIL,AT(0,0,,7083),USE(?Detail)
                         STRING('Registrado en el Libro Nro.:'),AT(833,1635),USE(?String34),TRN
                         STRING(@n-7),AT(3688,1635),USE(REN:FOLIO)
                         STRING('Vista su Solicitud de Cancelación de inscripción en la matrícula profesional en' & |
  ' virtud de RENUNCIA '),AT(42,2052),USE(?String48),TRN
                         STRING('CONSIDERANDO que esta circunstancia se encuentra prevista en el estatuto de est' & |
  'e colegio.'),AT(42,2469),USE(?String49),TRN
                         STRING('Por todo ello la MESA DIRECTIVA DEL COL DE PISCOLOGOS DEL VALLE INFERIOR RIO NEGRO'), |
  AT(31,3292),USE(?String55),TRN
                         STRING('RESUELVE'),AT(2760,3948),USE(?String57),FONT(,,,FONT:italic),TRN
                         STRING('1) Cancelar la inscripción de '),AT(31,4365),USE(?String58),TRN
                         STRING(@s30),AT(1802,4365),USE(SOC:NOMBRE,,?SOC:NOMBRE:2)
                         STRING('2) Se hace constar que la fecha de cancelación de matrícula está libre de deuda' & |
  's y antecendentes'),AT(31,4781),USE(?String60),TRN
                         STRING('ético- profesionales.'),AT(31,5198),USE(?String61),TRN
                         STRING('al'),AT(4188,4365),USE(?String59),TRN
                         STRING(@d17),AT(4531,4365),USE(REN:FECHA)
                         STRING(', por esta mesa directiva.'),AT(4208,1635),USE(?String46),TRN
                         STRING(@s10),AT(2500,1635),USE(REN:LIBRO)
                         LINE,AT(3927,6562,2125,0),USE(?Line1),COLOR(COLOR:Black)
                         STRING('Presidente'),AT(4729,6740),USE(?String51),TRN
                         STRING('Secretario'),AT(823,6740),USE(?String32),TRN
                         LINE,AT(219,6552,2125,0),USE(?Line4),COLOR(COLOR:Black)
                         STRING('Folio:'),AT(3323,1635),USE(?String35),TRN
                         STRING('VIEDMA,'),AT(2979,21),USE(?String25),TRN
                         STRING(@s50),AT(3719,21),USE(GLO:FECHA_LARGO)
                         STRING(@S14),AT(5073,406),USE(SOC:MATRICULA),LEFT
                         STRING('Ref. Cancelación de Matrícula profesional Nro.: '),AT(2219,406),USE(?String42),TRN
                         STRING(@s10),AT(1740,813),USE(TIP6:CORTO),TRN
                         STRING('Para su conocimiento y efectos, informo a continuación la Resolución adoptada s' & |
  'egún el Acta Nro.'),AT(42,1219),USE(?String45),TRN
                         STRING(@s10),AT(42,1635),USE(REN:ACTA)
                         STRING(@s30),AT(2573,813),USE(SOC:NOMBRE)
                       END
                       FOOTER,AT(1000,10344,6250,1146),USE(?Footer)
                       END
                       FORM,AT(990,1000,6250,10479),USE(?Form)
                       END
                     END
ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
OpenReport             PROCEDURE(),BYTE,PROC,DERIVED
SetStaticControlsAttributes PROCEDURE(),DERIVED
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
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
  GlobalErrors.SetProcedureName('IMPRIMIR_RENUNCIA_DEFINITIVA')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:RENUNCIA.Open                                     ! File RENUNCIA used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('IMPRIMIR_RENUNCIA_DEFINITIVA',ProgressWindow) ! Restore window settings from non-volatile store
  TargetSelector.AddItem(XMLReporter.IReportGenerator)
  TargetSelector.AddItem(HTMLReporter.IReportGenerator)
  TargetSelector.AddItem(TXTReporter.IReportGenerator)
  TargetSelector.AddItem(PDFReporter.IReportGenerator)
  SELF.AddItem(TargetSelector)
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisReport.Init(Process:View, Relate:RENUNCIA, ?Progress:PctText, Progress:Thermometer, ProgressMgr, REN:IDSOCIO)
  ThisReport.AddSortOrder(REN:FK_RENUNCIA_SOCIOS)
  ThisReport.AddRange(REN:IDSOCIO,GLO:IDSOCIO)
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:RENUNCIA.SetQuickScan(1,Propagate:OneMany)
  ProgressWindow{PROP:Timer} = 10                          ! Assign timer interval
  SELF.SkipPreview = False
  Previewer.SetINIManager(INIMgr)
  Previewer.AllowUserZoom = True
  SELF.SetAlerts()
  EXECUTE (TODAY() % 7) + 1
  Dia"= 'Domingo'
  Dia"= 'Lunes'
  Dia"= 'Martes'
  Dia"= 'Miercoles'
  Dia"= 'Jueves'
  Dia"= 'Viernes'
  Dia"= 'Sabado'
  END
  
  EXECUTE (MONTH(TODAY()))
  Mes" = 'Enero'
  Mes" = 'Febrero'
  Mes" = 'Marzo'
  Mes" = 'Abril'
  Mes" = 'Mayo'
  Mes" = 'Junio'
  Mes" = 'Julio'
  Mes" = 'Agosto'
  Mes" = 'Septiembre'
  Mes" = 'Octubre'
  Mes" = 'Noviembre'
  Mes" = 'Diciembre'
  END
  GLO:FECHA_LARGO = CLIP(Dia") & ' ' & DAY(TODAY()) & ' de ' &CLIP(Mes")&' '&Year(today())
  
  
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
    INIMgr.Update('IMPRIMIR_RENUNCIA_DEFINITIVA',ProgressWindow) ! Save window data to non-volatile store
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
  SELF.Attribute.Set(?GLO:DIRECCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GLO:DIRECCION,RepGen:XML,TargetAttr:TagName,'GLO:DIRECCION')
  SELF.Attribute.Set(?GLO:DIRECCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String34,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String34,RepGen:XML,TargetAttr:TagName,'String34')
  SELF.Attribute.Set(?String34,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?REN:FOLIO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?REN:FOLIO,RepGen:XML,TargetAttr:TagName,'REN:FOLIO')
  SELF.Attribute.Set(?REN:FOLIO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String48,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String48,RepGen:XML,TargetAttr:TagName,'String48')
  SELF.Attribute.Set(?String48,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String49,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String49,RepGen:XML,TargetAttr:TagName,'String49')
  SELF.Attribute.Set(?String49,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String55,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String55,RepGen:XML,TargetAttr:TagName,'String55')
  SELF.Attribute.Set(?String55,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String57,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String57,RepGen:XML,TargetAttr:TagName,'String57')
  SELF.Attribute.Set(?String57,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String58,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String58,RepGen:XML,TargetAttr:TagName,'String58')
  SELF.Attribute.Set(?String58,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:NOMBRE:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:NOMBRE:2,RepGen:XML,TargetAttr:TagName,'SOC:NOMBRE:2')
  SELF.Attribute.Set(?SOC:NOMBRE:2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String60,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String60,RepGen:XML,TargetAttr:TagName,'String60')
  SELF.Attribute.Set(?String60,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String61,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String61,RepGen:XML,TargetAttr:TagName,'String61')
  SELF.Attribute.Set(?String61,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String59,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String59,RepGen:XML,TargetAttr:TagName,'String59')
  SELF.Attribute.Set(?String59,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?REN:FECHA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?REN:FECHA,RepGen:XML,TargetAttr:TagName,'REN:FECHA')
  SELF.Attribute.Set(?REN:FECHA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String46,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String46,RepGen:XML,TargetAttr:TagName,'String46')
  SELF.Attribute.Set(?String46,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?REN:LIBRO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?REN:LIBRO,RepGen:XML,TargetAttr:TagName,'REN:LIBRO')
  SELF.Attribute.Set(?REN:LIBRO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String51,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String51,RepGen:XML,TargetAttr:TagName,'String51')
  SELF.Attribute.Set(?String51,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String32,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String32,RepGen:XML,TargetAttr:TagName,'String32')
  SELF.Attribute.Set(?String32,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String35,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String35,RepGen:XML,TargetAttr:TagName,'String35')
  SELF.Attribute.Set(?String35,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String25,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String25,RepGen:XML,TargetAttr:TagName,'String25')
  SELF.Attribute.Set(?String25,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?GLO:FECHA_LARGO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GLO:FECHA_LARGO,RepGen:XML,TargetAttr:TagName,'GLO:FECHA_LARGO')
  SELF.Attribute.Set(?GLO:FECHA_LARGO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagName,'SOC:MATRICULA')
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String42,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String42,RepGen:XML,TargetAttr:TagName,'String42')
  SELF.Attribute.Set(?String42,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?TIP6:CORTO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?TIP6:CORTO,RepGen:XML,TargetAttr:TagName,'TIP6:CORTO')
  SELF.Attribute.Set(?TIP6:CORTO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String45,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String45,RepGen:XML,TargetAttr:TagName,'String45')
  SELF.Attribute.Set(?String45,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?REN:ACTA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?REN:ACTA,RepGen:XML,TargetAttr:TagName,'REN:ACTA')
  SELF.Attribute.Set(?REN:ACTA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagName,'SOC:NOMBRE')
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagValueFromText,True)


ThisWindow.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  FECHA_HASTA = TODAY() + 180
  ReturnValue = PARENT.TakeRecord()
  RETURN ReturnValue


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
  SELF.SetDocumentInfo('CW Report','Gestion','IMPRIMIR_CERTIFICADO_HABILITACION','IMPRIMIR_CERTIFICADO_HABILITACION','','')
  SELF.SetPagesAsParentBookmark(False)
  SELF.SetScanCopyMode(False)
  SELF.CompressText   = True
  SELF.CompressImages = True

