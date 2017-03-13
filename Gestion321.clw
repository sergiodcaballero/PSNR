

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('GESTION321.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION013.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION031.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION232.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Actualizacion CV
!!! </summary>
UpdateCV PROCEDURE 

CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
History::CV:Record   LIKE(CV:RECORD),THREAD
QuickWindow          WINDOW('Actualizacion CV'),AT(,,383,118),FONT('Arial',8,,FONT:regular),RESIZE,CENTER,GRAY, |
  IMM,MDI,HLP('UpdateCV'),SYSTEM
                       PROMPT('DESCRIPCION:'),AT(3,5),USE(?CV:DESCRIPCION:Prompt),TRN
                       ENTRY(@s50),AT(74,5,204,10),USE(CV:DESCRIPCION),REQ
                       PROMPT('IDSOCIO:'),AT(3,19),USE(?CV:IDSOCIO:Prompt),TRN
                       ENTRY(@n-14),AT(74,19,64,10),USE(CV:IDSOCIO)
                       BUTTON('...'),AT(140,18,12,12),USE(?CallLookup)
                       STRING(@s30),AT(159,19),USE(SOC:NOMBRE)
                       PROMPT('MATRICULA:'),AT(288,19),USE(?Prompt7)
                       STRING(@n-14),AT(333,19),USE(SOC:MATRICULA)
                       PROMPT('IDINSTITUCION:'),AT(3,33),USE(?CV:IDINSTITUCION:Prompt),TRN
                       ENTRY(@n-14),AT(74,33,64,10),USE(CV:IDINSTITUCION)
                       BUTTON('...'),AT(141,32,12,12),USE(?CallLookup:2)
                       STRING(@s50),AT(159,33),USE(INS2:NOMBRE)
                       PROMPT('ID TIPO CURSO:'),AT(3,47),USE(?CV:ID_TIPO_CURSO:Prompt),TRN
                       ENTRY(@n-14),AT(74,47,64,10),USE(CV:ID_TIPO_CURSO)
                       BUTTON('...'),AT(140,46,12,12),USE(?CallLookup:3)
                       STRING(@s50),AT(159,47),USE(TIP2:DESCRIPCION)
                       PROMPT('ANO EGRESO:'),AT(3,61),USE(?CV:ANO_EGRESO:Prompt),TRN
                       ENTRY(@s4),AT(74,61,40,10),USE(CV:ANO_EGRESO),REQ
                       PROMPT('CANTIDAD HORAS:'),AT(3,75),USE(?CV:CANTIDAD_HORAS:Prompt),TRN
                       ENTRY(@s20),AT(74,75,84,10),USE(CV:CANTIDAD_HORAS),REQ
                       PROMPT('OBSERVACION:'),AT(3,89),USE(?CV:OBSERVACION:Prompt)
                       ENTRY(@s100),AT(72,89,311,10),USE(CV:OBSERVACION)
                       BUTTON('&Aceptar'),AT(271,103,49,14),USE(?OK),LEFT,ICON('ok.ico'),CURSOR('mano.cur'),DEFAULT, |
  FLAT,MSG('Confirma y Actualiza el Formulario'),TIP('Confirma y Actualiza el Formulario')
                       BUTTON('&Cancelar'),AT(331,103,49,14),USE(?Cancel),LEFT,ICON('cancelar.ico'),CURSOR('mano.cur'), |
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
    ActionMessage = 'Insertando Registro'
  OF ChangeRecord
    ActionMessage = 'Cambiando Registro'
  END
  QuickWindow{PROP:Text} = ActionMessage                   ! Display status message in title bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('UpdateCV')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?CV:DESCRIPCION:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(CV:Record,History::CV:Record)
  SELF.AddHistoryField(?CV:DESCRIPCION,2)
  SELF.AddHistoryField(?CV:IDSOCIO,3)
  SELF.AddHistoryField(?CV:IDINSTITUCION,4)
  SELF.AddHistoryField(?CV:ID_TIPO_CURSO,5)
  SELF.AddHistoryField(?CV:ANO_EGRESO,6)
  SELF.AddHistoryField(?CV:CANTIDAD_HORAS,7)
  SELF.AddHistoryField(?CV:OBSERVACION,8)
  SELF.AddUpdateFile(Access:CV)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:CV.Open                                           ! File CV used by this procedure, so make sure it's RelationManager is open
  Relate:INSTITUCION.Open                                  ! File INSTITUCION used by this procedure, so make sure it's RelationManager is open
  Relate:SOCIOS.Open                                       ! File SOCIOS used by this procedure, so make sure it's RelationManager is open
  Relate:TIPO_CURSO.Open                                   ! File TIPO_CURSO used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:CV
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
    ?CV:DESCRIPCION{PROP:ReadOnly} = True
    ?CV:IDSOCIO{PROP:ReadOnly} = True
    DISABLE(?CallLookup)
    ?CV:IDINSTITUCION{PROP:ReadOnly} = True
    DISABLE(?CallLookup:2)
    ?CV:ID_TIPO_CURSO{PROP:ReadOnly} = True
    DISABLE(?CallLookup:3)
    ?CV:ANO_EGRESO{PROP:ReadOnly} = True
    ?CV:CANTIDAD_HORAS{PROP:ReadOnly} = True
    ?CV:OBSERVACION{PROP:ReadOnly} = True
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdateCV',QuickWindow)                     ! Restore window settings from non-volatile store
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
    Relate:CV.Close
    Relate:INSTITUCION.Close
    Relate:SOCIOS.Close
    Relate:TIPO_CURSO.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateCV',QuickWindow)                  ! Save window data to non-volatile store
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
      SelectINSTITUCION
      SelectTIPO_CURSO
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
    OF ?CV:IDSOCIO
      SOC:IDSOCIO = CV:IDSOCIO
      IF Access:SOCIOS.TryFetch(SOC:PK_SOCIOS)
        IF SELF.Run(1,SelectRecord) = RequestCompleted
          CV:IDSOCIO = SOC:IDSOCIO
        ELSE
          SELECT(?CV:IDSOCIO)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
      IF Access:CV.TryValidateField(3)                     ! Attempt to validate CV:IDSOCIO in CV
        SELECT(?CV:IDSOCIO)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?CV:IDSOCIO
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?CV:IDSOCIO{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?CallLookup
      ThisWindow.Update()
      SOC:IDSOCIO = CV:IDSOCIO
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        CV:IDSOCIO = SOC:IDSOCIO
      END
      ThisWindow.Reset(1)
    OF ?CV:IDINSTITUCION
      INS2:IDINSTITUCION = CV:IDINSTITUCION
      IF Access:INSTITUCION.TryFetch(INS2:PK_INSTITUCION)
        IF SELF.Run(2,SelectRecord) = RequestCompleted
          CV:IDINSTITUCION = INS2:IDINSTITUCION
        ELSE
          SELECT(?CV:IDINSTITUCION)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
      IF Access:CV.TryValidateField(4)                     ! Attempt to validate CV:IDINSTITUCION in CV
        SELECT(?CV:IDINSTITUCION)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?CV:IDINSTITUCION
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?CV:IDINSTITUCION{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?CallLookup:2
      ThisWindow.Update()
      INS2:IDINSTITUCION = CV:IDINSTITUCION
      IF SELF.Run(2,SelectRecord) = RequestCompleted
        CV:IDINSTITUCION = INS2:IDINSTITUCION
      END
      ThisWindow.Reset(1)
    OF ?CV:ID_TIPO_CURSO
      TIP2:ID_TIPO_CURSO = CV:ID_TIPO_CURSO
      IF Access:TIPO_CURSO.TryFetch(TIP2:PK_T_CURSO)
        IF SELF.Run(3,SelectRecord) = RequestCompleted
          CV:ID_TIPO_CURSO = TIP2:ID_TIPO_CURSO
        ELSE
          SELECT(?CV:ID_TIPO_CURSO)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
      IF Access:CV.TryValidateField(5)                     ! Attempt to validate CV:ID_TIPO_CURSO in CV
        SELECT(?CV:ID_TIPO_CURSO)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?CV:ID_TIPO_CURSO
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?CV:ID_TIPO_CURSO{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?CallLookup:3
      ThisWindow.Update()
      TIP2:ID_TIPO_CURSO = CV:ID_TIPO_CURSO
      IF SELF.Run(3,SelectRecord) = RequestCompleted
        CV:ID_TIPO_CURSO = TIP2:ID_TIPO_CURSO
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

