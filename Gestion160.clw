

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABQUERY.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('GESTION160.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION013.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION161.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the AUDITORIA File
!!! </summary>
BROWSE_AUDITORIA PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(AUDITORIA)
                       PROJECT(AUD:IDAUDITORIA)
                       PROJECT(AUD:ACCION)
                       PROJECT(AUD:IDSOCIO)
                       PROJECT(AUD:FECHA)
                       PROJECT(AUD:HORA)
                       PROJECT(AUD:IDUSUARIO)
                       JOIN(USU:PK_USUARIO,AUD:IDUSUARIO)
                         PROJECT(USU:DESCRIPCION)
                         PROJECT(USU:IDUSUARIO)
                       END
                       JOIN(SOC:PK_SOCIOS,AUD:IDSOCIO)
                         PROJECT(SOC:MATRICULA)
                         PROJECT(SOC:NOMBRE)
                         PROJECT(SOC:IDSOCIO)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
AUD:IDAUDITORIA        LIKE(AUD:IDAUDITORIA)          !List box control field - type derived from field
AUD:ACCION             LIKE(AUD:ACCION)               !List box control field - type derived from field
AUD:IDSOCIO            LIKE(AUD:IDSOCIO)              !List box control field - type derived from field
SOC:MATRICULA          LIKE(SOC:MATRICULA)            !List box control field - type derived from field
SOC:NOMBRE             LIKE(SOC:NOMBRE)               !List box control field - type derived from field
AUD:FECHA              LIKE(AUD:FECHA)                !List box control field - type derived from field
AUD:HORA               LIKE(AUD:HORA)                 !List box control field - type derived from field
AUD:IDUSUARIO          LIKE(AUD:IDUSUARIO)            !List box control field - type derived from field
USU:DESCRIPCION        LIKE(USU:DESCRIPCION)          !List box control field - type derived from field
USU:IDUSUARIO          LIKE(USU:IDUSUARIO)            !Related join file key field - type derived from field
SOC:IDSOCIO            LIKE(SOC:IDSOCIO)              !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Browse the AUDITORIA File'),AT(,,421,277),FONT('MS Sans Serif',8,,FONT:regular),RESIZE, |
  CENTER,GRAY,IMM,MDI,HLP('BROWSE_AUDITORIA'),SYSTEM
                       LIST,AT(8,39,409,197),USE(?Browse:1),HVSCROLL,FORMAT('59L(2)|M~IDAUDITORIA~C(0)@n-7@262' & |
  'L(2)|M~ACCION~@s100@[35L(2)|M~IDSOCIO~C(0)@n-7@45L(2)|M~MATRICULA~C(0)@n-7@120L(2)|M' & |
  '~NOMBRE~C(0)@s30@]|M~COLEGIADOS~49L(2)|M~FECHA~C(0)@d17@33L(2)|M~HORA~C(0)@t7@[28L(2' & |
  ')|M~IDUSU~C(0)@n-5@80L(2)|M~DESCRIPCION~C(0)@s20@]|M~USUARIO~'),FROM(Queue:Browse:1),IMM, |
  MSG('Administrador de AUDITORIA'),VCR
                       BUTTON('&Elegir'),AT(369,238,49,14),USE(?Select:2),LEFT,ICON('e.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Seleccionar'),TIP('Seleccionar')
                       BUTTON('&Filtro'),AT(6,259,57,14),USE(?Query),LEFT,ICON('qkqbe.ico'),FLAT
                       BUTTON('Imprimir'),AT(49,259,49,14),USE(?Button5),LEFT,ICON(ICON:Print1),FLAT
                       SHEET,AT(4,4,417,252),USE(?CurrentTab)
                         TAB('AUDITORIA'),USE(?Tab:1)
                         END
                         TAB('SOCIOS'),USE(?Tab:2)
                           PROMPT('IDSOCIO:'),AT(7,22),USE(?AUD:IDSOCIO:Prompt)
                           ENTRY(@n-14),AT(41,22,60,10),USE(AUD:IDSOCIO),RIGHT(1)
                           BUTTON('...'),AT(103,22,12,12),USE(?CallLookup)
                         END
                         TAB('ACCION'),USE(?Tab:3)
                         END
                       END
                       BUTTON('&Salir'),AT(371,261,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
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
QBE7                 QueryListClass                        ! QBE List Class. 
QBV7                 QueryListVisual                       ! QBE Visual Class
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::Sort1:Locator  IncrementalLocatorClass               ! Conditional Locator - CHOICE(?CurrentTab) = 2
BRW1::Sort3:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 3
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
  GlobalErrors.SetProcedureName('BROWSE_AUDITORIA')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('AUD:IDAUDITORIA',AUD:IDAUDITORIA)                  ! Added by: BrowseBox(ABC)
  BIND('USU:IDUSUARIO',USU:IDUSUARIO)                      ! Added by: BrowseBox(ABC)
  BIND('SOC:IDSOCIO',SOC:IDSOCIO)                          ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:AUDITORIA.Open                                    ! File AUDITORIA used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:AUDITORIA,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  QBE7.Init(QBV7, INIMgr,'BROWSE_AUDITORIA', GlobalErrors)
  QBE7.QkSupport = True
  QBE7.QkMenuIcon = 'QkQBE.ico'
  QBE7.QkIcon = 'QkLoad.ico'
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,AUD:FK_AUDITORIA_SOCIOS)              ! Add the sort order for AUD:FK_AUDITORIA_SOCIOS for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(?AUD:IDSOCIO,AUD:IDSOCIO,,BRW1) ! Initialize the browse locator using ?AUD:IDSOCIO using key: AUD:FK_AUDITORIA_SOCIOS , AUD:IDSOCIO
  BRW1.AddSortOrder(,AUD:IDX_AUDITRIA_ACCION)              ! Add the sort order for AUD:IDX_AUDITRIA_ACCION for sort order 2
  BRW1.AddLocator(BRW1::Sort3:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort3:Locator.Init(,AUD:ACCION,,BRW1)              ! Initialize the browse locator using  using key: AUD:IDX_AUDITRIA_ACCION , AUD:ACCION
  BRW1.AddSortOrder(,AUD:PK_AUDITORIA)                     ! Add the sort order for AUD:PK_AUDITORIA for sort order 3
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 3
  BRW1::Sort0:Locator.Init(,AUD:IDAUDITORIA,,BRW1)         ! Initialize the browse locator using  using key: AUD:PK_AUDITORIA , AUD:IDAUDITORIA
  BRW1.AddField(AUD:IDAUDITORIA,BRW1.Q.AUD:IDAUDITORIA)    ! Field AUD:IDAUDITORIA is a hot field or requires assignment from browse
  BRW1.AddField(AUD:ACCION,BRW1.Q.AUD:ACCION)              ! Field AUD:ACCION is a hot field or requires assignment from browse
  BRW1.AddField(AUD:IDSOCIO,BRW1.Q.AUD:IDSOCIO)            ! Field AUD:IDSOCIO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:MATRICULA,BRW1.Q.SOC:MATRICULA)        ! Field SOC:MATRICULA is a hot field or requires assignment from browse
  BRW1.AddField(SOC:NOMBRE,BRW1.Q.SOC:NOMBRE)              ! Field SOC:NOMBRE is a hot field or requires assignment from browse
  BRW1.AddField(AUD:FECHA,BRW1.Q.AUD:FECHA)                ! Field AUD:FECHA is a hot field or requires assignment from browse
  BRW1.AddField(AUD:HORA,BRW1.Q.AUD:HORA)                  ! Field AUD:HORA is a hot field or requires assignment from browse
  BRW1.AddField(AUD:IDUSUARIO,BRW1.Q.AUD:IDUSUARIO)        ! Field AUD:IDUSUARIO is a hot field or requires assignment from browse
  BRW1.AddField(USU:DESCRIPCION,BRW1.Q.USU:DESCRIPCION)    ! Field USU:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(USU:IDUSUARIO,BRW1.Q.USU:IDUSUARIO)        ! Field USU:IDUSUARIO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:IDSOCIO,BRW1.Q.SOC:IDSOCIO)            ! Field SOC:IDSOCIO is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BROWSE_AUDITORIA',QuickWindow)             ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.QueryControl = ?Query
  BRW1.UpdateQuery(QBE7,1)
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  SELF.SetAlerts()
  IF GLO:NIVEL < 5 THEN
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
    Relate:AUDITORIA.Close
  END
  IF SELF.Opened
    INIMgr.Update('BROWSE_AUDITORIA',QuickWindow)          ! Save window data to non-volatile store
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
    SelectSOCIOS
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
    OF ?Button5
      ThisWindow.Update()
      IMPRIMIR_AUDITORIA(BRW1.VIEW{PROP:FILTER},BRW1.VIEW{PROP:ORDER})
      ThisWindow.Reset
    OF ?AUD:IDSOCIO
      AUD:IDSOCIO = AUD:IDSOCIO
      IF Access:AUDITORIA.TryFetch(AUD:FK_AUDITORIA_SOCIOS)
        IF SELF.Run(1,SelectRecord) = RequestCompleted
          AUD:IDSOCIO = AUD:IDSOCIO
        ELSE
          SELECT(?AUD:IDSOCIO)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
    OF ?CallLookup
      ThisWindow.Update()
      AUD:IDSOCIO = AUD:IDSOCIO
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        AUD:IDSOCIO = AUD:IDSOCIO
      END
      ThisWindow.Reset(1)
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


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

