

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABQUERY.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('GESTION332.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION013.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION330.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION333.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION334.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION337.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION340.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION341.INC'),ONCE        !Req'd for module callout resolution
                     END



!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the CONSULTORIO File
!!! </summary>
BrowseCONSULTORIO PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(CONSULTORIO)
                       PROJECT(CON2:IDCONSULTORIO)
                       PROJECT(CON2:IDSOCIO)
                       PROJECT(CON2:TELEFONO)
                       PROJECT(CON2:IDLOCALIDAD)
                       PROJECT(CON2:DIRECCION)
                       PROJECT(CON2:FECHA)
                       PROJECT(CON2:LIBRO)
                       PROJECT(CON2:FOLIO)
                       PROJECT(CON2:ACTA)
                       PROJECT(CON2:HABILITADO)
                       PROJECT(CON2:FECHA_HABILITACION)
                       PROJECT(CON2:FECHA_VTO)
                       PROJECT(CON2:ACTIVO)
                       PROJECT(CON2:IDINSPECTOR)
                       JOIN(INS:PK_INSPECTOR,CON2:IDINSPECTOR)
                         PROJECT(INS:IDINSPECTOR)
                       END
                       JOIN(LOC:PK_LOCALIDAD,CON2:IDLOCALIDAD)
                         PROJECT(LOC:DESCRIPCION)
                         PROJECT(LOC:IDLOCALIDAD)
                       END
                       JOIN(SOC:PK_SOCIOS,CON2:IDSOCIO)
                         PROJECT(SOC:MATRICULA)
                         PROJECT(SOC:NOMBRE)
                         PROJECT(SOC:IDSOCIO)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
CON2:IDCONSULTORIO     LIKE(CON2:IDCONSULTORIO)       !List box control field - type derived from field
CON2:IDCONSULTORIO_NormalFG LONG                      !Normal forground color
CON2:IDCONSULTORIO_NormalBG LONG                      !Normal background color
CON2:IDCONSULTORIO_SelectedFG LONG                    !Selected forground color
CON2:IDCONSULTORIO_SelectedBG LONG                    !Selected background color
CON2:IDCONSULTORIO_Icon LONG                          !Entry's icon ID
CON2:IDSOCIO           LIKE(CON2:IDSOCIO)             !List box control field - type derived from field
SOC:MATRICULA          LIKE(SOC:MATRICULA)            !List box control field - type derived from field
SOC:NOMBRE             LIKE(SOC:NOMBRE)               !List box control field - type derived from field
CON2:TELEFONO          LIKE(CON2:TELEFONO)            !List box control field - type derived from field
CON2:IDLOCALIDAD       LIKE(CON2:IDLOCALIDAD)         !List box control field - type derived from field
LOC:DESCRIPCION        LIKE(LOC:DESCRIPCION)          !List box control field - type derived from field
CON2:DIRECCION         LIKE(CON2:DIRECCION)           !List box control field - type derived from field
CON2:FECHA             LIKE(CON2:FECHA)               !List box control field - type derived from field
CON2:LIBRO             LIKE(CON2:LIBRO)               !List box control field - type derived from field
CON2:FOLIO             LIKE(CON2:FOLIO)               !List box control field - type derived from field
CON2:ACTA              LIKE(CON2:ACTA)                !List box control field - type derived from field
CON2:HABILITADO        LIKE(CON2:HABILITADO)          !List box control field - type derived from field
CON2:FECHA_HABILITACION LIKE(CON2:FECHA_HABILITACION) !List box control field - type derived from field
CON2:FECHA_VTO         LIKE(CON2:FECHA_VTO)           !List box control field - type derived from field
CON2:ACTIVO            LIKE(CON2:ACTIVO)              !List box control field - type derived from field
CON2:IDINSPECTOR       LIKE(CON2:IDINSPECTOR)         !Browse key field - type derived from field
INS:IDINSPECTOR        LIKE(INS:IDINSPECTOR)          !Related join file key field - type derived from field
LOC:IDLOCALIDAD        LIKE(LOC:IDLOCALIDAD)          !Related join file key field - type derived from field
SOC:IDSOCIO            LIKE(SOC:IDSOCIO)              !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW11::View:Browse   VIEW(CONSULTRIO_ADHERENTE)
                       PROJECT(CON1:IDCONSULTORIO)
                       PROJECT(CON1:IDSOCIO)
                       PROJECT(CON1:IDCONSUL_ADE)
                       JOIN(SOC:PK_SOCIOS,CON1:IDSOCIO)
                         PROJECT(SOC:MATRICULA)
                         PROJECT(SOC:NOMBRE)
                         PROJECT(SOC:IDSOCIO)
                       END
                     END
Queue:Browse         QUEUE                            !Queue declaration for browse/combo box using ?List
SOC:MATRICULA          LIKE(SOC:MATRICULA)            !List box control field - type derived from field
SOC:NOMBRE             LIKE(SOC:NOMBRE)               !List box control field - type derived from field
CON1:IDCONSULTORIO     LIKE(CON1:IDCONSULTORIO)       !List box control field - type derived from field
CON1:IDSOCIO           LIKE(CON1:IDSOCIO)             !List box control field - type derived from field
CON1:IDCONSUL_ADE      LIKE(CON1:IDCONSUL_ADE)        !Primary key field - type derived from field
SOC:IDSOCIO            LIKE(SOC:IDSOCIO)              !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('ABM CONSULTORIO'),AT(,,528,316),FONT('MS Sans Serif',8,,FONT:regular),RESIZE,CENTER, |
  GRAY,IMM,MDI,HLP('BrowseCONSULTORIO'),SYSTEM
                       LIST,AT(8,41,505,138),USE(?Browse:1),HVSCROLL,FORMAT('37L(2)|M*I~ID~C(0)@n-7@[35L(2)|M~' & |
  'IDSOCIO~C(0)@n-7@31L(2)|M~MAT~C(0)@n-7@120L(2)|M~NOMBRE~C(0)@s30@]|M~COLEGIADO~40L(2' & |
  ')|M~TELEFONO CONSUL~L(0)@S20@[33L(2)|M~IDLOC~C(0)@n-7@80R(2)|M~DEC LOC~C(0)@s20@80L(' & |
  '2)|M~DIRECCION~@s50@]|M~LOCALIDAD~80R(2)|M~FECHA~C(0)@d17@64R(2)|M~LIBRO~C(0)@n-14@6' & |
  '4R(2)|M~FOLIO~C(0)@n-14@80L(2)|M~ACTA~@s20@8L(2)|M~HABILITADO~@s2@40L(2)|M~FECHA HAB' & |
  'ILITACION~@d17@40L(2)|M~FECHA VTO~@d17@8L(2)|M~ACTIVO~L(0)@s2@'),FROM(Queue:Browse:1),IMM, |
  MSG('Administrador de CONSULTORIO'),VCR
                       BUTTON('&Elegir'),AT(255,191,49,14),USE(?Select:2),LEFT,ICON('e.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Seleccionar'),TIP('Seleccionar')
                       BUTTON('&Ver'),AT(308,191,49,14),USE(?View:3),LEFT,ICON('v.ico'),CURSOR('mano.cur'),FLAT,MSG('Visualizar'), |
  TIP('Visualizar')
                       BUTTON('&Agregar'),AT(361,191,49,14),USE(?Insert:4),LEFT,ICON('a.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Agrega Registro'),TIP('Agrega Registro')
                       BUTTON('&Cambiar'),AT(414,191,49,14),USE(?Change:4),LEFT,ICON('c.ico'),CURSOR('mano.cur'), |
  DEFAULT,FLAT,MSG('Cambia Registro'),TIP('Cambia Registro')
                       BUTTON('&Borrar'),AT(467,191,49,14),USE(?Delete:4),LEFT,ICON('b.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Borra Registro'),TIP('Borra Registro')
                       BUTTON('Imprimir Constancia'),AT(5,270,101,15),USE(?Button9),LEFT,ICON(ICON:Print1),FLAT
                       BUTTON('E&xportar'),AT(110,270,52,15),USE(?EvoExportar),LEFT,ICON('export.ico'),FLAT
                       BUTTON('&Filtro'),AT(9,192,49,14),USE(?Query),LEFT,ICON('qbe.ico'),FLAT
                       SHEET,AT(4,4,517,204),USE(?CurrentTab)
                         TAB('CONSULTORIO'),USE(?Tab:2)
                         END
                         TAB('INSPECTOR'),USE(?Tab:3)
                         END
                         TAB('LOCALIDAD'),USE(?Tab:4)
                         END
                         TAB('SOCIOS'),USE(?Tab:5)
                           PROMPT('IDSOCIO:'),AT(10,26),USE(?GLO:IDSOCIO:Prompt)
                           ENTRY(@n-14),AT(49,25,60,10),USE(GLO:IDSOCIO),REQ
                           BUTTON('...'),AT(115,23,12,12),USE(?CallLookup)
                         END
                       END
                       BUTTON('Cargar Detalle del Consultorio'),AT(166,270,127,14),USE(?BrowseCONSULTORIO_EQUIPO), |
  LEFT,ICON('COMPUTER.ICO'),FLAT,MSG('Ver Hijo'),TIP('Ver Hijio')
                       BUTTON('Imprimir Detalle  X Consultorio'),AT(297,270,118,14),USE(?Button8),LEFT,ICON(ICON:Print1), |
  FLAT
                       BUTTON('&Salir'),AT(477,295,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Salir'),TIP('Salir')
                       IMAGE('bullet_ball_red.ico'),AT(6,292),USE(?Image2)
                       PROMPT('--> Vencidos'),AT(32,295),USE(?Prompt1)
                       PROMPT('--> Próximos a Vencer'),AT(102,295),USE(?Prompt3)
                       PROMPT('--> Habilitados'),AT(204,295),USE(?Prompt2)
                       BUTTON('Carga Adherente'),AT(263,292,85,16),USE(?Button12),LEFT,ICON('SSEC_USR.ICO'),FLAT
                       IMAGE('bullet_ball_green.ico'),AT(176,290,23,20),USE(?Image1)
                       IMAGE('bullet_ball_yellow.ico'),AT(76,292),USE(?Image3)
                       BUTTON('Imprimir Consultorio C Adherente'),AT(427,264,89,26),USE(?BUTTON1),LEFT,ICON(ICON:Print), |
  FLAT
                       GROUP('Adherentes'),AT(4,212,513,48),USE(?GROUP1),BOXED
                         LIST,AT(8,221,505,31),USE(?List),RIGHT(1),VSCROLL,FORMAT('46L(2)|M~MATRICULA~L(0)@n-5@4' & |
  '00L(2)|M~NOMBRE~L(0)@s100@60L(2)|M~IDCONSULTORIO~L(1)@n-14@60L(2)|M~IDSOCIO~L(1)@n-14@'), |
  FROM(Queue:Browse),IMM,SCROLL
                       END
                     END

Loc::QHlist9 QUEUE,PRE(QHL9)
Id                         SHORT
Nombre                     STRING(100)
Longitud                   SHORT
Pict                       STRING(50)
Tot                 BYTE
                         END
QPar9 QUEUE,PRE(Q9)
FieldPar                 CSTRING(800)
                         END
QPar29 QUEUE,PRE(Qp29)
F2N                 CSTRING(300)
F2P                 CSTRING(100)
F2T                 BYTE
                         END
Loc::TituloListado9          STRING(100)
Loc::Titulo9          STRING(100)
SavPath9          STRING(2000)
Evo::Group9  GROUP,PRE()
Evo::Procedure9          STRING(100)
Evo::App9          STRING(100)
Evo::NroPage          LONG
   END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeSelected           PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
QBE8                 QueryListClass                        ! QBE List Class. 
QBV8                 QueryListVisual                       ! QBE Visual Class
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
SetQueueRecord         PROCEDURE(),DERIVED
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::Sort1:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 2
BRW1::Sort2:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 3
BRW1::Sort3:Locator  EntryLocatorClass                     ! Conditional Locator - CHOICE(?CurrentTab) = 4
BRW11                CLASS(BrowseClass)                    ! Browse using ?List
Q                      &Queue:Browse                  !Reference to browse queue
                     END

BRW11::Sort0:Locator StepLocatorClass                      ! Default Locator
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

Ec::LoadI_9  SHORT
Gol_woI_9 WINDOW,AT(,,236,43),FONT('MS Sans Serif',8,,),CENTER,GRAY
       IMAGE('clock.ico'),AT(8,11),USE(?ImgoutI_9),CENTERED
       GROUP,AT(38,11,164,20),USE(?G::I_9),BOXED,BEVEL(-1)
         STRING('Preparando datos para Exportacion'),AT(63,11),USE(?StrOutI_9),TRN
         STRING('Aguarde un instante por Favor...'),AT(67,20),USE(?StrOut2I_9),TRN
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
PrintExBrowse9 ROUTINE

 OPEN(Gol_woI_9)
 DISPLAY()
 SETTARGET(QuickWindow)
 SETCURSOR(CURSOR:WAIT)
 EC::LoadI_9 = BRW1.FileLoaded
 IF Not  EC::LoadI_9
     BRW1.FileLoaded=True
     CLEAR(BRW1.LastItems,1)
     BRW1.ResetFromFile()
 END
 CLOSE(Gol_woI_9)
 SETCURSOR()
  Evo::App9          = 'Gestion'
  Evo::Procedure9          = GlobalErrors.GetProcedureName()& 9
 
  FREE(QPar9)
  Q9:FieldPar  = '1,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,'
  ADD(QPar9)  !!1
  Q9:FieldPar  = ';'
  ADD(QPar9)  !!2
  Q9:FieldPar  = 'Spanish'
  ADD(QPar9)  !!3
  Q9:FieldPar  = ''
  ADD(QPar9)  !!4
  Q9:FieldPar  = true
  ADD(QPar9)  !!5
  Q9:FieldPar  = ''
  ADD(QPar9)  !!6
  Q9:FieldPar  = true
  ADD(QPar9)  !!7
 !!!! Exportaciones
  Q9:FieldPar  = 'HTML|'
   Q9:FieldPar  = CLIP( Q9:FieldPar)&'EXCEL|'
   Q9:FieldPar  = CLIP( Q9:FieldPar)&'WORD|'
  Q9:FieldPar  = CLIP( Q9:FieldPar)&'ASCII|'
   Q9:FieldPar  = CLIP( Q9:FieldPar)&'XML|'
   Q9:FieldPar  = CLIP( Q9:FieldPar)&'PRT|'
  ADD(QPar9)  !!8
  Q9:FieldPar  = 'All'
  ADD(QPar9)   !.9.
  Q9:FieldPar  = ' 0'
  ADD(QPar9)   !.10
  Q9:FieldPar  = 0
  ADD(QPar9)   !.11
  Q9:FieldPar  = '1'
  ADD(QPar9)   !.12
 
  Q9:FieldPar  = ''
  ADD(QPar9)   !.13
 
  Q9:FieldPar  = ''
  ADD(QPar9)   !.14
 
  Q9:FieldPar  = ''
  ADD(QPar9)   !.15
 
   Q9:FieldPar  = '16'
  ADD(QPar9)   !.16
 
   Q9:FieldPar  = 1
  ADD(QPar9)   !.17
   Q9:FieldPar  = 2
  ADD(QPar9)   !.18
   Q9:FieldPar  = '2'
  ADD(QPar9)   !.19
   Q9:FieldPar  = 12
  ADD(QPar9)   !.20
 
   Q9:FieldPar  = 0 !Exporta excel sin borrar
  ADD(QPar9)   !.21
 
   Q9:FieldPar  = Evo::NroPage !Nro Pag. Desde Report (BExp)
  ADD(QPar9)   !.22
 
   CLEAR(Q9:FieldPar)
  ADD(QPar9)   ! 23 Caracteres Encoding para xml
 
  Q9:FieldPar  = '0'
  ADD(QPar9)   ! 24 Use Open Office
 
   Q9:FieldPar  = 'golmedo'
  ADD(QPar9) ! 25
 
 !---------------------------------------------------------------------------------------------
 !!Registration 
  Q9:FieldPar  = ' BrowseExport'
  ADD(QPar9)   ! 26  BrowseExport
  Q9:FieldPar  = ' '
  ADD(QPar9)   ! 27  
  Q9:FieldPar  = ' ' 
  ADD(QPar9)   ! 28  
  Q9:FieldPar  = 'BEXPORT' 
  ADD(QPar9)   ! 29 Gestion332.clw
 !!!!!
 
 
  FREE(QPar29)
       Qp29:F2N  = 'ID'
  Qp29:F2P  = '@n-7'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'IDSOCIO'
  Qp29:F2P  = '@n-7'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'MAT'
  Qp29:F2P  = '@n-7'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'NOMBRE'
  Qp29:F2P  = '@s30'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'TELEFONO CONSUL'
  Qp29:F2P  = '@P####-#########P'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'IDLOC'
  Qp29:F2P  = '@n-7'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'DEC LOC'
  Qp29:F2P  = '@s20'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'DIRECCION'
  Qp29:F2P  = '@s50'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'FECHA'
  Qp29:F2P  = '@d17'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'LIBRO'
  Qp29:F2P  = '@n-14'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'FOLIO'
  Qp29:F2P  = '@n-14'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'ACTA'
  Qp29:F2P  = '@s20'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'HABILITADO'
  Qp29:F2P  = '@s2'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'FECHA HABILITACION'
  Qp29:F2P  = '@d17'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'FECHA VTO'
  Qp29:F2P  = '@d17'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'ACTIVO'
  Qp29:F2P  = '@s2'
  Qp29:F2T  = '0'
  ADD(QPar29)
  SysRec# = false
  FREE(Loc::QHlist9)
  LOOP
     SysRec# += 1
     IF ?Browse:1{PROPLIST:Exists,SysRec#} = 1
         GET(QPar29,SysRec#)
         QHL9:Id      = SysRec#
         QHL9:Nombre  = Qp29:F2N
         QHL9:Longitud= ?Browse:1{PropList:Width,SysRec#}  /2
         QHL9:Pict    = Qp29:F2P
         QHL9:Tot    = Qp29:F2T
         ADD(Loc::QHlist9)
      Else
        break
     END
  END
  Loc::Titulo9 ='Administrator the CONSULTORIO'
 
 SavPath9 = PATH()
  Exportar(Loc::QHlist9,BRW1.Q,QPar9,0,Loc::Titulo9,Evo::Group9)
 IF Not EC::LoadI_9 Then  BRW1.FileLoaded=false.
 SETPATH(SavPath9)
 !!!! Fin Routina Templates Clarion

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('BrowseCONSULTORIO')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('CON2:IDCONSULTORIO',CON2:IDCONSULTORIO)            ! Added by: BrowseBox(ABC)
  BIND('INS:IDINSPECTOR',INS:IDINSPECTOR)                  ! Added by: BrowseBox(ABC)
  BIND('LOC:IDLOCALIDAD',LOC:IDLOCALIDAD)                  ! Added by: BrowseBox(ABC)
  BIND('SOC:IDSOCIO',SOC:IDSOCIO)                          ! Added by: BrowseBox(ABC)
  BIND('CON1:IDCONSUL_ADE',CON1:IDCONSUL_ADE)              ! Added by: BrowseBox(ABC)
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
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:CONSULTORIO,SELF) ! Initialize the browse manager
  BRW11.Init(?List,Queue:Browse.ViewPosition,BRW11::View:Browse,Queue:Browse,Relate:CONSULTRIO_ADHERENTE,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  QBE8.Init(QBV8, INIMgr,'BrowseCONSULTORIO', GlobalErrors)
  QBE8.QkSupport = True
  QBE8.QkMenuIcon = 'QkQBE.ico'
  QBE8.QkIcon = 'QkLoad.ico'
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,CON2:FK_CONSULTORIO_INSPECTOR)        ! Add the sort order for CON2:FK_CONSULTORIO_INSPECTOR for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,CON2:IDINSPECTOR,,BRW1)        ! Initialize the browse locator using  using key: CON2:FK_CONSULTORIO_INSPECTOR , CON2:IDINSPECTOR
  BRW1.AddSortOrder(,CON2:FK_CONSULTORIO_LOCALIDAD)        ! Add the sort order for CON2:FK_CONSULTORIO_LOCALIDAD for sort order 2
  BRW1.AddLocator(BRW1::Sort2:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort2:Locator.Init(,CON2:IDLOCALIDAD,,BRW1)        ! Initialize the browse locator using  using key: CON2:FK_CONSULTORIO_LOCALIDAD , CON2:IDLOCALIDAD
  BRW1.AddSortOrder(,CON2:FK_CONSULTORIO_SOCIOS)           ! Add the sort order for CON2:FK_CONSULTORIO_SOCIOS for sort order 3
  BRW1.AddRange(CON2:IDSOCIO,GLO:IDSOCIO)                  ! Add single value range limit for sort order 3
  BRW1.AddLocator(BRW1::Sort3:Locator)                     ! Browse has a locator for sort order 3
  BRW1::Sort3:Locator.Init(,CON2:IDSOCIO,,BRW1)            ! Initialize the browse locator using  using key: CON2:FK_CONSULTORIO_SOCIOS , CON2:IDSOCIO
  BRW1.AddSortOrder(,CON2:PK_CONSULTORIO)                  ! Add the sort order for CON2:PK_CONSULTORIO for sort order 4
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 4
  BRW1::Sort0:Locator.Init(,CON2:IDCONSULTORIO,,BRW1)      ! Initialize the browse locator using  using key: CON2:PK_CONSULTORIO , CON2:IDCONSULTORIO
  ?Browse:1{PROP:IconList,1} = '~bullet_ball_green.ico'
  ?Browse:1{PROP:IconList,2} = '~bullet_ball_red.ico'
  ?Browse:1{PROP:IconList,3} = '~bullet_ball_yellow.ico'
  BRW1.AddField(CON2:IDCONSULTORIO,BRW1.Q.CON2:IDCONSULTORIO) ! Field CON2:IDCONSULTORIO is a hot field or requires assignment from browse
  BRW1.AddField(CON2:IDSOCIO,BRW1.Q.CON2:IDSOCIO)          ! Field CON2:IDSOCIO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:MATRICULA,BRW1.Q.SOC:MATRICULA)        ! Field SOC:MATRICULA is a hot field or requires assignment from browse
  BRW1.AddField(SOC:NOMBRE,BRW1.Q.SOC:NOMBRE)              ! Field SOC:NOMBRE is a hot field or requires assignment from browse
  BRW1.AddField(CON2:TELEFONO,BRW1.Q.CON2:TELEFONO)        ! Field CON2:TELEFONO is a hot field or requires assignment from browse
  BRW1.AddField(CON2:IDLOCALIDAD,BRW1.Q.CON2:IDLOCALIDAD)  ! Field CON2:IDLOCALIDAD is a hot field or requires assignment from browse
  BRW1.AddField(LOC:DESCRIPCION,BRW1.Q.LOC:DESCRIPCION)    ! Field LOC:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(CON2:DIRECCION,BRW1.Q.CON2:DIRECCION)      ! Field CON2:DIRECCION is a hot field or requires assignment from browse
  BRW1.AddField(CON2:FECHA,BRW1.Q.CON2:FECHA)              ! Field CON2:FECHA is a hot field or requires assignment from browse
  BRW1.AddField(CON2:LIBRO,BRW1.Q.CON2:LIBRO)              ! Field CON2:LIBRO is a hot field or requires assignment from browse
  BRW1.AddField(CON2:FOLIO,BRW1.Q.CON2:FOLIO)              ! Field CON2:FOLIO is a hot field or requires assignment from browse
  BRW1.AddField(CON2:ACTA,BRW1.Q.CON2:ACTA)                ! Field CON2:ACTA is a hot field or requires assignment from browse
  BRW1.AddField(CON2:HABILITADO,BRW1.Q.CON2:HABILITADO)    ! Field CON2:HABILITADO is a hot field or requires assignment from browse
  BRW1.AddField(CON2:FECHA_HABILITACION,BRW1.Q.CON2:FECHA_HABILITACION) ! Field CON2:FECHA_HABILITACION is a hot field or requires assignment from browse
  BRW1.AddField(CON2:FECHA_VTO,BRW1.Q.CON2:FECHA_VTO)      ! Field CON2:FECHA_VTO is a hot field or requires assignment from browse
  BRW1.AddField(CON2:ACTIVO,BRW1.Q.CON2:ACTIVO)            ! Field CON2:ACTIVO is a hot field or requires assignment from browse
  BRW1.AddField(CON2:IDINSPECTOR,BRW1.Q.CON2:IDINSPECTOR)  ! Field CON2:IDINSPECTOR is a hot field or requires assignment from browse
  BRW1.AddField(INS:IDINSPECTOR,BRW1.Q.INS:IDINSPECTOR)    ! Field INS:IDINSPECTOR is a hot field or requires assignment from browse
  BRW1.AddField(LOC:IDLOCALIDAD,BRW1.Q.LOC:IDLOCALIDAD)    ! Field LOC:IDLOCALIDAD is a hot field or requires assignment from browse
  BRW1.AddField(SOC:IDSOCIO,BRW1.Q.SOC:IDSOCIO)            ! Field SOC:IDSOCIO is a hot field or requires assignment from browse
  BRW11.Q &= Queue:Browse
  BRW11.RetainRow = 0
  BRW11.AddSortOrder(,CON1:FK_CONSULTRIO_ADHERENTE_CONSUL) ! Add the sort order for CON1:FK_CONSULTRIO_ADHERENTE_CONSUL for sort order 1
  BRW11.AddRange(CON1:IDCONSULTORIO,Relate:CONSULTRIO_ADHERENTE,Relate:CONSULTORIO) ! Add file relationship range limit for sort order 1
  BRW11.AddLocator(BRW11::Sort0:Locator)                   ! Browse has a locator for sort order 1
  BRW11::Sort0:Locator.Init(,CON1:IDCONSULTORIO,,BRW11)    ! Initialize the browse locator using  using key: CON1:FK_CONSULTRIO_ADHERENTE_CONSUL , CON1:IDCONSULTORIO
  BRW11.AddField(SOC:MATRICULA,BRW11.Q.SOC:MATRICULA)      ! Field SOC:MATRICULA is a hot field or requires assignment from browse
  BRW11.AddField(SOC:NOMBRE,BRW11.Q.SOC:NOMBRE)            ! Field SOC:NOMBRE is a hot field or requires assignment from browse
  BRW11.AddField(CON1:IDCONSULTORIO,BRW11.Q.CON1:IDCONSULTORIO) ! Field CON1:IDCONSULTORIO is a hot field or requires assignment from browse
  BRW11.AddField(CON1:IDSOCIO,BRW11.Q.CON1:IDSOCIO)        ! Field CON1:IDSOCIO is a hot field or requires assignment from browse
  BRW11.AddField(CON1:IDCONSUL_ADE,BRW11.Q.CON1:IDCONSUL_ADE) ! Field CON1:IDCONSUL_ADE is a hot field or requires assignment from browse
  BRW11.AddField(SOC:IDSOCIO,BRW11.Q.SOC:IDSOCIO)          ! Field SOC:IDSOCIO is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowseCONSULTORIO',QuickWindow)            ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.QueryControl = ?Query
  BRW1.UpdateQuery(QBE8,1)
  BRW1.AskProcedure = 3                                    ! Will call: UpdateCONSULTORIO
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW11.AddToolbarTarget(Toolbar)                          ! Browse accepts toolbar control
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
    Relate:CONSULTORIO.Close
    Relate:CONSULTRIO_ADHERENTE.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowseCONSULTORIO',QuickWindow)         ! Save window data to non-volatile store
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
    EXECUTE Number
      SelectSOCIOS
      SelectSOCIOS
      UpdateCONSULTORIO
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
    OF ?Button9
      GLO:IDSOLICITUD = CON2:IDCONSULTORIO
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Button9
      ThisWindow.Update()
      START(IMPRIMIR_CONSTANCIA, 25000)
      ThisWindow.Reset
    OF ?EvoExportar
      ThisWindow.Update()
       Do PrintExBrowse9
    OF ?GLO:IDSOCIO
      IF GLO:IDSOCIO OR ?GLO:IDSOCIO{PROP:Req}
        SOC:IDSOCIO = GLO:IDSOCIO
        IF Access:SOCIOS.TryFetch(SOC:PK_SOCIOS)
          IF SELF.Run(1,SelectRecord) = RequestCompleted
            GLO:IDSOCIO = SOC:IDSOCIO
          ELSE
            SELECT(?GLO:IDSOCIO)
            CYCLE
          END
        END
      END
      ThisWindow.Reset()
    OF ?CallLookup
      ThisWindow.Update()
      SOC:IDSOCIO = GLO:IDSOCIO
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        GLO:IDSOCIO = SOC:IDSOCIO
      END
      ThisWindow.Reset(1)
    OF ?BrowseCONSULTORIO_EQUIPO
      ThisWindow.Update()
      BrowseCONSULTORIO_EQUIPOByCON:FK_CONSULTORIO_EQUIPO_CONS()
      ThisWindow.Reset
    OF ?Button8
      ThisWindow.Update()
      START(REPORT_CONSULTORIOXEQUIPO, 25000)
      ThisWindow.Reset
    OF ?Button12
      ThisWindow.Update()
      Cargar_DERENTE()
      ThisWindow.Reset
    OF ?BUTTON1
      ThisWindow.Update()
      imprimir_consultorio_adherente(Brw1.view{PROP:Filter}, Brw1.view{PROP:Order})
      ThisWindow.Reset
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeSelected PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all Selected events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  ReturnValue = PARENT.TakeSelected()
    CASE FIELD()
    OF ?GLO:IDSOCIO
      SOC:IDSOCIO = GLO:IDSOCIO
      IF Access:SOCIOS.TryFetch(SOC:PK_SOCIOS)
        IF SELF.Run(1,SelectRecord) = RequestCompleted
          GLO:IDSOCIO = SOC:IDSOCIO
        END
      END
      ThisWindow.Reset()
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
  ELSIF CHOICE(?CurrentTab) = 3
    RETURN SELF.SetSort(2,Force)
  ELSIF CHOICE(?CurrentTab) = 4
    RETURN SELF.SetSort(3,Force)
  ELSE
    RETURN SELF.SetSort(4,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


BRW1.SetQueueRecord PROCEDURE

  CODE
  PARENT.SetQueueRecord
  
  IF (CON2:ACTIVO = 'NO')
    SELF.Q.CON2:IDCONSULTORIO_NormalFG = 255               ! Set conditional color values for CON2:IDCONSULTORIO
    SELF.Q.CON2:IDCONSULTORIO_NormalBG = 0
    SELF.Q.CON2:IDCONSULTORIO_SelectedFG = 0
    SELF.Q.CON2:IDCONSULTORIO_SelectedBG = 255
  ELSE
    SELF.Q.CON2:IDCONSULTORIO_NormalFG = -1                ! Set color values for CON2:IDCONSULTORIO
    SELF.Q.CON2:IDCONSULTORIO_NormalBG = -1
    SELF.Q.CON2:IDCONSULTORIO_SelectedFG = -1
    SELF.Q.CON2:IDCONSULTORIO_SelectedBG = -1
  END
  IF (CON2:FECHA_VTO < TODAY())
    SELF.Q.CON2:IDCONSULTORIO_Icon = 2                     ! Set icon from icon list
  ELSIF (CON2:FECHA_VTO < (TODAY() + 15))
    SELF.Q.CON2:IDCONSULTORIO_Icon = 3                     ! Set icon from icon list
  ELSIF (CON2:FECHA_VTO > (TODAY() + 15))
    SELF.Q.CON2:IDCONSULTORIO_Icon = 1                     ! Set icon from icon list
  ELSE
    SELF.Q.CON2:IDCONSULTORIO_Icon = 0
  END


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

