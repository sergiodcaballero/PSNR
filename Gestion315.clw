

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('GESTION315.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION030.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION314.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Actualizacion INSTITUCION
!!! </summary>
UpdateINSTITUCION PROCEDURE 

CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
History::INS2:Record LIKE(INS2:RECORD),THREAD
QuickWindow          WINDOW('Actualizacion INSTITUCION'),AT(,,299,157),FONT('MS Sans Serif',8,,FONT:regular),RESIZE, |
  CENTER,GRAY,IMM,MDI,HLP('UpdateINSTITUCION'),SYSTEM
                       BUTTON('&Aceptar'),AT(190,139,49,14),USE(?OK),LEFT,ICON('ok.ico'),CURSOR('mano.cur'),DEFAULT, |
  FLAT,MSG('Confirma y Actualiza el Formulario'),TIP('Confirma y Actualiza el Formulario')
                       BUTTON('&Cancelar'),AT(242,139,49,14),USE(?Cancel),LEFT,ICON('cancelar.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Cancela Operacion'),TIP('Cancela Operacion')
                       PROMPT('IDTIPO INSTITUCION:'),AT(5,3),USE(?INS2:IDTIPO_INSTITUCION:Prompt),TRN
                       ENTRY(@n-14),AT(85,3,64,10),USE(INS2:IDTIPO_INSTITUCION)
                       BUTTON('...'),AT(150,2,12,12),USE(?CallLookup)
                       STRING(@s50),AT(164,3),USE(TIP4:DESCRIPCION)
                       PROMPT('IDLOCALIDAD:'),AT(5,17),USE(?INS2:IDLOCALIDAD:Prompt),TRN
                       ENTRY(@n-14),AT(85,17,64,10),USE(INS2:IDLOCALIDAD)
                       BUTTON('...'),AT(150,15,12,12),USE(?CallLookup:2)
                       STRING(@s20),AT(164,16),USE(LOC:DESCRIPCION)
                       PROMPT('NOMBRE:'),AT(5,31),USE(?INS2:NOMBRE:Prompt),TRN
                       ENTRY(@s50),AT(85,31,204,10),USE(INS2:NOMBRE),REQ
                       PROMPT('NOMBRE CORTO:'),AT(6,47),USE(?INS2:NOMBRE_CORTO:Prompt)
                       ENTRY(@s30),AT(85,46,204,10),USE(INS2:NOMBRE_CORTO)
                       PROMPT('DIRECCION:'),AT(5,64),USE(?INS2:DIRECCION:Prompt),TRN
                       ENTRY(@s50),AT(85,64,204,10),USE(INS2:DIRECCION)
                       PROMPT('TELEFONO:'),AT(5,78),USE(?INS2:TELEFONO:Prompt),TRN
                       ENTRY(@s20),AT(85,78,84,10),USE(INS2:TELEFONO)
                       PROMPT('E MAIL:'),AT(5,92),USE(?INS2:E_MAIL:Prompt),TRN
                       ENTRY(@s50),AT(85,92,204,10),USE(INS2:E_MAIL)
                       OPTION('TIPO ESTADO'),AT(4,109,167,25),USE(INS2:TIPO_ESTADO),BOXED
                         RADIO('OTROS'),AT(56,119),USE(?INS2:TIPO_ESTADO:Radio3)
                         RADIO('PUBLICO'),AT(9,119),USE(?INS2:TIPO_ESTADO:Radio1)
                         RADIO('PRIVADO'),AT(97,119),USE(?INS2:TIPO_ESTADO:Radio2)
                       END
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
  GlobalErrors.SetProcedureName('UpdateINSTITUCION')
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
  SELF.AddHistoryFile(INS2:Record,History::INS2:Record)
  SELF.AddHistoryField(?INS2:IDTIPO_INSTITUCION,2)
  SELF.AddHistoryField(?INS2:IDLOCALIDAD,3)
  SELF.AddHistoryField(?INS2:NOMBRE,4)
  SELF.AddHistoryField(?INS2:NOMBRE_CORTO,8)
  SELF.AddHistoryField(?INS2:DIRECCION,5)
  SELF.AddHistoryField(?INS2:TELEFONO,6)
  SELF.AddHistoryField(?INS2:E_MAIL,7)
  SELF.AddHistoryField(?INS2:TIPO_ESTADO,9)
  SELF.AddUpdateFile(Access:INSTITUCION)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:INSTITUCION.Open                                  ! File INSTITUCION used by this procedure, so make sure it's RelationManager is open
  Relate:LOCALIDAD.Open                                    ! File LOCALIDAD used by this procedure, so make sure it's RelationManager is open
  Relate:TIPO_INSTITUCION.Open                             ! File TIPO_INSTITUCION used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:INSTITUCION
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
    ?INS2:IDTIPO_INSTITUCION{PROP:ReadOnly} = True
    DISABLE(?CallLookup)
    ?INS2:IDLOCALIDAD{PROP:ReadOnly} = True
    DISABLE(?CallLookup:2)
    ?INS2:NOMBRE{PROP:ReadOnly} = True
    ?INS2:NOMBRE_CORTO{PROP:ReadOnly} = True
    ?INS2:DIRECCION{PROP:ReadOnly} = True
    ?INS2:TELEFONO{PROP:ReadOnly} = True
    ?INS2:E_MAIL{PROP:ReadOnly} = True
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdateINSTITUCION',QuickWindow)            ! Restore window settings from non-volatile store
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
    Relate:INSTITUCION.Close
    Relate:LOCALIDAD.Close
    Relate:TIPO_INSTITUCION.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateINSTITUCION',QuickWindow)         ! Save window data to non-volatile store
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
      SelectTIPO_INSTITUCION
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
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?OK
      ThisWindow.Update()
      IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing THEN
         POST(EVENT:CloseWindow)
      END
    OF ?INS2:IDTIPO_INSTITUCION
      TIP4:IDTIPO_INSTITUCION = INS2:IDTIPO_INSTITUCION
      IF Access:TIPO_INSTITUCION.TryFetch(TIP4:PK_T_INSTITUCION)
        IF SELF.Run(1,SelectRecord) = RequestCompleted
          INS2:IDTIPO_INSTITUCION = TIP4:IDTIPO_INSTITUCION
        ELSE
          SELECT(?INS2:IDTIPO_INSTITUCION)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
      IF Access:INSTITUCION.TryValidateField(2)            ! Attempt to validate INS2:IDTIPO_INSTITUCION in INSTITUCION
        SELECT(?INS2:IDTIPO_INSTITUCION)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?INS2:IDTIPO_INSTITUCION
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?INS2:IDTIPO_INSTITUCION{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?CallLookup
      ThisWindow.Update()
      TIP4:IDTIPO_INSTITUCION = INS2:IDTIPO_INSTITUCION
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        INS2:IDTIPO_INSTITUCION = TIP4:IDTIPO_INSTITUCION
      END
      ThisWindow.Reset(1)
    OF ?INS2:IDLOCALIDAD
      LOC:IDLOCALIDAD = INS2:IDLOCALIDAD
      IF Access:LOCALIDAD.TryFetch(LOC:PK_LOCALIDAD)
        IF SELF.Run(2,SelectRecord) = RequestCompleted
          INS2:IDLOCALIDAD = LOC:IDLOCALIDAD
        ELSE
          SELECT(?INS2:IDLOCALIDAD)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
      IF Access:INSTITUCION.TryValidateField(3)            ! Attempt to validate INS2:IDLOCALIDAD in INSTITUCION
        SELECT(?INS2:IDLOCALIDAD)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?INS2:IDLOCALIDAD
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?INS2:IDLOCALIDAD{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?CallLookup:2
      ThisWindow.Update()
      LOC:IDLOCALIDAD = INS2:IDLOCALIDAD
      IF SELF.Run(2,SelectRecord) = RequestCompleted
        INS2:IDLOCALIDAD = LOC:IDLOCALIDAD
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

