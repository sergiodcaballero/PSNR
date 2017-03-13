

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('GESTION316.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION030.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION314.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION315.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the INSTITUCION file
!!! </summary>
BrowseINSTITUCION PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(INSTITUCION)
                       PROJECT(INS2:IDINSTITUCION)
                       PROJECT(INS2:NOMBRE)
                       PROJECT(INS2:NOMBRE_CORTO)
                       PROJECT(INS2:IDTIPO_INSTITUCION)
                       PROJECT(INS2:DIRECCION)
                       PROJECT(INS2:IDLOCALIDAD)
                       PROJECT(INS2:TELEFONO)
                       PROJECT(INS2:E_MAIL)
                       JOIN(TIP4:PK_T_INSTITUCION,INS2:IDTIPO_INSTITUCION)
                         PROJECT(TIP4:DESCRIPCION)
                         PROJECT(TIP4:IDTIPO_INSTITUCION)
                       END
                       JOIN(LOC:PK_LOCALIDAD,INS2:IDLOCALIDAD)
                         PROJECT(LOC:DESCRIPCION)
                         PROJECT(LOC:IDLOCALIDAD)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
INS2:IDINSTITUCION     LIKE(INS2:IDINSTITUCION)       !List box control field - type derived from field
INS2:NOMBRE            LIKE(INS2:NOMBRE)              !List box control field - type derived from field
INS2:NOMBRE_CORTO      LIKE(INS2:NOMBRE_CORTO)        !List box control field - type derived from field
INS2:IDTIPO_INSTITUCION LIKE(INS2:IDTIPO_INSTITUCION) !List box control field - type derived from field
TIP4:DESCRIPCION       LIKE(TIP4:DESCRIPCION)         !List box control field - type derived from field
INS2:DIRECCION         LIKE(INS2:DIRECCION)           !List box control field - type derived from field
INS2:IDLOCALIDAD       LIKE(INS2:IDLOCALIDAD)         !List box control field - type derived from field
LOC:DESCRIPCION        LIKE(LOC:DESCRIPCION)          !List box control field - type derived from field
INS2:TELEFONO          LIKE(INS2:TELEFONO)            !List box control field - type derived from field
INS2:E_MAIL            LIKE(INS2:E_MAIL)              !List box control field - type derived from field
TIP4:IDTIPO_INSTITUCION LIKE(TIP4:IDTIPO_INSTITUCION) !Related join file key field - type derived from field
LOC:IDLOCALIDAD        LIKE(LOC:IDLOCALIDAD)          !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('ABM INSTITUCION'),AT(,,358,198),FONT('MS Sans Serif',8,,FONT:regular),RESIZE,CENTER, |
  GRAY,IMM,MDI,HLP('BrowseINSTITUCION'),SYSTEM
                       LIST,AT(8,30,342,124),USE(?Browse:1),HVSCROLL,FORMAT('64R(2)|M~IDINSTITUCION~C(0)@n-14@' & |
  '127L(2)|M~NOMBRE~@s50@120L(2)|M~NOMBRE CORTO~@s30@[31L(2)|M~IDTINST~C(0)@n-5@200L(2)' & |
  '|M~DESCRIPCION~C(0)@s15@](96)|M~TIPO~80L(2)|M~DIRECCION~@s50@[29L(2)|M~IDLOC~C(0)@n-' & |
  '5@80L(2)|M~DESCRIPCION~C(0)@s20@]|M~LOCALIDAD~80L(2)|M~TELEFONO~@s20@80L(2)|M~E MAIL~@s50@'), |
  FROM(Queue:Browse:1),IMM,MSG('Administrador de INSTITUCION')
                       BUTTON('&Ver'),AT(142,158,49,14),USE(?View:2),LEFT,ICON('v.ico'),CURSOR('mano.cur'),FLAT,MSG('Visualizar'), |
  TIP('Visualizar')
                       BUTTON('&Agregar'),AT(195,158,49,14),USE(?Insert:3),LEFT,ICON('a.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Agrega Registro'),TIP('Agrega Registro')
                       BUTTON('&Cambiar'),AT(248,158,49,14),USE(?Change:3),LEFT,ICON('c.ico'),CURSOR('mano.cur'), |
  DEFAULT,FLAT,MSG('Cambia Registro'),TIP('Cambia Registro')
                       BUTTON('&Borrar'),AT(301,158,49,14),USE(?Delete:3),LEFT,ICON('b.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Borra Registro'),TIP('Borra Registro')
                       SHEET,AT(4,4,350,172),USE(?CurrentTab)
                         TAB('ID'),USE(?Tab:2)
                         END
                         TAB('LOCALIDAD'),USE(?Tab:3)
                           BUTTON('Select LOCALIDAD'),AT(8,158,118,14),USE(?SelectLOCALIDAD),MSG('Select Parent Field'), |
  TIP('Selecciona')
                         END
                         TAB('TIPO'),USE(?Tab:4)
                           BUTTON('Select TIPO INSTITUCION'),AT(8,158,118,14),USE(?SelectTIPO_INSTITUCION),MSG('Select Parent Field'), |
  TIP('Selecciona')
                         END
                       END
                       BUTTON('&Salir'),AT(305,180,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Salir'),TIP('Salir')
                       PROMPT('&Orden:'),AT(8,13),USE(?SortOrderList:Prompt)
                       LIST,AT(48,13,75,10),USE(?SortOrderList),DROP(20),FROM(''),MSG('Select the Sort Order'),TIP('Select the' & |
  ' Sort Order')
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
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
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
  GlobalErrors.SetProcedureName('BrowseINSTITUCION')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('INS2:IDINSTITUCION',INS2:IDINSTITUCION)            ! Added by: BrowseBox(ABC)
  BIND('INS2:IDTIPO_INSTITUCION',INS2:IDTIPO_INSTITUCION)  ! Added by: BrowseBox(ABC)
  BIND('INS2:E_MAIL',INS2:E_MAIL)                          ! Added by: BrowseBox(ABC)
  BIND('TIP4:IDTIPO_INSTITUCION',TIP4:IDTIPO_INSTITUCION)  ! Added by: BrowseBox(ABC)
  BIND('LOC:IDLOCALIDAD',LOC:IDLOCALIDAD)                  ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:INSTITUCION.Open                                  ! File INSTITUCION used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:INSTITUCION,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?CurrentTab{PROP:WIZARD}=True
  ?SortOrderList{PROP:FROM}=|
                CHOOSE(SUB(?Tab:2{PROP:TEXT},1,1)='&',SUB(?Tab:2{PROP:TEXT},2,LEN(?Tab:2{PROP:TEXT})-1),?Tab:2{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab:3{PROP:TEXT},1,1)='&',SUB(?Tab:3{PROP:TEXT},2,LEN(?Tab:3{PROP:TEXT})-1),?Tab:3{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab:4{PROP:TEXT},1,1)='&',SUB(?Tab:4{PROP:TEXT},2,LEN(?Tab:4{PROP:TEXT})-1),?Tab:4{PROP:TEXT})&|
                ''
  ?SortOrderList{PROP:SELECTED}=1
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,INS2:FK_INSTITUCION_LOCALIDAD)        ! Add the sort order for INS2:FK_INSTITUCION_LOCALIDAD for sort order 1
  BRW1.AddRange(INS2:IDLOCALIDAD,Relate:INSTITUCION,Relate:LOCALIDAD) ! Add file relationship range limit for sort order 1
  BRW1.AddSortOrder(,INS2:FK_INSTITUCION_TIPO)             ! Add the sort order for INS2:FK_INSTITUCION_TIPO for sort order 2
  BRW1.AddRange(INS2:IDTIPO_INSTITUCION,Relate:INSTITUCION,Relate:TIPO_INSTITUCION) ! Add file relationship range limit for sort order 2
  BRW1.AddSortOrder(,INS2:PK_INSTITUCION)                  ! Add the sort order for INS2:PK_INSTITUCION for sort order 3
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 3
  BRW1::Sort0:Locator.Init(,INS2:IDINSTITUCION,,BRW1)      ! Initialize the browse locator using  using key: INS2:PK_INSTITUCION , INS2:IDINSTITUCION
  BRW1.AddField(INS2:IDINSTITUCION,BRW1.Q.INS2:IDINSTITUCION) ! Field INS2:IDINSTITUCION is a hot field or requires assignment from browse
  BRW1.AddField(INS2:NOMBRE,BRW1.Q.INS2:NOMBRE)            ! Field INS2:NOMBRE is a hot field or requires assignment from browse
  BRW1.AddField(INS2:NOMBRE_CORTO,BRW1.Q.INS2:NOMBRE_CORTO) ! Field INS2:NOMBRE_CORTO is a hot field or requires assignment from browse
  BRW1.AddField(INS2:IDTIPO_INSTITUCION,BRW1.Q.INS2:IDTIPO_INSTITUCION) ! Field INS2:IDTIPO_INSTITUCION is a hot field or requires assignment from browse
  BRW1.AddField(TIP4:DESCRIPCION,BRW1.Q.TIP4:DESCRIPCION)  ! Field TIP4:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(INS2:DIRECCION,BRW1.Q.INS2:DIRECCION)      ! Field INS2:DIRECCION is a hot field or requires assignment from browse
  BRW1.AddField(INS2:IDLOCALIDAD,BRW1.Q.INS2:IDLOCALIDAD)  ! Field INS2:IDLOCALIDAD is a hot field or requires assignment from browse
  BRW1.AddField(LOC:DESCRIPCION,BRW1.Q.LOC:DESCRIPCION)    ! Field LOC:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(INS2:TELEFONO,BRW1.Q.INS2:TELEFONO)        ! Field INS2:TELEFONO is a hot field or requires assignment from browse
  BRW1.AddField(INS2:E_MAIL,BRW1.Q.INS2:E_MAIL)            ! Field INS2:E_MAIL is a hot field or requires assignment from browse
  BRW1.AddField(TIP4:IDTIPO_INSTITUCION,BRW1.Q.TIP4:IDTIPO_INSTITUCION) ! Field TIP4:IDTIPO_INSTITUCION is a hot field or requires assignment from browse
  BRW1.AddField(LOC:IDLOCALIDAD,BRW1.Q.LOC:IDLOCALIDAD)    ! Field LOC:IDLOCALIDAD is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowseINSTITUCION',QuickWindow)            ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1                                    ! Will call: UpdateINSTITUCION
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  SELF.SetAlerts()
  IF GLO:NIVEL < 4 THEN
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
    Relate:INSTITUCION.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowseINSTITUCION',QuickWindow)         ! Save window data to non-volatile store
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
    UpdateINSTITUCION
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
    OF ?SelectLOCALIDAD
      ThisWindow.Update()
      GlobalRequest = SelectRecord
      SelectLOCALIDAD()
      ThisWindow.Reset
    OF ?SelectTIPO_INSTITUCION
      ThisWindow.Update()
      GlobalRequest = SelectRecord
      SelectTIPO_INSTITUCION()
      ThisWindow.Reset
    OF ?SortOrderList
      EXECUTE(CHOICE(?SortOrderList))
       SELECT(?Tab:2)
       SELECT(?Tab:3)
       SELECT(?Tab:4)
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


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

