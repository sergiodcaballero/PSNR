

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('GESTION324.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION013.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION323.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION325.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION326.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION327.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Actualizacion CONVENIO
!!! </summary>
UpdateCONVENIO PROCEDURE 

CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
History::CON4:Record LIKE(CON4:RECORD),THREAD
QuickWindow          WINDOW('Actualizacion CONVENIO'),AT(,,356,226),FONT('Arial',8,,FONT:regular),RESIZE,CENTER, |
  GRAY,IMM,MDI,HLP('UpdateCONVENIO'),SYSTEM
                       GROUP('CONVENIO'),AT(1,0,355,68),USE(?Group3),BOXED
                         PROMPT('IDSOCIO:'),AT(3,9),USE(?CON4:IDSOCIO:Prompt),TRN
                         ENTRY(@n-14),AT(72,9,43,10),USE(CON4:IDSOCIO)
                         BUTTON('...'),AT(116,8,12,12),USE(?CallLookup)
                         STRING(@s30),AT(132,9),USE(SOC:NOMBRE)
                         PROMPT('MATRICULA:'),AT(256,9),USE(?Prompt10)
                         STRING(@n-14),AT(302,9),USE(SOC:MATRICULA)
                         PROMPT('IDTIPO CONVENIO:'),AT(3,27),USE(?CON4:IDTIPO_CONVENIO:Prompt),TRN
                         ENTRY(@n-14),AT(71,27,43,10),USE(CON4:IDTIPO_CONVENIO)
                         BUTTON('...'),AT(117,26,12,12),USE(?CallLookup:2)
                         STRING(@s50),AT(132,27,95,10),USE(TIP:DESCRIPCION)
                         PROMPT('GTO. ADM:'),AT(230,27),USE(?Prompt12)
                         STRING(@n-7.2),AT(270,27),USE(TIP:GASTO_ADMINISTRATIVO)
                         PROMPT('INT.'),AT(302,27),USE(?Prompt13)
                         BUTTON('CALCULAR DEUDA'),AT(98,48,153,15),USE(?Button3)
                         STRING(@n-7.2),AT(319,27),USE(TIP:INTERES)
                       END
                       GROUP('APROBACION'),AT(1,72,354,46),USE(?Group1),BOXED
                         PROMPT('LIBRO:'),AT(4,82),USE(?CON4:LIBRO:Prompt),TRN
                         ENTRY(@n-14),AT(41,82,64,10),USE(CON4:LIBRO)
                         PROMPT('FOLIO:'),AT(120,82),USE(?CON4:FOLIO:Prompt),TRN
                         ENTRY(@n-14),AT(146,82,64,10),USE(CON4:FOLIO)
                         PROMPT('ACTA:'),AT(231,82),USE(?CON4:ACTA:Prompt),TRN
                         ENTRY(@s20),AT(261,82,84,10),USE(CON4:ACTA)
                         PROMPT('OBSERVACION:'),AT(4,102),USE(?CON4:OBSERVACION:Prompt),TRN
                         ENTRY(@s100),AT(70,102,246,10),USE(CON4:OBSERVACION)
                       END
                       GROUP('CARGAR CONVENIO'),AT(0,122,356,79),USE(?Group2),BOXED
                         PROMPT('MONTO TOTAL ADEUDADO:'),AT(4,132),USE(?Prompt11)
                         ENTRY(@n$-10.2),AT(101,131,43,10),USE(GLO:TOTAL,,?GLO:TOTAL:2)
                         STRING(@n$-10.2),AT(153,131),USE(GLO:TOTAL),FONT(,,,FONT:bold+FONT:underline)
                         PROMPT('FECHA:'),AT(221,131),USE(?FECHA_DESDE:Prompt)
                         ENTRY(@D6),AT(249,131,43,10),USE(FECHA_DESDE),RIGHT(1),DISABLE
                         PROMPT('CANTIDAD CUOTAS:'),AT(4,151),USE(?CON4:CANTIDAD_CUOTAS:Prompt),TRN
                         ENTRY(@n-14),AT(107,151,42,10),USE(CON4:CANTIDAD_CUOTAS)
                         BUTTON('CALCULAR MONTO CUOTA'),AT(93,167,170,15),USE(?Button4),DISABLE
                         PROMPT('MONTO CUOTA:'),AT(4,188),USE(?Prompt9)
                         STRING(@n$-10.2),AT(67,188,33,10),USE(CON4:MONTO_CUOTA)
                       END
                       BUTTON('&Aceptar'),AT(47,204,49,14),USE(?OK),LEFT,ICON('ok.ico'),CURSOR('mano.cur'),DEFAULT, |
  DISABLE,FLAT,MSG('Confirma y Actualiza el Formulario'),TIP('Confirma y Actualiza el Formulario')
                       BUTTON('&Cancelar'),AT(247,203,55,14),USE(?Cancel),LEFT,ICON('cancelar.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Cancela Operacion'),TIP('Cancela Operacion')
                     END

ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Reset                  PROCEDURE(BYTE Force=0),DERIVED
Run                    PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeCompleted          PROCEDURE(),BYTE,PROC,DERIVED
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
  GlobalErrors.SetProcedureName('UpdateCONVENIO')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?CON4:IDSOCIO:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(CON4:Record,History::CON4:Record)
  SELF.AddHistoryField(?CON4:IDSOCIO,2)
  SELF.AddHistoryField(?CON4:IDTIPO_CONVENIO,3)
  SELF.AddHistoryField(?CON4:LIBRO,19)
  SELF.AddHistoryField(?CON4:FOLIO,20)
  SELF.AddHistoryField(?CON4:ACTA,21)
  SELF.AddHistoryField(?CON4:OBSERVACION,22)
  SELF.AddHistoryField(?CON4:CANTIDAD_CUOTAS,5)
  SELF.AddHistoryField(?CON4:MONTO_CUOTA,6)
  SELF.AddUpdateFile(Access:CONVENIO)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:CONVENIO.Open                                     ! File CONVENIO used by this procedure, so make sure it's RelationManager is open
  Relate:RANKING.Open                                      ! File RANKING used by this procedure, so make sure it's RelationManager is open
  Relate:SOCIOS.Open                                       ! File SOCIOS used by this procedure, so make sure it's RelationManager is open
  Relate:TIPO_CONVENIO.Open                                ! File TIPO_CONVENIO used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:CONVENIO
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
    ?CON4:IDSOCIO{PROP:ReadOnly} = True
    DISABLE(?CallLookup)
    ?CON4:IDTIPO_CONVENIO{PROP:ReadOnly} = True
    DISABLE(?CallLookup:2)
    DISABLE(?Button3)
    ?CON4:LIBRO{PROP:ReadOnly} = True
    ?CON4:FOLIO{PROP:ReadOnly} = True
    ?CON4:ACTA{PROP:ReadOnly} = True
    ?CON4:OBSERVACION{PROP:ReadOnly} = True
    ?GLO:TOTAL:2{PROP:ReadOnly} = True
    ?FECHA_DESDE{PROP:ReadOnly} = True
    ?CON4:CANTIDAD_CUOTAS{PROP:ReadOnly} = True
    DISABLE(?Button4)
    ?CON4:MONTO_CUOTA{PROP:ReadOnly} = True
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdateCONVENIO',QuickWindow)               ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  SELF.AddItem(ToolbarForm)
  SELF.SetAlerts()
  !! CARGO VARIABLE FECHA CON LA FECHA ACTUAL
  FECHA_DESDE = TODAY()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:CONVENIO.Close
    Relate:RANKING.Close
    Relate:SOCIOS.Close
    Relate:TIPO_CONVENIO.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateCONVENIO',QuickWindow)            ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF QuickWindow{Prop:AcceptAll} THEN RETURN.
  CON5:IDSOLICITUD = CON4:IDSOLICITUD                      ! Assign linking field value
  Access:CONVENIO_DETALLE.Fetch(CON5:FK_CONVENIO_DETALLE)
  TIP:IDTIPO_CONVENIO = CON4:IDTIPO_CONVENIO               ! Assign linking field value
  Access:TIPO_CONVENIO.Fetch(TIP:PK_T_CONVENIO)
  PARENT.Reset(Force)


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
      SelectTIPO_CONVENIO
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
    OF ?Button3
      GLO:CANCELA_CUOTA = TIP:CANCELA_CUOTA
      GLO:CALCULA_DEUDA = TIP:CALCULA_DEUDA
      GLO:IDSOCIO = CON4:IDSOCIO
      GLO:TOTAL = 0
      ENABLE(?Button4)
      
      CALCULAR_CUOTA()
      !!! SACA INTERES Y GASTO ADMINISTRATIVO
      GASTOS_ADMINISTRATIVOS$ = ((GLO:TOTAL * TIP:GASTO_ADMINISTRATIVO)/100)
      INTERESES$ = ((GLO:TOTAL * TIP:INTERES)/100)
      GLO:TOTAL = GLO:TOTAL + GASTOS_ADMINISTRATIVOS$ + INTERESES$
      
      !! CARGA LAS VARIABLES EN LA TABLA
      CON4:INTERES =   INTERESES$
      CON4:GASTOS_ADMINISTRATIVOS =  GASTOS_ADMINISTRATIVOS$ 
      ENABLE(?OK)
      DISABLE(?Group3)
      
      IF TIP:IDTIPO_CONVENIO = 3 THEN
          ENABLE(?FECHA_DESDE)
      END
    OF ?Button4
      CON4:MONTO_CUOTA = GLO:TOTAL / CON4:CANTIDAD_CUOTAS
      
      
    OF ?OK
      CON4:MONTO_TOTAL = GLO:TOTAL
      CON4:GASTOS_ADMINISTRATIVOS = TIP:GASTO_ADMINISTRATIVO
      IF CON4:LIBRO <> 0 THEN
          CON4:APROBADO = 'SI'
      END
      CON4:FECHA  =  FECHA_DESDE
      CON4:HORA   =  CLOCK()
      CON4:MES    =  MONTH(FECHA_DESDE)
      CON4:ANO    =  YEAR(FECHA_DESDE)
      IF CON4:MES = 12 THEN
             CON4:MES = 1
             CON4:ANO = CON4:ANO + 1
      ELSE
             CON4:MES = CON4:MES + 1
      END
      CON4:PERIODO =   FORMAT(CON4:ANO,@N04)&FORMAT(CON4:MES,@N02)
      
      
      
      !!! CARGA EL NRO DE LA SOLICITUD POR STRORE PROCEDURE
      RANKING{PROP:SQL} = 'CALL SP_GEN_CONVENIO_ID'
      NEXT(RANKING)
      CON4:IDSOLICITUD = RAN:C1
      GLO:IDSOLICITUD = RAN:C1
      
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?CON4:IDSOCIO
      SOC:IDSOCIO = CON4:IDSOCIO
      IF Access:SOCIOS.TryFetch(SOC:PK_SOCIOS)
        IF SELF.Run(1,SelectRecord) = RequestCompleted
          CON4:IDSOCIO = SOC:IDSOCIO
        ELSE
          SELECT(?CON4:IDSOCIO)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
      IF Access:CONVENIO.TryValidateField(2)               ! Attempt to validate CON4:IDSOCIO in CONVENIO
        SELECT(?CON4:IDSOCIO)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?CON4:IDSOCIO
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?CON4:IDSOCIO{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?CallLookup
      ThisWindow.Update()
      SOC:IDSOCIO = CON4:IDSOCIO
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        CON4:IDSOCIO = SOC:IDSOCIO
      END
      ThisWindow.Reset(1)
    OF ?CON4:IDTIPO_CONVENIO
      TIP:IDTIPO_CONVENIO = CON4:IDTIPO_CONVENIO
      IF Access:TIPO_CONVENIO.TryFetch(TIP:PK_T_CONVENIO)
        IF SELF.Run(2,SelectRecord) = RequestCompleted
          CON4:IDTIPO_CONVENIO = TIP:IDTIPO_CONVENIO
        ELSE
          SELECT(?CON4:IDTIPO_CONVENIO)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
      IF Access:CONVENIO.TryValidateField(3)               ! Attempt to validate CON4:IDTIPO_CONVENIO in CONVENIO
        SELECT(?CON4:IDTIPO_CONVENIO)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?CON4:IDTIPO_CONVENIO
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?CON4:IDTIPO_CONVENIO{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?CallLookup:2
      ThisWindow.Update()
      TIP:IDTIPO_CONVENIO = CON4:IDTIPO_CONVENIO
      IF SELF.Run(2,SelectRecord) = RequestCompleted
        CON4:IDTIPO_CONVENIO = TIP:IDTIPO_CONVENIO
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
  !!! GRABA DETALLE
  IF  Self.Request = InsertRecord THEN
      MES#     = CON4:MES
      ANO#     = CON4:ANO
      PERIODO# = CON4:PERIODO
      CON5:DEUDA_INICIAL =  CON4:MONTO_TOTAL
      LOOP I# = 1 TO CON4:CANTIDAD_CUOTAS
          CON5:IDSOLICITUD    = GLO:IDSOLICITUD
          CON5:MES            = MES#
          CON5:ANO            = ANO#
          CON5:PERIODO        = PERIODO#
          CON5:IDSOCIO        = CON4:IDSOCIO
          CON5:NRO_CUOTA      = I# 
          CON5:MONTO_CUOTA    = CON4:MONTO_CUOTA
          CON5:MONTO_TOTAL    = CON4:MONTO_TOTAL
          CON5:DEUDA_INICIAL  = CON5:DEUDA_INICIAL - CON4:MONTO_CUOTA
          CON5:FECHA          = CON4:FECHA
          CON5:HORA           = CON4:HORA
          CON5:OBSERVACION    = 'CUOTA '&I#&'/'&CON4:CANTIDAD_CUOTAS
          ADD(CONVENIO_DETALLE)
          IF ERRORCODE() THEN MESSAGE (ERROR()).
  
          !!! AUMETA EL MES Y AÑO
          IF CON5:MES = 12 THEN
             MES# = 1
             ANO#= ANO# + 1
          ELSE
              MES# = MES# + 1
          END
          PERIODO# =   FORMAT(ANO#,@N04)&FORMAT(MES#,@N02)
  
      END !! LOOP
      IMPRIMIR_CONVENIO
      !!! IMPRIME BONOS
   END
  
  
  CANCELAR_CUOTA()
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

