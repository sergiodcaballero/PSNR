

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('GESTION337.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION335.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the CONSULTRIO_ADHERENTE File
!!! </summary>
Cargar_DERENTE PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(CONSULTRIO_ADHERENTE)
                       PROJECT(CON1:IDCONSULTORIO)
                       PROJECT(CON1:IDSOCIO)
                       PROJECT(CON1:NRO)
                       PROJECT(CON1:FECHA)
                       PROJECT(CON1:FOLIO)
                       PROJECT(CON1:IDCONSUL_ADE)
                       JOIN(SOC:PK_SOCIOS,CON1:IDSOCIO)
                         PROJECT(SOC:NOMBRE)
                         PROJECT(SOC:IDSOCIO)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
CON1:IDCONSULTORIO     LIKE(CON1:IDCONSULTORIO)       !List box control field - type derived from field
CON1:IDSOCIO           LIKE(CON1:IDSOCIO)             !List box control field - type derived from field
SOC:NOMBRE             LIKE(SOC:NOMBRE)               !List box control field - type derived from field
CON1:NRO               LIKE(CON1:NRO)                 !List box control field - type derived from field
CON1:FECHA             LIKE(CON1:FECHA)               !List box control field - type derived from field
CON1:FOLIO             LIKE(CON1:FOLIO)               !List box control field - type derived from field
CON1:IDCONSUL_ADE      LIKE(CON1:IDCONSUL_ADE)        !List box control field - type derived from field
SOC:IDSOCIO            LIKE(SOC:IDSOCIO)              !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Browse the CONSULTRIO_ADHERENTE File'),AT(,,358,198),FONT('Arial',8,COLOR:Black,FONT:bold), |
  RESIZE,CENTER,GRAY,IMM,MDI,HLP('Cargar_DERENTE'),SYSTEM
                       LIST,AT(8,30,342,124),USE(?Browse:1),HVSCROLL,FORMAT('41L(2)|M~ID CONS~C(0)@n-4@[40L(2)' & |
  '|M~IDSOCIO~C(0)@n-5@339L(2)|M~NOMBRE~C(0)@s30@](171)|M~COLEGIADO~26L(2)|M~NRO~C(0)@n' & |
  '-6@49L(2)|M~FECHA~C(0)@d17@64L(2)|M~FOLIO~C(0)@n-3@25L(2)|M~ID~C(0)@n-5@'),FROM(Queue:Browse:1), |
  IMM,MSG('Administrador de CONSULTRIO_ADHERENTE')
                       BUTTON('&Ver'),AT(142,158,49,14),USE(?View:2),LEFT,ICON('v.ico'),CURSOR('mano.cur'),FLAT,MSG('Visualizar'), |
  TIP('Visualizar')
                       BUTTON('&Agregar'),AT(195,158,49,14),USE(?Insert:3),LEFT,ICON('a.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Agrega Registro'),TIP('Agrega Registro')
                       BUTTON('&Cambiar'),AT(248,158,49,14),USE(?Change:3),LEFT,ICON('c.ico'),CURSOR('mano.cur'), |
  DEFAULT,FLAT,MSG('Cambia Registro'),TIP('Cambia Registro')
                       BUTTON('&Borrar'),AT(301,158,49,14),USE(?Delete:3),LEFT,ICON('b.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Borra Registro'),TIP('Borra Registro')
                       SHEET,AT(4,4,350,172),USE(?CurrentTab)
                         TAB('CONSULTRIO ADHERENTE'),USE(?Tab:2)
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
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
SetAlerts              PROCEDURE(),DERIVED
                     END

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
  GlobalErrors.SetProcedureName('Cargar_DERENTE')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('CON1:IDCONSUL_ADE',CON1:IDCONSUL_ADE)              ! Added by: BrowseBox(ABC)
  BIND('SOC:IDSOCIO',SOC:IDSOCIO)                          ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:CONSULTORIO.Open                                  ! File CONSULTORIO used by this procedure, so make sure it's RelationManager is open
  Relate:CONSULTRIO_ADHERENTE.Open                         ! File CONSULTRIO_ADHERENTE used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:CONSULTRIO_ADHERENTE,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,CON1:FK_CONSULTRIO_ADHERENTE_CONSUL)  ! Add the sort order for CON1:FK_CONSULTRIO_ADHERENTE_CONSUL for sort order 1
  BRW1.AddRange(CON1:IDCONSULTORIO,Relate:CONSULTRIO_ADHERENTE,Relate:CONSULTORIO) ! Add file relationship range limit for sort order 1
  BRW1.AddField(CON1:IDCONSULTORIO,BRW1.Q.CON1:IDCONSULTORIO) ! Field CON1:IDCONSULTORIO is a hot field or requires assignment from browse
  BRW1.AddField(CON1:IDSOCIO,BRW1.Q.CON1:IDSOCIO)          ! Field CON1:IDSOCIO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:NOMBRE,BRW1.Q.SOC:NOMBRE)              ! Field SOC:NOMBRE is a hot field or requires assignment from browse
  BRW1.AddField(CON1:NRO,BRW1.Q.CON1:NRO)                  ! Field CON1:NRO is a hot field or requires assignment from browse
  BRW1.AddField(CON1:FECHA,BRW1.Q.CON1:FECHA)              ! Field CON1:FECHA is a hot field or requires assignment from browse
  BRW1.AddField(CON1:FOLIO,BRW1.Q.CON1:FOLIO)              ! Field CON1:FOLIO is a hot field or requires assignment from browse
  BRW1.AddField(CON1:IDCONSUL_ADE,BRW1.Q.CON1:IDCONSUL_ADE) ! Field CON1:IDCONSUL_ADE is a hot field or requires assignment from browse
  BRW1.AddField(SOC:IDSOCIO,BRW1.Q.SOC:IDSOCIO)            ! Field SOC:IDSOCIO is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('Cargar_DERENTE',QuickWindow)               ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1                                    ! Will call: Formulario_CONSULTRIO_ADHERENTE
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:CONSULTORIO.Close
    Relate:CONSULTRIO_ADHERENTE.Close
  END
  IF SELF.Opened
    INIMgr.Update('Cargar_DERENTE',QuickWindow)            ! Save window data to non-volatile store
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
    Formulario_CONSULTRIO_ADHERENTE
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


BRW1.SetAlerts PROCEDURE

  CODE
  SELF.EditViaPopup = False
  PARENT.SetAlerts


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

