

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABUTIL.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('GESTION235.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION218.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Actualizacion CURSO_MODULOS
!!! </summary>
UpdateCURSO_MODULOS PROCEDURE 

CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
History::CUR2:Record LIKE(CUR2:RECORD),THREAD
QuickWindow          WINDOW('Actualizacion MODULOS'),AT(,,275,224),FONT('MS Sans Serif',8,,FONT:regular),RESIZE, |
  CENTER,GRAY,IMM,MDI,HLP('UpdateCURSO_MODULOS'),SYSTEM
                       ENTRY(@n-14),AT(67,3,64,10),USE(CUR2:IDCURSO),DISABLE
                       ENTRY(@s50),AT(67,18,204,10),USE(CUR2:DESCRIPCION),UPR
                       ENTRY(@n-14),AT(67,33,64,10),USE(CUR2:NUMERO_MODULO)
                       ENTRY(@n-14),AT(67,46,64,10),USE(CUR2:CANTIDAD_HORAS)
                       ENTRY(@n10.2),AT(66,59,40,10),USE(CUR2:MONTO)
                       ENTRY(@d17),AT(66,74,65,10),USE(CUR2:FECHA_INICIO)
                       ENTRY(@t7),AT(200,76,41,10),USE(CUR2:HORA_INICIO)
                       ENTRY(@d17),AT(66,87,64,10),USE(CUR2:FECHA_FIN)
                       ENTRY(@t7),AT(198,90,43,10),USE(CUR2:HORA_FIN)
                       OPTION('EXAMEN'),AT(4,103,68,23),USE(CUR2:EXAMEN),BOXED
                         RADIO('SI'),AT(6,111),USE(?CUR2:EXAMEN:Radio1)
                         RADIO('NO'),AT(38,111),USE(?CUR2:EXAMEN:Radio2)
                       END
                       TEXT,AT(59,132,213,60),USE(CUR2:OBSERVACION),BOXED
                       BUTTON('&Aceptar'),AT(173,205,49,14),USE(?OK),LEFT,ICON('ok.ico'),CURSOR('mano.cur'),DEFAULT, |
  FLAT,MSG('Confirma y Actualiza el Formulario'),TIP('Confirma y Actualiza el Formulario')
                       BUTTON('&Cancelar'),AT(225,205,49,14),USE(?Cancel),LEFT,ICON('cancelar.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Cancela Operacion'),TIP('Cancela Operacion')
                       PROMPT('IDCURSO:'),AT(3,3),USE(?CUR2:IDCURSO:Prompt),TRN
                       STRING(@s50),AT(135,2),USE(CUR:DESCRIPCION)
                       PROMPT('DESCRIPCION:'),AT(3,18),USE(?CUR2:DESCRIPCION:Prompt),TRN
                       PROMPT('Nº  MODULO:'),AT(3,33),USE(?CUR2:NUMERO_MODULO:Prompt),TRN
                       PROMPT('CANT HORAS:'),AT(3,46),USE(?CUR2:CANTIDAD_HORAS:Prompt),TRN
                       PROMPT('MONTO:'),AT(2,59),USE(?CUR2:MONTO:Prompt),TRN
                       PROMPT('FECHA INICIO:'),AT(2,74),USE(?CUR2:FECHA_INICIO:Prompt),TRN
                       BUTTON('...'),AT(133,73,13,12),USE(?Calendar),LEFT,ICON('CALENDAR.ICO'),SKIP
                       PROMPT('FECHA FIN:'),AT(2,87),USE(?CUR2:FECHA_FIN:Prompt),TRN
                       BUTTON('...'),AT(134,86,12,12),USE(?Calendar:2),LEFT,ICON('calendar.ico'),SKIP
                       PROMPT('HORA INICIO:'),AT(151,76),USE(?CUR2:HORA_INICIO:Prompt),TRN
                       PROMPT('HORA FIN:'),AT(152,88),USE(?CUR2:HORA_FIN:Prompt),TRN
                       LINE,AT(0,201,275,0),USE(?Line1),COLOR(COLOR:Black)
                       PROMPT('OBSERVACION:'),AT(0,132),USE(?CUR2:OBSERVACION:Prompt)
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

Calendar7            CalendarClass
Calendar8            CalendarClass
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
  GlobalErrors.SetProcedureName('UpdateCURSO_MODULOS')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?CUR2:IDCURSO
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(CUR2:Record,History::CUR2:Record)
  SELF.AddHistoryField(?CUR2:IDCURSO,2)
  SELF.AddHistoryField(?CUR2:DESCRIPCION,3)
  SELF.AddHistoryField(?CUR2:NUMERO_MODULO,4)
  SELF.AddHistoryField(?CUR2:CANTIDAD_HORAS,5)
  SELF.AddHistoryField(?CUR2:MONTO,7)
  SELF.AddHistoryField(?CUR2:FECHA_INICIO,8)
  SELF.AddHistoryField(?CUR2:HORA_INICIO,10)
  SELF.AddHistoryField(?CUR2:FECHA_FIN,9)
  SELF.AddHistoryField(?CUR2:HORA_FIN,11)
  SELF.AddHistoryField(?CUR2:EXAMEN,6)
  SELF.AddHistoryField(?CUR2:OBSERVACION,12)
  SELF.AddUpdateFile(Access:CURSO_MODULOS)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:CURSO.Open                                        ! File CURSO used by this procedure, so make sure it's RelationManager is open
  Relate:CURSO_MODULOS.Open                                ! File CURSO_MODULOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:CURSO_MODULOS
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
    ?CUR2:IDCURSO{PROP:ReadOnly} = True
    ?CUR2:DESCRIPCION{PROP:ReadOnly} = True
    ?CUR2:NUMERO_MODULO{PROP:ReadOnly} = True
    ?CUR2:CANTIDAD_HORAS{PROP:ReadOnly} = True
    ?CUR2:MONTO{PROP:ReadOnly} = True
    ?CUR2:FECHA_INICIO{PROP:ReadOnly} = True
    ?CUR2:HORA_INICIO{PROP:ReadOnly} = True
    ?CUR2:FECHA_FIN{PROP:ReadOnly} = True
    ?CUR2:HORA_FIN{PROP:ReadOnly} = True
    DISABLE(?Calendar)
    DISABLE(?Calendar:2)
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdateCURSO_MODULOS',QuickWindow)          ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:CURSO.Close
    Relate:CURSO_MODULOS.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateCURSO_MODULOS',QuickWindow)       ! Save window data to non-volatile store
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
    SelectCURSO
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
      IF SELF.REQUEST = INSERTRECORD THEN
          CUR:IDCURSO = CUR2:IDCURSO
          ACCESS:CURSO.TRYFETCH(CUR:PK_CURSO)
          CUR:CANTIDAD = CUR:CANTIDAD +1
          ACCESS:CURSO.UPDATE()
      END
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?CUR2:IDCURSO
      CUR:IDCURSO = CUR2:IDCURSO
      IF Access:CURSO.TryFetch(CUR:PK_CURSO)
        IF SELF.Run(1,SelectRecord) = RequestCompleted
          CUR2:IDCURSO = CUR:IDCURSO
        ELSE
          SELECT(?CUR2:IDCURSO)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
      IF Access:CURSO_MODULOS.TryValidateField(2)          ! Attempt to validate CUR2:IDCURSO in CURSO_MODULOS
        SELECT(?CUR2:IDCURSO)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?CUR2:IDCURSO
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?CUR2:IDCURSO{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?OK
      ThisWindow.Update()
      IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing THEN
         POST(EVENT:CloseWindow)
      END
    OF ?Calendar
      ThisWindow.Update()
      Calendar7.SelectOnClose = True
      Calendar7.Ask('Select a Date',CUR2:FECHA_INICIO)
      IF Calendar7.Response = RequestCompleted THEN
      CUR2:FECHA_INICIO=Calendar7.SelectedDate
      DISPLAY(?CUR2:FECHA_INICIO)
      END
      ThisWindow.Reset(True)
    OF ?Calendar:2
      ThisWindow.Update()
      Calendar8.SelectOnClose = True
      Calendar8.Ask('Select a Date',CUR2:FECHA_FIN)
      IF Calendar8.Response = RequestCompleted THEN
      CUR2:FECHA_FIN=Calendar8.SelectedDate
      DISPLAY(?CUR2:FECHA_FIN)
      END
      ThisWindow.Reset(True)
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

