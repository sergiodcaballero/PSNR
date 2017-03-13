

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('GESTION279.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Select a SOCIOS Record
!!! </summary>
SelectSOCIOS_CERT PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(SOCIOS)
                       PROJECT(SOC:IDSOCIO)
                       PROJECT(SOC:MATRICULA)
                       PROJECT(SOC:NOMBRE)
                       PROJECT(SOC:BAJA_TEMPORARIA)
                       PROJECT(SOC:CANTIDAD)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
SOC:IDSOCIO            LIKE(SOC:IDSOCIO)              !List box control field - type derived from field
SOC:IDSOCIO_NormalFG   LONG                           !Normal forground color
SOC:IDSOCIO_NormalBG   LONG                           !Normal background color
SOC:IDSOCIO_SelectedFG LONG                           !Selected forground color
SOC:IDSOCIO_SelectedBG LONG                           !Selected background color
SOC:IDSOCIO_Icon       LONG                           !Entry's icon ID
SOC:MATRICULA          LIKE(SOC:MATRICULA)            !List box control field - type derived from field
SOC:MATRICULA_NormalFG LONG                           !Normal forground color
SOC:MATRICULA_NormalBG LONG                           !Normal background color
SOC:MATRICULA_SelectedFG LONG                         !Selected forground color
SOC:MATRICULA_SelectedBG LONG                         !Selected background color
SOC:NOMBRE             LIKE(SOC:NOMBRE)               !List box control field - type derived from field
SOC:NOMBRE_NormalFG    LONG                           !Normal forground color
SOC:NOMBRE_NormalBG    LONG                           !Normal background color
SOC:NOMBRE_SelectedFG  LONG                           !Selected forground color
SOC:NOMBRE_SelectedBG  LONG                           !Selected background color
SOC:BAJA_TEMPORARIA    LIKE(SOC:BAJA_TEMPORARIA)      !List box control field - type derived from field
SOC:BAJA_TEMPORARIA_NormalFG LONG                     !Normal forground color
SOC:BAJA_TEMPORARIA_NormalBG LONG                     !Normal background color
SOC:BAJA_TEMPORARIA_SelectedFG LONG                   !Selected forground color
SOC:BAJA_TEMPORARIA_SelectedBG LONG                   !Selected background color
SOC:CANTIDAD           LIKE(SOC:CANTIDAD)             !List box control field - type derived from field
SOC:CANTIDAD_NormalFG  LONG                           !Normal forground color
SOC:CANTIDAD_NormalBG  LONG                           !Normal background color
SOC:CANTIDAD_SelectedFG LONG                          !Selected forground color
SOC:CANTIDAD_SelectedBG LONG                          !Selected background color
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Selecionar SOCIOS '),AT(,,307,238),FONT('Arial',8,,FONT:regular),RESIZE,CENTER,GRAY, |
  IMM,MDI,HLP('SelectSOCIOS'),SYSTEM
                       LIST,AT(8,38,281,156),USE(?Browse:1),HVSCROLL,FORMAT('42L(2)|M*I~IDSOCIO~L(0)@n-7@33L(2' & |
  ')|M*~MATRIC~L(0)@n-7@149L(2)|M*~NOMBRE~@s30@47L(2)|M*~BAJA TEMP~@s2@56L(2)|M*~CANTIDAD~@n-14@'), |
  FROM(Queue:Browse:1),IMM,MSG('Administrador de SOCIOS')
                       BUTTON('&Elegir'),AT(247,198,49,14),USE(?Select:2),LEFT,ICON('e.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Seleccionar'),TIP('Seleccionar')
                       SHEET,AT(3,3,291,212),USE(?CurrentTab)
                         TAB('NOMBRE '),USE(?Tab:1)
                           PROMPT('NOMBRE:'),AT(127,23),USE(?NOMBRE:Prompt)
                           ENTRY(@s30),AT(165,23,121,10),USE(SOC:NOMBRE),UPR
                         END
                         TAB('MATRICULA'),USE(?Tab:4)
                         END
                         TAB('SOCIO'),USE(?Tab:3)
                         END
                       END
                       BUTTON('&Salir'),AT(253,218,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Salir'),TIP('Salir')
                       PROMPT('&Orden:'),AT(9,20),USE(?SortOrderList:Prompt)
                       LIST,AT(49,20,75,10),USE(?SortOrderList),DROP(20),FROM(''),MSG('Select the Sort Order'),TIP('Select the' & |
  ' Sort Order')
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
SetQueueRecord         PROCEDURE(),DERIVED
                     END

BRW1::Sort0:Locator  FilterLocatorClass                    ! Default Locator
BRW1::Sort1:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 2
BRW1::Sort2:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 3
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
  GlobalErrors.SetProcedureName('SelectSOCIOS_CERT')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('SOC:IDSOCIO',SOC:IDSOCIO)                          ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:SOCIOS.Open                                       ! File SOCIOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:SOCIOS,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?CurrentTab{PROP:WIZARD}=True
  ?SortOrderList{PROP:FROM}=|
                CHOOSE(SUB(?Tab:1{PROP:TEXT},1,1)='&',SUB(?Tab:1{PROP:TEXT},2,LEN(?Tab:1{PROP:TEXT})-1),?Tab:1{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab:4{PROP:TEXT},1,1)='&',SUB(?Tab:4{PROP:TEXT},2,LEN(?Tab:4{PROP:TEXT})-1),?Tab:4{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab:3{PROP:TEXT},1,1)='&',SUB(?Tab:3{PROP:TEXT},2,LEN(?Tab:3{PROP:TEXT})-1),?Tab:3{PROP:TEXT})&|
                ''
  ?SortOrderList{PROP:SELECTED}=1
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,SOC:IDX_SOCIOS_MATRICULA)             ! Add the sort order for SOC:IDX_SOCIOS_MATRICULA for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,SOC:MATRICULA,,BRW1)           ! Initialize the browse locator using  using key: SOC:IDX_SOCIOS_MATRICULA , SOC:MATRICULA
  BRW1.SetFilter('(SOC:BAJA <<> ''SI'' AND  SOC:CANTIDAD <<= 4)') ! Apply filter expression to browse
  BRW1.AddSortOrder(,SOC:PK_SOCIOS)                        ! Add the sort order for SOC:PK_SOCIOS for sort order 2
  BRW1.AddLocator(BRW1::Sort2:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort2:Locator.Init(,SOC:IDSOCIO,,BRW1)             ! Initialize the browse locator using  using key: SOC:PK_SOCIOS , SOC:IDSOCIO
  BRW1.SetFilter('(SOC:BAJA <<> ''SI''  AND  SOC:CANTIDAD <<= 4)') ! Apply filter expression to browse
  BRW1.AddSortOrder(,SOC:IDX_SOCIOS_NOMBRE)                ! Add the sort order for SOC:IDX_SOCIOS_NOMBRE for sort order 3
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 3
  BRW1::Sort0:Locator.Init(?SOC:NOMBRE,SOC:NOMBRE,,BRW1)   ! Initialize the browse locator using ?SOC:NOMBRE using key: SOC:IDX_SOCIOS_NOMBRE , SOC:NOMBRE
  BRW1.SetFilter('(SOC:BAJA <<> ''SI''  AND  SOC:CANTIDAD <<= 4)') ! Apply filter expression to browse
  ?Browse:1{PROP:IconList,1} = '~CANCEL.ICO'
  BRW1.AddField(SOC:IDSOCIO,BRW1.Q.SOC:IDSOCIO)            ! Field SOC:IDSOCIO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:MATRICULA,BRW1.Q.SOC:MATRICULA)        ! Field SOC:MATRICULA is a hot field or requires assignment from browse
  BRW1.AddField(SOC:NOMBRE,BRW1.Q.SOC:NOMBRE)              ! Field SOC:NOMBRE is a hot field or requires assignment from browse
  BRW1.AddField(SOC:BAJA_TEMPORARIA,BRW1.Q.SOC:BAJA_TEMPORARIA) ! Field SOC:BAJA_TEMPORARIA is a hot field or requires assignment from browse
  BRW1.AddField(SOC:CANTIDAD,BRW1.Q.SOC:CANTIDAD)          ! Field SOC:CANTIDAD is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('SelectSOCIOS_CERT',QuickWindow)            ! Restore window settings from non-volatile store
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
    Relate:SOCIOS.Close
  END
  IF SELF.Opened
    INIMgr.Update('SelectSOCIOS_CERT',QuickWindow)         ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
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
    OF ?SortOrderList
      EXECUTE(CHOICE(?SortOrderList))
       SELECT(?Tab:1)
       SELECT(?Tab:4)
       SELECT(?Tab:3)
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
  ELSE
    RETURN SELF.SetSort(3,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


BRW1.SetQueueRecord PROCEDURE

  CODE
  PARENT.SetQueueRecord
  
  IF (SOC:BAJA_TEMPORARIA = 'SI')
    SELF.Q.SOC:IDSOCIO_NormalFG = 255                      ! Set conditional color values for SOC:IDSOCIO
    SELF.Q.SOC:IDSOCIO_NormalBG = 65535
    SELF.Q.SOC:IDSOCIO_SelectedFG = 65535
    SELF.Q.SOC:IDSOCIO_SelectedBG = 255
  ELSE
    SELF.Q.SOC:IDSOCIO_NormalFG = -1                       ! Set color values for SOC:IDSOCIO
    SELF.Q.SOC:IDSOCIO_NormalBG = -1
    SELF.Q.SOC:IDSOCIO_SelectedFG = -1
    SELF.Q.SOC:IDSOCIO_SelectedBG = -1
  END
  IF (SOC:BAJA_TEMPORARIA = 'SI')
    SELF.Q.SOC:IDSOCIO_Icon = 1                            ! Set icon from icon list
  ELSE
    SELF.Q.SOC:IDSOCIO_Icon = 0
  END
  IF (SOC:BAJA_TEMPORARIA = 'SI')
    SELF.Q.SOC:MATRICULA_NormalFG = 255                    ! Set conditional color values for SOC:MATRICULA
    SELF.Q.SOC:MATRICULA_NormalBG = 65535
    SELF.Q.SOC:MATRICULA_SelectedFG = 65535
    SELF.Q.SOC:MATRICULA_SelectedBG = -1556868257
  ELSE
    SELF.Q.SOC:MATRICULA_NormalFG = -1                     ! Set color values for SOC:MATRICULA
    SELF.Q.SOC:MATRICULA_NormalBG = -1
    SELF.Q.SOC:MATRICULA_SelectedFG = -1
    SELF.Q.SOC:MATRICULA_SelectedBG = -1
  END
  IF (SOC:BAJA_TEMPORARIA = 'SI')
    SELF.Q.SOC:NOMBRE_NormalFG = 255                       ! Set conditional color values for SOC:NOMBRE
    SELF.Q.SOC:NOMBRE_NormalBG = 65535
    SELF.Q.SOC:NOMBRE_SelectedFG = 65535
    SELF.Q.SOC:NOMBRE_SelectedBG = -1556868257
  ELSE
    SELF.Q.SOC:NOMBRE_NormalFG = -1                        ! Set color values for SOC:NOMBRE
    SELF.Q.SOC:NOMBRE_NormalBG = -1
    SELF.Q.SOC:NOMBRE_SelectedFG = -1
    SELF.Q.SOC:NOMBRE_SelectedBG = -1
  END
  IF (SOC:BAJA_TEMPORARIA = 'SI')
    SELF.Q.SOC:BAJA_TEMPORARIA_NormalFG = 255              ! Set conditional color values for SOC:BAJA_TEMPORARIA
    SELF.Q.SOC:BAJA_TEMPORARIA_NormalBG = 65535
    SELF.Q.SOC:BAJA_TEMPORARIA_SelectedFG = 65535
    SELF.Q.SOC:BAJA_TEMPORARIA_SelectedBG = 255
  ELSE
    SELF.Q.SOC:BAJA_TEMPORARIA_NormalFG = -1               ! Set color values for SOC:BAJA_TEMPORARIA
    SELF.Q.SOC:BAJA_TEMPORARIA_NormalBG = -1
    SELF.Q.SOC:BAJA_TEMPORARIA_SelectedFG = -1
    SELF.Q.SOC:BAJA_TEMPORARIA_SelectedBG = -1
  END
  SELF.Q.SOC:CANTIDAD_NormalFG = -1                        ! Set color values for SOC:CANTIDAD
  SELF.Q.SOC:CANTIDAD_NormalBG = -1
  SELF.Q.SOC:CANTIDAD_SelectedFG = -1
  SELF.Q.SOC:CANTIDAD_SelectedBG = -1


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

