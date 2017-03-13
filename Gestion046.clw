

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
                       INCLUDE('GESTION046.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION045.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION048.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the SOCIOS file
!!! </summary>
CUMPLE2 PROCEDURE 

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
loc:email            STRING(400)                           ! 
! our data
StartPos             long
EndPos               long
ParamPath            string (255)
Param1               string (255)
count                long
tempFileList         string (Net:StdEmailAttachmentListSize)
QuickerDisplay       byte
MessageCount         long
BRW1::View:Browse    VIEW(CUMPLE)
                       PROJECT(CUM:DIA)
                       PROJECT(CUM:NOMBRE)
                       PROJECT(CUM:EMAIL)
                       PROJECT(CUM:FECHA_NAC)
                       PROJECT(CUM:IDSOCIO)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
T                      LIKE(T)                        !List box control field - type derived from local data
T_NormalFG             LONG                           !Normal forground color
T_NormalBG             LONG                           !Normal background color
T_SelectedFG           LONG                           !Selected forground color
T_SelectedBG           LONG                           !Selected background color
T_Icon                 LONG                           !Entry's icon ID
CUM:DIA                LIKE(CUM:DIA)                  !List box control field - type derived from field
CUM:DIA_NormalFG       LONG                           !Normal forground color
CUM:DIA_NormalBG       LONG                           !Normal background color
CUM:DIA_SelectedFG     LONG                           !Selected forground color
CUM:DIA_SelectedBG     LONG                           !Selected background color
CUM:DIA_Icon           LONG                           !Entry's icon ID
CUM:NOMBRE             LIKE(CUM:NOMBRE)               !List box control field - type derived from field
CUM:NOMBRE_NormalFG    LONG                           !Normal forground color
CUM:NOMBRE_NormalBG    LONG                           !Normal background color
CUM:NOMBRE_SelectedFG  LONG                           !Selected forground color
CUM:NOMBRE_SelectedBG  LONG                           !Selected background color
CUM:NOMBRE_Icon        LONG                           !Entry's icon ID
CUM:EMAIL              LIKE(CUM:EMAIL)                !List box control field - type derived from field
CUM:EMAIL_NormalFG     LONG                           !Normal forground color
CUM:EMAIL_NormalBG     LONG                           !Normal background color
CUM:EMAIL_SelectedFG   LONG                           !Selected forground color
CUM:EMAIL_SelectedBG   LONG                           !Selected background color
CUM:EMAIL_Icon         LONG                           !Entry's icon ID
CUM:FECHA_NAC          LIKE(CUM:FECHA_NAC)            !List box control field - type derived from field
CUM:FECHA_NAC_NormalFG LONG                           !Normal forground color
CUM:FECHA_NAC_NormalBG LONG                           !Normal background color
CUM:FECHA_NAC_SelectedFG LONG                         !Selected forground color
CUM:FECHA_NAC_SelectedBG LONG                         !Selected background color
CUM:FECHA_NAC_Icon     LONG                           !Entry's icon ID
CUM:IDSOCIO            LIKE(CUM:IDSOCIO)              !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Enviar E-mails a los Colegiados'),AT(,,499,233),FONT('Arial',8,,FONT:regular),RESIZE, |
  CENTER,GRAY,IMM,MDI,HLP('BrowseSOCIOS'),SYSTEM
                       LIST,AT(8,35,478,82),USE(?Browse:1),HVSCROLL,FORMAT('22L(2)|M*I~T~C(0)@s1@32R(2)|M*I~DI' & |
  'A~C(0)@n-3@200L(2)|M*I~NOMBRE~C(0)@s50@400L(2)|M*I~EMAIL~C(0)@s100@40L(2)|M*I~FECHA_' & |
  'NAC~C(0)@d17@'),FROM(Queue:Browse:1),IMM,MSG('Administrador de SOCIOS'),VCR
                       BUTTON('&Filtros'),AT(7,122,49,14),USE(?Query),LEFT,ICON('qkqbe.ico'),FLAT
                       SHEET,AT(4,2,486,138),USE(?CurrentTab)
                         TAB('Hoy'),USE(?Tab:1)
                         END
                         TAB('Semana'),USE(?Tab:2)
                         END
                       END
                       BOX,AT(154,123,17,13),USE(?Box2),COLOR(COLOR:Black),FILL(COLOR:Teal)
                       BUTTON('&Salir'),AT(450,209,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Salir'),TIP('Salir')
                       STRING(''),AT(16,223,297,10),USE(?Status),TRN
                       PROMPT('Cumpleaños en el día de la fecha'),AT(175,125),USE(?Prompt3)
                       BOX,AT(61,124,17,10),USE(?Box1),COLOR(COLOR:Black),FILL(COLOR:Red)
                       PROMPT('Cumpleaños Vencido'),AT(81,124),USE(?Prompt2)
                       PROGRESS,AT(15,211,437,8),USE(?OurProgress),COLOR(COLOR:White,,COLOR:Lime),HIDE,RANGE(0,100)
                       BUTTON('&Borrar'),AT(103,207,49,14),USE(?Delete:3),LEFT,CURSOR('mano.cur'),DISABLE,HIDE,MSG('Borra Registro'), |
  TIP('Borra Registro')
                       GROUP,AT(5,141,485,27),USE(?Group1),BOXED
                         BUTTON('&Marcar'),AT(11,149,80,13),USE(?DASTAG),FLAT
                         BUTTON('Marcar Todo '),AT(305,149,80,13),USE(?DASTAGAll),FLAT
                         BUTTON('&Desmarcar Todo'),AT(109,149,80,13),USE(?DASUNTAGALL),FLAT
                         BUTTON('&Revertir Marca'),AT(207,149,80,13),USE(?DASREVTAG),FLAT
                         BUTTON('Mostrar solo Marca'),AT(403,149,80,13),USE(?DASSHOWTAG),FLAT
                       END
                       GROUP('E-Mail'),AT(4,169,485,39),USE(?Group2),BOXED
                         PROMPT('AÑADIDO:'),AT(22,185),USE(?LOC:ATTACH:Prompt)
                         ENTRY(@s254),AT(60,185,110,10),USE(LOC:ATTACH)
                         BUTTON('...'),AT(172,185,12,12),USE(?LookupFile)
                         BUTTON('Enviar E-mail'),AT(192,177,82,21),USE(?Button12),LEFT,ICON('mail.ico'),FLAT
                         BUTTON('Ver e-Mails Enviados'),AT(280,177,82,21),USE(?Button13),LEFT,ICON('pin_blue.ico'), |
  FLAT
                         BUTTON('Enviar x SMTP '),AT(358,181,80,17),USE(?Button14),LEFT,ICON('mail.ico'),DISABLE,FLAT, |
  HIDE
                       END
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
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

BRW1::Sort1:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 2
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
   TAGS.PUNTERO = CUM:IDSOCIO
   GET(TAGS,TAGS.PUNTERO)
  IF ERRORCODE()
     TAGS.PUNTERO = CUM:IDSOCIO
     ADD(TAGS,TAGS.PUNTERO)
    T = '*'
  ELSE
    DELETE(TAGS)
    T = ''
  END
    Queue:Browse:1.T = T
  Queue:Browse:1.T_NormalFG = -1
  Queue:Browse:1.T_NormalBG = -1
  Queue:Browse:1.T_SelectedFG = -1
  Queue:Browse:1.T_SelectedBG = -1
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
     TAGS.PUNTERO = CUM:IDSOCIO
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
     DASBRW::12:QUEUE.PUNTERO = CUM:IDSOCIO
     GET(DASBRW::12:QUEUE,DASBRW::12:QUEUE.PUNTERO)
    IF ERRORCODE()
       TAGS.PUNTERO = CUM:IDSOCIO
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
  GlobalErrors.SetProcedureName('CUMPLE2')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('CUM:FECHA_NAC',CUM:FECHA_NAC)                      ! Added by: DAS_TagBrowseABC(DAS_TagingABC)
  BIND('T',T)                                              ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:CUMPLE.Open                                       ! File CUMPLE used by this procedure, so make sure it's RelationManager is open
  Relate:EMAIL.Open                                        ! File EMAIL used by this procedure, so make sure it's RelationManager is open
  Relate:EMAILS.Open                                       ! File EMAILS used by this procedure, so make sure it's RelationManager is open
  Relate:SOCIOS.Open                                       ! File SOCIOS used by this procedure, so make sure it's RelationManager is open
  Relate:USUARIO.Open                                      ! File USUARIO used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:CUMPLE,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
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
  BRW1.AddSortOrder(,CUM:por_dia)                          ! Add the sort order for CUM:por_dia for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,CUM:FECHA_NAC,1,BRW1)          ! Initialize the browse locator using  using key: CUM:por_dia , CUM:FECHA_NAC
  BRW1.SetFilter('(day(today()) <<> day(CUM:FECHA_NAC))')  ! Apply filter expression to browse
  BRW1.AddSortOrder(,CUM:por_dia)                          ! Add the sort order for CUM:por_dia for sort order 2
  BRW1.SetFilter('(day(today()) = day(CUM:FECHA_NAC) and month( CUM:FECHA_NAC) = month (today()))') ! Apply filter expression to browse
  BRW1.AddField(T,BRW1.Q.T)                                ! Field T is a hot field or requires assignment from browse
  BRW1.AddField(CUM:DIA,BRW1.Q.CUM:DIA)                    ! Field CUM:DIA is a hot field or requires assignment from browse
  BRW1.AddField(CUM:NOMBRE,BRW1.Q.CUM:NOMBRE)              ! Field CUM:NOMBRE is a hot field or requires assignment from browse
  BRW1.AddField(CUM:EMAIL,BRW1.Q.CUM:EMAIL)                ! Field CUM:EMAIL is a hot field or requires assignment from browse
  BRW1.AddField(CUM:FECHA_NAC,BRW1.Q.CUM:FECHA_NAC)        ! Field CUM:FECHA_NAC is a hot field or requires assignment from browse
  BRW1.AddField(CUM:IDSOCIO,BRW1.Q.CUM:IDSOCIO)            ! Field CUM:IDSOCIO is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('CUMPLE2',QuickWindow)                      ! Restore window settings from non-volatile store
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
    Relate:CUMPLE.Close
    Relate:EMAIL.Close
    Relate:EMAILS.Close
    Relate:SOCIOS.Close
    Relate:USUARIO.Close
  END
  IF SELF.Opened
    INIMgr.Update('CUMPLE2',QuickWindow)                   ! Save window data to non-volatile store
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
    OF ?Button12
      EmailSubject =  'Salutación por su Cumpleaños'
      EmailFileList = CLIP(LOC:ATTACH)
      
      ! Carga tabla  con los tags
      Loop i# = 1 to records(Tags)
          get(Tags,i#)
          CUM:IDSOCIO = tags:Puntero
          If NOT Access:cumple.Fetch(CUM:PK_CUMPLE)
                 loc:email = 'Estimada '&clip(CUM:NOMBRE)&':'&Chr(13)&Chr(10)&Chr(13)&Chr(10)&'Que el bienestar y la prosperidad siempre la acompañen a donde quiera que vaya, que su vida personal se llene de éxitos prósperos y que la alegría de este día se convierta en una vorágine constante en su vida.'&Chr(13)&Chr(10)&Chr(13)&Chr(10)&'Feliz Cumpleaños!!!'&Chr(13)&Chr(10)&Chr(13)&Chr(10)&Chr(13)&Chr(10)&Chr(13)&Chr(10)&'Comisión Directiva'&Chr(13)&Chr(10)&Chr(13)&Chr(10)&Chr(13)&Chr(10)&Chr(13)&Chr(10)&'CONUPROMI'
                 EmailMessageText = clip(loc:email)
                 EmailTo= clip(CUM:EMAIL)
                 cantidad# = cantidad# + 1
                 SendEmail(EmailServer, EmailPort, EmailFrom, EmailTo, EmailSubject, EmailCC, EmailBcc, EmailFileList, EmailMessageText)
                 IF NOT ERRORCODE() THEN
                  SOC:IDSOCIO = CUM:IDSOCIO
                  ACCESS:SOCIOS.TRyFETCH(SOC:PK_SOCIOS)
                  SOC:CUMPLE = YEAR(TODAY())
                  ACCESS:SOCIOS.UPDATE()
                 END
                 PARA" = PARA"&';'&clip(SOC:EMAIL)
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
         !! MARCA EMAIL ENVIADO
      
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
  ELSE
    RETURN SELF.SetSort(2,Force)
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
     TAGS.PUNTERO = CUM:IDSOCIO
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
  
  IF (CUM:DIA = day(today()) and month( CUM:FECHA_NAC) = month (today()))
    SELF.Q.T_NormalFG = 8421376                            ! Set conditional color values for T
    SELF.Q.T_NormalBG = 16777215
    SELF.Q.T_SelectedFG = 16777215
    SELF.Q.T_SelectedBG = 8421376
    SELF.Q.CUM:DIA_NormalFG = 8421376                      ! Set conditional color values for CUM:DIA
    SELF.Q.CUM:DIA_NormalBG = 16777215
    SELF.Q.CUM:DIA_SelectedFG = 16777215
    SELF.Q.CUM:DIA_SelectedBG = 8421376
    SELF.Q.CUM:NOMBRE_NormalFG = 8421376                   ! Set conditional color values for CUM:NOMBRE
    SELF.Q.CUM:NOMBRE_NormalBG = 16777215
    SELF.Q.CUM:NOMBRE_SelectedFG = 16777215
    SELF.Q.CUM:NOMBRE_SelectedBG = 8421376
    SELF.Q.CUM:EMAIL_NormalFG = 8421376                    ! Set conditional color values for CUM:EMAIL
    SELF.Q.CUM:EMAIL_NormalBG = 16777215
    SELF.Q.CUM:EMAIL_SelectedFG = 16777215
    SELF.Q.CUM:EMAIL_SelectedBG = 8421376
    SELF.Q.CUM:FECHA_NAC_NormalFG = 8421376                ! Set conditional color values for CUM:FECHA_NAC
    SELF.Q.CUM:FECHA_NAC_NormalBG = 16777215
    SELF.Q.CUM:FECHA_NAC_SelectedFG = 16777215
    SELF.Q.CUM:FECHA_NAC_SelectedBG = 8421376
  ELSIF (CUM:DIA < day(today()) and month( CUM:FECHA_NAC) = month (today()))
    SELF.Q.T_NormalFG = 255                                ! Set conditional color values for T
    SELF.Q.T_NormalBG = 16777215
    SELF.Q.T_SelectedFG = 16777215
    SELF.Q.T_SelectedBG = 255
    SELF.Q.CUM:DIA_NormalFG = 255                          ! Set conditional color values for CUM:DIA
    SELF.Q.CUM:DIA_NormalBG = 16777215
    SELF.Q.CUM:DIA_SelectedFG = 16777215
    SELF.Q.CUM:DIA_SelectedBG = 255
    SELF.Q.CUM:NOMBRE_NormalFG = 255                       ! Set conditional color values for CUM:NOMBRE
    SELF.Q.CUM:NOMBRE_NormalBG = 16777215
    SELF.Q.CUM:NOMBRE_SelectedFG = 16777215
    SELF.Q.CUM:NOMBRE_SelectedBG = 255
    SELF.Q.CUM:EMAIL_NormalFG = 255                        ! Set conditional color values for CUM:EMAIL
    SELF.Q.CUM:EMAIL_NormalBG = 16777215
    SELF.Q.CUM:EMAIL_SelectedFG = 16777215
    SELF.Q.CUM:EMAIL_SelectedBG = 255
    SELF.Q.CUM:FECHA_NAC_NormalFG = 255                    ! Set conditional color values for CUM:FECHA_NAC
    SELF.Q.CUM:FECHA_NAC_NormalBG = 16777215
    SELF.Q.CUM:FECHA_NAC_SelectedFG = 16777215
    SELF.Q.CUM:FECHA_NAC_SelectedBG = 255
  ELSE
    SELF.Q.T_NormalFG = -1                                 ! Set color values for T
    SELF.Q.T_NormalBG = -1
    SELF.Q.T_SelectedFG = -1
    SELF.Q.T_SelectedBG = -1
    SELF.Q.CUM:DIA_NormalFG = -1                           ! Set color values for CUM:DIA
    SELF.Q.CUM:DIA_NormalBG = -1
    SELF.Q.CUM:DIA_SelectedFG = -1
    SELF.Q.CUM:DIA_SelectedBG = -1
    SELF.Q.CUM:NOMBRE_NormalFG = -1                        ! Set color values for CUM:NOMBRE
    SELF.Q.CUM:NOMBRE_NormalBG = -1
    SELF.Q.CUM:NOMBRE_SelectedFG = -1
    SELF.Q.CUM:NOMBRE_SelectedBG = -1
    SELF.Q.CUM:EMAIL_NormalFG = -1                         ! Set color values for CUM:EMAIL
    SELF.Q.CUM:EMAIL_NormalBG = -1
    SELF.Q.CUM:EMAIL_SelectedFG = -1
    SELF.Q.CUM:EMAIL_SelectedBG = -1
    SELF.Q.CUM:FECHA_NAC_NormalFG = -1                     ! Set color values for CUM:FECHA_NAC
    SELF.Q.CUM:FECHA_NAC_NormalBG = -1
    SELF.Q.CUM:FECHA_NAC_SelectedFG = -1
    SELF.Q.CUM:FECHA_NAC_SelectedBG = -1
  END
  SELF.Q.T_Icon = 0
  SELF.Q.CUM:DIA_Icon = 0
  SELF.Q.CUM:NOMBRE_Icon = 0
  SELF.Q.CUM:EMAIL_Icon = 0
  SELF.Q.CUM:FECHA_NAC_Icon = 0


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
     TAGS.PUNTERO = CUM:IDSOCIO
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

