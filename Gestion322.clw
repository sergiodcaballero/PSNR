

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('GESTION322.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION013.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION031.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION232.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION321.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the CV file
!!! </summary>
BrowseCV PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(CV)
                       PROJECT(CV:IDCV)
                       PROJECT(CV:DESCRIPCION)
                       PROJECT(CV:IDSOCIO)
                       PROJECT(CV:IDINSTITUCION)
                       PROJECT(CV:ID_TIPO_CURSO)
                       PROJECT(CV:ANO_EGRESO)
                       PROJECT(CV:CANTIDAD_HORAS)
                       JOIN(TIP2:PK_T_CURSO,CV:ID_TIPO_CURSO)
                         PROJECT(TIP2:DESCRIPCION)
                         PROJECT(TIP2:ID_TIPO_CURSO)
                       END
                       JOIN(INS2:PK_INSTITUCION,CV:IDINSTITUCION)
                         PROJECT(INS2:NOMBRE)
                         PROJECT(INS2:IDINSTITUCION)
                       END
                       JOIN(SOC:PK_SOCIOS,CV:IDSOCIO)
                         PROJECT(SOC:MATRICULA)
                         PROJECT(SOC:NOMBRE)
                         PROJECT(SOC:IDSOCIO)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
CV:IDCV                LIKE(CV:IDCV)                  !List box control field - type derived from field
CV:DESCRIPCION         LIKE(CV:DESCRIPCION)           !List box control field - type derived from field
CV:IDSOCIO             LIKE(CV:IDSOCIO)               !List box control field - type derived from field
SOC:MATRICULA          LIKE(SOC:MATRICULA)            !List box control field - type derived from field
SOC:NOMBRE             LIKE(SOC:NOMBRE)               !List box control field - type derived from field
CV:IDINSTITUCION       LIKE(CV:IDINSTITUCION)         !List box control field - type derived from field
INS2:NOMBRE            LIKE(INS2:NOMBRE)              !List box control field - type derived from field
CV:ID_TIPO_CURSO       LIKE(CV:ID_TIPO_CURSO)         !List box control field - type derived from field
TIP2:DESCRIPCION       LIKE(TIP2:DESCRIPCION)         !List box control field - type derived from field
CV:ANO_EGRESO          LIKE(CV:ANO_EGRESO)            !List box control field - type derived from field
CV:CANTIDAD_HORAS      LIKE(CV:CANTIDAD_HORAS)        !List box control field - type derived from field
TIP2:ID_TIPO_CURSO     LIKE(TIP2:ID_TIPO_CURSO)       !Related join file key field - type derived from field
INS2:IDINSTITUCION     LIKE(INS2:IDINSTITUCION)       !Related join file key field - type derived from field
SOC:IDSOCIO            LIKE(SOC:IDSOCIO)              !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Browse the CV file'),AT(,,358,198),FONT('MS Sans Serif',8,,FONT:regular),RESIZE,CENTER, |
  GRAY,IMM,MDI,HLP('BrowseCV'),SYSTEM
                       LIST,AT(8,30,342,124),USE(?Browse:1),HVSCROLL,FORMAT('64R(2)|M~IDCV~C(0)@n-14@80L(2)|M~' & |
  'DESCRIPCION~@s50@[34L(2)|M~IDSOCIO~C(0)@n-7@45L(2)|M~MATRICULA~C(0)@n-7@120L(2)|M~NO' & |
  'MBRE~C(0)@s30@]|M~COLEGIADO~[25L(2)|M~IDINS~L(0)@n-5@200L(2)|M~NOMBRE~C(0)@s30@](151' & |
  ')|M~INTITUCION~[25L(2)|M~ID TC~L(0)@n-5@200L(2)|M~DESCRIPCION~L(0)@s30@](151)|M~TIPO' & |
  ' CURSO~53L(2)|M~ANO EGRESO~@s4@80L(2)|M~CANTIDAD HORAS~@s20@'),FROM(Queue:Browse:1),IMM, |
  MSG('Administrador de CV')
                       BUTTON('&Ver'),AT(142,158,49,14),USE(?View:2),LEFT,ICON('v.ico'),CURSOR('mano.cur'),FLAT,MSG('Visualizar'), |
  TIP('Visualizar')
                       BUTTON('&Agregar'),AT(195,158,49,14),USE(?Insert:3),LEFT,ICON('a.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Agrega Registro'),TIP('Agrega Registro')
                       BUTTON('&Cambiar'),AT(248,158,49,14),USE(?Change:3),LEFT,ICON('c.ico'),CURSOR('mano.cur'), |
  DEFAULT,FLAT,MSG('Cambia Registro'),TIP('Cambia Registro')
                       BUTTON('&Borrar'),AT(301,158,49,14),USE(?Delete:3),LEFT,ICON('b.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Borra Registro'),TIP('Borra Registro')
                       SHEET,AT(4,4,350,172),USE(?CurrentTab)
                         TAB('CV'),USE(?Tab:2)
                         END
                         TAB('INSTITUCION'),USE(?Tab:3)
                           BUTTON('Select INSTITUCION'),AT(8,158,118,14),USE(?SelectINSTITUCION),MSG('Select Parent Field'), |
  TIP('Selecciona')
                         END
                         TAB('SOCIOS'),USE(?Tab:4)
                           BUTTON('Select SOCIOS'),AT(8,158,118,14),USE(?SelectSOCIOS),MSG('Select Parent Field'),TIP('Selecciona')
                         END
                         TAB('TIPO CURSO'),USE(?Tab:5)
                           BUTTON('Select TIPO_CURSO'),AT(8,158,118,14),USE(?SelectTIPO_CURSO),MSG('Select Parent Field'), |
  TIP('Selecciona')
                         END
                         TAB('DESCRIPCION'),USE(?Tab:6)
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
BRW1::Sort4:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 5
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
  GlobalErrors.SetProcedureName('BrowseCV')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('CV:IDCV',CV:IDCV)                                  ! Added by: BrowseBox(ABC)
  BIND('CV:ID_TIPO_CURSO',CV:ID_TIPO_CURSO)                ! Added by: BrowseBox(ABC)
  BIND('CV:ANO_EGRESO',CV:ANO_EGRESO)                      ! Added by: BrowseBox(ABC)
  BIND('CV:CANTIDAD_HORAS',CV:CANTIDAD_HORAS)              ! Added by: BrowseBox(ABC)
  BIND('TIP2:ID_TIPO_CURSO',TIP2:ID_TIPO_CURSO)            ! Added by: BrowseBox(ABC)
  BIND('INS2:IDINSTITUCION',INS2:IDINSTITUCION)            ! Added by: BrowseBox(ABC)
  BIND('SOC:IDSOCIO',SOC:IDSOCIO)                          ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:CV.Open                                           ! File CV used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:CV,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?CurrentTab{PROP:WIZARD}=True
  ?SortOrderList{PROP:FROM}=|
                CHOOSE(SUB(?Tab:2{PROP:TEXT},1,1)='&',SUB(?Tab:2{PROP:TEXT},2,LEN(?Tab:2{PROP:TEXT})-1),?Tab:2{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab:3{PROP:TEXT},1,1)='&',SUB(?Tab:3{PROP:TEXT},2,LEN(?Tab:3{PROP:TEXT})-1),?Tab:3{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab:4{PROP:TEXT},1,1)='&',SUB(?Tab:4{PROP:TEXT},2,LEN(?Tab:4{PROP:TEXT})-1),?Tab:4{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab:5{PROP:TEXT},1,1)='&',SUB(?Tab:5{PROP:TEXT},2,LEN(?Tab:5{PROP:TEXT})-1),?Tab:5{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab:6{PROP:TEXT},1,1)='&',SUB(?Tab:6{PROP:TEXT},2,LEN(?Tab:6{PROP:TEXT})-1),?Tab:6{PROP:TEXT})&|
                ''
  ?SortOrderList{PROP:SELECTED}=1
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,CV:FK_CV_INSTITUCION)                 ! Add the sort order for CV:FK_CV_INSTITUCION for sort order 1
  BRW1.AddRange(CV:IDINSTITUCION,Relate:CV,Relate:INSTITUCION) ! Add file relationship range limit for sort order 1
  BRW1.AddSortOrder(,CV:FK_CV_SOCIOS)                      ! Add the sort order for CV:FK_CV_SOCIOS for sort order 2
  BRW1.AddRange(CV:IDSOCIO,Relate:CV,Relate:SOCIOS)        ! Add file relationship range limit for sort order 2
  BRW1.AddSortOrder(,CV:FK_CV_T_CURSO)                     ! Add the sort order for CV:FK_CV_T_CURSO for sort order 3
  BRW1.AddRange(CV:ID_TIPO_CURSO,Relate:CV,Relate:TIPO_CURSO) ! Add file relationship range limit for sort order 3
  BRW1.AddSortOrder(,CV:IDX_CV_DESCRIPCION)                ! Add the sort order for CV:IDX_CV_DESCRIPCION for sort order 4
  BRW1.AddLocator(BRW1::Sort4:Locator)                     ! Browse has a locator for sort order 4
  BRW1::Sort4:Locator.Init(,CV:DESCRIPCION,,BRW1)          ! Initialize the browse locator using  using key: CV:IDX_CV_DESCRIPCION , CV:DESCRIPCION
  BRW1.AddSortOrder(,CV:PK_CV)                             ! Add the sort order for CV:PK_CV for sort order 5
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 5
  BRW1::Sort0:Locator.Init(,CV:IDCV,,BRW1)                 ! Initialize the browse locator using  using key: CV:PK_CV , CV:IDCV
  BRW1.AddField(CV:IDCV,BRW1.Q.CV:IDCV)                    ! Field CV:IDCV is a hot field or requires assignment from browse
  BRW1.AddField(CV:DESCRIPCION,BRW1.Q.CV:DESCRIPCION)      ! Field CV:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(CV:IDSOCIO,BRW1.Q.CV:IDSOCIO)              ! Field CV:IDSOCIO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:MATRICULA,BRW1.Q.SOC:MATRICULA)        ! Field SOC:MATRICULA is a hot field or requires assignment from browse
  BRW1.AddField(SOC:NOMBRE,BRW1.Q.SOC:NOMBRE)              ! Field SOC:NOMBRE is a hot field or requires assignment from browse
  BRW1.AddField(CV:IDINSTITUCION,BRW1.Q.CV:IDINSTITUCION)  ! Field CV:IDINSTITUCION is a hot field or requires assignment from browse
  BRW1.AddField(INS2:NOMBRE,BRW1.Q.INS2:NOMBRE)            ! Field INS2:NOMBRE is a hot field or requires assignment from browse
  BRW1.AddField(CV:ID_TIPO_CURSO,BRW1.Q.CV:ID_TIPO_CURSO)  ! Field CV:ID_TIPO_CURSO is a hot field or requires assignment from browse
  BRW1.AddField(TIP2:DESCRIPCION,BRW1.Q.TIP2:DESCRIPCION)  ! Field TIP2:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(CV:ANO_EGRESO,BRW1.Q.CV:ANO_EGRESO)        ! Field CV:ANO_EGRESO is a hot field or requires assignment from browse
  BRW1.AddField(CV:CANTIDAD_HORAS,BRW1.Q.CV:CANTIDAD_HORAS) ! Field CV:CANTIDAD_HORAS is a hot field or requires assignment from browse
  BRW1.AddField(TIP2:ID_TIPO_CURSO,BRW1.Q.TIP2:ID_TIPO_CURSO) ! Field TIP2:ID_TIPO_CURSO is a hot field or requires assignment from browse
  BRW1.AddField(INS2:IDINSTITUCION,BRW1.Q.INS2:IDINSTITUCION) ! Field INS2:IDINSTITUCION is a hot field or requires assignment from browse
  BRW1.AddField(SOC:IDSOCIO,BRW1.Q.SOC:IDSOCIO)            ! Field SOC:IDSOCIO is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowseCV',QuickWindow)                     ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1                                    ! Will call: UpdateCV
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
    Relate:CV.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowseCV',QuickWindow)                  ! Save window data to non-volatile store
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
    UpdateCV
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
    OF ?SelectINSTITUCION
      ThisWindow.Update()
      GlobalRequest = SelectRecord
      SelectINSTITUCION()
      ThisWindow.Reset
    OF ?SelectSOCIOS
      ThisWindow.Update()
      GlobalRequest = SelectRecord
      SelectSOCIOS()
      ThisWindow.Reset
    OF ?SelectTIPO_CURSO
      ThisWindow.Update()
      GlobalRequest = SelectRecord
      SelectTIPO_CURSO()
      ThisWindow.Reset
    OF ?SortOrderList
      EXECUTE(CHOICE(?SortOrderList))
       SELECT(?Tab:2)
       SELECT(?Tab:3)
       SELECT(?Tab:4)
       SELECT(?Tab:5)
       SELECT(?Tab:6)
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
  ELSIF CHOICE(?CurrentTab) = 4
    RETURN SELF.SetSort(3,Force)
  ELSIF CHOICE(?CurrentTab) = 5
    RETURN SELF.SetSort(4,Force)
  ELSE
    RETURN SELF.SetSort(5,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

