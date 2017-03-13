

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('GESTION330.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION013.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION030.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION331.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Actualizacion CONSULTORIO
!!! </summary>
UpdateCONSULTORIO PROCEDURE 

CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
History::CON2:Record LIKE(CON2:RECORD),THREAD
QuickWindow          WINDOW('Actualizacion EMPRESA'),AT(,,367,132),FONT('MS Sans Serif',8,,FONT:regular),RESIZE, |
  CENTER,GRAY,IMM,MDI,HLP('UpdateCONSULTORIO'),SYSTEM
                       PROMPT('IDLOCALIDAD:'),AT(5,3),USE(?CON2:IDLOCALIDAD:Prompt),TRN
                       ENTRY(@n-14),AT(60,3,64,10),USE(CON2:IDLOCALIDAD)
                       BUTTON('...'),AT(125,2,12,12),USE(?CallLookup)
                       STRING(@s20),AT(141,4),USE(LOC:DESCRIPCION)
                       PROMPT('IDSOCIO:'),AT(5,17),USE(?CON2:IDSOCIO:Prompt),TRN
                       ENTRY(@n-14),AT(60,17,64,10),USE(CON2:IDSOCIO)
                       BUTTON('...'),AT(126,16,12,12),USE(?CallLookup:2)
                       STRING(@n-14),AT(317,17),USE(SOC:MATRICULA)
                       STRING(@s30),AT(145,17),USE(SOC:NOMBRE)
                       PROMPT('MATRICULA:'),AT(271,17),USE(?Prompt9)
                       PROMPT('DIRECCION:'),AT(5,31),USE(?CON2:DIRECCION:Prompt),TRN
                       ENTRY(@s50),AT(60,31,189,10),USE(CON2:DIRECCION)
                       PROMPT('FECHA:'),AT(5,45),USE(?CON2:FECHA:Prompt),TRN
                       ENTRY(@d17),AT(60,45,104,10),USE(CON2:FECHA)
                       PROMPT('LIBRO:'),AT(5,59),USE(?CON2:LIBRO:Prompt),TRN
                       ENTRY(@n-14),AT(60,59,64,10),USE(CON2:LIBRO),REQ
                       PROMPT('FOLIO:'),AT(132,61),USE(?CON2:FOLIO:Prompt),TRN
                       ENTRY(@n-14),AT(166,61,64,10),USE(CON2:FOLIO),REQ
                       PROMPT('ACTA:'),AT(241,61),USE(?CON2:ACTA:Prompt),TRN
                       ENTRY(@s20),AT(273,61,84,10),USE(CON2:ACTA),REQ
                       PROMPT('IDINSPECTOR:'),AT(5,73),USE(?CON2:IDINSPECTOR:Prompt),TRN
                       ENTRY(@n-14),AT(59,73,64,10),USE(CON2:IDINSPECTOR)
                       BUTTON('...'),AT(126,72,12,12),USE(?CallLookup:3)
                       STRING(@n-14),AT(139,73),USE(INS:IDSOCIO)
                       LINE,AT(0,90,367,0),USE(?Line1),COLOR(COLOR:Black)
                       PROMPT('FECHA HABILITACION:'),AT(2,98),USE(?CON2:FECHA_HABILITACION:Prompt)
                       ENTRY(@d17),AT(83,98,64,10),USE(CON2:FECHA_HABILITACION)
                       LINE,AT(-1,113,365,0),USE(?Line2),COLOR(COLOR:Black)
                       BUTTON('&Aceptar'),AT(76,118,49,14),USE(?OK),LEFT,ICON('ok.ico'),CURSOR('mano.cur'),DEFAULT, |
  FLAT,MSG('Confirma y Actualiza el Formulario'),TIP('Confirma y Actualiza el Formulario')
                       BUTTON('&Cancelar'),AT(254,118,49,14),USE(?Cancel),LEFT,ICON('cancelar.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Cancela Operacion'),TIP('Cancela Operacion')
                       PROMPT('TELEFONO:'),AT(169,44),USE(?CON2:TELEFONO:Prompt)
                       ENTRY(@s40),AT(217,44,140,10),USE(CON2:TELEFONO)
                       OPTION('ACTIVO:'),AT(208,92,68,20),USE(CON2:ACTIVO),BOXED
                         RADIO('SI'),AT(217,99),USE(?CON2:ACTIVO:Radio1)
                         RADIO('NO'),AT(247,99),USE(?CON2:ACTIVO:Radio2)
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
  GlobalErrors.SetProcedureName('UpdateCONSULTORIO')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?CON2:IDLOCALIDAD:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(CON2:Record,History::CON2:Record)
  SELF.AddHistoryField(?CON2:IDLOCALIDAD,2)
  SELF.AddHistoryField(?CON2:IDSOCIO,3)
  SELF.AddHistoryField(?CON2:DIRECCION,4)
  SELF.AddHistoryField(?CON2:FECHA,5)
  SELF.AddHistoryField(?CON2:LIBRO,6)
  SELF.AddHistoryField(?CON2:FOLIO,7)
  SELF.AddHistoryField(?CON2:ACTA,8)
  SELF.AddHistoryField(?CON2:IDINSPECTOR,9)
  SELF.AddHistoryField(?CON2:FECHA_HABILITACION,11)
  SELF.AddHistoryField(?CON2:TELEFONO,13)
  SELF.AddHistoryField(?CON2:ACTIVO,14)
  SELF.AddUpdateFile(Access:CONSULTORIO)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:CONSULTORIO.Open                                  ! File CONSULTORIO used by this procedure, so make sure it's RelationManager is open
  Relate:INSPECTOR.Open                                    ! File INSPECTOR used by this procedure, so make sure it's RelationManager is open
  Relate:LOCALIDAD.Open                                    ! File LOCALIDAD used by this procedure, so make sure it's RelationManager is open
  Relate:SOCIOS.Open                                       ! File SOCIOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:CONSULTORIO
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
    ?CON2:IDLOCALIDAD{PROP:ReadOnly} = True
    DISABLE(?CallLookup)
    ?CON2:IDSOCIO{PROP:ReadOnly} = True
    DISABLE(?CallLookup:2)
    ?CON2:DIRECCION{PROP:ReadOnly} = True
    ?CON2:FECHA{PROP:ReadOnly} = True
    ?CON2:LIBRO{PROP:ReadOnly} = True
    ?CON2:FOLIO{PROP:ReadOnly} = True
    ?CON2:ACTA{PROP:ReadOnly} = True
    ?CON2:IDINSPECTOR{PROP:ReadOnly} = True
    DISABLE(?CallLookup:3)
    ?CON2:FECHA_HABILITACION{PROP:ReadOnly} = True
    ?CON2:TELEFONO{PROP:ReadOnly} = True
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdateCONSULTORIO',QuickWindow)            ! Restore window settings from non-volatile store
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
    Relate:CONSULTORIO.Close
    Relate:INSPECTOR.Close
    Relate:LOCALIDAD.Close
    Relate:SOCIOS.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateCONSULTORIO',QuickWindow)         ! Save window data to non-volatile store
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
      SelectLOCALIDAD
      SelectSOCIOS
      SelectINSPECTOR
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
    CASE ACCEPTED()
    OF ?OK
      IF CON2:FECHA_HABILITACION <> 0 THEN
          CON2:HABILITADO = 'SI'
          CON2:FECHA_VTO = CON2:FECHA_HABILITACION +  1825
      END
      IF CON2:ACTIVO = '' THEN 
          CON2:ACTIVO = 'SI'
      END     
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?CON2:IDLOCALIDAD
      LOC:IDLOCALIDAD = CON2:IDLOCALIDAD
      IF Access:LOCALIDAD.TryFetch(LOC:PK_LOCALIDAD)
        IF SELF.Run(1,SelectRecord) = RequestCompleted
          CON2:IDLOCALIDAD = LOC:IDLOCALIDAD
        ELSE
          SELECT(?CON2:IDLOCALIDAD)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
      IF Access:CONSULTORIO.TryValidateField(2)            ! Attempt to validate CON2:IDLOCALIDAD in CONSULTORIO
        SELECT(?CON2:IDLOCALIDAD)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?CON2:IDLOCALIDAD
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?CON2:IDLOCALIDAD{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?CallLookup
      ThisWindow.Update()
      LOC:IDLOCALIDAD = CON2:IDLOCALIDAD
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        CON2:IDLOCALIDAD = LOC:IDLOCALIDAD
      END
      ThisWindow.Reset(1)
    OF ?CON2:IDSOCIO
      SOC:IDSOCIO = CON2:IDSOCIO
      IF Access:SOCIOS.TryFetch(SOC:PK_SOCIOS)
        IF SELF.Run(2,SelectRecord) = RequestCompleted
          CON2:IDSOCIO = SOC:IDSOCIO
        ELSE
          SELECT(?CON2:IDSOCIO)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
      IF Access:CONSULTORIO.TryValidateField(3)            ! Attempt to validate CON2:IDSOCIO in CONSULTORIO
        SELECT(?CON2:IDSOCIO)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?CON2:IDSOCIO
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?CON2:IDSOCIO{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?CallLookup:2
      ThisWindow.Update()
      SOC:IDSOCIO = CON2:IDSOCIO
      IF SELF.Run(2,SelectRecord) = RequestCompleted
        CON2:IDSOCIO = SOC:IDSOCIO
      END
      ThisWindow.Reset(1)
    OF ?CON2:IDINSPECTOR
      INS:IDINSPECTOR = CON2:IDINSPECTOR
      IF Access:INSPECTOR.TryFetch(INS:PK_INSPECTOR)
        IF SELF.Run(3,SelectRecord) = RequestCompleted
          CON2:IDINSPECTOR = INS:IDINSPECTOR
        ELSE
          SELECT(?CON2:IDINSPECTOR)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
      IF Access:CONSULTORIO.TryValidateField(9)            ! Attempt to validate CON2:IDINSPECTOR in CONSULTORIO
        SELECT(?CON2:IDINSPECTOR)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?CON2:IDINSPECTOR
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?CON2:IDINSPECTOR{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?CallLookup:3
      ThisWindow.Update()
      INS:IDINSPECTOR = CON2:IDINSPECTOR
      IF SELF.Run(3,SelectRecord) = RequestCompleted
        CON2:IDINSPECTOR = INS:IDINSPECTOR
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

