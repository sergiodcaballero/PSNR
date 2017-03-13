

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('GESTION335.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION013.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION336.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Actualizacion CONSULTRIO_ADHERENTE
!!! </summary>
Formulario_CONSULTRIO_ADHERENTE PROCEDURE 

CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
History::CON1:Record LIKE(CON1:RECORD),THREAD
QuickWindow          WINDOW('Actualizacion CONSULTRIO_ADHERENTE'),AT(,,229,117),FONT('Arial',8,COLOR:Black,FONT:bold), |
  RESIZE,CENTER,GRAY,IMM,MDI,HLP('Formulario_CONSULTRIO_ADHERENTE'),SYSTEM
                       ENTRY(@n-14),AT(61,16,64,10),USE(CON1:IDSOCIO),RIGHT(1)
                       BUTTON('...'),AT(127,15,12,12),USE(?CallLookup)
                       ENTRY(@s100),AT(141,16,87,10),USE(SOC:NOMBRE),TRN
                       ENTRY(@n-14),AT(61,29,64,10),USE(CON1:NRO),RIGHT(1),REQ
                       PROMPT('LIBRO:'),AT(0,42),USE(?CON1:LIBRO:Prompt)
                       ENTRY(@n-4),AT(61,42,64,10),USE(CON1:LIBRO),RIGHT(1)
                       ENTRY(@d17),AT(61,68,64,10),USE(CON1:FECHA),RIGHT(1),REQ
                       ENTRY(@n-14),AT(61,55,64,10),USE(CON1:FOLIO),RIGHT(1),REQ
                       BUTTON('&Aceptar'),AT(112,100,49,14),USE(?OK),LEFT,ICON('ok.ico'),CURSOR('mano.cur'),DEFAULT, |
  FLAT,MSG('Confirma y Actualiza el Formulario'),TIP('Confirma y Actualiza el Formulario')
                       BUTTON('&Cancelar'),AT(166,100,49,14),USE(?Cancel),LEFT,ICON('cancelar.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Cancela Operacion'),TIP('Cancela Operacion')
                       PROMPT('IDCONSULTORIO:'),AT(1,3),USE(?CON1:IDCONSULTORIO:Prompt),TRN
                       ENTRY(@n-14),AT(61,3,64,10),USE(CON1:IDCONSULTORIO),RIGHT(1),DISABLE
                       PROMPT('IDSOCIO:'),AT(1,16),USE(?CON1:IDSOCIO:Prompt),TRN
                       PROMPT('NRO:'),AT(1,29),USE(?CON1:NRO:Prompt),TRN
                       PROMPT('FECHA:'),AT(1,68),USE(?CON1:FECHA:Prompt),TRN
                       PROMPT('FOLIO:'),AT(1,55),USE(?CON1:FOLIO:Prompt),TRN
                       PROMPT('TELEFONO:'),AT(2,83),USE(?CON1:TELEFONO:Prompt)
                       ENTRY(@s40),AT(61,83,153,10),USE(CON1:TELEFONO)
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
  GlobalErrors.SetProcedureName('Formulario_CONSULTRIO_ADHERENTE')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?CON1:IDSOCIO
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(CON1:Record,History::CON1:Record)
  SELF.AddHistoryField(?CON1:IDSOCIO,3)
  SELF.AddHistoryField(?CON1:NRO,4)
  SELF.AddHistoryField(?CON1:LIBRO,7)
  SELF.AddHistoryField(?CON1:FECHA,5)
  SELF.AddHistoryField(?CON1:FOLIO,6)
  SELF.AddHistoryField(?CON1:IDCONSULTORIO,2)
  SELF.AddHistoryField(?CON1:TELEFONO,8)
  SELF.AddUpdateFile(Access:CONSULTRIO_ADHERENTE)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:CONSULTORIO.Open                                  ! File CONSULTORIO used by this procedure, so make sure it's RelationManager is open
  Relate:CONSULTRIO_ADHERENTE.Open                         ! File CONSULTRIO_ADHERENTE used by this procedure, so make sure it's RelationManager is open
  Relate:SOCIOS.Open                                       ! File SOCIOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:CONSULTRIO_ADHERENTE
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
    ?CON1:IDSOCIO{PROP:ReadOnly} = True
    DISABLE(?CallLookup)
    ?SOC:NOMBRE{PROP:ReadOnly} = True
    ?CON1:NRO{PROP:ReadOnly} = True
    ?CON1:LIBRO{PROP:ReadOnly} = True
    ?CON1:FECHA{PROP:ReadOnly} = True
    ?CON1:FOLIO{PROP:ReadOnly} = True
    ?CON1:IDCONSULTORIO{PROP:ReadOnly} = True
    ?CON1:TELEFONO{PROP:ReadOnly} = True
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('Formulario_CONSULTRIO_ADHERENTE',QuickWindow) ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:CONSULTORIO.Close
    Relate:CONSULTRIO_ADHERENTE.Close
    Relate:SOCIOS.Close
  END
  IF SELF.Opened
    INIMgr.Update('Formulario_CONSULTRIO_ADHERENTE',QuickWindow) ! Save window data to non-volatile store
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
      SelectCONSULTORIO
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
    OF ?CON1:IDSOCIO
      SOC:IDSOCIO = CON1:IDSOCIO
      IF Access:SOCIOS.TryFetch(SOC:PK_SOCIOS)
        IF SELF.Run(1,SelectRecord) = RequestCompleted
          CON1:IDSOCIO = SOC:IDSOCIO
        ELSE
          SELECT(?CON1:IDSOCIO)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
      IF Access:CONSULTRIO_ADHERENTE.TryValidateField(3)   ! Attempt to validate CON1:IDSOCIO in CONSULTRIO_ADHERENTE
        SELECT(?CON1:IDSOCIO)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?CON1:IDSOCIO
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?CON1:IDSOCIO{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?CallLookup
      ThisWindow.Update()
      SOC:IDSOCIO = CON1:IDSOCIO
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        CON1:IDSOCIO = SOC:IDSOCIO
      END
      ThisWindow.Reset(1)
    OF ?OK
      ThisWindow.Update()
      IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing THEN
         POST(EVENT:CloseWindow)
      END
    OF ?CON1:IDCONSULTORIO
      CON2:IDCONSULTORIO = CON1:IDCONSULTORIO
      IF Access:CONSULTORIO.TryFetch(CON2:PK_CONSULTORIO)
        IF SELF.Run(2,SelectRecord) = RequestCompleted
          CON1:IDCONSULTORIO = CON2:IDCONSULTORIO
        ELSE
          SELECT(?CON1:IDCONSULTORIO)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
      IF Access:CONSULTRIO_ADHERENTE.TryValidateField(2)   ! Attempt to validate CON1:IDCONSULTORIO in CONSULTRIO_ADHERENTE
        SELECT(?CON1:IDCONSULTORIO)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?CON1:IDCONSULTORIO
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?CON1:IDCONSULTORIO{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
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

