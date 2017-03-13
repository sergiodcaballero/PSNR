

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('GESTION215.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION024.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION214.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Actualizacion PROVEEDORES
!!! </summary>
UpdatePROVEEDORES PROCEDURE 

CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
LOC:DOCUMENTO        LONG                                  ! 
History::PRO2:Record LIKE(PRO2:RECORD),THREAD
QuickWindow          WINDOW('Actualizacion PROVEEDORES'),AT(,,269,156),FONT('MS Sans Serif',8,,FONT:regular),RESIZE, |
  CENTER,GRAY,IMM,MDI,HLP('UpdatePROVEEDORES'),SYSTEM
                       BUTTON('&Aceptar'),AT(167,140,49,14),USE(?OK),LEFT,ICON('ok.ico'),CURSOR('mano.cur'),DEFAULT, |
  FLAT,MSG('Confirma y Actualiza el Formulario'),TIP('Confirma y Actualiza el Formulario')
                       BUTTON('&Cancelar'),AT(221,140,49,14),USE(?Cancel),LEFT,ICON('cancelar.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Cancela Operacion'),TIP('Cancela Operacion')
                       PROMPT('RAZON SOCIAL:'),AT(3,7),USE(?PRO2:DESCRIPCION:Prompt),TRN
                       ENTRY(@s50),AT(60,7,204,10),USE(PRO2:DESCRIPCION),UPR
                       PROMPT('DIRECCION:'),AT(3,21),USE(?PRO2:DIRECCION:Prompt),TRN
                       ENTRY(@s50),AT(60,21,204,10),USE(PRO2:DIRECCION)
                       PROMPT('TELEFONO:'),AT(3,35),USE(?PRO2:TELEFONO:Prompt),TRN
                       ENTRY(@s30),AT(60,35,124,10),USE(PRO2:TELEFONO)
                       PROMPT('EMAIL:'),AT(3,49),USE(?PRO2:EMAIL:Prompt),TRN
                       ENTRY(@s100),AT(60,49,205,10),USE(PRO2:EMAIL)
                       PROMPT('CUITo DNI:'),AT(3,63),USE(?PRO2:CUIT:Prompt),TRN
                       ENTRY(@P###########P),AT(60,63,55,10),USE(PRO2:CUIT)
                       PROMPT('(Cuit sin - , DNI sin .)'),AT(118,63),USE(?Prompt10)
                       PROMPT('IDTIPOIVA:'),AT(3,77),USE(?PRO2:IDTIPOIVA:Prompt),TRN
                       ENTRY(@n-14),AT(60,77,64,10),USE(PRO2:IDTIPOIVA)
                       BUTTON('...'),AT(125,75,12,12),USE(?CallLookup)
                       STRING(@s30),AT(140,76),USE(TIP7:DECRIPCION)
                       PROMPT('IDTIPO PROV:'),AT(2,91),USE(?PRO2:IDTIPO_PROVEEDOR:Prompt)
                       ENTRY(@n-14),AT(59,91,64,10),USE(PRO2:IDTIPO_PROVEEDOR),RIGHT(1)
                       BUTTON('...'),AT(125,90,12,12),USE(?CallLookup:2)
                       STRING(@s50),AT(140,92,113,10),USE(TIPP:DESCRIPCION)
                       LINE,AT(1,105,268,0),USE(?Line1),COLOR(COLOR:Black)
                       PROMPT('FECHA BAJA:'),AT(3,110),USE(?PRO2:FECHA_BAJA:Prompt)
                       ENTRY(@d17),AT(60,109,68,10),USE(PRO2:FECHA_BAJA)
                       PROMPT('OBSERVACION:'),AT(3,124),USE(?PRO2:OBSERVACION:Prompt)
                       ENTRY(@s100),AT(60,123,204,10),USE(PRO2:OBSERVACION)
                       LINE,AT(0,137,268,0),USE(?Line2),COLOR(COLOR:Black)
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
  GlobalErrors.SetProcedureName('UpdatePROVEEDORES')
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
  SELF.AddHistoryFile(PRO2:Record,History::PRO2:Record)
  SELF.AddHistoryField(?PRO2:DESCRIPCION,2)
  SELF.AddHistoryField(?PRO2:DIRECCION,3)
  SELF.AddHistoryField(?PRO2:TELEFONO,4)
  SELF.AddHistoryField(?PRO2:EMAIL,5)
  SELF.AddHistoryField(?PRO2:CUIT,6)
  SELF.AddHistoryField(?PRO2:IDTIPOIVA,10)
  SELF.AddHistoryField(?PRO2:IDTIPO_PROVEEDOR,13)
  SELF.AddHistoryField(?PRO2:FECHA_BAJA,11)
  SELF.AddHistoryField(?PRO2:OBSERVACION,12)
  SELF.AddUpdateFile(Access:PROVEEDORES)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:GASTOS.Open                                       ! File GASTOS used by this procedure, so make sure it's RelationManager is open
  Relate:INGRESOS.Open                                     ! File INGRESOS used by this procedure, so make sure it's RelationManager is open
  Relate:PROVEEDORES.Open                                  ! File PROVEEDORES used by this procedure, so make sure it's RelationManager is open
  Relate:RANKING.Open                                      ! File RANKING used by this procedure, so make sure it's RelationManager is open
  Relate:TIPO_IVA.Open                                     ! File TIPO_IVA used by this procedure, so make sure it's RelationManager is open
  Relate:TIPO_PROVEEDOR.Open                               ! File TIPO_PROVEEDOR used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:PROVEEDORES
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
    ?PRO2:DESCRIPCION{PROP:ReadOnly} = True
    ?PRO2:DIRECCION{PROP:ReadOnly} = True
    ?PRO2:TELEFONO{PROP:ReadOnly} = True
    ?PRO2:EMAIL{PROP:ReadOnly} = True
    ?PRO2:CUIT{PROP:ReadOnly} = True
    ?PRO2:IDTIPOIVA{PROP:ReadOnly} = True
    DISABLE(?CallLookup)
    ?PRO2:IDTIPO_PROVEEDOR{PROP:ReadOnly} = True
    DISABLE(?CallLookup:2)
    ?PRO2:FECHA_BAJA{PROP:ReadOnly} = True
    ?PRO2:OBSERVACION{PROP:ReadOnly} = True
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdatePROVEEDORES',QuickWindow)            ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:GASTOS.Close
    Relate:INGRESOS.Close
    Relate:PROVEEDORES.Close
    Relate:RANKING.Close
    Relate:TIPO_IVA.Close
    Relate:TIPO_PROVEEDOR.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdatePROVEEDORES',QuickWindow)         ! Save window data to non-volatile store
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
      SelectTIPO_IVA
      SelectTIPO_PROVEEDOR
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
      IF SELF.REQUEST = INSERTRECORD THEN
          PRO2:FECHA        =  TODAY()
          PRO2:HORA         =  CLOCK()
          PRO2:IDUSUARIO    =  GLO:IDUSUARIO
      END
      
      
      
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?OK
      ThisWindow.Update()
      IF SELF.REQUEST = INSERTRECORD THEN
          !!! CARGA EL NRO DE PROVEEDOR POR STRORE PROCEDURE
          RANKING{PROP:SQL} = 'CALL SP_GEN_PROVEEDORES_ID'
          NEXT(RANKING)
          PRO2:IDPROVEEDOR = RAN:C1
      END
      IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing THEN
         POST(EVENT:CloseWindow)
      END
    OF ?PRO2:IDTIPOIVA
      TIP7:IDTIPOIVA = PRO2:IDTIPOIVA
      IF Access:TIPO_IVA.TryFetch(TIP7:PK_TIPO_IVA)
        IF SELF.Run(1,SelectRecord) = RequestCompleted
          PRO2:IDTIPOIVA = TIP7:IDTIPOIVA
        ELSE
          SELECT(?PRO2:IDTIPOIVA)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
      IF Access:PROVEEDORES.TryValidateField(10)           ! Attempt to validate PRO2:IDTIPOIVA in PROVEEDORES
        SELECT(?PRO2:IDTIPOIVA)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?PRO2:IDTIPOIVA
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?PRO2:IDTIPOIVA{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?CallLookup
      ThisWindow.Update()
      TIP7:IDTIPOIVA = PRO2:IDTIPOIVA
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        PRO2:IDTIPOIVA = TIP7:IDTIPOIVA
      END
      ThisWindow.Reset(1)
    OF ?PRO2:IDTIPO_PROVEEDOR
      TIPP:IDTIPO_PROVEEDOR = PRO2:IDTIPO_PROVEEDOR
      IF Access:TIPO_PROVEEDOR.TryFetch(TIPP:PK_TIPO_PROVEEDOR)
        IF SELF.Run(2,SelectRecord) = RequestCompleted
          PRO2:IDTIPO_PROVEEDOR = TIPP:IDTIPO_PROVEEDOR
        ELSE
          SELECT(?PRO2:IDTIPO_PROVEEDOR)
          CYCLE
        END
      END
      ThisWindow.Reset()
      IF Access:PROVEEDORES.TryValidateField(13)           ! Attempt to validate PRO2:IDTIPO_PROVEEDOR in PROVEEDORES
        SELECT(?PRO2:IDTIPO_PROVEEDOR)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?PRO2:IDTIPO_PROVEEDOR
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?PRO2:IDTIPO_PROVEEDOR{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?CallLookup:2
      ThisWindow.Update()
      TIPP:IDTIPO_PROVEEDOR = PRO2:IDTIPO_PROVEEDOR
      IF SELF.Run(2,SelectRecord) = RequestCompleted
        PRO2:IDTIPO_PROVEEDOR = TIPP:IDTIPO_PROVEEDOR
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

