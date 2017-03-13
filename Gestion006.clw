

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
   INCLUDE('NetEmail.inc'),ONCE
   INCLUDE('abprtext.inc'),ONCE
   INCLUDE('abprxml.inc'),ONCE
   INCLUDE('abrppsel.inc'),ONCE

                     MAP
                       INCLUDE('GESTION006.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION002.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION003.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION005.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION007.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the SOCIOS file
!!! </summary>
E_MAILS PROCEDURE 

!--------------------------------------------------------------------------
! Tagging Data
!--------------------------------------------------------------------------
DASBRW::12:TAGFLAG         BYTE(0)
DASBRW::12:TAGMOUSE        BYTE(0)
DASBRW::12:TAGDISPSTATUS   BYTE(0)
DASBRW::12:QUEUE          QUEUE
PUNTERO                       LIKE(PUNTERO)
                          END
!--------------------------------------------------------------------------
! Tagging Data
!--------------------------------------------------------------------------
CurrentTab           STRING(80)                            ! 
T                    STRING(20)                            ! 
LOC:PARA             CSTRING(255)                          ! 
LOC:ASUNTO           CSTRING(255)                          ! 
LOC:CUERPO           CSTRING(10000)                        ! 
LOC:ATTACH           CSTRING(255)                          ! 
LOC:HANDLE           LONG                                  ! 
LOC:OP               CSTRING(255)                          ! 
LOC:FILE             CSTRING(255)                          ! 
LOC:PATH             CSTRING(255)                          ! 
LOC:PARAM            CSTRING(255)                          ! 
LOC:SHOW             LONG                                  ! 
LOC:RETHANDLE        LONG                                  ! 
EmailServer          STRING(80)                            ! 
EmailPort            USHORT                                ! 
EmailFrom            STRING(255)                           ! 
EmailTo              STRING(1024)                          ! 
EmailSubject         STRING(255)                           ! 
EmailCC              STRING(1024)                          ! 
EmailBCC             STRING(1024)                          ! 
EmailFileList        STRING(1024)                          ! 
EmailMessageText     STRING(16384)                         ! 
MessageHTML          STRING(255)                           ! 
! our data
StartPos             long
EndPos               long
ParamPath            string (255)
Param1               string (255)
count                long
tempFileList         string (Net:StdEmailAttachmentListSize)
QuickerDisplay       byte
MessageCount         long
BRW1::View:Browse    VIEW(SOCIOS)
                       PROJECT(SOC:IDSOCIO)
                       PROJECT(SOC:MATRICULA)
                       PROJECT(SOC:NOMBRE)
                       PROJECT(SOC:EMAIL)
                       PROJECT(SOC:N_DOCUMENTO)
                       PROJECT(SOC:FECHA_NACIMIENTO)
                       PROJECT(SOC:SEXO)
                       PROJECT(SOC:DIRECCION)
                       PROJECT(SOC:TELEFONO)
                       PROJECT(SOC:DIRECCION_LABORAL)
                       PROJECT(SOC:TELEFONO_LABORAL)
                       PROJECT(SOC:FECHA_ALTA)
                       PROJECT(SOC:OBSERVACION)
                       PROJECT(SOC:FIN_COBERTURA)
                       PROJECT(SOC:FECHA_BAJA)
                       PROJECT(SOC:FECHA_EGRESO)
                       PROJECT(SOC:FECHA_TITULO)
                       PROJECT(SOC:BAJA)
                       PROJECT(SOC:BAJA_TEMPORARIA)
                       PROJECT(SOC:OTRAS_CERTIFICACIONES)
                       PROJECT(SOC:CELULAR)
                       PROJECT(SOC:IDCIRCULO)
                       PROJECT(SOC:LIBRO)
                       PROJECT(SOC:FOLIO)
                       PROJECT(SOC:ACTA)
                       PROJECT(SOC:PROVISORIO)
                       PROJECT(SOC:IDINSTITUCION)
                       PROJECT(SOC:IDCOBERTURA)
                       PROJECT(SOC:IDLOCALIDAD)
                       PROJECT(SOC:CANTIDAD)
                       PROJECT(SOC:IDZONA)
                       PROJECT(SOC:ID_TIPO_DOC)
                       JOIN(ZON:PK_ZONA_VIVIENDA,SOC:IDZONA)
                         PROJECT(ZON:IDZONA)
                       END
                       JOIN(TIP3:PK_TIPO_DOC,SOC:ID_TIPO_DOC)
                         PROJECT(TIP3:ID_TIPO_DOC)
                       END
                       JOIN(LOC:PK_LOCALIDAD,SOC:IDLOCALIDAD)
                         PROJECT(LOC:CP)
                         PROJECT(LOC:COD_TELEFONICO)
                         PROJECT(LOC:DESCRIPCION)
                         PROJECT(LOC:IDLOCALIDAD)
                       END
                       JOIN(INS2:PK_INSTITUCION,SOC:IDINSTITUCION)
                         PROJECT(INS2:NOMBRE)
                         PROJECT(INS2:IDINSTITUCION)
                       END
                       JOIN(COB:PK_COBERTURA,SOC:IDCOBERTURA)
                         PROJECT(COB:DESCRIPCION)
                         PROJECT(COB:IDCOBERTURA)
                       END
                       JOIN(CIR:PK_CIRCULO,SOC:IDCIRCULO)
                         PROJECT(CIR:DESCRIPCION)
                         PROJECT(CIR:IDCIRCULO)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
T                      LIKE(T)                        !List box control field - type derived from local data
T_Icon                 LONG                           !Entry's icon ID
SOC:IDSOCIO            LIKE(SOC:IDSOCIO)              !List box control field - type derived from field
SOC:IDSOCIO_Icon       LONG                           !Entry's icon ID
SOC:MATRICULA          LIKE(SOC:MATRICULA)            !List box control field - type derived from field
SOC:NOMBRE             LIKE(SOC:NOMBRE)               !List box control field - type derived from field
SOC:EMAIL              LIKE(SOC:EMAIL)                !List box control field - type derived from field
SOC:N_DOCUMENTO        LIKE(SOC:N_DOCUMENTO)          !List box control field - type derived from field
SOC:FECHA_NACIMIENTO   LIKE(SOC:FECHA_NACIMIENTO)     !List box control field - type derived from field
SOC:SEXO               LIKE(SOC:SEXO)                 !List box control field - type derived from field
SOC:DIRECCION          LIKE(SOC:DIRECCION)            !List box control field - type derived from field
LOC:CP                 LIKE(LOC:CP)                   !List box control field - type derived from field
LOC:COD_TELEFONICO     LIKE(LOC:COD_TELEFONICO)       !List box control field - type derived from field
SOC:TELEFONO           LIKE(SOC:TELEFONO)             !List box control field - type derived from field
SOC:DIRECCION_LABORAL  LIKE(SOC:DIRECCION_LABORAL)    !List box control field - type derived from field
SOC:TELEFONO_LABORAL   LIKE(SOC:TELEFONO_LABORAL)     !List box control field - type derived from field
SOC:FECHA_ALTA         LIKE(SOC:FECHA_ALTA)           !List box control field - type derived from field
SOC:OBSERVACION        LIKE(SOC:OBSERVACION)          !List box control field - type derived from field
SOC:FIN_COBERTURA      LIKE(SOC:FIN_COBERTURA)        !List box control field - type derived from field
SOC:FECHA_BAJA         LIKE(SOC:FECHA_BAJA)           !List box control field - type derived from field
SOC:FECHA_EGRESO       LIKE(SOC:FECHA_EGRESO)         !List box control field - type derived from field
SOC:FECHA_TITULO       LIKE(SOC:FECHA_TITULO)         !List box control field - type derived from field
SOC:BAJA               LIKE(SOC:BAJA)                 !List box control field - type derived from field
SOC:BAJA_TEMPORARIA    LIKE(SOC:BAJA_TEMPORARIA)      !List box control field - type derived from field
SOC:OTRAS_CERTIFICACIONES LIKE(SOC:OTRAS_CERTIFICACIONES) !List box control field - type derived from field
SOC:CELULAR            LIKE(SOC:CELULAR)              !List box control field - type derived from field
SOC:IDCIRCULO          LIKE(SOC:IDCIRCULO)            !List box control field - type derived from field
CIR:DESCRIPCION        LIKE(CIR:DESCRIPCION)          !List box control field - type derived from field
SOC:LIBRO              LIKE(SOC:LIBRO)                !List box control field - type derived from field
SOC:FOLIO              LIKE(SOC:FOLIO)                !List box control field - type derived from field
SOC:ACTA               LIKE(SOC:ACTA)                 !List box control field - type derived from field
SOC:PROVISORIO         LIKE(SOC:PROVISORIO)           !List box control field - type derived from field
SOC:IDINSTITUCION      LIKE(SOC:IDINSTITUCION)        !List box control field - type derived from field
INS2:NOMBRE            LIKE(INS2:NOMBRE)              !List box control field - type derived from field
SOC:FECHA_EGRESO       LIKE(SOC:FECHA_EGRESO)         !List box control field - type derived from field - type derived from field
SOC:IDCOBERTURA        LIKE(SOC:IDCOBERTURA)          !List box control field - type derived from field
COB:DESCRIPCION        LIKE(COB:DESCRIPCION)          !List box control field - type derived from field
SOC:IDLOCALIDAD        LIKE(SOC:IDLOCALIDAD)          !List box control field - type derived from field
LOC:DESCRIPCION        LIKE(LOC:DESCRIPCION)          !List box control field - type derived from field
SOC:CANTIDAD           LIKE(SOC:CANTIDAD)             !List box control field - type derived from field
ZON:IDZONA             LIKE(ZON:IDZONA)               !Related join file key field - type derived from field
TIP3:ID_TIPO_DOC       LIKE(TIP3:ID_TIPO_DOC)         !Related join file key field - type derived from field
LOC:IDLOCALIDAD        LIKE(LOC:IDLOCALIDAD)          !Related join file key field - type derived from field
INS2:IDINSTITUCION     LIKE(INS2:IDINSTITUCION)       !Related join file key field - type derived from field
COB:IDCOBERTURA        LIKE(COB:IDCOBERTURA)          !Related join file key field - type derived from field
CIR:IDCIRCULO          LIKE(CIR:IDCIRCULO)            !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Enviar E-mails a los Colegiados'),AT(,,499,316),FONT('Arial',8,,FONT:regular),RESIZE, |
  CENTER,GRAY,IMM,MDI,HLP('BrowseSOCIOS'),SYSTEM
                       LIST,AT(8,35,478,66),USE(?Browse:1),HVSCROLL,FORMAT('17L(2)|MI~T~C(0)@s1@40L(2)|MI~IDSO' & |
  'CIO~C(0)@n-7@28L(2)|M~MAT~C(0)@s7@120L(2)|M~NOMBRE~C(0)@s30@200L(2)|M~EMAIL~C(0)@s50' & |
  '@56L(2)|M~N DOCUMENTO~C(0)@s14@75L(2)|M~FECHA NACIMIENTO~C(0)@d17@29L(2)|M~SEXO~C(0)' & |
  '@s1@400L(2)|M~DIRECCION~C(0)@s50@31L(2)|M~CP~C(0)@n-7@65L(2)|M~COD TELEFONICO~C(0)@s' & |
  '10@120L(2)|M~TELEFONO~C(0)@s30@200L(2)|M~DIRECCION LABORAL~C(0)@s50@120L(2)|M~TELEFO' & |
  'NO LABORAL~C(0)@s30@90C(2)|M~FECHA MATRICULACION~C(0)@d17@400L(2)|M~OBSERVACION~C(0)' & |
  '@s100@40L(2)|M~FIN COBERTURA~C(0)@d17@40L(2)|M~FECHA BAJA~C(0)@d17@40L(2)|M~FECHA EG' & |
  'RESO~C(0)@d17@40L(2)|M~FECHA TITULO~C(0)@d17@27L(2)|M~BAJA~C(0)@s2@81L(2)|M~BAJA TEM' & |
  'PORARIA~C(0)@s2@200L(2)|M~OTRAS CERTIFICACIONES~C(0)@s50@200L(2)|M~CELULAR~C(0)@s50@' & |
  '[24L(2)|M~IDC~C(0)@n-5@120L(2)|M~DESCRIP DISTRITO~C(0)@s30@]|M~DISTRITIO~56L(2)|M~LI' & |
  'BRO~C(0)@n-14@56L(2)|M~FOLIO~C(0)@n-14@80L(2)|M~ACTA~C(0)@s20@58L(2)|M~PROVISORIO~C(' & |
  '0)@s1@[35L(2)|M~IDINST~C(0)@n-7@200L(2)|M~DESCRIP INSTITUCION~C(0)@s50@56L(2)|M~FECH' & |
  'A EGRESO~C(0)@D6@]|M~TITULO~[28L(2)|M~IDCOB~C(0)@n-5@80L(2)|M~DESC COBERTURA~@s20@]|' & |
  'M~COBERTURA~[36L(2)|M~IDLOC~C(0)@n-7@80L(2)|M~LOCALIDAD~C(0)@s20@]|M~LOCALIDAD~56L(2' & |
  ')|M~MESES  ADEUDADOS~@n-14@'),FROM(Queue:Browse:1),IMM,MSG('Administrador de SOCIOS'),VCR
                       BUTTON('&Filtros'),AT(8,104,49,14),USE(?Query),LEFT,ICON('qkqbe.ico'),FLAT
                       SHEET,AT(4,2,486,119),USE(?CurrentTab)
                         TAB('SOCIOS'),USE(?Tab:1)
                           PROMPT('IDSOCIO:'),AT(129,21),USE(?SOC:IDSOCIO:Prompt)
                           ENTRY(@n-14),AT(161,20,60,10),USE(SOC:IDSOCIO),REQ
                           BUTTON('...'),AT(225,19,12,12),USE(?CallLookup)
                         END
                         TAB('DOCUMENTO'),USE(?Tab:2)
                           PROMPT('N DOCUMENTO:'),AT(125,21),USE(?N_DOCUMENTO:Prompt)
                           ENTRY(@n-14),AT(185,20,60,10),USE(SOC:N_DOCUMENTO),REQ
                         END
                         TAB('MATRICULA'),USE(?Tab:3)
                           PROMPT('MATRICULA:'),AT(127,20),USE(?MATRICULA:Prompt)
                           ENTRY(@n-14),AT(177,21,60,10),USE(SOC:MATRICULA),REQ
                         END
                         TAB('NOMBRE'),USE(?Tab:4)
                           PROMPT('NOMBRE:'),AT(128,21),USE(?NOMBRE:Prompt)
                           ENTRY(@s30),AT(178,20,208,10),USE(SOC:NOMBRE),UPR
                         END
                         TAB('LOCALIDAD'),USE(?Tab6)
                           PROMPT('IDLOCALIDAD:'),AT(127,20),USE(?SOC:IDLOCALIDAD:Prompt)
                           ENTRY(@n-14),AT(177,20,60,10),USE(SOC:IDLOCALIDAD)
                           BUTTON('...'),AT(239,19,12,12),USE(?CallLookup:2)
                         END
                       END
                       BUTTON('&Salir'),AT(446,291,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Salir'),TIP('Salir')
                       STRING(''),AT(3,305,297,10),USE(?Status),TRN
                       PROGRESS,AT(2,293,437,8),USE(?OurProgress),COLOR(COLOR:White,,COLOR:Lime),HIDE,RANGE(0,100)
                       BUTTON('&Borrar'),AT(90,289,49,14),USE(?Delete:3),LEFT,CURSOR('mano.cur'),DISABLE,HIDE,MSG('Borra Registro'), |
  TIP('Borra Registro')
                       GROUP,AT(5,121,485,27),USE(?Group1),BOXED
                         BUTTON('&Marcar'),AT(11,130,80,13),USE(?DASTAG),FLAT
                         BUTTON('Marcar Todo '),AT(305,130,80,13),USE(?DASTAGAll),FLAT
                         BUTTON('&Desmarcar Todo'),AT(109,130,80,13),USE(?DASUNTAGALL),FLAT
                         BUTTON('&Revertir Marca'),AT(207,130,80,13),USE(?DASREVTAG),FLAT
                         BUTTON('Mostrar solo Marca'),AT(403,130,80,13),USE(?DASSHOWTAG),FLAT
                       END
                       GROUP('E-Mail'),AT(5,151,485,138),USE(?Group2),BOXED
                         PROMPT('TITULO:'),AT(8,161),USE(?LOC:ASUNTO:Prompt)
                         ENTRY(@s254),AT(46,161,431,10),USE(LOC:ASUNTO)
                         PROMPT('MENSAJE:'),AT(8,182),USE(?Prompt9)
                         TEXT,AT(46,183,429,79),USE(LOC:CUERPO),BOXED
                         PROMPT('AÑADIDO:'),AT(8,266),USE(?LOC:ATTACH:Prompt)
                         ENTRY(@s254),AT(46,266,110,10),USE(LOC:ATTACH)
                         BUTTON('...'),AT(158,266,12,12),USE(?LookupFile)
                         BUTTON('Enviar E-mail'),AT(179,265,82,21),USE(?Button12),LEFT,ICON('mail.ico'),FLAT
                         BUTTON('Ver e-Mails Enviados'),AT(267,266,82,21),USE(?Button13),LEFT,ICON('pin_blue.ico'), |
  FLAT
                         BUTTON('Enviar x SMTP '),AT(345,267,80,17),USE(?Button14),LEFT,ICON('mail.ico'),DISABLE,FLAT, |
  HIDE
                       END
                       PROMPT('&Orden:'),AT(8,20),USE(?SortOrderList:Prompt)
                       LIST,AT(48,20,75,10),USE(?SortOrderList),DROP(20),FROM(''),MSG('Select the Sort Order'),TIP('Select the' & |
  ' Sort Order')
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeFieldEvent         PROCEDURE(),BYTE,PROC,DERIVED
TakeNewSelection       PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
QBE2                 QueryListClass                        ! QBE List Class. 
QBV2                 QueryListVisual                       ! QBE Visual Class
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
SetQueueRecord         PROCEDURE(),DERIVED
TakeKey                PROCEDURE(),BYTE,PROC,DERIVED
ValidateRecord         PROCEDURE(),BYTE,DERIVED
                     END

BRW1::Sort0:Locator  EntryLocatorClass                     ! Default Locator
BRW1::Sort1:Locator  EntryLocatorClass                     ! Conditional Locator - CHOICE(?CurrentTab) = 2
BRW1::Sort2:Locator  EntryLocatorClass                     ! Conditional Locator - CHOICE(?CurrentTab) = 3
BRW1::Sort3:Locator  FilterLocatorClass                    ! Conditional Locator - CHOICE(?CurrentTab) = 4
BRW1::Sort5:Locator  EntryLocatorClass                     ! Conditional Locator - CHOICE(?CurrentTab) = 6
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

FileLookup7          SelectFileClass
!Local Data Classes
ThisEmailSend        CLASS(NetEmailSend)                   ! Generated by NetTalk Extension (Class Definition)

                     END


  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!--------------------------------------------------------------------------
! DAS_Tagging
!--------------------------------------------------------------------------
DASBRW::12:DASTAGONOFF Routine
  GET(Queue:Browse:1,CHOICE(?Browse:1))
  BRW1.UpdateBuffer
   TAGS.PUNTERO = SOC:IDSOCIO
   GET(TAGS,TAGS.PUNTERO)
  IF ERRORCODE()
     TAGS.PUNTERO = SOC:IDSOCIO
     ADD(TAGS,TAGS.PUNTERO)
    T = '*'
  ELSE
    DELETE(TAGS)
    T = ''
  END
    Queue:Browse:1.T = T
    Queue:Browse:1.T_Icon = 0
  PUT(Queue:Browse:1)
  ThisWindow.Reset(1)
  SELECT(?Browse:1,CHOICE(?Browse:1))
  IF DASBRW::12:TAGMOUSE = 1 THEN
    DASBRW::12:TAGMOUSE = 0
  ELSE
  DASBRW::12:TAGFLAG = 1
  POST(EVENT:ScrollDown,?Browse:1)
  END
DASBRW::12:DASTAGALL Routine
  ?Browse:1{PROPLIST:MouseDownField} = 2
  SETCURSOR(CURSOR:Wait)
  BRW1.Reset
  FREE(TAGS)
  LOOP
    NEXT(BRW1::View:Browse)
    IF ERRORCODE()
      BREAK
    END
     TAGS.PUNTERO = SOC:IDSOCIO
     ADD(TAGS,TAGS.PUNTERO)
  END
  SETCURSOR
  BRW1.ResetSort(1)
  ThisWindow.Reset(1)
  SELECT(?Browse:1,CHOICE(?Browse:1))
DASBRW::12:DASUNTAGALL Routine
  ?Browse:1{PROPLIST:MouseDownField} = 2
  SETCURSOR(CURSOR:Wait)
  FREE(TAGS)
  BRW1.Reset
  SETCURSOR
  BRW1.ResetSort(1)
  ThisWindow.Reset(1)
  SELECT(?Browse:1,CHOICE(?Browse:1))
DASBRW::12:DASREVTAGALL Routine
  ?Browse:1{PROPLIST:MouseDownField} = 2
  SETCURSOR(CURSOR:Wait)
  FREE(DASBRW::12:QUEUE)
  LOOP QR# = 1 TO RECORDS(TAGS)
    GET(TAGS,QR#)
    DASBRW::12:QUEUE = TAGS
    ADD(DASBRW::12:QUEUE)
  END
  FREE(TAGS)
  BRW1.Reset
  LOOP
    NEXT(BRW1::View:Browse)
    IF ERRORCODE()
      BREAK
    END
     DASBRW::12:QUEUE.PUNTERO = SOC:IDSOCIO
     GET(DASBRW::12:QUEUE,DASBRW::12:QUEUE.PUNTERO)
    IF ERRORCODE()
       TAGS.PUNTERO = SOC:IDSOCIO
       ADD(TAGS,TAGS.PUNTERO)
    END
  END
  SETCURSOR
  BRW1.ResetSort(1)
  ThisWindow.Reset(1)
  SELECT(?Browse:1,CHOICE(?Browse:1))
DASBRW::12:DASSHOWTAG Routine
   CASE DASBRW::12:TAGDISPSTATUS
   OF 0
      DASBRW::12:TAGDISPSTATUS = 1    ! display tagged
      ?DASSHOWTAG{PROP:Text} = 'Ver  Solo Marcados'
      ?DASSHOWTAG{PROP:Msg}  = 'Ver  Solo Marcados'
      ?DASSHOWTAG{PROP:Tip}  = 'Ver  Solo Marcados'
   OF 1
      DASBRW::12:TAGDISPSTATUS = 2    ! display untagged
      ?DASSHOWTAG{PROP:Text} = 'Mostrar Desmarcados'
      ?DASSHOWTAG{PROP:Msg}  = 'Mostrar Desmarcados'
      ?DASSHOWTAG{PROP:Tip}  = 'Mostrar Desmarcados'
   OF 2
      DASBRW::12:TAGDISPSTATUS = 0    ! display all
      ?DASSHOWTAG{PROP:Text} = 'Ver Todo'
      ?DASSHOWTAG{PROP:Msg}  = 'Ver Todo'
      ?DASSHOWTAG{PROP:Tip}  = 'Ver Todo'
   END
   DISPLAY(?DASSHOWTAG{PROP:Text})
   BRW1.ResetSort(1)
   SELECT(?Browse:1,CHOICE(?Browse:1))
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

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('E_MAILS')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('T',T)                                              ! Added by: BrowseBox(ABC)
  BIND('SOC:IDSOCIO',SOC:IDSOCIO)                          ! Added by: BrowseBox(ABC)
  BIND('SOC:N_DOCUMENTO',SOC:N_DOCUMENTO)                  ! Added by: BrowseBox(ABC)
  BIND('SOC:FECHA_NACIMIENTO',SOC:FECHA_NACIMIENTO)        ! Added by: BrowseBox(ABC)
  BIND('SOC:DIRECCION_LABORAL',SOC:DIRECCION_LABORAL)      ! Added by: BrowseBox(ABC)
  BIND('SOC:TELEFONO_LABORAL',SOC:TELEFONO_LABORAL)        ! Added by: BrowseBox(ABC)
  BIND('SOC:FECHA_ALTA',SOC:FECHA_ALTA)                    ! Added by: BrowseBox(ABC)
  BIND('SOC:FIN_COBERTURA',SOC:FIN_COBERTURA)              ! Added by: BrowseBox(ABC)
  BIND('SOC:FECHA_BAJA',SOC:FECHA_BAJA)                    ! Added by: BrowseBox(ABC)
  BIND('SOC:FECHA_EGRESO',SOC:FECHA_EGRESO)                ! Added by: BrowseBox(ABC)
  BIND('ZON:IDZONA',ZON:IDZONA)                            ! Added by: BrowseBox(ABC)
  BIND('TIP3:ID_TIPO_DOC',TIP3:ID_TIPO_DOC)                ! Added by: BrowseBox(ABC)
  BIND('LOC:IDLOCALIDAD',LOC:IDLOCALIDAD)                  ! Added by: BrowseBox(ABC)
  BIND('INS2:IDINSTITUCION',INS2:IDINSTITUCION)            ! Added by: BrowseBox(ABC)
  BIND('COB:IDCOBERTURA',COB:IDCOBERTURA)                  ! Added by: BrowseBox(ABC)
  BIND('CIR:IDCIRCULO',CIR:IDCIRCULO)                      ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:EMAIL.Open                                        ! File EMAIL used by this procedure, so make sure it's RelationManager is open
  Relate:EMAILS.Open                                       ! File EMAILS used by this procedure, so make sure it's RelationManager is open
  Relate:SOCIOS.Open                                       ! File SOCIOS used by this procedure, so make sure it's RelationManager is open
  Relate:USUARIO.Open                                      ! File USUARIO used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:SOCIOS,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?CurrentTab{PROP:WIZARD}=True
  ?SortOrderList{PROP:FROM}=|
                CHOOSE(SUB(?Tab:1{PROP:TEXT},1,1)='&',SUB(?Tab:1{PROP:TEXT},2,LEN(?Tab:1{PROP:TEXT})-1),?Tab:1{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab:2{PROP:TEXT},1,1)='&',SUB(?Tab:2{PROP:TEXT},2,LEN(?Tab:2{PROP:TEXT})-1),?Tab:2{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab:3{PROP:TEXT},1,1)='&',SUB(?Tab:3{PROP:TEXT},2,LEN(?Tab:3{PROP:TEXT})-1),?Tab:3{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab:4{PROP:TEXT},1,1)='&',SUB(?Tab:4{PROP:TEXT},2,LEN(?Tab:4{PROP:TEXT})-1),?Tab:4{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab6{PROP:TEXT},1,1)='&',SUB(?Tab6{PROP:TEXT},2,LEN(?Tab6{PROP:TEXT})-1),?Tab6{PROP:TEXT})&|
                ''
  ?SortOrderList{PROP:SELECTED}=1
                                               ! Generated by NetTalk Extension (Start)
  ThisEmailSend.init()
  if ThisEmailSend.error <> 0
    ! Put code in here to handle if the object does not initialise properly
  end
  Do DefineListboxStyle
  !ProcedureTemplate = Window
  QBE2.Init(QBV2, INIMgr,'VER_SOCIOS', GlobalErrors)
  QBE2.QkSupport = True
  QBE2.QkMenuIcon = 'QkQBE.ico'
  QBE2.QkIcon = 'QkLoad.ico'
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,SOC:IDX_SOCIOS_DOCUMENTO)             ! Add the sort order for SOC:IDX_SOCIOS_DOCUMENTO for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(?SOC:N_DOCUMENTO,SOC:N_DOCUMENTO,,BRW1) ! Initialize the browse locator using ?SOC:N_DOCUMENTO using key: SOC:IDX_SOCIOS_DOCUMENTO , SOC:N_DOCUMENTO
  BRW1.SetFilter('(SOC:EMAIL <<> '''' AND SOC:BAJA <<> ''SI'')') ! Apply filter expression to browse
  BRW1.AddSortOrder(,SOC:IDX_SOCIOS_MATRICULA)             ! Add the sort order for SOC:IDX_SOCIOS_MATRICULA for sort order 2
  BRW1.AddLocator(BRW1::Sort2:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort2:Locator.Init(?SOC:MATRICULA,SOC:MATRICULA,,BRW1) ! Initialize the browse locator using ?SOC:MATRICULA using key: SOC:IDX_SOCIOS_MATRICULA , SOC:MATRICULA
  BRW1.SetFilter('(SOC:EMAIL <<> '''' AND SOC:BAJA <<> ''SI'')') ! Apply filter expression to browse
  BRW1.AddSortOrder(,SOC:IDX_SOCIOS_NOMBRE)                ! Add the sort order for SOC:IDX_SOCIOS_NOMBRE for sort order 3
  BRW1.AddLocator(BRW1::Sort3:Locator)                     ! Browse has a locator for sort order 3
  BRW1::Sort3:Locator.Init(?SOC:NOMBRE,SOC:NOMBRE,,BRW1)   ! Initialize the browse locator using ?SOC:NOMBRE using key: SOC:IDX_SOCIOS_NOMBRE , SOC:NOMBRE
  BRW1.SetFilter('(SOC:EMAIL <<> '''' AND SOC:BAJA <<> ''SI'')') ! Apply filter expression to browse
  BRW1.AddSortOrder(,SOC:FK_SOCIOS_LOCALIDAD)              ! Add the sort order for SOC:FK_SOCIOS_LOCALIDAD for sort order 4
  BRW1.AddLocator(BRW1::Sort5:Locator)                     ! Browse has a locator for sort order 4
  BRW1::Sort5:Locator.Init(?SOC:IDLOCALIDAD,SOC:IDLOCALIDAD,,BRW1) ! Initialize the browse locator using ?SOC:IDLOCALIDAD using key: SOC:FK_SOCIOS_LOCALIDAD , SOC:IDLOCALIDAD
  BRW1.SetFilter('(SOC:EMAIL <<> '''' AND SOC:BAJA <<> ''SI'')') ! Apply filter expression to browse
  BRW1.AddSortOrder(,SOC:PK_SOCIOS)                        ! Add the sort order for SOC:PK_SOCIOS for sort order 5
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 5
  BRW1::Sort0:Locator.Init(?SOC:IDSOCIO,SOC:IDSOCIO,,BRW1) ! Initialize the browse locator using ?SOC:IDSOCIO using key: SOC:PK_SOCIOS , SOC:IDSOCIO
  BRW1.SetFilter('(SOC:EMAIL <<> '''' AND SOC:BAJA <<> ''SI'')') ! Apply filter expression to browse
  ?Browse:1{PROP:IconList,1} = '~ABDNROW.ICO'
  ?Browse:1{PROP:IconList,2} = '~CANCEL.ICO'
  BRW1.AddField(T,BRW1.Q.T)                                ! Field T is a hot field or requires assignment from browse
  BRW1.AddField(SOC:IDSOCIO,BRW1.Q.SOC:IDSOCIO)            ! Field SOC:IDSOCIO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:MATRICULA,BRW1.Q.SOC:MATRICULA)        ! Field SOC:MATRICULA is a hot field or requires assignment from browse
  BRW1.AddField(SOC:NOMBRE,BRW1.Q.SOC:NOMBRE)              ! Field SOC:NOMBRE is a hot field or requires assignment from browse
  BRW1.AddField(SOC:EMAIL,BRW1.Q.SOC:EMAIL)                ! Field SOC:EMAIL is a hot field or requires assignment from browse
  BRW1.AddField(SOC:N_DOCUMENTO,BRW1.Q.SOC:N_DOCUMENTO)    ! Field SOC:N_DOCUMENTO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:FECHA_NACIMIENTO,BRW1.Q.SOC:FECHA_NACIMIENTO) ! Field SOC:FECHA_NACIMIENTO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:SEXO,BRW1.Q.SOC:SEXO)                  ! Field SOC:SEXO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:DIRECCION,BRW1.Q.SOC:DIRECCION)        ! Field SOC:DIRECCION is a hot field or requires assignment from browse
  BRW1.AddField(LOC:CP,BRW1.Q.LOC:CP)                      ! Field LOC:CP is a hot field or requires assignment from browse
  BRW1.AddField(LOC:COD_TELEFONICO,BRW1.Q.LOC:COD_TELEFONICO) ! Field LOC:COD_TELEFONICO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:TELEFONO,BRW1.Q.SOC:TELEFONO)          ! Field SOC:TELEFONO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:DIRECCION_LABORAL,BRW1.Q.SOC:DIRECCION_LABORAL) ! Field SOC:DIRECCION_LABORAL is a hot field or requires assignment from browse
  BRW1.AddField(SOC:TELEFONO_LABORAL,BRW1.Q.SOC:TELEFONO_LABORAL) ! Field SOC:TELEFONO_LABORAL is a hot field or requires assignment from browse
  BRW1.AddField(SOC:FECHA_ALTA,BRW1.Q.SOC:FECHA_ALTA)      ! Field SOC:FECHA_ALTA is a hot field or requires assignment from browse
  BRW1.AddField(SOC:OBSERVACION,BRW1.Q.SOC:OBSERVACION)    ! Field SOC:OBSERVACION is a hot field or requires assignment from browse
  BRW1.AddField(SOC:FIN_COBERTURA,BRW1.Q.SOC:FIN_COBERTURA) ! Field SOC:FIN_COBERTURA is a hot field or requires assignment from browse
  BRW1.AddField(SOC:FECHA_BAJA,BRW1.Q.SOC:FECHA_BAJA)      ! Field SOC:FECHA_BAJA is a hot field or requires assignment from browse
  BRW1.AddField(SOC:FECHA_EGRESO,BRW1.Q.SOC:FECHA_EGRESO)  ! Field SOC:FECHA_EGRESO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:FECHA_TITULO,BRW1.Q.SOC:FECHA_TITULO)  ! Field SOC:FECHA_TITULO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:BAJA,BRW1.Q.SOC:BAJA)                  ! Field SOC:BAJA is a hot field or requires assignment from browse
  BRW1.AddField(SOC:BAJA_TEMPORARIA,BRW1.Q.SOC:BAJA_TEMPORARIA) ! Field SOC:BAJA_TEMPORARIA is a hot field or requires assignment from browse
  BRW1.AddField(SOC:OTRAS_CERTIFICACIONES,BRW1.Q.SOC:OTRAS_CERTIFICACIONES) ! Field SOC:OTRAS_CERTIFICACIONES is a hot field or requires assignment from browse
  BRW1.AddField(SOC:CELULAR,BRW1.Q.SOC:CELULAR)            ! Field SOC:CELULAR is a hot field or requires assignment from browse
  BRW1.AddField(SOC:IDCIRCULO,BRW1.Q.SOC:IDCIRCULO)        ! Field SOC:IDCIRCULO is a hot field or requires assignment from browse
  BRW1.AddField(CIR:DESCRIPCION,BRW1.Q.CIR:DESCRIPCION)    ! Field CIR:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(SOC:LIBRO,BRW1.Q.SOC:LIBRO)                ! Field SOC:LIBRO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:FOLIO,BRW1.Q.SOC:FOLIO)                ! Field SOC:FOLIO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:ACTA,BRW1.Q.SOC:ACTA)                  ! Field SOC:ACTA is a hot field or requires assignment from browse
  BRW1.AddField(SOC:PROVISORIO,BRW1.Q.SOC:PROVISORIO)      ! Field SOC:PROVISORIO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:IDINSTITUCION,BRW1.Q.SOC:IDINSTITUCION) ! Field SOC:IDINSTITUCION is a hot field or requires assignment from browse
  BRW1.AddField(INS2:NOMBRE,BRW1.Q.INS2:NOMBRE)            ! Field INS2:NOMBRE is a hot field or requires assignment from browse
  BRW1.AddField(SOC:FECHA_EGRESO,BRW1.Q.SOC:FECHA_EGRESO)  ! Field SOC:FECHA_EGRESO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:IDCOBERTURA,BRW1.Q.SOC:IDCOBERTURA)    ! Field SOC:IDCOBERTURA is a hot field or requires assignment from browse
  BRW1.AddField(COB:DESCRIPCION,BRW1.Q.COB:DESCRIPCION)    ! Field COB:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(SOC:IDLOCALIDAD,BRW1.Q.SOC:IDLOCALIDAD)    ! Field SOC:IDLOCALIDAD is a hot field or requires assignment from browse
  BRW1.AddField(LOC:DESCRIPCION,BRW1.Q.LOC:DESCRIPCION)    ! Field LOC:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(SOC:CANTIDAD,BRW1.Q.SOC:CANTIDAD)          ! Field SOC:CANTIDAD is a hot field or requires assignment from browse
  BRW1.AddField(ZON:IDZONA,BRW1.Q.ZON:IDZONA)              ! Field ZON:IDZONA is a hot field or requires assignment from browse
  BRW1.AddField(TIP3:ID_TIPO_DOC,BRW1.Q.TIP3:ID_TIPO_DOC)  ! Field TIP3:ID_TIPO_DOC is a hot field or requires assignment from browse
  BRW1.AddField(LOC:IDLOCALIDAD,BRW1.Q.LOC:IDLOCALIDAD)    ! Field LOC:IDLOCALIDAD is a hot field or requires assignment from browse
  BRW1.AddField(INS2:IDINSTITUCION,BRW1.Q.INS2:IDINSTITUCION) ! Field INS2:IDINSTITUCION is a hot field or requires assignment from browse
  BRW1.AddField(COB:IDCOBERTURA,BRW1.Q.COB:IDCOBERTURA)    ! Field COB:IDCOBERTURA is a hot field or requires assignment from browse
  BRW1.AddField(CIR:IDCIRCULO,BRW1.Q.CIR:IDCIRCULO)        ! Field CIR:IDCIRCULO is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('E_MAILS',QuickWindow)                      ! Restore window settings from non-volatile store
  global:firsttime = 1
  EmailServer  = clip(SMTP)
  EmailPort    = PUERTO
  EmailFrom    = clip(GLO:MAILEMP)
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.QueryControl = ?Query
  BRW1.UpdateQuery(QBE2,1)
  FileLookup7.Init
  FileLookup7.ClearOnCancel = True
  FileLookup7.Flags=BOR(FileLookup7.Flags,FILE:LongName)   ! Allow long filenames
  FileLookup7.SetMask('All Files','*.*')                   ! Set the file mask
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  SELF.SetAlerts()
  !--------------------------------------------------------------------------
  ! Tagging Init
  !--------------------------------------------------------------------------
  FREE(TAGS)
  ?DASSHOWTAG{PROP:Text} = 'Ver Todo'
  ?DASSHOWTAG{PROP:Msg}  = 'Ver Todo'
  ?DASSHOWTAG{PROP:Tip}  = 'Ver Todo'
  !--------------------------------------------------------------------------
  ! Tagging Init
  !--------------------------------------------------------------------------
  ?Browse:1{Prop:Alrt,239} = SpaceKey
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ThisEmailSend.Kill()                              ! Generated by NetTalk Extension
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
    Relate:EMAIL.Close
    Relate:EMAILS.Close
    Relate:SOCIOS.Close
    Relate:USUARIO.Close
  END
  IF SELF.Opened
    INIMgr.Update('E_MAILS',QuickWindow)                   ! Save window data to non-volatile store
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
      SelectLOCALIDAD
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
    OF ?Button12
      EmailSubject =  CLIP(LOC:ASUNTO)
      EmailFileList = CLIP(LOC:ATTACH)
      EmailMessageText = LOC:CUERPO
      contador# = 0
      ! Carga tabla  con los tags
      Loop i# = 1 to records(Tags)
          get(Tags,i#)
          SOC:IDSOCIO = tags:Puntero
          If NOT Access:SOCIOS.Fetch(SOC:PK_SOCIOS)
                 IF contador# = 0 THEN
                      EmailTo= (SOC:EMAIL)
                 ELSE
                      EmailTo= CLIP(EmailTo)&','&clip(SOC:EMAIL)
                 END
                 cantidad# = cantidad# + 1
                 contador# = contador# + 1
                 if contador# = 20 then
                      SendEmail(EmailServer, EmailPort, EmailFrom, EmailTo, EmailSubject, EmailCC, EmailBcc, EmailFileList, EmailMessageText)
                      contador# = 0
                      EmailTo= ''
                 end
                 PARA" = PARA"&','&clip(SOC:EMAIL)
          end
      End
      !! ENVIA LOS EMAILS SOBRANTES DEL CONTEO DE 20
      if contador# > 0 then
          SendEmail(EmailServer, EmailPort, EmailFrom, EmailTo, EmailSubject, EmailCC, EmailBcc, EmailFileList, EmailMessageText)
          contador# = 0
          EmailTo= ''
      end
         !!! GUARDA EL EMAIL
         EML:PARA       = PARA"
         EML:TITULO     = LOC:ASUNTO
         EML:MENSAJE    = LOC:CUERPO
         EML:ADJUNTO    = LOC:ATTACH
         EML:FECHA      = today()
         EML:HORA       = clock()
         ADD(EMAILS)
      
      MESSAGE('SE ENVIARON '&CANTIDAD#&' DE E-MAILS')
      
      
      
    OF ?Button14
      EmailSubject =  CLIP(LOC:ASUNTO)
      EmailFileList = CLIP(LOC:ATTACH)
      EmailMessageText = LOC:CUERPO
      
      ! Carga tabla  con los tags
      Loop i# = 1 to records(Tags)
          get(Tags,i#)
          SOC:IDSOCIO = tags:Puntero
          If NOT Access:SOCIOS.Fetch(SOC:PK_SOCIOS)
                 EmailTo= clip(SOC:EMAIL)
                 cantidad# = cantidad# + 1
                 PARA" = PARA"&';'&clip(SOC:EMAIL)
                  !! manda email
                  ThisEmailSend.Server = clip(SMTP)
                  ThisEmailSend.Port = clip(PUERTO)
                  ThisEmailSend.ToList = Emailto
                  ThisEmailSend.ccList = ''
                  ThisEmailSend.bccList = ''
                  ThisEmailSend.From = GLO:MAILEMP
                  ThisEmailSend.Helo = ''
                  ThisEmailSend.Subject = EmailSubject
                  ThisEmailSend.ReplyTo = ''
                  ThisEmailSend.Organization = ''
                  ThisEmailSend.DeliveryReceiptTo = ''
                  ThisEmailSend.DispositionNotificationTo = ''
                  ThisEmailSend.References = ''     ! Used for replies e.g. '<<00cd01c02dde$765a6880$0802a8c0@spiff> <<00dc01c02de0$35fbea00$0802a8c0@spiff>'
                  ThisEmailSend.AttachmentList = LOC:ATTACH
                  ThisEmailSend.EmbedList = ''!EmbedList
                  ThisEmailSend.AuthUser = clip (USUARIO_SMTP)
                  ThisEmailSend.AuthPassword = clip (PASSWORD_SMTP)
                  !ThisEmailSend.SecureEmail = SMTP_SEGURO
                  !ThisEmailSend.MessageText = EmailMessageText
                  ThisEmailSend.SetRequiredMessageSize (0, len(clip(EmailMessageText)), len(clip(MessageHTML)))
      
                  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                  ! ThisEmailSend.SendMail(NET:EMailMadeFromPartsMode)  ! Put email in queue and start sending it now
                  !!!!!!!!!!!!!!1
                  if ThisEmailSend.Error = 0
                        if len(clip(EmailMessageText)) > 0
                          ThisEmailSend.MessageText = EmailMessageText
                        end
                        if len(clip(MessageHTML)) > 0
                          ThisEmailSend.MessageHTML = MessageHTML
                        end
      
                        ThisEmailSend.SendMail(NET:EMailMadeFromPartsMode)  ! Put email in queue and start sending it now
                        if ThisEmailSend.error <> 0
                          ! Handle Send Error (This error is a connection error - not a sending error)
                          ?status{prop:text} = 'Could not connect to email server.'
                        else
                          if records (ThisEmailSend.DataQueue) > 0
                            ?status{prop:text} = 'Sending ' & records (ThisEmailSend.DataQueue) & ' email(s)'
                          else
                            ?status{prop:text} = ''
                          end
                        end
      
                        if QuickerDisplay = 0
                          setcursor
                        end
                        display(?status)
                              
                  end
      
          end
      End
         !!! GUARDA EL EMAIL
         EML:PARA       = PARA"
         EML:TITULO     = LOC:ASUNTO
         EML:MENSAJE    = LOC:CUERPO
         EML:ADJUNTO    = LOC:ATTACH
         EML:FECHA      = today()
         EML:HORA       = clock()
         ACCESS:EMAILS.INSERT()
      
      MESSAGE('SE ENVIARON '&CANTIDAD#&' DE E-MAILS')
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?SOC:IDSOCIO
      IF SOC:IDSOCIO OR ?SOC:IDSOCIO{PROP:Req}
        SOC:IDSOCIO = SOC:IDSOCIO
        IF Access:SOCIOS.TryFetch(SOC:PK_SOCIOS)
          IF SELF.Run(1,SelectRecord) = RequestCompleted
            SOC:IDSOCIO = SOC:IDSOCIO
          ELSE
            SELECT(?SOC:IDSOCIO)
            CYCLE
          END
        END
      END
      ThisWindow.Reset(0)
    OF ?CallLookup
      ThisWindow.Update()
      SOC:IDSOCIO = SOC:IDSOCIO
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        SOC:IDSOCIO = SOC:IDSOCIO
      END
      ThisWindow.Reset(1)
    OF ?SOC:IDLOCALIDAD
      SOC:IDLOCALIDAD = SOC:IDLOCALIDAD
      IF Access:SOCIOS.TryFetch(SOC:FK_SOCIOS_LOCALIDAD)
        IF SELF.Run(2,SelectRecord) = RequestCompleted
          SOC:IDLOCALIDAD = SOC:IDLOCALIDAD
        ELSE
          SELECT(?SOC:IDLOCALIDAD)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
    OF ?CallLookup:2
      ThisWindow.Update()
      SOC:IDLOCALIDAD = SOC:IDLOCALIDAD
      IF SELF.Run(2,SelectRecord) = RequestCompleted
        SOC:IDLOCALIDAD = SOC:IDLOCALIDAD
      END
      ThisWindow.Reset(1)
    OF ?DASTAG
      ThisWindow.Update()
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
        DO DASBRW::12:DASTAGONOFF
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
    OF ?DASTAGAll
      ThisWindow.Update()
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
        DO DASBRW::12:DASTAGALL
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
    OF ?DASUNTAGALL
      ThisWindow.Update()
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
        DO DASBRW::12:DASUNTAGALL
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
    OF ?DASREVTAG
      ThisWindow.Update()
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
        DO DASBRW::12:DASREVTAGALL
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
    OF ?DASSHOWTAG
      ThisWindow.Update()
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
        DO DASBRW::12:DASSHOWTAG
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
    OF ?LookupFile
      ThisWindow.Update()
      LOC:ATTACH = FileLookup7.Ask(0)
      DISPLAY
    OF ?Button13
      ThisWindow.Update()
      START(VER_MAILS, 25000)
      ThisWindow.Reset
    OF ?SortOrderList
      EXECUTE(CHOICE(?SortOrderList))
       SELECT(?Tab:1)
       SELECT(?Tab:2)
       SELECT(?Tab:3)
       SELECT(?Tab:4)
       SELECT(?Tab6)
      END
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeEvent PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
    ThisEmailSend.TakeEvent()                 ! Generated by NetTalk Extension
  ReturnValue = PARENT.TakeEvent()
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
  OF ?Browse:1
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
    OF ?Browse:1
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
      IF KEYCODE() = MouseLeft AND (?Browse:1{PROPLIST:MouseDownRow} > 0) AND (DASBRW::12:TAGFLAG = 0)
        CASE ?Browse:1{PROPLIST:MouseDownField}
      
          OF 1
            DASBRW::12:TAGMOUSE = 1
            POST(EVENT:Accepted,?DASTAG)
               ?Browse:1{PROPLIST:MouseDownField} = 2
            CYCLE
         END
      END
      DASBRW::12:TAGFLAG = 0
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
  ELSIF CHOICE(?CurrentTab) = 3
    RETURN SELF.SetSort(2,Force)
  ELSIF CHOICE(?CurrentTab) = 4
    RETURN SELF.SetSort(3,Force)
  ELSIF CHOICE(?CurrentTab) = 6
    RETURN SELF.SetSort(4,Force)
  ELSE
    RETURN SELF.SetSort(5,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


BRW1.SetAlerts PROCEDURE

  CODE
  SELF.EditViaPopup = False
  PARENT.SetAlerts


BRW1.SetQueueRecord PROCEDURE

  CODE
  !--------------------------------------------------------------------------
  ! DAS_Tagging
  !--------------------------------------------------------------------------
     TAGS.PUNTERO = SOC:IDSOCIO
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
  
  SELF.Q.T_Icon = 0
  IF (SOC:BAJA = 'SI')
    SELF.Q.SOC:IDSOCIO_Icon = 2                            ! Set icon from icon list
  ELSIF (SOC:BAJA_TEMPORARIA = 'SI')
    SELF.Q.SOC:IDSOCIO_Icon = 1                            ! Set icon from icon list
  ELSE
    SELF.Q.SOC:IDSOCIO_Icon = 0
  END


BRW1.TakeKey PROCEDURE

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


BRW1.ValidateRecord PROCEDURE

ReturnValue          BYTE,AUTO

BRW1::RecordStatus   BYTE,AUTO
  CODE
  ReturnValue = PARENT.ValidateRecord()
  BRW1::RecordStatus=ReturnValue
  IF BRW1::RecordStatus NOT=Record:OK THEN RETURN BRW1::RecordStatus.
  !--------------------------------------------------------------------------
  ! DAS_Tagging
  !--------------------------------------------------------------------------
     TAGS.PUNTERO = SOC:IDSOCIO
     GET(TAGS,TAGS.PUNTERO)
    EXECUTE DASBRW::12:TAGDISPSTATUS
       IF ERRORCODE() THEN BRW1::RecordStatus = RECORD:FILTERED END
       IF ~ERRORCODE() THEN BRW1::RecordStatus = RECORD:FILTERED END
    END
  !--------------------------------------------------------------------------
  ! DAS_Tagging
  !--------------------------------------------------------------------------
  ReturnValue=BRW1::RecordStatus
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Window
!!! Select a TRABAJO Record
!!! </summary>
SelectTRABAJO PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(TRABAJO)
                       PROJECT(TRA:IDTRABAJO)
                       PROJECT(TRA:DESCRIPCION)
                       PROJECT(TRA:DIRECCION)
                       PROJECT(TRA:IDLOCALIDAD)
                       PROJECT(TRA:TELEFONO)
                       PROJECT(TRA:EMAIL)
                       PROJECT(TRA:OBSERVACION)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
TRA:IDTRABAJO          LIKE(TRA:IDTRABAJO)            !List box control field - type derived from field
TRA:DESCRIPCION        LIKE(TRA:DESCRIPCION)          !List box control field - type derived from field
TRA:DIRECCION          LIKE(TRA:DIRECCION)            !List box control field - type derived from field
TRA:IDLOCALIDAD        LIKE(TRA:IDLOCALIDAD)          !List box control field - type derived from field
TRA:TELEFONO           LIKE(TRA:TELEFONO)             !List box control field - type derived from field
TRA:EMAIL              LIKE(TRA:EMAIL)                !List box control field - type derived from field
TRA:OBSERVACION        LIKE(TRA:OBSERVACION)          !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Select a TRABAJO Record'),AT(,,358,198),FONT('MS Sans Serif',8,,FONT:regular),RESIZE, |
  CENTER,GRAY,IMM,MDI,HLP('SelectTRABAJO'),SYSTEM
                       LIST,AT(8,30,342,124),USE(?Browse:1),HVSCROLL,FORMAT('40R(2)|M~IDTRABAJO~C(0)@n-7@80L(2' & |
  ')|M~DESCRIPCION~L(2)@s50@80L(2)|M~DIRECCION~L(2)@s50@64R(2)|M~IDLOCALIDAD~C(0)@n-14@' & |
  '80L(2)|M~TELEFONO~L(2)@s20@80L(2)|M~EMAIL~L(2)@s50@80L(2)|M~OBSERVACION~L(2)@s50@'),FROM(Queue:Browse:1), |
  IMM,MSG('Administrador de TRABAJO')
                       BUTTON('&Elegir'),AT(301,158,49,14),USE(?Select:2),LEFT,ICON('e.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Seleccionar'),TIP('Seleccionar')
                       SHEET,AT(4,4,350,172),USE(?CurrentTab)
                         TAB('PK_TRABAJO'),USE(?Tab:2)
                         END
                         TAB('IDX_TRABAJO_DESCRIPCION'),USE(?Tab:3)
                         END
                         TAB('FK_TRABAJO_LOCALIDAD'),USE(?Tab:4)
                         END
                       END
                       BUTTON('&Salir'),AT(305,180,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
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
  GlobalErrors.SetProcedureName('SelectTRABAJO')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('TRA:IDTRABAJO',TRA:IDTRABAJO)                      ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:TRABAJO.Open                                      ! File TRABAJO used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:TRABAJO,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,TRA:IDX_TRABAJO_DESCRIPCION)          ! Add the sort order for TRA:IDX_TRABAJO_DESCRIPCION for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,TRA:DESCRIPCION,,BRW1)         ! Initialize the browse locator using  using key: TRA:IDX_TRABAJO_DESCRIPCION , TRA:DESCRIPCION
  BRW1.AddSortOrder(,TRA:FK_TRABAJO_LOCALIDAD)             ! Add the sort order for TRA:FK_TRABAJO_LOCALIDAD for sort order 2
  BRW1.AddLocator(BRW1::Sort2:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort2:Locator.Init(,TRA:IDLOCALIDAD,,BRW1)         ! Initialize the browse locator using  using key: TRA:FK_TRABAJO_LOCALIDAD , TRA:IDLOCALIDAD
  BRW1.AddSortOrder(,TRA:PK_TRABAJO)                       ! Add the sort order for TRA:PK_TRABAJO for sort order 3
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 3
  BRW1::Sort0:Locator.Init(,TRA:IDTRABAJO,,BRW1)           ! Initialize the browse locator using  using key: TRA:PK_TRABAJO , TRA:IDTRABAJO
  BRW1.AddField(TRA:IDTRABAJO,BRW1.Q.TRA:IDTRABAJO)        ! Field TRA:IDTRABAJO is a hot field or requires assignment from browse
  BRW1.AddField(TRA:DESCRIPCION,BRW1.Q.TRA:DESCRIPCION)    ! Field TRA:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(TRA:DIRECCION,BRW1.Q.TRA:DIRECCION)        ! Field TRA:DIRECCION is a hot field or requires assignment from browse
  BRW1.AddField(TRA:IDLOCALIDAD,BRW1.Q.TRA:IDLOCALIDAD)    ! Field TRA:IDLOCALIDAD is a hot field or requires assignment from browse
  BRW1.AddField(TRA:TELEFONO,BRW1.Q.TRA:TELEFONO)          ! Field TRA:TELEFONO is a hot field or requires assignment from browse
  BRW1.AddField(TRA:EMAIL,BRW1.Q.TRA:EMAIL)                ! Field TRA:EMAIL is a hot field or requires assignment from browse
  BRW1.AddField(TRA:OBSERVACION,BRW1.Q.TRA:OBSERVACION)    ! Field TRA:OBSERVACION is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('SelectTRABAJO',QuickWindow)                ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:TRABAJO.Close
  END
  IF SELF.Opened
    INIMgr.Update('SelectTRABAJO',QuickWindow)             ! Save window data to non-volatile store
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
!!! Generated from procedure template - Window
!!! Actualizacion SOCIOSXTRABAJO
!!! </summary>
UpdateSOCIOSXTRABAJO PROCEDURE 

CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
History::SOC2:Record LIKE(SOC2:RECORD),THREAD
QuickWindow          WINDOW('Actualizacion SOCIOSXTRABAJO'),AT(,,272,56),FONT('MS Sans Serif',8,,FONT:regular), |
  RESIZE,CENTER,GRAY,IMM,MDI,HLP('UpdateSOCIOSXTRABAJO'),SYSTEM
                       PROMPT('IDSOCIOS:'),AT(3,3),USE(?SOC2:IDSOCIOS:Prompt),TRN
                       ENTRY(@n-14),AT(57,3,64,10),USE(SOC2:IDSOCIOS)
                       BUTTON('...'),AT(122,2,12,12),USE(?CallLookup)
                       STRING(@s30),AT(137,3),USE(SOC:NOMBRE)
                       PROMPT('IDTRABAJO:'),AT(3,17),USE(?SOC2:IDTRABAJO:Prompt),TRN
                       ENTRY(@n-14),AT(57,17,64,10),USE(SOC2:IDTRABAJO)
                       BUTTON('...'),AT(122,15,12,12),USE(?CallLookup:2)
                       STRING(@s50),AT(138,16),USE(TRA:DESCRIPCION)
                       BUTTON('&Aceptar'),AT(85,40,49,14),USE(?OK),LEFT,ICON('ok.ico'),CURSOR('mano.cur'),DEFAULT, |
  FLAT,MSG('Confirma y Actualiza el Formulario'),TIP('Confirma y Actualiza el Formulario')
                       BUTTON('&Cancelar'),AT(139,40,49,14),USE(?Cancel),LEFT,ICON('cancelar.ico'),CURSOR('mano.cur'), |
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
  OF DeleteRecord
    GlobalErrors.Throw(Msg:DeleteIllegal)
    RETURN
  END
  QuickWindow{PROP:Text} = ActionMessage                   ! Display status message in title bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('UpdateSOCIOSXTRABAJO')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?SOC2:IDSOCIOS:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(SOC2:Record,History::SOC2:Record)
  SELF.AddHistoryField(?SOC2:IDSOCIOS,1)
  SELF.AddHistoryField(?SOC2:IDTRABAJO,2)
  SELF.AddUpdateFile(Access:SOCIOSXTRABAJO)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:SOCIOS.Open                                       ! File SOCIOS used by this procedure, so make sure it's RelationManager is open
  Relate:SOCIOSXTRABAJO.Open                               ! File SOCIOSXTRABAJO used by this procedure, so make sure it's RelationManager is open
  Relate:TRABAJO.Open                                      ! File TRABAJO used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:SOCIOSXTRABAJO
  IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing ! Setup actions for ViewOnly Mode
    SELF.InsertAction = Insert:None
    SELF.DeleteAction = Delete:None
    SELF.ChangeAction = Change:None
    SELF.CancelAction = Cancel:Cancel
    SELF.OkControl = 0
  ELSE
    SELF.DeleteAction = Delete:None                        ! Deletes not allowed
    SELF.ChangeAction = Change:Caller                      ! Changes allowed
    SELF.CancelAction = Cancel:Cancel+Cancel:Query         ! Confirm cancel
    SELF.OkControl = ?OK
    IF SELF.PrimeUpdate() THEN RETURN Level:Notify.
  END
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    ?SOC2:IDSOCIOS{PROP:ReadOnly} = True
    DISABLE(?CallLookup)
    ?SOC2:IDTRABAJO{PROP:ReadOnly} = True
    DISABLE(?CallLookup:2)
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdateSOCIOSXTRABAJO',QuickWindow)         ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:SOCIOS.Close
    Relate:SOCIOSXTRABAJO.Close
    Relate:TRABAJO.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateSOCIOSXTRABAJO',QuickWindow)      ! Save window data to non-volatile store
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
      SelectTRABAJO
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
    OF ?SOC2:IDSOCIOS
      SOC:IDSOCIO = SOC2:IDSOCIOS
      IF Access:SOCIOS.TryFetch(SOC:PK_SOCIOS)
        IF SELF.Run(1,SelectRecord) = RequestCompleted
          SOC2:IDSOCIOS = SOC:IDSOCIO
        ELSE
          SELECT(?SOC2:IDSOCIOS)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
      IF Access:SOCIOSXTRABAJO.TryValidateField(1)         ! Attempt to validate SOC2:IDSOCIOS in SOCIOSXTRABAJO
        SELECT(?SOC2:IDSOCIOS)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?SOC2:IDSOCIOS
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?SOC2:IDSOCIOS{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?CallLookup
      ThisWindow.Update()
      SOC:IDSOCIO = SOC2:IDSOCIOS
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        SOC2:IDSOCIOS = SOC:IDSOCIO
      END
      ThisWindow.Reset(1)
    OF ?SOC2:IDTRABAJO
      TRA:IDTRABAJO = SOC2:IDTRABAJO
      IF Access:TRABAJO.TryFetch(TRA:PK_TRABAJO)
        IF SELF.Run(2,SelectRecord) = RequestCompleted
          SOC2:IDTRABAJO = TRA:IDTRABAJO
        ELSE
          SELECT(?SOC2:IDTRABAJO)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
      IF Access:SOCIOSXTRABAJO.TryValidateField(2)         ! Attempt to validate SOC2:IDTRABAJO in SOCIOSXTRABAJO
        SELECT(?SOC2:IDTRABAJO)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?SOC2:IDTRABAJO
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?SOC2:IDTRABAJO{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?CallLookup:2
      ThisWindow.Update()
      TRA:IDTRABAJO = SOC2:IDTRABAJO
      IF SELF.Run(2,SelectRecord) = RequestCompleted
        SOC2:IDTRABAJO = TRA:IDTRABAJO
      END
      ThisWindow.Reset(1)
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
!!! Administrador de SOCIOSXTRABAJO
!!! </summary>
ABMTRABAJOSXSOCIOS PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(SOCIOSXTRABAJO)
                       PROJECT(SOC2:IDSOCIOS)
                       PROJECT(SOC2:IDTRABAJO)
                       PROJECT(SOC2:FECHA)
                       JOIN(TRA:PK_TRABAJO,SOC2:IDTRABAJO)
                         PROJECT(TRA:DESCRIPCION)
                         PROJECT(TRA:DIRECCION)
                         PROJECT(TRA:TELEFONO)
                         PROJECT(TRA:IDTRABAJO)
                         PROJECT(TRA:IDLOCALIDAD)
                         JOIN(LOC:PK_LOCALIDAD,TRA:IDLOCALIDAD)
                           PROJECT(LOC:DESCRIPCION)
                           PROJECT(LOC:IDLOCALIDAD)
                         END
                       END
                       JOIN(SOC:PK_SOCIOS,SOC2:IDSOCIOS)
                         PROJECT(SOC:MATRICULA)
                         PROJECT(SOC:NOMBRE)
                         PROJECT(SOC:IDSOCIO)
                         PROJECT(SOC:IDTIPOTITULO)
                         JOIN(TIP6:PK_TIPO_TITULO,SOC:IDTIPOTITULO)
                           PROJECT(TIP6:DESCRIPCION)
                           PROJECT(TIP6:IDTIPOTITULO)
                         END
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
SOC2:IDSOCIOS          LIKE(SOC2:IDSOCIOS)            !List box control field - type derived from field
SOC:MATRICULA          LIKE(SOC:MATRICULA)            !List box control field - type derived from field
SOC:NOMBRE             LIKE(SOC:NOMBRE)               !List box control field - type derived from field
TIP6:DESCRIPCION       LIKE(TIP6:DESCRIPCION)         !List box control field - type derived from field
SOC2:IDTRABAJO         LIKE(SOC2:IDTRABAJO)           !List box control field - type derived from field
TRA:DESCRIPCION        LIKE(TRA:DESCRIPCION)          !List box control field - type derived from field
TRA:DIRECCION          LIKE(TRA:DIRECCION)            !List box control field - type derived from field
LOC:DESCRIPCION        LIKE(LOC:DESCRIPCION)          !List box control field - type derived from field
TRA:TELEFONO           LIKE(TRA:TELEFONO)             !List box control field - type derived from field
SOC2:FECHA             LIKE(SOC2:FECHA)               !List box control field - type derived from field
TRA:IDTRABAJO          LIKE(TRA:IDTRABAJO)            !Related join file key field - type derived from field
LOC:IDLOCALIDAD        LIKE(LOC:IDLOCALIDAD)          !Related join file key field - type derived from field
SOC:IDSOCIO            LIKE(SOC:IDSOCIO)              !Related join file key field - type derived from field
TIP6:IDTIPOTITULO      LIKE(TIP6:IDTIPOTITULO)        !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Administrador de SOCIOSXTRABAJO'),AT(,,529,315),FONT('MS Sans Serif',8,,FONT:regular), |
  RESIZE,CENTER,GRAY,IMM,MDI,HLP('ABMTRABAJOSXSOCIOS'),SYSTEM
                       LIST,AT(8,40,512,227),USE(?Browse:1),HVSCROLL,FORMAT('[43R(2)|M~IDSOCIOS~C(0)@n-7@48L|M' & |
  '~MATRICULA~C@s10@120L|M~NOMBRE~C@s30@200L|M~PROF~C@s50@](313)|M~SOCIOS~[35L(2)|M~IDT' & |
  'RB~C(0)@n-7@123L(2)|M~NOMBRE~C(0)@s30@127L(2)|M~DIRECCION~C(0)@s30@80R(2)|M~LOCALIDA' & |
  'D~C(0)@s20@80L|M~TELEFONO~C@s20@]|M~TRABAJO~80R(2)|M~FECHA~C(0)@d17@'),FROM(Queue:Browse:1), |
  IMM,MSG('Administrador de SOCIOSXTRABAJO')
                       BUTTON('&Ver'),AT(314,272,49,14),USE(?View:2),LEFT,ICON('v.ico'),CURSOR('mano.cur'),FLAT,MSG('Visualizar'), |
  TIP('Visualizar')
                       BUTTON('&Agregar'),AT(367,272,49,14),USE(?Insert:3),LEFT,ICON('a.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Agrega Registro'),TIP('Agrega Registro')
                       BUTTON('&Cambiar'),AT(420,272,49,14),USE(?Change:3),LEFT,ICON('c.ico'),CURSOR('mano.cur'), |
  DEFAULT,FLAT,MSG('Cambia Registro'),TIP('Cambia Registro')
                       BUTTON('&Borrar'),AT(473,272,49,14),USE(?Delete:3),LEFT,ICON('b.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Borra Registro'),TIP('Borra Registro')
                       BUTTON('E&xportar'),AT(6,300,52,15),USE(?EvoExportar),LEFT,ICON('export.ico'),FLAT
                       BUTTON('&Filtro'),AT(9,272,49,14),USE(?Query),LEFT,ICON('q.ico'),FLAT
                       SHEET,AT(4,4,524,289),USE(?CurrentTab)
                         TAB('ID'),USE(?Tab:2)
                         END
                         TAB('TRABAJO'),USE(?Tab:3)
                         END
                         TAB('SOCIOS'),USE(?Tab:4)
                           PROMPT('IDSOCIOS:'),AT(9,23),USE(?SOC2:IDSOCIOS:Prompt)
                           ENTRY(@n-14),AT(49,22,60,10),USE(SOC2:IDSOCIOS)
                         END
                       END
                       BUTTON('&Salir'),AT(480,300,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Salir'),TIP('Salir')
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
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::Sort1:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 2
BRW1::Sort2:Locator  FilterLocatorClass                    ! Conditional Locator - CHOICE(?CurrentTab) = 3
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
  Q7:FieldPar  = '1,2,3,4,5,6,7,8,9,10,'
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
  ADD(QPar7)   ! 29 Gestion006.clw
 !!!!!
 
 
  FREE(QPar27)
       Qp27:F2N  = 'IDSOCIOS'
  Qp27:F2P  = '@n-7'
  Qp27:F2T  = '0'
  ADD(QPar27)
       Qp27:F2N  = 'MATRICULA'
  Qp27:F2P  = '@s10'
  Qp27:F2T  = '0'
  ADD(QPar27)
       Qp27:F2N  = 'NOMBRE'
  Qp27:F2P  = '@s30'
  Qp27:F2T  = '0'
  ADD(QPar27)
       Qp27:F2N  = 'PROF'
  Qp27:F2P  = '@s50'
  Qp27:F2T  = '0'
  ADD(QPar27)
       Qp27:F2N  = 'IDTRB'
  Qp27:F2P  = '@n-7'
  Qp27:F2T  = '0'
  ADD(QPar27)
       Qp27:F2N  = 'NOMBRE'
  Qp27:F2P  = '@s30'
  Qp27:F2T  = '0'
  ADD(QPar27)
       Qp27:F2N  = 'DIRECCION'
  Qp27:F2P  = '@s30'
  Qp27:F2T  = '0'
  ADD(QPar27)
       Qp27:F2N  = 'LOCALIDAD'
  Qp27:F2P  = '@s20'
  Qp27:F2T  = '0'
  ADD(QPar27)
       Qp27:F2N  = 'TELEFONO'
  Qp27:F2P  = '@s20'
  Qp27:F2T  = '0'
  ADD(QPar27)
       Qp27:F2N  = 'FECHA'
  Qp27:F2P  = '@d17'
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
  Loc::Titulo7 ='LISTADO DE COLEGIADOS POR TRABAJO'
 
 SavPath7 = PATH()
  Exportar(Loc::QHlist7,BRW1.Q,QPar7,1,Loc::Titulo7,Evo::Group7)
 IF Not EC::LoadI_7 Then  BRW1.FileLoaded=false.
 SETPATH(SavPath7)
 !!!! Fin Routina Templates Clarion

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('ABMTRABAJOSXSOCIOS')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('TRA:IDTRABAJO',TRA:IDTRABAJO)                      ! Added by: BrowseBox(ABC)
  BIND('LOC:IDLOCALIDAD',LOC:IDLOCALIDAD)                  ! Added by: BrowseBox(ABC)
  BIND('SOC:IDSOCIO',SOC:IDSOCIO)                          ! Added by: BrowseBox(ABC)
  BIND('TIP6:IDTIPOTITULO',TIP6:IDTIPOTITULO)              ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:SOCIOSXTRABAJO.Open                               ! File SOCIOSXTRABAJO used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:SOCIOSXTRABAJO,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  QBE8.Init(QBV8, INIMgr,'ABMTRABAJOSXSOCIOS', GlobalErrors)
  QBE8.QkSupport = True
  QBE8.QkMenuIcon = 'QkQBE.ico'
  QBE8.QkIcon = 'QkLoad.ico'
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,SOC2:FK_SOCIOSXTRABAJO_TRABAJO)       ! Add the sort order for SOC2:FK_SOCIOSXTRABAJO_TRABAJO for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,SOC2:IDTRABAJO,,BRW1)          ! Initialize the browse locator using  using key: SOC2:FK_SOCIOSXTRABAJO_TRABAJO , SOC2:IDTRABAJO
  BRW1.AddSortOrder(,SOC2:FK_SOCIOSXTRABAJO_SOCIOS)        ! Add the sort order for SOC2:FK_SOCIOSXTRABAJO_SOCIOS for sort order 2
  BRW1.AddLocator(BRW1::Sort2:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort2:Locator.Init(?SOC2:IDSOCIOS,SOC2:IDSOCIOS,,BRW1) ! Initialize the browse locator using ?SOC2:IDSOCIOS using key: SOC2:FK_SOCIOSXTRABAJO_SOCIOS , SOC2:IDSOCIOS
  BRW1.AddSortOrder(,SOC2:PK_SOCIOSXTRABAJO)               ! Add the sort order for SOC2:PK_SOCIOSXTRABAJO for sort order 3
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 3
  BRW1::Sort0:Locator.Init(,SOC2:IDSOCIOS,,BRW1)           ! Initialize the browse locator using  using key: SOC2:PK_SOCIOSXTRABAJO , SOC2:IDSOCIOS
  BRW1.AddField(SOC2:IDSOCIOS,BRW1.Q.SOC2:IDSOCIOS)        ! Field SOC2:IDSOCIOS is a hot field or requires assignment from browse
  BRW1.AddField(SOC:MATRICULA,BRW1.Q.SOC:MATRICULA)        ! Field SOC:MATRICULA is a hot field or requires assignment from browse
  BRW1.AddField(SOC:NOMBRE,BRW1.Q.SOC:NOMBRE)              ! Field SOC:NOMBRE is a hot field or requires assignment from browse
  BRW1.AddField(TIP6:DESCRIPCION,BRW1.Q.TIP6:DESCRIPCION)  ! Field TIP6:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(SOC2:IDTRABAJO,BRW1.Q.SOC2:IDTRABAJO)      ! Field SOC2:IDTRABAJO is a hot field or requires assignment from browse
  BRW1.AddField(TRA:DESCRIPCION,BRW1.Q.TRA:DESCRIPCION)    ! Field TRA:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(TRA:DIRECCION,BRW1.Q.TRA:DIRECCION)        ! Field TRA:DIRECCION is a hot field or requires assignment from browse
  BRW1.AddField(LOC:DESCRIPCION,BRW1.Q.LOC:DESCRIPCION)    ! Field LOC:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(TRA:TELEFONO,BRW1.Q.TRA:TELEFONO)          ! Field TRA:TELEFONO is a hot field or requires assignment from browse
  BRW1.AddField(SOC2:FECHA,BRW1.Q.SOC2:FECHA)              ! Field SOC2:FECHA is a hot field or requires assignment from browse
  BRW1.AddField(TRA:IDTRABAJO,BRW1.Q.TRA:IDTRABAJO)        ! Field TRA:IDTRABAJO is a hot field or requires assignment from browse
  BRW1.AddField(LOC:IDLOCALIDAD,BRW1.Q.LOC:IDLOCALIDAD)    ! Field LOC:IDLOCALIDAD is a hot field or requires assignment from browse
  BRW1.AddField(SOC:IDSOCIO,BRW1.Q.SOC:IDSOCIO)            ! Field SOC:IDSOCIO is a hot field or requires assignment from browse
  BRW1.AddField(TIP6:IDTIPOTITULO,BRW1.Q.TIP6:IDTIPOTITULO) ! Field TIP6:IDTIPOTITULO is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('ABMTRABAJOSXSOCIOS',QuickWindow)           ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.QueryControl = ?Query
  BRW1.UpdateQuery(QBE8,1)
  BRW1.AskProcedure = 1                                    ! Will call: UpdateSOCIOSXTRABAJO
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
    Relate:SOCIOSXTRABAJO.Close
  END
  IF SELF.Opened
    INIMgr.Update('ABMTRABAJOSXSOCIOS',QuickWindow)        ! Save window data to non-volatile store
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
    UpdateSOCIOSXTRABAJO
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
       Do PrintExBrowse7
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
!!! </summary>
IMPRIMIR_INGRESO_ME PROCEDURE 

Progress:Thermometer BYTE                                  ! 
Process:View         VIEW(ME)
                       PROJECT(ME:FECHA)
                       PROJECT(ME:HORA)
                       PROJECT(ME:ME)
                       PROJECT(ME:ORIGEN)
                       PROJECT(ME:IDTIPO)
                       JOIN(MET:PK_METIPO,ME:IDTIPO)
                         PROJECT(MET:DESCRIPCION)
                       END
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

Report               REPORT,AT(1000,2396,6250,3813),PRE(RPT),PAPER(PAPER:A4),FONT('Arial',10,,FONT:regular,CHARSET:ANSI), |
  THOUS
                       HEADER,AT(1000,1000,6250,1406),USE(?Header)
                         IMAGE('logo.jpg'),AT(31,10,2000,1198),USE(?Image1)
                         STRING('Ingreso Mesa de Entradas'),AT(2094,979),USE(?String4),FONT(,12,,FONT:bold+FONT:underline), |
  TRN
                         LINE,AT(10,1375,6229,0),USE(?Line2),COLOR(COLOR:Black)
                       END
Detail                 DETAIL,AT(0,0,,2198),USE(?Detail)
                         STRING(@n-7),AT(708,0),USE(ME:ME)
                         STRING('Nº Ingreso'),AT(10,0),USE(?String5),TRN
                         STRING(@d17),AT(1844,21),USE(ME:FECHA)
                         STRING('Tipo:'),AT(4021,21),USE(?String9),TRN
                         STRING('Origen:'),AT(31,302),USE(?String11),TRN
                         STRING('Hora:'),AT(2854,10),USE(?String8),TRN
                         STRING(@t7),AT(3281,10),USE(ME:HORA)
                         STRING(@s25),AT(4396,10),USE(MET:DESCRIPCION),TRN
                         STRING('Fecha:'),AT(1385,10,542,208),USE(?String6),TRN
                         STRING(@s100),AT(542,313),USE(ME:ORIGEN)
                         LINE,AT(10,531,6229,0),USE(?Line1),COLOR(COLOR:Black)
                         STRING(''),AT(73,875),USE(?String12),TRN
                         STRING('Sello y Firma Colegio .{41}'),AT(3135,1552),USE(?String13),TRN
                         BOX,AT(10,2115,6229,52),USE(?Box1),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                       END
                       FOOTER,AT(1000,9688,6250,1000),USE(?Footer)
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
  GlobalErrors.SetProcedureName('IMPRIMIR_INGRESO_ME')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:ME.Open                                           ! File ME used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('IMPRIMIR_INGRESO_ME',ProgressWindow)       ! Restore window settings from non-volatile store
  TargetSelector.AddItem(XMLReporter.IReportGenerator)
  TargetSelector.AddItem(HTMLReporter.IReportGenerator)
  TargetSelector.AddItem(TXTReporter.IReportGenerator)
  TargetSelector.AddItem(PDFReporter.IReportGenerator)
  SELF.AddItem(TargetSelector)
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisReport.Init(Process:View, Relate:ME, ?Progress:PctText, Progress:Thermometer, ProgressMgr, ME:ME)
  ThisReport.AddSortOrder(ME:PK_ME)
  ThisReport.AddRange(ME:ME,GLO:IDSOLICITUD)
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:ME.SetQuickScan(1,Propagate:OneMany)
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
    Relate:ME.Close
  END
  IF SELF.Opened
    INIMgr.Update('IMPRIMIR_INGRESO_ME',ProgressWindow)    ! Save window data to non-volatile store
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
  SELF.Attribute.Set(?String4,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String4,RepGen:XML,TargetAttr:TagName,'String4')
  SELF.Attribute.Set(?String4,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?ME:ME,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ME:ME,RepGen:XML,TargetAttr:TagName,'ME:ME')
  SELF.Attribute.Set(?ME:ME,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String5,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String5,RepGen:XML,TargetAttr:TagName,'String5')
  SELF.Attribute.Set(?String5,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?ME:FECHA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ME:FECHA,RepGen:XML,TargetAttr:TagName,'ME:FECHA')
  SELF.Attribute.Set(?ME:FECHA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String9,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String9,RepGen:XML,TargetAttr:TagName,'String9')
  SELF.Attribute.Set(?String9,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String11,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String11,RepGen:XML,TargetAttr:TagName,'String11')
  SELF.Attribute.Set(?String11,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String8,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String8,RepGen:XML,TargetAttr:TagName,'String8')
  SELF.Attribute.Set(?String8,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?ME:HORA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ME:HORA,RepGen:XML,TargetAttr:TagName,'ME:HORA')
  SELF.Attribute.Set(?ME:HORA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?MET:DESCRIPCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?MET:DESCRIPCION,RepGen:XML,TargetAttr:TagName,'MET:DESCRIPCION')
  SELF.Attribute.Set(?MET:DESCRIPCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String6,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String6,RepGen:XML,TargetAttr:TagName,'String6')
  SELF.Attribute.Set(?String6,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?ME:ORIGEN,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ME:ORIGEN,RepGen:XML,TargetAttr:TagName,'ME:ORIGEN')
  SELF.Attribute.Set(?ME:ORIGEN,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String12,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String12,RepGen:XML,TargetAttr:TagName,'String12')
  SELF.Attribute.Set(?String12,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String13,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String13,RepGen:XML,TargetAttr:TagName,'String13')
  SELF.Attribute.Set(?String13,RepGen:XML,TargetAttr:TagValueFromText,True)


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
  SELF.SetDocumentInfo('CW Report','Gestion','IMPRIMIR_INGRESO_ME','IMPRIMIR_INGRESO_ME','','')
  SELF.SetPagesAsParentBookmark(False)
  SELF.SetScanCopyMode(False)
  SELF.CompressText   = True
  SELF.CompressImages = True

!!! <summary>
!!! Generated from procedure template - Window
!!! Actualizacion ME
!!! </summary>
Formulario_ME PROCEDURE 

CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
History::ME:Record   LIKE(ME:RECORD),THREAD
QuickWindow          WINDOW('Actualizacion ME'),AT(,,354,94),FONT('Arial',8,COLOR:Black,FONT:bold),RESIZE,CENTER, |
  GRAY,IMM,MDI,HLP('Formulario_ME'),SYSTEM
                       PROMPT('NUMERO:'),AT(1,14),USE(?ME:NUMERO:Prompt),TRN
                       ENTRY(@s50),AT(54,14,204,10),USE(ME:NUMERO),UPR
                       PROMPT('ORIGEN:'),AT(1,29),USE(?ME:ORIGEN:Prompt),TRN
                       ENTRY(@s100),AT(54,29,289,10),USE(ME:ORIGEN),UPR,REQ
                       PROMPT('CONTENIDO:'),AT(1,42),USE(?ME:CONTENIDO:Prompt),TRN
                       TEXT,AT(54,42,289,30),USE(ME:CONTENIDO),UPR
                       PROMPT('IDTIPO:'),AT(1,1),USE(?ME:IDTIPO:Prompt),TRN
                       ENTRY(@n-4),AT(54,1,40,10),USE(ME:IDTIPO)
                       BUTTON('...'),AT(95,0,12,12),USE(?CallLookup)
                       STRING(@s50),AT(109,1),USE(MET:DESCRIPCION)
                       BUTTON('&Aceptar'),AT(240,77,49,14),USE(?OK),LEFT,ICON('ok.ico'),CURSOR('mano.cur'),DEFAULT, |
  FLAT,MSG('Confirma y Actualiza el Formulario'),TIP('Confirma y Actualiza el Formulario')
                       BUTTON('&Cancelar'),AT(293,77,49,14),USE(?Cancel),LEFT,ICON('cancelar.ico'),CURSOR('mano.cur'), |
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
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
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
  GlobalErrors.SetProcedureName('Formulario_ME')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?ME:NUMERO:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(ME:Record,History::ME:Record)
  SELF.AddHistoryField(?ME:NUMERO,3)
  SELF.AddHistoryField(?ME:ORIGEN,4)
  SELF.AddHistoryField(?ME:CONTENIDO,5)
  SELF.AddHistoryField(?ME:IDTIPO,9)
  SELF.AddUpdateFile(Access:ME)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:ME.Open                                           ! File ME used by this procedure, so make sure it's RelationManager is open
  Relate:MEDPTO.Open                                       ! File MEDPTO used by this procedure, so make sure it's RelationManager is open
  Relate:MEESTADO.Open                                     ! File MEESTADO used by this procedure, so make sure it's RelationManager is open
  Relate:MEPASES.Open                                      ! File MEPASES used by this procedure, so make sure it's RelationManager is open
  Relate:METIPO.Open                                       ! File METIPO used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:ME
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
    ?ME:NUMERO{PROP:ReadOnly} = True
    ?ME:ORIGEN{PROP:ReadOnly} = True
    ?ME:IDTIPO{PROP:ReadOnly} = True
    DISABLE(?CallLookup)
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('Formulario_ME',QuickWindow)                ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:ME.Close
    Relate:MEDPTO.Close
    Relate:MEESTADO.Close
    Relate:MEPASES.Close
    Relate:METIPO.Close
  END
  IF SELF.Opened
    INIMgr.Update('Formulario_ME',QuickWindow)             ! Save window data to non-volatile store
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
    SelectMETIPO
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
    OF ?OK
      if self.request = insertrecord then
          ME:ACTIVO    =  'SI'
          ME:IDESTADO  =  1
          ME:IDDPTO    =  2
          ME:IDUSUARIO =  GLO:IDUSUARIO
          ME:HORA      =  clock()
          ME:FECHA     =  today()
      end
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?ME:IDTIPO
      MET:IDTIPO = ME:IDTIPO
      IF Access:METIPO.TryFetch(MET:PK_METIPO)
        IF SELF.Run(1,SelectRecord) = RequestCompleted
          ME:IDTIPO = MET:IDTIPO
        ELSE
          SELECT(?ME:IDTIPO)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
      IF Access:ME.TryValidateField(9)                     ! Attempt to validate ME:IDTIPO in ME
        SELECT(?ME:IDTIPO)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?ME:IDTIPO
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?ME:IDTIPO{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?CallLookup
      ThisWindow.Update()
      MET:IDTIPO = ME:IDTIPO
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        ME:IDTIPO = MET:IDTIPO
      END
      ThisWindow.Reset(1)
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
  !!!
  If  Self.Request=insertRecord AND SELF.RESPONSE = RequestCompleted Then
      !!! busco ultimo registro
      N# = 0
      clear(ME:record,1)
      set(ME:PK_ME,ME:PK_ME)
      previous(me)
      if errorcode() then
          N# = 1
      else
          N# = ME:ME
      end
      clear(ME:record)
      !!! cargo pases
      MEP:IDME        =  n#
      MEP:DPTO_ORIGEN = 1
      MEP:DPTO_DESTINO = 2
      MEP:MOTIVO = 'PASE A PRESIDENCIA'
      MEP:IDUSUARIO  = GLO:IDUSUARIO
      MEP:FECHA      = TODAY()
      MEP:HORA       = CLOCK()
      ACCESS:MEPASES.INSERT()
      GLO:IDSOLICITUD = MEP:IDME
      iMPRIMIR_INGRESO_ME
  end
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
!!! Select a METIPO Record
!!! </summary>
SelectMETIPO PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(METIPO)
                       PROJECT(MET:IDTIPO)
                       PROJECT(MET:DESCRIPCION)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
MET:IDTIPO             LIKE(MET:IDTIPO)               !List box control field - type derived from field
MET:DESCRIPCION        LIKE(MET:DESCRIPCION)          !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Select a METIPO Record'),AT(,,158,198),FONT('Arial',8,COLOR:Black,FONT:bold),RESIZE, |
  CENTER,GRAY,IMM,MDI,HLP('SelectMETIPO'),SYSTEM
                       LIST,AT(8,30,142,124),USE(?Browse:1),HVSCROLL,FORMAT('28R(2)|M~IDTIPO~C(0)@n-4@80L(2)|M' & |
  '~DESCRIPCION~L(2)@s50@'),FROM(Queue:Browse:1),IMM,MSG('Administrador de METIPO')
                       BUTTON('&Elegir'),AT(101,158,49,14),USE(?Select:2),LEFT,ICON('e.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Seleccionar'),TIP('Seleccionar')
                       SHEET,AT(4,4,150,172),USE(?CurrentTab)
                         TAB('DESCRIPCION'),USE(?Tab:1)
                         END
                         TAB('ID'),USE(?Tab:2)
                         END
                       END
                       BUTTON('&Salir'),AT(105,180,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
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
  GlobalErrors.SetProcedureName('SelectMETIPO')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('MET:IDTIPO',MET:IDTIPO)                            ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:METIPO.Open                                       ! File METIPO used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:METIPO,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,MET:PK_METIPO)                        ! Add the sort order for MET:PK_METIPO for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,MET:IDTIPO,,BRW1)              ! Initialize the browse locator using  using key: MET:PK_METIPO , MET:IDTIPO
  BRW1.AddSortOrder(,MET:IDX_METIPO_DESCRIP)               ! Add the sort order for MET:IDX_METIPO_DESCRIP for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(,MET:DESCRIPCION,,BRW1)         ! Initialize the browse locator using  using key: MET:IDX_METIPO_DESCRIP , MET:DESCRIPCION
  BRW1.AddField(MET:IDTIPO,BRW1.Q.MET:IDTIPO)              ! Field MET:IDTIPO is a hot field or requires assignment from browse
  BRW1.AddField(MET:DESCRIPCION,BRW1.Q.MET:DESCRIPCION)    ! Field MET:DESCRIPCION is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('SelectMETIPO',QuickWindow)                 ! Restore window settings from non-volatile store
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
    Relate:METIPO.Close
  END
  IF SELF.Opened
    INIMgr.Update('SelectMETIPO',QuickWindow)              ! Save window data to non-volatile store
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
!!! Administrador de ME
!!! </summary>
ME PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(ME)
                       PROJECT(ME:ME)
                       PROJECT(ME:FECHA)
                       PROJECT(ME:NUMERO)
                       PROJECT(ME:ORIGEN)
                       PROJECT(ME:CONTENIDO)
                       PROJECT(ME:ACTIVO)
                       PROJECT(ME:IDDPTO)
                       PROJECT(ME:IDESTADO)
                       PROJECT(ME:IDTIPO)
                       JOIN(MED:PK_MEDPTO,ME:IDDPTO)
                         PROJECT(MED:DESCRIPCION)
                         PROJECT(MED:IDDPTO)
                       END
                       JOIN(MET:PK_METIPO,ME:IDTIPO)
                         PROJECT(MET:DESCRIPCION)
                         PROJECT(MET:IDTIPO)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
ME:ME                  LIKE(ME:ME)                    !List box control field - type derived from field
ME:FECHA               LIKE(ME:FECHA)                 !List box control field - type derived from field
ME:NUMERO              LIKE(ME:NUMERO)                !List box control field - type derived from field
MET:DESCRIPCION        LIKE(MET:DESCRIPCION)          !List box control field - type derived from field
ME:ORIGEN              LIKE(ME:ORIGEN)                !List box control field - type derived from field
ME:CONTENIDO           LIKE(ME:CONTENIDO)             !List box control field - type derived from field
ME:ACTIVO              LIKE(ME:ACTIVO)                !List box control field - type derived from field
MED:DESCRIPCION        LIKE(MED:DESCRIPCION)          !List box control field - type derived from field
ME:IDDPTO              LIKE(ME:IDDPTO)                !Browse key field - type derived from field
ME:IDESTADO            LIKE(ME:IDESTADO)              !Browse key field - type derived from field
ME:IDTIPO              LIKE(ME:IDTIPO)                !Browse key field - type derived from field
MED:IDDPTO             LIKE(MED:IDDPTO)               !Related join file key field - type derived from field
MET:IDTIPO             LIKE(MET:IDTIPO)               !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Administrador de ME'),AT(,,453,294),FONT('Arial',8,COLOR:Black,FONT:bold),RESIZE,CENTER, |
  GRAY,IMM,MDI,HLP('ME'),SYSTEM
                       LIST,AT(8,30,431,215),USE(?Browse:1),HVSCROLL,FORMAT('36R(2)|M~ME~C(0)@n-7@80R(2)|M~FEC' & |
  'HA~C(0)@d17@80L(2)|M~NUMERO~@s50@87L(2)|M~TIPO~@s20@80L(2)|M~ORIGEN~@s100@80L(2)|M~C' & |
  'ONTENIDO~@s100@28L(2)|M~ACTIVO~@s2@200L(2)|M~DPTO ACTUAL~@s50@'),FROM(Queue:Browse:1),IMM, |
  MSG('Administrador de ME'),VCR
                       BUTTON('&Ver'),AT(290,251,49,14),USE(?View:2),LEFT,ICON('v.ico'),CURSOR('mano.cur'),FLAT,MSG('Visualizar'), |
  TIP('Visualizar')
                       BUTTON('&Agregar'),AT(343,251,49,14),USE(?Insert:3),LEFT,ICON('a.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Agrega Registro'),TIP('Agrega Registro')
                       BUTTON('&Cambiar'),AT(396,251,49,14),USE(?Change:3),LEFT,ICON('c.ico'),CURSOR('mano.cur'), |
  DEFAULT,FLAT,MSG('Cambia Registro'),TIP('Cambia Registro')
                       BUTTON('&Borrar'),AT(309,272,49,14),USE(?Delete:3),LEFT,ICON('b.ico'),CURSOR('mano.cur'),DISABLE, |
  FLAT,HIDE,MSG('Borra Registro'),TIP('Borra Registro')
                       BUTTON('E&xportar'),AT(5,275,52,15),USE(?EvoExportar),LEFT,ICON('export.ico'),FLAT
                       BUTTON('Imprimir Ingresos'),AT(67,275,85,16),USE(?Button10),LEFT,ICON(ICON:Print1),FLAT
                       SHEET,AT(4,4,444,266),USE(?CurrentTab)
                         TAB('ID'),USE(?Tab:1)
                         END
                         TAB('DPTO'),USE(?Tab:3)
                           BUTTON('Select MEDPTO'),AT(10,250,118,14),USE(?SelectMEDPTO),MSG('Select Parent Field'),TIP('Selecciona')
                         END
                         TAB('ESTADO'),USE(?Tab:4)
                           BUTTON('Select MEESTADO'),AT(9,249,118,14),USE(?SelectMEESTADO),MSG('Select Parent Field'), |
  TIP('Selecciona')
                         END
                         TAB('TIPO'),USE(?Tab:2)
                           BUTTON('Select METIPO'),AT(9,249,118,14),USE(?SelectMETIPO),MSG('Select Parent Field'),TIP('Selecciona')
                         END
                       END
                       BUTTON('&Salir'),AT(402,278,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Salir'),TIP('Salir')
                       BUTTON('&Filtro'),AT(11,251,49,14),USE(?Query),LEFT,ICON('qbe.ico'),FLAT
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
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
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
  Q7:FieldPar  = '1,2,3,4,5,6,7,8,'
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
  ADD(QPar7)   ! 29 Gestion006.clw
 !!!!!
 
 
  FREE(QPar27)
       Qp27:F2N  = 'ME'
  Qp27:F2P  = '@n-7'
  Qp27:F2T  = '0'
  ADD(QPar27)
       Qp27:F2N  = 'FECHA'
  Qp27:F2P  = '@d17'
  Qp27:F2T  = '0'
  ADD(QPar27)
       Qp27:F2N  = 'NUMERO'
  Qp27:F2P  = '@s50'
  Qp27:F2T  = '0'
  ADD(QPar27)
       Qp27:F2N  = 'TIPO'
  Qp27:F2P  = '@s20'
  Qp27:F2T  = '0'
  ADD(QPar27)
       Qp27:F2N  = 'ORIGEN'
  Qp27:F2P  = '@s100'
  Qp27:F2T  = '0'
  ADD(QPar27)
       Qp27:F2N  = 'CONTENIDO'
  Qp27:F2P  = '@s100'
  Qp27:F2T  = '0'
  ADD(QPar27)
       Qp27:F2N  = 'ACTIVO'
  Qp27:F2P  = '@s2'
  Qp27:F2T  = '0'
  ADD(QPar27)
       Qp27:F2N  = 'DPTO ACTUAL'
  Qp27:F2P  = '@s50'
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
  Loc::Titulo7 ='Administrator the ME'
 
 SavPath7 = PATH()
  Exportar(Loc::QHlist7,BRW1.Q,QPar7,0,Loc::Titulo7,Evo::Group7)
 IF Not EC::LoadI_7 Then  BRW1.FileLoaded=false.
 SETPATH(SavPath7)
 !!!! Fin Routina Templates Clarion

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('ME')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('ME:ME',ME:ME)                                      ! Added by: BrowseBox(ABC)
  BIND('MED:IDDPTO',MED:IDDPTO)                            ! Added by: BrowseBox(ABC)
  BIND('MET:IDTIPO',MET:IDTIPO)                            ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:ME.Open                                           ! File ME used by this procedure, so make sure it's RelationManager is open
  Relate:MEDPTO.Open                                       ! File MEDPTO used by this procedure, so make sure it's RelationManager is open
  Relate:MEESTADO.Open                                     ! File MEESTADO used by this procedure, so make sure it's RelationManager is open
  Relate:METIPO.Open                                       ! File METIPO used by this procedure, so make sure it's RelationManager is open
  Relate:USUARIO.Open                                      ! File USUARIO used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:ME,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  QBE8.Init(QBV8, INIMgr,'ME', GlobalErrors)
  QBE8.QkSupport = True
  QBE8.QkMenuIcon = 'QkQBE.ico'
  QBE8.QkIcon = 'QkLoad.ico'
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,ME:FK_ME_DPTO)                        ! Add the sort order for ME:FK_ME_DPTO for sort order 1
  BRW1.AddRange(ME:IDDPTO,Relate:ME,Relate:MEDPTO)         ! Add file relationship range limit for sort order 1
  BRW1.AddSortOrder(,ME:FK_ME_ESTADO)                      ! Add the sort order for ME:FK_ME_ESTADO for sort order 2
  BRW1.AddRange(ME:IDESTADO,Relate:ME,Relate:MEESTADO)     ! Add file relationship range limit for sort order 2
  BRW1.AddSortOrder(,ME:FK_ME_TIPO)                        ! Add the sort order for ME:FK_ME_TIPO for sort order 3
  BRW1.AddRange(ME:IDTIPO,Relate:ME,Relate:METIPO)         ! Add file relationship range limit for sort order 3
  BRW1.AddSortOrder(,ME:PK_ME)                             ! Add the sort order for ME:PK_ME for sort order 4
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 4
  BRW1::Sort0:Locator.Init(,ME:ME,,BRW1)                   ! Initialize the browse locator using  using key: ME:PK_ME , ME:ME
  BRW1.AddField(ME:ME,BRW1.Q.ME:ME)                        ! Field ME:ME is a hot field or requires assignment from browse
  BRW1.AddField(ME:FECHA,BRW1.Q.ME:FECHA)                  ! Field ME:FECHA is a hot field or requires assignment from browse
  BRW1.AddField(ME:NUMERO,BRW1.Q.ME:NUMERO)                ! Field ME:NUMERO is a hot field or requires assignment from browse
  BRW1.AddField(MET:DESCRIPCION,BRW1.Q.MET:DESCRIPCION)    ! Field MET:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(ME:ORIGEN,BRW1.Q.ME:ORIGEN)                ! Field ME:ORIGEN is a hot field or requires assignment from browse
  BRW1.AddField(ME:CONTENIDO,BRW1.Q.ME:CONTENIDO)          ! Field ME:CONTENIDO is a hot field or requires assignment from browse
  BRW1.AddField(ME:ACTIVO,BRW1.Q.ME:ACTIVO)                ! Field ME:ACTIVO is a hot field or requires assignment from browse
  BRW1.AddField(MED:DESCRIPCION,BRW1.Q.MED:DESCRIPCION)    ! Field MED:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(ME:IDDPTO,BRW1.Q.ME:IDDPTO)                ! Field ME:IDDPTO is a hot field or requires assignment from browse
  BRW1.AddField(ME:IDESTADO,BRW1.Q.ME:IDESTADO)            ! Field ME:IDESTADO is a hot field or requires assignment from browse
  BRW1.AddField(ME:IDTIPO,BRW1.Q.ME:IDTIPO)                ! Field ME:IDTIPO is a hot field or requires assignment from browse
  BRW1.AddField(MED:IDDPTO,BRW1.Q.MED:IDDPTO)              ! Field MED:IDDPTO is a hot field or requires assignment from browse
  BRW1.AddField(MET:IDTIPO,BRW1.Q.MET:IDTIPO)              ! Field MET:IDTIPO is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('ME',QuickWindow)                           ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.QueryControl = ?Query
  BRW1.UpdateQuery(QBE8,1)
  BRW1.AskProcedure = 1                                    ! Will call: Formulario_ME
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
    Relate:ME.Close
    Relate:MEDPTO.Close
    Relate:MEESTADO.Close
    Relate:METIPO.Close
    Relate:USUARIO.Close
  END
  IF SELF.Opened
    INIMgr.Update('ME',QuickWindow)                        ! Save window data to non-volatile store
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
    Formulario_ME
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
       Do PrintExBrowse7
    OF ?Button10
      ThisWindow.Update()
      START(ME_imprimir_ingreso, 25000)
      ThisWindow.Reset
    OF ?SelectMEDPTO
      ThisWindow.Update()
      GlobalRequest = SelectRecord
      SelectMEDPTO()
      ThisWindow.Reset
    OF ?SelectMEESTADO
      ThisWindow.Update()
      GlobalRequest = SelectRecord
      SelectMEESTADO()
      ThisWindow.Reset
    OF ?SelectMETIPO
      ThisWindow.Update()
      GlobalRequest = SelectRecord
      SelectMETIPO()
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
  ELSIF CHOICE(?CurrentTab) = 4
    RETURN SELF.SetSort(3,Force)
  ELSE
    RETURN SELF.SetSort(4,Force)
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
!!! Generated from procedure template - Window
!!! Select a MEESTADO Record
!!! </summary>
SelectMEESTADO PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(MEESTADO)
                       PROJECT(MEE:IDESTADO)
                       PROJECT(MEE:DESCRIPCION)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
MEE:IDESTADO           LIKE(MEE:IDESTADO)             !List box control field - type derived from field
MEE:DESCRIPCION        LIKE(MEE:DESCRIPCION)          !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Select a MEESTADO Record'),AT(,,158,198),FONT('Arial',8,COLOR:Black,FONT:bold),RESIZE, |
  CENTER,GRAY,IMM,MDI,HLP('SelectMEESTADO'),SYSTEM
                       LIST,AT(8,30,142,124),USE(?Browse:1),HVSCROLL,FORMAT('36R(2)|M~IDESTADO~C(0)@n-4@80L(2)' & |
  '|M~DESCRIPCION~L(2)@s50@'),FROM(Queue:Browse:1),IMM,MSG('Administrador de MEESTADO')
                       BUTTON('&Elegir'),AT(101,158,49,14),USE(?Select:2),LEFT,ICON('e.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Seleccionar'),TIP('Seleccionar')
                       SHEET,AT(4,4,150,172),USE(?CurrentTab)
                         TAB('IDX_MEESTADO_DESCRIP'),USE(?Tab:2)
                         END
                         TAB('PK_MEESTADO'),USE(?Tab:3)
                         END
                       END
                       BUTTON('&Salir'),AT(105,180,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
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
  GlobalErrors.SetProcedureName('SelectMEESTADO')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('MEE:IDESTADO',MEE:IDESTADO)                        ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:MEESTADO.Open                                     ! File MEESTADO used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:MEESTADO,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,MEE:PK_MEESTADO)                      ! Add the sort order for MEE:PK_MEESTADO for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,MEE:IDESTADO,,BRW1)            ! Initialize the browse locator using  using key: MEE:PK_MEESTADO , MEE:IDESTADO
  BRW1.AddSortOrder(,MEE:IDX_MEESTADO_DESCRIP)             ! Add the sort order for MEE:IDX_MEESTADO_DESCRIP for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(,MEE:DESCRIPCION,,BRW1)         ! Initialize the browse locator using  using key: MEE:IDX_MEESTADO_DESCRIP , MEE:DESCRIPCION
  BRW1.AddField(MEE:IDESTADO,BRW1.Q.MEE:IDESTADO)          ! Field MEE:IDESTADO is a hot field or requires assignment from browse
  BRW1.AddField(MEE:DESCRIPCION,BRW1.Q.MEE:DESCRIPCION)    ! Field MEE:DESCRIPCION is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('SelectMEESTADO',QuickWindow)               ! Restore window settings from non-volatile store
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
    Relate:MEESTADO.Close
  END
  IF SELF.Opened
    INIMgr.Update('SelectMEESTADO',QuickWindow)            ! Save window data to non-volatile store
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
!!! Select a MEDPTO Record
!!! </summary>
SelectMEDPTO PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(MEDPTO)
                       PROJECT(MED:IDDPTO)
                       PROJECT(MED:DESCRIPCION)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
MED:IDDPTO             LIKE(MED:IDDPTO)               !List box control field - type derived from field
MED:DESCRIPCION        LIKE(MED:DESCRIPCION)          !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Select a MEDPTO Record'),AT(,,158,198),FONT('Arial',8,COLOR:Black,FONT:bold),RESIZE, |
  CENTER,GRAY,IMM,MDI,HLP('SelectMEDPTO'),SYSTEM
                       LIST,AT(8,30,142,124),USE(?Browse:1),HVSCROLL,FORMAT('28R(2)|M~IDDPTO~C(0)@n-3@80L(2)|M' & |
  '~DESCRIPCION~L(2)@s50@'),FROM(Queue:Browse:1),IMM,MSG('Administrador de MEDPTO')
                       BUTTON('&Elegir'),AT(101,158,49,14),USE(?Select:2),LEFT,ICON('e.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Seleccionar'),TIP('Seleccionar')
                       SHEET,AT(4,4,150,172),USE(?CurrentTab)
                         TAB('IDX_MEDPTO_DECRIP'),USE(?Tab:2)
                         END
                         TAB('PK_MEDPTO'),USE(?Tab:3)
                         END
                       END
                       BUTTON('&Salir'),AT(105,180,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
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
  GlobalErrors.SetProcedureName('SelectMEDPTO')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('MED:IDDPTO',MED:IDDPTO)                            ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:MEDPTO.Open                                       ! File MEDPTO used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:MEDPTO,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,MED:PK_MEDPTO)                        ! Add the sort order for MED:PK_MEDPTO for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,MED:IDDPTO,,BRW1)              ! Initialize the browse locator using  using key: MED:PK_MEDPTO , MED:IDDPTO
  BRW1.AddSortOrder(,MED:IDX_MEDPTO_DECRIP)                ! Add the sort order for MED:IDX_MEDPTO_DECRIP for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(,MED:DESCRIPCION,,BRW1)         ! Initialize the browse locator using  using key: MED:IDX_MEDPTO_DECRIP , MED:DESCRIPCION
  BRW1.AddField(MED:IDDPTO,BRW1.Q.MED:IDDPTO)              ! Field MED:IDDPTO is a hot field or requires assignment from browse
  BRW1.AddField(MED:DESCRIPCION,BRW1.Q.MED:DESCRIPCION)    ! Field MED:DESCRIPCION is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('SelectMEDPTO',QuickWindow)                 ! Restore window settings from non-volatile store
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
    Relate:MEDPTO.Close
  END
  IF SELF.Opened
    INIMgr.Update('SelectMEDPTO',QuickWindow)              ! Save window data to non-volatile store
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

