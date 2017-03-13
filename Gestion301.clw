

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('GESTION301.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION013.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION300.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION302.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the RENUNCIA file
!!! </summary>
BrowseRENUNCIA PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(RENUNCIA)
                       PROJECT(REN:IDRENUNCIA)
                       PROJECT(REN:IDSOCIO)
                       PROJECT(REN:LIBRO)
                       PROJECT(REN:FOLIO)
                       PROJECT(REN:ACTA)
                       PROJECT(REN:IDUSUARIO)
                       JOIN(SOC:PK_SOCIOS,REN:IDSOCIO)
                         PROJECT(SOC:MATRICULA)
                         PROJECT(SOC:NOMBRE)
                         PROJECT(SOC:IDSOCIO)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
REN:IDRENUNCIA         LIKE(REN:IDRENUNCIA)           !List box control field - type derived from field
REN:IDSOCIO            LIKE(REN:IDSOCIO)              !List box control field - type derived from field
SOC:MATRICULA          LIKE(SOC:MATRICULA)            !List box control field - type derived from field
SOC:NOMBRE             LIKE(SOC:NOMBRE)               !List box control field - type derived from field
REN:LIBRO              LIKE(REN:LIBRO)                !List box control field - type derived from field
REN:FOLIO              LIKE(REN:FOLIO)                !List box control field - type derived from field
REN:ACTA               LIKE(REN:ACTA)                 !List box control field - type derived from field
REN:IDUSUARIO          LIKE(REN:IDUSUARIO)            !Browse key field - type derived from field
SOC:IDSOCIO            LIKE(SOC:IDSOCIO)              !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('CANCELACION DE MATRICULA PROFESIONAL'),AT(,,421,198),FONT('MS Sans Serif',8,,FONT:regular), |
  RESIZE,CENTER,GRAY,IMM,MDI,HLP('BrowseRENUNCIA'),SYSTEM
                       LIST,AT(8,30,406,124),USE(?Browse:1),HVSCROLL,FORMAT('49L(2)|M~IDRENUNCIA~C(0)@n-7@[39L' & |
  '(2)|M~IDSOCIO~C(0)@n-7@44L(2)|M~MATRICULA~C(0)@n-7@120L(2)|M~NOMBRE~C(0)@s30@](208)|' & |
  'M~COLEGIADO~80L(2)|M~LIBRO~@s50@39L(2)|M~FOLIO~C(0)@n-7@80L(2)|M~ACTA~@s50@'),FROM(Queue:Browse:1), |
  IMM,MSG('Administrador de RENUNCIA'),VCR
                       BUTTON('&Ver'),AT(204,158,49,14),USE(?View:2),LEFT,ICON('v.ico'),CURSOR('mano.cur'),FLAT,MSG('Visualizar'), |
  TIP('Visualizar')
                       BUTTON('&Agregar'),AT(257,158,49,14),USE(?Insert:3),LEFT,ICON('a.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Agrega Registro'),TIP('Agrega Registro')
                       BUTTON('&Cambiar'),AT(310,158,49,14),USE(?Change:3),LEFT,ICON('c.ico'),CURSOR('mano.cur'), |
  DEFAULT,FLAT,MSG('Cambia Registro'),TIP('Cambia Registro')
                       BUTTON('&Borrar'),AT(363,158,49,14),USE(?Delete:3),LEFT,ICON('b.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Borra Registro'),TIP('Borra Registro')
                       SHEET,AT(4,4,415,172),USE(?CurrentTab)
                         TAB('RENUNCIA'),USE(?Tab:2)
                         END
                         TAB('SOCIOS'),USE(?Tab:3)
                           BUTTON('Select SOCIOS'),AT(8,158,118,14),USE(?SelectSOCIOS),MSG('Select Parent Field'),TIP('Selecciona')
                         END
                       END
                       BUTTON('&Salir'),AT(360,180,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Salir'),TIP('Salir')
                       BUTTON('Imprimir Resolución '),AT(5,180,90,14),USE(?Button7),LEFT,ICON(ICON:Print1),FLAT
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
  GlobalErrors.SetProcedureName('BrowseRENUNCIA')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('REN:IDRENUNCIA',REN:IDRENUNCIA)                    ! Added by: BrowseBox(ABC)
  BIND('SOC:IDSOCIO',SOC:IDSOCIO)                          ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:RENUNCIA.Open                                     ! File RENUNCIA used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:RENUNCIA,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?CurrentTab{PROP:WIZARD}=True
  ?SortOrderList{PROP:FROM}=|
                CHOOSE(SUB(?Tab:2{PROP:TEXT},1,1)='&',SUB(?Tab:2{PROP:TEXT},2,LEN(?Tab:2{PROP:TEXT})-1),?Tab:2{PROP:TEXT})&|
                '|'&CHOOSE(SUB(?Tab:3{PROP:TEXT},1,1)='&',SUB(?Tab:3{PROP:TEXT},2,LEN(?Tab:3{PROP:TEXT})-1),?Tab:3{PROP:TEXT})&|
                ''
  ?SortOrderList{PROP:SELECTED}=1
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,REN:FK_RENUNCIA_SOCIOS)               ! Add the sort order for REN:FK_RENUNCIA_SOCIOS for sort order 1
  BRW1.AddRange(REN:IDSOCIO,Relate:RENUNCIA,Relate:SOCIOS) ! Add file relationship range limit for sort order 1
  BRW1.AddSortOrder(,REN:FK_RENUNCIA_USUARIO)              ! Add the sort order for REN:FK_RENUNCIA_USUARIO for sort order 2
  BRW1.AddRange(REN:IDUSUARIO,Relate:RENUNCIA,Relate:USUARIO) ! Add file relationship range limit for sort order 2
  BRW1.AddSortOrder(,REN:PK_RENUNCIA)                      ! Add the sort order for REN:PK_RENUNCIA for sort order 3
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 3
  BRW1::Sort0:Locator.Init(,REN:IDRENUNCIA,,BRW1)          ! Initialize the browse locator using  using key: REN:PK_RENUNCIA , REN:IDRENUNCIA
  BRW1.AddField(REN:IDRENUNCIA,BRW1.Q.REN:IDRENUNCIA)      ! Field REN:IDRENUNCIA is a hot field or requires assignment from browse
  BRW1.AddField(REN:IDSOCIO,BRW1.Q.REN:IDSOCIO)            ! Field REN:IDSOCIO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:MATRICULA,BRW1.Q.SOC:MATRICULA)        ! Field SOC:MATRICULA is a hot field or requires assignment from browse
  BRW1.AddField(SOC:NOMBRE,BRW1.Q.SOC:NOMBRE)              ! Field SOC:NOMBRE is a hot field or requires assignment from browse
  BRW1.AddField(REN:LIBRO,BRW1.Q.REN:LIBRO)                ! Field REN:LIBRO is a hot field or requires assignment from browse
  BRW1.AddField(REN:FOLIO,BRW1.Q.REN:FOLIO)                ! Field REN:FOLIO is a hot field or requires assignment from browse
  BRW1.AddField(REN:ACTA,BRW1.Q.REN:ACTA)                  ! Field REN:ACTA is a hot field or requires assignment from browse
  BRW1.AddField(REN:IDUSUARIO,BRW1.Q.REN:IDUSUARIO)        ! Field REN:IDUSUARIO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:IDSOCIO,BRW1.Q.SOC:IDSOCIO)            ! Field SOC:IDSOCIO is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowseRENUNCIA',QuickWindow)               ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1                                    ! Will call: UpdateRENUNCIA
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
    Relate:RENUNCIA.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowseRENUNCIA',QuickWindow)            ! Save window data to non-volatile store
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
    UpdateRENUNCIA
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
    OF ?Button7
      GLO:IDSOCIO = REN:IDSOCIO
      IMPRIMIR_RENUNCIA_DEFINITIVA()
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?SelectSOCIOS
      ThisWindow.Update()
      GlobalRequest = SelectRecord
      SelectSOCIOS()
      ThisWindow.Reset
    OF ?SortOrderList
      EXECUTE(CHOICE(?SortOrderList))
       SELECT(?Tab:2)
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

