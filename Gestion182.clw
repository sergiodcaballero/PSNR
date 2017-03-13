

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('GESTION182.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION045.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the LIQUIDACION_INFORME File
!!! </summary>
LIQUIDACION_EMAIL_21 PROCEDURE 

!--------------------------------------------------------------------------
! Tagging Data
!--------------------------------------------------------------------------
DASBRW::6:TAGFLAG          BYTE(0)
DASBRW::6:TAGMOUSE         BYTE(0)
DASBRW::6:TAGDISPSTATUS    BYTE(0)
DASBRW::6:QUEUE           QUEUE
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
LOC:MENSAJE1         STRING(200)                           ! 
LOC:MENSAJE2         STRING(300)                           ! 
LOC:MENSAJE3         STRING(300)                           ! 
LOC:MENSAJE4         STRING(500)                           ! 
loc:cantidad         LONG                                  ! 
LOC:PARAE            CSTRING(10000)                        ! 
BRW1::View:Browse    VIEW(LIQUIDACION_INFORME)
                       PROJECT(LIQINF:IDSOCIO)
                       PROJECT(LIQINF:NOMBRE)
                       PROJECT(LIQINF:EMAIL)
                       PROJECT(LIQINF:DESC_OS)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
T                      LIKE(T)                        !List box control field - type derived from local data
LIQINF:IDSOCIO         LIKE(LIQINF:IDSOCIO)           !List box control field - type derived from field
LIQINF:NOMBRE          LIKE(LIQINF:NOMBRE)            !List box control field - type derived from field
LIQINF:EMAIL           LIKE(LIQINF:EMAIL)             !List box control field - type derived from field
LIQINF:DESC_OS         LIKE(LIQINF:DESC_OS)           !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Informe de Liquidación'),AT(,,355,238),FONT('Arial',8,COLOR:Black,FONT:bold),RESIZE, |
  CENTER,GRAY,IMM,MDI,HLP('LIQUIDACION_EMAIL_2'),SYSTEM
                       LIST,AT(8,30,342,124),USE(?Browse:1),HVSCROLL,FORMAT('13L(1)|M@s1@41L(1)|M~IDSOCIO~C(0)' & |
  '@n-7@80L(2)|M~NOMBRE~@s100@80L(2)|M~EMAIL~@s100@32L(2)|M~CANT~L(0)@n-7.2@'),FROM(Queue:Browse:1), |
  IMM,MSG('Administrador de LIQUIDACION_INFORME')
                       BUTTON('&Marcar'),AT(6,178,63,13),USE(?DASTAG)
                       BUTTON('Marcar Todo'),AT(73,178,63,13),USE(?DASTAGAll)
                       BUTTON('&Desmarcar Todo'),AT(140,178,63,13),USE(?DASUNTAGALL)
                       BUTTON('&Rev tags'),AT(218,211,50,13),USE(?DASREVTAG),DISABLE,HIDE
                       BUTTON('Mostrar Marcados'),AT(207,178,63,13),USE(?DASSHOWTAG)
                       PROMPT('Cantidad:'),AT(8,158),USE(?loc:cantidad:Prompt)
                       ENTRY(@n-14),AT(39,158,60,10),USE(loc:cantidad),RIGHT(1),TRN
                       BUTTON('Enviar Liquidación'),AT(10,210,102,19),USE(?Button2),LEFT,ICON(ICON:Connect),FLAT
                       SHEET,AT(4,4,350,172),USE(?CurrentTab)
                         TAB,USE(?Tab:1)
                         END
                       END
                       BUTTON('&Salir'),AT(306,223,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Salir'),TIP('Salir')
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeFieldEvent         PROCEDURE(),BYTE,PROC,DERIVED
TakeNewSelection       PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
ResetFromView          PROCEDURE(),DERIVED
SetQueueRecord         PROCEDURE(),DERIVED
TakeKey                PROCEDURE(),BYTE,PROC,DERIVED
ValidateRecord         PROCEDURE(),BYTE,DERIVED
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END


  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!--------------------------------------------------------------------------
! DAS_Tagging
!--------------------------------------------------------------------------
DASBRW::6:DASTAGONOFF Routine
  GET(Queue:Browse:1,CHOICE(?Browse:1))
  BRW1.UpdateBuffer
   TAGS.PUNTERO = LIQINF:IDSOCIO
   GET(TAGS,TAGS.PUNTERO)
  IF ERRORCODE()
     TAGS.PUNTERO = LIQINF:IDSOCIO
     ADD(TAGS,TAGS.PUNTERO)
    T = '*'
  ELSE
    DELETE(TAGS)
    T = ''
  END
    Queue:Browse:1.T = T
  PUT(Queue:Browse:1)
  ThisWindow.Reset(1)
  SELECT(?Browse:1,CHOICE(?Browse:1))
  IF DASBRW::6:TAGMOUSE = 1 THEN
    DASBRW::6:TAGMOUSE = 0
  ELSE
  DASBRW::6:TAGFLAG = 1
  POST(EVENT:ScrollDown,?Browse:1)
  END
DASBRW::6:DASTAGALL Routine
  ?Browse:1{PROPLIST:MouseDownField} = 2
  SETCURSOR(CURSOR:Wait)
  BRW1.Reset
  FREE(TAGS)
  LOOP
    NEXT(BRW1::View:Browse)
    IF ERRORCODE()
      BREAK
    END
     TAGS.PUNTERO = LIQINF:IDSOCIO
     ADD(TAGS,TAGS.PUNTERO)
  END
  SETCURSOR
  BRW1.ResetSort(1)
  ThisWindow.Reset(1)
  SELECT(?Browse:1,CHOICE(?Browse:1))
DASBRW::6:DASUNTAGALL Routine
  ?Browse:1{PROPLIST:MouseDownField} = 2
  SETCURSOR(CURSOR:Wait)
  FREE(TAGS)
  BRW1.Reset
  SETCURSOR
  BRW1.ResetSort(1)
  ThisWindow.Reset(1)
  SELECT(?Browse:1,CHOICE(?Browse:1))
DASBRW::6:DASREVTAGALL Routine
  ?Browse:1{PROPLIST:MouseDownField} = 2
  SETCURSOR(CURSOR:Wait)
  FREE(DASBRW::6:QUEUE)
  LOOP QR# = 1 TO RECORDS(TAGS)
    GET(TAGS,QR#)
    DASBRW::6:QUEUE = TAGS
    ADD(DASBRW::6:QUEUE)
  END
  FREE(TAGS)
  BRW1.Reset
  LOOP
    NEXT(BRW1::View:Browse)
    IF ERRORCODE()
      BREAK
    END
     DASBRW::6:QUEUE.PUNTERO = LIQINF:IDSOCIO
     GET(DASBRW::6:QUEUE,DASBRW::6:QUEUE.PUNTERO)
    IF ERRORCODE()
       TAGS.PUNTERO = LIQINF:IDSOCIO
       ADD(TAGS,TAGS.PUNTERO)
    END
  END
  SETCURSOR
  BRW1.ResetSort(1)
  ThisWindow.Reset(1)
  SELECT(?Browse:1,CHOICE(?Browse:1))
DASBRW::6:DASSHOWTAG Routine
   CASE DASBRW::6:TAGDISPSTATUS
   OF 0
      DASBRW::6:TAGDISPSTATUS = 1    ! display tagged
      ?DASSHOWTAG{PROP:Text} = 'Mostrar Seleccionado'
      ?DASSHOWTAG{PROP:Msg}  = 'Mostrar Seleccionado'
      ?DASSHOWTAG{PROP:Tip}  = 'Mostrar Seleccionado'
   OF 1
      DASBRW::6:TAGDISPSTATUS = 2    ! display untagged
      ?DASSHOWTAG{PROP:Text} = 'Mostrar No Seleccionado'
      ?DASSHOWTAG{PROP:Msg}  = 'Mostrar No Seleccionado'
      ?DASSHOWTAG{PROP:Tip}  = 'Mostrar No Seleccionado'
   OF 2
      DASBRW::6:TAGDISPSTATUS = 0    ! display all
      ?DASSHOWTAG{PROP:Text} = 'Mostrar Todo'
      ?DASSHOWTAG{PROP:Msg}  = 'Mostrar Todo'
      ?DASSHOWTAG{PROP:Tip}  = 'Mostrar Todo'
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
  GlobalErrors.SetProcedureName('LIQUIDACION_EMAIL_21')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('T',T)                                              ! Added by: BrowseBox(ABC)
  BIND('LIQINF:DESC_OS',LIQINF:DESC_OS)                    ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:EMAILS.Open                                       ! File EMAILS used by this procedure, so make sure it's RelationManager is open
  Relate:LIQUIDACION_INFORME.Open                          ! File LIQUIDACION_INFORME used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:LIQUIDACION_INFORME,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,LIQINF:PK_LIQUIDACION_INFORME)        ! Add the sort order for LIQINF:PK_LIQUIDACION_INFORME for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,LIQINF:IDSOCIO,,BRW1)          ! Initialize the browse locator using  using key: LIQINF:PK_LIQUIDACION_INFORME , LIQINF:IDSOCIO
  BRW1.AddField(T,BRW1.Q.T)                                ! Field T is a hot field or requires assignment from browse
  BRW1.AddField(LIQINF:IDSOCIO,BRW1.Q.LIQINF:IDSOCIO)      ! Field LIQINF:IDSOCIO is a hot field or requires assignment from browse
  BRW1.AddField(LIQINF:NOMBRE,BRW1.Q.LIQINF:NOMBRE)        ! Field LIQINF:NOMBRE is a hot field or requires assignment from browse
  BRW1.AddField(LIQINF:EMAIL,BRW1.Q.LIQINF:EMAIL)          ! Field LIQINF:EMAIL is a hot field or requires assignment from browse
  BRW1.AddField(LIQINF:DESC_OS,BRW1.Q.LIQINF:DESC_OS)      ! Field LIQINF:DESC_OS is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('LIQUIDACION_EMAIL_21',QuickWindow)         ! Restore window settings from non-volatile store
  global:firsttime = 1
  EmailServer  = clip(SMTP)
  EmailPort    = PUERTO
  EmailFrom    = clip(GLO:MAILEMP)
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  SELF.SetAlerts()
  !--------------------------------------------------------------------------
  ! Tagging Init
  !--------------------------------------------------------------------------
  FREE(TAGS)
  ?DASSHOWTAG{PROP:Text} = 'Mostrar Todo'
  ?DASSHOWTAG{PROP:Msg}  = 'Mostrar Todo'
  ?DASSHOWTAG{PROP:Tip}  = 'Mostrar Todo'
  !--------------------------------------------------------------------------
  ! Tagging Init
  !--------------------------------------------------------------------------
  ?Browse:1{Prop:Alrt,239} = SpaceKey
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
    Relate:EMAILS.Close
    Relate:LIQUIDACION_INFORME.Close
  END
  IF SELF.Opened
    INIMgr.Update('LIQUIDACION_EMAIL_21',QuickWindow)      ! Save window data to non-volatile store
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
    OF ?Button2
      IF REPORTE_LARGO = 'EMAILSEGURO' THEN 
          SUB" = 'Seguro'
          limite" = '2 (DOS) CUOTAS AUTOMATICAMENTE se le dara de baja al Seguro (CIRCULAR Nro 1)'
      ELSE 
          SUB" = 'Matrícula'
          limite" = '3 (DOS) CUOTAS, NO ESTARÁ EN EL "PADRÓN DE PROFESIONALES'
      end     
          
      
      EmailSubject =  'Informe de Estado de Deuda de '&SUB"&' - Colegio de Psicólogos del Valle Inferior de Rió Negro'
      EmailFileList = CLIP(LOC:ATTACH)
      
      ! Carga tabla  con los tags
      Loop i# = 1 to records(Tags)
          get(Tags,i#)
          LIQINF:IDSOCIO = tags:Puntero
          If NOT Access:LIQUIDACION_INFORME.Fetch(LIQINF:PK_LIQUIDACION_INFORME)  then
                 loc:mensaje1= 'Estimado Colegiado/a '&clip(LIQINF:NOMBRE)&': por la presente, hacemos entrega del Informe de Estado de Deuda de su '&SUB"&' Profesional a la fecha.'
                 LOC:MENSAJE2 = 'Total de Deuda:'&format(LIQINF:MONTO,@n$-13.2)&Chr(13)&Chr(10)&Chr(13)&Chr(10)&'INFORMAMOS QUE LA PÁGINA WEB DEL COLEGIO ESTÁ VINCULADA CON EL SISTEMA DE GESTIÓN QUE REGISTRA EL COBRO DE '&upper(SUB")&'. RECUERDE QUE SI ADEUDA '&limite"
                 LOC:MENSAJE3 = 'Lo esperamos en la sede del Colegio para regularizar su situación con la tesorería. De haber realizado el pago parcial o total de la deuda, ya sea por depósito o transferencia bancaria, por favor informar por correo electrónico adjunto el comprobante para emitir el recibo.'
                 LOC:MENSAJE4 = 'DATOS CUENTA DEL COLEGIO EN EL BANCO MACRO'&Chr(13)&Chr(10)&'Número de caja de ahorro: 400109404028274'&Chr(13)&Chr(10)&'Número de CBU: 2850001040094040282748'&Chr(13)&Chr(10)&Chr(13)&Chr(10)&'SI UD. ES PRESTADOR, LAS CUOTAS ADEUDADAS LE SERÁN DEBITADAS EN LAS LIQUIDACIONES DE LAS FACTURACIONES PRESENTADAS.'&Chr(13)&Chr(10)&Chr(13)&Chr(10)&'Saludos CONUPROMI'
                 EmailMessageText = clip(loc:mensaje1)&Chr(13)&Chr(10)&Chr(13)&Chr(10)&clip(LIQINF:MENSAJE)&Chr(13)&Chr(10)&clip(LOC:MENSAJE2)&Chr(13)&Chr(10)&Chr(13)&Chr(10)&clip(LOC:MENSAJE3)&Chr(13)&Chr(10)&Chr(13)&Chr(10)&clip(LOC:MENSAJE4)
                 EmailTo= clip(LIQINF:EMAIL)
                 cantidad# = cantidad# + 1
                 SendEmail(EmailServer, EmailPort, EmailFrom, EmailTo, EmailSubject, EmailCC, EmailBcc, EmailFileList, EmailMessageText)
                 IF NOT ERRORCODE() THEN
                  !!!!
                 END
                 LOC:PARAE = LOC:PARAE&';'&CLip(LIQINF:EMAIL)
         end
      
      End
      !!! GUARDA EL EMAIL
      EML:PARA       = LOC:PARAE
      EML:TITULO     = EmailSubject
      EML:MENSAJE    = EmailMessageText
      EML:ADJUNTO    = LOC:ATTACH
      EML:FECHA      = today()
      EML:HORA       = clock()
      ACCESS:EMAILS.INSERT()
      !! MARCA EMAIL ENVIADO
      
      MESSAGE('SE ENVIARON '&CANTIDAD#&' DE E-MAILS')
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?DASTAG
      ThisWindow.Update()
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
        DO DASBRW::6:DASTAGONOFF
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
    OF ?DASTAGAll
      ThisWindow.Update()
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
        DO DASBRW::6:DASTAGALL
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
    OF ?DASUNTAGALL
      ThisWindow.Update()
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
        DO DASBRW::6:DASUNTAGALL
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
    OF ?DASREVTAG
      ThisWindow.Update()
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
        DO DASBRW::6:DASREVTAGALL
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
    OF ?DASSHOWTAG
      ThisWindow.Update()
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
        DO DASBRW::6:DASSHOWTAG
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
    END
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
      IF KEYCODE() = MouseLeft AND (?Browse:1{PROPLIST:MouseDownRow} > 0) AND (DASBRW::6:TAGFLAG = 0)
        CASE ?Browse:1{PROPLIST:MouseDownField}
      
          OF 1
            DASBRW::6:TAGMOUSE = 1
            POST(EVENT:Accepted,?DASTAG)
               ?Browse:1{PROPLIST:MouseDownField} = 2
            CYCLE
         END
      END
      DASBRW::6:TAGFLAG = 0
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

loc:cantidad:Cnt     LONG                                  ! Count variable for browse totals
  CODE
  SETCURSOR(Cursor:Wait)
  Relate:LIQUIDACION_INFORME.SetQuickScan(1)
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
    loc:cantidad:Cnt += 1
  END
  SELF.View{PROP:IPRequestCount} = 0
  loc:cantidad = loc:cantidad:Cnt
  PARENT.ResetFromView
  Relate:LIQUIDACION_INFORME.SetQuickScan(0)
  SETCURSOR()


BRW1.SetQueueRecord PROCEDURE

  CODE
  !--------------------------------------------------------------------------
  ! DAS_Tagging
  !--------------------------------------------------------------------------
     TAGS.PUNTERO = LIQINF:IDSOCIO
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
     TAGS.PUNTERO = LIQINF:IDSOCIO
     GET(TAGS,TAGS.PUNTERO)
    EXECUTE DASBRW::6:TAGDISPSTATUS
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

