

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABQUERY.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABUTIL.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE
   INCLUDE('NetEmail.inc'),ONCE

                     MAP
                       INCLUDE('GESTION051.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION013.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION030.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION045.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION048.INC'),ONCE        !Req'd for module callout resolution
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
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
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

