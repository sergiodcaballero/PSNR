

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('GESTION141.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION139.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the NOMENCLADORXOS File
!!! </summary>
NomencladorXOS PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(NOMENCLADORXOS)
                       PROJECT(NOM2:VALOR)
                       PROJECT(NOM2:VALOR_ANTERIOR)
                       PROJECT(NOM2:IDOS)
                       PROJECT(NOM2:IDNOMENCLADOR)
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
NOM2:IDOS              LIKE(NOM2:IDOS)                !List box control field - type derived from field
NOM2:IDNOMENCLADOR     LIKE(NOM2:IDNOMENCLADOR)       !Primary key field - type derived from field
NOM:IDNOMENCLADOR      LIKE(NOM:IDNOMENCLADOR)        !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW(' NOMENCLADOR X OBRA SOCIAL'),AT(,,322,198),FONT('Arial',8,COLOR:Black,FONT:bold),RESIZE, |
  CENTER,GRAY,IMM,MDI,HLP('NomencladorXOS'),SYSTEM
                       LIST,AT(8,30,309,124),USE(?Browse:1),HVSCROLL,FORMAT('40L(2)|M~CODIGO~C(0)@P##.##.##P@1' & |
  '69L(2)|M~DESCRIPCION~C(0)@s100@36L(1)|M~VALOR~C(0)@n$-7.2@60L(1)|M~VALOR ANTERIOR~C(' & |
  '0)@n$-7.2@64R(2)|M~IDOS~C(0)@n-14@'),FROM(Queue:Browse:1),IMM,MSG('Administrador de ' & |
  'NOMENCLADORXOS')
                       BUTTON('&Ver'),AT(107,158,49,14),USE(?View:2),LEFT,ICON('v.ico'),CURSOR('mano.cur'),FLAT,MSG('Visualizar'), |
  TIP('Visualizar')
                       BUTTON('&Agregar'),AT(160,158,49,14),USE(?Insert:3),LEFT,ICON('a.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Agrega Registro'),TIP('Agrega Registro')
                       BUTTON('&Cambiar'),AT(213,158,49,14),USE(?Change:3),LEFT,ICON('c.ico'),CURSOR('mano.cur'), |
  DEFAULT,FLAT,MSG('Cambia Registro'),TIP('Cambia Registro')
                       BUTTON('&Borrar'),AT(266,158,49,14),USE(?Delete:3),LEFT,ICON('b.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Borra Registro'),TIP('Borra Registro')
                       SHEET,AT(4,4,317,172),USE(?CurrentTab)
                         TAB('NOMENCLADOR'),USE(?Tab:2)
                         END
                       END
                       STRING(@s30),AT(74,2,163,13),USE(OBR:NOMPRE_CORTO),FONT(,12,,FONT:bold)
                       BUTTON('&Salir'),AT(267,180,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Salir'),TIP('Salir')
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
                     END

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
  GlobalErrors.SetProcedureName('NomencladorXOS')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('NOM2:VALOR_ANTERIOR',NOM2:VALOR_ANTERIOR)          ! Added by: BrowseBox(ABC)
  BIND('NOM:IDNOMENCLADOR',NOM:IDNOMENCLADOR)              ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:NOMENCLADOR.Open                                  ! File NOMENCLADOR used by this procedure, so make sure it's RelationManager is open
  Relate:NOMENCLADORXOS.Open                               ! File NOMENCLADORXOS used by this procedure, so make sure it's RelationManager is open
  Relate:OBRA_SOCIAL.Open                                  ! File OBRA_SOCIAL used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:NOMENCLADORXOS,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,NOM2:FK_NOMENCLADORXOS_OS)            ! Add the sort order for NOM2:FK_NOMENCLADORXOS_OS for sort order 1
  BRW1.AddRange(NOM2:IDOS,Relate:NOMENCLADORXOS,Relate:OBRA_SOCIAL) ! Add file relationship range limit for sort order 1
  BRW1.AddSortOrder(,NOM2:PK_NOMENCLADORXOS)               ! Add the sort order for NOM2:PK_NOMENCLADORXOS for sort order 2
  BRW1.AddLocator(BRW1::Sort2:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort2:Locator.Init(,NOM2:IDOS,,BRW1)               ! Initialize the browse locator using  using key: NOM2:PK_NOMENCLADORXOS , NOM2:IDOS
  BRW1.AddSortOrder(,NOM2:FK_NOMENCLADORXOS_OS)            ! Add the sort order for NOM2:FK_NOMENCLADORXOS_OS for sort order 3
  BRW1.AddRange(NOM2:IDOS,Relate:NOMENCLADORXOS,Relate:OBRA_SOCIAL) ! Add file relationship range limit for sort order 3
  BRW1.AddField(NOM:CODIGO,BRW1.Q.NOM:CODIGO)              ! Field NOM:CODIGO is a hot field or requires assignment from browse
  BRW1.AddField(NOM:DESCRIPCION,BRW1.Q.NOM:DESCRIPCION)    ! Field NOM:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(NOM2:VALOR,BRW1.Q.NOM2:VALOR)              ! Field NOM2:VALOR is a hot field or requires assignment from browse
  BRW1.AddField(NOM2:VALOR_ANTERIOR,BRW1.Q.NOM2:VALOR_ANTERIOR) ! Field NOM2:VALOR_ANTERIOR is a hot field or requires assignment from browse
  BRW1.AddField(NOM2:IDOS,BRW1.Q.NOM2:IDOS)                ! Field NOM2:IDOS is a hot field or requires assignment from browse
  BRW1.AddField(NOM2:IDNOMENCLADOR,BRW1.Q.NOM2:IDNOMENCLADOR) ! Field NOM2:IDNOMENCLADOR is a hot field or requires assignment from browse
  BRW1.AddField(NOM:IDNOMENCLADOR,BRW1.Q.NOM:IDNOMENCLADOR) ! Field NOM:IDNOMENCLADOR is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('NomencladorXOS',QuickWindow)               ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1                                    ! Will call: Formulario_NOMENCLADORXOS
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:NOMENCLADOR.Close
    Relate:NOMENCLADORXOS.Close
    Relate:OBRA_SOCIAL.Close
  END
  IF SELF.Opened
    INIMgr.Update('NomencladorXOS',QuickWindow)            ! Save window data to non-volatile store
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
    Formulario_NOMENCLADORXOS
    ReturnValue = GlobalResponse
  END
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
  ELSE
    RETURN SELF.SetSort(3,Force)
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

