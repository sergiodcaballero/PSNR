

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('GESTION143.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION142.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION144.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the SOCIOSXOS file by SOC3:FK_SOCIOSXOS_OS
!!! </summary>
BrowseSOCIOSXOSBySOC3:FK_SOCIOSXOS_OS PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(SOCIOSXOS)
                       PROJECT(SOC3:IDSOCIOS)
                       PROJECT(SOC3:IDOS)
                       PROJECT(SOC3:NUMERO)
                       PROJECT(SOC3:FECHA_ALTA)
                       PROJECT(SOC3:OBSERVACION)
                       JOIN(SOC:PK_SOCIOS,SOC3:IDSOCIOS)
                         PROJECT(SOC:MATRICULA)
                         PROJECT(SOC:NOMBRE)
                         PROJECT(SOC:IDSOCIO)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
SOC3:IDSOCIOS          LIKE(SOC3:IDSOCIOS)            !List box control field - type derived from field
SOC:MATRICULA          LIKE(SOC:MATRICULA)            !List box control field - type derived from field
SOC:NOMBRE             LIKE(SOC:NOMBRE)               !List box control field - type derived from field
SOC3:IDOS              LIKE(SOC3:IDOS)                !List box control field - type derived from field
SOC3:NUMERO            LIKE(SOC3:NUMERO)              !List box control field - type derived from field
SOC3:FECHA_ALTA        LIKE(SOC3:FECHA_ALTA)          !List box control field - type derived from field
SOC3:OBSERVACION       LIKE(SOC3:OBSERVACION)         !List box control field - type derived from field
SOC:IDSOCIO            LIKE(SOC:IDSOCIO)              !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Carga de Colegiados a la Obra Social'),AT(,,477,306),FONT('MS Sans Serif',8,,FONT:regular), |
  RESIZE,CENTER,GRAY,IMM,MDI,HLP('BrowseSOCIOSXOSBySOC3:FK_SOCIOSXOS_OS'),SYSTEM
                       LIST,AT(8,51,449,194),USE(?Browse:1),HVSCROLL,FORMAT('[44L(2)|M~IDSOCIOS~C(0)@n-5@52L(2' & |
  ')|M~MATRICULA~C(0)@n-5@120L(2)|M~NOMBRE~C(0)@s30@]|M~COLEGIADO~64L(2)|M~IDOS~C(0)@n-' & |
  '5@80L(2)|M~NUMERO~@s30@80R(2)|M~FECHA ALTA~C(0)@d17@80L(2)|M~OBSERVACION~@s50@'),FROM(Queue:Browse:1), |
  IMM,MSG('Administrador de SOCIOSXOS')
                       BUTTON('&Ver'),AT(257,253,49,14),USE(?View:2),LEFT,ICON('v.ico'),CURSOR('mano.cur'),FLAT,MSG('Visualizar'), |
  TIP('Visualizar')
                       BUTTON('&Agregar'),AT(311,253,49,14),USE(?Insert:3),LEFT,ICON('a.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Agrega Registro'),TIP('Agrega Registro')
                       BUTTON('&Cambiar'),AT(363,253,49,14),USE(?Change:3),LEFT,ICON('c.ico'),CURSOR('mano.cur'), |
  DEFAULT,FLAT,MSG('Cambia Registro'),TIP('Cambia Registro')
                       BUTTON('&Borrar'),AT(417,253,49,14),USE(?Delete:3),LEFT,ICON('b.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Borra Registro'),TIP('Borra Registro')
                       BUTTON('Imprimir Mandato '),AT(5,284,90,14),USE(?Button6),LEFT,ICON(ICON:Print1),FLAT
                       SHEET,AT(4,4,468,270),USE(?CurrentTab)
                         TAB,USE(?Tab:2)
                           STRING(@s30),AT(125,26),USE(OBR:NOMPRE_CORTO),FONT(,14,,FONT:bold)
                         END
                       END
                       BUTTON('&Salir'),AT(427,292,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
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
  GlobalErrors.SetProcedureName('BrowseSOCIOSXOSBySOC3:FK_SOCIOSXOS_OS')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('SOC3:FECHA_ALTA',SOC3:FECHA_ALTA)                  ! Added by: BrowseBox(ABC)
  BIND('SOC:IDSOCIO',SOC:IDSOCIO)                          ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:OBRA_SOCIAL.Open                                  ! File OBRA_SOCIAL used by this procedure, so make sure it's RelationManager is open
  Relate:SOCIOSXOS.Open                                    ! File SOCIOSXOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:SOCIOSXOS,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,SOC3:FK_SOCIOSXOS_OS)                 ! Add the sort order for SOC3:FK_SOCIOSXOS_OS for sort order 1
  BRW1.AddRange(SOC3:IDOS,Relate:SOCIOSXOS,Relate:OBRA_SOCIAL) ! Add file relationship range limit for sort order 1
  BRW1.AddField(SOC3:IDSOCIOS,BRW1.Q.SOC3:IDSOCIOS)        ! Field SOC3:IDSOCIOS is a hot field or requires assignment from browse
  BRW1.AddField(SOC:MATRICULA,BRW1.Q.SOC:MATRICULA)        ! Field SOC:MATRICULA is a hot field or requires assignment from browse
  BRW1.AddField(SOC:NOMBRE,BRW1.Q.SOC:NOMBRE)              ! Field SOC:NOMBRE is a hot field or requires assignment from browse
  BRW1.AddField(SOC3:IDOS,BRW1.Q.SOC3:IDOS)                ! Field SOC3:IDOS is a hot field or requires assignment from browse
  BRW1.AddField(SOC3:NUMERO,BRW1.Q.SOC3:NUMERO)            ! Field SOC3:NUMERO is a hot field or requires assignment from browse
  BRW1.AddField(SOC3:FECHA_ALTA,BRW1.Q.SOC3:FECHA_ALTA)    ! Field SOC3:FECHA_ALTA is a hot field or requires assignment from browse
  BRW1.AddField(SOC3:OBSERVACION,BRW1.Q.SOC3:OBSERVACION)  ! Field SOC3:OBSERVACION is a hot field or requires assignment from browse
  BRW1.AddField(SOC:IDSOCIO,BRW1.Q.SOC:IDSOCIO)            ! Field SOC:IDSOCIO is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowseSOCIOSXOSBySOC3:FK_SOCIOSXOS_OS',QuickWindow) ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1                                    ! Will call: UpdateSOCIOSXOS
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:OBRA_SOCIAL.Close
    Relate:SOCIOSXOS.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowseSOCIOSXOSBySOC3:FK_SOCIOSXOS_OS',QuickWindow) ! Save window data to non-volatile store
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
    UpdateSOCIOSXOS
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
    OF ?Button6
      Glo:IDOS      =  SOC3:IDOS
      GLO:IDSOCIO   =  SOC3:IDSOCIOS
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Button6
      ThisWindow.Update()
      START(IMPRIMIR_MANDATO, 25000)
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


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

