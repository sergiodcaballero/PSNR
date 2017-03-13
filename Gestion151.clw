

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('GESTION151.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Select a NOMENCLADORXOS Record
!!! </summary>
SelectNOMENCLADORXOS PROCEDURE (OS)

CurrentTab           STRING(80)                            ! 
loc:os               LONG                                  ! 
BRW1::View:Browse    VIEW(NOMENCLADORXOS)
                       PROJECT(NOM2:VALOR)
                       PROJECT(NOM2:VALOR_ANTERIOR)
                       PROJECT(NOM2:IDNOMENCLADOR)
                       PROJECT(NOM2:IDOS)
                       JOIN(OBR:PK_OBRA_SOCIAL,NOM2:IDOS)
                         PROJECT(OBR:NOMPRE_CORTO)
                         PROJECT(OBR:IDOS)
                       END
                       JOIN(NOM:PK_NOMENCLADOR,NOM2:IDNOMENCLADOR)
                         PROJECT(NOM:CODIGO)
                         PROJECT(NOM:DESCRIPCION)
                         PROJECT(NOM:IDNOMENCLADOR)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
NOM:CODIGO             LIKE(NOM:CODIGO)               !List box control field - type derived from field
NOM:DESCRIPCION        LIKE(NOM:DESCRIPCION)          !List box control field - type derived from field
NOM2:VALOR             LIKE(NOM2:VALOR)               !List box control field - type derived from field
NOM2:VALOR_ANTERIOR    LIKE(NOM2:VALOR_ANTERIOR)      !List box control field - type derived from field
OBR:NOMPRE_CORTO       LIKE(OBR:NOMPRE_CORTO)         !List box control field - type derived from field
NOM2:IDNOMENCLADOR     LIKE(NOM2:IDNOMENCLADOR)       !List box control field - type derived from field
NOM2:IDOS              LIKE(NOM2:IDOS)                !List box control field - type derived from field
OBR:IDOS               LIKE(OBR:IDOS)                 !Related join file key field - type derived from field
NOM:IDNOMENCLADOR      LIKE(NOM:IDNOMENCLADOR)        !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Select a NOMENCLADORXOS Record'),AT(,,418,198),FONT('Arial',8,COLOR:Black,FONT:bold), |
  RESIZE,CENTER,GRAY,IMM,MDI,HLP('SelectNOMENCLADORXOS'),SYSTEM
                       LIST,AT(8,30,386,124),USE(?Browse:1),HVSCROLL,FORMAT('37L(2)|M~CODIGO~C(0)@p##.##.##p@1' & |
  '15L(2)|M~DESCRIPCION~C(0)@s100@42L(2)|M~VALOR~C(0)@n$-10.2@73L(2)|M~VALOR ANTERIOR~C' & |
  '(0)@n$-10.2@120R(2)|M~NOMPRE CORTO~C(0)@s30@64R(2)|M~IDNOMENCLADOR~C(0)@n-14@64R(2)|' & |
  'M~IDOS~C(0)@n-14@'),FROM(Queue:Browse:1),IMM,MSG('Administrador de NOMENCLADORXOS')
                       BUTTON('&Elegir'),AT(341,155,49,14),USE(?Select:2),LEFT,ICON('e.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Seleccionar'),TIP('Seleccionar')
                       SHEET,AT(4,4,400,172),USE(?CurrentTab)
                         TAB('CODIGO'),USE(?Tab:1)
                         END
                         TAB('DESCRIPCION'),USE(?Tab:2)
                         END
                       END
                       BUTTON('&Salir'),AT(341,182,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
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
  GlobalErrors.SetProcedureName('SelectNOMENCLADORXOS')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('NOM2:VALOR_ANTERIOR',NOM2:VALOR_ANTERIOR)          ! Added by: BrowseBox(ABC)
  BIND('OBR:NOMPRE_CORTO',OBR:NOMPRE_CORTO)                ! Added by: BrowseBox(ABC)
  BIND('OBR:IDOS',OBR:IDOS)                                ! Added by: BrowseBox(ABC)
  BIND('NOM:IDNOMENCLADOR',NOM:IDNOMENCLADOR)              ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:NOMENCLADORXOS.Open                               ! File NOMENCLADORXOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:NOMENCLADORXOS,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,NOM2:FK_NOMENCLADORXOS_OS)            ! Add the sort order for NOM2:FK_NOMENCLADORXOS_OS for sort order 1
  BRW1.AddRange(NOM2:IDOS,loc:os)                          ! Add single value range limit for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,NOM2:IDOS,,BRW1)               ! Initialize the browse locator using  using key: NOM2:FK_NOMENCLADORXOS_OS , NOM2:IDOS
  BRW1.AddSortOrder(,NOM2:FK_NOMENCLADORXOS_OS)            ! Add the sort order for NOM2:FK_NOMENCLADORXOS_OS for sort order 2
  BRW1.AddRange(NOM2:IDOS,loc:os)                          ! Add single value range limit for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(,NOM2:IDOS,,BRW1)               ! Initialize the browse locator using  using key: NOM2:FK_NOMENCLADORXOS_OS , NOM2:IDOS
  BRW1.AddField(NOM:CODIGO,BRW1.Q.NOM:CODIGO)              ! Field NOM:CODIGO is a hot field or requires assignment from browse
  BRW1.AddField(NOM:DESCRIPCION,BRW1.Q.NOM:DESCRIPCION)    ! Field NOM:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(NOM2:VALOR,BRW1.Q.NOM2:VALOR)              ! Field NOM2:VALOR is a hot field or requires assignment from browse
  BRW1.AddField(NOM2:VALOR_ANTERIOR,BRW1.Q.NOM2:VALOR_ANTERIOR) ! Field NOM2:VALOR_ANTERIOR is a hot field or requires assignment from browse
  BRW1.AddField(OBR:NOMPRE_CORTO,BRW1.Q.OBR:NOMPRE_CORTO)  ! Field OBR:NOMPRE_CORTO is a hot field or requires assignment from browse
  BRW1.AddField(NOM2:IDNOMENCLADOR,BRW1.Q.NOM2:IDNOMENCLADOR) ! Field NOM2:IDNOMENCLADOR is a hot field or requires assignment from browse
  BRW1.AddField(NOM2:IDOS,BRW1.Q.NOM2:IDOS)                ! Field NOM2:IDOS is a hot field or requires assignment from browse
  BRW1.AddField(OBR:IDOS,BRW1.Q.OBR:IDOS)                  ! Field OBR:IDOS is a hot field or requires assignment from browse
  BRW1.AddField(NOM:IDNOMENCLADOR,BRW1.Q.NOM:IDNOMENCLADOR) ! Field NOM:IDNOMENCLADOR is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('SelectNOMENCLADORXOS',QuickWindow)         ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  SELF.SetAlerts()
  loc:os = os
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:NOMENCLADORXOS.Close
  END
  IF SELF.Opened
    INIMgr.Update('SelectNOMENCLADORXOS',QuickWindow)      ! Save window data to non-volatile store
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
  ELSE
    RETURN SELF.SetSort(2,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

