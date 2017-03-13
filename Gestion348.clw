

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('GESTION348.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Actualizacion INGRESOS
!!! </summary>
ANULAR_INGRESOS PROCEDURE 

CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
LOC:CUENTA           LONG,NAME('IDCUENTA | READONLY')      ! 
History::ING:Record  LIKE(ING:RECORD),THREAD
QuickWindow          WINDOW('ANULAR RECIBOS'),AT(,,351,62),FONT('MS Sans Serif',8,,FONT:regular),RESIZE,CENTER, |
  GRAY,IMM,MDI,HLP('UpdateINGRESOS'),SYSTEM
                       ENTRY(@N$-13.2),AT(63,18,65,10),USE(ING:MONTO),INS,DISABLE
                       PROMPT('Nº RECIBO:'),AT(5,3),USE(?Prompt6)
                       STRING(@P####-P),AT(53,3),USE(ING:SUCURSAL)
                       STRING(@n-14),AT(78,3),USE(ING:IDRECIBO)
                       BUTTON('&Aceptar'),AT(249,40,49,14),USE(?OK),LEFT,ICON('ok.ico'),CURSOR('mano.cur'),DEFAULT, |
  FLAT,MSG('Confirma y Actualiza el Formulario'),TIP('Confirma y Actualiza el Formulario')
                       BUTTON('&Cancelar'),AT(301,40,49,14),USE(?Cancel),LEFT,ICON('cancelar.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Cancela Operacion'),TIP('Cancela Operacion')
                       LINE,AT(0,33,338,0),USE(?Line2),COLOR(COLOR:Black)
                       PROMPT('MONTO:'),AT(3,18),USE(?ING:MONTO:Prompt),TRN
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
  GlobalErrors.SetProcedureName('ANULAR_INGRESOS')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?ING:MONTO
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(ING:Record,History::ING:Record)
  SELF.AddHistoryField(?ING:MONTO,5)
  SELF.AddHistoryField(?ING:SUCURSAL,12)
  SELF.AddHistoryField(?ING:IDRECIBO,13)
  SELF.AddUpdateFile(Access:INGRESOS)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:CAJA.Open                                         ! File CAJA used by this procedure, so make sure it's RelationManager is open
  Relate:INGRESOS.Open                                     ! File INGRESOS used by this procedure, so make sure it's RelationManager is open
  Relate:LIBDIARIO.Open                                    ! File LIBDIARIO used by this procedure, so make sure it's RelationManager is open
  Relate:RANKING.Open                                      ! File RANKING used by this procedure, so make sure it's RelationManager is open
  Relate:SUBCUENTAS.Open                                   ! File SUBCUENTAS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:INGRESOS
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
    ?ING:MONTO{PROP:ReadOnly} = True
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('ANULAR_INGRESOS',QuickWindow)              ! Restore window settings from non-volatile store
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
    Relate:CAJA.Close
    Relate:INGRESOS.Close
    Relate:LIBDIARIO.Close
    Relate:RANKING.Close
    Relate:SUBCUENTAS.Close
  END
  IF SELF.Opened
    INIMgr.Update('ANULAR_INGRESOS',QuickWindow)           ! Save window data to non-volatile store
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
    CASE ACCEPTED()
    OF ?OK
      IF ING:IDSUBCUENTA <> 17 THEN
      
          !!! RESTA EL INGRESO EN FONDO
          SUB:IDSUBCUENTA = ING:IDSUBCUENTA
          ACCESS:SUBCUENTAS.TRYFETCH(SUB:INTEG_113)
          FON:IDFONDO = SUB:IDFONDO
          ACCESS:FONDOS.TRYFETCH(FON:PK_FONDOS)
          FON:MONTO = FON:MONTO - ING:MONTO
          ACCESS:FONDOS.UPDATE()
          !!!!
          ING:IDSUBCUENTA = 17
          ING:MONTO = 0
          !! BUSCO USUARIO
          USU:IDUSUARIO = GLO:IDUSUARIO
          ACCESS:USUARIO.TRYFETCH(USU:PK_USUARIO)
          USUARIO" = CLIP(USU:DESCRIPCION)
          !!
          DIA" = FORMAT(TODAY(),@D6)
          HORA" = FORMAT(CLOCK(),@T4)
          ING:OBSERVACION = 'ANULADO  POR '&CLIP(USUARIO")&', FECHA: '&CLIP(DIA")&', HORA: '&CLIP(HORA")
      
          !!! ANULO EN LIBRO DIARIO
          LIB:TIPO  =         'INGRESO'
          LIB:IDTRANSACCION =  ING:IDINGRESO
          ACCESS:LIBDIARIO.TRYFETCH(LIB:IDX_LIBDIARIO_UNIQUE_TRANSAC)
          LIB:DEBE = 0
          LIB:HABER = 0
          LIB:OBSERVACION = ING:OBSERVACION
          LIB:IDSUBCUENTA = 17
          LIB:FONDO =   FON:MONTO
          ACCESS:LIBDIARIO.UPDATE()
          !!  ANULO EN CAJA
          CAJ:TIPO            = 'INGRESO'
          CAJ:IDTRANSACCION   = ING:IDINGRESO
          GET(CAJA,CAJ:IDX_UNIQUE_TRANSAC)
          IF ERRORCODE() <> 35 THEN
              CAJ:DEBE          = 0
              CAJ:HABER         = 0
              CAJ:OBSERVACION   =  ING:OBSERVACION
              CAJ:IDSUBCUENTA = 17
              CAJ:MONTO = FON:MONTO 
              ACCESS:CAJA.UPDATE()
          END
          !!!!
      ELSE
          MESSAGE ('EL RECIBO YA ESTA ANULADO')
          SELECT(?Cancel)
          CYCLE
      END
      
      
      
      
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

