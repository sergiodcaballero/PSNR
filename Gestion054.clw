

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABQUERY.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('GESTION054.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION053.INC'),ONCE        !Req'd for module callout resolution
                     END



!!! <summary>
!!! Generated from procedure template - Window
!!! Administrador de SOCIOSXTRABAJO
!!! </summary>
ABMTRABAJOSXSOCIOS PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(SOCIOSXTRABAJO)
                       PROJECT(SOC2:IDSOCIOS)
                       PROJECT(SOC2:IDTRABAJO)
                       PROJECT(SOC2:FECHA)
                       JOIN(TRA:PK_TRABAJO,SOC2:IDTRABAJO)
                         PROJECT(TRA:DESCRIPCION)
                         PROJECT(TRA:DIRECCION)
                         PROJECT(TRA:TELEFONO)
                         PROJECT(TRA:IDTRABAJO)
                         PROJECT(TRA:IDLOCALIDAD)
                         JOIN(LOC:PK_LOCALIDAD,TRA:IDLOCALIDAD)
                           PROJECT(LOC:DESCRIPCION)
                           PROJECT(LOC:IDLOCALIDAD)
                         END
                       END
                       JOIN(SOC:PK_SOCIOS,SOC2:IDSOCIOS)
                         PROJECT(SOC:MATRICULA)
                         PROJECT(SOC:NOMBRE)
                         PROJECT(SOC:IDSOCIO)
                         PROJECT(SOC:IDTIPOTITULO)
                         JOIN(TIP6:PK_TIPO_TITULO,SOC:IDTIPOTITULO)
                           PROJECT(TIP6:DESCRIPCION)
                           PROJECT(TIP6:IDTIPOTITULO)
                         END
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
SOC2:IDSOCIOS          LIKE(SOC2:IDSOCIOS)            !List box control field - type derived from field
SOC:MATRICULA          LIKE(SOC:MATRICULA)            !List box control field - type derived from field
SOC:NOMBRE             LIKE(SOC:NOMBRE)               !List box control field - type derived from field
TIP6:DESCRIPCION       LIKE(TIP6:DESCRIPCION)         !List box control field - type derived from field
SOC2:IDTRABAJO         LIKE(SOC2:IDTRABAJO)           !List box control field - type derived from field
TRA:DESCRIPCION        LIKE(TRA:DESCRIPCION)          !List box control field - type derived from field
TRA:DIRECCION          LIKE(TRA:DIRECCION)            !List box control field - type derived from field
LOC:DESCRIPCION        LIKE(LOC:DESCRIPCION)          !List box control field - type derived from field
TRA:TELEFONO           LIKE(TRA:TELEFONO)             !List box control field - type derived from field
SOC2:FECHA             LIKE(SOC2:FECHA)               !List box control field - type derived from field
TRA:IDTRABAJO          LIKE(TRA:IDTRABAJO)            !Related join file key field - type derived from field
LOC:IDLOCALIDAD        LIKE(LOC:IDLOCALIDAD)          !Related join file key field - type derived from field
SOC:IDSOCIO            LIKE(SOC:IDSOCIO)              !Related join file key field - type derived from field
TIP6:IDTIPOTITULO      LIKE(TIP6:IDTIPOTITULO)        !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Administrador de SOCIOSXTRABAJO'),AT(,,529,315),FONT('MS Sans Serif',8,,FONT:regular), |
  RESIZE,CENTER,GRAY,IMM,MDI,HLP('ABMTRABAJOSXSOCIOS'),SYSTEM
                       LIST,AT(8,40,512,227),USE(?Browse:1),HVSCROLL,FORMAT('[43R(2)|M~IDSOCIOS~C(0)@n-7@48L|M' & |
  '~MATRICULA~C@s10@120L|M~NOMBRE~C@s30@200L|M~PROF~C@s50@](313)|M~SOCIOS~[35L(2)|M~IDT' & |
  'RB~C(0)@n-7@123L(2)|M~NOMBRE~C(0)@s30@127L(2)|M~DIRECCION~C(0)@s30@80R(2)|M~LOCALIDA' & |
  'D~C(0)@s20@80L|M~TELEFONO~C@s20@]|M~TRABAJO~80R(2)|M~FECHA~C(0)@d17@'),FROM(Queue:Browse:1), |
  IMM,MSG('Administrador de SOCIOSXTRABAJO')
                       BUTTON('&Ver'),AT(314,272,49,14),USE(?View:2),LEFT,ICON('v.ico'),CURSOR('mano.cur'),FLAT,MSG('Visualizar'), |
  TIP('Visualizar')
                       BUTTON('&Agregar'),AT(367,272,49,14),USE(?Insert:3),LEFT,ICON('a.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Agrega Registro'),TIP('Agrega Registro')
                       BUTTON('&Cambiar'),AT(420,272,49,14),USE(?Change:3),LEFT,ICON('c.ico'),CURSOR('mano.cur'), |
  DEFAULT,FLAT,MSG('Cambia Registro'),TIP('Cambia Registro')
                       BUTTON('&Borrar'),AT(473,272,49,14),USE(?Delete:3),LEFT,ICON('b.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Borra Registro'),TIP('Borra Registro')
                       BUTTON('E&xportar'),AT(6,300,52,15),USE(?EvoExportar),LEFT,ICON('export.ico'),FLAT
                       BUTTON('&Filtro'),AT(9,272,49,14),USE(?Query),LEFT,ICON('q.ico'),FLAT
                       SHEET,AT(4,4,524,289),USE(?CurrentTab)
                         TAB('ID'),USE(?Tab:2)
                         END
                         TAB('TRABAJO'),USE(?Tab:3)
                         END
                         TAB('SOCIOS'),USE(?Tab:4)
                           PROMPT('IDSOCIOS:'),AT(9,23),USE(?SOC2:IDSOCIOS:Prompt)
                           ENTRY(@n-14),AT(49,22,60,10),USE(SOC2:IDSOCIOS)
                         END
                       END
                       BUTTON('&Salir'),AT(480,300,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Salir'),TIP('Salir')
                     END

Loc::QHlist7 QUEUE,PRE(QHL7)
Id                         SHORT
Nombre                     STRING(100)
Longitud                   SHORT
Pict                       STRING(50)
Tot                 BYTE
                         END
QPar7 QUEUE,PRE(Q7)
FieldPar                 CSTRING(800)
                         END
QPar27 QUEUE,PRE(Qp27)
F2N                 CSTRING(300)
F2P                 CSTRING(100)
F2T                 BYTE
                         END
Loc::TituloListado7          STRING(100)
Loc::Titulo7          STRING(100)
SavPath7          STRING(2000)
Evo::Group7  GROUP,PRE()
Evo::Procedure7          STRING(100)
Evo::App7          STRING(100)
Evo::NroPage          LONG
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
QBE8                 QueryListClass                        ! QBE List Class. 
QBV8                 QueryListVisual                       ! QBE Visual Class
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::Sort1:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 2
BRW1::Sort2:Locator  FilterLocatorClass                    ! Conditional Locator - CHOICE(?CurrentTab) = 3
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

Ec::LoadI_7  SHORT
Gol_woI_7 WINDOW,AT(,,236,43),FONT('MS Sans Serif',8,,),CENTER,GRAY
       IMAGE('clock.ico'),AT(8,11),USE(?ImgoutI_7),CENTERED
       GROUP,AT(38,11,164,20),USE(?G::I_7),BOXED,BEVEL(-1)
         STRING('Preparando datos para Exportacion'),AT(63,11),USE(?StrOutI_7),TRN
         STRING('Aguarde un instante por Favor...'),AT(67,20),USE(?StrOut2I_7),TRN
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
PrintExBrowse7 ROUTINE

 OPEN(Gol_woI_7)
 DISPLAY()
 SETTARGET(QuickWindow)
 SETCURSOR(CURSOR:WAIT)
 EC::LoadI_7 = BRW1.FileLoaded
 IF Not  EC::LoadI_7
     BRW1.FileLoaded=True
     CLEAR(BRW1.LastItems,1)
     BRW1.ResetFromFile()
 END
 CLOSE(Gol_woI_7)
 SETCURSOR()
  Evo::App7          = 'Gestion'
  Evo::Procedure7          = GlobalErrors.GetProcedureName()& 7
 
  FREE(QPar7)
  Q7:FieldPar  = '1,2,3,4,5,6,7,8,9,10,'
  ADD(QPar7)  !!1
  Q7:FieldPar  = ';'
  ADD(QPar7)  !!2
  Q7:FieldPar  = 'Spanish'
  ADD(QPar7)  !!3
  Q7:FieldPar  = ''
  ADD(QPar7)  !!4
  Q7:FieldPar  = true
  ADD(QPar7)  !!5
  Q7:FieldPar  = ''
  ADD(QPar7)  !!6
  Q7:FieldPar  = true
  ADD(QPar7)  !!7
 !!!! Exportaciones
  Q7:FieldPar  = 'HTML|'
   Q7:FieldPar  = CLIP( Q7:FieldPar)&'EXCEL|'
   Q7:FieldPar  = CLIP( Q7:FieldPar)&'WORD|'
  Q7:FieldPar  = CLIP( Q7:FieldPar)&'ASCII|'
   Q7:FieldPar  = CLIP( Q7:FieldPar)&'XML|'
   Q7:FieldPar  = CLIP( Q7:FieldPar)&'PRT|'
  ADD(QPar7)  !!8
  Q7:FieldPar  = 'All'
  ADD(QPar7)   !.9.
  Q7:FieldPar  = ' 0'
  ADD(QPar7)   !.10
  Q7:FieldPar  = 0
  ADD(QPar7)   !.11
  Q7:FieldPar  = '1'
  ADD(QPar7)   !.12
 
  Q7:FieldPar  = ''
  ADD(QPar7)   !.13
 
  Q7:FieldPar  = ''
  ADD(QPar7)   !.14
 
  Q7:FieldPar  = ''
  ADD(QPar7)   !.15
 
   Q7:FieldPar  = '16'
  ADD(QPar7)   !.16
 
   Q7:FieldPar  = 1
  ADD(QPar7)   !.17
   Q7:FieldPar  = 2
  ADD(QPar7)   !.18
   Q7:FieldPar  = '2'
  ADD(QPar7)   !.19
   Q7:FieldPar  = 12
  ADD(QPar7)   !.20
 
   Q7:FieldPar  = 0 !Exporta excel sin borrar
  ADD(QPar7)   !.21
 
   Q7:FieldPar  = Evo::NroPage !Nro Pag. Desde Report (BExp)
  ADD(QPar7)   !.22
 
   CLEAR(Q7:FieldPar)
  ADD(QPar7)   ! 23 Caracteres Encoding para xml
 
  Q7:FieldPar  = '0'
  ADD(QPar7)   ! 24 Use Open Office
 
   Q7:FieldPar  = 'golmedo'
  ADD(QPar7) ! 25
 
 !---------------------------------------------------------------------------------------------
 !!Registration 
  Q7:FieldPar  = ' BrowseExport'
  ADD(QPar7)   ! 26  BrowseExport
  Q7:FieldPar  = ' '
  ADD(QPar7)   ! 27  
  Q7:FieldPar  = ' ' 
  ADD(QPar7)   ! 28  
  Q7:FieldPar  = 'BEXPORT' 
  ADD(QPar7)   ! 29 Gestion054.clw
 !!!!!
 
 
  FREE(QPar27)
       Qp27:F2N  = 'IDSOCIOS'
  Qp27:F2P  = '@n-7'
  Qp27:F2T  = '0'
  ADD(QPar27)
       Qp27:F2N  = 'MATRICULA'
  Qp27:F2P  = '@s10'
  Qp27:F2T  = '0'
  ADD(QPar27)
       Qp27:F2N  = 'NOMBRE'
  Qp27:F2P  = '@s30'
  Qp27:F2T  = '0'
  ADD(QPar27)
       Qp27:F2N  = 'PROF'
  Qp27:F2P  = '@s50'
  Qp27:F2T  = '0'
  ADD(QPar27)
       Qp27:F2N  = 'IDTRB'
  Qp27:F2P  = '@n-7'
  Qp27:F2T  = '0'
  ADD(QPar27)
       Qp27:F2N  = 'NOMBRE'
  Qp27:F2P  = '@s30'
  Qp27:F2T  = '0'
  ADD(QPar27)
       Qp27:F2N  = 'DIRECCION'
  Qp27:F2P  = '@s30'
  Qp27:F2T  = '0'
  ADD(QPar27)
       Qp27:F2N  = 'LOCALIDAD'
  Qp27:F2P  = '@s20'
  Qp27:F2T  = '0'
  ADD(QPar27)
       Qp27:F2N  = 'TELEFONO'
  Qp27:F2P  = '@s20'
  Qp27:F2T  = '0'
  ADD(QPar27)
       Qp27:F2N  = 'FECHA'
  Qp27:F2P  = '@d17'
  Qp27:F2T  = '0'
  ADD(QPar27)
  SysRec# = false
  FREE(Loc::QHlist7)
  LOOP
     SysRec# += 1
     IF ?Browse:1{PROPLIST:Exists,SysRec#} = 1
         GET(QPar27,SysRec#)
         QHL7:Id      = SysRec#
         QHL7:Nombre  = Qp27:F2N
         QHL7:Longitud= ?Browse:1{PropList:Width,SysRec#}  /2
         QHL7:Pict    = Qp27:F2P
         QHL7:Tot    = Qp27:F2T
         ADD(Loc::QHlist7)
      Else
        break
     END
  END
  Loc::Titulo7 ='LISTADO DE COLEGIADOS POR TRABAJO'
 
 SavPath7 = PATH()
  Exportar(Loc::QHlist7,BRW1.Q,QPar7,1,Loc::Titulo7,Evo::Group7)
 IF Not EC::LoadI_7 Then  BRW1.FileLoaded=false.
 SETPATH(SavPath7)
 !!!! Fin Routina Templates Clarion

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('ABMTRABAJOSXSOCIOS')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('TRA:IDTRABAJO',TRA:IDTRABAJO)                      ! Added by: BrowseBox(ABC)
  BIND('LOC:IDLOCALIDAD',LOC:IDLOCALIDAD)                  ! Added by: BrowseBox(ABC)
  BIND('SOC:IDSOCIO',SOC:IDSOCIO)                          ! Added by: BrowseBox(ABC)
  BIND('TIP6:IDTIPOTITULO',TIP6:IDTIPOTITULO)              ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:SOCIOSXTRABAJO.Open                               ! File SOCIOSXTRABAJO used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:SOCIOSXTRABAJO,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  QBE8.Init(QBV8, INIMgr,'ABMTRABAJOSXSOCIOS', GlobalErrors)
  QBE8.QkSupport = True
  QBE8.QkMenuIcon = 'QkQBE.ico'
  QBE8.QkIcon = 'QkLoad.ico'
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,SOC2:FK_SOCIOSXTRABAJO_TRABAJO)       ! Add the sort order for SOC2:FK_SOCIOSXTRABAJO_TRABAJO for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,SOC2:IDTRABAJO,,BRW1)          ! Initialize the browse locator using  using key: SOC2:FK_SOCIOSXTRABAJO_TRABAJO , SOC2:IDTRABAJO
  BRW1.AddSortOrder(,SOC2:FK_SOCIOSXTRABAJO_SOCIOS)        ! Add the sort order for SOC2:FK_SOCIOSXTRABAJO_SOCIOS for sort order 2
  BRW1.AddLocator(BRW1::Sort2:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort2:Locator.Init(?SOC2:IDSOCIOS,SOC2:IDSOCIOS,,BRW1) ! Initialize the browse locator using ?SOC2:IDSOCIOS using key: SOC2:FK_SOCIOSXTRABAJO_SOCIOS , SOC2:IDSOCIOS
  BRW1.AddSortOrder(,SOC2:PK_SOCIOSXTRABAJO)               ! Add the sort order for SOC2:PK_SOCIOSXTRABAJO for sort order 3
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 3
  BRW1::Sort0:Locator.Init(,SOC2:IDSOCIOS,,BRW1)           ! Initialize the browse locator using  using key: SOC2:PK_SOCIOSXTRABAJO , SOC2:IDSOCIOS
  BRW1.AddField(SOC2:IDSOCIOS,BRW1.Q.SOC2:IDSOCIOS)        ! Field SOC2:IDSOCIOS is a hot field or requires assignment from browse
  BRW1.AddField(SOC:MATRICULA,BRW1.Q.SOC:MATRICULA)        ! Field SOC:MATRICULA is a hot field or requires assignment from browse
  BRW1.AddField(SOC:NOMBRE,BRW1.Q.SOC:NOMBRE)              ! Field SOC:NOMBRE is a hot field or requires assignment from browse
  BRW1.AddField(TIP6:DESCRIPCION,BRW1.Q.TIP6:DESCRIPCION)  ! Field TIP6:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(SOC2:IDTRABAJO,BRW1.Q.SOC2:IDTRABAJO)      ! Field SOC2:IDTRABAJO is a hot field or requires assignment from browse
  BRW1.AddField(TRA:DESCRIPCION,BRW1.Q.TRA:DESCRIPCION)    ! Field TRA:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(TRA:DIRECCION,BRW1.Q.TRA:DIRECCION)        ! Field TRA:DIRECCION is a hot field or requires assignment from browse
  BRW1.AddField(LOC:DESCRIPCION,BRW1.Q.LOC:DESCRIPCION)    ! Field LOC:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(TRA:TELEFONO,BRW1.Q.TRA:TELEFONO)          ! Field TRA:TELEFONO is a hot field or requires assignment from browse
  BRW1.AddField(SOC2:FECHA,BRW1.Q.SOC2:FECHA)              ! Field SOC2:FECHA is a hot field or requires assignment from browse
  BRW1.AddField(TRA:IDTRABAJO,BRW1.Q.TRA:IDTRABAJO)        ! Field TRA:IDTRABAJO is a hot field or requires assignment from browse
  BRW1.AddField(LOC:IDLOCALIDAD,BRW1.Q.LOC:IDLOCALIDAD)    ! Field LOC:IDLOCALIDAD is a hot field or requires assignment from browse
  BRW1.AddField(SOC:IDSOCIO,BRW1.Q.SOC:IDSOCIO)            ! Field SOC:IDSOCIO is a hot field or requires assignment from browse
  BRW1.AddField(TIP6:IDTIPOTITULO,BRW1.Q.TIP6:IDTIPOTITULO) ! Field TIP6:IDTIPOTITULO is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('ABMTRABAJOSXSOCIOS',QuickWindow)           ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.QueryControl = ?Query
  BRW1.UpdateQuery(QBE8,1)
  BRW1.AskProcedure = 1                                    ! Will call: UpdateSOCIOSXTRABAJO
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
    Relate:SOCIOSXTRABAJO.Close
  END
  IF SELF.Opened
    INIMgr.Update('ABMTRABAJOSXSOCIOS',QuickWindow)        ! Save window data to non-volatile store
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
    UpdateSOCIOSXTRABAJO
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
    OF ?EvoExportar
      ThisWindow.Update()
       Do PrintExBrowse7
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


BRW1.SetAlerts PROCEDURE

  CODE
  SELF.EditViaPopup = False
  PARENT.SetAlerts


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

