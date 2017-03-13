

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('GESTION239.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION013.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION238.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION240.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Actualizacion PAGOS
!!! </summary>
Ver_Pagos2 PROCEDURE 

CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
History::PAG:Record  LIKE(PAG:RECORD),THREAD
QuickWindow          WINDOW('Actualizacion PAGOS'),AT(,,173,182),FONT('MS Sans Serif',8,,FONT:regular),RESIZE,CENTER, |
  GRAY,IMM,MDI,HLP('Ver_Pagos2'),SYSTEM
                       SHEET,AT(4,4,165,156),USE(?CurrentTab)
                         TAB('General'),USE(?Tab:1)
                           PROMPT('IDPAGOS:'),AT(8,20),USE(?PAG:IDPAGOS:Prompt),TRN
                           ENTRY(@n-14),AT(61,20,64,10),USE(PAG:IDPAGOS),REQ
                           PROMPT('IDSOCIO:'),AT(8,34),USE(?PAG:IDSOCIO:Prompt),TRN
                           ENTRY(@n-14),AT(61,34,64,10),USE(PAG:IDSOCIO)
                           PROMPT('SUCURSAL:'),AT(8,48),USE(?PAG:SUCURSAL:Prompt),TRN
                           ENTRY(@n-14),AT(61,48,64,10),USE(PAG:SUCURSAL)
                           PROMPT('IDFACTURA:'),AT(8,62),USE(?PAG:IDFACTURA:Prompt),TRN
                           ENTRY(@n-14),AT(61,62,64,10),USE(PAG:IDFACTURA)
                           PROMPT('MONTO:'),AT(8,76),USE(?PAG:MONTO:Prompt),TRN
                           ENTRY(@n-10.2),AT(61,76,48,10),USE(PAG:MONTO)
                           PROMPT('FECHA:'),AT(8,90),USE(?PAG:FECHA:Prompt),TRN
                           ENTRY(@d17),AT(61,90,104,10),USE(PAG:FECHA)
                           PROMPT('HORA:'),AT(8,104),USE(?PAG:HORA:Prompt),TRN
                           ENTRY(@t7),AT(61,104,104,10),USE(PAG:HORA)
                           PROMPT('MES:'),AT(8,118),USE(?PAG:MES:Prompt),TRN
                           ENTRY(@s2),AT(61,118,40,10),USE(PAG:MES)
                           PROMPT('ANO:'),AT(8,132),USE(?PAG:ANO:Prompt),TRN
                           ENTRY(@s4),AT(61,132,40,10),USE(PAG:ANO)
                           PROMPT('PERIODO:'),AT(8,146),USE(?PAG:PERIODO:Prompt),TRN
                           ENTRY(@n-14),AT(61,146,64,10),USE(PAG:PERIODO)
                         END
                         TAB('General (cont.)'),USE(?Tab:2)
                           PROMPT('IDUSUARIO:'),AT(8,20),USE(?PAG:IDUSUARIO:Prompt),TRN
                           ENTRY(@n-14),AT(61,20,64,10),USE(PAG:IDUSUARIO)
                           PROMPT('IDRECIBO:'),AT(8,34),USE(?PAG:IDRECIBO:Prompt),TRN
                           ENTRY(@n-14),AT(61,34,64,10),USE(PAG:IDRECIBO)
                         END
                       END
                       BUTTON('&Aceptar'),AT(67,164,49,14),USE(?OK),LEFT,ICON('ok.ico'),CURSOR('mano.cur'),DEFAULT, |
  FLAT,MSG('Confirma y Actualiza el Formulario'),TIP('Confirma y Actualiza el Formulario')
                       BUTTON('&Cancelar'),AT(120,164,49,14),USE(?Cancel),LEFT,ICON('cancelar.ico'),CURSOR('mano.cur'), |
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
    GlobalErrors.Throw(Msg:InsertIllegal)
    RETURN
  OF ChangeRecord
    GlobalErrors.Throw(Msg:UpdateIllegal)
    RETURN
  OF DeleteRecord
    GlobalErrors.Throw(Msg:DeleteIllegal)
    RETURN
  END
  QuickWindow{PROP:Text} = ActionMessage                   ! Display status message in title bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('Ver_Pagos2')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?PAG:IDPAGOS:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(PAG:Record,History::PAG:Record)
  SELF.AddHistoryField(?PAG:IDPAGOS,1)
  SELF.AddHistoryField(?PAG:IDSOCIO,2)
  SELF.AddHistoryField(?PAG:SUCURSAL,3)
  SELF.AddHistoryField(?PAG:IDFACTURA,4)
  SELF.AddHistoryField(?PAG:MONTO,5)
  SELF.AddHistoryField(?PAG:FECHA,6)
  SELF.AddHistoryField(?PAG:HORA,7)
  SELF.AddHistoryField(?PAG:MES,8)
  SELF.AddHistoryField(?PAG:ANO,9)
  SELF.AddHistoryField(?PAG:PERIODO,10)
  SELF.AddHistoryField(?PAG:IDUSUARIO,11)
  SELF.AddHistoryField(?PAG:IDRECIBO,12)
  SELF.AddUpdateFile(Access:PAGOS)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:FACTURA.Open                                      ! File FACTURA used by this procedure, so make sure it's RelationManager is open
  Relate:PAGOS.Open                                        ! File PAGOS used by this procedure, so make sure it's RelationManager is open
  Relate:SOCIOS.Open                                       ! File SOCIOS used by this procedure, so make sure it's RelationManager is open
  Relate:USUARIO.Open                                      ! File USUARIO used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:PAGOS
  IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing ! Setup actions for ViewOnly Mode
    SELF.InsertAction = Insert:None
    SELF.DeleteAction = Delete:None
    SELF.ChangeAction = Change:None
    SELF.CancelAction = Cancel:Cancel
    SELF.OkControl = 0
  ELSE
    SELF.InsertAction = Insert:None                        ! Inserts not allowed
    SELF.DeleteAction = Delete:None                        ! Deletes not allowed
    SELF.ChangeAction = Change:None                        ! Changes not allowed
    SELF.CancelAction = Cancel:Cancel+Cancel:Query         ! Confirm cancel
    SELF.OkControl = ?OK
    IF SELF.PrimeUpdate() THEN RETURN Level:Notify.
  END
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    ?PAG:IDPAGOS{PROP:ReadOnly} = True
    ?PAG:IDSOCIO{PROP:ReadOnly} = True
    ?PAG:SUCURSAL{PROP:ReadOnly} = True
    ?PAG:IDFACTURA{PROP:ReadOnly} = True
    ?PAG:MONTO{PROP:ReadOnly} = True
    ?PAG:FECHA{PROP:ReadOnly} = True
    ?PAG:HORA{PROP:ReadOnly} = True
    ?PAG:MES{PROP:ReadOnly} = True
    ?PAG:ANO{PROP:ReadOnly} = True
    ?PAG:PERIODO{PROP:ReadOnly} = True
    ?PAG:IDUSUARIO{PROP:ReadOnly} = True
    ?PAG:IDRECIBO{PROP:ReadOnly} = True
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('Ver_Pagos2',QuickWindow)                   ! Restore window settings from non-volatile store
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
    Relate:FACTURA.Close
    Relate:PAGOS.Close
    Relate:SOCIOS.Close
    Relate:USUARIO.Close
  END
  IF SELF.Opened
    INIMgr.Update('Ver_Pagos2',QuickWindow)                ! Save window data to non-volatile store
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
      SelectFACTURA
      SelectUSUARIO
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
    OF ?PAG:IDSOCIO
      SOC:IDSOCIO = PAG:IDSOCIO
      IF Access:SOCIOS.TryFetch(SOC:PK_SOCIOS)
        IF SELF.Run(1,SelectRecord) = RequestCompleted
          PAG:IDSOCIO = SOC:IDSOCIO
        ELSE
          SELECT(?PAG:IDSOCIO)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
    OF ?PAG:IDFACTURA
      FAC:IDFACTURA = PAG:IDFACTURA
      IF Access:FACTURA.TryFetch(FAC:PK_FACTURA)
        IF SELF.Run(2,SelectRecord) = RequestCompleted
          PAG:IDFACTURA = FAC:IDFACTURA
        ELSE
          SELECT(?PAG:IDFACTURA)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
    OF ?PAG:IDUSUARIO
      USU:IDUSUARIO = PAG:IDUSUARIO
      IF Access:USUARIO.TryFetch(USU:PK_USUARIO)
        IF SELF.Run(3,SelectRecord) = RequestCompleted
          PAG:IDUSUARIO = USU:IDUSUARIO
        ELSE
          SELECT(?PAG:IDUSUARIO)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
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

