

   MEMBER('Padron.clw')                                    ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('PADRON019.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Select a USUARIO Record
!!! </summary>
SelectUSUARIO PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(USUARIO)
                       PROJECT(USU:IDUSUARIO)
                       PROJECT(USU:DESCRIPCION)
                       PROJECT(USU:CONTRASENA)
                       PROJECT(USU:NIVEL)
                       PROJECT(USU:BAJA)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
USU:IDUSUARIO          LIKE(USU:IDUSUARIO)            !List box control field - type derived from field
USU:DESCRIPCION        LIKE(USU:DESCRIPCION)          !List box control field - type derived from field
USU:CONTRASENA         LIKE(USU:CONTRASENA)           !List box control field - type derived from field
USU:NIVEL              LIKE(USU:NIVEL)                !List box control field - type derived from field
USU:BAJA               LIKE(USU:BAJA)                 !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Select a USUARIO Record'),AT(,,340,198),FONT('MS Sans Serif',8,,FONT:regular),RESIZE, |
  CENTER,GRAY,IMM,MDI,HLP('SelectUSUARIO'),SYSTEM
                       LIST,AT(8,30,324,124),USE(?Browse:1),HVSCROLL,FORMAT('64R(2)|M~IDUSUARIO~C(0)@n-14@80L(' & |
  '2)|M~DESCRIPCION~L(2)@s20@44L(2)|M~CONTRASENA~L(2)@s10@64R(2)|M~NIVEL~C(0)@n-14@80R(' & |
  '2)|M~BAJA~C(0)@d17@'),FROM(Queue:Browse:1),IMM,MSG('Administrador de USUARIO')
                       BUTTON('&Elegir'),AT(283,158,49,14),USE(?Select:2),LEFT,ICON('e.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Seleccionar'),TIP('Seleccionar')
                       SHEET,AT(4,4,332,172),USE(?CurrentTab)
                         TAB('PK_USUARIO'),USE(?Tab:2)
                         END
                         TAB('USUARIO_IDX1'),USE(?Tab:3)
                         END
                       END
                       BUTTON('&Salir'),AT(287,180,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Salir'),TIP('Salir')
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::Sort1:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 2
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
  GlobalErrors.SetProcedureName('SelectUSUARIO')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('USU:IDUSUARIO',USU:IDUSUARIO)                      ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:USUARIO.Open                                      ! File USUARIO used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:USUARIO,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,USU:USUARIO_IDX1)                     ! Add the sort order for USU:USUARIO_IDX1 for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,USU:DESCRIPCION,,BRW1)         ! Initialize the browse locator using  using key: USU:USUARIO_IDX1 , USU:DESCRIPCION
  BRW1.AddSortOrder(,USU:PK_USUARIO)                       ! Add the sort order for USU:PK_USUARIO for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(,USU:IDUSUARIO,,BRW1)           ! Initialize the browse locator using  using key: USU:PK_USUARIO , USU:IDUSUARIO
  BRW1.AddField(USU:IDUSUARIO,BRW1.Q.USU:IDUSUARIO)        ! Field USU:IDUSUARIO is a hot field or requires assignment from browse
  BRW1.AddField(USU:DESCRIPCION,BRW1.Q.USU:DESCRIPCION)    ! Field USU:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(USU:CONTRASENA,BRW1.Q.USU:CONTRASENA)      ! Field USU:CONTRASENA is a hot field or requires assignment from browse
  BRW1.AddField(USU:NIVEL,BRW1.Q.USU:NIVEL)                ! Field USU:NIVEL is a hot field or requires assignment from browse
  BRW1.AddField(USU:BAJA,BRW1.Q.USU:BAJA)                  ! Field USU:BAJA is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('SelectUSUARIO',QuickWindow)                ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:USUARIO.Close
  END
  IF SELF.Opened
    INIMgr.Update('SelectUSUARIO',QuickWindow)             ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


BRW1.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  SELF.SelectControl = ?Select:2
  SELF.HideSelect = 1                                      ! Hide the select button when disabled
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)


BRW1.ResetSort PROCEDURE(BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  IF CHOICE(?CurrentTab) = 2
    RETURN SELF.SetSort(1,Force)
  ELSE
    RETURN SELF.SetSort(2,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

