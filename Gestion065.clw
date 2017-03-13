

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('GESTION065.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION057.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION063.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION064.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Administrador de MS
!!! </summary>
MS PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(MS)
                       PROJECT(MS:MS)
                       PROJECT(MS:CONTENIDO)
                       PROJECT(MS:ORIGEN)
                       PROJECT(MS:NUMERO)
                       PROJECT(MS:FECHA)
                       PROJECT(MS:IDTIPO)
                       PROJECT(MS:IDDPTO)
                       PROJECT(MS:IDESTADO)
                       PROJECT(MS:IDUSUARIO)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
MS:MS                  LIKE(MS:MS)                    !List box control field - type derived from field
MET:DESCRIPCION        LIKE(MET:DESCRIPCION)          !List box control field - type derived from field
MS:CONTENIDO           LIKE(MS:CONTENIDO)             !List box control field - type derived from field
MS:ORIGEN              LIKE(MS:ORIGEN)                !List box control field - type derived from field
MS:NUMERO              LIKE(MS:NUMERO)                !List box control field - type derived from field
MS:FECHA               LIKE(MS:FECHA)                 !List box control field - type derived from field
MS:IDTIPO              LIKE(MS:IDTIPO)                !Browse key field - type derived from field
MS:IDDPTO              LIKE(MS:IDDPTO)                !Browse key field - type derived from field
MS:IDESTADO            LIKE(MS:IDESTADO)              !Browse key field - type derived from field
MS:IDUSUARIO           LIKE(MS:IDUSUARIO)             !Browse key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Administrador de MS'),AT(,,358,198),FONT('Arial',8,COLOR:Black,FONT:bold),RESIZE,CENTER, |
  GRAY,IMM,MDI,HLP('MS'),SYSTEM
                       LIST,AT(8,30,342,124),USE(?Browse:1),HVSCROLL,FORMAT('33L(2)|M~MS~C(0)@n-7@89L(2)|M~TIP' & |
  'O~C(0)@s20@189L(2)|M~CONTENIDO~@s255@80L(2)|M~ORIGEN~@s100@80L(2)|M~NUMERO~@s50@80R(' & |
  '2)|M~FECHA~C(0)@d17@'),FROM(Queue:Browse:1),IMM,MSG('Administrador de MS'),VCR
                       BUTTON('&Ver'),AT(142,158,49,14),USE(?View:2),LEFT,ICON('v.ico'),CURSOR('mano.cur'),FLAT,MSG('Visualizar'), |
  TIP('Visualizar')
                       BUTTON('&Agregar'),AT(195,158,49,14),USE(?Insert:3),LEFT,ICON('a.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Agrega Registro'),TIP('Agrega Registro')
                       BUTTON('&Cambiar'),AT(248,158,49,14),USE(?Change:3),LEFT,ICON('c.ico'),CURSOR('mano.cur'), |
  DEFAULT,FLAT,MSG('Cambia Registro'),TIP('Cambia Registro')
                       BUTTON('&Borrar'),AT(301,158,49,14),USE(?Delete:3),LEFT,ICON('b.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Borra Registro'),TIP('Borra Registro')
                       SHEET,AT(4,4,350,172),USE(?CurrentTab)
                         TAB('ID'),USE(?Tab:1)
                         END
                         TAB('TIPO'),USE(?Tab:2)
                           BUTTON('Seleccionar TIPO'),AT(8,158,118,14),USE(?SelectMETIPO),MSG('Select Parent Field'), |
  TIP('Selecciona')
                         END
                         TAB('FECHA'),USE(?Tab:3)
                         END
                         TAB('NUMERO ME '),USE(?Tab:4)
                           BUTTON('Seleccionar Nº ME'),AT(8,158,118,14),USE(?SelectME),MSG('Select Parent Field'),TIP('Selecciona')
                         END
                       END
                       BUTTON('&Salir'),AT(305,180,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Salir'),TIP('Salir')
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
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::Sort2:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 3
BRW1::Sort3:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 4
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
  GlobalErrors.SetProcedureName('MS')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('MS:MS',MS:MS)                                      ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:ME.Open                                           ! File ME used by this procedure, so make sure it's RelationManager is open
  Relate:MEDPTO.Open                                       ! File MEDPTO used by this procedure, so make sure it's RelationManager is open
  Relate:MEESTADO.Open                                     ! File MEESTADO used by this procedure, so make sure it's RelationManager is open
  Relate:METIPO.Open                                       ! File METIPO used by this procedure, so make sure it's RelationManager is open
  Relate:MS.Open                                           ! File MS used by this procedure, so make sure it's RelationManager is open
  Relate:USUARIO.Open                                      ! File USUARIO used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:MS,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,MS:FK_MS_TIPO)                        ! Add the sort order for MS:FK_MS_TIPO for sort order 1
  BRW1.AddRange(MS:IDTIPO,Relate:MS,Relate:METIPO)         ! Add file relationship range limit for sort order 1
  BRW1.AddSortOrder(,MS:IDX_MS_ORIGEN)                     ! Add the sort order for MS:IDX_MS_ORIGEN for sort order 2
  BRW1.AddLocator(BRW1::Sort2:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort2:Locator.Init(,MS:ORIGEN,,BRW1)               ! Initialize the browse locator using  using key: MS:IDX_MS_ORIGEN , MS:ORIGEN
  BRW1.AddSortOrder(,MS:IDX_MS_FECHA)                      ! Add the sort order for MS:IDX_MS_FECHA for sort order 3
  BRW1.AddLocator(BRW1::Sort3:Locator)                     ! Browse has a locator for sort order 3
  BRW1::Sort3:Locator.Init(,MS:FECHA,,BRW1)                ! Initialize the browse locator using  using key: MS:IDX_MS_FECHA , MS:FECHA
  BRW1.AddSortOrder(,MS:FK_MS_DPTO)                        ! Add the sort order for MS:FK_MS_DPTO for sort order 4
  BRW1.AddRange(MS:IDDPTO,Relate:MS,Relate:MEDPTO)         ! Add file relationship range limit for sort order 4
  BRW1.AddSortOrder(,MS:FK_MS_ESTADO)                      ! Add the sort order for MS:FK_MS_ESTADO for sort order 5
  BRW1.AddRange(MS:IDESTADO,Relate:MS,Relate:MEESTADO)     ! Add file relationship range limit for sort order 5
  BRW1.AddSortOrder(,MS:FK_MS_USUARIO)                     ! Add the sort order for MS:FK_MS_USUARIO for sort order 6
  BRW1.AddRange(MS:IDUSUARIO,Relate:MS,Relate:USUARIO)     ! Add file relationship range limit for sort order 6
  BRW1.AddSortOrder(,MS:IDX_MS_NUMERO)                     ! Add the sort order for MS:IDX_MS_NUMERO for sort order 7
  BRW1.AddRange(MS:NUMERO,Relate:MS,Relate:ME)             ! Add file relationship range limit for sort order 7
  BRW1.AddSortOrder(,MS:PK_MS)                             ! Add the sort order for MS:PK_MS for sort order 8
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 8
  BRW1::Sort0:Locator.Init(,MS:MS,,BRW1)                   ! Initialize the browse locator using  using key: MS:PK_MS , MS:MS
  BRW1.AddField(MS:MS,BRW1.Q.MS:MS)                        ! Field MS:MS is a hot field or requires assignment from browse
  BRW1.AddField(MET:DESCRIPCION,BRW1.Q.MET:DESCRIPCION)    ! Field MET:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(MS:CONTENIDO,BRW1.Q.MS:CONTENIDO)          ! Field MS:CONTENIDO is a hot field or requires assignment from browse
  BRW1.AddField(MS:ORIGEN,BRW1.Q.MS:ORIGEN)                ! Field MS:ORIGEN is a hot field or requires assignment from browse
  BRW1.AddField(MS:NUMERO,BRW1.Q.MS:NUMERO)                ! Field MS:NUMERO is a hot field or requires assignment from browse
  BRW1.AddField(MS:FECHA,BRW1.Q.MS:FECHA)                  ! Field MS:FECHA is a hot field or requires assignment from browse
  BRW1.AddField(MS:IDTIPO,BRW1.Q.MS:IDTIPO)                ! Field MS:IDTIPO is a hot field or requires assignment from browse
  BRW1.AddField(MS:IDDPTO,BRW1.Q.MS:IDDPTO)                ! Field MS:IDDPTO is a hot field or requires assignment from browse
  BRW1.AddField(MS:IDESTADO,BRW1.Q.MS:IDESTADO)            ! Field MS:IDESTADO is a hot field or requires assignment from browse
  BRW1.AddField(MS:IDUSUARIO,BRW1.Q.MS:IDUSUARIO)          ! Field MS:IDUSUARIO is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('MS',QuickWindow)                           ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1                                    ! Will call: Formulario_MS
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:ME.Close
    Relate:MEDPTO.Close
    Relate:MEESTADO.Close
    Relate:METIPO.Close
    Relate:MS.Close
    Relate:USUARIO.Close
  END
  IF SELF.Opened
    INIMgr.Update('MS',QuickWindow)                        ! Save window data to non-volatile store
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
    Formulario_MS
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
    OF ?SelectMETIPO
      ThisWindow.Update()
      GlobalRequest = SelectRecord
      SelectMETIPO()
      ThisWindow.Reset
    OF ?SelectME
      ThisWindow.Update()
      GlobalRequest = SelectRecord
      SelectME()
      ThisWindow.Reset
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
    SELF.InsertControl=?Insert:3
    SELF.ChangeControl=?Change:3
    SELF.DeleteControl=?Delete:3
  END
  SELF.ViewControl = ?View:2                               ! Setup the control used to initiate view only mode


BRW1.ResetSort PROCEDURE(BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  IF CHOICE(?CurrentTab) = 2
    RETURN SELF.SetSort(1,Force)
  ELSIF CHOICE(?CurrentTab) = 3
    RETURN SELF.SetSort(2,Force)
  ELSIF CHOICE(?CurrentTab) = 4
    RETURN SELF.SetSort(3,Force)
  ELSIF CHOICE(?CurrentTab) = 5
    RETURN SELF.SetSort(4,Force)
  ELSIF CHOICE(?CurrentTab) = 6
    RETURN SELF.SetSort(5,Force)
  ELSIF CHOICE(?CurrentTab) = 7
    RETURN SELF.SetSort(6,Force)
  ELSIF CHOICE(?CurrentTab) = 8
    RETURN SELF.SetSort(7,Force)
  ELSE
    RETURN SELF.SetSort(8,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


BRW1.SetAlerts PROCEDURE

  CODE
  SELF.EditViaPopup = False
  PARENT.SetAlerts


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

