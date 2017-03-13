

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABPRHTML.INC'),ONCE
   INCLUDE('ABPRPDF.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE
   INCLUDE('abprtext.inc'),ONCE
   INCLUDE('abprxml.inc'),ONCE
   INCLUDE('abrppsel.inc'),ONCE

                     MAP
                       INCLUDE('GESTION029.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION002.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION028.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Report
!!! </summary>
IMPRIMIR_CERTIFICADO_HABILITACION3 PROCEDURE 

Progress:Thermometer BYTE                                  ! 
loc:fecha            STRING(100)                           ! 
loc:fecha_val        LONG                                  ! 
loc:fecha_hab        LONG                                  ! 
Process:View         VIEW(CONSULTRIO_ADHERENTE)
                       PROJECT(CON1:IDCONSUL_ADE)
                       PROJECT(CON1:IDSOCIO)
                       PROJECT(CON1:IDCONSULTORIO)
                       JOIN(SOC:PK_SOCIOS,CON1:IDSOCIO)
                         PROJECT(SOC:MATRICULA)
                         PROJECT(SOC:NOMBRE)
                         PROJECT(SOC:IDTIPOTITULO)
                         JOIN(TIP6:PK_TIPO_TITULO,SOC:IDTIPOTITULO)
                           PROJECT(TIP6:DESCRIPCION)
                         END
                       END
                       JOIN(CON2:PK_CONSULTORIO,CON1:IDCONSULTORIO)
                         PROJECT(CON2:DIRECCION)
                         PROJECT(CON2:IDLOCALIDAD)
                         JOIN(LOC:PK_LOCALIDAD,CON2:IDLOCALIDAD)
                           PROJECT(LOC:DESCRIPCION)
                         END
                       END
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

Report               REPORT,AT(625,2531,9865,4969),PRE(RPT),PAPER(PAPER:A4),LANDSCAPE,FONT('Arial',8,,FONT:regular, |
  CHARSET:ANSI),THOUS
                       HEADER,AT(625,1000,9854,1469),USE(?Header),FONT('Arial',8,,FONT:regular,CHARSET:ANSI)
                         IMAGE('Logo.jpg'),AT(31,31,1854,1094),USE(?Image1)
                         STRING(@s40),AT(5687,906,1031),USE(GLO:LEY),FONT(,12),TRN
                         STRING('Ley Nº: '),AT(5052,906),USE(?String16),FONT(,12),TRN
                         STRING('Per. Jur.'),AT(3094,906),USE(?String17),FONT(,12),TRN
                         STRING(@s20),AT(3729,906,1031),USE(GLO:PER_JUR),FONT(,12),TRN
                         STRING(@s255),AT(10,1188,9823,208),USE(GLO:DIRECCION),FONT(,12),CENTER,TRN
                         LINE,AT(10,1427,9833,0),USE(?Line1),COLOR(COLOR:Black)
                       END
Detail                 DETAIL,AT(0,0,,4167),USE(?Detail)
                         STRING('CERTIFICADO DE HABILITACION ADHERENTE'),AT(2531,10),USE(?String22),FONT(,16,,FONT:bold+FONT:underline), |
  TRN
                         STRING('CERTIFICAMOS que el Consultorio  sito en'),AT(31,458,4135,281),USE(?String7),FONT(, |
  14,,FONT:bold),TRN
                         STRING(@s50),AT(1813,927,5771,281),USE(LOC:DESCRIPCION),FONT(,14,,FONT:bold),LEFT
                         STRING('de la localidad de '),AT(31,938),USE(?String20),FONT(,14,,FONT:bold),TRN
                         STRING(@s40),AT(4198,479,4656,240),USE(CON2:DIRECCION),FONT(,14,,FONT:bold),LEFT
                         STRING('Cuyo profesional  es :'),AT(31,1396,2438,240),USE(?String11),FONT(,14,,FONT:bold), |
  TRN
                         STRING(@s100),AT(4073,1365,5708,292),USE(SOC:NOMBRE),FONT(,14,,FONT:bold),LEFT(2)
                         STRING(@s15),AT(2219,1385,1823,260),USE(TIP6:DESCRIPCION),FONT(,14,,FONT:bold),LEFT
                         STRING('Matricula Profesional  Nro.'),AT(31,1833),USE(?String14),FONT(,14,,FONT:bold),TRN
                         STRING('VIEDMA,'),AT(31,3250),USE(?String19),FONT(,14,,FONT:bold),TRN
                         STRING(@s50),AT(1167,3260,5844,229),USE(GLO:FECHA_LARGO),FONT(,14,,FONT:bold)
                         TEXT,AT(229,3938,3531,656),USE(GLO:FIRMA2),FONT(,14,,FONT:bold),BOXED
                         TEXT,AT(5979,3938,3531,656),USE(GLO:FIRMA1),FONT('Arial',14,,FONT:bold,CHARSET:ANSI),CENTER, |
  BOXED
                         STRING('está habilitado por este Colegio, desde el'),AT(3594,1844,4010,240),USE(?String15), |
  FONT(,14,,FONT:bold),TRN
                         STRING('según los registros obrantes en esta institución en ejercicio de las atribucion' & |
  'es que le confiere la Ley.'),AT(31,2292),USE(?String21),FONT(,14,,FONT:bold),TRN
                         STRING(@d6),AT(3833,2750),USE(loc:fecha_val),FONT(,14,,FONT:bold),TRN
                         STRING('El presente certificado es válido hasta:'),AT(31,2750),USE(?String23),FONT(,14,,FONT:bold), |
  TRN
                         STRING(@s100),AT(7635,1844,2156,240),USE(loc:fecha),FONT(,14,,FONT:bold),TRN
                         STRING(@s5),AT(2698,1833),USE(SOC:MATRICULA),FONT(,14,,FONT:bold)
                       END
                       FOOTER,AT(604,7510,9885,198),USE(?Footer)
                       END
                       FORM,AT(615,1000,9875,6719),USE(?Form)
                       END
                     END
LocE::Direccion            STRING(5000)
LocE::DireccionCC          STRING(5000)
LocE::DireccionCCO         STRING(5000)
LocE::Subject              STRING(255)
LocE::Body                 STRING(2048)
LocE::FileName             STRING(5000)
LocE::Retorno              LONG
LocE::Flags                SHORT
LocE::Dialogo              BYTE
QAtach                   QUEUE
Attach                     CSTRING(5000)
                         END
Loc::Attach                 string(5000)
Loc::Cadena                 String(1)
Loc::Archivo                string(500)

LocE::GolDesde          SHORT
LocE::GolHasta          SHORT
LocE::Cancelar          BYTE
LocE::Atach             STRING(10000)
LocE::FileSend          STRING(5000)
LocE::Titulo            STRING(500)
LocE::NombreFile        STRING(500)
LocE::Qpar      QUEUE,PRE(QP)
Par                     CSTRING(1000)
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

?Menu_eMail     EQUATE(-1026)
?EnviarxMailWMF     EQUATE(-1027)
?EnviarxMailWord    EQUATE(-1028)
?EnviaraWord        EQUATE(-1029)
Gol_wo WINDOW,AT(,,236,43),FONT('Tahoma',8,,FONT:regular),CENTER,GRAY
       IMAGE('Mail.ico'),AT(8,7),USE(?Imgout),CENTERED
       PROGRESS,USE(?ProgOutlook),AT(38,9,164,9),RANGE(0,100)
       GROUP,AT(38,21,164,9),USE(?Group1),BOXED,BEVEL(-1)
         STRING('Generando Archivos de Mail'),AT(76,21),USE(?StrOut),TRN
       END
     END
WGolPrompt WINDOW,AT(,,160,80),FONT('Tahoma',8,,FONT:bold),CENTER,GRAY
       GROUP,AT(2,2,156,76),USE(?Group_gol),BOXED,BEVEL(-1)
         IMAGE('mail.ico'),AT(5,5,30,17),USE(?Image_gol),CENTERED
         GROUP,AT(36,8,88,36),USE(?Group2),BOXED,BEVEL(1,1)
           PROMPT('Pagina Desde:'),AT(43,14),USE(?Prompt_gol)
           SPIN(@n02),AT(92,14,25,10),USE(LocE::GolDesde),RANGE(1,100),STEP(1)
           PROMPT('Pagina Hasta:'),AT(43,28),USE(?Prompt_Gol2)
           SPIN(@n02),AT(92,28,25,10),USE(LocE::GolHasta),RANGE(1,100),STEP(1)
         END
         BUTTON('Enviar'),AT(27,59,50,14),USE(?Enviar),LEFT,ICON('wizok.ico')
         BUTTON('Cancelar'),AT(83,59,50,14),USE(?Cancelar),LEFT,ICON('wizcncl.ico')
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
!!! Inicio Ec. Templates
SendMailPrompt     ROUTINE
  OPEN(WGolPrompt)
  ALERT(EnterKey)
      POST(Event:OpenWindow)
      ACCEPT
        CASE EVENT()
        OF Event:OpenWindow
            CYCLE
        OF EVENT:AlertKey
           CASE KEYCODE()
             OF EnterKey
                MiControl# = FOCUS()
                CASE MiControl#{Prop:Type}
                  OF CREATE:Button
                     POST(EVENT:ACCEPTED,MiControl#)
                  ELSE
                     IF FOCUS()<> ?Enviar
                        PRESSKEY(TabKey)
                        CYCLE
                     ELSE
                        POST(Event:Accepted,?Enviar)
                     END!IF
                END!CASE
           END!CASE
        END!CASE EVENT
        CASE FIELD()
        OF ?Enviar
          CASE Event()
          OF Event:Accepted
            POST(Event:CloseWindow)
          OF EVENT:AlertKey
             CASE KEYCODE()
               OF EnterKey
                  MiControl# = FOCUS()
                  CASE MiControl#{Prop:Type}
                    OF CREATE:Button
                       POST(EVENT:ACCEPTED,MiControl#)
                    ELSE
                       IF FOCUS()<> ?Enviar
                          PRESSKEY(TabKey)
                          CYCLE
                       ELSE
                          ! Se presiono el ENTER estando posicionado el OK
                          POST(Event:Accepted,?Enviar)
                       END!IF
                  END!CASE
             END!CASE
          END
        OF ?Cancelar
          CASE Event()
          OF Event:Accepted
            LocE::Cancelar = True
            POST(Event:CloseWindow)
          OF EVENT:AlertKey
             CASE KEYCODE()
               OF EnterKey
                  MiControl# = FOCUS()
                  CASE MiControl#{Prop:Type}
                    OF CREATE:Button
                       POST(EVENT:ACCEPTED,MiControl#)
                    ELSE
                       IF FOCUS()<> ?Enviar
                          PRESSKEY(TabKey)
                          CYCLE
                       ELSE
                          POST(Event:Accepted,?Enviar)
                       END!IF
                  END!CASE
             END!CASE
          END
        END
      END !END ACCEPT
  CLOSE(WGolPrompt)
!************ Fin de ROUTINE Ec_Mail*********************

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('IMPRIMIR_CERTIFICADO_HABILITACION3')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:CONF_EMP.Open                                     ! File CONF_EMP used by this procedure, so make sure it's RelationManager is open
  Relate:CONSULTRIO_ADHERENTE.Open                         ! File CONSULTRIO_ADHERENTE used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('IMPRIMIR_CERTIFICADO_HABILITACION3',ProgressWindow) ! Restore window settings from non-volatile store
  TargetSelector.AddItem(XMLReporter.IReportGenerator)
  TargetSelector.AddItem(HTMLReporter.IReportGenerator)
  TargetSelector.AddItem(TXTReporter.IReportGenerator)
  TargetSelector.AddItem(PDFReporter.IReportGenerator)
  SELF.AddItem(TargetSelector)
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisReport.Init(Process:View, Relate:CONSULTRIO_ADHERENTE, ?Progress:PctText, Progress:Thermometer, ProgressMgr, CON1:IDCONSUL_ADE)
  ThisReport.AddSortOrder(CON1:PK_CONSULTRIO_ADHERENTE)
  ThisReport.AddRange(CON1:IDCONSUL_ADE,GLO:IDSOLICITUD)
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:CONSULTRIO_ADHERENTE.SetQuickScan(1,Propagate:OneMany)
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
    Relate:CONF_EMP.Close
    Relate:CONSULTRIO_ADHERENTE.Close
  END
  IF SELF.Opened
    INIMgr.Update('IMPRIMIR_CERTIFICADO_HABILITACION3',ProgressWindow) ! Save window data to non-volatile store
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
  SELF.Attribute.Set(?GLO:LEY,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GLO:LEY,RepGen:XML,TargetAttr:TagName,'GLO:LEY')
  SELF.Attribute.Set(?GLO:LEY,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String16,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String16,RepGen:XML,TargetAttr:TagName,'String16')
  SELF.Attribute.Set(?String16,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String17,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String17,RepGen:XML,TargetAttr:TagName,'String17')
  SELF.Attribute.Set(?String17,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?GLO:PER_JUR,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GLO:PER_JUR,RepGen:XML,TargetAttr:TagName,'GLO:PER_JUR')
  SELF.Attribute.Set(?GLO:PER_JUR,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?GLO:DIRECCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GLO:DIRECCION,RepGen:XML,TargetAttr:TagName,'GLO:DIRECCION')
  SELF.Attribute.Set(?GLO:DIRECCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String22,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String22,RepGen:XML,TargetAttr:TagName,'String22')
  SELF.Attribute.Set(?String22,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String7,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String7,RepGen:XML,TargetAttr:TagName,'String7')
  SELF.Attribute.Set(?String7,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?LOC:DESCRIPCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?LOC:DESCRIPCION,RepGen:XML,TargetAttr:TagName,'LOC:DESCRIPCION')
  SELF.Attribute.Set(?LOC:DESCRIPCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String20,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String20,RepGen:XML,TargetAttr:TagName,'String20')
  SELF.Attribute.Set(?String20,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?CON2:DIRECCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?CON2:DIRECCION,RepGen:XML,TargetAttr:TagName,'CON2:DIRECCION')
  SELF.Attribute.Set(?CON2:DIRECCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String11,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String11,RepGen:XML,TargetAttr:TagName,'String11')
  SELF.Attribute.Set(?String11,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagName,'SOC:NOMBRE')
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?TIP6:DESCRIPCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?TIP6:DESCRIPCION,RepGen:XML,TargetAttr:TagName,'TIP6:DESCRIPCION')
  SELF.Attribute.Set(?TIP6:DESCRIPCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String14,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String14,RepGen:XML,TargetAttr:TagName,'String14')
  SELF.Attribute.Set(?String14,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String19,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String19,RepGen:XML,TargetAttr:TagName,'String19')
  SELF.Attribute.Set(?String19,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?GLO:FECHA_LARGO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GLO:FECHA_LARGO,RepGen:XML,TargetAttr:TagName,'GLO:FECHA_LARGO')
  SELF.Attribute.Set(?GLO:FECHA_LARGO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?GLO:FIRMA2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GLO:FIRMA2,RepGen:XML,TargetAttr:TagName,'GLO:FIRMA2')
  SELF.Attribute.Set(?GLO:FIRMA2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?GLO:FIRMA1,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GLO:FIRMA1,RepGen:XML,TargetAttr:TagName,'GLO:FIRMA1')
  SELF.Attribute.Set(?GLO:FIRMA1,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String15,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String15,RepGen:XML,TargetAttr:TagName,'String15')
  SELF.Attribute.Set(?String15,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String21,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String21,RepGen:XML,TargetAttr:TagName,'String21')
  SELF.Attribute.Set(?String21,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?loc:fecha_val,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?loc:fecha_val,RepGen:XML,TargetAttr:TagName,'loc:fecha_val')
  SELF.Attribute.Set(?loc:fecha_val,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String23,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String23,RepGen:XML,TargetAttr:TagName,'String23')
  SELF.Attribute.Set(?String23,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?loc:fecha,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?loc:fecha,RepGen:XML,TargetAttr:TagName,'loc:fecha')
  SELF.Attribute.Set(?loc:fecha,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagName,'SOC:MATRICULA')
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagValueFromText,True)


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  COF:RAZON_SOCIAL = 'Colegio de Psicólogos del Valle Inferior de Rió Negro'
  
  CON2:IDCONSULTORIO = CON1:IDCONSULTORIO
  ACCESS:CONsULTORIO.TRYFETCH(CON2:PK_CONSULTORIO)
  EXECUTE (MONTH(CON2:FECHA_HABILITACION))
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
  loc:fecha_hab = CON2:FECHA_HABILITACION
  LOC:FECHA = DAY(CON2:FECHA_HABILITACION) & ' de ' &CLIP(Mes")&' '&Year(CON2:FECHA_HABILITACION)
  loc:fecha_val = CON2:FECHA_HABILITACION  +  1824
  ReturnValue = PARENT.TakeRecord()
  PRINT(RPT:Detail)
  RETURN ReturnValue


Previewer.Open PROCEDURE

  CODE
  PARENT.Open
  CREATE(?Menu_eMail,CREATE:Menu)
  ?Menu_eMail{PROP:text} = 'Enviar x eMail'
  ?Menu_eMail{PROP:use} = LASTFIELD()+301
  UNHIDE(?Menu_eMail)
  
  if 'Enviar Imagenes [WMF]' <> '' !!! Activa Envio de Imagen
    CREATE(?EnviarxMailWmf,CREATE:Item,?Menu_eMail)
    ?EnviarxMailwmf{PROP:use} = LASTFIELD()+302
    ?EnviarxMailwmf{PROP:text} = 'Enviar Imagenes [WMF]'
  UNHIDE(?EnviarxMailwmf)
  end
  
  if 'Enviar Reporte en Word' <> '' !!! Activa Envio de Imagen a Word
    CREATE(?EnviarxMailWord,CREATE:Item,?Menu_eMail)
    ?EnviarxMailWord{PROP:use} = LASTFIELD()+303
    ?EnviarxMailWord{PROP:text} = 'Enviar Reporte en Word'
    UNHIDE(?EnviarxMailWord)
  end
  
  if 'Enviar Reporte a Word' <> '' !!! Activa Envio de Imagen a Word
  CREATE(?EnviaraWord,CREATE:Item,?Menu_eMail)
  ?EnviaraWord{PROP:use} = LASTFIELD()+304
  ?EnviaraWord{PROP:text} = 'Enviar Reporte a Word'
  UNHIDE(?EnviaraWord)
  end


Previewer.TakeEvent PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeEvent()
  LocE::GolDesde =1
  LocE::GolHasta =RECORDS(SELF.ImageQueue)
  LocE::Cancelar = False
  case event()
    of EVENT:Accepted
    Case field()
     of ?EnviarxMailWmf
           Do SendMailPrompt
      IF NOT LocE::Cancelar
           FREE(QAtach)
           OPEN(Gol_wo)
           DISPLAY()
           !!!!!!! manejo de WMF
           get(SELF.ImageQueue,POINTER(SELF.ImageQueue))
           loop a# = 1 to RECORDS(SELF.ImageQueue)
           IF a# >=LocE::GolDesde and a# <=LocE::GolHasta
              IF a# > 40 THEN BREAK.
              get(SELF.ImageQueue,a#)
              if self.InPageList(a#)
                 P# = INSTRING('.',SELF.ImageQueue,1,2)
                 LocE::Titulo     = 'CERTIFICADO DE CONSULTORIO'
                 LocE::NombreFile = 'P('&SUB(LocE::Titulo,1,2)&')H'&a#&'.WMF'
                 IF EXISTS(CLIP(LocE::NombreFile)) Then REMOVE(CLIP(LocE::NombreFile)).
                 COPY(SELF.ImageQueue,CLIP(LocE::NombreFile))
                 IF ERRORCODE() THEN MESSAGE(ERROR()).
                 QAtach.Attach = PATH()&'\'& CLIP(LocE::NombreFile)
                 ADD(QAtach)
                 IF ERRORCODE() THEN MESSAGE(ERROR()).
                    LocE::Atach = CLIP(LocE::Atach)&';' & CLIP(LocE::NombreFile)
                 end
              END
           end
           LocE::Flags     = False
           LocE::Subject   = 'CERTIFICADO DE CONSULTORIO'
           LocE::Body      = ''
           CLOSE(Gol_wo)
           LocE::Direccion = GLO:EMAIL
           LocE::Dialogo  = 1
           SAVEPath"   = PATH()
           IF LocE::Dialogo THEN LocE::Flags  =MAPI_DIALOG.
            E#  = SendMail(LocE::Dialogo,LocE::Direccion,LocE::Subject,LocE::Body,LocE::DireccionCC,QAtach)
           SETPATH(SAVEPath")
           POST(Event:CloseWindow)
       END !! NOT LocE::Cancelar
     Of ?EnviaraWord
      Do SendMailPrompt
      IF NOT LocE::Cancelar
          FREE(LocE::Qpar)
          FREE(QAtach)
          LOcE::Qpar.QP:Par  = 'CERTIFICADO DE CONSULTORIO'
          ADD(LocE::Qpar)
          LOcE::Qpar.QP:Par  = false
          ADD(LocE::Qpar)
          LOcE::Qpar.QP:Par  = ''
          ADD(LocE::Qpar)
          LOcE::Qpar.QP:Par  = ''
          ADD(LocE::Qpar)
          LOcE::Qpar.QP:Par  =         0
          ADD(LocE::Qpar)
          OPEN(Gol_wo)
          DISPLAY()
           !!!!!!! manejo de WMF
           get(SELF.ImageQueue,POINTER(SELF.ImageQueue))
           loop a# = 1 to RECORDS(SELF.ImageQueue)
           IF a# >=LocE::GolDesde and a# <=LocE::GolHasta
              IF a# > 40 THEN BREAK.
              get(SELF.ImageQueue,a#)
              if self.InPageList(a#)
                 P# = INSTRING('.',SELF.ImageQueue,1,2)
                 LocE::Titulo     = 'CERTIFICADO DE CONSULTORIO'
                 LocE::NombreFile = 'P('&SUB(LocE::Titulo,1,2)&')H'&a#&'.WMF'
                 IF EXISTS(CLIP(LocE::NombreFile)) Then REMOVE(CLIP(LocE::NombreFile)).
                 COPY(SELF.ImageQueue,CLIP(LocE::NombreFile))
                 IF ERRORCODE() THEN MESSAGE(ERROR()).
                 QAtach.Attach = PATH()&'\'& CLIP(LocE::NombreFile)
                 ADD(QAtach)
                 IF ERRORCODE() THEN MESSAGE(ERROR()).
                    LocE::Atach = CLIP(LocE::Atach)&';' & CLIP(LocE::NombreFile)
                 end
              END
           end
          LocE::FileName = ''
          EXPORTWORD(QAtach,LocE::Qpar,LocE::FileSend)
          SETPATH(SAVEPath")
          CLOSE(Gol_wo)
          POST(Event:CloseWindow)
       END
     of ?EnviarxMailWord
      Do SendMailPrompt
      IF NOT LocE::Cancelar
          FREE(LocE::Qpar)
          FREE(QAtach)
          OPEN(Gol_wo)
          DISPLAY()
           !!!!!!! manejo de WMF
           get(SELF.ImageQueue,POINTER(SELF.ImageQueue))
           loop a# = 1 to RECORDS(SELF.ImageQueue)
           IF a# >=LocE::GolDesde and a# <=LocE::GolHasta
              IF a# > 40 THEN BREAK.
              get(SELF.ImageQueue,a#)
              if self.InPageList(a#)
                 P# = INSTRING('.',SELF.ImageQueue,1,2)
                 LocE::Titulo     = 'CERTIFICADO DE CONSULTORIO'
                 LocE::NombreFile = 'P('&SUB(LocE::Titulo,1,2)&')H'&a#&'.WMF'
                 IF EXISTS(CLIP(LocE::NombreFile)) Then REMOVE(CLIP(LocE::Nombrefile)).
                 COPY(SELF.ImageQueue,CLIP(LocE::Nombrefile))
                 IF ERRORCODE() THEN MESSAGE(ERROR()).
                 QAtach.Attach = PATH()&'\'& CLIP(LocE::nombrefile)
                 ADD(QAtach)
                 IF ERRORCODE() THEN MESSAGE(ERROR()).
                    LocE::Atach = CLIP(LocE::Atach)&';' & CLIP(LocE::nombrefile)
                 end
              END
           end
          LOcE::Qpar.QP:Par  = 'CERTIFICADO DE CONSULTORIO'
          ADD(LocE::Qpar)
          LocE::FileName = ''
          EXPORTWORD(QAtach,LocE::Qpar,LocE::FileSend)
          IF LocE::FileSend
             LocE::Flags     = False
             LocE::Body      = ''
             LocE::Subject   = 'CERTIFICADO DE CONSULTORIO'
             FREE(QAtach)
             QAtach.Attach = PATH() & '\' & Sub(LocE::Subject,1,5) & '.doc'
             ADD(QAtach)
             LocE::Direccion = GLO:EMAIL
             LocE::Dialogo  = 1
             SAVEPath"   = PATH()
             IF LocE::Dialogo THEN LocE::Flags  +=MAPI_DIALOG.
             E#  = SendMail(LocE::Dialogo,LocE::Direccion,LocE::Subject,LocE::Body,LocE::DireccionCC,QAtach)
             SETPATH(SAVEPath")
             CLOSE(Gol_wo)
             POST(Event:CloseWindow)
          END
       END
    END !! CASE Field
  end!Case Event
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

!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the CONSULTORIO File
!!! </summary>
CERTIFICADO_CONSULTORIO_ADHERENTE PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(CONSULTRIO_ADHERENTE)
                       PROJECT(CON1:IDCONSUL_ADE)
                       PROJECT(CON1:IDCONSULTORIO)
                       PROJECT(CON1:IDSOCIO)
                       JOIN(SOC:PK_SOCIOS,CON1:IDSOCIO)
                         PROJECT(SOC:NOMBRE)
                         PROJECT(SOC:CANTIDAD)
                         PROJECT(SOC:IDSOCIO)
                       END
                       JOIN(CON2:PK_CONSULTORIO,CON1:IDCONSULTORIO)
                         PROJECT(CON2:ACTA)
                         PROJECT(CON2:IDLOCALIDAD)
                         PROJECT(CON2:DIRECCION)
                         PROJECT(CON2:FECHA)
                         PROJECT(CON2:LIBRO)
                         PROJECT(CON2:FOLIO)
                         PROJECT(CON2:ACTIVO)
                         PROJECT(CON2:IDCONSULTORIO)
                         JOIN(LOC:PK_LOCALIDAD,CON2:IDLOCALIDAD)
                           PROJECT(LOC:DESCRIPCION)
                           PROJECT(LOC:IDLOCALIDAD)
                         END
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
CON1:IDCONSUL_ADE      LIKE(CON1:IDCONSUL_ADE)        !List box control field - type derived from field
CON1:IDCONSULTORIO     LIKE(CON1:IDCONSULTORIO)       !List box control field - type derived from field
CON2:ACTA              LIKE(CON2:ACTA)                !List box control field - type derived from field
CON1:IDSOCIO           LIKE(CON1:IDSOCIO)             !List box control field - type derived from field
SOC:NOMBRE             LIKE(SOC:NOMBRE)               !List box control field - type derived from field
SOC:CANTIDAD           LIKE(SOC:CANTIDAD)             !List box control field - type derived from field
CON2:IDLOCALIDAD       LIKE(CON2:IDLOCALIDAD)         !List box control field - type derived from field
LOC:DESCRIPCION        LIKE(LOC:DESCRIPCION)          !List box control field - type derived from field
CON2:DIRECCION         LIKE(CON2:DIRECCION)           !List box control field - type derived from field
CON2:FECHA             LIKE(CON2:FECHA)               !List box control field - type derived from field
CON2:LIBRO             LIKE(CON2:LIBRO)               !List box control field - type derived from field
CON2:FOLIO             LIKE(CON2:FOLIO)               !List box control field - type derived from field
CON2:ACTIVO            LIKE(CON2:ACTIVO)              !List box control field - type derived from field
SOC:IDSOCIO            LIKE(SOC:IDSOCIO)              !Related join file key field - type derived from field
CON2:IDCONSULTORIO     LIKE(CON2:IDCONSULTORIO)       !Related join file key field - type derived from field
LOC:IDLOCALIDAD        LIKE(LOC:IDLOCALIDAD)          !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('CERTIFICADO CONSULTORIO ADHERENTE'),AT(,,421,198),FONT('MS Sans Serif',8,,FONT:regular), |
  RESIZE,CENTER,GRAY,IMM,MDI,HLP('Certidicacion_consultorio'),SYSTEM
                       LIST,AT(8,41,410,123),USE(?Browse:1),HVSCROLL,FORMAT('20L(2)|M~ID~C(0)@n-5@56L(2)|M~Nº ' & |
  'CONSULTORIO~@n-14@25L(2)|M~HAB~@s5@[27L(2)|M~IDSOC~C(0)@n-5@400L(2)|M~NOMBRE~C(0)@s1' & |
  '00@56L(2)|M~CANTIDAD~C(0)@n-14@]|M~COLEGIADO ADHERENTE~[31L(2)|M~IDLOC~L(0)@n-7@80L(' & |
  '2)|M~DESCRIP~C(0)@s20@](115)|M~LOCALIDAD~80L(2)|M~DIRECCION~@s50@49L(2)|M~FECHA~L(0)' & |
  '@d17@32L(2)|M~LIBRO~C(0)@n-7@31L(2)|M~FOLIO~C(0)@n-7@8L(2)|M~ACTIVO~C(0)@s2@'),FROM(Queue:Browse:1), |
  IMM,MSG('Administrador de CONSULTORIO'),VCR
                       BUTTON('Imprimir Certificado '),AT(7,178,123,14),USE(?Button4),LEFT,ICON(ICON:Print1),FLAT
                       SHEET,AT(3,4,417,167),USE(?CurrentTab)
                         TAB('CONSULTORIO'),USE(?Tab:1)
                           PROMPT('IDCONSULTORIO:'),AT(9,26),USE(?CON1:IDCONSULTORIO:Prompt)
                           ENTRY(@n-14),AT(78,25,60,10),USE(CON1:IDCONSULTORIO),RIGHT(1)
                         END
                         TAB('COLEGIADO'),USE(?Tab:2)
                           PROMPT('IDSOCIO:'),AT(7,25),USE(?CON1:IDSOCIO:Prompt)
                           ENTRY(@n-14),AT(57,24,60,10),USE(CON1:IDSOCIO),RIGHT(1)
                         END
                       END
                       BUTTON('&Salir'),AT(367,181,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Salir'),TIP('Salir')
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
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
  GlobalErrors.SetProcedureName('CERTIFICADO_CONSULTORIO_ADHERENTE')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('CON1:IDCONSUL_ADE',CON1:IDCONSUL_ADE)              ! Added by: BrowseBox(ABC)
  BIND('SOC:IDSOCIO',SOC:IDSOCIO)                          ! Added by: BrowseBox(ABC)
  BIND('CON2:IDCONSULTORIO',CON2:IDCONSULTORIO)            ! Added by: BrowseBox(ABC)
  BIND('LOC:IDLOCALIDAD',LOC:IDLOCALIDAD)                  ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:CONSULTRIO_ADHERENTE.Open                         ! File CONSULTRIO_ADHERENTE used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:CONSULTRIO_ADHERENTE,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,CON1:FK_CONSULTRIO_ADHERENTE_SOCIO)   ! Add the sort order for CON1:FK_CONSULTRIO_ADHERENTE_SOCIO for sort order 1
  BRW1.SetFilter('(SOC:CANTIDAD <<= 4  AND CON2:ACTIVO <<> ''NO'' )') ! Apply filter expression to browse
  BRW1.AddSortOrder(,CON1:PK_CONSULTRIO_ADHERENTE)         ! Add the sort order for CON1:PK_CONSULTRIO_ADHERENTE for sort order 2
  BRW1.SetFilter('(SOC:CANTIDAD <<= 4  AND CON2:ACTIVO <<> ''NO'')') ! Apply filter expression to browse
  BRW1.AddField(CON1:IDCONSUL_ADE,BRW1.Q.CON1:IDCONSUL_ADE) ! Field CON1:IDCONSUL_ADE is a hot field or requires assignment from browse
  BRW1.AddField(CON1:IDCONSULTORIO,BRW1.Q.CON1:IDCONSULTORIO) ! Field CON1:IDCONSULTORIO is a hot field or requires assignment from browse
  BRW1.AddField(CON2:ACTA,BRW1.Q.CON2:ACTA)                ! Field CON2:ACTA is a hot field or requires assignment from browse
  BRW1.AddField(CON1:IDSOCIO,BRW1.Q.CON1:IDSOCIO)          ! Field CON1:IDSOCIO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:NOMBRE,BRW1.Q.SOC:NOMBRE)              ! Field SOC:NOMBRE is a hot field or requires assignment from browse
  BRW1.AddField(SOC:CANTIDAD,BRW1.Q.SOC:CANTIDAD)          ! Field SOC:CANTIDAD is a hot field or requires assignment from browse
  BRW1.AddField(CON2:IDLOCALIDAD,BRW1.Q.CON2:IDLOCALIDAD)  ! Field CON2:IDLOCALIDAD is a hot field or requires assignment from browse
  BRW1.AddField(LOC:DESCRIPCION,BRW1.Q.LOC:DESCRIPCION)    ! Field LOC:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(CON2:DIRECCION,BRW1.Q.CON2:DIRECCION)      ! Field CON2:DIRECCION is a hot field or requires assignment from browse
  BRW1.AddField(CON2:FECHA,BRW1.Q.CON2:FECHA)              ! Field CON2:FECHA is a hot field or requires assignment from browse
  BRW1.AddField(CON2:LIBRO,BRW1.Q.CON2:LIBRO)              ! Field CON2:LIBRO is a hot field or requires assignment from browse
  BRW1.AddField(CON2:FOLIO,BRW1.Q.CON2:FOLIO)              ! Field CON2:FOLIO is a hot field or requires assignment from browse
  BRW1.AddField(CON2:ACTIVO,BRW1.Q.CON2:ACTIVO)            ! Field CON2:ACTIVO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:IDSOCIO,BRW1.Q.SOC:IDSOCIO)            ! Field SOC:IDSOCIO is a hot field or requires assignment from browse
  BRW1.AddField(CON2:IDCONSULTORIO,BRW1.Q.CON2:IDCONSULTORIO) ! Field CON2:IDCONSULTORIO is a hot field or requires assignment from browse
  BRW1.AddField(LOC:IDLOCALIDAD,BRW1.Q.LOC:IDLOCALIDAD)    ! Field LOC:IDLOCALIDAD is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('CERTIFICADO_CONSULTORIO_ADHERENTE',QuickWindow) ! Restore window settings from non-volatile store
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
    Relate:CONSULTRIO_ADHERENTE.Close
  END
  IF SELF.Opened
    INIMgr.Update('CERTIFICADO_CONSULTORIO_ADHERENTE',QuickWindow) ! Save window data to non-volatile store
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
    OF ?Button4
      GLO:IDSOLICITUD = CON1:IDCONSUL_ADE
      GLO:IDSOCIO = CON1:IDSOCIO
      REPORTE_LARGO = 'CERTIFICADO DE HABILITACION DE CONSULTORIO ADHERENTE'
      
      !!! BUSCA EL CORREO ELECTRONICO PARA ENVIAR POR EMAIL
      GLO:IDSOCIO = CON1:IDSOCIO
      GET (SOCIOS,SOC:PK_SOCIOS)
      IF ERRORCODE()= 35 THEN
          MESSAGE('NO SE ENCONTRO EL SOCIO')
      ELSE
          GLO:EMAIL = SOC:EMAIL
      END
      
      CARGA_AUDITORIA()
      IMPRIMIR_CERTIFICADO_HABILITACION3()
    END
  ReturnValue = PARENT.TakeAccepted()
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


BRW1.ResetSort PROCEDURE(BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  IF CHOICE(?CurrentTab) = 2
    RETURN SELF.SetSort(1,Force)
  ELSE
    RETURN SELF.SetSort(2,Force)
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
IMPRIMIR_CERTIFICADO_HAB2 PROCEDURE 

Progress:Thermometer BYTE                                  ! 
loc:fecha            STRING(100)                           ! 
loc:fecha_val        LONG                                  ! 
loc:fecha_hab        LONG                                  ! 
Process:View         VIEW(CONSULTORIO)
                       PROJECT(CON2:DIRECCION)
                       PROJECT(CON2:IDCONSULTORIO)
                       PROJECT(CON2:IDSOCIO)
                       PROJECT(CON2:IDLOCALIDAD)
                       JOIN(SOC:PK_SOCIOS,CON2:IDSOCIO)
                         PROJECT(SOC:MATRICULA)
                         PROJECT(SOC:NOMBRE)
                         PROJECT(SOC:IDTIPOTITULO)
                         JOIN(TIP6:PK_TIPO_TITULO,SOC:IDTIPOTITULO)
                           PROJECT(TIP6:DESCRIPCION)
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

Report               REPORT,AT(625,2531,9865,4969),PRE(RPT),PAPER(PAPER:A4),LANDSCAPE,FONT('Arial',8,,FONT:regular, |
  CHARSET:ANSI),THOUS
                       HEADER,AT(625,1000,9854,1469),USE(?Header),FONT('Arial',8,,FONT:regular,CHARSET:ANSI)
                         IMAGE('Logo2.jpg'),AT(135,31,4583,1094),USE(?Image1)
                         STRING(@s40),AT(6052,917,917),USE(GLO:LEY),FONT(,12),TRN
                         STRING('Ley Nº: '),AT(5385,906),USE(?String16),FONT(,12),TRN
                         STRING(@s255),AT(10,1188,9823,208),USE(GLO:DIRECCION),FONT(,12),CENTER,TRN
                         LINE,AT(10,1427,9833,0),USE(?Line1),COLOR(COLOR:Black)
                       END
Detail                 DETAIL,AT(0,0,,4167),USE(?Detail)
                         STRING('CERTIFICADO DE HABILITACION'),AT(3229,10),USE(?String22),FONT(,16,,FONT:bold+FONT:underline), |
  TRN
                         STRING('CERTIFICAMOS que el Consultorio  sito en'),AT(31,458,4135,281),USE(?String7),FONT(, |
  14,,FONT:bold),TRN
                         STRING(@s50),AT(1813,927,5771,281),USE(LOC:DESCRIPCION),FONT(,14,,FONT:bold),LEFT
                         STRING('de la localidad de '),AT(31,938),USE(?String20),FONT(,14,,FONT:bold),TRN
                         STRING(@s40),AT(4198,479,4656,240),USE(CON2:DIRECCION),FONT(,14,,FONT:bold),LEFT
                         STRING('Cuyo responsable es el :'),AT(31,1396,2438,240),USE(?String11),FONT(,14,,FONT:bold), |
  TRN
                         STRING(@s100),AT(4396,1365,5406,292),USE(SOC:NOMBRE),FONT(,14,,FONT:bold),LEFT(2)
                         STRING(@s15),AT(2479,1385),USE(TIP6:DESCRIPCION),FONT(,14,,FONT:bold),LEFT
                         STRING('Matricula Profesional  Nro.'),AT(31,1833),USE(?String14),FONT(,14,,FONT:bold),TRN
                         STRING('VIEDMA,'),AT(31,3250),USE(?String19),FONT(,14,,FONT:bold),TRN
                         STRING(@s50),AT(1167,3260,5844,229),USE(GLO:FECHA_LARGO),FONT(,14,,FONT:bold)
                         TEXT,AT(229,3938,3531,656),USE(GLO:FIRMA2),FONT(,14,,FONT:bold),BOXED
                         TEXT,AT(5979,3938,3531,656),USE(GLO:FIRMA1),FONT('Arial',14,,FONT:bold,CHARSET:ANSI),CENTER, |
  BOXED
                         STRING('está habilitado por este Colegio, desde el'),AT(3594,1844,4010,240),USE(?String15), |
  FONT(,14,,FONT:bold),TRN
                         STRING('según los registros obrantes en esta institución en ejercicio de las atribucion' & |
  'es que le confiere la Ley.'),AT(31,2292),USE(?String21),FONT(,14,,FONT:bold),TRN
                         STRING(@d6),AT(3833,2750),USE(loc:fecha_val),FONT(,14,,FONT:bold),TRN
                         STRING('El presente certificado es válido hasta:'),AT(31,2750),USE(?String23),FONT(,14,,FONT:bold), |
  TRN
                         STRING(@s50),AT(7635,1802,2156,323),USE(loc:fecha),FONT(,14,,FONT:bold),TRN
                         STRING(@s7),AT(2698,1833),USE(SOC:MATRICULA),FONT(,14,,FONT:bold)
                       END
                       FOOTER,AT(604,7510,9885,198),USE(?Footer)
                       END
                       FORM,AT(615,1000,9875,6719),USE(?Form)
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
  GlobalErrors.SetProcedureName('IMPRIMIR_CERTIFICADO_HAB2')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:CONF_EMP.Open                                     ! File CONF_EMP used by this procedure, so make sure it's RelationManager is open
  Relate:CONSULTORIO.Open                                  ! File CONSULTORIO used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('IMPRIMIR_CERTIFICADO_HAB2',ProgressWindow) ! Restore window settings from non-volatile store
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
    Relate:CONF_EMP.Close
    Relate:CONSULTORIO.Close
  END
  IF SELF.Opened
    INIMgr.Update('IMPRIMIR_CERTIFICADO_HAB2',ProgressWindow) ! Save window data to non-volatile store
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
  SELF.Attribute.Set(?GLO:LEY,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GLO:LEY,RepGen:XML,TargetAttr:TagName,'GLO:LEY')
  SELF.Attribute.Set(?GLO:LEY,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String16,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String16,RepGen:XML,TargetAttr:TagName,'String16')
  SELF.Attribute.Set(?String16,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?GLO:DIRECCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GLO:DIRECCION,RepGen:XML,TargetAttr:TagName,'GLO:DIRECCION')
  SELF.Attribute.Set(?GLO:DIRECCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String22,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String22,RepGen:XML,TargetAttr:TagName,'String22')
  SELF.Attribute.Set(?String22,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String7,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String7,RepGen:XML,TargetAttr:TagName,'String7')
  SELF.Attribute.Set(?String7,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?LOC:DESCRIPCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?LOC:DESCRIPCION,RepGen:XML,TargetAttr:TagName,'LOC:DESCRIPCION')
  SELF.Attribute.Set(?LOC:DESCRIPCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String20,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String20,RepGen:XML,TargetAttr:TagName,'String20')
  SELF.Attribute.Set(?String20,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?CON2:DIRECCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?CON2:DIRECCION,RepGen:XML,TargetAttr:TagName,'CON2:DIRECCION')
  SELF.Attribute.Set(?CON2:DIRECCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String11,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String11,RepGen:XML,TargetAttr:TagName,'String11')
  SELF.Attribute.Set(?String11,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagName,'SOC:NOMBRE')
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?TIP6:DESCRIPCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?TIP6:DESCRIPCION,RepGen:XML,TargetAttr:TagName,'TIP6:DESCRIPCION')
  SELF.Attribute.Set(?TIP6:DESCRIPCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String14,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String14,RepGen:XML,TargetAttr:TagName,'String14')
  SELF.Attribute.Set(?String14,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String19,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String19,RepGen:XML,TargetAttr:TagName,'String19')
  SELF.Attribute.Set(?String19,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?GLO:FECHA_LARGO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GLO:FECHA_LARGO,RepGen:XML,TargetAttr:TagName,'GLO:FECHA_LARGO')
  SELF.Attribute.Set(?GLO:FECHA_LARGO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?GLO:FIRMA2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GLO:FIRMA2,RepGen:XML,TargetAttr:TagName,'GLO:FIRMA2')
  SELF.Attribute.Set(?GLO:FIRMA2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?GLO:FIRMA1,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GLO:FIRMA1,RepGen:XML,TargetAttr:TagName,'GLO:FIRMA1')
  SELF.Attribute.Set(?GLO:FIRMA1,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String15,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String15,RepGen:XML,TargetAttr:TagName,'String15')
  SELF.Attribute.Set(?String15,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String21,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String21,RepGen:XML,TargetAttr:TagName,'String21')
  SELF.Attribute.Set(?String21,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?loc:fecha_val,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?loc:fecha_val,RepGen:XML,TargetAttr:TagName,'loc:fecha_val')
  SELF.Attribute.Set(?loc:fecha_val,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String23,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String23,RepGen:XML,TargetAttr:TagName,'String23')
  SELF.Attribute.Set(?String23,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?loc:fecha,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?loc:fecha,RepGen:XML,TargetAttr:TagName,'loc:fecha')
  SELF.Attribute.Set(?loc:fecha,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagName,'SOC:MATRICULA')
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagValueFromText,True)


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  COF:RAZON_SOCIAL = 'Colegio de Psicólogos del Valle Inferior de Rió Negro'
  EXECUTE (MONTH(CON2:FECHA_HABILITACION))
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
  loc:fecha_hab = CON2:FECHA_HABILITACION
  LOC:FECHA = DAY(CON2:FECHA_HABILITACION) & ' de ' &CLIP(Mes")&' '&Year(CON2:FECHA_HABILITACION)
  loc:fecha_val = CON2:FECHA_HABILITACION  +  1824
                                              
  
  !ACCESS:CONF_EMP.TRYFETCH(COF:PK_CONF_EMP)
  !Report$?Image2{PROP:NoWidth} = TRUE
  !Report$?Image2{PROP:NoHeight} = TRUE
  !Report$?Image2{PROP:ImageBlob} = COF:LOGO{PROP:Handle}
  !Report$?Image2{PROP:Height} = 40
  !Report$?Image2{PROP:Width} = 60
  
  !Report$?Image3{PROP:NoWidth} = TRUE
  !Report$?Image3{PROP:NoHeight} = TRUE
  !Report$?Image3{PROP:ImageBlob} = COF:LOGO_FIRMA2{PROP:Handle}
  !Report$?Image3{PROP:Height} = 40
  !Report$?Image3{PROP:Width} = 60
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
  SELF.SetDocumentInfo('CW Report','Gestion','IMPRIMIR_CERTIFICADO_HAB2','IMPRIMIR_CERTIFICADO_HAB2','','')
  SELF.SetPagesAsParentBookmark(False)
  SELF.SetScanCopyMode(False)
  SELF.CompressText   = True
  SELF.CompressImages = True

!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the CONSULTORIO File
!!! </summary>
CERTIFICADO_CONSULTORIO PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(CONSULTORIO)
                       PROJECT(CON2:IDCONSULTORIO)
                       PROJECT(CON2:IDSOCIO)
                       PROJECT(CON2:FECHA_HABILITACION)
                       PROJECT(CON2:FECHA_VTO)
                       PROJECT(CON2:IDLOCALIDAD)
                       PROJECT(CON2:DIRECCION)
                       PROJECT(CON2:FECHA)
                       PROJECT(CON2:LIBRO)
                       PROJECT(CON2:FOLIO)
                       PROJECT(CON2:ACTA)
                       PROJECT(CON2:ACTIVO)
                       PROJECT(CON2:IDINSPECTOR)
                       JOIN(INS:PK_INSPECTOR,CON2:IDINSPECTOR)
                         PROJECT(INS:IDINSPECTOR)
                       END
                       JOIN(SOC:PK_SOCIOS,CON2:IDSOCIO)
                         PROJECT(SOC:MATRICULA)
                         PROJECT(SOC:NOMBRE)
                         PROJECT(SOC:CANTIDAD)
                         PROJECT(SOC:IDSOCIO)
                       END
                       JOIN(LOC:PK_LOCALIDAD,CON2:IDLOCALIDAD)
                         PROJECT(LOC:DESCRIPCION)
                         PROJECT(LOC:IDLOCALIDAD)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
CON2:IDCONSULTORIO     LIKE(CON2:IDCONSULTORIO)       !List box control field - type derived from field
CON2:IDSOCIO           LIKE(CON2:IDSOCIO)             !List box control field - type derived from field
SOC:MATRICULA          LIKE(SOC:MATRICULA)            !List box control field - type derived from field
SOC:NOMBRE             LIKE(SOC:NOMBRE)               !List box control field - type derived from field
SOC:CANTIDAD           LIKE(SOC:CANTIDAD)             !List box control field - type derived from field
CON2:FECHA_HABILITACION LIKE(CON2:FECHA_HABILITACION) !List box control field - type derived from field
CON2:FECHA_VTO         LIKE(CON2:FECHA_VTO)           !List box control field - type derived from field
CON2:IDLOCALIDAD       LIKE(CON2:IDLOCALIDAD)         !List box control field - type derived from field
LOC:DESCRIPCION        LIKE(LOC:DESCRIPCION)          !List box control field - type derived from field
CON2:DIRECCION         LIKE(CON2:DIRECCION)           !List box control field - type derived from field
CON2:FECHA             LIKE(CON2:FECHA)               !List box control field - type derived from field
CON2:LIBRO             LIKE(CON2:LIBRO)               !List box control field - type derived from field
CON2:FOLIO             LIKE(CON2:FOLIO)               !List box control field - type derived from field
CON2:ACTA              LIKE(CON2:ACTA)                !List box control field - type derived from field
CON2:ACTIVO            LIKE(CON2:ACTIVO)              !List box control field - type derived from field
INS:IDINSPECTOR        LIKE(INS:IDINSPECTOR)          !Related join file key field - type derived from field
SOC:IDSOCIO            LIKE(SOC:IDSOCIO)              !Related join file key field - type derived from field
LOC:IDLOCALIDAD        LIKE(LOC:IDLOCALIDAD)          !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('CERTIFICADO DE CONSTRUCTORA'),AT(,,421,198),FONT('MS Sans Serif',8,,FONT:regular), |
  RESIZE,CENTER,GRAY,IMM,MDI,HLP('Certidicacion_consultorio'),SYSTEM
                       LIST,AT(8,41,410,123),USE(?Browse:1),HVSCROLL,FORMAT('43L(2)|M~IDCONSUL~C(0)@n-7@[40L(2' & |
  ')|M~IDSOCIO~C(0)@n-7@38L(2)|M~MATRIC~C(0)@n-7@120L(2)|M~NOMBRE~C(0)@s30@56L(2)|M~CAN' & |
  'TIDAD~C(0)@n-14@]|M~COLEGIADO~78L(2)|M~FECHA HABILITACION~C(0)@d17@40L(2)|M~FECHA VT' & |
  'O~C(0)@d17@[31L(2)|M~IDLOC~L(0)@n-7@80L(2)|M~DESCRIP~C(0)@s20@](115)|M~LOCALIDAD~80L' & |
  '(2)|M~DIRECCION~@s50@49L(2)|M~FECHA~L(0)@d17@32L(2)|M~LIBRO~C(0)@n-7@31L(2)|M~FOLIO~' & |
  'C(0)@n-7@80L(2)|M~ACTA~@s20@8L(2)|M~ACTIVO~L(0)@s2@'),FROM(Queue:Browse:1),IMM,MSG('Administra' & |
  'dor de CONSULTORIO'),VCR
                       BUTTON('Imprimir Cetificado'),AT(5,179,83,14),USE(?Button2),LEFT,ICON(ICON:Print1),FLAT
                       BUTTON('Imprimir Certificado Apaisado'),AT(100,180,123,14),USE(?Button4),LEFT,ICON(ICON:Print1), |
  FLAT
                       SHEET,AT(3,4,417,167),USE(?CurrentTab)
                         TAB('CONSULTORIO'),USE(?Tab:1)
                           PROMPT('IDCONSULTORIO:'),AT(9,25),USE(?CON2:IDCONSULTORIO:Prompt)
                           ENTRY(@n-14),AT(77,25,60,10),USE(CON2:IDCONSULTORIO),REQ
                         END
                         TAB('COLEGIADO'),USE(?Tab:2)
                           BUTTON('...'),AT(109,25,12,12),USE(?CallLookup)
                           PROMPT('IDSOCIO:'),AT(7,26),USE(?GLO:IDSOCIO:Prompt)
                           ENTRY(@n-14),AT(44,26,60,10),USE(GLO:IDSOCIO),REQ
                         END
                       END
                       BUTTON('&Salir'),AT(367,181,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Salir'),TIP('Salir')
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeSelected           PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
                     END

BRW1::Sort0:Locator  EntryLocatorClass                     ! Default Locator
BRW1::Sort3:Locator  EntryLocatorClass                     ! Conditional Locator - CHOICE(?CurrentTab) = 2
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
  GlobalErrors.SetProcedureName('CERTIFICADO_CONSULTORIO')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('CON2:IDCONSULTORIO',CON2:IDCONSULTORIO)            ! Added by: BrowseBox(ABC)
  BIND('INS:IDINSPECTOR',INS:IDINSPECTOR)                  ! Added by: BrowseBox(ABC)
  BIND('SOC:IDSOCIO',SOC:IDSOCIO)                          ! Added by: BrowseBox(ABC)
  BIND('LOC:IDLOCALIDAD',LOC:IDLOCALIDAD)                  ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:CONSULTORIO.Open                                  ! File CONSULTORIO used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:CONSULTORIO,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,CON2:FK_CONSULTORIO_SOCIOS)           ! Add the sort order for CON2:FK_CONSULTORIO_SOCIOS for sort order 1
  BRW1.AddRange(CON2:IDSOCIO,GLO:IDSOCIO)                  ! Add single value range limit for sort order 1
  BRW1.AddLocator(BRW1::Sort3:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort3:Locator.Init(,CON2:IDSOCIO,,BRW1)            ! Initialize the browse locator using  using key: CON2:FK_CONSULTORIO_SOCIOS , CON2:IDSOCIO
  BRW1.SetFilter('(SOC:CANTIDAD <<= 4  AND CON2:ACTIVO <<> ''NO'' )') ! Apply filter expression to browse
  BRW1.AddSortOrder(,CON2:PK_CONSULTORIO)                  ! Add the sort order for CON2:PK_CONSULTORIO for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(?CON2:IDCONSULTORIO,CON2:IDCONSULTORIO,,BRW1) ! Initialize the browse locator using ?CON2:IDCONSULTORIO using key: CON2:PK_CONSULTORIO , CON2:IDCONSULTORIO
  BRW1.SetFilter('(SOC:CANTIDAD <<= 4  AND CON2:ACTIVO <<> ''NO'')') ! Apply filter expression to browse
  BRW1.AddField(CON2:IDCONSULTORIO,BRW1.Q.CON2:IDCONSULTORIO) ! Field CON2:IDCONSULTORIO is a hot field or requires assignment from browse
  BRW1.AddField(CON2:IDSOCIO,BRW1.Q.CON2:IDSOCIO)          ! Field CON2:IDSOCIO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:MATRICULA,BRW1.Q.SOC:MATRICULA)        ! Field SOC:MATRICULA is a hot field or requires assignment from browse
  BRW1.AddField(SOC:NOMBRE,BRW1.Q.SOC:NOMBRE)              ! Field SOC:NOMBRE is a hot field or requires assignment from browse
  BRW1.AddField(SOC:CANTIDAD,BRW1.Q.SOC:CANTIDAD)          ! Field SOC:CANTIDAD is a hot field or requires assignment from browse
  BRW1.AddField(CON2:FECHA_HABILITACION,BRW1.Q.CON2:FECHA_HABILITACION) ! Field CON2:FECHA_HABILITACION is a hot field or requires assignment from browse
  BRW1.AddField(CON2:FECHA_VTO,BRW1.Q.CON2:FECHA_VTO)      ! Field CON2:FECHA_VTO is a hot field or requires assignment from browse
  BRW1.AddField(CON2:IDLOCALIDAD,BRW1.Q.CON2:IDLOCALIDAD)  ! Field CON2:IDLOCALIDAD is a hot field or requires assignment from browse
  BRW1.AddField(LOC:DESCRIPCION,BRW1.Q.LOC:DESCRIPCION)    ! Field LOC:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(CON2:DIRECCION,BRW1.Q.CON2:DIRECCION)      ! Field CON2:DIRECCION is a hot field or requires assignment from browse
  BRW1.AddField(CON2:FECHA,BRW1.Q.CON2:FECHA)              ! Field CON2:FECHA is a hot field or requires assignment from browse
  BRW1.AddField(CON2:LIBRO,BRW1.Q.CON2:LIBRO)              ! Field CON2:LIBRO is a hot field or requires assignment from browse
  BRW1.AddField(CON2:FOLIO,BRW1.Q.CON2:FOLIO)              ! Field CON2:FOLIO is a hot field or requires assignment from browse
  BRW1.AddField(CON2:ACTA,BRW1.Q.CON2:ACTA)                ! Field CON2:ACTA is a hot field or requires assignment from browse
  BRW1.AddField(CON2:ACTIVO,BRW1.Q.CON2:ACTIVO)            ! Field CON2:ACTIVO is a hot field or requires assignment from browse
  BRW1.AddField(INS:IDINSPECTOR,BRW1.Q.INS:IDINSPECTOR)    ! Field INS:IDINSPECTOR is a hot field or requires assignment from browse
  BRW1.AddField(SOC:IDSOCIO,BRW1.Q.SOC:IDSOCIO)            ! Field SOC:IDSOCIO is a hot field or requires assignment from browse
  BRW1.AddField(LOC:IDLOCALIDAD,BRW1.Q.LOC:IDLOCALIDAD)    ! Field LOC:IDLOCALIDAD is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('CERTIFICADO_CONSULTORIO',QuickWindow)      ! Restore window settings from non-volatile store
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
    Relate:CONSULTORIO.Close
  END
  IF SELF.Opened
    INIMgr.Update('CERTIFICADO_CONSULTORIO',QuickWindow)   ! Save window data to non-volatile store
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
      SelectSOCIOS
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
    OF ?Button2
      GLO:IDSOLICITUD = CON2:IDCONSULTORIO
      GLO:IDSOCIO = CON2:IDSOCIO
      REPORTE_LARGO = 'CERTIFICADO DE HABILITACION DE CONSULTORIO'
      
      !!! BUSCA EL CORREO ELECTRONICO PARA ENVIAR POR EMAIL
      GLO:IDSOCIO = CON2:IDSOCIO
      GET (SOCIOS,SOC:PK_SOCIOS)
      IF ERRORCODE()= 35 THEN
          MESSAGE('NO SE ENCONTRO EL SOCIO')
      ELSE
         GLO:EMAIL = SOC:EMAIL
      END
      CARGA_AUDITORIA()
      IMPRIMIR_CERTIFICADO_HABILITACION()
    OF ?Button4
      GLO:IDSOLICITUD = CON2:IDCONSULTORIO
      GLO:IDSOCIO = CON2:IDSOCIO
      REPORTE_LARGO = 'CERTIFICADO DE HABILITACION DE CONSULTORIO'
      
      !!! BUSCA EL CORREO ELECTRONICO PARA ENVIAR POR EMAIL
      GLO:IDSOCIO = CON2:IDSOCIO
      GET (SOCIOS,SOC:PK_SOCIOS)
      IF ERRORCODE()= 35 THEN
          MESSAGE('NO SE ENCONTRO EL SOCIO')
      ELSE
          GLO:EMAIL = SOC:EMAIL
      END
      
      CARGA_AUDITORIA()
      IMPRIMIR_CERTIFICADO_HAB2()
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?CallLookup
      ThisWindow.Update()
      SOC:IDSOCIO = GLO:IDSOCIO
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        GLO:IDSOCIO = SOC:IDSOCIO
      END
      ThisWindow.Reset(1)
    OF ?GLO:IDSOCIO
      IF GLO:IDSOCIO OR ?GLO:IDSOCIO{PROP:Req}
        SOC:IDSOCIO = GLO:IDSOCIO
        IF Access:SOCIOS.TryFetch(SOC:PK_SOCIOS)
          IF SELF.Run(1,SelectRecord) = RequestCompleted
            GLO:IDSOCIO = SOC:IDSOCIO
          ELSE
            SELECT(?GLO:IDSOCIO)
            CYCLE
          END
        END
      END
      ThisWindow.Reset()
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeSelected PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all Selected events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  ReturnValue = PARENT.TakeSelected()
    CASE FIELD()
    OF ?GLO:IDSOCIO
      SOC:IDSOCIO = GLO:IDSOCIO
      IF Access:SOCIOS.TryFetch(SOC:PK_SOCIOS)
        IF SELF.Run(1,SelectRecord) = RequestCompleted
          GLO:IDSOCIO = SOC:IDSOCIO
        END
      END
      ThisWindow.Reset()
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


BRW1.ResetSort PROCEDURE(BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  IF CHOICE(?CurrentTab) = 2
    RETURN SELF.SetSort(1,Force)
  ELSE
    RETURN SELF.SetSort(2,Force)
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
IMPRIMIR_CERTIFICADO_HABILITACION PROCEDURE 

Progress:Thermometer BYTE                                  ! 
LOC:FECHA            STRING(50)                            ! 
loc:fecha_Val        LONG                                  ! 
Process:View         VIEW(CONSULTORIO)
                       PROJECT(CON2:DIRECCION)
                       PROJECT(CON2:IDCONSULTORIO)
                       PROJECT(CON2:IDSOCIO)
                       PROJECT(CON2:IDLOCALIDAD)
                       JOIN(SOC:PK_SOCIOS,CON2:IDSOCIO)
                         PROJECT(SOC:MATRICULA)
                         PROJECT(SOC:NOMBRE)
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

Report               REPORT,AT(25,86,156,157),PRE(RPT),PAPER(PAPER:A4),FONT('Arial',10,,FONT:regular,CHARSET:ANSI), |
  MM
                       HEADER,AT(25,25,156,48),USE(?Header)
                         IMAGE('Logo.jpg'),AT(1,1,43,29),USE(?Image3)
                         STRING('Ley Nº: '),AT(79,25),USE(?String16),FONT(,8),TRN
                         STRING(@s40),AT(92,25,19),USE(GLO:LEY),FONT(,8)
                         STRING('Per. Jur.:'),AT(46,25),USE(?String18),FONT(,8),TRN
                         STRING(@s20),AT(58,25,18),USE(GLO:PER_JUR),FONT(,8)
                         BOX,AT(0,36,161,1),USE(?Box1),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         STRING('CERTIFICADO DE HABILITACION'),AT(35,39),USE(?String6),FONT(,16,,FONT:bold+FONT:underline), |
  TRN
                         STRING(@s255),AT(0,30,156,5),USE(GLO:DIRECCION),FONT(,10),CENTER,TRN
                       END
Detail                 DETAIL,AT(0,0,,121),USE(?Detail)
                         STRING('CERTIFICAMOS que el Consultorio  del  Colegiado  sito en :'),AT(1,2),USE(?String7), |
  TRN
                         STRING(@s20),AT(56,11,42,4),USE(LOC:DESCRIPCION)
                         STRING(@s50),AT(94,2,61,5),USE(CON2:DIRECCION),LEFT(2)
                         STRING('Cuyo responsable es el TITULO:'),AT(1,19),USE(?String11),TRN
                         STRING(@s50),AT(53,19,96,5),USE(SOC:NOMBRE),FONT(,,,FONT:bold),LEFT(2)
                         STRING('Matricula Profesional Nro.'),AT(1,28),USE(?String14),TRN
                         STRING('según los registros obrantes en esta institución en ejercicio  de las '),AT(53,36, |
  103,5),USE(?String22),TRN
                         STRING(@s30),AT(1,36,52,5),USE(LOC:FECHA)
                         STRING('atribuciones que le la Ley.'),AT(1,44,75,5),USE(?String17),TRN
                         STRING('El presente certificado es válido hasta:'),AT(1,52),USE(?String20),TRN
                         STRING(@d6),AT(61,52),USE(loc:fecha_Val),TRN
                         STRING('VIEDMA,'),AT(1,63),USE(?String19),TRN
                         STRING(@s50),AT(19,63,82,5),USE(GLO:FECHA_LARGO)
                         TEXT,AT(3,90,69,20),USE(GLO:FIRMA2),BOXED
                         TEXT,AT(83,90,69,20),USE(GLO:FIRMA1),CENTER,BOXED
                         STRING('está habilitado por este Colegio, desde el'),AT(53,28),USE(?String15),TRN
                         STRING(@s4),AT(42,28),USE(SOC:MATRICULA)
                       END
                       FOOTER,AT(25,242,156,25),USE(?Footer)
                       END
                       FORM,AT(25,25,156,242),USE(?Form)
                       END
                     END
LocE::Direccion            STRING(5000)
LocE::DireccionCC          STRING(5000)
LocE::DireccionCCO         STRING(5000)
LocE::Subject              STRING(255)
LocE::Body                 STRING(2048)
LocE::FileName             STRING(5000)
LocE::Retorno              LONG
LocE::Flags                SHORT
LocE::Dialogo              BYTE
QAtach                   QUEUE
Attach                     CSTRING(5000)
                         END
Loc::Attach                 string(5000)
Loc::Cadena                 String(1)
Loc::Archivo                string(500)

LocE::GolDesde          SHORT
LocE::GolHasta          SHORT
LocE::Cancelar          BYTE
LocE::Atach             STRING(10000)
LocE::FileSend          STRING(5000)
LocE::Titulo            STRING(500)
LocE::NombreFile        STRING(500)
LocE::Qpar      QUEUE,PRE(QP)
Par                     CSTRING(1000)
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

?Menu_eMail     EQUATE(-1026)
?EnviarxMailWMF     EQUATE(-1027)
?EnviarxMailWord    EQUATE(-1028)
?EnviaraWord        EQUATE(-1029)
Gol_wo WINDOW,AT(,,236,43),FONT('Tahoma',8,,FONT:regular),CENTER,GRAY
       IMAGE('Mail.ico'),AT(8,7),USE(?Imgout),CENTERED
       PROGRESS,USE(?ProgOutlook),AT(38,9,164,9),RANGE(0,100)
       GROUP,AT(38,21,164,9),USE(?Group1),BOXED,BEVEL(-1)
         STRING('Generando Archivos de Mail'),AT(76,21),USE(?StrOut),TRN
       END
     END
WGolPrompt WINDOW,AT(,,160,80),FONT('Tahoma',8,,FONT:bold),CENTER,GRAY
       GROUP,AT(2,2,156,76),USE(?Group_gol),BOXED,BEVEL(-1)
         IMAGE('mail.ico'),AT(5,5,30,17),USE(?Image_gol),CENTERED
         GROUP,AT(36,8,88,36),USE(?Group2),BOXED,BEVEL(1,1)
           PROMPT('Pagina Desde:'),AT(43,14),USE(?Prompt_gol)
           SPIN(@n02),AT(92,14,25,10),USE(LocE::GolDesde),RANGE(1,100),STEP(1)
           PROMPT('Pagina Hasta:'),AT(43,28),USE(?Prompt_Gol2)
           SPIN(@n02),AT(92,28,25,10),USE(LocE::GolHasta),RANGE(1,100),STEP(1)
         END
         BUTTON('Enviar'),AT(27,59,50,14),USE(?Enviar),LEFT,ICON('wizok.ico')
         BUTTON('Cancelar'),AT(83,59,50,14),USE(?Cancelar),LEFT,ICON('wizcncl.ico')
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
!!! Inicio Ec. Templates
SendMailPrompt     ROUTINE
  OPEN(WGolPrompt)
  ALERT(EnterKey)
      POST(Event:OpenWindow)
      ACCEPT
        CASE EVENT()
        OF Event:OpenWindow
            CYCLE
        OF EVENT:AlertKey
           CASE KEYCODE()
             OF EnterKey
                MiControl# = FOCUS()
                CASE MiControl#{Prop:Type}
                  OF CREATE:Button
                     POST(EVENT:ACCEPTED,MiControl#)
                  ELSE
                     IF FOCUS()<> ?Enviar
                        PRESSKEY(TabKey)
                        CYCLE
                     ELSE
                        POST(Event:Accepted,?Enviar)
                     END!IF
                END!CASE
           END!CASE
        END!CASE EVENT
        CASE FIELD()
        OF ?Enviar
          CASE Event()
          OF Event:Accepted
            POST(Event:CloseWindow)
          OF EVENT:AlertKey
             CASE KEYCODE()
               OF EnterKey
                  MiControl# = FOCUS()
                  CASE MiControl#{Prop:Type}
                    OF CREATE:Button
                       POST(EVENT:ACCEPTED,MiControl#)
                    ELSE
                       IF FOCUS()<> ?Enviar
                          PRESSKEY(TabKey)
                          CYCLE
                       ELSE
                          ! Se presiono el ENTER estando posicionado el OK
                          POST(Event:Accepted,?Enviar)
                       END!IF
                  END!CASE
             END!CASE
          END
        OF ?Cancelar
          CASE Event()
          OF Event:Accepted
            LocE::Cancelar = True
            POST(Event:CloseWindow)
          OF EVENT:AlertKey
             CASE KEYCODE()
               OF EnterKey
                  MiControl# = FOCUS()
                  CASE MiControl#{Prop:Type}
                    OF CREATE:Button
                       POST(EVENT:ACCEPTED,MiControl#)
                    ELSE
                       IF FOCUS()<> ?Enviar
                          PRESSKEY(TabKey)
                          CYCLE
                       ELSE
                          POST(Event:Accepted,?Enviar)
                       END!IF
                  END!CASE
             END!CASE
          END
        END
      END !END ACCEPT
  CLOSE(WGolPrompt)
!************ Fin de ROUTINE Ec_Mail*********************

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('IMPRIMIR_CERTIFICADO_HABILITACION')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:CONF_EMP.Open                                     ! File CONF_EMP used by this procedure, so make sure it's RelationManager is open
  Relate:CONSULTORIO.Open                                  ! File CONSULTORIO used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('IMPRIMIR_CERTIFICADO_HABILITACION',ProgressWindow) ! Restore window settings from non-volatile store
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
  
  
  EXECUTE (MONTH(CON2:FECHA_HABILITACION))
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
  
  LOC:FECHA = DAY(CON2:FECHA_HABILITACION) & ' de ' &CLIP(Mes")&' '&Year(CON2:FECHA_HABILITACION)
                                                                                              
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:CONF_EMP.Close
    Relate:CONSULTORIO.Close
  END
  IF SELF.Opened
    INIMgr.Update('IMPRIMIR_CERTIFICADO_HABILITACION',ProgressWindow) ! Save window data to non-volatile store
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
  SELF.Attribute.Set(?String16,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String16,RepGen:XML,TargetAttr:TagName,'String16')
  SELF.Attribute.Set(?String16,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?GLO:LEY,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GLO:LEY,RepGen:XML,TargetAttr:TagName,'GLO:LEY')
  SELF.Attribute.Set(?GLO:LEY,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String18,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String18,RepGen:XML,TargetAttr:TagName,'String18')
  SELF.Attribute.Set(?String18,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?GLO:PER_JUR,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GLO:PER_JUR,RepGen:XML,TargetAttr:TagName,'GLO:PER_JUR')
  SELF.Attribute.Set(?GLO:PER_JUR,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String6,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String6,RepGen:XML,TargetAttr:TagName,'String6')
  SELF.Attribute.Set(?String6,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?GLO:DIRECCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GLO:DIRECCION,RepGen:XML,TargetAttr:TagName,'GLO:DIRECCION')
  SELF.Attribute.Set(?GLO:DIRECCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String7,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String7,RepGen:XML,TargetAttr:TagName,'String7')
  SELF.Attribute.Set(?String7,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?LOC:DESCRIPCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?LOC:DESCRIPCION,RepGen:XML,TargetAttr:TagName,'LOC:DESCRIPCION')
  SELF.Attribute.Set(?LOC:DESCRIPCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?CON2:DIRECCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?CON2:DIRECCION,RepGen:XML,TargetAttr:TagName,'CON2:DIRECCION')
  SELF.Attribute.Set(?CON2:DIRECCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String11,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String11,RepGen:XML,TargetAttr:TagName,'String11')
  SELF.Attribute.Set(?String11,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagName,'SOC:NOMBRE')
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String14,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String14,RepGen:XML,TargetAttr:TagName,'String14')
  SELF.Attribute.Set(?String14,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String22,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String22,RepGen:XML,TargetAttr:TagName,'String22')
  SELF.Attribute.Set(?String22,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?LOC:FECHA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?LOC:FECHA,RepGen:XML,TargetAttr:TagName,'LOC:FECHA')
  SELF.Attribute.Set(?LOC:FECHA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String17,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String17,RepGen:XML,TargetAttr:TagName,'String17')
  SELF.Attribute.Set(?String17,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String20,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String20,RepGen:XML,TargetAttr:TagName,'String20')
  SELF.Attribute.Set(?String20,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?loc:fecha_Val,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?loc:fecha_Val,RepGen:XML,TargetAttr:TagName,'loc:fecha_Val')
  SELF.Attribute.Set(?loc:fecha_Val,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String19,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String19,RepGen:XML,TargetAttr:TagName,'String19')
  SELF.Attribute.Set(?String19,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?GLO:FECHA_LARGO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GLO:FECHA_LARGO,RepGen:XML,TargetAttr:TagName,'GLO:FECHA_LARGO')
  SELF.Attribute.Set(?GLO:FECHA_LARGO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?GLO:FIRMA2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GLO:FIRMA2,RepGen:XML,TargetAttr:TagName,'GLO:FIRMA2')
  SELF.Attribute.Set(?GLO:FIRMA2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?GLO:FIRMA1,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?GLO:FIRMA1,RepGen:XML,TargetAttr:TagName,'GLO:FIRMA1')
  SELF.Attribute.Set(?GLO:FIRMA1,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String15,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String15,RepGen:XML,TargetAttr:TagName,'String15')
  SELF.Attribute.Set(?String15,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagName,'SOC:MATRICULA')
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagValueFromText,True)


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  COF:RAZON_SOCIAL = 'Colegio de Psicólogos del Valle Inferior de Rió Negro'
  loc:fecha_Val = CON2:FECHA_HABILITACION + 1824
  
  !ACCESS:CONF_EMP.TRYFETCH(COF:PK_CONF_EMP)
  !Report$?Image2{PROP:NoWidth} = TRUE
  !Report$?Image2{PROP:NoHeight} = TRUE
  !Report$?Image2{PROP:ImageBlob} = COF:LOGO{PROP:Handle}
  !Report$?Image2{PROP:Height} = 40
  !Report$?Image2{PROP:Width} = 60
  
  !Report$?Image3{PROP:NoWidth} = TRUE
  !Report$?Image3{PROP:NoHeight} = TRUE
  !Report$?Image3{PROP:ImageBlob} = COF:LOGO_FIRMA2{PROP:Handle}
  !Report$?Image3{PROP:Height} = 40
  !Report$?Image3{PROP:Width} = 60
  ReturnValue = PARENT.TakeRecord()
  PRINT(RPT:Detail)
  RETURN ReturnValue


Previewer.Open PROCEDURE

  CODE
  PARENT.Open
  CREATE(?Menu_eMail,CREATE:Menu)
  ?Menu_eMail{PROP:text} = 'Enviar x eMail'
  ?Menu_eMail{PROP:use} = LASTFIELD()+301
  UNHIDE(?Menu_eMail)
  
  if 'Enviar Imagenes [WMF]' <> '' !!! Activa Envio de Imagen
    CREATE(?EnviarxMailWmf,CREATE:Item,?Menu_eMail)
    ?EnviarxMailwmf{PROP:use} = LASTFIELD()+302
    ?EnviarxMailwmf{PROP:text} = 'Enviar Imagenes [WMF]'
  UNHIDE(?EnviarxMailwmf)
  end
  
  if 'Enviar Reporte en Word' <> '' !!! Activa Envio de Imagen a Word
    CREATE(?EnviarxMailWord,CREATE:Item,?Menu_eMail)
    ?EnviarxMailWord{PROP:use} = LASTFIELD()+303
    ?EnviarxMailWord{PROP:text} = 'Enviar Reporte en Word'
    UNHIDE(?EnviarxMailWord)
  end
  
  if 'Enviar Reporte a Word' <> '' !!! Activa Envio de Imagen a Word
  CREATE(?EnviaraWord,CREATE:Item,?Menu_eMail)
  ?EnviaraWord{PROP:use} = LASTFIELD()+304
  ?EnviaraWord{PROP:text} = 'Enviar Reporte a Word'
  UNHIDE(?EnviaraWord)
  end


Previewer.TakeEvent PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeEvent()
  LocE::GolDesde =1
  LocE::GolHasta =RECORDS(SELF.ImageQueue)
  LocE::Cancelar = False
  case event()
    of EVENT:Accepted
    Case field()
     of ?EnviarxMailWmf
           Do SendMailPrompt
      IF NOT LocE::Cancelar
           FREE(QAtach)
           OPEN(Gol_wo)
           DISPLAY()
           !!!!!!! manejo de WMF
           get(SELF.ImageQueue,POINTER(SELF.ImageQueue))
           loop a# = 1 to RECORDS(SELF.ImageQueue)
           IF a# >=LocE::GolDesde and a# <=LocE::GolHasta
              IF a# > 40 THEN BREAK.
              get(SELF.ImageQueue,a#)
              if self.InPageList(a#)
                 P# = INSTRING('.',SELF.ImageQueue,1,2)
                 LocE::Titulo     = 'CERTIFICADO DE CONSULTORIO'
                 LocE::NombreFile = 'P('&SUB(LocE::Titulo,1,2)&')H'&a#&'.WMF'
                 IF EXISTS(CLIP(LocE::NombreFile)) Then REMOVE(CLIP(LocE::NombreFile)).
                 COPY(SELF.ImageQueue,CLIP(LocE::NombreFile))
                 IF ERRORCODE() THEN MESSAGE(ERROR()).
                 QAtach.Attach = PATH()&'\'& CLIP(LocE::NombreFile)
                 ADD(QAtach)
                 IF ERRORCODE() THEN MESSAGE(ERROR()).
                    LocE::Atach = CLIP(LocE::Atach)&';' & CLIP(LocE::NombreFile)
                 end
              END
           end
           LocE::Flags     = False
           LocE::Subject   = 'CERTIFICADO DE CONSULTORIO'
           LocE::Body      = ''
           CLOSE(Gol_wo)
           LocE::Direccion = GLO:EMAIL
           LocE::Dialogo  = 1
           SAVEPath"   = PATH()
           IF LocE::Dialogo THEN LocE::Flags  =MAPI_DIALOG.
            E#  = SendMail(LocE::Dialogo,LocE::Direccion,LocE::Subject,LocE::Body,LocE::DireccionCC,QAtach)
           SETPATH(SAVEPath")
           POST(Event:CloseWindow)
       END !! NOT LocE::Cancelar
     Of ?EnviaraWord
      Do SendMailPrompt
      IF NOT LocE::Cancelar
          FREE(LocE::Qpar)
          FREE(QAtach)
          LOcE::Qpar.QP:Par  = 'CERTIFICADO DE CONSULTORIO'
          ADD(LocE::Qpar)
          LOcE::Qpar.QP:Par  = false
          ADD(LocE::Qpar)
          LOcE::Qpar.QP:Par  = ''
          ADD(LocE::Qpar)
          LOcE::Qpar.QP:Par  = ''
          ADD(LocE::Qpar)
          LOcE::Qpar.QP:Par  =         0
          ADD(LocE::Qpar)
          OPEN(Gol_wo)
          DISPLAY()
           !!!!!!! manejo de WMF
           get(SELF.ImageQueue,POINTER(SELF.ImageQueue))
           loop a# = 1 to RECORDS(SELF.ImageQueue)
           IF a# >=LocE::GolDesde and a# <=LocE::GolHasta
              IF a# > 40 THEN BREAK.
              get(SELF.ImageQueue,a#)
              if self.InPageList(a#)
                 P# = INSTRING('.',SELF.ImageQueue,1,2)
                 LocE::Titulo     = 'CERTIFICADO DE CONSULTORIO'
                 LocE::NombreFile = 'P('&SUB(LocE::Titulo,1,2)&')H'&a#&'.WMF'
                 IF EXISTS(CLIP(LocE::NombreFile)) Then REMOVE(CLIP(LocE::NombreFile)).
                 COPY(SELF.ImageQueue,CLIP(LocE::NombreFile))
                 IF ERRORCODE() THEN MESSAGE(ERROR()).
                 QAtach.Attach = PATH()&'\'& CLIP(LocE::NombreFile)
                 ADD(QAtach)
                 IF ERRORCODE() THEN MESSAGE(ERROR()).
                    LocE::Atach = CLIP(LocE::Atach)&';' & CLIP(LocE::NombreFile)
                 end
              END
           end
          LocE::FileName = ''
          EXPORTWORD(QAtach,LocE::Qpar,LocE::FileSend)
          SETPATH(SAVEPath")
          CLOSE(Gol_wo)
          POST(Event:CloseWindow)
       END
     of ?EnviarxMailWord
      Do SendMailPrompt
      IF NOT LocE::Cancelar
          FREE(LocE::Qpar)
          FREE(QAtach)
          OPEN(Gol_wo)
          DISPLAY()
           !!!!!!! manejo de WMF
           get(SELF.ImageQueue,POINTER(SELF.ImageQueue))
           loop a# = 1 to RECORDS(SELF.ImageQueue)
           IF a# >=LocE::GolDesde and a# <=LocE::GolHasta
              IF a# > 40 THEN BREAK.
              get(SELF.ImageQueue,a#)
              if self.InPageList(a#)
                 P# = INSTRING('.',SELF.ImageQueue,1,2)
                 LocE::Titulo     = 'CERTIFICADO DE CONSULTORIO'
                 LocE::NombreFile = 'P('&SUB(LocE::Titulo,1,2)&')H'&a#&'.WMF'
                 IF EXISTS(CLIP(LocE::NombreFile)) Then REMOVE(CLIP(LocE::Nombrefile)).
                 COPY(SELF.ImageQueue,CLIP(LocE::Nombrefile))
                 IF ERRORCODE() THEN MESSAGE(ERROR()).
                 QAtach.Attach = PATH()&'\'& CLIP(LocE::nombrefile)
                 ADD(QAtach)
                 IF ERRORCODE() THEN MESSAGE(ERROR()).
                    LocE::Atach = CLIP(LocE::Atach)&';' & CLIP(LocE::nombrefile)
                 end
              END
           end
          LOcE::Qpar.QP:Par  = 'CERTIFICADO DE CONSULTORIO'
          ADD(LocE::Qpar)
          LocE::FileName = ''
          EXPORTWORD(QAtach,LocE::Qpar,LocE::FileSend)
          IF LocE::FileSend
             LocE::Flags     = False
             LocE::Body      = ''
             LocE::Subject   = 'CERTIFICADO DE CONSULTORIO'
             FREE(QAtach)
             QAtach.Attach = PATH() & '\' & Sub(LocE::Subject,1,5) & '.doc'
             ADD(QAtach)
             LocE::Direccion = GLO:EMAIL
             LocE::Dialogo  = 1
             SAVEPath"   = PATH()
             IF LocE::Dialogo THEN LocE::Flags  +=MAPI_DIALOG.
             E#  = SendMail(LocE::Dialogo,LocE::Direccion,LocE::Subject,LocE::Body,LocE::DireccionCC,QAtach)
             SETPATH(SAVEPath")
             CLOSE(Gol_wo)
             POST(Event:CloseWindow)
          END
       END
    END !! CASE Field
  end!Case Event
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
  SELF.SetDocumentInfo('CW Report','Gestion','IMPRIMIR_CERTIFICADO_HABILITACION','IMPRIMIR_CERTIFICADO_HABILITACION','','')
  SELF.SetPagesAsParentBookmark(False)
  SELF.SetScanCopyMode(False)
  SELF.CompressText   = True
  SELF.CompressImages = True

!!! <summary>
!!! Generated from procedure template - Window
!!! Actualizacion TIPO_INSTITUCION
!!! </summary>
UpdateTIPO_INSTITUCION PROCEDURE 

CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
History::TIP4:Record LIKE(TIP4:RECORD),THREAD
QuickWindow          WINDOW('Actualizacion TIPO INSTITUCION'),AT(,,295,47),FONT('MS Sans Serif',8,,FONT:regular), |
  RESIZE,CENTER,GRAY,IMM,MDI,HLP('UpdateTIPO_INSTITUCION'),SYSTEM
                       PROMPT('DESCRIPCION:'),AT(5,6),USE(?TIP4:DESCRIPCION:Prompt),TRN
                       ENTRY(@s50),AT(85,6,204,10),USE(TIP4:DESCRIPCION),REQ
                       BUTTON('&Aceptar'),AT(186,26,49,14),USE(?OK),LEFT,ICON('ok.ico'),CURSOR('mano.cur'),DEFAULT, |
  FLAT,MSG('Confirma y Actualiza el Formulario'),TIP('Confirma y Actualiza el Formulario')
                       BUTTON('&Cancelar'),AT(237,26,58,14),USE(?Cancel),LEFT,ICON('cancelar.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Cancela Operacion'),TIP('Cancela Operacion')
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
  GlobalErrors.SetProcedureName('UpdateTIPO_INSTITUCION')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?TIP4:DESCRIPCION:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(TIP4:Record,History::TIP4:Record)
  SELF.AddHistoryField(?TIP4:DESCRIPCION,2)
  SELF.AddUpdateFile(Access:TIPO_INSTITUCION)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:TIPO_INSTITUCION.Open                             ! File TIPO_INSTITUCION used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:TIPO_INSTITUCION
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
    ?TIP4:DESCRIPCION{PROP:ReadOnly} = True
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdateTIPO_INSTITUCION',QuickWindow)       ! Restore window settings from non-volatile store
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
    Relate:TIPO_INSTITUCION.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateTIPO_INSTITUCION',QuickWindow)    ! Save window data to non-volatile store
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
!!! Browse the TIPO_INSTITUCION file
!!! </summary>
BrowseTIPO_INSTITUCION PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(TIPO_INSTITUCION)
                       PROJECT(TIP4:IDTIPO_INSTITUCION)
                       PROJECT(TIP4:DESCRIPCION)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
TIP4:IDTIPO_INSTITUCION LIKE(TIP4:IDTIPO_INSTITUCION) !List box control field - type derived from field
TIP4:DESCRIPCION       LIKE(TIP4:DESCRIPCION)         !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('ABM TIPO INSTITUCION'),AT(,,224,198),FONT('MS Sans Serif',8,,FONT:regular),RESIZE, |
  CENTER,GRAY,IMM,MDI,HLP('BrowseTIPO_INSTITUCION'),SYSTEM
                       LIST,AT(8,30,208,124),USE(?Browse:1),HVSCROLL,FORMAT('76R(2)|M~IDTIPO INSTITUCION~C(0)@' & |
  'n-14@80L(2)|M~DESCRIPCION~L(2)@s50@'),FROM(Queue:Browse:1),IMM,MSG('Administrador de' & |
  ' TIPO_INSTITUCION')
                       BUTTON('&Ver'),AT(8,158,49,14),USE(?View:2),LEFT,ICON('v.ico'),CURSOR('mano.cur'),FLAT,MSG('Visualizar'), |
  TIP('Visualizar')
                       BUTTON('&Agregar'),AT(61,158,49,14),USE(?Insert:3),LEFT,ICON('a.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Agrega Registro'),TIP('Agrega Registro')
                       BUTTON('&Cambiar'),AT(114,158,49,14),USE(?Change:3),LEFT,ICON('c.ico'),CURSOR('mano.cur'), |
  DEFAULT,FLAT,MSG('Cambia Registro'),TIP('Cambia Registro')
                       BUTTON('&Borrar'),AT(167,158,49,14),USE(?Delete:3),LEFT,ICON('b.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Borra Registro'),TIP('Borra Registro')
                       SHEET,AT(4,4,216,172),USE(?CurrentTab)
                         TAB('INSTITUCION'),USE(?Tab:2)
                         END
                         TAB('DESCRIPCION'),USE(?Tab:3)
                         END
                       END
                       BUTTON('&Salir'),AT(171,180,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
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
  GlobalErrors.SetProcedureName('BrowseTIPO_INSTITUCION')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('TIP4:IDTIPO_INSTITUCION',TIP4:IDTIPO_INSTITUCION)  ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:TIPO_INSTITUCION.Open                             ! File TIPO_INSTITUCION used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:TIPO_INSTITUCION,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?CurrentTab{PROP:WIZARD}=True
  ?SortOrderList{PROP:FROM}=|
                CHOOSE(SUB(?Tab:2{PROP:TEXT},1,1)='&',SUB(?Tab:2{PROP:TEXT},2,LEN(?Tab:2{PROP:TEXT})-1),?Tab:2{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab:3{PROP:TEXT},1,1)='&',SUB(?Tab:3{PROP:TEXT},2,LEN(?Tab:3{PROP:TEXT})-1),?Tab:3{PROP:TEXT})&|
                ''
  ?SortOrderList{PROP:SELECTED}=1
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,TIP4:IDX_T_INST_DESCRIPCION)          ! Add the sort order for TIP4:IDX_T_INST_DESCRIPCION for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,TIP4:DESCRIPCION,,BRW1)        ! Initialize the browse locator using  using key: TIP4:IDX_T_INST_DESCRIPCION , TIP4:DESCRIPCION
  BRW1.AddSortOrder(,TIP4:PK_T_INSTITUCION)                ! Add the sort order for TIP4:PK_T_INSTITUCION for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(,TIP4:IDTIPO_INSTITUCION,,BRW1) ! Initialize the browse locator using  using key: TIP4:PK_T_INSTITUCION , TIP4:IDTIPO_INSTITUCION
  BRW1.AddField(TIP4:IDTIPO_INSTITUCION,BRW1.Q.TIP4:IDTIPO_INSTITUCION) ! Field TIP4:IDTIPO_INSTITUCION is a hot field or requires assignment from browse
  BRW1.AddField(TIP4:DESCRIPCION,BRW1.Q.TIP4:DESCRIPCION)  ! Field TIP4:DESCRIPCION is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowseTIPO_INSTITUCION',QuickWindow)       ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1                                    ! Will call: UpdateTIPO_INSTITUCION
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
    Relate:TIPO_INSTITUCION.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowseTIPO_INSTITUCION',QuickWindow)    ! Save window data to non-volatile store
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
    UpdateTIPO_INSTITUCION
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
  ELSE
    RETURN SELF.SetSort(2,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Window
!!! Actualizacion TIPO_CURSO
!!! </summary>
UpdateTIPO_CURSO PROCEDURE 

CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
History::TIP2:Record LIKE(TIP2:RECORD),THREAD
QuickWindow          WINDOW('Actualizacion TIPO CURSO'),AT(,,280,68),FONT('MS Sans Serif',8,,FONT:regular),RESIZE, |
  CENTER,GRAY,IMM,MDI,HLP('UpdateTIPO_CURSO'),SYSTEM
                       BUTTON('&Aceptar'),AT(176,52,49,14),USE(?OK),LEFT,ICON('ok.ico'),CURSOR('mano.cur'),DEFAULT, |
  FLAT,MSG('Confirma y Actualiza el Formulario'),TIP('Confirma y Actualiza el Formulario')
                       BUTTON('&Cancelar'),AT(228,52,49,14),USE(?Cancel),LEFT,ICON('cancelar.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Cancela Operacion'),TIP('Cancela Operacion')
                       PROMPT('DESCRIPCION:'),AT(5,4),USE(?TIP2:DESCRIPCION:Prompt),TRN
                       ENTRY(@s50),AT(65,4,204,10),USE(TIP2:DESCRIPCION)
                       OPTION('GRADO'),AT(3,25,71,23),USE(TIP2:GRADO),BOXED
                         RADIO('SI'),AT(11,34),USE(?TIP2:GRADO:Radio1)
                         RADIO('NO'),AT(37,33),USE(?TIP2:GRADO:Radio2)
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
  GlobalErrors.SetProcedureName('UpdateTIPO_CURSO')
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
  SELF.AddHistoryFile(TIP2:Record,History::TIP2:Record)
  SELF.AddHistoryField(?TIP2:DESCRIPCION,2)
  SELF.AddHistoryField(?TIP2:GRADO,3)
  SELF.AddUpdateFile(Access:TIPO_CURSO)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:TIPO_CURSO.Open                                   ! File TIPO_CURSO used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:TIPO_CURSO
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
    ?TIP2:DESCRIPCION{PROP:ReadOnly} = True
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdateTIPO_CURSO',QuickWindow)             ! Restore window settings from non-volatile store
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
    Relate:TIPO_CURSO.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateTIPO_CURSO',QuickWindow)          ! Save window data to non-volatile store
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
!!! Browse the TIPO_CURSO file
!!! </summary>
BrowseTIPO_CURSO PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(TIPO_CURSO)
                       PROJECT(TIP2:ID_TIPO_CURSO)
                       PROJECT(TIP2:DESCRIPCION)
                       PROJECT(TIP2:GRADO)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
TIP2:ID_TIPO_CURSO     LIKE(TIP2:ID_TIPO_CURSO)       !List box control field - type derived from field
TIP2:DESCRIPCION       LIKE(TIP2:DESCRIPCION)         !List box control field - type derived from field
TIP2:GRADO             LIKE(TIP2:GRADO)               !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('ABM TIPO CURSO'),AT(,,224,198),FONT('MS Sans Serif',8,,FONT:regular),RESIZE,CENTER, |
  GRAY,IMM,MDI,HLP('BrowseTIPO_CURSO'),SYSTEM
                       LIST,AT(8,30,208,124),USE(?Browse:1),HVSCROLL,FORMAT('64R(2)|M~ID TIPO CURSO~C(0)@n-14@' & |
  '80L(2)|M~DESCRIPCION~L(2)@s50@24L(2)|M~GRADO~L(2)@s2@'),FROM(Queue:Browse:1),IMM,MSG('Administra' & |
  'dor de TIPO_CURSO')
                       BUTTON('&Ver'),AT(8,158,49,14),USE(?View:2),LEFT,ICON('v.ico'),CURSOR('mano.cur'),FLAT,MSG('Visualizar'), |
  TIP('Visualizar')
                       BUTTON('&Agregar'),AT(61,158,49,14),USE(?Insert:3),LEFT,ICON('a.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Agrega Registro'),TIP('Agrega Registro')
                       BUTTON('&Cambiar'),AT(114,158,49,14),USE(?Change:3),LEFT,ICON('c.ico'),CURSOR('mano.cur'), |
  DEFAULT,FLAT,MSG('Cambia Registro'),TIP('Cambia Registro')
                       BUTTON('&Borrar'),AT(167,158,49,14),USE(?Delete:3),LEFT,ICON('b.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Borra Registro'),TIP('Borra Registro')
                       SHEET,AT(4,4,216,172),USE(?CurrentTab)
                         TAB('CURSO'),USE(?Tab:2)
                         END
                         TAB('DESCRIPCION'),USE(?Tab:3)
                         END
                       END
                       BUTTON('&Salir'),AT(171,180,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
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
  GlobalErrors.SetProcedureName('BrowseTIPO_CURSO')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('TIP2:ID_TIPO_CURSO',TIP2:ID_TIPO_CURSO)            ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:TIPO_CURSO.Open                                   ! File TIPO_CURSO used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:TIPO_CURSO,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?CurrentTab{PROP:WIZARD}=True
  ?SortOrderList{PROP:FROM}=|
                CHOOSE(SUB(?Tab:2{PROP:TEXT},1,1)='&',SUB(?Tab:2{PROP:TEXT},2,LEN(?Tab:2{PROP:TEXT})-1),?Tab:2{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab:3{PROP:TEXT},1,1)='&',SUB(?Tab:3{PROP:TEXT},2,LEN(?Tab:3{PROP:TEXT})-1),?Tab:3{PROP:TEXT})&|
                ''
  ?SortOrderList{PROP:SELECTED}=1
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,TIP2:IDX_DESCRIPCION)                 ! Add the sort order for TIP2:IDX_DESCRIPCION for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,TIP2:DESCRIPCION,,BRW1)        ! Initialize the browse locator using  using key: TIP2:IDX_DESCRIPCION , TIP2:DESCRIPCION
  BRW1.AddSortOrder(,TIP2:PK_T_CURSO)                      ! Add the sort order for TIP2:PK_T_CURSO for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(,TIP2:ID_TIPO_CURSO,,BRW1)      ! Initialize the browse locator using  using key: TIP2:PK_T_CURSO , TIP2:ID_TIPO_CURSO
  BRW1.AddField(TIP2:ID_TIPO_CURSO,BRW1.Q.TIP2:ID_TIPO_CURSO) ! Field TIP2:ID_TIPO_CURSO is a hot field or requires assignment from browse
  BRW1.AddField(TIP2:DESCRIPCION,BRW1.Q.TIP2:DESCRIPCION)  ! Field TIP2:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(TIP2:GRADO,BRW1.Q.TIP2:GRADO)              ! Field TIP2:GRADO is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowseTIPO_CURSO',QuickWindow)             ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1                                    ! Will call: UpdateTIPO_CURSO
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
    Relate:TIPO_CURSO.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowseTIPO_CURSO',QuickWindow)          ! Save window data to non-volatile store
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
    UpdateTIPO_CURSO
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
  ELSE
    RETURN SELF.SetSort(2,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Window
!!! Actualizacion TIPO_CONVENIO
!!! </summary>
UpdateTIPO_CONVENIO PROCEDURE 

CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
History::TIP:Record  LIKE(TIP:RECORD),THREAD
QuickWindow          WINDOW('Actualizacion TIPO CONVENIO'),AT(,,288,112),FONT('MS Sans Serif',8,,FONT:regular), |
  RESIZE,CENTER,GRAY,IMM,MDI,HLP('UpdateTIPO_CONVENIO'),SYSTEM
                       BUTTON('&Aceptar'),AT(173,95,49,14),USE(?OK),LEFT,ICON('ok.ico'),CURSOR('mano.cur'),DEFAULT, |
  FLAT,MSG('Confirma y Actualiza el Formulario'),TIP('Confirma y Actualiza el Formulario')
                       BUTTON('&Cancelar'),AT(225,95,57,14),USE(?Cancel),LEFT,ICON('cancelar.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Cancela Operacion'),TIP('Cancela Operacion')
                       PROMPT('DESCRIPCION:'),AT(1,6),USE(?TIP:DESCRIPCION:Prompt),TRN
                       ENTRY(@s50),AT(71,6,204,10),USE(TIP:DESCRIPCION),REQ
                       PROMPT('% INTERES:'),AT(1,23),USE(?TIP:INTERES:Prompt)
                       ENTRY(@n-7.2),AT(71,23,27,10),USE(TIP:INTERES),DECIMAL(12)
                       PROMPT(' % GTO ADMIN:'),AT(1,40,68,10),USE(?TIP:GASTO_ADMINISTRATIVO:Prompt)
                       ENTRY(@n-7.2),AT(71,40,53,10),USE(TIP:GASTO_ADMINISTRATIVO),DECIMAL(12)
                       PROMPT('CANCELA CUOTA:'),AT(1,57),USE(?TIP:CANCELA_CUOTA:Prompt)
                       COMBO(@s2),AT(71,57,60,10),USE(TIP:CANCELA_CUOTA),DROP(10),FROM('SI|NO')
                       PROMPT('CALCULA DEUDA:'),AT(1,74),USE(?TIP:CALCULA_DEUDA:Prompt)
                       COMBO(@s2),AT(71,74,60,10),USE(TIP:CALCULA_DEUDA),DROP(10),FROM('SI|NO')
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
  GlobalErrors.SetProcedureName('UpdateTIPO_CONVENIO')
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
  SELF.AddHistoryFile(TIP:Record,History::TIP:Record)
  SELF.AddHistoryField(?TIP:DESCRIPCION,2)
  SELF.AddHistoryField(?TIP:INTERES,3)
  SELF.AddHistoryField(?TIP:GASTO_ADMINISTRATIVO,4)
  SELF.AddHistoryField(?TIP:CANCELA_CUOTA,5)
  SELF.AddHistoryField(?TIP:CALCULA_DEUDA,6)
  SELF.AddUpdateFile(Access:TIPO_CONVENIO)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:TIPO_CONVENIO.Open                                ! File TIPO_CONVENIO used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:TIPO_CONVENIO
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
    ?TIP:DESCRIPCION{PROP:ReadOnly} = True
    ?TIP:INTERES{PROP:ReadOnly} = True
    ?TIP:GASTO_ADMINISTRATIVO{PROP:ReadOnly} = True
    DISABLE(?TIP:CANCELA_CUOTA)
    DISABLE(?TIP:CALCULA_DEUDA)
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdateTIPO_CONVENIO',QuickWindow)          ! Restore window settings from non-volatile store
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
    Relate:TIPO_CONVENIO.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateTIPO_CONVENIO',QuickWindow)       ! Save window data to non-volatile store
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

