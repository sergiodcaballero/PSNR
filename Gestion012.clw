

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABPRHTML.INC'),ONCE
   INCLUDE('ABPRPDF.INC'),ONCE
   INCLUDE('ABQUERY.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABUTIL.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE
   INCLUDE('abprtext.inc'),ONCE
   INCLUDE('abprxml.inc'),ONCE
   INCLUDE('abrppsel.inc'),ONCE

                     MAP
                       INCLUDE('GESTION012.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION002.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION013.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Actualizacion CONF_EMP
!!! </summary>
CONF_EMP2 PROCEDURE 

CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
LOC:FOTO             STRING(255)                           ! 
LOC:FIRMA2           STRING(255)                           ! 
PhotoChanged         BYTE                                  ! 
History::COF:Record  LIKE(COF:RECORD),THREAD
QuickWindow          WINDOW('Configuraición de Datos de la Empresa'),AT(,,294,288),FONT('Arial',8,,FONT:bold),RESIZE, |
  CENTER,GRAY,IMM,MDI,HLP('CONF_EMP'),SYSTEM
                       BUTTON('&Aceptar'),AT(188,273,49,14),USE(?OK),LEFT,ICON('ok.ico'),CURSOR('mano.cur'),DEFAULT, |
  FLAT,MSG('Confirma y Actualiza el Formulario'),TIP('Confirma y Actualiza el Formulario')
                       BUTTON('&Cancelar'),AT(240,273,49,14),USE(?Cancel),LEFT,ICON('cancelar.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Cancela Operacion'),TIP('Cancela Operacion')
                       SHEET,AT(1,3,290,266),USE(?Sheet1)
                         TAB('DATOS DE LA EMPRESA'),USE(?Tab1)
                           PROMPT('RAZON SOCIAL:'),AT(5,23),USE(?COF:RAZON_SOCIAL:Prompt),TRN
                           ENTRY(@s100),AT(78,23,204,10),USE(COF:RAZON_SOCIAL)
                           PROMPT('CUIT:'),AT(5,35),USE(?COF:CUIT:Prompt),TRN
                           ENTRY(@s11),AT(78,35,48,10),USE(COF:CUIT)
                           PROMPT('DIRECCION:'),AT(5,48),USE(?COF:DIRECCION:Prompt),TRN
                           ENTRY(@s50),AT(78,48,204,10),USE(COF:DIRECCION)
                           PROMPT('TELEFONOS:'),AT(5,63),USE(?COF:TELEFONOS:Prompt),TRN
                           ENTRY(@s30),AT(78,63,124,10),USE(COF:TELEFONOS)
                           PROMPT('CONTROL  CUOTA:'),AT(5,79),USE(?COF:CONTROL_CUOTA:Prompt),TRN
                           ENTRY(@n-14),AT(78,79,64,10),USE(COF:CONTROL_CUOTA),RIGHT(1)
                           PROMPT('LEY:'),AT(5,92),USE(?COF:LEY:Prompt)
                           ENTRY(@s40),AT(78,92,204,10),USE(COF:LEY)
                           PROMPT('PERSONERIA JURIDICA:'),AT(5,107),USE(?COF:PER_JUR:Prompt)
                           ENTRY(@s20),AT(78,107,204,10),USE(COF:PER_JUR)
                           PROMPT('% GASTO ADM:'),AT(5,122),USE(?COF:PORCENTAJE_LIQUIDACION:Prompt)
                           ENTRY(@n10.2),AT(78,122,25,10),USE(COF:PORCENTAJE_LIQUIDACION)
                           PROMPT('% IMP CHEQUE:'),AT(202,122),USE(?COF:IMP_CHEQUE:Prompt)
                           ENTRY(@n-10.2),AT(250,122,31,10),USE(COF:IMP_CHEQUE),DECIMAL(12)
                           PROMPT('CHEQUERA:'),AT(114,122),USE(?COF:CHEQUERA:Prompt)
                           ENTRY(@n$-10.2),AT(152,122,39,10),USE(COF:CHEQUERA)
                           GROUP('Firmas'),AT(6,136,273,131),USE(?Group2),BOXED
                             PROMPT('Firma 1:'),AT(22,166),USE(?Prompt12)
                             TEXT,AT(66,147,205,48),USE(COF:FIRMA1),BOXED
                             TEXT,AT(66,197,205,48),USE(COF:FIRMA2),BOXED
                             STRING('Firma 2'),AT(23,216),USE(?String1)
                             PROMPT('FIRMA 3:'),AT(25,249),USE(?COF:FIRMA3:Prompt)
                             ENTRY(@s50),AT(65,248,204,10),USE(COF:FIRMA3)
                           END
                         END
                         TAB('CONFIGURACION E-MAIL'),USE(?Tab2)
                           PROMPT('EMAIL:'),AT(5,27),USE(?COF:EMAIL:Prompt),TRN
                           ENTRY(@s50),AT(62,28,204,10),USE(COF:EMAIL)
                           PROMPT('SMTP:'),AT(5,42),USE(?COF:SMTP:Prompt)
                           ENTRY(@s49),AT(62,42,204,10),USE(COF:SMTP)
                           PROMPT('USUARIO SMTP:'),AT(5,57),USE(?COF:USUARIO_SMTP:Prompt)
                           ENTRY(@s49),AT(62,56,191,10),USE(COF:USUARIO_SMTP)
                           PROMPT('PASSWORD SMTP:'),AT(5,71),USE(?COF:PASSWORD_SMTP:Prompt)
                           ENTRY(@s20),AT(62,70,191,10),USE(COF:PASSWORD_SMTP),PASSWORD
                           PROMPT('SEGURO:'),AT(5,85),USE(?COF:SMTP_SEGURO:Prompt)
                           ENTRY(@n-14),AT(61,85,15,10),USE(COF:SMTP_SEGURO),RIGHT(1)
                           PROMPT('PUERTO:'),AT(82,85),USE(?COF:PUERTO:Prompt)
                           ENTRY(@n-14),AT(110,85,23,10),USE(COF:PUERTO),RIGHT(1)
                         END
                         TAB('FIRMAS'),USE(?Tab3)
                           GROUP('FIRMA'),AT(8,25,273,234),USE(?Group1),BOXED
                             ENTRY(@s255),AT(38,34,195,10),USE(LOC:FOTO)
                             BUTTON('...'),AT(237,33,12,12),USE(?LookupFile)
                             IMAGE,AT(79,170,101,49),USE(?Image2)
                             PROMPT('FIRMA 2:'),AT(13,138),USE(?LOC:FIRMA2:Prompt)
                             ENTRY(@s255),AT(46,138,187,10),USE(LOC:FIRMA2)
                             BUTTON('...'),AT(236,137,12,12),USE(?LookupFile:2)
                             PROMPT('Firma 1:'),AT(11,35),USE(?LOC:FOTO:Prompt)
                             IMAGE,AT(86,54,101,49),USE(?Image1)
                             LINE,AT(13,125,263,0),USE(?Line1),COLOR(COLOR:Black)
                           END
                         END
                       END
                     END

ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeCompleted          PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

FileLookup7          SelectFileClass
FileLookup8          SelectFileClass
CurCtrlFeq          LONG
FieldColorQueue     QUEUE
Feq                   LONG
OldColor              LONG
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
DisplayImage  ROUTINE
  IF ?Image1{PROP:Height} > 100
    AspectRatio$ = ?Image1{PROP:Width}/?Image1{PROP:Height}
    ?Image1{PROP:Height} = 100
    ?Image1{PROP:Width} = 100 * AspectRatio$
  END
  IF ?Image1{PROP:Width} > 100
    AspectRatio$ = ?Image1{PROP:Height}/?Image1{PROP:Width}
    ?Image1{PROP:Width} = 100
    ?Image1{PROP:Height} = 100 * AspectRatio$
  END

IF ?Image2{PROP:Height} > 100
    AspectRatio$ = ?Image2{PROP:Width}/?Image2{PROP:Height}
    ?Image2{PROP:Height} = 100
    ?Image2{PROP:Width} = 100 * AspectRatio$
  END
  IF ?Image2{PROP:Width} > 100
    AspectRatio$ = ?Image2{PROP:Height}/?Image2{PROP:Width}
    ?Image2{PROP:Width} = 100
    ?Image2{PROP:Height} = 100 * AspectRatio$
  END

ThisWindow.Ask PROCEDURE

  CODE
  CASE SELF.Request                                        ! Configure the action message text
  OF ViewRecord
    ActionMessage = 'Visualizando Registro'
  OF InsertRecord
    ActionMessage = 'Insertando Registro'
  OF ChangeRecord
    ActionMessage = 'Cambiando Registro'
  OF DeleteRecord
    GlobalErrors.Throw(Msg:DeleteIllegal)
    RETURN
  END
  QuickWindow{PROP:Text} = ActionMessage                   ! Display status message in title bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('CONF_EMP2')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?OK
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(COF:Record,History::COF:Record)
  SELF.AddHistoryField(?COF:RAZON_SOCIAL,3)
  SELF.AddHistoryField(?COF:CUIT,4)
  SELF.AddHistoryField(?COF:DIRECCION,5)
  SELF.AddHistoryField(?COF:TELEFONOS,6)
  SELF.AddHistoryField(?COF:CONTROL_CUOTA,8)
  SELF.AddHistoryField(?COF:LEY,12)
  SELF.AddHistoryField(?COF:PER_JUR,13)
  SELF.AddHistoryField(?COF:PORCENTAJE_LIQUIDACION,14)
  SELF.AddHistoryField(?COF:IMP_CHEQUE,15)
  SELF.AddHistoryField(?COF:CHEQUERA,16)
  SELF.AddHistoryField(?COF:FIRMA1,9)
  SELF.AddHistoryField(?COF:FIRMA2,10)
  SELF.AddHistoryField(?COF:FIRMA3,11)
  SELF.AddHistoryField(?COF:EMAIL,7)
  SELF.AddHistoryField(?COF:SMTP,17)
  SELF.AddHistoryField(?COF:USUARIO_SMTP,18)
  SELF.AddHistoryField(?COF:PASSWORD_SMTP,19)
  SELF.AddHistoryField(?COF:SMTP_SEGURO,20)
  SELF.AddHistoryField(?COF:PUERTO,21)
  SELF.AddUpdateFile(Access:CONF_EMP)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:CONF_EMP.Open                                     ! File CONF_EMP used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:CONF_EMP
  IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing ! Setup actions for ViewOnly Mode
    SELF.InsertAction = Insert:None
    SELF.DeleteAction = Delete:None
    SELF.ChangeAction = Change:None
    SELF.CancelAction = Cancel:Cancel
    SELF.OkControl = 0
  ELSE
    SELF.DeleteAction = Delete:None                        ! Deletes not allowed
    SELF.ChangeAction = Change:Caller                      ! Changes allowed
    SELF.CancelAction = Cancel:Cancel+Cancel:Query         ! Confirm cancel
    SELF.OkControl = ?OK
    IF SELF.PrimeUpdate() THEN RETURN Level:Notify.
  END
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    ?COF:RAZON_SOCIAL{PROP:ReadOnly} = True
    ?COF:CUIT{PROP:ReadOnly} = True
    ?COF:DIRECCION{PROP:ReadOnly} = True
    ?COF:TELEFONOS{PROP:ReadOnly} = True
    ?COF:CONTROL_CUOTA{PROP:ReadOnly} = True
    ?COF:LEY{PROP:ReadOnly} = True
    ?COF:PER_JUR{PROP:ReadOnly} = True
    ?COF:PORCENTAJE_LIQUIDACION{PROP:ReadOnly} = True
    ?COF:IMP_CHEQUE{PROP:ReadOnly} = True
    ?COF:CHEQUERA{PROP:ReadOnly} = True
    ?COF:FIRMA1{PROP:ReadOnly} = True
    ?COF:FIRMA2{PROP:ReadOnly} = True
    ?COF:FIRMA3{PROP:ReadOnly} = True
    ?COF:EMAIL{PROP:ReadOnly} = True
    ?COF:SMTP{PROP:ReadOnly} = True
    ?COF:USUARIO_SMTP{PROP:ReadOnly} = True
    ?COF:PASSWORD_SMTP{PROP:ReadOnly} = True
    ?COF:SMTP_SEGURO{PROP:ReadOnly} = True
    ?COF:PUERTO{PROP:ReadOnly} = True
    ?LOC:FOTO{PROP:ReadOnly} = True
    DISABLE(?LookupFile)
    ?LOC:FIRMA2{PROP:ReadOnly} = True
    DISABLE(?LookupFile:2)
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  !Display photo from stored BLOB
  ?Image1{PROP:NoWidth} = TRUE
  ?Image1{PROP:NoHeight} = TRUE
  IF SELF.OriginalRequest <> InsertRecord
    ?Image1{PROP:ImageBlob} = COF:LOGO{PROP:Handle}
  ELSE
    ?Image1{PROP:Text} = 'NoPhoto.BMP'
    PhotoChanged = TRUE
  END
  !LOC:FOTO = ''
  DO DisplayImage
  
  ?Image2{PROP:NoWidth} = TRUE
  ?Image2{PROP:NoHeight} = TRUE
  IF SELF.OriginalRequest <> InsertRecord
    ?Image2{PROP:ImageBlob} = COF:LOGO_FIRMA2{PROP:Handle}
  ELSE
    ?Image2{PROP:Text} = 'NoPhoto.BMP'
    PhotoChanged = TRUE
  END
  !LOC:FOTO = ''
  DO DisplayImage
  
  INIMgr.Fetch('CONF_EMP2',QuickWindow)                    ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  FileLookup7.Init
  FileLookup7.ClearOnCancel = True
  FileLookup7.Flags=BOR(FileLookup7.Flags,FILE:LongName)   ! Allow long filenames
  FileLookup7.SetMask('BMP','*.GIF;*.BMP;*.JPG;*.PCX')     ! Set the file mask
  FileLookup8.Init
  FileLookup8.ClearOnCancel = True
  FileLookup8.Flags=BOR(FileLookup8.Flags,FILE:LongName)   ! Allow long filenames
  FileLookup8.SetMask('BMP','*.GIF;*.BMP;*.JPG;*.PCX')     ! Set the file mask
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:CONF_EMP.Close
  END
  IF SELF.Opened
    INIMgr.Update('CONF_EMP2',QuickWindow)                 ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Run PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run()
  IF SELF.Request = ViewRecord                             ! In View Only mode always signal RequestCancelled
    ReturnValue = RequestCancelled
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
    OF ?OK
      ThisWindow.Update()
      IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing THEN
         POST(EVENT:CloseWindow)
      END
    OF ?LOC:FOTO
      !Display photo from selected disk file
      IF NOT TARGET{PROP:AcceptAll}
        ?Image1{PROP:NoWidth} = TRUE
        ?Image1{PROP:NoHeight} = TRUE
        ?Image1{PROP:Text} = LOC:FOTO
        DO DisplayImage
        
        PhotoChanged = TRUE
      END
      
    OF ?LookupFile
      ThisWindow.Update()
      LOC:FOTO = FileLookup7.Ask(0)
      DISPLAY
      !Display photo from selected disk file
      IF NOT TARGET{PROP:AcceptAll} AND LOC:FOTO <> ''
        ?Image1{PROP:NoWidth} = TRUE
        ?Image1{PROP:NoHeight} = TRUE
        ?Image1{PROP:Text} = LOC:FOTO
        DO DisplayImage
        
        PhotoChanged = TRUE
      END
    OF ?LOC:FIRMA2
      IF NOT TARGET{PROP:AcceptAll}
        ?Image2{PROP:NoWidth} = TRUE
        ?Image2{PROP:NoHeight} = TRUE
        ?Image2{PROP:Text} = LOC:FIRMA2
        DO DisplayImage
        
        PhotoChanged = TRUE
      END
      
    OF ?LookupFile:2
      ThisWindow.Update()
      LOC:FIRMA2 = FileLookup8.Ask(0)
      DISPLAY
      !Display photo from selected disk file
      IF NOT TARGET{PROP:AcceptAll} AND LOC:FOTO <> ''
        ?Image2{PROP:NoWidth} = TRUE
        ?Image2{PROP:NoHeight} = TRUE
        ?Image2{PROP:Text} = LOC:FIRMA2
        DO DisplayImage
        
        PhotoChanged = TRUE
      END
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeCompleted PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  !Update Photo BLOB on disk
  IF PhotoChanged = TRUE
    COF:LOGO{PROP:size} = 0
    COF:LOGO{PROP:Handle} = ?Image1{PROP:ImageBlob}
  END
  !Update Photo BLOB on disk
  IF PhotoChanged = TRUE
    COF:LOGO_FIRMA2{PROP:size} = 0
    COF:LOGO_FIRMA2{PROP:Handle} = ?Image2{PROP:ImageBlob}
  ENd
  ReturnValue = PARENT.TakeCompleted()
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


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Window
!!! Administrador de CONF_EMP
!!! </summary>
CONF_EMP PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(CONF_EMP)
                       PROJECT(COF:RAZON_SOCIAL)
                       PROJECT(COF:CUIT)
                       PROJECT(COF:DIRECCION)
                       PROJECT(COF:TELEFONOS)
                       PROJECT(COF:EMAIL)
                       PROJECT(COF:CONTROL_CUOTA)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
COF:RAZON_SOCIAL       LIKE(COF:RAZON_SOCIAL)         !List box control field - type derived from field
COF:CUIT               LIKE(COF:CUIT)                 !List box control field - type derived from field
COF:DIRECCION          LIKE(COF:DIRECCION)            !List box control field - type derived from field
COF:TELEFONOS          LIKE(COF:TELEFONOS)            !List box control field - type derived from field
COF:EMAIL              LIKE(COF:EMAIL)                !List box control field - type derived from field
COF:CONTROL_CUOTA      LIKE(COF:CONTROL_CUOTA)        !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Administrador de CONF_EMP'),AT(,,358,198),FONT('MS Sans Serif',8,,FONT:regular),RESIZE, |
  CENTER,GRAY,IMM,MDI,HLP('CONF_EMP'),SYSTEM
                       LIST,AT(8,30,342,124),USE(?Browse:1),HVSCROLL,FORMAT('80L(2)|M~RAZON_SOCIAL~L(2)@s100@4' & |
  '8L(2)|M~CUIT~L(2)@s11@80L(2)|M~DIRECCION~L(2)@s50@80L(2)|M~TELEFONOS~L(2)@s30@80L(2)' & |
  '|M~EMAIL~L(2)@s50@64R(2)|M~CONTROL_CUOTA~C(0)@n-14@'),FROM(Queue:Browse:1),IMM,MSG('Administra' & |
  'dor de CONF_EMP')
                       BUTTON('&Elegir'),AT(89,158,49,14),USE(?Select:2),LEFT,ICON('e.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Seleccionar'),TIP('Seleccionar')
                       BUTTON('&Ver'),AT(142,158,49,14),USE(?View:3),LEFT,ICON('v.ico'),CURSOR('mano.cur'),FLAT,MSG('Visualizar'), |
  TIP('Visualizar')
                       BUTTON('&Agregar'),AT(195,158,49,14),USE(?Insert:4),LEFT,ICON('a.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Agrega Registro'),TIP('Agrega Registro')
                       BUTTON('&Cambiar'),AT(248,158,49,14),USE(?Change:4),LEFT,ICON('c.ico'),CURSOR('mano.cur'), |
  DEFAULT,FLAT,MSG('Cambia Registro'),TIP('Cambia Registro')
                       BUTTON('&Borrar'),AT(301,158,49,14),USE(?Delete:4),LEFT,ICON('b.ico'),CURSOR('mano.cur'),DISABLE, |
  FLAT,HIDE,MSG('Borra Registro'),SKIP,TIP('Borra Registro')
                       SHEET,AT(4,4,350,172),USE(?CurrentTab)
                         TAB('PK_CONF_EMP'),USE(?Tab:2)
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
  GlobalErrors.SetProcedureName('CONF_EMP')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('COF:RAZON_SOCIAL',COF:RAZON_SOCIAL)                ! Added by: BrowseBox(ABC)
  BIND('COF:CONTROL_CUOTA',COF:CONTROL_CUOTA)              ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:CONF_EMP.Open                                     ! File CONF_EMP used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:CONF_EMP,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,COF:PK_CONF_EMP)                      ! Add the sort order for COF:PK_CONF_EMP for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,COF:RAZON_SOCIAL,,BRW1)        ! Initialize the browse locator using  using key: COF:PK_CONF_EMP , COF:RAZON_SOCIAL
  BRW1.AddField(COF:RAZON_SOCIAL,BRW1.Q.COF:RAZON_SOCIAL)  ! Field COF:RAZON_SOCIAL is a hot field or requires assignment from browse
  BRW1.AddField(COF:CUIT,BRW1.Q.COF:CUIT)                  ! Field COF:CUIT is a hot field or requires assignment from browse
  BRW1.AddField(COF:DIRECCION,BRW1.Q.COF:DIRECCION)        ! Field COF:DIRECCION is a hot field or requires assignment from browse
  BRW1.AddField(COF:TELEFONOS,BRW1.Q.COF:TELEFONOS)        ! Field COF:TELEFONOS is a hot field or requires assignment from browse
  BRW1.AddField(COF:EMAIL,BRW1.Q.COF:EMAIL)                ! Field COF:EMAIL is a hot field or requires assignment from browse
  BRW1.AddField(COF:CONTROL_CUOTA,BRW1.Q.COF:CONTROL_CUOTA) ! Field COF:CONTROL_CUOTA is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('CONF_EMP',QuickWindow)                     ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1                                    ! Will call: CONF_EMP2
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:CONF_EMP.Close
  END
  IF SELF.Opened
    INIMgr.Update('CONF_EMP',QuickWindow)                  ! Save window data to non-volatile store
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
    CONF_EMP2
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
  SELF.SelectControl = ?Select:2
  SELF.HideSelect = 1                                      ! Hide the select button when disabled
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert:4
    SELF.ChangeControl=?Change:4
    SELF.DeleteControl=?Delete:4
  END
  SELF.ViewControl = ?View:3                               ! Setup the control used to initiate view only mode


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Window
!!! Actualizacion CIRCULO
!!! </summary>
UpdateCIRCULO PROCEDURE 

CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
History::CIR:Record  LIKE(CIR:RECORD),THREAD
QuickWindow          WINDOW('Actualizacion DISTRITO'),AT(,,345,62),FONT('MS Sans Serif',8,,FONT:regular),RESIZE, |
  CENTER,GRAY,IMM,MDI,HLP('UpdateCIRCULO'),SYSTEM
                       PROMPT('DESCRIPCION:'),AT(7,4),USE(?CIR:DESCRIPCION:Prompt),TRN
                       ENTRY(@s50),AT(73,4,271,10),USE(CIR:DESCRIPCION)
                       PROMPT('NOMBRE CORTO:'),AT(7,18),USE(?CIR:NOMBRE_CORTO:Prompt),TRN
                       ENTRY(@s20),AT(73,18,84,10),USE(CIR:NOMBRE_CORTO)
                       BUTTON('&Aceptar'),AT(50,42,49,14),USE(?OK),LEFT,ICON('ok.ico'),CURSOR('mano.cur'),DEFAULT, |
  FLAT,MSG('Confirma y Actualiza el Formulario'),TIP('Confirma y Actualiza el Formulario')
                       BUTTON('&Cancelar'),AT(103,42,56,14),USE(?Cancel),LEFT,ICON('cancelar.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Cancela Operacion'),TIP('Cancela Operacion')
                     END

ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
ToolbarForm          ToolbarUpdateClass                    ! Form Toolbar Manager
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

CurCtrlFeq          LONG
FieldColorQueue     QUEUE
Feq                   LONG
OldColor              LONG
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

ThisWindow.Ask PROCEDURE

  CODE
  CASE SELF.Request                                        ! Configure the action message text
  OF ViewRecord
    ActionMessage = 'Visualizando Registro'
  OF InsertRecord
    ActionMessage = 'Insertando Registro'
  OF ChangeRecord
    ActionMessage = 'Cambiando Registro'
  END
  QuickWindow{PROP:Text} = ActionMessage                   ! Display status message in title bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('UpdateCIRCULO')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?CIR:DESCRIPCION:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(CIR:Record,History::CIR:Record)
  SELF.AddHistoryField(?CIR:DESCRIPCION,2)
  SELF.AddHistoryField(?CIR:NOMBRE_CORTO,3)
  SELF.AddUpdateFile(Access:CIRCULO)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:CIRCULO.Open                                      ! File CIRCULO used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:CIRCULO
  IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing ! Setup actions for ViewOnly Mode
    SELF.InsertAction = Insert:None
    SELF.DeleteAction = Delete:None
    SELF.ChangeAction = Change:None
    SELF.CancelAction = Cancel:Cancel
    SELF.OkControl = 0
  ELSE
    SELF.ChangeAction = Change:Caller                      ! Changes allowed
    SELF.CancelAction = Cancel:Cancel+Cancel:Query         ! Confirm cancel
    SELF.OkControl = ?OK
    IF SELF.PrimeUpdate() THEN RETURN Level:Notify.
  END
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    ?CIR:DESCRIPCION{PROP:ReadOnly} = True
    ?CIR:NOMBRE_CORTO{PROP:ReadOnly} = True
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdateCIRCULO',QuickWindow)                ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  SELF.AddItem(ToolbarForm)
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:CIRCULO.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateCIRCULO',QuickWindow)             ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Run PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run()
  IF SELF.Request = ViewRecord                             ! In View Only mode always signal RequestCancelled
    ReturnValue = RequestCancelled
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
    OF ?OK
      ThisWindow.Update()
      IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing THEN
         POST(EVENT:CloseWindow)
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


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the CIRCULO File
!!! </summary>
BrowseCIRCULOS PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(CIRCULO)
                       PROJECT(CIR:IDCIRCULO)
                       PROJECT(CIR:DESCRIPCION)
                       PROJECT(CIR:NOMBRE_CORTO)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
CIR:IDCIRCULO          LIKE(CIR:IDCIRCULO)            !List box control field - type derived from field
CIR:DESCRIPCION        LIKE(CIR:DESCRIPCION)          !List box control field - type derived from field
CIR:NOMBRE_CORTO       LIKE(CIR:NOMBRE_CORTO)         !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('ABM DISTRITO '),AT(,,277,198),FONT('MS Sans Serif',8,,FONT:regular),RESIZE,CENTER, |
  GRAY,IMM,MDI,HLP('BrowseCIRCULOS'),SYSTEM
                       LIST,AT(8,30,261,124),USE(?Browse:1),HVSCROLL,FORMAT('64R(2)|M~ID DISTRITO~C(0)@n-14@80' & |
  'L(2)|M~DESCRIPCION~@s30@80L(2)|M~NOMBRE CORTO~@s20@'),FROM(Queue:Browse:1),IMM,MSG('Administra' & |
  'dor de CIRCULO')
                       BUTTON('&Elegir'),AT(8,158,49,14),USE(?Select:2),LEFT,ICON('e.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Seleccionar'),TIP('Seleccionar')
                       BUTTON('&Ver'),AT(61,158,49,14),USE(?View:3),LEFT,ICON('v.ico'),CURSOR('mano.cur'),FLAT,MSG('Visualizar'), |
  TIP('Visualizar')
                       BUTTON('&Agregar'),AT(114,158,49,14),USE(?Insert:4),LEFT,ICON('a.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Agrega Registro'),TIP('Agrega Registro')
                       BUTTON('&Cambiar'),AT(167,158,49,14),USE(?Change:4),LEFT,ICON('c.ico'),CURSOR('mano.cur'), |
  DEFAULT,FLAT,MSG('Cambia Registro'),TIP('Cambia Registro')
                       BUTTON('&Borrar'),AT(220,158,49,14),USE(?Delete:4),LEFT,ICON('b.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Borra Registro'),TIP('Borra Registro')
                       SHEET,AT(4,4,269,172),USE(?CurrentTab)
                         TAB('ID'),USE(?Tab:2)
                         END
                         TAB('DESCRIPCION'),USE(?Tab:3)
                         END
                       END
                       BUTTON('&Salir'),AT(224,180,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
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
  GlobalErrors.SetProcedureName('BrowseCIRCULOS')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('CIR:IDCIRCULO',CIR:IDCIRCULO)                      ! Added by: BrowseBox(ABC)
  BIND('CIR:NOMBRE_CORTO',CIR:NOMBRE_CORTO)                ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:CIRCULO.Open                                      ! File CIRCULO used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:CIRCULO,SELF) ! Initialize the browse manager
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
  BRW1.AddSortOrder(,CIR:IDX_CIRCULO)                      ! Add the sort order for CIR:IDX_CIRCULO for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,CIR:DESCRIPCION,,BRW1)         ! Initialize the browse locator using  using key: CIR:IDX_CIRCULO , CIR:DESCRIPCION
  BRW1.AddSortOrder(,CIR:PK_CIRCULO)                       ! Add the sort order for CIR:PK_CIRCULO for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(,CIR:IDCIRCULO,,BRW1)           ! Initialize the browse locator using  using key: CIR:PK_CIRCULO , CIR:IDCIRCULO
  BRW1.AddField(CIR:IDCIRCULO,BRW1.Q.CIR:IDCIRCULO)        ! Field CIR:IDCIRCULO is a hot field or requires assignment from browse
  BRW1.AddField(CIR:DESCRIPCION,BRW1.Q.CIR:DESCRIPCION)    ! Field CIR:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(CIR:NOMBRE_CORTO,BRW1.Q.CIR:NOMBRE_CORTO)  ! Field CIR:NOMBRE_CORTO is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowseCIRCULOS',QuickWindow)               ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1                                    ! Will call: UpdateCIRCULO
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
    Relate:CIRCULO.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowseCIRCULOS',QuickWindow)            ! Save window data to non-volatile store
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
    UpdateCIRCULO
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
  SELF.SelectControl = ?Select:2
  SELF.HideSelect = 1                                      ! Hide the select button when disabled
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert:4
    SELF.ChangeControl=?Change:4
    SELF.DeleteControl=?Delete:4
  END
  SELF.ViewControl = ?View:3                               ! Setup the control used to initiate view only mode


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

!!! <summary>
!!! Generated from procedure template - Window
!!! Select a OBRA_SOCIAL Record
!!! </summary>
SelectOBRA_SOCIAL PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(OBRA_SOCIAL)
                       PROJECT(OBR:IDOS)
                       PROJECT(OBR:NOMPRE_CORTO)
                       PROJECT(OBR:NOMBRE)
                       PROJECT(OBR:DIRECCION)
                       PROJECT(OBR:PRONTO_PAGO)
                       PROJECT(OBR:FECHA_BAJA)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
OBR:IDOS               LIKE(OBR:IDOS)                 !List box control field - type derived from field
OBR:IDOS_Icon          LONG                           !Entry's icon ID
OBR:NOMPRE_CORTO       LIKE(OBR:NOMPRE_CORTO)         !List box control field - type derived from field
OBR:NOMBRE             LIKE(OBR:NOMBRE)               !List box control field - type derived from field
OBR:DIRECCION          LIKE(OBR:DIRECCION)            !List box control field - type derived from field
OBR:PRONTO_PAGO        LIKE(OBR:PRONTO_PAGO)          !List box control field - type derived from field
OBR:FECHA_BAJA         LIKE(OBR:FECHA_BAJA)           !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Seleccionar una  OBRA SOCIAL '),AT(,,358,198),FONT('MS Sans Serif',8,,FONT:regular), |
  RESIZE,CENTER,GRAY,IMM,MDI,HLP('SelectOBRA_SOCIAL'),SYSTEM
                       LIST,AT(8,39,342,114),USE(?Browse:1),HVSCROLL,FORMAT('40L(2)|MI~IDOS~C(0)@n-7@124L(2)|M' & |
  '~NOMPRE CORTO~@s30@209L(2)|M~NOMBRE~@s50@80L(2)|M~DIRECCION~@s50@48L(2)|M~PRONTO PAG' & |
  'O~@s2@40L(2)|M~FECHA BAJA~@d17@'),FROM(Queue:Browse:1),IMM,MSG('Administrador de OBRA_SOCIAL')
                       BUTTON('&Elegir'),AT(301,158,49,14),USE(?Select:2),LEFT,ICON('e.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Seleccionar'),TIP('Seleccionar')
                       SHEET,AT(4,4,350,172),USE(?CurrentTab)
                         TAB('SIGLAS'),USE(?Tab:2)
                           PROMPT('NOMPRE CORTO:'),AT(8,25),USE(?OBR:NOMPRE_CORTO:Prompt)
                           ENTRY(@s30),AT(75,24,180,10),USE(OBR:NOMPRE_CORTO)
                         END
                         TAB('NOMBRE'),USE(?Tab:3)
                           PROMPT('NOMBRE:'),AT(11,23),USE(?OBR:NOMBRE:Prompt)
                           ENTRY(@s100),AT(61,22,180,10),USE(OBR:NOMBRE)
                         END
                         TAB('ID'),USE(?Tab:4)
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
SetQueueRecord         PROCEDURE(),DERIVED
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
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
  GlobalErrors.SetProcedureName('SelectOBRA_SOCIAL')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('OBR:IDOS',OBR:IDOS)                                ! Added by: BrowseBox(ABC)
  BIND('OBR:NOMPRE_CORTO',OBR:NOMPRE_CORTO)                ! Added by: BrowseBox(ABC)
  BIND('OBR:PRONTO_PAGO',OBR:PRONTO_PAGO)                  ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:OBRA_SOCIAL.Open                                  ! File OBRA_SOCIAL used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:OBRA_SOCIAL,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,OBR:IDX_OBRA_SOCIAL_NOMBRE)           ! Add the sort order for OBR:IDX_OBRA_SOCIAL_NOMBRE for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,OBR:NOMBRE,,BRW1)              ! Initialize the browse locator using  using key: OBR:IDX_OBRA_SOCIAL_NOMBRE , OBR:NOMBRE
  BRW1.AddSortOrder(,OBR:PK_OBRA_SOCIAL)                   ! Add the sort order for OBR:PK_OBRA_SOCIAL for sort order 2
  BRW1.AddLocator(BRW1::Sort2:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort2:Locator.Init(,OBR:IDOS,,BRW1)                ! Initialize the browse locator using  using key: OBR:PK_OBRA_SOCIAL , OBR:IDOS
  BRW1.AddSortOrder(,OBR:IDX_OBRA_SOCIAL_NOM_CORTO)        ! Add the sort order for OBR:IDX_OBRA_SOCIAL_NOM_CORTO for sort order 3
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 3
  BRW1::Sort0:Locator.Init(,OBR:NOMPRE_CORTO,,BRW1)        ! Initialize the browse locator using  using key: OBR:IDX_OBRA_SOCIAL_NOM_CORTO , OBR:NOMPRE_CORTO
  ?Browse:1{PROP:IconList,1} = '~cancelar.ico'
  BRW1.AddField(OBR:IDOS,BRW1.Q.OBR:IDOS)                  ! Field OBR:IDOS is a hot field or requires assignment from browse
  BRW1.AddField(OBR:NOMPRE_CORTO,BRW1.Q.OBR:NOMPRE_CORTO)  ! Field OBR:NOMPRE_CORTO is a hot field or requires assignment from browse
  BRW1.AddField(OBR:NOMBRE,BRW1.Q.OBR:NOMBRE)              ! Field OBR:NOMBRE is a hot field or requires assignment from browse
  BRW1.AddField(OBR:DIRECCION,BRW1.Q.OBR:DIRECCION)        ! Field OBR:DIRECCION is a hot field or requires assignment from browse
  BRW1.AddField(OBR:PRONTO_PAGO,BRW1.Q.OBR:PRONTO_PAGO)    ! Field OBR:PRONTO_PAGO is a hot field or requires assignment from browse
  BRW1.AddField(OBR:FECHA_BAJA,BRW1.Q.OBR:FECHA_BAJA)      ! Field OBR:FECHA_BAJA is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('SelectOBRA_SOCIAL',QuickWindow)            ! Restore window settings from non-volatile store
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
    Relate:OBRA_SOCIAL.Close
  END
  IF SELF.Opened
    INIMgr.Update('SelectOBRA_SOCIAL',QuickWindow)         ! Save window data to non-volatile store
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
  ELSE
    RETURN SELF.SetSort(3,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


BRW1.SetQueueRecord PROCEDURE

  CODE
  PARENT.SetQueueRecord
  
  IF (OBR:FECHA_BAJA <> 0 )
    SELF.Q.OBR:IDOS_Icon = 1                               ! Set icon from icon list
  ELSE
    SELF.Q.OBR:IDOS_Icon = 0
  END


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Window
!!! Window
!!! </summary>
LIQUIDACION_PRESENTACION PROCEDURE 

QuickWindow          WINDOW('Generar Factuación Diaria'),AT(,,202,101),FONT('Arial',8,COLOR:Black,FONT:bold),RESIZE, |
  CENTER,GRAY,IMM,MDI,HLP('LIQUIDACION_PRESENTACION0'),SYSTEM
                       PROMPT('MES:'),AT(5,5),USE(?GLO:MES:Prompt)
                       COMBO(@n-14),AT(55,4,38,10),USE(GLO:MES),DROP(10),FROM('1|2|3|4|5|6|7|8|9|10|11|12')
                       PROMPT('ANO:'),AT(5,21),USE(?GLO:ANO:Prompt)
                       COMBO(@n-14),AT(55,20,39,10),USE(GLO:ANO),DROP(10),FROM('2005|2006|2007|2008|2009|2010|' & |
  '2011|2012|2015|2016')
                       PROMPT('OBRA SOCIAL:'),AT(5,37),USE(?Glo:IDOS:Prompt)
                       ENTRY(@n-7),AT(55,36,22,10),USE(Glo:IDOS),REQ
                       BUTTON('...'),AT(80,36,12,12),USE(?CallLookup)
                       STRING(@s30),AT(93,38),USE(OBR:NOMPRE_CORTO)
                       BUTTON('&Generar Presentación'),AT(58,56,86,14),USE(?Ok),LEFT,ICON(ICON:NextPage),CURSOR('mano.cur'), |
  FLAT,MSG('Acepta Operacion'),TIP('Acepta Operacion')
                       BUTTON('&Cancelar'),AT(77,85,49,14),USE(?Cancel),LEFT,ICON('cancelar.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Cancela Operacion'),TIP('Cancela Operacion')
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
  GlobalErrors.SetProcedureName('LIQUIDACION_PRESENTACION')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?GLO:MES:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Ok,RequestCancelled)                    ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Ok,RequestCompleted)                    ! Add the close control to the window manger
  END
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:OBRA_SOCIAL.Open                                  ! File OBRA_SOCIAL used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('LIQUIDACION_PRESENTACION',QuickWindow)     ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:OBRA_SOCIAL.Close
  END
  IF SELF.Opened
    INIMgr.Update('LIQUIDACION_PRESENTACION',QuickWindow)  ! Save window data to non-volatile store
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
    SelectOBRA_SOCIAL
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
    OF ?Ok
      GLO:PERIODO =  GLO:ANO&(FORMAT(GLO:MES,@N02))
      GLO:FECHA_LARGO = OBR:NOMPRE_CORTO
      !!! LIMPIA RANKING
      OPEN(RANKING)
      EMPTY(RANKING)
      IF ERRORCODE() THEN
          MESSAGE(ERROR())
          CYCLE
      ELSE
          CLOSE(RANKING)
      END
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Glo:IDOS
      IF Glo:IDOS OR ?Glo:IDOS{PROP:Req}
        OBR:IDOS = Glo:IDOS
        IF Access:OBRA_SOCIAL.TryFetch(OBR:PK_OBRA_SOCIAL)
          IF SELF.Run(1,SelectRecord) = RequestCompleted
            Glo:IDOS = OBR:IDOS
          ELSE
            SELECT(?Glo:IDOS)
            CYCLE
          END
        END
      END
      ThisWindow.Reset()
    OF ?CallLookup
      ThisWindow.Update()
      OBR:IDOS = Glo:IDOS
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        Glo:IDOS = OBR:IDOS
      END
      ThisWindow.Reset(1)
    OF ?Ok
      ThisWindow.Update()
      START(LIQUIDACION_PRESENTACION_1, 25000)
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


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window


!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the RANKING File
!!! </summary>
LIQUIDACION_PRESENTACION_2 PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(RANKING)
                       PROJECT(RAN:C1)
                       PROJECT(RAN:C2)
                       PROJECT(RAN:C3)
                       PROJECT(RAN:C4)
                       PROJECT(RAN:C5)
                       PROJECT(RAN:C6)
                       PROJECT(RAN:C7)
                       PROJECT(RAN:C8)
                       PROJECT(RAN:C9)
                       PROJECT(RAN:C10)
                       PROJECT(RAN:CANTIDAD)
                       PROJECT(RAN:IMPORTE)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
RAN:C1                 LIKE(RAN:C1)                   !List box control field - type derived from field
RAN:C2                 LIKE(RAN:C2)                   !List box control field - type derived from field
RAN:C3                 LIKE(RAN:C3)                   !List box control field - type derived from field
RAN:C4                 LIKE(RAN:C4)                   !List box control field - type derived from field
RAN:C5                 LIKE(RAN:C5)                   !List box control field - type derived from field
RAN:C6                 LIKE(RAN:C6)                   !List box control field - type derived from field
RAN:C7                 LIKE(RAN:C7)                   !List box control field - type derived from field
RAN:C8                 LIKE(RAN:C8)                   !List box control field - type derived from field
RAN:C9                 LIKE(RAN:C9)                   !List box control field - type derived from field
RAN:C10                LIKE(RAN:C10)                  !List box control field - type derived from field
RAN:CANTIDAD           LIKE(RAN:CANTIDAD)             !List box control field - type derived from field
RAN:IMPORTE            LIKE(RAN:IMPORTE)              !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('LIQUIDCION DE PRESTACIONES'),AT(,,522,329),FONT('MS Sans Serif',8,,FONT:regular),RESIZE, |
  CENTER,GRAY,IMM,MDI,HLP('LIQUIDACION_PRESENTACION_2'),SYSTEM
                       LIST,AT(8,49,505,246),USE(?Browse:1),HVSCROLL,FORMAT('80L(2)|M~MATRICULA~@s50@80L(2)|M~' & |
  'NOMBRE~@s50@61L(2)|M~CUIT~@P##-########-#P@80L(2)|M~CBU~@s50@80L(2)|M~FECHA PRESTACI' & |
  'ON~@s50@80L(2)|M~MES~@s50@80L(2)|M~AÑO~@s50@200L(2)|M~Nº INTERNO OS~@s50@200L(2)|M~O' & |
  'S~@s50@113L(2)|M~LOCALIDAD~@s50@56L(2)|M~CANTIDAD ORDENES~@n-5@93L|M~IMPORTE~L(2)@n$-12.2@'), |
  FROM(Queue:Browse:1),IMM,MSG('Administrador de RANKING')
                       BUTTON('&Filtro'),AT(3,308,49,14),USE(?Query),LEFT,ICON('qbe.ico'),FLAT
                       BUTTON('E&xportar'),AT(63,307,52,15),USE(?EvoExportar),LEFT,ICON('export.ico'),FLAT
                       PROMPT('LIQUIDACION: '),AT(11,25),USE(?Prompt1),FONT(,14)
                       STRING(@s50),AT(105,25),USE(GLO:FECHA_LARGO),FONT(,14)
                       SHEET,AT(4,4,516,299),USE(?CurrentTab)
                         TAB('MATRICULA'),USE(?Tab:2)
                         END
                         TAB('NOMBRE'),USE(?Tab:3)
                         END
                       END
                       BUTTON('&Salir'),AT(473,315,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Salir'),TIP('Salir')
                     END

Loc::QHlist6 QUEUE,PRE(QHL6)
Id                         SHORT
Nombre                     STRING(100)
Longitud                   SHORT
Pict                       STRING(50)
Tot                 BYTE
                         END
QPar6 QUEUE,PRE(Q6)
FieldPar                 CSTRING(800)
                         END
QPar26 QUEUE,PRE(Qp26)
F2N                 CSTRING(300)
F2P                 CSTRING(100)
F2T                 BYTE
                         END
Loc::TituloListado6          STRING(100)
Loc::Titulo6          STRING(100)
SavPath6          STRING(2000)
Evo::Group6  GROUP,PRE()
Evo::Procedure6          STRING(100)
Evo::App6          STRING(100)
Evo::NroPage          LONG
   END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
QBE5                 QueryListClass                        ! QBE List Class. 
QBV5                 QueryListVisual                       ! QBE Visual Class
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::Sort1:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 2
BRW1::Sort2:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 3
BRW1::Sort3:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 4
BRW1::Sort4:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 5
BRW1::Sort5:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 6
BRW1::Sort6:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 7
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

Ec::LoadI_6  SHORT
Gol_woI_6 WINDOW,AT(,,236,43),FONT('MS Sans Serif',8,,),CENTER,GRAY
       IMAGE('clock.ico'),AT(8,11),USE(?ImgoutI_6),CENTERED
       GROUP,AT(38,11,164,20),USE(?G::I_6),BOXED,BEVEL(-1)
         STRING('Preparando datos para Exportacion'),AT(63,11),USE(?StrOutI_6),TRN
         STRING('Aguarde un instante por Favor...'),AT(67,20),USE(?StrOut2I_6),TRN
       END
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
PrintExBrowse6 ROUTINE

 OPEN(Gol_woI_6)
 DISPLAY()
 SETTARGET(QuickWindow)
 SETCURSOR(CURSOR:WAIT)
 EC::LoadI_6 = BRW1.FileLoaded
 IF Not  EC::LoadI_6
     BRW1.FileLoaded=True
     CLEAR(BRW1.LastItems,1)
     BRW1.ResetFromFile()
 END
 CLOSE(Gol_woI_6)
 SETCURSOR()
  Evo::App6          = 'Gestion'
  Evo::Procedure6          = GlobalErrors.GetProcedureName()& 6
 
  FREE(QPar6)
  Q6:FieldPar  = '1,2,3,4,5,6,7,8,9,10,11,12,'
  ADD(QPar6)  !!1
  Q6:FieldPar  = ';'
  ADD(QPar6)  !!2
  Q6:FieldPar  = 'Spanish'
  ADD(QPar6)  !!3
  Q6:FieldPar  = ''
  ADD(QPar6)  !!4
  Q6:FieldPar  = true
  ADD(QPar6)  !!5
  Q6:FieldPar  = ''
  ADD(QPar6)  !!6
  Q6:FieldPar  = true
  ADD(QPar6)  !!7
 !!!! Exportaciones
  Q6:FieldPar  = 'HTML|'
   Q6:FieldPar  = CLIP( Q6:FieldPar)&'EXCEL|'
   Q6:FieldPar  = CLIP( Q6:FieldPar)&'WORD|'
  Q6:FieldPar  = CLIP( Q6:FieldPar)&'ASCII|'
   Q6:FieldPar  = CLIP( Q6:FieldPar)&'XML|'
   Q6:FieldPar  = CLIP( Q6:FieldPar)&'PRT|'
  ADD(QPar6)  !!8
  Q6:FieldPar  = 'All'
  ADD(QPar6)   !.9.
  Q6:FieldPar  = ' 0'
  ADD(QPar6)   !.10
  Q6:FieldPar  = 0
  ADD(QPar6)   !.11
  Q6:FieldPar  = '1'
  ADD(QPar6)   !.12
 
  Q6:FieldPar  = ''
  ADD(QPar6)   !.13
 
  Q6:FieldPar  = ''
  ADD(QPar6)   !.14
 
  Q6:FieldPar  = ''
  ADD(QPar6)   !.15
 
   Q6:FieldPar  = '16'
  ADD(QPar6)   !.16
 
   Q6:FieldPar  = 1
  ADD(QPar6)   !.17
   Q6:FieldPar  = 2
  ADD(QPar6)   !.18
   Q6:FieldPar  = '2'
  ADD(QPar6)   !.19
   Q6:FieldPar  = 12
  ADD(QPar6)   !.20
 
   Q6:FieldPar  = 0 !Exporta excel sin borrar
  ADD(QPar6)   !.21
 
   Q6:FieldPar  = Evo::NroPage !Nro Pag. Desde Report (BExp)
  ADD(QPar6)   !.22
 
   CLEAR(Q6:FieldPar)
  ADD(QPar6)   ! 23 Caracteres Encoding para xml
 
  Q6:FieldPar  = '0'
  ADD(QPar6)   ! 24 Use Open Office
 
   Q6:FieldPar  = 'golmedo'
  ADD(QPar6) ! 25
 
 !---------------------------------------------------------------------------------------------
 !!Registration 
  Q6:FieldPar  = ' BrowseExport'
  ADD(QPar6)   ! 26  BrowseExport
  Q6:FieldPar  = ' '
  ADD(QPar6)   ! 27  
  Q6:FieldPar  = ' ' 
  ADD(QPar6)   ! 28  
  Q6:FieldPar  = 'BEXPORT' 
  ADD(QPar6)   ! 29 Gestion012.clw
 !!!!!
 
 
  FREE(QPar26)
       Qp26:F2N  = 'MATRICULA'
  Qp26:F2P  = '@s50'
  Qp26:F2T  = '0'
  ADD(QPar26)
       Qp26:F2N  = 'NOMBRE'
  Qp26:F2P  = '@s50'
  Qp26:F2T  = '0'
  ADD(QPar26)
       Qp26:F2N  = 'CUIT'
  Qp26:F2P  = '@P##-########-#P'
  Qp26:F2T  = '0'
  ADD(QPar26)
       Qp26:F2N  = 'CBU'
  Qp26:F2P  = '@s50'
  Qp26:F2T  = '0'
  ADD(QPar26)
       Qp26:F2N  = 'FECHA PRESTACION'
  Qp26:F2P  = '@s50'
  Qp26:F2T  = '0'
  ADD(QPar26)
       Qp26:F2N  = 'MES'
  Qp26:F2P  = '@s50'
  Qp26:F2T  = '0'
  ADD(QPar26)
       Qp26:F2N  = 'AÑO'
  Qp26:F2P  = '@s50'
  Qp26:F2T  = '0'
  ADD(QPar26)
       Qp26:F2N  = 'Nº INTERNO OS'
  Qp26:F2P  = '@s50'
  Qp26:F2T  = '0'
  ADD(QPar26)
       Qp26:F2N  = 'OS'
  Qp26:F2P  = '@s50'
  Qp26:F2T  = '0'
  ADD(QPar26)
       Qp26:F2N  = 'LOCALIDAD'
  Qp26:F2P  = '@s50'
  Qp26:F2T  = '0'
  ADD(QPar26)
       Qp26:F2N  = 'CANTIDAD ORDENES'
  Qp26:F2P  = '@n-5'
  Qp26:F2T  = '0'
  ADD(QPar26)
       Qp26:F2N  = 'IMPORTE'
  Qp26:F2P  = '@n$-12.2'
  Qp26:F2T  = '0'
  ADD(QPar26)
  SysRec# = false
  FREE(Loc::QHlist6)
  LOOP
     SysRec# += 1
     IF ?Browse:1{PROPLIST:Exists,SysRec#} = 1
         GET(QPar26,SysRec#)
         QHL6:Id      = SysRec#
         QHL6:Nombre  = Qp26:F2N
         QHL6:Longitud= ?Browse:1{PropList:Width,SysRec#}  /2
         QHL6:Pict    = Qp26:F2P
         QHL6:Tot    = Qp26:F2T
         ADD(Loc::QHlist6)
      Else
        break
     END
  END
  Loc::Titulo6 ='Presentación de Liquidación a Obras Sociales'
 
 SavPath6 = PATH()
  Exportar(Loc::QHlist6,BRW1.Q,QPar6,1,Loc::Titulo6,Evo::Group6)
 IF Not EC::LoadI_6 Then  BRW1.FileLoaded=false.
 SETPATH(SavPath6)
 !!!! Fin Routina Templates Clarion

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('LIQUIDACION_PRESENTACION_2')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:RANKING.Open                                      ! File RANKING used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:RANKING,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  QBE5.Init(QBV5, INIMgr,'LIQUIDACION_PRESENTACION_2', GlobalErrors)
  QBE5.QkSupport = True
  QBE5.QkMenuIcon = 'QkQBE.ico'
  QBE5.QkIcon = 'QkLoad.ico'
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,RAN:IDX_C2)                           ! Add the sort order for RAN:IDX_C2 for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,RAN:C2,,BRW1)                  ! Initialize the browse locator using  using key: RAN:IDX_C2 , RAN:C2
  BRW1.AddSortOrder(,RAN:IDX_C3)                           ! Add the sort order for RAN:IDX_C3 for sort order 2
  BRW1.AddLocator(BRW1::Sort2:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort2:Locator.Init(,RAN:C3,,BRW1)                  ! Initialize the browse locator using  using key: RAN:IDX_C3 , RAN:C3
  BRW1.AddSortOrder(,RAN:IDX_C4)                           ! Add the sort order for RAN:IDX_C4 for sort order 3
  BRW1.AddLocator(BRW1::Sort3:Locator)                     ! Browse has a locator for sort order 3
  BRW1::Sort3:Locator.Init(,RAN:C4,,BRW1)                  ! Initialize the browse locator using  using key: RAN:IDX_C4 , RAN:C4
  BRW1.AddSortOrder(,RAN:IDX_C5)                           ! Add the sort order for RAN:IDX_C5 for sort order 4
  BRW1.AddLocator(BRW1::Sort4:Locator)                     ! Browse has a locator for sort order 4
  BRW1::Sort4:Locator.Init(,RAN:C5,,BRW1)                  ! Initialize the browse locator using  using key: RAN:IDX_C5 , RAN:C5
  BRW1.AddSortOrder(,RAN:IDX_CANTIDAD)                     ! Add the sort order for RAN:IDX_CANTIDAD for sort order 5
  BRW1.AddLocator(BRW1::Sort5:Locator)                     ! Browse has a locator for sort order 5
  BRW1::Sort5:Locator.Init(,RAN:CANTIDAD,,BRW1)            ! Initialize the browse locator using  using key: RAN:IDX_CANTIDAD , RAN:CANTIDAD
  BRW1.AddSortOrder(,RAN:IDX_IMPORTE)                      ! Add the sort order for RAN:IDX_IMPORTE for sort order 6
  BRW1.AddLocator(BRW1::Sort6:Locator)                     ! Browse has a locator for sort order 6
  BRW1::Sort6:Locator.Init(,RAN:IMPORTE,,BRW1)             ! Initialize the browse locator using  using key: RAN:IDX_IMPORTE , RAN:IMPORTE
  BRW1.AddSortOrder(,RAN:PK_RANKING)                       ! Add the sort order for RAN:PK_RANKING for sort order 7
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 7
  BRW1::Sort0:Locator.Init(,RAN:C1,,BRW1)                  ! Initialize the browse locator using  using key: RAN:PK_RANKING , RAN:C1
  BRW1.AddField(RAN:C1,BRW1.Q.RAN:C1)                      ! Field RAN:C1 is a hot field or requires assignment from browse
  BRW1.AddField(RAN:C2,BRW1.Q.RAN:C2)                      ! Field RAN:C2 is a hot field or requires assignment from browse
  BRW1.AddField(RAN:C3,BRW1.Q.RAN:C3)                      ! Field RAN:C3 is a hot field or requires assignment from browse
  BRW1.AddField(RAN:C4,BRW1.Q.RAN:C4)                      ! Field RAN:C4 is a hot field or requires assignment from browse
  BRW1.AddField(RAN:C5,BRW1.Q.RAN:C5)                      ! Field RAN:C5 is a hot field or requires assignment from browse
  BRW1.AddField(RAN:C6,BRW1.Q.RAN:C6)                      ! Field RAN:C6 is a hot field or requires assignment from browse
  BRW1.AddField(RAN:C7,BRW1.Q.RAN:C7)                      ! Field RAN:C7 is a hot field or requires assignment from browse
  BRW1.AddField(RAN:C8,BRW1.Q.RAN:C8)                      ! Field RAN:C8 is a hot field or requires assignment from browse
  BRW1.AddField(RAN:C9,BRW1.Q.RAN:C9)                      ! Field RAN:C9 is a hot field or requires assignment from browse
  BRW1.AddField(RAN:C10,BRW1.Q.RAN:C10)                    ! Field RAN:C10 is a hot field or requires assignment from browse
  BRW1.AddField(RAN:CANTIDAD,BRW1.Q.RAN:CANTIDAD)          ! Field RAN:CANTIDAD is a hot field or requires assignment from browse
  BRW1.AddField(RAN:IMPORTE,BRW1.Q.RAN:IMPORTE)            ! Field RAN:IMPORTE is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('LIQUIDACION_PRESENTACION_2',QuickWindow)   ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.QueryControl = ?Query
  BRW1.UpdateQuery(QBE5,1)
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  SELF.SetAlerts()
  
    Clear(CWT#)
    LOOP
      CWT# +=1 
       IF ?Browse:1{PROPLIST:Exists,CWT#} = 1
          ?Browse:1{PROPLIST:Underline,CWT#} = true
       Else
          break
       END
    END
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:RANKING.Close
  END
  IF SELF.Opened
    INIMgr.Update('LIQUIDACION_PRESENTACION_2',QuickWindow) ! Save window data to non-volatile store
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
    OF ?EvoExportar
      ThisWindow.Update()
       Do PrintExBrowse6
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
  ELSIF CHOICE(?CurrentTab) = 6
    RETURN SELF.SetSort(5,Force)
  ELSIF CHOICE(?CurrentTab) = 7
    RETURN SELF.SetSort(6,Force)
  ELSE
    RETURN SELF.SetSort(7,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Process
!!! </summary>
LIQUIDACION_PRESENTACION_1 PROCEDURE 

Progress:Thermometer BYTE                                  ! 
Process:View         VIEW(LIQUIDACION)
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),DOUBLE,CENTER,GRAY,IMM,MDI,SYSTEM,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeCloseEvent         PROCEDURE(),BYTE,PROC,DERIVED
                     END

ThisProcess          CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ProgressMgr          StepStringClass                       ! Progress Manager

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
  GlobalErrors.SetProcedureName('LIQUIDACION_PRESENTACION_1')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('Glo:IDOS',Glo:IDOS)                                ! Added by: Process
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:LIQUIDACION.SetOpenRelated()
  Relate:LIQUIDACION.Open                                  ! File LIQUIDACION used by this procedure, so make sure it's RelationManager is open
  Relate:LOCALIDAD.Open                                    ! File LOCALIDAD used by this procedure, so make sure it's RelationManager is open
  Relate:RANKING.Open                                      ! File RANKING used by this procedure, so make sure it's RelationManager is open
  Relate:SOCIOS.Open                                       ! File SOCIOS used by this procedure, so make sure it's RelationManager is open
  Relate:SOCIOSXOS.Open                                    ! File SOCIOSXOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('LIQUIDACION_PRESENTACION_1',ProgressWindow) ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowAlpha+ScrollSort:AllowNumeric,ScrollBy:RunTime)
  ThisProcess.Init(Process:View, Relate:LIQUIDACION, ?Progress:PctText, Progress:Thermometer, ProgressMgr, LIQ:PERIODO)
  ThisProcess.AddSortOrder(LIQ:IDX_LIQUIDACION_PERIODO)
  ThisProcess.AddRange(LIQ:PERIODO,GLO:PERIODO)
  ThisProcess.SetFilter('LIQ:IDOS = Glo:IDOS  AND LIQ:PRESENTADO = ''NO''')
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  SELF.SetUseMRP(False)
  ?Progress:UserString{Prop:Text}=''
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(LIQUIDACION,'QUICKSCAN=on')
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:LIQUIDACION.Close
    Relate:LOCALIDAD.Close
    Relate:RANKING.Close
    Relate:SOCIOS.Close
    Relate:SOCIOSXOS.Close
  END
  IF SELF.Opened
    INIMgr.Update('LIQUIDACION_PRESENTACION_1',ProgressWindow) ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.TakeCloseEvent PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeCloseEvent()
  LIQUIDACION_PRESENTACION_2()
  RETURN ReturnValue


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeRecord()
  !!! MODIFICO EL ESTADO EN LIQUIDACION
  LIQ:PRESENTADO = 'SI'
  PUT(LIQUIDACION)
  
  !! CARGO LA LIQUIDACION AL RANKING
  !! busco socio
  SOC:IDSOCIO = LIQ:IDSOCIO
  ACCESS:SOCIOS.TRYFETCH(SOC:PK_SOCIOS)
  RAN:C1           = SOC:MATRICULA
  RAN:C2           = SOC:NOMBRE
  RAN:C3           = SOC:CUIT
  RAN:C4           = SOC:CBU
  !!!!!
  RAN:IMPORTE      = LIQ:MONTO
  RAN:C5           = FORMAT(LIQ:FECHA_PRESENTACION,@D6)
  RAN:C6           = LIQ:MES
  RAN:C7           = LIQ:ANO
  RAN:CANTIDAD = LIQ:CANTIDAD
  !! BUSCO EL ID DEL SOCIO EN LA OS
  SOC3:IDSOCIOS    = LIQ:IDSOCIO
  SOC3:IDOS        = LIQ:IDOS
  ACCESS:SOCIOSXOS.TRYFETCH(SOC3:FK_SOCIOSXOS_OS)
  RAN:C8           = SOC3:NUMERO
  LOC:IDLOCALIDAD = SOC:IDLOCALIDAD
  ACCESS:LOCALIDAD.TRYFETCH(LOC:PK_LOCALIDAD)
  RAN:C10 = LOC:DESCRIPCION
  !!!
  RAN:C9         =  GLO:FECHA_LARGO
  ACCESS:RANKING.INSERT()
  
  PUT(Process:View)
  IF ERRORCODE()
    GlobalErrors.ThrowFile(Msg:PutFailed,'Process:View')
    ThisWindow.Response = RequestCompleted
    ReturnValue = Level:Fatal
  END
  RETURN ReturnValue

!!! <summary>
!!! Generated from procedure template - Report
!!! </summary>
IMPRIMIR_PAGO_LIQUIDACION PROCEDURE 

Progress:Thermometer BYTE                                  ! 
L:NroReg             LONG                                  ! 
LOC:TOTAL_PARCIAL    PDECIMAL(7,2)                         ! 
Process:View         VIEW(PAGOS_LIQUIDACION)
                       PROJECT(PAGL:CANT_CUOTA)
                       PROJECT(PAGL:CANT_CUOTA_S)
                       PROJECT(PAGL:CREDITO)
                       PROJECT(PAGL:CUOTA)
                       PROJECT(PAGL:FECHA)
                       PROJECT(PAGL:GASTOS_ADM)
                       PROJECT(PAGL:GASTOS_BANCARIOS)
                       PROJECT(PAGL:IDPAGOS)
                       PROJECT(PAGL:MONTO)
                       PROJECT(PAGL:MONTO_IMP_TOTAL)
                       PROJECT(PAGL:SEGURO)
                       PROJECT(PAGL:SOCIOS_LIQUIDACION)
                       PROJECT(PAGL:IDSOCIO)
                       JOIN(LIQ:IDX_LIQUIDACION_PAGO,PAGL:IDPAGOS)
                         PROJECT(LIQ:ANO)
                         PROJECT(LIQ:DEBITO)
                         PROJECT(LIQ:MES)
                         PROJECT(LIQ:MONTO)
                         PROJECT(LIQ:IDOS)
                         JOIN(OBR:PK_OBRA_SOCIAL,LIQ:IDOS)
                           PROJECT(OBR:NOMPRE_CORTO)
                         END
                       END
                       JOIN(SOC:PK_SOCIOS,PAGL:IDSOCIO)
                         PROJECT(SOC:MATRICULA)
                         PROJECT(SOC:NOMBRE)
                       END
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

Report               REPORT,AT(219,2740,7771,5948),PRE(RPT),PAPER(PAPER:A4),FONT('Arial',10,,FONT:regular,CHARSET:ANSI), |
  THOUS
                       HEADER,AT(198,208,7802,2521),USE(?Header)
                         IMAGE('Logo.jpg'),AT(0,-10,1875,1302),USE(?Image1)
                         STRING(@d17),AT(7000,438),USE(PAGL:FECHA),RIGHT(1)
                         STRING(@n-7),AT(7219,250),USE(PAGL:IDPAGOS)
                         STRING('Nº Liquidación'),AT(6073,250),USE(?String32),TRN
                         STRING('Fecha:'),AT(6542,427),USE(?String30),TRN
                         STRING('Pago de Liquidaciones por Cobro a Obras Sociales'),AT(1635,1354),USE(?String1),FONT(, |
  14,,FONT:underline),TRN
                         LINE,AT(21,1656,7771,0),USE(?Line7),COLOR(COLOR:Black)
                         STRING('Colegiado: '),AT(104,1688),USE(?String34),TRN
                         STRING(@n-5),AT(833,1688),USE(SOC:MATRICULA)
                         STRING(@s100),AT(1323,1688,6219,208),USE(SOC:NOMBRE)
                         STRING('Liquidacion Colegiado Nº: '),AT(94,1906),USE(?String43),FONT(,,,FONT:bold),TRN
                         STRING(@n-7),AT(1865,1896),USE(PAGL:SOCIOS_LIQUIDACION),FONT(,,,FONT:bold),TRN
                         LINE,AT(146,2125,7698,0),USE(?Line5),COLOR(COLOR:Black)
                         STRING('Monto Presentado'),AT(5010,2219),USE(?String25),TRN
                         STRING('Periodo'),AT(219,2219),USE(?String23),TRN
                         STRING('Obra Social'),AT(2625,2219),USE(?String24),TRN
                         STRING('Débitos'),AT(7146,2219),USE(?String26),TRN
                         LINE,AT(62,2458,7740,0),USE(?Line4),COLOR(COLOR:Black)
                       END
Detail                 DETAIL,AT(0,0,,271),USE(?Detail)
                         STRING(@n-3),AT(42,21),USE(LIQ:MES)
                         LINE,AT(31,229,7719,0),USE(?Line1),COLOR(COLOR:Black)
                         STRING(@n-5),AT(375,10),USE(LIQ:ANO)
                         STRING(@s30),AT(1823,10),USE(OBR:NOMPRE_CORTO)
                         STRING(@n$-12.2),AT(5094,10),USE(LIQ:MONTO)
                         STRING(@n$-10.2),AT(7031,10),USE(LIQ:DEBITO)
                       END
                       FOOTER,AT(229,8698,7760,2594),USE(?Footer)
                         STRING('Total Liquidación:'),AT(31,73),USE(?String8),TRN
                         STRING(@N$-12.`2),AT(1510,73),USE(LIQ:MONTO,,?LIQ:MONTO:2),LEFT(1),SUM
                         LINE,AT(1271,302,1042,0),USE(?Line9),COLOR(COLOR:Black)
                         BOX,AT(10,10,7708,52),USE(?Box2),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         STRING('Desc. Débitos'),AT(31,344),USE(?String14),TRN
                         STRING(@N$-10.`2),AT(1510,344),USE(LIQ:DEBITO,,?LIQ:DEBITO:2),LEFT(1),SUM
                         STRING('Desc. Pago Seguro:'),AT(31,938),USE(?String11),TRN
                         LINE,AT(1250,1958,1042,0),USE(?Line2),COLOR(COLOR:Black)
                         STRING('Desc. Cuota Solidaria:'),AT(31,542),USE(?String9),TRN
                         STRING(@N$-10.`2),AT(1510,542),USE(PAGL:GASTOS_ADM),LEFT(1)
                         STRING('Desc. Pago Cuotas:'),AT(31,740),USE(?String10),TRN
                         STRING(@N$-10.`2),AT(1510,740),USE(PAGL:CUOTA),LEFT(1)
                         STRING('Cant. Cuotas societarias  descontadas:'),AT(2271,740),USE(?String19),TRN
                         STRING(@n-3),AT(4729,740),USE(PAGL:CANT_CUOTA)
                         STRING(@N$-10.`2),AT(1510,938),USE(PAGL:SEGURO),LEFT(1)
                         STRING('Cant. Cuotas de Seguro descontadas:'),AT(2271,938),USE(?String20),TRN
                         STRING(@n-3),AT(4729,938),USE(PAGL:CANT_CUOTA_S)
                         LINE,AT(1271,1500,1042,0),USE(?Line8),COLOR(COLOR:Black)
                         STRING(@N$(12.`2)),AT(1510,1521),USE(LOC:TOTAL_PARCIAL),TRN
                         STRING('Crédito:'),AT(31,1750),USE(?String42),TRN
                         STRING(@N$-10.`2),AT(1510,1750),USE(PAGL:CREDITO)
                         STRING('Total Descuentos:'),AT(31,1521),USE(?String39),TRN
                         STRING('Desc. Imp. Deb/Cred:'),AT(31,1115),USE(?String37),TRN
                         STRING(@N$-10.`2),AT(1510,1115),USE(PAGL:MONTO_IMP_TOTAL),TRN
                         STRING('Desc. Gtos. Bancarios:'),AT(31,1292),USE(?String45),TRN
                         STRING(@N$-10.`2),AT(1510,1281,802,208),USE(PAGL:GASTOS_BANCARIOS)
                         STRING('Total Neto a Cobrar:'),AT(31,2000),USE(?String7),FONT(,12,,FONT:bold),TRN
                         STRING(@N$-12.`2),AT(1656,2010),USE(PAGL:MONTO),FONT(,12,,FONT:bold)
                         BOX,AT(10,2250,7760,52),USE(?Box1),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         LINE,AT(10,2323,7740,0),USE(?Line3:2),COLOR(COLOR:Black)
                         STRING('Fecha del Reporte:'),AT(21,2354),USE(?EcFechaReport),FONT('Courier New',7),TRN
                         STRING('DatoEmpresa'),AT(2125,2354),USE(?DatoEmpresa),FONT('Courier New',7),TRN
                         STRING('Evolution_Paginas_'),AT(5625,2354),USE(?PaginaNdeX),FONT('Courier New',7),TRN
                       END
                       FORM,AT(208,198,7750,10750),USE(?Form)
                       END
                     END
ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
OpenReport             PROCEDURE(),BYTE,PROC,DERIVED
SetStaticControlsAttributes PROCEDURE(),DERIVED
                     END

ThisReport           CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ProgressMgr          StepLongClass                         ! Progress Manager
Previewer            CLASS(PrintPreviewClass)              ! Print Previewer
Ask                    PROCEDURE(),DERIVED
                     END

TargetSelector       ReportTargetSelectorClass             ! Report Target Selector
XMLReporter          CLASS(XMLReportGenerator)             ! XML
Setup                  PROCEDURE(),DERIVED
                     END

HTMLReporter         CLASS(HTMLReportGenerator)            ! HTML
SetUp                  PROCEDURE(),DERIVED
                     END

TXTReporter          CLASS(TextReportGenerator)            ! TXT
Setup                  PROCEDURE(),DERIVED
                     END

PDFReporter          CLASS(PDFReportGenerator)             ! PDF
SetUp                  PROCEDURE(),DERIVED
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
  GlobalErrors.SetProcedureName('IMPRIMIR_PAGO_LIQUIDACION')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:PAGOS_LIQUIDACION.Open                            ! File PAGOS_LIQUIDACION used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('IMPRIMIR_PAGO_LIQUIDACION',ProgressWindow) ! Restore window settings from non-volatile store
  TargetSelector.AddItem(XMLReporter.IReportGenerator)
  TargetSelector.AddItem(HTMLReporter.IReportGenerator)
  TargetSelector.AddItem(TXTReporter.IReportGenerator)
  TargetSelector.AddItem(PDFReporter.IReportGenerator)
  SELF.AddItem(TargetSelector)
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisReport.Init(Process:View, Relate:PAGOS_LIQUIDACION, ?Progress:PctText, Progress:Thermometer, ProgressMgr, PAGL:IDPAGOS)
  ThisReport.AddSortOrder(PAGL:PK_PAGOS_LIQUIDACION)
  ThisReport.AddRange(PAGL:IDPAGOS,GLO:PAGO)
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:PAGOS_LIQUIDACION.SetQuickScan(1,Propagate:OneMany)
  ProgressWindow{PROP:Timer} = 10                          ! Assign timer interval
  SELF.SkipPreview = False
  Previewer.SetINIManager(INIMgr)
  Previewer.AllowUserZoom = True
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:PAGOS_LIQUIDACION.Close
  END
  IF SELF.Opened
    INIMgr.Update('IMPRIMIR_PAGO_LIQUIDACION',ProgressWindow) ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.OpenReport PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  SYSTEM{PROP:PrintMode} = 3
  ReturnValue = PARENT.OpenReport()
  
  !!! Evolution Consulting FREE Templates Start!!!
   IF Not ReturnValue
       REPORT$?EcFechaReport{prop:text} = FORMAT(TODAY(),@d6)&' - '&FORMAT(CLOCK(),@t4)
          REPORT$?DatoEmpresa{prop:hide} = True
   END
  IF ReturnValue = Level:Benign
    SELF.Report{PROPPRINT:Extend}=True
  END
  RETURN ReturnValue


ThisWindow.SetStaticControlsAttributes PROCEDURE

  CODE
  PARENT.SetStaticControlsAttributes
  !XML STATIC
  SELF.Attribute.Set(?PAGL:FECHA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PAGL:FECHA,RepGen:XML,TargetAttr:TagName,'PAGL:FECHA')
  SELF.Attribute.Set(?PAGL:FECHA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PAGL:IDPAGOS,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PAGL:IDPAGOS,RepGen:XML,TargetAttr:TagName,'PAGL:IDPAGOS')
  SELF.Attribute.Set(?PAGL:IDPAGOS,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String32,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String32,RepGen:XML,TargetAttr:TagName,'String32')
  SELF.Attribute.Set(?String32,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String30,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String30,RepGen:XML,TargetAttr:TagName,'String30')
  SELF.Attribute.Set(?String30,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String1,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String1,RepGen:XML,TargetAttr:TagName,'String1')
  SELF.Attribute.Set(?String1,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String34,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String34,RepGen:XML,TargetAttr:TagName,'String34')
  SELF.Attribute.Set(?String34,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagName,'SOC:MATRICULA')
  SELF.Attribute.Set(?SOC:MATRICULA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagName,'SOC:NOMBRE')
  SELF.Attribute.Set(?SOC:NOMBRE,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String43,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String43,RepGen:XML,TargetAttr:TagName,'String43')
  SELF.Attribute.Set(?String43,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PAGL:SOCIOS_LIQUIDACION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PAGL:SOCIOS_LIQUIDACION,RepGen:XML,TargetAttr:TagName,'PAGL:SOCIOS_LIQUIDACION')
  SELF.Attribute.Set(?PAGL:SOCIOS_LIQUIDACION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String25,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String25,RepGen:XML,TargetAttr:TagName,'String25')
  SELF.Attribute.Set(?String25,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String23,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String23,RepGen:XML,TargetAttr:TagName,'String23')
  SELF.Attribute.Set(?String23,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String24,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String24,RepGen:XML,TargetAttr:TagName,'String24')
  SELF.Attribute.Set(?String24,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String26,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String26,RepGen:XML,TargetAttr:TagName,'String26')
  SELF.Attribute.Set(?String26,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?LIQ:MES,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?LIQ:MES,RepGen:XML,TargetAttr:TagName,'LIQ:MES')
  SELF.Attribute.Set(?LIQ:MES,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?LIQ:ANO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?LIQ:ANO,RepGen:XML,TargetAttr:TagName,'LIQ:ANO')
  SELF.Attribute.Set(?LIQ:ANO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?OBR:NOMPRE_CORTO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?OBR:NOMPRE_CORTO,RepGen:XML,TargetAttr:TagName,'OBR:NOMPRE_CORTO')
  SELF.Attribute.Set(?OBR:NOMPRE_CORTO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?LIQ:MONTO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?LIQ:MONTO,RepGen:XML,TargetAttr:TagName,'LIQ:MONTO')
  SELF.Attribute.Set(?LIQ:MONTO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?LIQ:DEBITO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?LIQ:DEBITO,RepGen:XML,TargetAttr:TagName,'LIQ:DEBITO')
  SELF.Attribute.Set(?LIQ:DEBITO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String8,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String8,RepGen:XML,TargetAttr:TagName,'String8')
  SELF.Attribute.Set(?String8,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?LIQ:MONTO:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?LIQ:MONTO:2,RepGen:XML,TargetAttr:TagName,'LIQ:MONTO:2')
  SELF.Attribute.Set(?LIQ:MONTO:2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String14,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String14,RepGen:XML,TargetAttr:TagName,'String14')
  SELF.Attribute.Set(?String14,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?LIQ:DEBITO:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?LIQ:DEBITO:2,RepGen:XML,TargetAttr:TagName,'LIQ:DEBITO:2')
  SELF.Attribute.Set(?LIQ:DEBITO:2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String11,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String11,RepGen:XML,TargetAttr:TagName,'String11')
  SELF.Attribute.Set(?String11,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String9,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String9,RepGen:XML,TargetAttr:TagName,'String9')
  SELF.Attribute.Set(?String9,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PAGL:GASTOS_ADM,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PAGL:GASTOS_ADM,RepGen:XML,TargetAttr:TagName,'PAGL:GASTOS_ADM')
  SELF.Attribute.Set(?PAGL:GASTOS_ADM,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String10,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String10,RepGen:XML,TargetAttr:TagName,'String10')
  SELF.Attribute.Set(?String10,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PAGL:CUOTA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PAGL:CUOTA,RepGen:XML,TargetAttr:TagName,'PAGL:CUOTA')
  SELF.Attribute.Set(?PAGL:CUOTA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String19,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String19,RepGen:XML,TargetAttr:TagName,'String19')
  SELF.Attribute.Set(?String19,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PAGL:CANT_CUOTA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PAGL:CANT_CUOTA,RepGen:XML,TargetAttr:TagName,'PAGL:CANT_CUOTA')
  SELF.Attribute.Set(?PAGL:CANT_CUOTA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PAGL:SEGURO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PAGL:SEGURO,RepGen:XML,TargetAttr:TagName,'PAGL:SEGURO')
  SELF.Attribute.Set(?PAGL:SEGURO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String20,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String20,RepGen:XML,TargetAttr:TagName,'String20')
  SELF.Attribute.Set(?String20,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PAGL:CANT_CUOTA_S,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PAGL:CANT_CUOTA_S,RepGen:XML,TargetAttr:TagName,'PAGL:CANT_CUOTA_S')
  SELF.Attribute.Set(?PAGL:CANT_CUOTA_S,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?LOC:TOTAL_PARCIAL,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?LOC:TOTAL_PARCIAL,RepGen:XML,TargetAttr:TagName,'LOC:TOTAL_PARCIAL')
  SELF.Attribute.Set(?LOC:TOTAL_PARCIAL,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String42,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String42,RepGen:XML,TargetAttr:TagName,'String42')
  SELF.Attribute.Set(?String42,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PAGL:CREDITO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PAGL:CREDITO,RepGen:XML,TargetAttr:TagName,'PAGL:CREDITO')
  SELF.Attribute.Set(?PAGL:CREDITO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String39,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String39,RepGen:XML,TargetAttr:TagName,'String39')
  SELF.Attribute.Set(?String39,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String37,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String37,RepGen:XML,TargetAttr:TagName,'String37')
  SELF.Attribute.Set(?String37,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PAGL:MONTO_IMP_TOTAL,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PAGL:MONTO_IMP_TOTAL,RepGen:XML,TargetAttr:TagName,'PAGL:MONTO_IMP_TOTAL')
  SELF.Attribute.Set(?PAGL:MONTO_IMP_TOTAL,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String45,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String45,RepGen:XML,TargetAttr:TagName,'String45')
  SELF.Attribute.Set(?String45,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PAGL:GASTOS_BANCARIOS,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PAGL:GASTOS_BANCARIOS,RepGen:XML,TargetAttr:TagName,'PAGL:GASTOS_BANCARIOS')
  SELF.Attribute.Set(?PAGL:GASTOS_BANCARIOS,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String7,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String7,RepGen:XML,TargetAttr:TagName,'String7')
  SELF.Attribute.Set(?String7,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PAGL:MONTO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PAGL:MONTO,RepGen:XML,TargetAttr:TagName,'PAGL:MONTO')
  SELF.Attribute.Set(?PAGL:MONTO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?EcFechaReport,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?EcFechaReport,RepGen:XML,TargetAttr:TagName,'EcFechaReport')
  SELF.Attribute.Set(?EcFechaReport,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?DatoEmpresa,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?DatoEmpresa,RepGen:XML,TargetAttr:TagName,'DatoEmpresa')
  SELF.Attribute.Set(?DatoEmpresa,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PaginaNdeX,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PaginaNdeX,RepGen:XML,TargetAttr:TagName,'PaginaNdeX')
  SELF.Attribute.Set(?PaginaNdeX,RepGen:XML,TargetAttr:TagValueFromText,True)


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  ReturnValue = PARENT.TakeRecord()
  LOC:TOTAL_PARCIAL = PAGL:MONTO - (PAGL:CREDITO + PAGL:MONTO_FACTURA)
  PRINT(RPT:Detail)
  RETURN ReturnValue


Previewer.Ask PROCEDURE

  CODE
  
  !!! Evolution Consulting FREE Templates Start!!!
    L:NroReg = Records(SELF.ImageQueue)
    EvoP_P(SELF.ImageQueue,L:NroReg)        
  
  !!! Evolution Consulting FREE Templates End!!!
  PARENT.Ask


XMLReporter.Setup PROCEDURE

  CODE
  PARENT.Setup
  SELF.SetFileName('')
  SELF.SetRootTag('Clarion_60_XML_Document')
  SELF.SetForceXMLHeader(True)
  SELF.SetSupportNameSpaces(False)
  SELF.SetUseCRLF(True)
  SELF.SetPagesAsDifferentFile(False)
  SELF.SetPagesAsParentTag(False)


HTMLReporter.SetUp PROCEDURE

  CODE
  PARENT.SetUp
  SELF.SetFileName('')
  SELF.SetDocumentName('Clarion Report')
  SELF.SetNavigationText('First','Last','Next','Prior','Select Page','Page_','Load Page')
  SELF.SetSubDirectory(1,'_Files','_Images')
  SELF.SetSingleFile(0)


TXTReporter.Setup PROCEDURE

  CODE
  PARENT.Setup
  SELF.SetFileName('')
  SELF.SetPagesAsDifferentFile(False)
  SELF.SetMargin(0,0,0,0)
  SELF.SetCheckBoxString('[X]','[_]')
  SELF.SetRadioButtonString('(*)','(_)')
  SELF.SetLineString('|','|','-','-','/','\','\','/')
  SELF.SetTextFillString(' ',CHR(176),CHR(177),CHR(178),CHR(219))
  SELF.SetOmitGraph(False)


PDFReporter.SetUp PROCEDURE

  CODE
  PARENT.SetUp
  SELF.SetFileName('')
  SELF.SetDocumentInfo('CW Report','Gestion','IMPRIMIR_PAGO_LIQUIDACION','IMPRIMIR_PAGO_LIQUIDACION','','')
  SELF.SetPagesAsParentBookmark(False)
  SELF.SetScanCopyMode(False)
  SELF.CompressText   = True
  SELF.CompressImages = True

!!! <summary>
!!! Generated from procedure template - Window
!!! Actualizacion PAGOS_LIQUIDACION
!!! </summary>
Formulario_PAGOS_LIQUIDACION PROCEDURE 

!--------------------------------------------------------------------------
! Tagging Data
!--------------------------------------------------------------------------
DASBRW::9:TAGFLAG          BYTE(0)
DASBRW::9:TAGMOUSE         BYTE(0)
DASBRW::9:TAGDISPSTATUS    BYTE(0)
DASBRW::9:QUEUE           QUEUE
PUNTERO                       LIKE(PUNTERO)
                          END
!--------------------------------------------------------------------------
! Tagging Data
!--------------------------------------------------------------------------
CurrentTab           STRING(80)                            ! 
LOC:CUOTA            STRING(255)                           ! 
ActionMessage        CSTRING(40)                           ! 
T                    STRING(1)                             ! 
LOC:MONTO_LIC        REAL                                  ! 
LOC:MONTO_DEBITO     REAL                                  ! 
LOC:GASTO_ADM        REAL                                  ! 
LOC:IMP_CHEQUE       REAL                                  ! 
LOC:GASTOS_BANCARIOS REAL                                  ! 
BRW8::View:Browse    VIEW(LIQUIDACION)
                       PROJECT(LIQ:MES)
                       PROJECT(LIQ:ANO)
                       PROJECT(LIQ:MONTO)
                       PROJECT(LIQ:DEBITO)
                       PROJECT(LIQ:IDLIQUIDACION)
                       PROJECT(LIQ:COBRADO)
                       PROJECT(LIQ:PERIODO)
                       PROJECT(LIQ:IDSOCIO)
                       PROJECT(LIQ:IDOS)
                       JOIN(OBR:PK_OBRA_SOCIAL,LIQ:IDOS)
                         PROJECT(OBR:NOMPRE_CORTO)
                         PROJECT(OBR:IDOS)
                       END
                     END
Queue:Browse         QUEUE                            !Queue declaration for browse/combo box using ?List
T                      LIKE(T)                        !List box control field - type derived from local data
LIQ:MES                LIKE(LIQ:MES)                  !List box control field - type derived from field
LIQ:ANO                LIKE(LIQ:ANO)                  !List box control field - type derived from field
LIQ:MONTO              LIKE(LIQ:MONTO)                !List box control field - type derived from field
LIQ:DEBITO             LIKE(LIQ:DEBITO)               !List box control field - type derived from field
LIQ:IDLIQUIDACION      LIKE(LIQ:IDLIQUIDACION)        !List box control field - type derived from field
OBR:NOMPRE_CORTO       LIKE(OBR:NOMPRE_CORTO)         !List box control field - type derived from field
LIQ:COBRADO            LIKE(LIQ:COBRADO)              !List box control field - type derived from field
LIQ:PERIODO            LIKE(LIQ:PERIODO)              !List box control field - type derived from field
LIQ:IDSOCIO            LIKE(LIQ:IDSOCIO)              !Browse key field - type derived from field
OBR:IDOS               LIKE(OBR:IDOS)                 !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
History::PAGL:Record LIKE(PAGL:RECORD),THREAD
QuickWindow          WINDOW('&Liquidar'),AT(,,430,269),FONT('Arial',8,COLOR:Black,FONT:bold),RESIZE,CENTER,GRAY, |
  IMM,MDI,HLP('Formulario_PAGOS_LIQUIDACION'),SYSTEM
                       ENTRY(@n-14),AT(34,5,64,10),USE(PAGL:IDSOCIO),RIGHT(1)
                       ENTRY(@n-14),AT(34,26,22,10),USE(PAGL:SUCURSAL),RIGHT(1)
                       ENTRY(@n-14),AT(59,26,64,10),USE(PAGL:IDRECIBO),RIGHT(1)
                       BUTTON('Verificar Liquidaciones'),AT(6,43,121,14),USE(?Button5),LEFT,ICON(ICON:Zoom),FLAT
                       GROUP('Liquidaciones Pendientes'),AT(4,58,217,146),USE(?Group1),BOXED,DISABLE
                         LIST,AT(7,69,205,114),USE(?List),HVSCROLL,FORMAT('13L(2)|M~T~@s1@23L(2)|M~MES~@n-3@28L(' & |
  '2)|M~ANO~@n-5@48L(2)|M~MONTO~@N(12.`2)@40D(2)|M~DEBITO~L@n10.2@61L(2)|M~IDLIQUIDACIO' & |
  'N~@n-7@120L(2)|M~NOMPRE CORTO~@s30@60D(2)|M~PRESENTADO~L@s2@45D(2)|M~PERIODO~L@s6@'),FROM(Queue:Browse), |
  IMM,MSG('Browsing Records'),VCR
                         BUTTON('&Marcar'),AT(10,187,51,13),USE(?DASTAG)
                         BUTTON('Marcar Todos'),AT(85,187,51,13),USE(?DASTAGAll)
                         BUTTON('&Decamarcar'),AT(160,187,51,13),USE(?DASUNTAGALL)
                         BUTTON('&Rev tags'),AT(169,252,50,13),USE(?DASREVTAG),DISABLE,HIDE
                         BUTTON('sho&W tags'),AT(94,250,70,13),USE(?DASSHOWTAG),DISABLE,HIDE
                       END
                       GROUP('Total Liquidaciones'),AT(225,59,199,187),USE(?Group2),BOXED,DISABLE
                         PROMPT('Monto Total Liquidación:'),AT(229,74),USE(?Prompt4)
                         STRING(@N$-12.`2),AT(334,74),USE(LOC:MONTO_LIC)
                         PROMPT('Total por Seguro Prof. adeud:'),AT(229,126),USE(?Prompt5)
                         STRING(@N$-10.`2),AT(334,126),USE(PAGL:SEGURO)
                         PROMPT('Cant:'),AT(382,126),USE(?Prompt11)
                         STRING(@n-3),AT(402,126),USE(PAGL:CANT_CUOTA_S)
                         STRING('Imp. Deb/Cred.:'),AT(229,139),USE(?String11)
                         STRING(@N$-10.`2),AT(334,139),USE(PAGL:MONTO_IMP_TOTAL)
                         STRING('Crédito:'),AT(229,153),USE(?String13)
                         STRING(@N$-10.`2),AT(334,152),USE(PAGL:CREDITO,,?PAGL:CREDITO:2)
                         STRING(@N$-10.`2),AT(334,164),USE(LOC:GASTOS_BANCARIOS)
                         PROMPT('Gastos Bancarios: '),AT(229,165),USE(?Prompt14)
                         LINE,AT(228,177,193,0),USE(?Line1),COLOR(COLOR:Black)
                         PROMPT('Total Cuota Solidaria:'),AT(229,87),USE(?Prompt6)
                         STRING(@N$-12.`2),AT(334,87),USE(LOC:GASTO_ADM)
                         PROMPT('Monto Total a Pagar:'),AT(232,180),USE(?Prompt9),FONT(,14)
                         STRING(@N$-13.`2),AT(346,180,73,14),USE(PAGL:MONTO),FONT(,14)
                         PROMPT('Forma Pago:'),AT(228,208),USE(?PAGL:IDSUBCUENTA:Prompt)
                         ENTRY(@n-14),AT(270,207,37,10),USE(PAGL:IDSUBCUENTA),RIGHT(1)
                         BUTTON('...'),AT(309,206,12,12),USE(?CallLookup:2)
                         STRING(@s50),AT(324,207,93,10),USE(SUB:DESCRIPCION)
                         PROMPT('Total Débitos:'),AT(229,100),USE(?Prompt7)
                         STRING(@N$-10.`2),AT(334,100),USE(LOC:MONTO_DEBITO)
                         PROMPT('Total por Cuotas Sociales adeud:'),AT(229,113),USE(?Prompt8)
                         STRING(@N$-10.`2),AT(334,113),USE(PAGL:CUOTA)
                         PROMPT('Cant:'),AT(382,113),USE(?Prompt10)
                         STRING(@n-3),AT(402,113),USE(PAGL:CANT_CUOTA)
                         BUTTON('&Liquidar'),AT(280,222,92,24),USE(?OK),FONT('Arial',14,,FONT:bold),LEFT,ICON('currency_dollar.ico'), |
  CURSOR('mano.cur'),DEFAULT,FLAT,MSG('Confirma y Actualiza el Formulario'),TIP('Confirma y' & |
  ' Actualiza el Formulario')
                       END
                       GROUP('Extras'),AT(6,204,199,38),USE(?Group3),BOXED
                         PROMPT('MONTO IMP DEBITO:'),AT(11,213),USE(?PAGL:MONTO_IMP_DEBITO:Prompt)
                         ENTRY(@n$-10.2),AT(79,213,31,10),USE(PAGL:MONTO_IMP_DEBITO)
                         PROMPT('CREDITO:'),AT(11,226),USE(?PAGL:CREDITO:Prompt)
                         ENTRY(@n$-10.2),AT(78,227,32,10),USE(PAGL:CREDITO)
                       END
                       BUTTON('&Cancelar'),AT(380,256,49,14),USE(?Cancel),LEFT,ICON('cancelar.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Cancela Operacion'),TIP('Cancela Operacion')
                       PROMPT('IDSOCIO:'),AT(3,5),USE(?PAGL:IDSOCIO:Prompt),TRN
                       BUTTON('...'),AT(99,4,12,12),USE(?CallLookup)
                       STRING(@s30),AT(115,6),USE(SOC:NOMBRE)
                       BUTTON('Calcular Liquidación'),AT(10,246,84,18),USE(?Button4),LEFT,ICON(ICON:NextPage),DISABLE, |
  FLAT
                       PROMPT('IDRECIBO:'),AT(1,26),USE(?PAGL:IDRECIBO:Prompt),TRN
                       CHECK('AFECTADA'),AT(128,27),USE(PAGL:AFECTADA),VALUE('SI','NO')
                     END

ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeCompleted          PROCEDURE(),BYTE,PROC,DERIVED
TakeFieldEvent         PROCEDURE(),BYTE,PROC,DERIVED
TakeNewSelection       PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

BRW8                 CLASS(BrowseClass)                    ! Browse using ?List
Q                      &Queue:Browse                  !Reference to browse queue
SetQueueRecord         PROCEDURE(),DERIVED
TakeKey                PROCEDURE(),BYTE,PROC,DERIVED
ValidateRecord         PROCEDURE(),BYTE,DERIVED
                     END

BRW8::Sort0:Locator  StepLocatorClass                      ! Default Locator
CurCtrlFeq          LONG
FieldColorQueue     QUEUE
Feq                   LONG
OldColor              LONG
                    END

  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!--------------------------------------------------------------------------
! DAS_Tagging
!--------------------------------------------------------------------------
DASBRW::9:DASTAGONOFF Routine
  GET(Queue:Browse,CHOICE(?List))
  BRW8.UpdateBuffer
   TAGS.PUNTERO = LIQ:IDLIQUIDACION
   GET(TAGS,TAGS.PUNTERO)
  IF ERRORCODE()
     TAGS.PUNTERO = LIQ:IDLIQUIDACION
     ADD(TAGS,TAGS.PUNTERO)
    T = '*'
  ELSE
    DELETE(TAGS)
    T = ''
  END
    Queue:Browse.T = T
  PUT(Queue:Browse)
  ThisWindow.Reset(1)
  SELECT(?List,CHOICE(?List))
  IF DASBRW::9:TAGMOUSE = 1 THEN
    DASBRW::9:TAGMOUSE = 0
  ELSE
  DASBRW::9:TAGFLAG = 1
  POST(EVENT:ScrollDown,?List)
  END
DASBRW::9:DASTAGALL Routine
  ?List{PROPLIST:MouseDownField} = 2
  SETCURSOR(CURSOR:Wait)
  BRW8.Reset
  FREE(TAGS)
  LOOP
    NEXT(BRW8::View:Browse)
    IF ERRORCODE()
      BREAK
    END
     TAGS.PUNTERO = LIQ:IDLIQUIDACION
     ADD(TAGS,TAGS.PUNTERO)
  END
  SETCURSOR
  BRW8.ResetSort(1)
  ThisWindow.Reset(1)
  SELECT(?List,CHOICE(?List))
DASBRW::9:DASUNTAGALL Routine
  ?List{PROPLIST:MouseDownField} = 2
  SETCURSOR(CURSOR:Wait)
  FREE(TAGS)
  BRW8.Reset
  SETCURSOR
  BRW8.ResetSort(1)
  ThisWindow.Reset(1)
  SELECT(?List,CHOICE(?List))
DASBRW::9:DASREVTAGALL Routine
  ?List{PROPLIST:MouseDownField} = 2
  SETCURSOR(CURSOR:Wait)
  FREE(DASBRW::9:QUEUE)
  LOOP QR# = 1 TO RECORDS(TAGS)
    GET(TAGS,QR#)
    DASBRW::9:QUEUE = TAGS
    ADD(DASBRW::9:QUEUE)
  END
  FREE(TAGS)
  BRW8.Reset
  LOOP
    NEXT(BRW8::View:Browse)
    IF ERRORCODE()
      BREAK
    END
     DASBRW::9:QUEUE.PUNTERO = LIQ:IDLIQUIDACION
     GET(DASBRW::9:QUEUE,DASBRW::9:QUEUE.PUNTERO)
    IF ERRORCODE()
       TAGS.PUNTERO = LIQ:IDLIQUIDACION
       ADD(TAGS,TAGS.PUNTERO)
    END
  END
  SETCURSOR
  BRW8.ResetSort(1)
  ThisWindow.Reset(1)
  SELECT(?List,CHOICE(?List))
DASBRW::9:DASSHOWTAG Routine
   CASE DASBRW::9:TAGDISPSTATUS
   OF 0
      DASBRW::9:TAGDISPSTATUS = 1    ! display tagged
      ?DASSHOWTAG{PROP:Text} = 'Showing Tagged'
      ?DASSHOWTAG{PROP:Msg}  = 'Showing Tagged'
      ?DASSHOWTAG{PROP:Tip}  = 'Showing Tagged'
   OF 1
      DASBRW::9:TAGDISPSTATUS = 2    ! display untagged
      ?DASSHOWTAG{PROP:Text} = 'Showing UnTagged'
      ?DASSHOWTAG{PROP:Msg}  = 'Showing UnTagged'
      ?DASSHOWTAG{PROP:Tip}  = 'Showing UnTagged'
   OF 2
      DASBRW::9:TAGDISPSTATUS = 0    ! display all
      ?DASSHOWTAG{PROP:Text} = 'Show All'
      ?DASSHOWTAG{PROP:Msg}  = 'Show All'
      ?DASSHOWTAG{PROP:Tip}  = 'Show All'
   END
   DISPLAY(?DASSHOWTAG{PROP:Text})
   BRW8.ResetSort(1)
   SELECT(?List,CHOICE(?List))
   EXIT
!--------------------------------------------------------------------------
! DAS_Tagging
!--------------------------------------------------------------------------
!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
!---------------------------------------------------------------------------

ThisWindow.Ask PROCEDURE

  CODE
  CASE SELF.Request                                        ! Configure the action message text
  OF ViewRecord
    ActionMessage = 'Visualizando Registro'
  OF InsertRecord
    ActionMessage = 'Insertando Registro'
  OF ChangeRecord
    ActionMessage = 'Cambiando Registro'
  END
  QuickWindow{PROP:Text} = ActionMessage                   ! Display status message in title bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('Formulario_PAGOS_LIQUIDACION')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?PAGL:IDSOCIO
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('T',T)                                              ! Added by: BrowseBox(ABC)
  BIND('OBR:NOMPRE_CORTO',OBR:NOMPRE_CORTO)                ! Added by: BrowseBox(ABC)
  BIND('OBR:IDOS',OBR:IDOS)                                ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(PAGL:Record,History::PAGL:Record)
  SELF.AddHistoryField(?PAGL:IDSOCIO,2)
  SELF.AddHistoryField(?PAGL:SUCURSAL,3)
  SELF.AddHistoryField(?PAGL:IDRECIBO,12)
  SELF.AddHistoryField(?PAGL:SEGURO,20)
  SELF.AddHistoryField(?PAGL:CANT_CUOTA_S,21)
  SELF.AddHistoryField(?PAGL:MONTO_IMP_TOTAL,26)
  SELF.AddHistoryField(?PAGL:CREDITO:2,27)
  SELF.AddHistoryField(?PAGL:MONTO,5)
  SELF.AddHistoryField(?PAGL:IDSUBCUENTA,15)
  SELF.AddHistoryField(?PAGL:CUOTA,18)
  SELF.AddHistoryField(?PAGL:CANT_CUOTA,19)
  SELF.AddHistoryField(?PAGL:MONTO_IMP_DEBITO,25)
  SELF.AddHistoryField(?PAGL:CREDITO,27)
  SELF.AddHistoryField(?PAGL:AFECTADA,16)
  SELF.AddUpdateFile(Access:PAGOS_LIQUIDACION)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:CONF_EMP.Open                                     ! File CONF_EMP used by this procedure, so make sure it's RelationManager is open
  Relate:CONTROL_LIQUIDACION.Open                          ! File CONTROL_LIQUIDACION used by this procedure, so make sure it's RelationManager is open
  Relate:FACTURA.Open                                      ! File FACTURA used by this procedure, so make sure it's RelationManager is open
  Relate:GASTOS.Open                                       ! File GASTOS used by this procedure, so make sure it's RelationManager is open
  Relate:INGRESOS.Open                                     ! File INGRESOS used by this procedure, so make sure it's RelationManager is open
  Relate:LIQUIDACION.SetOpenRelated()
  Relate:LIQUIDACION.Open                                  ! File LIQUIDACION used by this procedure, so make sure it's RelationManager is open
  Relate:LIQUIDACIONAlias.Open                             ! File LIQUIDACIONAlias used by this procedure, so make sure it's RelationManager is open
  Relate:PAGOS_LIQUIDACION.Open                            ! File PAGOS_LIQUIDACION used by this procedure, so make sure it's RelationManager is open
  Relate:PAGOS_LIQUIDACIONAlias.Open                       ! File PAGOS_LIQUIDACIONAlias used by this procedure, so make sure it's RelationManager is open
  Relate:RANKING.Open                                      ! File RANKING used by this procedure, so make sure it's RelationManager is open
  Relate:SEGURO.Open                                       ! File SEGURO used by this procedure, so make sure it's RelationManager is open
  Relate:SEGURO_FACTURA.Open                               ! File SEGURO_FACTURA used by this procedure, so make sure it's RelationManager is open
  Relate:SOCIOS.Open                                       ! File SOCIOS used by this procedure, so make sure it's RelationManager is open
  Relate:SUBCUENTAS.Open                                   ! File SUBCUENTAS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:PAGOS_LIQUIDACION
  IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing ! Setup actions for ViewOnly Mode
    SELF.InsertAction = Insert:None
    SELF.DeleteAction = Delete:None
    SELF.ChangeAction = Change:None
    SELF.CancelAction = Cancel:Cancel
    SELF.OkControl = 0
  ELSE
    SELF.ChangeAction = Change:Caller                      ! Changes allowed
    SELF.CancelAction = Cancel:Cancel+Cancel:Query         ! Confirm cancel
    SELF.OkControl = ?OK
    IF SELF.PrimeUpdate() THEN RETURN Level:Notify.
  END
  BRW8.Init(?List,Queue:Browse.ViewPosition,BRW8::View:Browse,Queue:Browse,Relate:LIQUIDACION,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    ?PAGL:IDSOCIO{PROP:ReadOnly} = True
    ?PAGL:SUCURSAL{PROP:ReadOnly} = True
    ?PAGL:IDRECIBO{PROP:ReadOnly} = True
    DISABLE(?Button5)
    DISABLE(?DASTAG)
    DISABLE(?DASTAGAll)
    DISABLE(?DASUNTAGALL)
    DISABLE(?DASREVTAG)
    DISABLE(?DASSHOWTAG)
    ?PAGL:IDSUBCUENTA{PROP:ReadOnly} = True
    DISABLE(?CallLookup:2)
    ?PAGL:MONTO_IMP_DEBITO{PROP:ReadOnly} = True
    ?PAGL:CREDITO{PROP:ReadOnly} = True
    DISABLE(?CallLookup)
    DISABLE(?Button4)
    ?PAGL:AFECTADA{PROP:ReadOnly} = True
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  BRW8.Q &= Queue:Browse
  BRW8.RetainRow = 0
  BRW8.AddSortOrder(,LIQ:FK_LIQUIDACION_SOCIO)             ! Add the sort order for LIQ:FK_LIQUIDACION_SOCIO for sort order 1
  BRW8.AddRange(LIQ:IDSOCIO,GLO:IDSOCIO)                   ! Add single value range limit for sort order 1
  BRW8.AddLocator(BRW8::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW8::Sort0:Locator.Init(,LIQ:IDSOCIO,,BRW8)             ! Initialize the browse locator using  using key: LIQ:FK_LIQUIDACION_SOCIO , LIQ:IDSOCIO
  BRW8.AppendOrder('LIQ:IDLIQUIDACION')                    ! Append an additional sort order
  BRW8.SetFilter('(LIQ:COBRADO = ''SI''  AND LIQ:PAGADO = ''NO'')') ! Apply filter expression to browse
  BRW8.AddField(T,BRW8.Q.T)                                ! Field T is a hot field or requires assignment from browse
  BRW8.AddField(LIQ:MES,BRW8.Q.LIQ:MES)                    ! Field LIQ:MES is a hot field or requires assignment from browse
  BRW8.AddField(LIQ:ANO,BRW8.Q.LIQ:ANO)                    ! Field LIQ:ANO is a hot field or requires assignment from browse
  BRW8.AddField(LIQ:MONTO,BRW8.Q.LIQ:MONTO)                ! Field LIQ:MONTO is a hot field or requires assignment from browse
  BRW8.AddField(LIQ:DEBITO,BRW8.Q.LIQ:DEBITO)              ! Field LIQ:DEBITO is a hot field or requires assignment from browse
  BRW8.AddField(LIQ:IDLIQUIDACION,BRW8.Q.LIQ:IDLIQUIDACION) ! Field LIQ:IDLIQUIDACION is a hot field or requires assignment from browse
  BRW8.AddField(OBR:NOMPRE_CORTO,BRW8.Q.OBR:NOMPRE_CORTO)  ! Field OBR:NOMPRE_CORTO is a hot field or requires assignment from browse
  BRW8.AddField(LIQ:COBRADO,BRW8.Q.LIQ:COBRADO)            ! Field LIQ:COBRADO is a hot field or requires assignment from browse
  BRW8.AddField(LIQ:PERIODO,BRW8.Q.LIQ:PERIODO)            ! Field LIQ:PERIODO is a hot field or requires assignment from browse
  BRW8.AddField(LIQ:IDSOCIO,BRW8.Q.LIQ:IDSOCIO)            ! Field LIQ:IDSOCIO is a hot field or requires assignment from browse
  BRW8.AddField(OBR:IDOS,BRW8.Q.OBR:IDOS)                  ! Field OBR:IDOS is a hot field or requires assignment from browse
  INIMgr.Fetch('Formulario_PAGOS_LIQUIDACION',QuickWindow) ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW8.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  SELF.SetAlerts()
  !--------------------------------------------------------------------------
  ! Tagging Init
  !--------------------------------------------------------------------------
  FREE(TAGS)
  ?DASSHOWTAG{PROP:Text} = 'Show All'
  ?DASSHOWTAG{PROP:Msg}  = 'Show All'
  ?DASSHOWTAG{PROP:Tip}  = 'Show All'
  !--------------------------------------------------------------------------
  ! Tagging Init
  !--------------------------------------------------------------------------
  ?List{Prop:Alrt,239} = SpaceKey
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
  !--------------------------------------------------------------------------
  ! Tagging Kill
  !--------------------------------------------------------------------------
  FREE(TAGS)
  !--------------------------------------------------------------------------
  ! Tagging Kill
  !--------------------------------------------------------------------------
    Relate:CONF_EMP.Close
    Relate:CONTROL_LIQUIDACION.Close
    Relate:FACTURA.Close
    Relate:GASTOS.Close
    Relate:INGRESOS.Close
    Relate:LIQUIDACION.Close
    Relate:LIQUIDACIONAlias.Close
    Relate:PAGOS_LIQUIDACION.Close
    Relate:PAGOS_LIQUIDACIONAlias.Close
    Relate:RANKING.Close
    Relate:SEGURO.Close
    Relate:SEGURO_FACTURA.Close
    Relate:SOCIOS.Close
    Relate:SUBCUENTAS.Close
  END
  IF SELF.Opened
    INIMgr.Update('Formulario_PAGOS_LIQUIDACION',QuickWindow) ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Run PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run()
  IF SELF.Request = ViewRecord                             ! In View Only mode always signal RequestCancelled
    ReturnValue = RequestCancelled
  END
  RETURN ReturnValue


ThisWindow.Run PROCEDURE(USHORT Number,BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run(Number,Request)
  IF SELF.Request = ViewRecord
    ReturnValue = RequestCancelled                         ! Always return RequestCancelled if the form was opened in ViewRecord mode
  ELSE
    GlobalRequest = Request
    EXECUTE Number
      SelectSOCIOS
      SelectSUBCUENTAS
    END
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
    OF ?Button5
      GLO:IDSOCIO = PAGL:IDSOCIO
      ENABLE(?Group1)
      ENABLE(?Button4)
      THISWINDOW.RESET(1)
      !!!!
      !!! BUSCO % DEL GASTO ADMINISTRATIVO
      COF:RAZON_SOCIAL = GLO:RAZON_SOCIAL
      ACCESS:CONF_EMP.TRYFETCH(COF:PK_CONF_EMP)
      CHEQUE$ = COF:IMP_CHEQUE
      IMP_CHEQUE$ = CHEQUE$ / 100
      NU# = 0 
      PAGL1:IDSOCIO = PAGL:IDSOCIO
      SET(PAGL1:FK_PAGOS_LIQUIDACION_SOCIOS,PAGL1:FK_PAGOS_LIQUIDACION_SOCIOS)
      LOOP
          IF ACCESS:PAGOS_LIQUIDACIONAlias.NEXT() THEN BREAK.
          IF PAGL1:IDSOCIO <> PAGL:IDSOCIO THEN BREAK.
          IF  NU# =  0 THEN 
              NU# = PAGL1:IDPAGOS
              PAGL:MONTO_IMP_DEBITO = PAGL1:MONTO * IMP_CHEQUE$
              !MESSAGE('ENTRO')
          ELSE 
              IF PAGL1:IDPAGOS > NU# THEN 
                  NU# = PAGL1:IDPAGOS
                  PAGL:MONTO_IMP_DEBITO = PAGL1:MONTO * IMP_CHEQUE$ 
                  !MESSAGE('ENTRO2')
              END 
               
          END 
      END !! LOOP  
      
      ENABLE(?Group1)
      ENABLE(?Button4)
      THISWINDOW.RESET(1)
    OF ?OK
      IF PAGL:SUCURSAL <> '' AND PAGL:IDRECIBO <> '' AND PAGL:IDSUBCUENTA <> 0 AND PAGL:MONTO > 0  THEN
          PAGL:MONTO_FACTURA  =  LOC:MONTO_LIC
          PAGL:FECHA          =  today()
          PAGL:HORA           =  clock()
          PAGL:MES            =  MONTH(TODAY())
          PAGL:ANO            =  YEAR(TODAY())
          PAGL:PERIODO        =  PAGL:ANO&(FORMAT(PAGL:MES,@N02))
          PAGL:IDUSUARIO      =  GLO:IDUSUARIO
          PAGL:DEBITO         =  LOC:MONTO_DEBITO
          PAGL:GASTOS_ADM     =  LOC:GASTO_ADM
          PAGL:GASTOS_BANCARIOS = LOC:GASTOS_BANCARIOS
          GLO:MONTO = PAGL:MONTO
          PAGL:IDLIQUIDACION = GLO:IDSOLICITUD
          !!! CONTROL_LIQUIDACION
          CON31:IDSOCIO = PAGL:IDSOCIO
          GET(CONTROL_LIQUIDACION,CON31:FK_CONTROL_LIQUIDACION)
          IF ERRORCODE() = 35 THEN
              CON31:IDSOCIO = PAGL:IDSOCIO
              CON31:MES    = MONTH(TODAY())
              CON31:ANO    = YEAR(TODAY())
              CON31:PERIODO = CON31:ANO&(FORMAT(CON31:MES,@N02))
              CON31:NUMERO = 1
              NUMERO# = 1
              ACCESS:CONTROL_LIQUIDACION.INSERT()
              
         ELSE
              CON31:MES    = MONTH(TODAY())
              CON31:ANO    = YEAR(TODAY())
              CON31:PERIODO = CON31:ANO&(FORMAT(CON31:MES,@N02))
              CON31:NUMERO = CON31:NUMERO + 1
              NUMERO# = CON31:NUMERO
              ACCESS:CONTROL_LIQUIDACION.UPDATE()
              
         END
         PAGL:SOCIOS_LIQUIDACION =  NUMERO#
      ELSE
          MESSAGE('No se cargaron Datos esenciales para efectuar la Liquidación')
          cycle
      end
      
      
    OF ?Button4
      GLO:IDSOCIO = PAGL:IDSOCIO
      GLO:MONTO = 0
      LOC:MONTO_LIC =  0
      LOC:MONTO_DEBITO = 0
      !!! BUSCO % DEL GASTO ADMINISTRATIVO
      COF:RAZON_SOCIAL = GLO:RAZON_SOCIAL
      ACCESS:CONF_EMP.TRYFETCH(COF:PK_CONF_EMP)
      COMISION$ = COF:PORCENTAJE_LIQUIDACION
      COMISION_GTO$ = COMISION$ / 100
      CHEQUE$ = COF:IMP_CHEQUE
      IMP_CHEQUE$ = CHEQUE$ / 100
      CHEQUERA$ = COF:CHEQUERA
      
      
      Loop i# = 1 to records(Tags)
          get(Tags,i#)
          LIQ:IDLIQUIDACION = tags:Puntero
          GET(LIQUIDACION,LIQ:PK_LIQUIDACION)
          IF ERRORCODE() = 35 THEN
              MESSAGE('NO ENCONTRO FACTURA')
          ELSE
              GLO:MONTO = GLO:MONTO + LIQ:MONTO
              LOC:MONTO_LIC    = LOC:MONTO_LIC    +  LIQ:MONTO
              LOC:MONTO_DEBITO = LOC:MONTO_DEBITO +  LIQ:DEBITO
              LOC:GASTO_ADM = LOC:GASTO_ADM  + (LIQ:MONTO * COMISION_GTO$)
              GLO:IDSOLICITUD = LIQ:IDLIQUIDACION
            
          end
      end
      LOC:GASTOS_BANCARIOS = CHEQUERA$ !! nuevo 24 07 2014 se paramos de tos adm  SUMA EL VALOR DE LA CHEQUERA AL GSTO ADM.
      !! BUSCO TOTAL CUOTAS
      GLO:MONTO = 0
      GLO:INTERES = 0 
      MONTO_PARCIAL$ =  LOC:MONTO_LIC - (LOC:MONTO_DEBITO  + LOC:GASTO_ADM)
      FAC:IDSOCIO = GLO:IDSOCIO
      SET(FAC:FK_FACTURA_SOCIO,FAC:FK_FACTURA_SOCIO)
      LOOP
          IF ACCESS:FACTURA.NEXT() THEN BREAK.
          IF FAC:IDSOCIO <> GLO:IDSOCIO THEN BREAK.
          IF FAC:ESTADO = '' THEN
              !! CALCULA SI SUMANDO EL MONTO DE LA FACTURA QUEDA RESTO PARA PAGAR
              MONTO_PARCIAL$ = MONTO_PARCIAL$ -  FAC:TOTAL
              IF  MONTO_PARCIAL$ > 0 THEN
                  PAGL:CANT_CUOTA  = PAGL:CANT_CUOTA +1
                  !!! CALCULA INTERES
                  !!! SACO PERIODO MENOS PARA CARGAR INTERES
                  MES# = MONTH (TODAY())
                  ANO# = YEAR(TODAY())
                  PERIODO$  = FORMAT(ANO#,@N04)&FORMAT(MES#,@N02)
                  IF FAC:PERIODO >=  PERIODO$ THEN
                      GLO:MONTO =FAC:TOTAL - FAC:DESCUENTOCOBERTURA
                      !!! SUMA LOS INTERESES PARA LUEGO IMPRIMIR PAGO A CUENTA
                      GLO:INTERES = GLO:INTERES + FAC:DESCUENTOCOBERTURA 
                  ELSE
                      GLO:MONTO = FAC:TOTAL
                  END
      
                  PAGL:CUOTA = PAGL:CUOTA + GLO:MONTO
              END
          END
      END
      
      !! BUSCO TOTAL CUOTAS SEGURO
      SEG5:IDSOCIO =  GLO:IDSOCIO
      SET(SEG5:FK_SEGURO_FACTURA_SOCIO,SEG5:FK_SEGURO_FACTURA_SOCIO)
      LOOP
          IF ACCESS:SEGURO_FACTURA.NEXT() THEN BREAK.
          IF SEG5:IDSOCIO <> GLO:IDSOCIO THEN BREAK.
          IF SEG5:ESTADO = '' THEN
              !! CALCULA SI SUMANDO EL MONTO DE LA FACTURA QUEDA RESTO PARA PAGAR
              MONTO_PARCIAL$ = MONTO_PARCIAL$ -  SEG5:TOTAL
              IF  MONTO_PARCIAL$ > 0 THEN
                  PAGL:CANT_CUOTA_S  = PAGL:CANT_CUOTA_S +1
                  PAGL:SEGURO = PAGL:SEGURO + SEG5:TOTAL
              END
          END
      END
      !! SACA EL % DEL IMPUESTO AL CHEQUE Y LO DESCUENTA DEL MONTO
      PAGL:IMP_CHEQUE =  IMP_CHEQUE$
      SACA_MONTO$ =  LOC:MONTO_LIC - LOC:MONTO_DEBITO
      PAGL:MONTO_IMP_CHEQUE = (SACA_MONTO$ * IMP_CHEQUE$)
      PAGL:MONTO_IMP_TOTAL = PAGL:MONTO_IMP_CHEQUE + PAGL:MONTO_IMP_DEBITO !! SUMO LOS 2 IMPUESTOS
      !!!!!!!!!!!!!!!!!!
      
      PAGL:MONTO =  LOC:MONTO_LIC - (LOC:MONTO_DEBITO  + LOC:GASTO_ADM + PAGL:CUOTA + PAGL:SEGURO + PAGL:MONTO_IMP_TOTAL + LOC:GASTOS_BANCARIOS )
      PAGL:MONTO = PAGL:MONTO + PAGL:CREDITO
      
      ENABLE(?Group2)
      disable(?Group1)
      disable(?Button4)
      THISWINDOW.RESET(1)
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?PAGL:IDSOCIO
      SOC:IDSOCIO = PAGL:IDSOCIO
      IF Access:SOCIOS.TryFetch(SOC:PK_SOCIOS)
        IF SELF.Run(1,SelectRecord) = RequestCompleted
          PAGL:IDSOCIO = SOC:IDSOCIO
        ELSE
          SELECT(?PAGL:IDSOCIO)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
      IF Access:PAGOS_LIQUIDACION.TryValidateField(2)      ! Attempt to validate PAGL:IDSOCIO in PAGOS_LIQUIDACION
        SELECT(?PAGL:IDSOCIO)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?PAGL:IDSOCIO
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?PAGL:IDSOCIO{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?DASTAG
      ThisWindow.Update()
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
        DO DASBRW::9:DASTAGONOFF
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
    OF ?DASTAGAll
      ThisWindow.Update()
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
        DO DASBRW::9:DASTAGALL
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
    OF ?DASUNTAGALL
      ThisWindow.Update()
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
        DO DASBRW::9:DASUNTAGALL
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
    OF ?DASREVTAG
      ThisWindow.Update()
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
        DO DASBRW::9:DASREVTAGALL
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
    OF ?DASSHOWTAG
      ThisWindow.Update()
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
        DO DASBRW::9:DASSHOWTAG
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
    OF ?PAGL:IDSUBCUENTA
      IF PAGL:IDSUBCUENTA OR ?PAGL:IDSUBCUENTA{PROP:Req}
        SUB:IDSUBCUENTA = PAGL:IDSUBCUENTA
        IF Access:SUBCUENTAS.TryFetch(SUB:INTEG_113)
          IF SELF.Run(2,SelectRecord) = RequestCompleted
            PAGL:IDSUBCUENTA = SUB:IDSUBCUENTA
          ELSE
            SELECT(?PAGL:IDSUBCUENTA)
            CYCLE
          END
        END
      END
      ThisWindow.Reset()
    OF ?CallLookup:2
      ThisWindow.Update()
      SUB:IDSUBCUENTA = PAGL:IDSUBCUENTA
      IF SELF.Run(2,SelectRecord) = RequestCompleted
        PAGL:IDSUBCUENTA = SUB:IDSUBCUENTA
      END
      ThisWindow.Reset(1)
    OF ?OK
      ThisWindow.Update()
      IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing THEN
         POST(EVENT:CloseWindow)
      END
    OF ?CallLookup
      ThisWindow.Update()
      SOC:IDSOCIO = PAGL:IDSOCIO
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        PAGL:IDSOCIO = SOC:IDSOCIO
      END
      ThisWindow.Reset(1)
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeCompleted PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  ReturnValue = PARENT.TakeCompleted()
  If  Self.Request=insertRecord AND SELF.RESPONSE = RequestCompleted Then
          PAGL:IDLIQUIDACION = GLO:IDSOLICITUD
          ACCESS:PAGOS_LIQUIDACION.TRYFETCH(PAGL:IDX_PAGOS_LIQUIDACION_PAGO)
          GLO:PAGO = PAGL:IDPAGOS
          GLO:GTO_ADM = 'Pago Cuota Solidaria, Liquidación Nº'&PAGL:IDPAGOS
      IF PAGL:AFECTADA = '' THEN !!! NO SE ASIENTA EN FINANZAS
          !! SACO DE LA CAJA
          SUB:IDSUBCUENTA = PAGL:IDSUBCUENTA
          ACCESS:SUBCUENTAS.TRYFETCH(SUB:INTEG_113)
          !!! MODIFICA EL FLUJO DE FONDOS
          FON:IDFONDO = SUB:IDFONDO
          ACCESS:FONDOS.TRYFETCH(FON:PK_FONDOS)
          FON:MONTO = FON:MONTO - PAGL:MONTO
          FON:FECHA = TODAY()
          FON:HORA = CLOCK()
          ACCESS:FONDOS.UPDATE()
          GLO:SUCURSAL = 0
          GLO:RECIBO = 0
          !! BUSCO EL ID PROVEEDOR
          SOC:IDSOCIO = PAGL:IDSOCIO
          ACCESS:SOCIOS.TRYFETCH(SOC:PK_SOCIOS)
          IDPROVEEDOR# = SOC:IDPROVEEDOR
  
          !!!!   CARGA EN CAJA SI SE DE CAJA
          IF SUB:CAJA = 'SI' THEN
              !!! CARGO CAJA
              CAJ:IDSUBCUENTA = SUB:IDSUBCUENTA
              CAJ:IDUSUARIO = PAGL:IDUSUARIO
              CAJ:DEBE =  0
              CAJ:HABER = PAGL:MONTO
              CAJ:OBSERVACION = 'COBRO GTO ADM AUTOM. LIQUIDACION : '&GLO:PAGO
              CAJ:FECHA = TODAY()
              CAJ:MES       =  MONTH(TODAY())
              CAJ:ANO       =  YEAR(TODAY())
              CAJ:PERIODO   =  CAJ:ANO&(FORMAT(CAJ:MES,@N02))
              CAJ:SUCURSAL  =   PAGL:SUCURSAL
              CAJ:RECIBO    =   PAGL:IDRECIBO
              CAJ:TIPO      =   'EGRESO'
              CAJ:IDTRANSACCION =  PAGL:IDRECIBO
              FON:IDFONDO = SUB:IDFONDO
              ACCESS:FONDOS.TRYFETCH(FON:PK_FONDOS)
              CAJ:MONTO = FON:MONTO 
              !!! DISPARA STORE PROCEDURE
              RANKING{PROP:SQL} = 'CALL SP_GEN_CAJA_ID'
              NEXT(RANKING)
              CAJ:IDCAJA = RAN:C1
              ACCESS:CAJA.INSERT()
              RAN:C1 = 0
          END
          
  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          !! CARGA DE Nº DE RECIBO CON O SIN CUOTA
           Cargar_Recibo
          !! CARGO INGRESO  GASTO ADMINISTRATIVO
          !!!!!!
          RANKING{PROP:SQL} = 'DELETE FROM RANKING'
          ING:IDUSUARIO        =   PAGL:IDUSUARIO
          ING:IDSUBCUENTA      =   14 !! SUBCUENTA DE COBRO DE CUOTAS POR LIQUIDACION
          ING:OBSERVACION      =   'COBRO GTO ADM AUTOM. LIQUIDACION : '&GLO:PAGO
          ING:MONTO            =   PAGL:GASTOS_ADM
          ING:FECHA            =   PAGL:FECHA
          ING:HORA             =   PAGL:HORA
          ING:MES              =   PAGL:MES
          ING:ANO              =   PAGL:ANO
          ING:PERIODO          =   PAGL:PERIODO
          ING:IDPROVEEDOR      =   IDPROVEEDOR#
          ING:SUCURSAL         =   GLO:SUCURSAL
          ING:IDRECIBO         =   GLO:RECIBO
          !!! CARGA
          RANKING{PROP:SQL} = 'CALL SP_GEN_INGRESOS_ID'
          NEXT(RANKING)
          ING:IDINGRESO = RAN:C1
          !MESSAGE(ING:IDINGRESO)
          ACCESS:INGRESOS.INSERT()
          !!! NO MODIFICA EL FLUJO DE FONDOS POR QUE SOLO SALE LO QUE SE PAGA LO DEMAS VA CON FONDO = 0
          ! LIBRO DIARIO
              CUE:IDCUENTA = 11 !! PAGOS POR LIQUIDACION
              ACCESS:CUENTAS.TRYFETCH(CUE:PK_CUENTAS)
              IF CUE:TIPO = 'INGRESO' THEN
                  LIB:IDSUBCUENTA =  14
                  LIB:DEBE =  PAGL:GASTOS_ADM
                  LIB:HABER = 0
                  LIB:OBSERVACION = 'COBRO GTO. ADM EN LA  LIQUIDACION '&GLO:PAGO
                  LIB:FECHA = TODAY()
                  LIB:HORA = CLOCK()
                  LIB:MES       =  MONTH(TODAY())
                  LIB:ANO       =  YEAR(TODAY())
                  LIB:PERIODO   =  LIB:ANO&(FORMAT(LIB:MES,@N02))
                  LIB:SUCURSAL  =  PAGL:SUCURSAL
                  LIB:RECIBO       = PAGL:IDRECIBO
                  LIB:IDPROVEEDOR  =  IDPROVEEDOR#
                  LIB:TIPO         =  'INGRESO'
                  LIB:IDTRANSACCION =  ING:IDINGRESO
                  LIB:FONDO = 0
                  !!! DISPARA STORE PROCEDURE
                  RANKING{PROP:SQL} = 'CALL SP_GEN_LIBDIARIO_ID'
                  NEXT(RANKING)
                  LIB:IDLIBDIARIO = RAN:C1
                  !!!!!!!!!!!
                  ACCESS:LIBDIARIO.INSERT()
               END
               
  
  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  
          !! CARGO INGRESO  IMPUESTO AL CHEQUE
          RANKING{PROP:SQL} = 'DELETE FROM RANKING'
          ING:IDUSUARIO        =   PAGL:IDUSUARIO
          ING:IDSUBCUENTA      =   52 !! SUBCUENTA DE COBRO DE CUOTAS POR LIQUIDACION
          ING:OBSERVACION      =   'IMP. AL DEB/CRED. LIQUIDACION: '&GLO:PAGO
          ING:MONTO            =   PAGL:MONTO_IMP_TOTAL
          ING:FECHA            =   PAGL:FECHA
          ING:HORA             =   PAGL:HORA
          ING:MES              =   PAGL:MES
          ING:ANO              =   PAGL:ANO
          ING:PERIODO          =   PAGL:PERIODO
          ING:IDPROVEEDOR      =   IDPROVEEDOR#
          ING:SUCURSAL         =   PAGL:SUCURSAL
          ING:IDRECIBO         =   PAGL:IDRECIBO
          !!! CARGA
          RANKING{PROP:SQL} = 'CALL SP_GEN_INGRESOS_ID'
          NEXT(RANKING)
          ING:IDINGRESO = RAN:C1
          !MESSAGE(ING:IDINGRESO)
          ACCESS:INGRESOS.INSERT()
          ! LIBRO DIARIO
          CUE:IDCUENTA = 11 !! PAGOS POR LIQUIDACION
          ACCESS:CUENTAS.TRYFETCH(CUE:PK_CUENTAS)
          IF CUE:TIPO = 'INGRESO' THEN
                  LIB:IDSUBCUENTA =  52
                  LIB:DEBE =  PAGL:MONTO_IMP_TOTAL
                  LIB:HABER = 0
                  LIB:OBSERVACION = 'IMP. AL DEB/CRED. LIQUIDACION: '&GLO:PAGO
                  LIB:FECHA = TODAY()
                  LIB:HORA = CLOCK()
                  LIB:MES       =  MONTH(TODAY())
                  LIB:ANO       =  YEAR(TODAY())
                  LIB:PERIODO   =  LIB:ANO&(FORMAT(LIB:MES,@N02))
                  LIB:SUCURSAL  =  PAGL:SUCURSAL
                  LIB:RECIBO       = PAGL:IDRECIBO
                  LIB:IDPROVEEDOR  =  IDPROVEEDOR#
                  LIB:TIPO         =  'INGRESO'
                  LIB:IDTRANSACCION =  ING:IDINGRESO
                  LIB:FONDO = 0
                  !!! DISPARA STORE PROCEDURE
                  RANKING{PROP:SQL} = 'CALL SP_GEN_LIBDIARIO_ID'
                  NEXT(RANKING)
                  LIB:IDLIBDIARIO = RAN:C1
                  !!!!!!!!!!!
                  ACCESS:LIBDIARIO.INSERT()
               END
           
  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          IF PAGL:CUOTA > 0 THEN !! SE LE COBRO ALGO EN LA CUOTA
              !!!!!!
              RANKING{PROP:SQL} = 'DELETE FROM RANKING'
              ING:IDUSUARIO        =   PAGL:IDUSUARIO
              ING:IDSUBCUENTA      =   13 !! SUBCUENTA DE COBRO DE CUOTAS POR LIQUIDACION
              ING:OBSERVACION      =   'COBRO AUTOM. LIQUICACION : '&GLO:PAGO
              ING:MONTO            =   PAGL:CUOTA
              ING:FECHA            =   PAGL:FECHA
              ING:HORA             =   PAGL:HORA
              ING:MES              =   PAGL:MES
              ING:ANO              =   PAGL:ANO
              ING:PERIODO          =   PAGL:PERIODO
              ING:IDPROVEEDOR      =   IDPROVEEDOR#
              ING:SUCURSAL         =   GLO:SUCURSAL
              ING:IDRECIBO         =   GLO:RECIBO
              !!! CARGA
              RANKING{PROP:SQL} = 'CALL SP_GEN_INGRESOS_ID'
              NEXT(RANKING)
              ING:IDINGRESO = RAN:C1
              !MESSAGE(ING:IDINGRESO)
              ACCESS:INGRESOS.INSERT()
  
              ! LIBRO DIARIO COBRO CUOTA
              ! LIBRO DIARIO DEL PAGO DE LA LIQUIDACION
              CUE:IDCUENTA = 1!! PAGOS POR LIQUIDACION
              ACCESS:CUENTAS.TRYFETCH(CUE:PK_CUENTAS)
              IF CUE:TIPO = 'INGRESO' THEN
                  LIB:IDSUBCUENTA = 13
                  LIB:DEBE =  PAGL:CUOTA
                  LIB:HABER = 0
                  LIB:OBSERVACION = 'COBRO DE CUOTA EN LA  LIQUIDACION '&GLO:PAGO
                  LIB:FECHA = TODAY()
                  LIB:HORA = CLOCK()
                  LIB:MES       =  MONTH(TODAY())
                  LIB:ANO       =  YEAR(TODAY())
                  LIB:PERIODO   =  LIB:ANO&(FORMAT(LIB:MES,@N02))
                  LIB:SUCURSAL  =  GLO:SUCURSAL
                  LIB:RECIBO       = GLO:RECIBO
                  LIB:IDPROVEEDOR  =  IDPROVEEDOR#
                  LIB:TIPO         =  'INGRESO'
                  LIB:IDTRANSACCION =  ING:IDINGRESO
                  LIB:FONDO = 0
                  !!! DISPARA STORE PROCEDURE
                  RANKING{PROP:SQL} = 'CALL SP_GEN_LIBDIARIO_ID'
                  NEXT(RANKING)
                  LIB:IDLIBDIARIO = RAN:C1
                  !!!!!!!!!!!
                  ACCESS:LIBDIARIO.INSERT()
              END
          END !!!
  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  !!! CARGA INTERESES A CUENTA
        !  IF Glo:INTERES > 0 THEN 
        !      RANKING{PROP:SQL} = 'DELETE FROM RANKING'
        !      ING:IDUSUARIO        =   PAGL:IDUSUARIO
        !      ING:IDSUBCUENTA      =   13 !! SUBCUENTA DE COBRO DE CUOTAS POR LIQUIDACION
       !       ING:OBSERVACION      =   'NOTA DE XXXXXXXXXXXXXXXXXXXX: '&GLO:PAGO
      !        ING:MONTO            =   PAGL:CUOTA
     !         ING:FECHA            =   PAGL:FECHA
     !         ING:HORA             =   PAGL:HORA
     !         ING:MES              =   PAGL:MES
     !         ING:ANO              =   PAGL:ANO
     !         ING:PERIODO          =   PAGL:PERIODO
     !         ING:IDPROVEEDOR      =   IDPROVEEDOR#
     !         ING:SUCURSAL         =   GLO:SUCURSAL
     !          ING:IDRECIBO         =   GLO:RECIBO
    !          !!! CARGA
    !           RANKING{PROP:SQL} = 'CALL SP_GEN_INGRESOS_ID'
  !            NEXT(RANKING)
  !            ING:IDINGRESO = RAN:C1
            !  ACCESS:INGRESOS.INSERT()    
              
  !        END     
  
  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          IF PAGL:SEGURO > 0 THEN
              !! CARGO INGRESO  COMISION POR SEGURO
              RANKING{PROP:SQL} = 'DELETE FROM RANKING'
              ING:IDUSUARIO        =   PAGL:IDUSUARIO
              ING:IDSUBCUENTA      =   15 !! SUBCUENTA DE COBRO DE CUOTAS POR LIQUIDACION
              ING:OBSERVACION      =   'COBRO SEGURO AUTOM. LIQUICACION : '&GLO:PAGO
              ING:MONTO            =   PAGL:SEGURO
              ING:FECHA            =   PAGL:FECHA
              ING:HORA             =   PAGL:HORA
              ING:MES              =   PAGL:MES
              ING:ANO              =   PAGL:ANO
              ING:PERIODO          =   PAGL:PERIODO
              ING:IDPROVEEDOR      =   IDPROVEEDOR#
              ING:SUCURSAL         =   IDPROVEEDOR#!! en ingresos
              ING:IDRECIBO         =   PAGL:IDRECIBO
              !!! CARGA
              RANKING{PROP:SQL} = 'CALL SP_GEN_INGRESOS_ID'
              NEXT(RANKING)
              ING:IDINGRESO = RAN:C1
              !MESSAGE(ING:IDINGRESO)
              ACCESS:INGRESOS.INSERT()
  
              ! LIBRO DIARIO DEL COBRO SE SEGURO
              CUE:IDCUENTA = 11 !! PAGOS POR LIQUIDACION
              ACCESS:CUENTAS.TRYFETCH(CUE:PK_CUENTAS)
              IF CUE:TIPO = 'INGRESO' THEN
                  LIB:IDSUBCUENTA = 15
                  LIB:DEBE =  PAGL:SEGURO
                  LIB:HABER = 0
                  LIB:OBSERVACION = 'COBRO SE SEGURO EN LA  LIQUIDACION '&GLO:PAGO
                  LIB:FECHA = TODAY()
                  LIB:HORA = CLOCK()
                  LIB:MES       =  MONTH(TODAY())
                  LIB:ANO       =  YEAR(TODAY())
                  LIB:PERIODO   =  LIB:ANO&(FORMAT(LIB:MES,@N02))
                  LIB:SUCURSAL  =  IDPROVEEDOR#!! en ingresos
                  LIB:RECIBO       = PAGL:IDRECIBO
                  LIB:IDPROVEEDOR  =  IDPROVEEDOR#
                  LIB:TIPO         =  'INGRESO'
                  LIB:IDTRANSACCION =  ING:IDINGRESO
                  LIB:FONDO = 0
                  !!! DISPARA STORE PROCEDURE
                  RANKING{PROP:SQL} = 'CALL SP_GEN_LIBDIARIO_ID'
                  NEXT(RANKING)
                  LIB:IDLIBDIARIO = RAN:C1
                  !!!!!!!!!!!
                  ACCESS:LIBDIARIO.INSERT()
               END
          END !!!
  
  
  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  
          !! CARGO EGRESO POR PAGO LIQDUIACION
          RANKING{PROP:SQL} = 'DELETE FROM RANKING'
          GAS:IDUSUARIO        =  PAGL:IDUSUARIO
          GAS:IDSUBCUENTA      =  11 !! SUBCUENTA DE PAGO  POR LIQUIDACION
          GAS:OBSERVACION      =  'PAGO DE LIQUICACION : '&GLO:PAGO
          GAS:MONTO           =   PAGL:MONTO
          GAS:FECHA           =   PAGL:FECHA
          GAS:HORA           =    PAGL:HORA
          GAS:MES             =   PAGL:MES
          GAS:ANO            =    PAGL:ANO
          GAS:PERIODO          =  PAGL:PERIODO
          GAS:IDPROVEEDOR      =  IDPROVEEDOR#
          GAS:SUCURSAL         =  PAGL:SUCURSAL
          GAS:IDRECIBO        =   PAGL:IDRECIBO
          GAS:IDTIPO_COMPROBANTE = 1
          GAS:LETRA = 'X'
          !!! CARGA
          RANKING{PROP:SQL} = 'CALL SP_GEN_GASTOS_ID'
          NEXT(RANKING)
          GAS:IDGASTOS = RAN:C1
          !MESSAGE(ING:IDINGRESO)
          add(GASTOS)
          if errorcode() then message(error()).
  
          ! LIBRO DIARIO DEL PAGO DE LA LIQUIDACION
          CUE:IDCUENTA = 10 !! PAGOS POR LIQUIDACION
          ACCESS:CUENTAS.TRYFETCH(CUE:PK_CUENTAS)
          IF CUE:TIPO = 'EGRESO' THEN
              LIB:IDSUBCUENTA = 11
              LIB:DEBE = 0
              LIB:HABER = PAGL:MONTO
              LIB:OBSERVACION = 'PAGO AL SOCIO POR LIQUIDACION: '&GLO:PAGO
              LIB:FECHA = TODAY()
              LIB:HORA = CLOCK()
              LIB:MES       =  MONTH(TODAY())
              LIB:ANO       =  YEAR(TODAY())
              LIB:PERIODO   =  LIB:ANO&(FORMAT(LIB:MES,@N02))
              LIB:SUCURSAL  =  PAGL:SUCURSAL
              LIB:RECIBO       = PAGL:IDRECIBO
              LIB:IDPROVEEDOR  =  IDPROVEEDOR#
              LIB:TIPO         =  'EGRESO'
              LIB:IDTRANSACCION =  GAS:IDGASTOS
              FON:IDFONDO = SUB:IDFONDO
              ACCESS:FONDOS.TRYFETCH(FON:PK_FONDOS)
              LIB:FONDO = FON:MONTO 
              !!! DISPARA STORE PROCEDURE
              RANKING{PROP:SQL} = 'CALL SP_GEN_LIBDIARIO_ID'
              NEXT(RANKING)
              LIB:IDLIBDIARIO = RAN:C1
              !!!!!!!!!!!
              ACCESS:LIBDIARIO.INSERT()
          END
  
  
  
  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  !!! CANCELO FACTURAS
  !!! CANCELO TODO.. POR QUE TEORICAMENTE COBRO TODA LA DEUDA CON LA LIQUIDACION
          IF PAGL:CUOTA > 0 THEN
              GLO:DETALLE_RECIBO = ''
              XX" = ''
              cuenta# = PAGL:CANT_CUOTA
              FAC:IDSOCIO = PAGL:IDSOCIO
              SET(FAC:FK_FACTURA_SOCIO,FAC:FK_FACTURA_SOCIO)
              LOOP
                  IF ACCESS:FACTURA.NEXT() THEN BREAK.
                  IF FAC:IDSOCIO <> PAGL:IDSOCIO THEN BREAK.
                  IF FAC:ESTADO = ''AND CUENTA# > 0  THEN
                      FAC:ESTADO = 'PAGADO'
                      FAC:IDPAGO_LIQ = GLO:PAGO
                      MES" = FORMAT(FAC:MES,@N02)
                      ANO" = FORMAT(FAC:ANO,@N04)
                      LOC:CUOTA =  CLIP(MES")&'-'&CLIP(ANO")&','&LOC:CUOTA
                      PUT(FACTURA)
                      !MESSAGE(GLO:DETALLE_RECIBO)
                      !! DESCUENTA 1 A LA CANTIDAD DE CUOTAS EN PADRON
                      SOC:IDSOCIO = FAC:IDSOCIO
                      ACCESS:SOCIOS.TRyFETCH(SOC:PK_SOCIOS)
                      SOC:CANTIDAD = SOC:CANTIDAD - 1
                      PUT(SOCIOS)
                      CUENTA# = CUENTA# - 1
                      
                  END
              END
              !!! CARGA DESCRIPCION DE RECIBO PARA IMPRIMIR
              GLO:DETALLE_RECIBO = 'Pago de Cuota de Mat. : '&CLIP(LOC:CUOTA)&'| y'&CLIP(GLO:GTO_ADM)
              
          END
  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  !!! CANCELO FACTURA SEGURO
  !!!! CANCELO TODA LAS CUOTAS ADEUDADAS.
          IF PAGL:SEGURO > 0 THEN
              CUENTA# = PAGL:CANT_CUOTA_S
              SEG5:IDSOCIO = PAGL:IDSOCIO
              SET(SEG5:FK_SEGURO_FACTURA_SOCIO,SEG5:FK_SEGURO_FACTURA_SOCIO)
              LOOP
                  IF ACCESS:SEGURO_FACTURA.NEXT() THEN BREAK.
                  IF  SEG5:IDSOCIO <> PAGL:IDSOCIO THEN BREAK.
                  IF SEG5:ESTADO = '' AND CUENTA# > 0 THEN
                      SEG5:ESTADO = 'PAGADO'
                      SEG5:IDPAGO_LIQ = PAGL:IDPAGOS
                      MES" = FORMAT(SEG5:MES,@N02)
                      ANO" = FORMAT(SEG5:ANO,@N04)
                      SEGURO" =  CLIP(MES")&'-'&CLIP(ANO")&','&SEGURO"
                      PUT(SEGURO_FACTURA)
                      !! DESCUENTA 1 A LA CANTIDAD DE CUOTAS ADEUDADAS
                      SEG:IDSOCIO = SEG5:IDSOCIO
                      ACCESS:SEGURO.TRYFETCH(SEG:FK_SEGURO_SOCIOS)
                      SEG:CANTIDAD = SEG:CANTIDAD - 1
                      PUT(SEGURO)
                      CUENTA# = CUENTA# - 1
                  END
              END
             !!! CARGA DESCRIPCION DE RECIBO PARA IMPRIMIR
             GLO:CARGA_sTRING = 'Pago de seguro. : '&SEGURO"
           END
  
  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  !! CANCELO LAS LIQUIDACIONES
           Loop i# = 1 to records(Tags)
              get(Tags,i#)
              LIQ:IDLIQUIDACION = tags:Puntero
              GET(LIQUIDACION,LIQ:PK_LIQUIDACION)
              IF ERRORCODE() = 35 THEN
                  MESSAGE('NO ENCONTRO FACTURA')
              ELSE
                  LIQ:PAGADO = 'SI'
                  LIQ:IDPAGO_LIQUIDACION = GLO:PAGO
                  PUT(LIQUIDACION)
                
              end
          end
  
  
  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
         !!! PARA CERRAR
  
          PAGL:IDLIQUIDACION = GLO:IDSOLICITUD
          ACCESS:PAGOS_LIQUIDACION.TRYFETCH(PAGL:IDX_PAGOS_LIQUIDACION_PAGO)
          GLO:PAGO = PAGL:IDPAGOS
          NUMERO# = PAGL:SOCIOS_LIQUIDACION
          !!! CARGO EN LA LIQUIDACION EL Nº DE PAGO
          Loop i# = 1 to records(Tags)
              get(Tags,i#)
              LIQ:IDLIQUIDACION = tags:Puntero
              GET(LIQUIDACION,LIQ:PK_LIQUIDACION)
              IF ERRORCODE() = 35 THEN
                  MESSAGE('NO ENCONTRO FACTURA')
              ELSE
                  LIQ:IDPAGO_LIQUIDACION =  GLO:PAGO
                  LIQ:SOCIOS_LIQUIDACION = NUMERO#
                  PUT(LIQUIDACION)
              end
          end
          imprime" = 'SI'
          IF PAGL:CUOTA > 0 THEN
              Message('Inserte en la impresora un Recibo Legal','Descuento de Cuota por Liquidación',ICON:EXCLAMATION)
              IMPRIMIR_COBRO_CUOTA_LIQ
              imprime" = 'NO'
  
          end
          if imprime" = 'SI' then
              Message('Inserte en la impresora un Recibo Legal','Descuento de Cuota por Liquidación',ICON:EXCLAMATION)
              IMPRIMIR_COBRO_GTO_ADM
          end
          !!! SI HUBIERA DESCUENTO EN CUOTAS 
       !  IF GLO:INTERES > 0 THEN 
       !      Message('Inserte en la impresora un Recibo Legal','Descuento de Cuota por Liquidación',ICON:EXCLAMATION)
       !       IMPRIMIR_INTERES
       !   END 
          !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          IF PAGL:CANT_CUOTA_S > 0 THEN
              Message('Inserte en la impresora una Hoja en Blanco','Descuento de Cuota por Liquidación',ICON:EXCLAMATION)
              IMPRIMIR_COBRO_SEGURO_LIQ
          end
         
          Message('Inserte en la impresora una Hoja en Blanco','Descueto de Cuota por Liquidación',ICON:EXCLAMATION)
          imPRIMIR_PAGO_LIQUIDACION
          
          GLO:IDSOLICITUD = 0
          GLO:MONTO     = 0
          GLO:DETALLE_RECIBO = ''
      END
  END
  !!!LIBERO MEMORIA
  FREE(TAGS)
  
  
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeFieldEvent PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all field specific events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  CASE FIELD()
  OF ?List
    CASE EVENT()
    OF EVENT:PreAlertKey
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
      IF Keycode() = SpaceKey
         POST(EVENT:Accepted,?DASTAG)
         CYCLE
      END
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
    END
  END
  ReturnValue = PARENT.TakeFieldEvent()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeNewSelection PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all NewSelection events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  ReturnValue = PARENT.TakeNewSelection()
    CASE FIELD()
    OF ?List
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
      IF KEYCODE() = MouseLeft AND (?List{PROPLIST:MouseDownRow} > 0) AND (DASBRW::9:TAGFLAG = 0)
        CASE ?List{PROPLIST:MouseDownField}
      
          OF 1
            DASBRW::9:TAGMOUSE = 1
            POST(EVENT:Accepted,?DASTAG)
               ?List{PROPLIST:MouseDownField} = 2
            CYCLE
         END
      END
      DASBRW::9:TAGFLAG = 0
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


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window


BRW8.SetQueueRecord PROCEDURE

  CODE
  !--------------------------------------------------------------------------
  ! DAS_Tagging
  !--------------------------------------------------------------------------
     TAGS.PUNTERO = LIQ:IDLIQUIDACION
     GET(TAGS,TAGS.PUNTERO)
    IF ERRORCODE()
      T = ''
    ELSE
      T = '*'
    END
  !--------------------------------------------------------------------------
  ! DAS_Tagging
  !--------------------------------------------------------------------------
  PARENT.SetQueueRecord()      !FIX FOR CFW 4 (DASTAG)
  PARENT.SetQueueRecord


BRW8.TakeKey PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  !--------------------------------------------------------------------------
  ! DAS_Tagging
  !--------------------------------------------------------------------------
  IF Keycode() = SpaceKey
    RETURN ReturnValue
  END
  !--------------------------------------------------------------------------
  ! DAS_Tagging
  !--------------------------------------------------------------------------
  ReturnValue = PARENT.TakeKey()
  RETURN ReturnValue


BRW8.ValidateRecord PROCEDURE

ReturnValue          BYTE,AUTO

BRW8::RecordStatus   BYTE,AUTO
  CODE
  ReturnValue = PARENT.ValidateRecord()
  BRW8::RecordStatus=ReturnValue
  IF BRW8::RecordStatus NOT=Record:OK THEN RETURN BRW8::RecordStatus.
  !--------------------------------------------------------------------------
  ! DAS_Tagging
  !--------------------------------------------------------------------------
     TAGS.PUNTERO = LIQ:IDLIQUIDACION
     GET(TAGS,TAGS.PUNTERO)
    EXECUTE DASBRW::9:TAGDISPSTATUS
       IF ERRORCODE() THEN BRW8::RecordStatus = RECORD:FILTERED END
       IF ~ERRORCODE() THEN BRW8::RecordStatus = RECORD:FILTERED END
    END
  !--------------------------------------------------------------------------
  ! DAS_Tagging
  !--------------------------------------------------------------------------
  ReturnValue=BRW8::RecordStatus
  RETURN ReturnValue

