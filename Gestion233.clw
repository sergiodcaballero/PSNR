

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABUTIL.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('GESTION233.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION232.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Actualizacion CURSO
!!! </summary>
UpdateCURSO PROCEDURE 

CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
History::CUR:Record  LIKE(CUR:RECORD),THREAD
QuickWindow          WINDOW('Actualizacion CURSO'),AT(,,361,147),FONT('MS Sans Serif',8,,FONT:regular),RESIZE,CENTER, |
  GRAY,IMM,MDI,HLP('UpdateCURSO'),SYSTEM
                       ENTRY(@s50),AT(69,4,204,10),USE(CUR:DESCRIPCION),UPR
                       ENTRY(@n-10),AT(69,18,40,10),USE(CUR:CANTIDAD_HORAS)
                       ENTRY(@n-10.2),AT(69,33,40,10),USE(CUR:MONTO_TOTAL)
                       ENTRY(@s100),AT(69,47,278,10),USE(CUR:OBSERVACION)
                       ENTRY(@n-14),AT(69,61,43,10),USE(CUR:ID_TIPO_CURSO)
                       OPTION('PRESENCIAL'),AT(2,76,71,23),USE(CUR:PRESENCIAL),BOXED
                         RADIO('SI'),AT(12,86),USE(?CUR:PRESENCIAL:Radio1)
                         RADIO('NO'),AT(40,86),USE(?CUR:PRESENCIAL:Radio2)
                       END
                       ENTRY(@d17),AT(69,105,40,10),USE(CUR:FECHA_INICIO),REQ
                       ENTRY(@d17),AT(177,105,40,10),USE(CUR:FECHA_FIN),REQ
                       BUTTON('&Aceptar'),AT(236,129,49,14),USE(?OK),LEFT,ICON('ok.ico'),CURSOR('mano.cur'),DEFAULT, |
  FLAT,MSG('Confirma y Actualiza el Formulario'),TIP('Confirma y Actualiza el Formulario')
                       BUTTON('&Cancelar'),AT(289,129,49,14),USE(?Cancel),LEFT,ICON('cancelar.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Cancela Operacion'),TIP('Cancela Operacion')
                       PROMPT('FECHA INICIO:'),AT(2,105),USE(?CUR:FECHA_INICIO:Prompt)
                       BUTTON,AT(113,104,12,12),USE(?Calendar),LEFT,ICON('CALENDAR.ICO'),FLAT
                       PROMPT('FECHA FIN:'),AT(133,105),USE(?CUR:FECHA_FIN:Prompt)
                       BUTTON,AT(219,104,12,12),USE(?Calendar:2),LEFT,ICON('CALENDAR.ICO'),FLAT
                       PROMPT('DESCRIPCION:'),AT(2,4),USE(?CUR:DESCRIPCION:Prompt),TRN
                       LINE,AT(0,121,361,0),USE(?Line1),COLOR(COLOR:Black)
                       PROMPT('CANTIDAD HORAS:'),AT(2,18),USE(?CUR:CANTIDAD_HORAS:Prompt),TRN
                       PROMPT('MONTO TOTAL:'),AT(2,33),USE(?CUR:MONTO_TOTAL:Prompt),TRN
                       PROMPT('OBSERVACION:'),AT(2,47),USE(?CUR:OBSERVACION:Prompt),TRN
                       PROMPT('ID TIPO CURSO:'),AT(2,61),USE(?CUR:ID_TIPO_CURSO:Prompt),TRN
                       BUTTON('...'),AT(114,60,12,12),USE(?CallLookup),SKIP
                       STRING(@s50),AT(128,62),USE(TIP2:DESCRIPCION)
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

Calendar8            CalendarClass
Calendar9            CalendarClass
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
  GlobalErrors.SetProcedureName('UpdateCURSO')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?CUR:DESCRIPCION
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(CUR:Record,History::CUR:Record)
  SELF.AddHistoryField(?CUR:DESCRIPCION,2)
  SELF.AddHistoryField(?CUR:CANTIDAD_HORAS,4)
  SELF.AddHistoryField(?CUR:MONTO_TOTAL,5)
  SELF.AddHistoryField(?CUR:OBSERVACION,6)
  SELF.AddHistoryField(?CUR:ID_TIPO_CURSO,7)
  SELF.AddHistoryField(?CUR:PRESENCIAL,3)
  SELF.AddHistoryField(?CUR:FECHA_INICIO,9)
  SELF.AddHistoryField(?CUR:FECHA_FIN,10)
  SELF.AddUpdateFile(Access:CURSO)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:CURSO.Open                                        ! File CURSO used by this procedure, so make sure it's RelationManager is open
  Relate:TIPO_CURSO.Open                                   ! File TIPO_CURSO used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:CURSO
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
    ?CUR:DESCRIPCION{PROP:ReadOnly} = True
    ?CUR:CANTIDAD_HORAS{PROP:ReadOnly} = True
    ?CUR:MONTO_TOTAL{PROP:ReadOnly} = True
    ?CUR:OBSERVACION{PROP:ReadOnly} = True
    ?CUR:ID_TIPO_CURSO{PROP:ReadOnly} = True
    ?CUR:FECHA_INICIO{PROP:ReadOnly} = True
    ?CUR:FECHA_FIN{PROP:ReadOnly} = True
    DISABLE(?Calendar)
    DISABLE(?Calendar:2)
    DISABLE(?CallLookup)
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdateCURSO',QuickWindow)                  ! Restore window settings from non-volatile store
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
    Relate:TIPO_CURSO.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateCURSO',QuickWindow)               ! Save window data to non-volatile store
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
    SelectTIPO_CURSO
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
    OF ?CUR:ID_TIPO_CURSO
      TIP2:ID_TIPO_CURSO = CUR:ID_TIPO_CURSO
      IF Access:TIPO_CURSO.TryFetch(TIP2:PK_T_CURSO)
        IF SELF.Run(1,SelectRecord) = RequestCompleted
          CUR:ID_TIPO_CURSO = TIP2:ID_TIPO_CURSO
        ELSE
          SELECT(?CUR:ID_TIPO_CURSO)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
      IF Access:CURSO.TryValidateField(7)                  ! Attempt to validate CUR:ID_TIPO_CURSO in CURSO
        SELECT(?CUR:ID_TIPO_CURSO)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?CUR:ID_TIPO_CURSO
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?CUR:ID_TIPO_CURSO{PROP:FontColor} = FieldColorQueue.OldColor
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
      Calendar8.SelectOnClose = True
      Calendar8.Ask('Select a Date',CUR:FECHA_INICIO)
      IF Calendar8.Response = RequestCompleted THEN
      CUR:FECHA_INICIO=Calendar8.SelectedDate
      DISPLAY(?CUR:FECHA_INICIO)
      END
      ThisWindow.Reset(True)
    OF ?Calendar:2
      ThisWindow.Update()
      Calendar9.SelectOnClose = True
      Calendar9.Ask('Select a Date',CUR:FECHA_FIN)
      IF Calendar9.Response = RequestCompleted THEN
      CUR:FECHA_FIN=Calendar9.SelectedDate
      DISPLAY(?CUR:FECHA_FIN)
      END
      ThisWindow.Reset(True)
    OF ?CallLookup
      ThisWindow.Update()
      TIP2:ID_TIPO_CURSO = CUR:ID_TIPO_CURSO
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        CUR:ID_TIPO_CURSO = TIP2:ID_TIPO_CURSO
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

