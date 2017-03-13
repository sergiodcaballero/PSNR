

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABQUERY.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('GESTION270.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION013.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION268.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION271.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the PAGO_CONVENIO File
!!! </summary>
PAGO_CONVENIO PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(PAGO_CONVENIO)
                       PROJECT(PAGCON:IDPAGO)
                       PROJECT(PAGCON:IDSOCIO)
                       PROJECT(PAGCON:IDSOLICITUD)
                       PROJECT(PAGCON:NRO_CUOTA)
                       PROJECT(PAGCON:FECHA)
                       PROJECT(PAGCON:MONTO_CUOTA)
                       PROJECT(PAGCON:MES)
                       PROJECT(PAGCON:ANO)
                       PROJECT(PAGCON:PERIODO)
                       PROJECT(PAGCON:OBSERVACION)
                       JOIN(CON4:PK_CONVENIO,PAGCON:IDSOLICITUD)
                         PROJECT(CON4:IDSOLICITUD)
                         PROJECT(CON4:IDTIPO_CONVENIO)
                         JOIN(TIP:PK_T_CONVENIO,CON4:IDTIPO_CONVENIO)
                           PROJECT(TIP:DESCRIPCION)
                           PROJECT(TIP:IDTIPO_CONVENIO)
                         END
                       END
                       JOIN(SOC:PK_SOCIOS,PAGCON:IDSOCIO)
                         PROJECT(SOC:MATRICULA)
                         PROJECT(SOC:NOMBRE)
                         PROJECT(SOC:IDSOCIO)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
PAGCON:IDPAGO          LIKE(PAGCON:IDPAGO)            !List box control field - type derived from field
PAGCON:IDSOCIO         LIKE(PAGCON:IDSOCIO)           !List box control field - type derived from field
SOC:MATRICULA          LIKE(SOC:MATRICULA)            !List box control field - type derived from field
SOC:NOMBRE             LIKE(SOC:NOMBRE)               !List box control field - type derived from field
PAGCON:IDSOLICITUD     LIKE(PAGCON:IDSOLICITUD)       !List box control field - type derived from field
TIP:DESCRIPCION        LIKE(TIP:DESCRIPCION)          !List box control field - type derived from field
PAGCON:NRO_CUOTA       LIKE(PAGCON:NRO_CUOTA)         !List box control field - type derived from field
PAGCON:FECHA           LIKE(PAGCON:FECHA)             !List box control field - type derived from field
PAGCON:MONTO_CUOTA     LIKE(PAGCON:MONTO_CUOTA)       !List box control field - type derived from field
PAGCON:MES             LIKE(PAGCON:MES)               !List box control field - type derived from field
PAGCON:ANO             LIKE(PAGCON:ANO)               !List box control field - type derived from field
PAGCON:PERIODO         LIKE(PAGCON:PERIODO)           !List box control field - type derived from field
PAGCON:OBSERVACION     LIKE(PAGCON:OBSERVACION)       !List box control field - type derived from field
CON4:IDSOLICITUD       LIKE(CON4:IDSOLICITUD)         !Related join file key field - type derived from field
TIP:IDTIPO_CONVENIO    LIKE(TIP:IDTIPO_CONVENIO)      !Related join file key field - type derived from field
SOC:IDSOCIO            LIKE(SOC:IDSOCIO)              !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('CARGA DE  PAGO DE CONVENIO '),AT(,,472,208),FONT('Arial',8,,FONT:regular),RESIZE,CENTER, |
  GRAY,IMM,MDI,HLP('PAGO_CONVENIO'),SYSTEM
                       LIST,AT(8,40,458,124),USE(?Browse:1),HVSCROLL,FORMAT('35L(2)|M~IDPAGO~C(0)@n-7@[64L(2)|' & |
  'M~IDSOCIO~C(0)@n-7@56L(2)|M~MATRICULA~C(0)@n-7@120L(2)|M~NOMBRE~C(0)@s30@]|M~COLEGIA' & |
  'DO~[64L(2)|M~IDSOL~C(0)@n-7@126L(2)|M~SOL DESC.~C(0)@s30@](289)|M~SOLICITUD~49L(2)|M' & |
  '~NRO CUOTA~C(0)@n-5@40R(2)|M~FECHA~C(0)@d17@59L(1)|M~MONTO CUOTA~C(0)@n$-7.2@16L(2)|' & |
  'M~MES~@s2@20L(2)|M~ANO~@s4@64L(2)|M~PERIODO~C(0)@n-14@80L(2)|M~OBSERVACION~@s50@'),FROM(Queue:Browse:1), |
  IMM,MSG('Administrador de PAGO_CONVENIO'),VCR
                       BUTTON('&Ver'),AT(304,169,49,14),USE(?View:3),LEFT,ICON('v.ico'),CURSOR('mano.cur'),FLAT,MSG('Visualizar'), |
  TIP('Visualizar')
                       BUTTON('&Agregar'),AT(414,169,49,14),USE(?Insert:4),LEFT,ICON('a.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Agrega Registro'),TIP('Agrega Registro')
                       BUTTON('&Cambiar'),AT(225,168,49,14),USE(?Change:4),LEFT,ICON('c.ico'),CURSOR('mano.cur'), |
  DEFAULT,DISABLE,FLAT,HIDE,MSG('Cambia Registro'),TIP('Cambia Registro')
                       SHEET,AT(4,4,467,182),USE(?CurrentTab)
                         TAB('ID PAGO'),USE(?Tab:1)
                           PROMPT('IDPAGO:'),AT(9,25),USE(?PAGCON:IDPAGO:Prompt)
                           ENTRY(@n-14),AT(59,24,60,10),USE(PAGCON:IDPAGO),RIGHT(1)
                         END
                         TAB('SOCIO'),USE(?Tab:2)
                           PROMPT('IDSOCIO:'),AT(9,27),USE(?PAGCON:IDSOCIO:Prompt)
                           ENTRY(@n-14),AT(46,26,60,10),USE(PAGCON:IDSOCIO),RIGHT(1)
                         END
                         TAB('CONVENIO'),USE(?Tab:3)
                           PROMPT('IDSOLICITUD:'),AT(10,25),USE(?PAGCON:IDSOLICITUD:Prompt)
                           ENTRY(@n-14),AT(60,24,60,10),USE(PAGCON:IDSOLICITUD),RIGHT(1)
                         END
                       END
                       BUTTON('&Salir'),AT(415,191,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Salir'),TIP('Salir')
                       BUTTON('&Filtro'),AT(9,168,49,14),USE(?Query),LEFT,ICON('Q.ICO'),FLAT
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
QBE2                 QueryListClass                        ! QBE List Class. 
QBV2                 QueryListVisual                       ! QBE Visual Class
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
                     END

BRW1::Sort0:Locator  EntryLocatorClass                     ! Default Locator
BRW1::Sort1:Locator  EntryLocatorClass                     ! Conditional Locator - CHOICE(?CurrentTab) = 2
BRW1::Sort2:Locator  EntryLocatorClass                     ! Conditional Locator - CHOICE(?CurrentTab) = 3
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
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

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('PAGO_CONVENIO')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('PAGCON:IDPAGO',PAGCON:IDPAGO)                      ! Added by: BrowseBox(ABC)
  BIND('PAGCON:NRO_CUOTA',PAGCON:NRO_CUOTA)                ! Added by: BrowseBox(ABC)
  BIND('PAGCON:MONTO_CUOTA',PAGCON:MONTO_CUOTA)            ! Added by: BrowseBox(ABC)
  BIND('TIP:IDTIPO_CONVENIO',TIP:IDTIPO_CONVENIO)          ! Added by: BrowseBox(ABC)
  BIND('SOC:IDSOCIO',SOC:IDSOCIO)                          ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:PAGO_CONVENIO.Open                                ! File PAGO_CONVENIO used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:PAGO_CONVENIO,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  QBE2.Init(QBV2, INIMgr,'PAGO_CONVENIO', GlobalErrors)
  QBE2.QkSupport = True
  QBE2.QkMenuIcon = 'QkQBE.ico'
  QBE2.QkIcon = 'QkLoad.ico'
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,PAGCON:FK_PAGO_CONVENIO_SOCIO)        ! Add the sort order for PAGCON:FK_PAGO_CONVENIO_SOCIO for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(?PAGCON:IDSOCIO,PAGCON:IDSOCIO,,BRW1) ! Initialize the browse locator using ?PAGCON:IDSOCIO using key: PAGCON:FK_PAGO_CONVENIO_SOCIO , PAGCON:IDSOCIO
  BRW1.AddSortOrder(,PAGCON:FK_PAGO_CONVENIO_CONVENIO)     ! Add the sort order for PAGCON:FK_PAGO_CONVENIO_CONVENIO for sort order 2
  BRW1.AddLocator(BRW1::Sort2:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort2:Locator.Init(?PAGCON:IDSOLICITUD,PAGCON:IDSOLICITUD,,BRW1) ! Initialize the browse locator using ?PAGCON:IDSOLICITUD using key: PAGCON:FK_PAGO_CONVENIO_CONVENIO , PAGCON:IDSOLICITUD
  BRW1.AddSortOrder(,PAGCON:PK_PAGO_CONVENIO)              ! Add the sort order for PAGCON:PK_PAGO_CONVENIO for sort order 3
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 3
  BRW1::Sort0:Locator.Init(?PAGCON:IDPAGO,PAGCON:IDPAGO,,BRW1) ! Initialize the browse locator using ?PAGCON:IDPAGO using key: PAGCON:PK_PAGO_CONVENIO , PAGCON:IDPAGO
  BRW1.AddField(PAGCON:IDPAGO,BRW1.Q.PAGCON:IDPAGO)        ! Field PAGCON:IDPAGO is a hot field or requires assignment from browse
  BRW1.AddField(PAGCON:IDSOCIO,BRW1.Q.PAGCON:IDSOCIO)      ! Field PAGCON:IDSOCIO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:MATRICULA,BRW1.Q.SOC:MATRICULA)        ! Field SOC:MATRICULA is a hot field or requires assignment from browse
  BRW1.AddField(SOC:NOMBRE,BRW1.Q.SOC:NOMBRE)              ! Field SOC:NOMBRE is a hot field or requires assignment from browse
  BRW1.AddField(PAGCON:IDSOLICITUD,BRW1.Q.PAGCON:IDSOLICITUD) ! Field PAGCON:IDSOLICITUD is a hot field or requires assignment from browse
  BRW1.AddField(TIP:DESCRIPCION,BRW1.Q.TIP:DESCRIPCION)    ! Field TIP:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(PAGCON:NRO_CUOTA,BRW1.Q.PAGCON:NRO_CUOTA)  ! Field PAGCON:NRO_CUOTA is a hot field or requires assignment from browse
  BRW1.AddField(PAGCON:FECHA,BRW1.Q.PAGCON:FECHA)          ! Field PAGCON:FECHA is a hot field or requires assignment from browse
  BRW1.AddField(PAGCON:MONTO_CUOTA,BRW1.Q.PAGCON:MONTO_CUOTA) ! Field PAGCON:MONTO_CUOTA is a hot field or requires assignment from browse
  BRW1.AddField(PAGCON:MES,BRW1.Q.PAGCON:MES)              ! Field PAGCON:MES is a hot field or requires assignment from browse
  BRW1.AddField(PAGCON:ANO,BRW1.Q.PAGCON:ANO)              ! Field PAGCON:ANO is a hot field or requires assignment from browse
  BRW1.AddField(PAGCON:PERIODO,BRW1.Q.PAGCON:PERIODO)      ! Field PAGCON:PERIODO is a hot field or requires assignment from browse
  BRW1.AddField(PAGCON:OBSERVACION,BRW1.Q.PAGCON:OBSERVACION) ! Field PAGCON:OBSERVACION is a hot field or requires assignment from browse
  BRW1.AddField(CON4:IDSOLICITUD,BRW1.Q.CON4:IDSOLICITUD)  ! Field CON4:IDSOLICITUD is a hot field or requires assignment from browse
  BRW1.AddField(TIP:IDTIPO_CONVENIO,BRW1.Q.TIP:IDTIPO_CONVENIO) ! Field TIP:IDTIPO_CONVENIO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:IDSOCIO,BRW1.Q.SOC:IDSOCIO)            ! Field SOC:IDSOCIO is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('PAGO_CONVENIO',QuickWindow)                ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.QueryControl = ?Query
  BRW1.UpdateQuery(QBE2,1)
  BRW1.AskProcedure = 3                                    ! Will call: UpdatePAGO_CONVENIO
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  SELF.SetAlerts()
  IF GLO:NIVEL < 3 THEN
      MESSAGE('SU NIVEL NO PERMITE ENTRAR A ESTE PROCEDIMIENTO','SEGURIDAD',ICON:EXCLAMATION,BUTTON:No,BUTTON:No,1)
      POST(EVENT:CLOSEWINDOW,1)
  END
     
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:PAGO_CONVENIO.Close
  END
  IF SELF.Opened
    INIMgr.Update('PAGO_CONVENIO',QuickWindow)             ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
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
      SelectCONVENIO
      UpdatePAGO_CONVENIO
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
    OF ?PAGCON:IDSOCIO
      PAGCON:IDSOCIO = PAGCON:IDSOCIO
      IF Access:PAGO_CONVENIO.TryFetch(PAGCON:FK_PAGO_CONVENIO_SOCIO)
        IF SELF.Run(1,SelectRecord) = RequestCompleted
          PAGCON:IDSOCIO = PAGCON:IDSOCIO
        ELSE
          SELECT(?PAGCON:IDSOCIO)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
    OF ?PAGCON:IDSOLICITUD
      IF PAGCON:IDSOLICITUD OR ?PAGCON:IDSOLICITUD{PROP:Req}
        PAGCON:IDSOLICITUD = PAGCON:IDSOLICITUD
        IF Access:PAGO_CONVENIO.TryFetch(PAGCON:FK_PAGO_CONVENIO_CONVENIO)
          IF SELF.Run(2,SelectRecord) = RequestCompleted
            PAGCON:IDSOLICITUD = PAGCON:IDSOLICITUD
          ELSE
            SELECT(?PAGCON:IDSOLICITUD)
            CYCLE
          END
        END
      END
      ThisWindow.Reset(0)
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


BRW1.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert:4
    SELF.ChangeControl=?Change:4
  END
  SELF.ViewControl = ?View:3                               ! Setup the control used to initiate view only mode


BRW1.ResetSort PROCEDURE(BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  IF CHOICE(?CurrentTab) = 2
    RETURN SELF.SetSort(1,Force)
  ELSIF CHOICE(?CurrentTab) = 3
    RETURN SELF.SetSort(2,Force)
  ELSE
    RETURN SELF.SetSort(3,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

