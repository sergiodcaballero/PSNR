

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('GESTION100.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION099.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION101.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Actualizacion SUBCUENTAS
!!! </summary>
UpdateSUBCUENTAS PROCEDURE 

CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
History::SUB:Record  LIKE(SUB:RECORD),THREAD
QuickWindow          WINDOW('Actualizacion SUBCUENTAS'),AT(,,273,136),FONT('MS Sans Serif',8,,FONT:regular),RESIZE, |
  CENTER,GRAY,IMM,MDI,HLP('UpdateSUBCUENTAS'),SYSTEM
                       PROMPT('DESCRIPCION:'),AT(2,10),USE(?SUB:DESCRIPCION:Prompt),TRN
                       ENTRY(@s50),AT(55,10,204,10),USE(SUB:DESCRIPCION)
                       PROMPT('CUENTA:'),AT(2,24),USE(?IDCUENTA:Prompt)
                       ENTRY(@n-14),AT(56,24,57,10),USE(SUB:IDCUENTA)
                       BUTTON('...'),AT(115,23,12,12),USE(?CallLookup)
                       STRING(@s50),AT(128,24),USE(CUE:DESCRIPCION)
                       OPTION('CAJA'),AT(5,71,73,36),USE(SUB:CAJA),BOXED
                         RADIO('SI'),AT(13,86),USE(?SUB:CAJA:Radio1)
                         RADIO('NO'),AT(41,86),USE(?SUB:CAJA:Radio2)
                       END
                       CHECK('INFORMAR'),AT(92,76),USE(SUB:INFORME),VALUE('SI','NO')
                       PROMPT('CONTABLE:'),AT(1,54),USE(?SUB:CONTABLE:Prompt)
                       ENTRY(@s50),AT(54,52,60,10),USE(SUB:CONTABLE)
                       PROMPT('FONDO:'),AT(2,39),USE(?SUB:IDFONDO:Prompt)
                       ENTRY(@n-14),AT(55,38,57,10),USE(SUB:IDFONDO),RIGHT(1)
                       BUTTON('...'),AT(115,36,12,12),USE(?CallLookup:2)
                       STRING(@s30),AT(130,37),USE(FON:NOMBRE_FONDO)
                       BUTTON('&Aceptar'),AT(165,116,49,14),USE(?OK),LEFT,ICON('ok.ico'),CURSOR('mano.cur'),DEFAULT, |
  FLAT,MSG('Confirma y Actualiza el Formulario'),TIP('Confirma y Actualiza el Formulario')
                       BUTTON('&Cancelar'),AT(215,116,49,14),USE(?Cancel),LEFT,ICON('cancelar.ico'),CURSOR('mano.cur'), |
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
  END
  QuickWindow{PROP:Text} = ActionMessage                   ! Display status message in title bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('UpdateSUBCUENTAS')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?SUB:DESCRIPCION:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(SUB:Record,History::SUB:Record)
  SELF.AddHistoryField(?SUB:DESCRIPCION,3)
  SELF.AddHistoryField(?SUB:IDCUENTA,2)
  SELF.AddHistoryField(?SUB:CAJA,4)
  SELF.AddHistoryField(?SUB:INFORME,7)
  SELF.AddHistoryField(?SUB:CONTABLE,5)
  SELF.AddHistoryField(?SUB:IDFONDO,6)
  SELF.AddUpdateFile(Access:SUBCUENTAS)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:CUENTAS.Open                                      ! File CUENTAS used by this procedure, so make sure it's RelationManager is open
  Relate:FONDOS.Open                                       ! File FONDOS used by this procedure, so make sure it's RelationManager is open
  Relate:SUBCUENTAS.Open                                   ! File SUBCUENTAS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:SUBCUENTAS
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
    ?SUB:DESCRIPCION{PROP:ReadOnly} = True
    ?SUB:IDCUENTA{PROP:ReadOnly} = True
    DISABLE(?CallLookup)
    ?SUB:CAJA{PROP:ReadOnly} = True
    ?SUB:CONTABLE{PROP:ReadOnly} = True
    ?SUB:IDFONDO{PROP:ReadOnly} = True
    DISABLE(?CallLookup:2)
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdateSUBCUENTAS',QuickWindow)             ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:CUENTAS.Close
    Relate:FONDOS.Close
    Relate:SUBCUENTAS.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateSUBCUENTAS',QuickWindow)          ! Save window data to non-volatile store
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
      SelectCUENTAS
      SelectFONDOS
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
    OF ?SUB:IDCUENTA
      CUE:IDCUENTA = SUB:IDCUENTA
      IF Access:CUENTAS.TryFetch(CUE:PK_CUENTAS)
        IF SELF.Run(1,SelectRecord) = RequestCompleted
          SUB:IDCUENTA = CUE:IDCUENTA
        ELSE
          SELECT(?SUB:IDCUENTA)
          CYCLE
        END
      END
      ThisWindow.Reset()
      IF Access:SUBCUENTAS.TryValidateField(2)             ! Attempt to validate SUB:IDCUENTA in SUBCUENTAS
        SELECT(?SUB:IDCUENTA)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?SUB:IDCUENTA
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?SUB:IDCUENTA{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?CallLookup
      ThisWindow.Update()
      CUE:IDCUENTA = SUB:IDCUENTA
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        SUB:IDCUENTA = CUE:IDCUENTA
      END
      ThisWindow.Reset(1)
    OF ?SUB:IDFONDO
      FON:IDFONDO = SUB:IDFONDO
      IF Access:FONDOS.TryFetch(FON:PK_FONDOS)
        IF SELF.Run(2,SelectRecord) = RequestCompleted
          SUB:IDFONDO = FON:IDFONDO
        ELSE
          SELECT(?SUB:IDFONDO)
          CYCLE
        END
      END
      ThisWindow.Reset()
      IF Access:SUBCUENTAS.TryValidateField(6)             ! Attempt to validate SUB:IDFONDO in SUBCUENTAS
        SELECT(?SUB:IDFONDO)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?SUB:IDFONDO
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?SUB:IDFONDO{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?CallLookup:2
      ThisWindow.Update()
      FON:IDFONDO = SUB:IDFONDO
      IF SELF.Run(2,SelectRecord) = RequestCompleted
        SUB:IDFONDO = FON:IDFONDO
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

