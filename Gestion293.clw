

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPRHTML.INC'),ONCE
   INCLUDE('ABPRPDF.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('abprtext.inc'),ONCE
   INCLUDE('abprxml.inc'),ONCE
   INCLUDE('abrppsel.inc'),ONCE

                     MAP
                       INCLUDE('GESTION293.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Report
!!! </summary>
IMPRIMIR_SOLICITUD_MATRICULACION PROCEDURE 

Progress:Thermometer BYTE                                  ! 
Process:View         VIEW(SOCIOS)
                       PROJECT(SOC:DIRECCION)
                       PROJECT(SOC:DIRECCION_LABORAL)
                       PROJECT(SOC:EMAIL)
                       PROJECT(SOC:FECHA_EGRESO)
                       PROJECT(SOC:FECHA_NACIMIENTO)
                       PROJECT(SOC:FECHA_TITULO)
                       PROJECT(SOC:IDSOCIO)
                       PROJECT(SOC:LUGAR_NACIMIENTO)
                       PROJECT(SOC:LUGAR_TRABAJO)
                       PROJECT(SOC:NOMBRE)
                       PROJECT(SOC:N_DOCUMENTO)
                       PROJECT(SOC:OTRAS_MATRICULAS)
                       PROJECT(SOC:TELEFONO)
                       PROJECT(SOC:TELEFONO_LABORAL)
                       PROJECT(SOC:IDTIPOTITULO)
                       PROJECT(SOC:IDLOCALIDAD)
                       PROJECT(SOC:ID_TIPO_DOC)
                       PROJECT(SOC:IDINSTITUCION)
                       JOIN(TIP6:PK_TIPO_TITULO,SOC:IDTIPOTITULO)
                         PROJECT(TIP6:DESCRIPCION)
                       END
                       JOIN(LOC:PK_LOCALIDAD,SOC:IDLOCALIDAD)
                         PROJECT(LOC:DESCRIPCION)
                       END
                       JOIN(TIP3:PK_TIPO_DOC,SOC:ID_TIPO_DOC)
                         PROJECT(TIP3:DESCRIPCION)
                       END
                       JOIN(INS2:PK_INSTITUCION,SOC:IDINSTITUCION)
                         PROJECT(INS2:NOMBRE)
                       END
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

Report               REPORT,AT(1000,2031,6865,7469),PRE(RPT),PAPER(PAPER:A4),FONT('Arial',10,,FONT:regular,CHARSET:ANSI), |
  THOUS
                       HEADER,AT(1083,1000,6781,1031),USE(?Header)
                         IMAGE('Logo.JPG'),AT(10,10,1240,729),USE(?Image1)
                         STRING(@s255),AT(83,740,6177,208),USE(GLO:DIRECCION),CENTER,TRN
                         BOX,AT(10,948,6438,52),USE(?Box1),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                       END
Detail                 DETAIL,AT(10,10,6729,7167),USE(?Detail)
                         STRING('SOLICITUD DE MATRICULACION'),AT(1958,31),USE(?String26),FONT(,,,FONT:bold+FONT:underline), |
  TRN
                         STRING(@s30),AT(2656,1500,2260,208),USE(SOC:NOMBRE),FONT(,,,FONT:bold)
                         STRING(@s15),AT(31,1729),USE(TIP6:DESCRIPCION),TRN
                         STRING(', tiene el agrado de dirigirse a Ud. y por su intermedio a la comisión Directiva del'), |
  AT(1229,1719),USE(?String55),TRN
                         STRING('Colegio de Psicólogos del Valle Inferior de Rió Negro, para solicitar la inscri' & |
  'pción en la matrícula profesional.'),AT(31,1979,6573,208),USE(?String16),TRN
                         STRING('Declarando bajo juramento que los datos consignados a continuación son verdaderos.'), |
  AT(31,2229),USE(?String18),TRN
                         STRING('Apellido y Nombre: '),AT(31,2479),USE(?String19),TRN
                         STRING(@s30),AT(1219,2479),USE(SOC:NOMBRE,,?SOC:NOMBRE:2),FONT(,,,FONT:bold)
                         STRING(@s50),AT(2292,4229,3677,208),USE(INS2:NOMBRE),FONT(,,,FONT:bold)
                         STRING('Fecha Egreso:'),AT(31,4479),USE(?String23),TRN
                         STRING(@d17),AT(1021,4479),USE(SOC:FECHA_EGRESO),FONT(,,,FONT:bold)
                         STRING(@d17),AT(2781,4479),USE(SOC:FECHA_TITULO),FONT(,,,FONT:bold)
                         STRING('Fecha Titulo:'),AT(1927,4479),USE(?String54),TRN
                         STRING('Otras Matrículas:'),AT(31,4833),USE(?String37),TRN
                         STRING(@s50),AT(1135,4833,3823,208),USE(SOC:OTRAS_MATRICULAS),FONT(,,,FONT:bold)
                         STRING(@s5),AT(1990,2729),USE(TIP3:DESCRIPCION),FONT(,,,FONT:bold)
                         STRING('Fecha de Nacimiento: '),AT(31,2979),USE(?String40),TRN
                         STRING('Domicilio Legal:'),AT(31,3229),USE(?String43),TRN
                         STRING(@s100),AT(1042,3229),USE(SOC:DIRECCION),FONT(,,,FONT:bold)
                         STRING(@s20),AT(5146,3229),USE(LOC:DESCRIPCION),FONT(,,,FONT:bold)
                         STRING('Localidad:'),AT(4490,3229),USE(?String66),TRN
                         STRING('Correo Electrónico:'),AT(31,3479),USE(?String56),TRN
                         STRING(@s50),AT(1250,3479,3500,208),USE(SOC:EMAIL)
                         STRING(@s50),AT(1313,3729,3771,208),USE(SOC:LUGAR_TRABAJO)
                         STRING('Lugar de Trabajo:'),AT(31,3729),USE(?String58),TRN
                         STRING(@s50),AT(1427,3979),USE(SOC:DIRECCION_LABORAL)
                         STRING('Domicilio Profesional: '),AT(31,3979),USE(?String47),TRN
                         STRING(@s10),AT(3990,3979,2646,208),USE(SOC:TELEFONO_LABORAL)
                         STRING('Saluda a Ud. muy atentamente'),AT(1552,5438),USE(?String50),TRN
                         LINE,AT(3917,5823,2125,0),USE(?Line1),COLOR(COLOR:Black)
                         STRING('Firma y Aclaración'),AT(4469,5865),USE(?String51),TRN
                         STRING('PARA USO EXCLUSIVO DEL COLEGIO '),AT(31,6333),USE(?String52),FONT(,,,FONT:bold),TRN
                         STRING('Informe de la Mesa Directiva:'),AT(31,6521),USE(?String53),TRN
                         LINE,AT(1802,6635,4417,0),USE(?Line2),COLOR(COLOR:Black)
                         LINE,AT(21,6885,6219,0),USE(?Line3),COLOR(COLOR:Black)
                         LINE,AT(10,7125,6229,0),USE(?Line4),COLOR(COLOR:Black)
                         STRING(@s10),AT(3698,3229),USE(SOC:TELEFONO),FONT(,,,FONT:bold)
                         STRING(@d17),AT(1427,2979),USE(SOC:FECHA_NACIMIENTO),FONT(,,,FONT:bold)
                         STRING('Lugar Nacimiento:'),AT(2313,2979),USE(?String57),TRN
                         STRING(@s50),AT(3427,2979,2958,208),USE(SOC:LUGAR_NACIMIENTO),FONT(,,,FONT:bold)
                         STRING('Nro.:'),AT(2469,2729),USE(?String39),TRN
                         STRING('Documento de Identidad    Tipo:'),AT(31,2729),USE(?String38),TRN
                         STRING(@s14),AT(2844,2729),USE(SOC:N_DOCUMENTO),FONT(,,,FONT:bold)
                         STRING('Título expedido por la Universidad: '),AT(31,4229),USE(?String21),TRN
                         STRING('Viedma,'),AT(3490,292),USE(?String25),TRN
                         STRING(@s50),AT(4219,292),USE(GLO:FECHA_LARGO)
                         STRING('Sr/a. Presidente'),AT(63,792),USE(?String27),TRN
                         STRING('Colegio Psicólogos del Valle Inferior de Rio Negro'),AT(63,958),USE(?String28),TRN
                         STRING('S.{26}/.{25}D:'),AT(63,1146),USE(?String29),TRN
                         STRING('en su caracter de '),AT(5031,1490),USE(?String31),TRN
                         STRING('El/la que suscribe,'),AT(1344,1500),USE(?String30),TRN
                       END
                       FOOTER,AT(1000,9510,6865,1958),USE(?Footer)
                         STRING('.{163}'),AT(10,-94),USE(?String65),FONT(,,,FONT:bold),TRN
                         STRING('CONTANCIA DE SOLICITUD DE INSCRIPCION a  la MATRICULA'),AT(1323,229),USE(?String60), |
  FONT(,,,FONT:bold),TRN
                         STRING('Nombre:'),AT(63,479),USE(?String61),TRN
                         STRING(@s30),AT(635,479),USE(SOC:NOMBRE,,?SOC:NOMBRE:3)
                         STRING('Lugar y Fecha:'),AT(31,750),USE(?String62),TRN
                         STRING(@s50),AT(1563,750),USE(GLO:FECHA_LARGO,,?GLO:FECHA_LARGO:2),LEFT,TRN
                         LINE,AT(5021,802,1573,0),USE(?Line6),COLOR(COLOR:Black)
                         STRING('Firma del Receptor'),AT(5250,865),USE(?String64),TRN
                         STRING('VIEDMA, '),AT(969,750),USE(?String63),TRN
                       END
                       FORM,AT(990,1000,6875,10479),USE(?Form)
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
  GlobalErrors.SetProcedureName('IMPRIMIR_SOLICITUD_MATRICULACION')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:SOCIOS.Open                                       ! File SOCIOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('IMPRIMIR_SOLICITUD_MATRICULACION',ProgressWindow) ! Restore window settings from non-volatile store
  TargetSelector.AddItem(XMLReporter.IReportGenerator)
  TargetSelector.AddItem(HTMLReporter.IReportGenerator)
  TargetSelector.AddItem(TXTReporter.IReportGenerator)
  TargetSelector.AddItem(PDFReporter.IReportGenerator)
  SELF.AddItem(TargetSelector)
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisReport.Init(Process:View, Relate:SOCIOS, ?Progress:PctText, Progress:Thermometer, ProgressMgr, SOC:IDSOCIO)
  ThisReport.AddSortOrder(SOC:PK_SOCIOS)
  ThisReport.AddRange(SOC:IDSOCIO,GLO:IDSOCIO)
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:SOCIOS.SetQuickScan(1,Propagate:OneMany)
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
    Relate:SOCIOS.Close
  END
  IF SELF.Opened
    INIMgr.Update('IMPRIMIR_SOLICITUD_MATRICULACION',ProgressWindow) ! Save window data to non-volatile store
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
  SELF.Attribute.Set(?String26,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String26,RepGen:XML,TargetAttr:TagName,'String26')
  SELF.Attribute.Set(?String26,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagName,'SOC:NOMBRE')
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?TIP6:DESCRIPCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?TIP6:DESCRIPCION,RepGen:XML,TargetAttr:TagName,'TIP6:DESCRIPCION')
  SELF.Attribute.Set(?TIP6:DESCRIPCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String55,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String55,RepGen:XML,TargetAttr:TagName,'String55')
  SELF.Attribute.Set(?String55,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String16,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String16,RepGen:XML,TargetAttr:TagName,'String16')
  SELF.Attribute.Set(?String16,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String18,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String18,RepGen:XML,TargetAttr:TagName,'String18')
  SELF.Attribute.Set(?String18,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String19,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String19,RepGen:XML,TargetAttr:TagName,'String19')
  SELF.Attribute.Set(?String19,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:NOMBRE:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:NOMBRE:2,RepGen:XML,TargetAttr:TagName,'SOC:NOMBRE:2')
  SELF.Attribute.Set(?SOC:NOMBRE:2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?INS2:NOMBRE,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?INS2:NOMBRE,RepGen:XML,TargetAttr:TagName,'INS2:NOMBRE')
  SELF.Attribute.Set(?INS2:NOMBRE,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String23,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String23,RepGen:XML,TargetAttr:TagName,'String23')
  SELF.Attribute.Set(?String23,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:FECHA_EGRESO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:FECHA_EGRESO,RepGen:XML,TargetAttr:TagName,'SOC:FECHA_EGRESO')
  SELF.Attribute.Set(?SOC:FECHA_EGRESO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:FECHA_TITULO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:FECHA_TITULO,RepGen:XML,TargetAttr:TagName,'SOC:FECHA_TITULO')
  SELF.Attribute.Set(?SOC:FECHA_TITULO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String54,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String54,RepGen:XML,TargetAttr:TagName,'String54')
  SELF.Attribute.Set(?String54,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String37,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String37,RepGen:XML,TargetAttr:TagName,'String37')
  SELF.Attribute.Set(?String37,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:OTRAS_MATRICULAS,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:OTRAS_MATRICULAS,RepGen:XML,TargetAttr:TagName,'SOC:OTRAS_MATRICULAS')
  SELF.Attribute.Set(?SOC:OTRAS_MATRICULAS,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?TIP3:DESCRIPCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?TIP3:DESCRIPCION,RepGen:XML,TargetAttr:TagName,'TIP3:DESCRIPCION')
  SELF.Attribute.Set(?TIP3:DESCRIPCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String40,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String40,RepGen:XML,TargetAttr:TagName,'String40')
  SELF.Attribute.Set(?String40,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String43,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String43,RepGen:XML,TargetAttr:TagName,'String43')
  SELF.Attribute.Set(?String43,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:DIRECCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:DIRECCION,RepGen:XML,TargetAttr:TagName,'SOC:DIRECCION')
  SELF.Attribute.Set(?SOC:DIRECCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?LOC:DESCRIPCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?LOC:DESCRIPCION,RepGen:XML,TargetAttr:TagName,'LOC:DESCRIPCION')
  SELF.Attribute.Set(?LOC:DESCRIPCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String66,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String66,RepGen:XML,TargetAttr:TagName,'String66')
  SELF.Attribute.Set(?String66,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String56,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String56,RepGen:XML,TargetAttr:TagName,'String56')
  SELF.Attribute.Set(?String56,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:EMAIL,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:EMAIL,RepGen:XML,TargetAttr:TagName,'SOC:EMAIL')
  SELF.Attribute.Set(?SOC:EMAIL,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:LUGAR_TRABAJO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:LUGAR_TRABAJO,RepGen:XML,TargetAttr:TagName,'SOC:LUGAR_TRABAJO')
  SELF.Attribute.Set(?SOC:LUGAR_TRABAJO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String58,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String58,RepGen:XML,TargetAttr:TagName,'String58')
  SELF.Attribute.Set(?String58,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:DIRECCION_LABORAL,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:DIRECCION_LABORAL,RepGen:XML,TargetAttr:TagName,'SOC:DIRECCION_LABORAL')
  SELF.Attribute.Set(?SOC:DIRECCION_LABORAL,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String47,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String47,RepGen:XML,TargetAttr:TagName,'String47')
  SELF.Attribute.Set(?String47,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:TELEFONO_LABORAL,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:TELEFONO_LABORAL,RepGen:XML,TargetAttr:TagName,'SOC:TELEFONO_LABORAL')
  SELF.Attribute.Set(?SOC:TELEFONO_LABORAL,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String50,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String50,RepGen:XML,TargetAttr:TagName,'String50')
  SELF.Attribute.Set(?String50,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String51,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String51,RepGen:XML,TargetAttr:TagName,'String51')
  SELF.Attribute.Set(?String51,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String52,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String52,RepGen:XML,TargetAttr:TagName,'String52')
  SELF.Attribute.Set(?String52,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String53,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String53,RepGen:XML,TargetAttr:TagName,'String53')
  SELF.Attribute.Set(?String53,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:TELEFONO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:TELEFONO,RepGen:XML,TargetAttr:TagName,'SOC:TELEFONO')
  SELF.Attribute.Set(?SOC:TELEFONO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:FECHA_NACIMIENTO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:FECHA_NACIMIENTO,RepGen:XML,TargetAttr:TagName,'SOC:FECHA_NACIMIENTO')
  SELF.Attribute.Set(?SOC:FECHA_NACIMIENTO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String57,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String57,RepGen:XML,TargetAttr:TagName,'String57')
  SELF.Attribute.Set(?String57,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:LUGAR_NACIMIENTO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:LUGAR_NACIMIENTO,RepGen:XML,TargetAttr:TagName,'SOC:LUGAR_NACIMIENTO')
  SELF.Attribute.Set(?SOC:LUGAR_NACIMIENTO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String39,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String39,RepGen:XML,TargetAttr:TagName,'String39')
  SELF.Attribute.Set(?String39,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String38,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String38,RepGen:XML,TargetAttr:TagName,'String38')
  SELF.Attribute.Set(?String38,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:N_DOCUMENTO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:N_DOCUMENTO,RepGen:XML,TargetAttr:TagName,'SOC:N_DOCUMENTO')
  SELF.Attribute.Set(?SOC:N_DOCUMENTO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String21,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String21,RepGen:XML,TargetAttr:TagName,'String21')
  SELF.Attribute.Set(?String21,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String25,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String25,RepGen:XML,TargetAttr:TagName,'String25')
  SELF.Attribute.Set(?String25,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?GLO:FECHA_LARGO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GLO:FECHA_LARGO,RepGen:XML,TargetAttr:TagName,'GLO:FECHA_LARGO')
  SELF.Attribute.Set(?GLO:FECHA_LARGO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String27,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String27,RepGen:XML,TargetAttr:TagName,'String27')
  SELF.Attribute.Set(?String27,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String28,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String28,RepGen:XML,TargetAttr:TagName,'String28')
  SELF.Attribute.Set(?String28,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String29,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String29,RepGen:XML,TargetAttr:TagName,'String29')
  SELF.Attribute.Set(?String29,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String31,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String31,RepGen:XML,TargetAttr:TagName,'String31')
  SELF.Attribute.Set(?String31,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String30,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String30,RepGen:XML,TargetAttr:TagName,'String30')
  SELF.Attribute.Set(?String30,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String65,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String65,RepGen:XML,TargetAttr:TagName,'String65')
  SELF.Attribute.Set(?String65,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String60,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String60,RepGen:XML,TargetAttr:TagName,'String60')
  SELF.Attribute.Set(?String60,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String61,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String61,RepGen:XML,TargetAttr:TagName,'String61')
  SELF.Attribute.Set(?String61,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:NOMBRE:3,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:NOMBRE:3,RepGen:XML,TargetAttr:TagName,'SOC:NOMBRE:3')
  SELF.Attribute.Set(?SOC:NOMBRE:3,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String62,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String62,RepGen:XML,TargetAttr:TagName,'String62')
  SELF.Attribute.Set(?String62,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?GLO:FECHA_LARGO:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GLO:FECHA_LARGO:2,RepGen:XML,TargetAttr:TagName,'GLO:FECHA_LARGO:2')
  SELF.Attribute.Set(?GLO:FECHA_LARGO:2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String64,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String64,RepGen:XML,TargetAttr:TagName,'String64')
  SELF.Attribute.Set(?String64,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String63,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String63,RepGen:XML,TargetAttr:TagName,'String63')
  SELF.Attribute.Set(?String63,RepGen:XML,TargetAttr:TagValueFromText,True)


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

