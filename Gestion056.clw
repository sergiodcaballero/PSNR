

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('GESTION056.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION055.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION057.INC'),ONCE        !Req'd for module callout resolution
                     END


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
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
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

