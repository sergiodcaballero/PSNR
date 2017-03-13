

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('GESTION063.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Select a ME Record
!!! </summary>
SelectME PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(ME)
                       PROJECT(ME:ME)
                       PROJECT(ME:FECHA)
                       PROJECT(ME:ORIGEN)
                       PROJECT(ME:IDTIPO)
                       PROJECT(ME:NUMERO)
                       PROJECT(ME:CONTENIDO)
                       JOIN(MET:PK_METIPO,ME:IDTIPO)
                         PROJECT(MET:DESCRIPCION)
                         PROJECT(MET:IDTIPO)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
ME:ME                  LIKE(ME:ME)                    !List box control field - type derived from field
ME:FECHA               LIKE(ME:FECHA)                 !List box control field - type derived from field
ME:ORIGEN              LIKE(ME:ORIGEN)                !List box control field - type derived from field
ME:IDTIPO              LIKE(ME:IDTIPO)                !List box control field - type derived from field
MET:DESCRIPCION        LIKE(MET:DESCRIPCION)          !List box control field - type derived from field
ME:NUMERO              LIKE(ME:NUMERO)                !List box control field - type derived from field
ME:CONTENIDO           LIKE(ME:CONTENIDO)             !List box control field - type derived from field
MET:IDTIPO             LIKE(MET:IDTIPO)               !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Select a ME Record'),AT(,,358,198),FONT('Arial',8,COLOR:Black,FONT:bold),RESIZE,CENTER, |
  GRAY,IMM,MDI,HLP('SelectME'),SYSTEM
                       LIST,AT(8,34,342,120),USE(?Browse:1),HVSCROLL,FORMAT('29L(2)|M~ME~C(0)@n-7@52L(2)|M~FEC' & |
  'HA~C(0)@d17@80L(2)|M~ORIGEN~@s100@[28R(2)|M~IDTIPO~C(0)@n-4@200L(2)|M~DESCRIPCION~@s' & |
  '50@]|M~TIPO~80L(2)|M~NUMERO~@s50@80L(2)|M~CONTENIDO~@s255@'),FROM(Queue:Browse:1),IMM,MSG('Administrador de ME'), |
  VCR
                       BUTTON('&Elegir'),AT(301,158,49,14),USE(?Select:2),LEFT,ICON('e.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Seleccionar'),TIP('Seleccionar')
                       SHEET,AT(4,4,350,172),USE(?CurrentTab)
                         TAB('ID'),USE(?Tab:1)
                           PROMPT('ME:'),AT(9,22),USE(?ME:ME:Prompt)
                           ENTRY(@n-7),AT(29,21,60,10),USE(ME:ME),REQ
                         END
                         TAB('ORIGEN'),USE(?Tab:2)
                           PROMPT('ORIGEN:'),AT(8,23),USE(?ME:ORIGEN:Prompt)
                           ENTRY(@s100),AT(35,21,165,10),USE(ME:ORIGEN),UPR,REQ
                         END
                         TAB('TIPO'),USE(?Tab:3)
                         END
                         TAB('FECHA'),USE(?Tab:4)
                         END
                       END
                       BUTTON('&Salir'),AT(305,180,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Salir'),TIP('Salir')
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
                     END

BRW1::Sort0:Locator  EntryLocatorClass                     ! Default Locator
BRW1::Sort1:Locator  IncrementalLocatorClass               ! Conditional Locator - CHOICE(?CurrentTab) = 2
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
  GlobalErrors.SetProcedureName('SelectME')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('ME:ME',ME:ME)                                      ! Added by: BrowseBox(ABC)
  BIND('MET:IDTIPO',MET:IDTIPO)                            ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:ME.Open                                           ! File ME used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:ME,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,ME:IDX_ME_ORIGEN)                     ! Add the sort order for ME:IDX_ME_ORIGEN for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(?ME:ORIGEN,ME:ORIGEN,,BRW1)     ! Initialize the browse locator using ?ME:ORIGEN using key: ME:IDX_ME_ORIGEN , ME:ORIGEN
  BRW1.AddSortOrder(,ME:FK_ME_TIPO)                        ! Add the sort order for ME:FK_ME_TIPO for sort order 2
  BRW1.AddLocator(BRW1::Sort2:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort2:Locator.Init(,ME:IDTIPO,,BRW1)               ! Initialize the browse locator using  using key: ME:FK_ME_TIPO , ME:IDTIPO
  BRW1.AddSortOrder(,ME:IDX_ME_FECHAi)                     ! Add the sort order for ME:IDX_ME_FECHAi for sort order 3
  BRW1.AddLocator(BRW1::Sort3:Locator)                     ! Browse has a locator for sort order 3
  BRW1::Sort3:Locator.Init(,ME:FECHA,,BRW1)                ! Initialize the browse locator using  using key: ME:IDX_ME_FECHAi , ME:FECHA
  BRW1.AddSortOrder(,ME:PK_ME)                             ! Add the sort order for ME:PK_ME for sort order 4
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 4
  BRW1::Sort0:Locator.Init(?ME:ME,ME:ME,,BRW1)             ! Initialize the browse locator using ?ME:ME using key: ME:PK_ME , ME:ME
  BRW1.AddField(ME:ME,BRW1.Q.ME:ME)                        ! Field ME:ME is a hot field or requires assignment from browse
  BRW1.AddField(ME:FECHA,BRW1.Q.ME:FECHA)                  ! Field ME:FECHA is a hot field or requires assignment from browse
  BRW1.AddField(ME:ORIGEN,BRW1.Q.ME:ORIGEN)                ! Field ME:ORIGEN is a hot field or requires assignment from browse
  BRW1.AddField(ME:IDTIPO,BRW1.Q.ME:IDTIPO)                ! Field ME:IDTIPO is a hot field or requires assignment from browse
  BRW1.AddField(MET:DESCRIPCION,BRW1.Q.MET:DESCRIPCION)    ! Field MET:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(ME:NUMERO,BRW1.Q.ME:NUMERO)                ! Field ME:NUMERO is a hot field or requires assignment from browse
  BRW1.AddField(ME:CONTENIDO,BRW1.Q.ME:CONTENIDO)          ! Field ME:CONTENIDO is a hot field or requires assignment from browse
  BRW1.AddField(MET:IDTIPO,BRW1.Q.MET:IDTIPO)              ! Field MET:IDTIPO is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('SelectME',QuickWindow)                     ! Restore window settings from non-volatile store
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
    Relate:ME.Close
  END
  IF SELF.Opened
    INIMgr.Update('SelectME',QuickWindow)                  ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.SetAlerts PROCEDURE

  CODE
  
  !!! Evolution Consulting FREE Templates Start!!!
     ALERT(EnterKey)
  
  !!! Evolution Consulting FREE Templates End!!!
  PARENT.SetAlerts


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
  SELF.SelectControl = ?Select:2
  SELF.HideSelect = 1                                      ! Hide the select button when disabled
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)


BRW1.ResetSort PROCEDURE(BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  IF CHOICE(?CurrentTab) = 2
    RETURN SELF.SetSort(1,Force)
  ELSIF CHOICE(?CurrentTab) = 3
    RETURN SELF.SetSort(2,Force)
  ELSIF CHOICE(?CurrentTab) = 4
    RETURN SELF.SetSort(3,Force)
  ELSE
    RETURN SELF.SetSort(4,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

