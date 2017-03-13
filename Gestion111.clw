

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABUTIL.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('GESTION111.INC'),ONCE        !Local module procedure declarations
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
                           ENTRY(@s20),AT(62,70,191,10),USE(COF:PASSWORD_SMTP)
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
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
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

