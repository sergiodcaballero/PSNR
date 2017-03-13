

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('GESTION282.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION277.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION281.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the CONSULTORIO File
!!! </summary>
CERTIFICADO_CONSULTORIO_ADHERENTE PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(CONSULTRIO_ADHERENTE)
                       PROJECT(CON1:IDCONSUL_ADE)
                       PROJECT(CON1:IDCONSULTORIO)
                       PROJECT(CON1:IDSOCIO)
                       JOIN(SOC:PK_SOCIOS,CON1:IDSOCIO)
                         PROJECT(SOC:NOMBRE)
                         PROJECT(SOC:CANTIDAD)
                         PROJECT(SOC:IDSOCIO)
                       END
                       JOIN(CON2:PK_CONSULTORIO,CON1:IDCONSULTORIO)
                         PROJECT(CON2:ACTA)
                         PROJECT(CON2:IDLOCALIDAD)
                         PROJECT(CON2:DIRECCION)
                         PROJECT(CON2:FECHA)
                         PROJECT(CON2:LIBRO)
                         PROJECT(CON2:FOLIO)
                         PROJECT(CON2:ACTIVO)
                         PROJECT(CON2:IDCONSULTORIO)
                         JOIN(LOC:PK_LOCALIDAD,CON2:IDLOCALIDAD)
                           PROJECT(LOC:DESCRIPCION)
                           PROJECT(LOC:IDLOCALIDAD)
                         END
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
CON1:IDCONSUL_ADE      LIKE(CON1:IDCONSUL_ADE)        !List box control field - type derived from field
CON1:IDCONSULTORIO     LIKE(CON1:IDCONSULTORIO)       !List box control field - type derived from field
CON2:ACTA              LIKE(CON2:ACTA)                !List box control field - type derived from field
CON1:IDSOCIO           LIKE(CON1:IDSOCIO)             !List box control field - type derived from field
SOC:NOMBRE             LIKE(SOC:NOMBRE)               !List box control field - type derived from field
SOC:CANTIDAD           LIKE(SOC:CANTIDAD)             !List box control field - type derived from field
CON2:IDLOCALIDAD       LIKE(CON2:IDLOCALIDAD)         !List box control field - type derived from field
LOC:DESCRIPCION        LIKE(LOC:DESCRIPCION)          !List box control field - type derived from field
CON2:DIRECCION         LIKE(CON2:DIRECCION)           !List box control field - type derived from field
CON2:FECHA             LIKE(CON2:FECHA)               !List box control field - type derived from field
CON2:LIBRO             LIKE(CON2:LIBRO)               !List box control field - type derived from field
CON2:FOLIO             LIKE(CON2:FOLIO)               !List box control field - type derived from field
CON2:ACTIVO            LIKE(CON2:ACTIVO)              !List box control field - type derived from field
SOC:IDSOCIO            LIKE(SOC:IDSOCIO)              !Related join file key field - type derived from field
CON2:IDCONSULTORIO     LIKE(CON2:IDCONSULTORIO)       !Related join file key field - type derived from field
LOC:IDLOCALIDAD        LIKE(LOC:IDLOCALIDAD)          !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('CERTIFICADO CONSULTORIO ADHERENTE'),AT(,,421,198),FONT('MS Sans Serif',8,,FONT:regular), |
  RESIZE,CENTER,GRAY,IMM,MDI,HLP('Certidicacion_consultorio'),SYSTEM
                       LIST,AT(8,41,410,123),USE(?Browse:1),HVSCROLL,FORMAT('20L(2)|M~ID~C(0)@n-5@56L(2)|M~Nº ' & |
  'CONSULTORIO~@n-14@25L(2)|M~HAB~@s5@[27L(2)|M~IDSOC~C(0)@n-5@400L(2)|M~NOMBRE~C(0)@s1' & |
  '00@56L(2)|M~CANTIDAD~C(0)@n-14@]|M~COLEGIADO ADHERENTE~[31L(2)|M~IDLOC~L(0)@n-7@80L(' & |
  '2)|M~DESCRIP~C(0)@s20@](115)|M~LOCALIDAD~80L(2)|M~DIRECCION~@s50@49L(2)|M~FECHA~L(0)' & |
  '@d17@32L(2)|M~LIBRO~C(0)@n-7@31L(2)|M~FOLIO~C(0)@n-7@8L(2)|M~ACTIVO~C(0)@s2@'),FROM(Queue:Browse:1), |
  IMM,MSG('Administrador de CONSULTORIO'),VCR
                       BUTTON('Imprimir Certificado '),AT(7,178,123,14),USE(?Button4),LEFT,ICON(ICON:Print1),FLAT
                       SHEET,AT(3,4,417,167),USE(?CurrentTab)
                         TAB('CONSULTORIO'),USE(?Tab:1)
                           PROMPT('IDCONSULTORIO:'),AT(9,26),USE(?CON1:IDCONSULTORIO:Prompt)
                           ENTRY(@n-14),AT(78,25,60,10),USE(CON1:IDCONSULTORIO),RIGHT(1)
                         END
                         TAB('COLEGIADO'),USE(?Tab:2)
                           PROMPT('IDSOCIO:'),AT(7,25),USE(?CON1:IDSOCIO:Prompt)
                           ENTRY(@n-14),AT(57,24,60,10),USE(CON1:IDSOCIO),RIGHT(1)
                         END
                       END
                       BUTTON('&Salir'),AT(367,181,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Salir'),TIP('Salir')
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
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
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
  GlobalErrors.SetProcedureName('CERTIFICADO_CONSULTORIO_ADHERENTE')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('CON1:IDCONSUL_ADE',CON1:IDCONSUL_ADE)              ! Added by: BrowseBox(ABC)
  BIND('SOC:IDSOCIO',SOC:IDSOCIO)                          ! Added by: BrowseBox(ABC)
  BIND('CON2:IDCONSULTORIO',CON2:IDCONSULTORIO)            ! Added by: BrowseBox(ABC)
  BIND('LOC:IDLOCALIDAD',LOC:IDLOCALIDAD)                  ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:CONSULTRIO_ADHERENTE.Open                         ! File CONSULTRIO_ADHERENTE used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:CONSULTRIO_ADHERENTE,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,CON1:FK_CONSULTRIO_ADHERENTE_SOCIO)   ! Add the sort order for CON1:FK_CONSULTRIO_ADHERENTE_SOCIO for sort order 1
  BRW1.SetFilter('(SOC:CANTIDAD <<= 4  AND CON2:ACTIVO <<> ''NO'' )') ! Apply filter expression to browse
  BRW1.AddSortOrder(,CON1:PK_CONSULTRIO_ADHERENTE)         ! Add the sort order for CON1:PK_CONSULTRIO_ADHERENTE for sort order 2
  BRW1.SetFilter('(SOC:CANTIDAD <<= 4  AND CON2:ACTIVO <<> ''NO'')') ! Apply filter expression to browse
  BRW1.AddField(CON1:IDCONSUL_ADE,BRW1.Q.CON1:IDCONSUL_ADE) ! Field CON1:IDCONSUL_ADE is a hot field or requires assignment from browse
  BRW1.AddField(CON1:IDCONSULTORIO,BRW1.Q.CON1:IDCONSULTORIO) ! Field CON1:IDCONSULTORIO is a hot field or requires assignment from browse
  BRW1.AddField(CON2:ACTA,BRW1.Q.CON2:ACTA)                ! Field CON2:ACTA is a hot field or requires assignment from browse
  BRW1.AddField(CON1:IDSOCIO,BRW1.Q.CON1:IDSOCIO)          ! Field CON1:IDSOCIO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:NOMBRE,BRW1.Q.SOC:NOMBRE)              ! Field SOC:NOMBRE is a hot field or requires assignment from browse
  BRW1.AddField(SOC:CANTIDAD,BRW1.Q.SOC:CANTIDAD)          ! Field SOC:CANTIDAD is a hot field or requires assignment from browse
  BRW1.AddField(CON2:IDLOCALIDAD,BRW1.Q.CON2:IDLOCALIDAD)  ! Field CON2:IDLOCALIDAD is a hot field or requires assignment from browse
  BRW1.AddField(LOC:DESCRIPCION,BRW1.Q.LOC:DESCRIPCION)    ! Field LOC:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(CON2:DIRECCION,BRW1.Q.CON2:DIRECCION)      ! Field CON2:DIRECCION is a hot field or requires assignment from browse
  BRW1.AddField(CON2:FECHA,BRW1.Q.CON2:FECHA)              ! Field CON2:FECHA is a hot field or requires assignment from browse
  BRW1.AddField(CON2:LIBRO,BRW1.Q.CON2:LIBRO)              ! Field CON2:LIBRO is a hot field or requires assignment from browse
  BRW1.AddField(CON2:FOLIO,BRW1.Q.CON2:FOLIO)              ! Field CON2:FOLIO is a hot field or requires assignment from browse
  BRW1.AddField(CON2:ACTIVO,BRW1.Q.CON2:ACTIVO)            ! Field CON2:ACTIVO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:IDSOCIO,BRW1.Q.SOC:IDSOCIO)            ! Field SOC:IDSOCIO is a hot field or requires assignment from browse
  BRW1.AddField(CON2:IDCONSULTORIO,BRW1.Q.CON2:IDCONSULTORIO) ! Field CON2:IDCONSULTORIO is a hot field or requires assignment from browse
  BRW1.AddField(LOC:IDLOCALIDAD,BRW1.Q.LOC:IDLOCALIDAD)    ! Field LOC:IDLOCALIDAD is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('CERTIFICADO_CONSULTORIO_ADHERENTE',QuickWindow) ! Restore window settings from non-volatile store
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
    Relate:CONSULTRIO_ADHERENTE.Close
  END
  IF SELF.Opened
    INIMgr.Update('CERTIFICADO_CONSULTORIO_ADHERENTE',QuickWindow) ! Save window data to non-volatile store
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
    CASE ACCEPTED()
    OF ?Button4
      GLO:IDSOLICITUD = CON1:IDCONSUL_ADE
      GLO:IDSOCIO = CON1:IDSOCIO
      REPORTE_LARGO = 'CERTIFICADO DE HABILITACION DE CONSULTORIO ADHERENTE'
      
      !!! BUSCA EL CORREO ELECTRONICO PARA ENVIAR POR EMAIL
      GLO:IDSOCIO = CON1:IDSOCIO
      GET (SOCIOS,SOC:PK_SOCIOS)
      IF ERRORCODE()= 35 THEN
          MESSAGE('NO SE ENCONTRO EL SOCIO')
      ELSE
          GLO:EMAIL = SOC:EMAIL
      END
      
      CARGA_AUDITORIA()
      IMPRIMIR_CERTIFICADO_HABILITACION3()
    END
  ReturnValue = PARENT.TakeAccepted()
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
  ELSE
    RETURN SELF.SetSort(2,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

