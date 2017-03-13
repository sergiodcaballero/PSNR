

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('GESTION137.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION030.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Actualizacion OBRA_SOCIAL
!!! </summary>
UpdateOBRA_SOCIAL PROCEDURE 

CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
History::OBR:Record  LIKE(OBR:RECORD),THREAD
QuickWindow          WINDOW('Actualizacion OBRA SOCIAL'),AT(,,271,190),FONT('MS Sans Serif',8,,FONT:regular),RESIZE, |
  CENTER,GRAY,IMM,MDI,HLP('UpdateOBRA_SOCIAL'),SYSTEM
                       ENTRY(@s100),AT(58,4,204,10),USE(OBR:NOMBRE),UPR
                       ENTRY(@s30),AT(68,18,124,10),USE(OBR:NOMPRE_CORTO),UPR
                       ENTRY(@s50),AT(58,32,204,10),USE(OBR:DIRECCION),UPR
                       ENTRY(@s30),AT(59,46,124,10),USE(OBR:TELEFONO)
                       ENTRY(@p##-########-##p),AT(59,60,64,10),USE(OBR:CUIT)
                       ENTRY(@s50),AT(58,74,204,10),USE(OBR:EMAIL)
                       ENTRY(@n-14),AT(59,88,51,10),USE(OBR:IDLOCALIDAD)
                       ENTRY(@s2),AT(88,102,40,10),USE(OBR:PRONTO_PAGO)
                       BUTTON('&Aceptar'),AT(172,170,49,14),USE(?OK),LEFT,ICON('ok.ico'),CURSOR('mano.cur'),DEFAULT, |
  FLAT,MSG('Confirma y Actualiza el Formulario'),TIP('Confirma y Actualiza el Formulario')
                       BUTTON('&Cancelar'),AT(220,170,49,14),USE(?Cancel),LEFT,ICON('cancelar.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Cancela Operacion'),TIP('Cancela Operacion')
                       PROMPT('NOMBRE:'),AT(3,4),USE(?OBR:NOMBRE:Prompt),TRN
                       PROMPT('NOMPRE CORTO:'),AT(3,18),USE(?OBR:NOMPRE_CORTO:Prompt),TRN
                       PROMPT('DIRECCION:'),AT(3,32),USE(?OBR:DIRECCION:Prompt),TRN
                       PROMPT('TELEFONO:'),AT(3,46),USE(?OBR:TELEFONO:Prompt),TRN
                       PROMPT('CUIT:'),AT(3,60),USE(?OBR:CUIT:Prompt),TRN
                       PROMPT('EMAIL:'),AT(3,74),USE(?OBR:EMAIL:Prompt),TRN
                       PROMPT('IDLOCALIDAD:'),AT(3,88),USE(?OBR:IDLOCALIDAD:Prompt),TRN
                       PROMPT('PRONTO PAGO (SI-NO):'),AT(4,102),USE(?OBR:PRONTO_PAGO:Prompt),TRN
                       LINE,AT(0,122,271,0),USE(?Line1),COLOR(COLOR:Black)
                       PROMPT('FECHA BAJA:'),AT(1,127),USE(?OBR:FECHA_BAJA:Prompt)
                       ENTRY(@d17),AT(51,126,70,10),USE(OBR:FECHA_BAJA)
                       BUTTON('...'),AT(112,86,12,12),USE(?CallLookup)
                       PROMPT('OBSERVACION:'),AT(1,146),USE(?OBR:OBSERVACION:Prompt)
                       ENTRY(@s101),AT(57,145,204,10),USE(OBR:OBSERVACION)
                       LINE,AT(1,165,269,0),USE(?Line2),COLOR(COLOR:Black)
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
    ActionMessage = 'Insertando Registro'
  OF ChangeRecord
    ActionMessage = 'Cambiando Registro'
  END
  QuickWindow{PROP:Text} = ActionMessage                   ! Display status message in title bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('UpdateOBRA_SOCIAL')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?OBR:NOMBRE
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(OBR:Record,History::OBR:Record)
  SELF.AddHistoryField(?OBR:NOMBRE,2)
  SELF.AddHistoryField(?OBR:NOMPRE_CORTO,3)
  SELF.AddHistoryField(?OBR:DIRECCION,4)
  SELF.AddHistoryField(?OBR:TELEFONO,5)
  SELF.AddHistoryField(?OBR:CUIT,6)
  SELF.AddHistoryField(?OBR:EMAIL,7)
  SELF.AddHistoryField(?OBR:IDLOCALIDAD,8)
  SELF.AddHistoryField(?OBR:PRONTO_PAGO,9)
  SELF.AddHistoryField(?OBR:FECHA_BAJA,10)
  SELF.AddHistoryField(?OBR:OBSERVACION,11)
  SELF.AddUpdateFile(Access:OBRA_SOCIAL)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:LOCALIDAD.Open                                    ! File LOCALIDAD used by this procedure, so make sure it's RelationManager is open
  Relate:OBRA_SOCIAL.Open                                  ! File OBRA_SOCIAL used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:OBRA_SOCIAL
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
    ?OBR:NOMBRE{PROP:ReadOnly} = True
    ?OBR:NOMPRE_CORTO{PROP:ReadOnly} = True
    ?OBR:DIRECCION{PROP:ReadOnly} = True
    ?OBR:TELEFONO{PROP:ReadOnly} = True
    ?OBR:CUIT{PROP:ReadOnly} = True
    ?OBR:EMAIL{PROP:ReadOnly} = True
    ?OBR:IDLOCALIDAD{PROP:ReadOnly} = True
    ?OBR:PRONTO_PAGO{PROP:ReadOnly} = True
    ?OBR:FECHA_BAJA{PROP:ReadOnly} = True
    DISABLE(?CallLookup)
    ?OBR:OBSERVACION{PROP:ReadOnly} = True
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdateOBRA_SOCIAL',QuickWindow)            ! Restore window settings from non-volatile store
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
    Relate:LOCALIDAD.Close
    Relate:OBRA_SOCIAL.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateOBRA_SOCIAL',QuickWindow)         ! Save window data to non-volatile store
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
    SelectLOCALIDAD
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
    OF ?OBR:IDLOCALIDAD
      IF OBR:IDLOCALIDAD OR ?OBR:IDLOCALIDAD{PROP:Req}
        LOC:IDLOCALIDAD = OBR:IDLOCALIDAD
        IF Access:LOCALIDAD.TryFetch(LOC:PK_LOCALIDAD)
          IF SELF.Run(1,SelectRecord) = RequestCompleted
            OBR:IDLOCALIDAD = LOC:IDLOCALIDAD
          ELSE
            SELECT(?OBR:IDLOCALIDAD)
            CYCLE
          END
        END
      END
      ThisWindow.Reset()
    OF ?OK
      ThisWindow.Update()
      IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing THEN
         POST(EVENT:CloseWindow)
      END
    OF ?CallLookup
      ThisWindow.Update()
      LOC:IDLOCALIDAD = OBR:IDLOCALIDAD
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        OBR:IDLOCALIDAD = LOC:IDLOCALIDAD
      END
      ThisWindow.Reset(1)
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

