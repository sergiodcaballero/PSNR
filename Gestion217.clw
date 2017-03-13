

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('GESTION217.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION216.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION218.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Actualizacion CURSO_INSCRIPCION
!!! </summary>
UpdateCURSO_INSCRIPCION PROCEDURE 

CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
LOC:Monto            REAL                                  ! 
History::CURI:Record LIKE(CURI:RECORD),THREAD
QuickWindow          WINDOW('Actualizacion CURSO INSCRIPCION'),AT(,,287,164),FONT('MS Sans Serif',8,,FONT:regular), |
  RESIZE,CENTER,GRAY,IMM,MDI,HLP('UpdateCURSO_INSCRIPCION'),SYSTEM
                       BUTTON('&Aceptar'),AT(183,144,49,14),USE(?OK),LEFT,ICON('ok.ico'),CURSOR('mano.cur'),DEFAULT, |
  FLAT,MSG('Confirma y Actualiza el Formulario'),TIP('Confirma y Actualiza el Formulario')
                       BUTTON('&Cancelar'),AT(233,144,49,14),USE(?Cancel),LEFT,ICON('cancelar.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Cancela Operacion'),TIP('Cancela Operacion')
                       PROMPT('CUOTAS:'),AT(1,48),USE(?CURI:CUOTAS:Prompt),TRN
                       ENTRY(@n-14),AT(61,48,41,10),USE(CURI:CUOTAS),RIGHT(1)
                       PROMPT('OBSERVACION'),AT(3,63),USE(?Prompt5)
                       TEXT,AT(65,65,219,70),USE(CURI:OBSERVACION),BOXED
                       LINE,AT(3,139,286,0),USE(?Line1),COLOR(COLOR:Black)
                       PROMPT('INSCRIPTO:'),AT(1,18),USE(?CURI:ID_PROVEEDOR:Prompt),TRN
                       ENTRY(@n-14),AT(61,18,64,10),USE(CURI:ID_PROVEEDOR),RIGHT(1)
                       BUTTON('...'),AT(130,16,12,12),USE(?CallLookup:2)
                       STRING(@s50),AT(145,17),USE(PRO2:DESCRIPCION)
                       LINE,AT(0,30,284,0),USE(?Line2),COLOR(COLOR:Black)
                       PROMPT('IDCURSO:'),AT(1,2),USE(?CURI:IDCURSO:Prompt),TRN
                       ENTRY(@n-14),AT(61,2,64,10),USE(CURI:IDCURSO),RIGHT(1)
                       BUTTON('...'),AT(130,1,12,12),USE(?CallLookup)
                       STRING(@s50),AT(145,2),USE(CUR:DESCRIPCION)
                       PROMPT('DESCUENTO:'),AT(1,35),USE(?CURI:DESCUENTO:Prompt),TRN
                       ENTRY(@n-10.2),AT(61,33,40,10),USE(CURI:DESCUENTO),DECIMAL(12)
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
  GlobalErrors.SetProcedureName('UpdateCURSO_INSCRIPCION')
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
  SELF.AddHistoryFile(CURI:Record,History::CURI:Record)
  SELF.AddHistoryField(?CURI:CUOTAS,11)
  SELF.AddHistoryField(?CURI:OBSERVACION,13)
  SELF.AddHistoryField(?CURI:ID_PROVEEDOR,2)
  SELF.AddHistoryField(?CURI:IDCURSO,3)
  SELF.AddHistoryField(?CURI:DESCUENTO,9)
  SELF.AddUpdateFile(Access:CURSO_INSCRIPCION)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:CURSO.Open                                        ! File CURSO used by this procedure, so make sure it's RelationManager is open
  Relate:CURSO_CUOTA.SetOpenRelated()
  Relate:CURSO_CUOTA.Open                                  ! File CURSO_CUOTA used by this procedure, so make sure it's RelationManager is open
  Relate:CURSO_INSCRIPCION.Open                            ! File CURSO_INSCRIPCION used by this procedure, so make sure it's RelationManager is open
  Relate:CURSO_MODULOS.Open                                ! File CURSO_MODULOS used by this procedure, so make sure it's RelationManager is open
  Relate:PROVEEDORES.Open                                  ! File PROVEEDORES used by this procedure, so make sure it's RelationManager is open
  Relate:RANKING.Open                                      ! File RANKING used by this procedure, so make sure it's RelationManager is open
  Access:CURSO_INSCRIPCION_DETALLE.UseFile                 ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Primary &= Relate:CURSO_INSCRIPCION
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
    ?CURI:CUOTAS{PROP:ReadOnly} = True
    ?CURI:ID_PROVEEDOR{PROP:ReadOnly} = True
    DISABLE(?CallLookup:2)
    ?CURI:IDCURSO{PROP:ReadOnly} = True
    DISABLE(?CallLookup)
    ?CURI:DESCUENTO{PROP:ReadOnly} = True
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdateCURSO_INSCRIPCION',QuickWindow)      ! Restore window settings from non-volatile store
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
    Relate:CURSO_CUOTA.Close
    Relate:CURSO_INSCRIPCION.Close
    Relate:CURSO_MODULOS.Close
    Relate:PROVEEDORES.Close
    Relate:RANKING.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateCURSO_INSCRIPCION',QuickWindow)   ! Save window data to non-volatile store
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
      SelectPROVEEDORES
      SelectCURSO
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
          CURI:FECHA     = TODAY()
          CURI:HORA      = CLOCK()
          CURI:IDUSUARIO = GLO:IDUSUARIO
          !!! BUSCO MONTO DEL CURSO
          CUR:IDCURSO = CURI:IDCURSO
          ACCESS:CURSO.TRYFETCH(CUR:PK_CURSO)
          CURI:MONTO_TOTAL = CUR:MONTO_TOTAL
          IF CURI:CUOTAS <> 0 THEN
              CURI:MONTO_CUOTA = (CURI:MONTO_TOTAL-CURI:DESCUENTO)/CURI:CUOTAS
          END
          IF CURI:CUOTAS = 0 THEN
              CURI:CUOTAS = 1
          END
          !!! CARGO ID NUMERO INSCRIPCION
          RANKING{PROP:SQL} = 'CALL SP_GEN_CURSO_INSCRIPCION_ID'   
          NEXT(RANKING)
          CURI:IDINSCRIPCION = RAN:C1
          GLO:IDSOLICITUD = RAN:C1
      END
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?OK
      ThisWindow.Update()
      IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing THEN
         POST(EVENT:CloseWindow)
      END
    OF ?CURI:ID_PROVEEDOR
      PRO2:IDPROVEEDOR = CURI:ID_PROVEEDOR
      IF Access:PROVEEDORES.TryFetch(PRO2:PK_PROVEEDOR)
        IF SELF.Run(1,SelectRecord) = RequestCompleted
          CURI:ID_PROVEEDOR = PRO2:IDPROVEEDOR
        ELSE
          SELECT(?CURI:ID_PROVEEDOR)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
      IF Access:CURSO_INSCRIPCION.TryValidateField(2)      ! Attempt to validate CURI:ID_PROVEEDOR in CURSO_INSCRIPCION
        SELECT(?CURI:ID_PROVEEDOR)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?CURI:ID_PROVEEDOR
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?CURI:ID_PROVEEDOR{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?CallLookup:2
      ThisWindow.Update()
      PRO2:IDPROVEEDOR = CURI:ID_PROVEEDOR
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        CURI:ID_PROVEEDOR = PRO2:IDPROVEEDOR
      END
      ThisWindow.Reset(1)
    OF ?CURI:IDCURSO
      CUR:IDCURSO = CURI:IDCURSO
      IF Access:CURSO.TryFetch(CUR:PK_CURSO)
        IF SELF.Run(2,SelectRecord) = RequestCompleted
          CURI:IDCURSO = CUR:IDCURSO
        ELSE
          SELECT(?CURI:IDCURSO)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
      IF Access:CURSO_INSCRIPCION.TryValidateField(3)      ! Attempt to validate CURI:IDCURSO in CURSO_INSCRIPCION
        SELECT(?CURI:IDCURSO)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?CURI:IDCURSO
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?CURI:IDCURSO{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?CallLookup
      ThisWindow.Update()
      CUR:IDCURSO = CURI:IDCURSO
      IF SELF.Run(2,SelectRecord) = RequestCompleted
        CURI:IDCURSO = CUR:IDCURSO
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
  If  Self.Request=insertRecord AND SELF.RESPONSE = RequestCompleted Then
      !!! Cargo los modulos en Detalle Inscripción
      CUR2:IDCURSO = CURI:IDCURSO
      SET(CUR2:FK_CURSO_MODULOS_CURSO,CUR2:FK_CURSO_MODULOS_CURSO)
      LOOP
          IF ACCESS:CURSO_MODULOS.NEXT() THEN BREAK.
          IF CUR2:IDCURSO <> CURI:IDCURSO THEN BREAK.
          CURD:IDINSCRIPCION         = GLO:IDSOLICITUD 
          CURD:IDCURSO               = CURI:IDCURSO
          CURD:ID_MODULO             = CUR2:ID_MODULO
          CURD:FECHA_INSCRIPCION     = CURI:FECHA
          CURD:MONTO                 = CUR2:MONTO  
          CURD:PAGADO                = ''
          CURD:CANTIDAD_CUOTAS       = CURI:CUOTAS
          CURD:SALDO_CUOTAS          = CURI:CUOTAS
          ACCESS:CURSO_INSCRIPCION_DETALLE.INSERT()
          !!! CARGO CUOTAS.
          Loop i# = 1 to CURI:CUOTAS
              CUR1:IDINSCRIPCION = CURD:IDINSCRIPCION
              CUR1:IDCURSO       = CURD:IDCURSO
              CUR1:IDMODULO      = CURD:ID_MODULO
              CUR1:IDCUOTA       = i#
              CUR1:MONTO         = CURD:MONTO/CURD:CANTIDAD_CUOTAS
              CUR1:DESCUENTO = 0
              ACCESS:CURSO_CUOTA.INSERT()
              
          end
  
      END !! LOOP
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

