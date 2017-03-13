

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('GESTION210.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION013.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION207.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Form INGRESOS_FACTURA
!!! </summary>
UpdateINGRESOS_FACTURA PROCEDURE 

CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
History::ING2:Record LIKE(ING2:RECORD),THREAD
QuickWindow          WINDOW('Form INGRESOS_FACTURA'),AT(,,513,237),FONT('Microsoft Sans Serif',8,,FONT:regular, |
  CHARSET:DEFAULT),RESIZE,CENTER,GRAY,IMM,MDI,HLP('UpdateINGRESOS_FACTURA'),SYSTEM
                       BUTTON('&OK'),AT(89,214,49,14),USE(?OK),LEFT,ICON('WAOK.ICO'),DEFAULT,DISABLE,FLAT,MSG('Accept dat' & |
  'a and close the window'),TIP('Accept data and close the window')
                       BUTTON('&Cancelar'),AT(167,214,61,14),USE(?Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel operation'), |
  TIP('Cancel operation')
                       PROMPT('SUCURSAL:'),AT(9,34),USE(?ING2:SUCURSAL:Prompt),TRN
                       PROMPT('IDRECIBO:'),AT(89,33),USE(?ING2:IDRECIBO:Prompt),TRN
                       ENTRY(@n-4),AT(55,33,28,10),USE(ING2:SUCURSAL)
                       ENTRY(@n-14),AT(131,33,64,10),USE(ING2:IDRECIBO)
                       PROMPT('IDSOCIO:'),AT(9,9),USE(?ING2:IDSOCIO:Prompt),TRN
                       ENTRY(@n-14),AT(45,9,50,10),USE(ING2:IDSOCIO)
                       PROMPT('Detalle:'),AT(9,126),USE(?ING2:OBSERVACION:Prompt),TRN
                       PROMPT('MONTO:'),AT(17,85,47,18),USE(?ING2:MONTO:Prompt),FONT(,12),TRN
                       ENTRY(@n$-10.2),AT(77,83,78,18),USE(ING2:MONTO),FONT(,12),DISABLE
                       BUTTON('...'),AT(100,7,12,12),USE(?CallLookup)
                       ENTRY(@s100),AT(120,9,173,10),USE(SOC:NOMBRE),TRN
                       BUTTON('Calcular'),AT(55,57,109),USE(?BUTTON1)
                       TEXT,AT(77,112,197,86),USE(ING2:OBSERVACION)
                       LINE,AT(4,52,309,0),USE(?LINE1),COLOR(COLOR:Black)
                       LINE,AT(3,77,308,0),USE(?LINE2),COLOR(COLOR:Black)
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
    ActionMessage = 'View Record'
  OF InsertRecord
    ActionMessage = 'Record Will Be Added'
  OF ChangeRecord
    ActionMessage = 'Record Will Be Changed'
  OF DeleteRecord
    GlobalErrors.Throw(Msg:DeleteIllegal)
    RETURN
  END
  QuickWindow{PROP:Text} = ActionMessage                   ! Display status message in title bar
  CASE SELF.Request
  OF ChangeRecord
    QuickWindow{PROP:Text} = QuickWindow{PROP:Text} & '  (' & ING2:IDINGRESO_FAC & ')' ! Append status message to window title text
  OF InsertRecord
    QuickWindow{PROP:Text} = QuickWindow{PROP:Text} & '  (New)'
  END
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('UpdateINGRESOS_FACTURA')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?OK
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(ING2:Record,History::ING2:Record)
  SELF.AddHistoryField(?ING2:SUCURSAL,11)
  SELF.AddHistoryField(?ING2:IDRECIBO,12)
  SELF.AddHistoryField(?ING2:IDSOCIO,2)
  SELF.AddHistoryField(?ING2:MONTO,5)
  SELF.AddHistoryField(?ING2:OBSERVACION,4)
  SELF.AddUpdateFile(Access:INGRESOS_FACTURA)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:COBERTURA.Open                                    ! File COBERTURA used by this procedure, so make sure it's RelationManager is open
  Relate:INGRESOS_FACTURA.Open                             ! File INGRESOS_FACTURA used by this procedure, so make sure it's RelationManager is open
  Relate:RANKING.Open                                      ! File RANKING used by this procedure, so make sure it's RelationManager is open
  Relate:SOCIOS.Open                                       ! File SOCIOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:INGRESOS_FACTURA
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
    ?ING2:SUCURSAL{PROP:ReadOnly} = True
    ?ING2:IDRECIBO{PROP:ReadOnly} = True
    ?ING2:IDSOCIO{PROP:ReadOnly} = True
    ?ING2:MONTO{PROP:ReadOnly} = True
    DISABLE(?CallLookup)
    ?SOC:NOMBRE{PROP:ReadOnly} = True
    DISABLE(?BUTTON1)
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdateINGRESOS_FACTURA',QuickWindow)       ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:COBERTURA.Close
    Relate:INGRESOS_FACTURA.Close
    Relate:RANKING.Close
    Relate:SOCIOS.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateINGRESOS_FACTURA',QuickWindow)    ! Save window data to non-volatile store
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
    SelectSOCIOS
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
      ING2:IDSUBCUENTA  = 1
      ING2:FECHA        = TODAY() 
      ING2:HORA         =CLOCK() 
      ING2:MES          = MONTH(TODAY())
      ING2:ANO        = YEAR(TODAY())
      ING2:PERIODO    = ING2:ANO&FORMAT(ING2:MES,@N02)
      ING2:IDUSUARIO  = GLO:IDUSUARIO
      ING2:MES_HASTA  = 12
      
    OF ?BUTTON1
      mes$ = month(today())
      ano$ = year(today())
      !! Calculo la cantidad de meses
      cant_mes$ = 13 - mes$
      !!! busco el monto y sumo el total 
      COB:IDCOBERTURA = 1 
      ACCESS:COBERTURA.TryFetch(COB:PK_COBERTURA)
      ING2:MONTO = COB:MONTO * cant_mes$
      ENABLE(?OK)
      DISABLE(?BUTTON1)
      ThisWindow.RESET(1) 
      !!!!!!!!!!!!!!!!!!!!!!!!!!!!!11
      
      
      
      
      
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?OK
      ThisWindow.Update()
      IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing THEN
         POST(EVENT:CloseWindow)
      END
    OF ?ING2:IDSOCIO
      SOC:IDSOCIO = ING2:IDSOCIO
      IF Access:SOCIOS.TryFetch(SOC:PK_SOCIOS)
        IF SELF.Run(1,SelectRecord) = RequestCompleted
          ING2:IDSOCIO = SOC:IDSOCIO
        ELSE
          SELECT(?ING2:IDSOCIO)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
      IF Access:INGRESOS_FACTURA.TryValidateField(2)       ! Attempt to validate ING2:IDSOCIO in INGRESOS_FACTURA
        SELECT(?ING2:IDSOCIO)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?ING2:IDSOCIO
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?ING2:IDSOCIO{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?CallLookup
      ThisWindow.Update()
      SOC:IDSOCIO = ING2:IDSOCIO
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        ING2:IDSOCIO = SOC:IDSOCIO
      END
      ThisWindow.Reset(1)
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
  !! SACA ULTIMO NUMERO
  RAN:C1 = ''
  RANKING{PROP:SQL} = 'DELETE FROM RANKING'
  RANKING{PROP:SQL} = 'SELECT COUNT(ingresos_factura.idingreso_fac)FROM ingresos_FACTURA'
  NEXT(RANKING)
  CANTIDAD# = RAN:C1
  
  GLO:PAGO = CANTIDAD# 
  
  IMPRIMIR_PAGO_ANUAL
  
  
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

