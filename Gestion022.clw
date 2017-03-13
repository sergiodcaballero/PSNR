

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABPRHTML.INC'),ONCE
   INCLUDE('ABPRPDF.INC'),ONCE
   INCLUDE('ABQUERY.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE
   INCLUDE('abprtext.inc'),ONCE
   INCLUDE('abprxml.inc'),ONCE
   INCLUDE('abrppsel.inc'),ONCE

                     MAP
                       INCLUDE('GESTION022.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION003.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION021.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION023.INC'),ONCE        !Req'd for module callout resolution
                     END



!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the INGRESOS_FACTURA file
!!! </summary>
FACTURA_ANUAL_IND PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(INGRESOS_FACTURA)
                       PROJECT(ING2:IDINGRESO_FAC)
                       PROJECT(ING2:IDSOCIO)
                       PROJECT(ING2:ANO)
                       PROJECT(ING2:MONTO)
                       PROJECT(ING2:FECHA)
                       JOIN(SOC:PK_SOCIOS,ING2:IDSOCIO)
                         PROJECT(SOC:NOMBRE)
                         PROJECT(SOC:IDSOCIO)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
ING2:IDINGRESO_FAC     LIKE(ING2:IDINGRESO_FAC)       !List box control field - type derived from field
ING2:IDSOCIO           LIKE(ING2:IDSOCIO)             !List box control field - type derived from field
SOC:NOMBRE             LIKE(SOC:NOMBRE)               !List box control field - type derived from field
ING2:ANO               LIKE(ING2:ANO)                 !List box control field - type derived from field
ING2:MONTO             LIKE(ING2:MONTO)               !List box control field - type derived from field
ING2:FECHA             LIKE(ING2:FECHA)               !List box control field - type derived from field
SOC:IDSOCIO            LIKE(SOC:IDSOCIO)              !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Browse the INGRESOS_FACTURA file'),AT(,,522,287),FONT('Microsoft Sans Serif',8,,FONT:regular, |
  CHARSET:DEFAULT),RESIZE,CENTER,GRAY,IMM,MDI,HLP('FACTURA_ANUAL_IND'),SYSTEM
                       LIST,AT(16,53,491,174),USE(?Browse:1),HVSCROLL,FORMAT('64L(2)|M~FAC~C(0)@n-7@[64R(2)|M~' & |
  'IDSOC~C(0)@n-7@400L(2)|M~NOMBRE~C(0)@s100@]|~SOCIO~30L(2)|M~ANO~C(0)@n-5@48D(20)|M~M' & |
  'ONTO~C(0)@n$-10.2@59L(2)|M~FECHA~C(0)@d17@'),FROM(Queue:Browse:1),IMM,MSG('Browsing t' & |
  'he INGRESOS_FACTURA file')
                       BUTTON('&View'),AT(351,231,49,14),USE(?View:2),LEFT,ICON('WAVIEW.ICO'),FLAT,MSG('View Record'), |
  TIP('View Record')
                       BUTTON('&Agregar'),AT(404,231,49,14),USE(?Insert:3),LEFT,ICON('WAINSERT.ICO'),FLAT,MSG('Insert a Record'), |
  TIP('Insert a Record')
                       BUTTON('&Modificar'),AT(457,231,49,14),USE(?Change:3),LEFT,ICON('WACHANGE.ICO'),DEFAULT,FLAT, |
  MSG('Change the Record'),TIP('Change the Record')
                       SHEET,AT(4,10,516,243),USE(?CurrentTab:1)
                         TAB('&FACTURA'),USE(?Tab:1)
                         END
                       END
                       BUTTON('&Cerrar'),AT(469,257,49,14),USE(?Close),LEFT,ICON('WACLOSE.ICO'),FLAT,MSG('Close Window'), |
  TIP('Close Window')
                       BUTTON('&Filtro'),AT(9,257,59,13),USE(?Query),LEFT,ICON('qbe.ico')
                       BUTTON('E&xportar'),AT(96,256,52,15),USE(?EvoExportar),LEFT,ICON('export.ico'),FLAT
                     END

Loc::QHlist12 QUEUE,PRE(QHL12)
Id                         SHORT
Nombre                     STRING(100)
Longitud                   SHORT
Pict                       STRING(50)
Tot                 BYTE
                         END
QPar12 QUEUE,PRE(Q12)
FieldPar                 CSTRING(800)
                         END
QPar212 QUEUE,PRE(Qp212)
F2N                 CSTRING(300)
F2P                 CSTRING(100)
F2T                 BYTE
                         END
Loc::TituloListado12          STRING(100)
Loc::Titulo12          STRING(100)
SavPath12          STRING(2000)
Evo::Group12  GROUP,PRE()
Evo::Procedure12          STRING(100)
Evo::App12          STRING(100)
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
QBE11                QueryFormClass                        ! QBE List Class. 
QBV11                QueryFormVisual                       ! QBE Visual Class
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
                     END

Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

Ec::LoadI_12  SHORT
Gol_woI_12 WINDOW,AT(,,236,43),FONT('MS Sans Serif',8,,),CENTER,GRAY
       IMAGE('clock.ico'),AT(8,11),USE(?ImgoutI_12),CENTERED
       GROUP,AT(38,11,164,20),USE(?G::I_12),BOXED,BEVEL(-1)
         STRING('Preparando datos para Exportacion'),AT(63,11),USE(?StrOutI_12),TRN
         STRING('Aguarde un instante por Favor...'),AT(67,20),USE(?StrOut2I_12),TRN
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
PrintExBrowse12 ROUTINE

 OPEN(Gol_woI_12)
 DISPLAY()
 SETTARGET(QuickWindow)
 SETCURSOR(CURSOR:WAIT)
 EC::LoadI_12 = BRW1.FileLoaded
 IF Not  EC::LoadI_12
     BRW1.FileLoaded=True
     CLEAR(BRW1.LastItems,1)
     BRW1.ResetFromFile()
 END
 CLOSE(Gol_woI_12)
 SETCURSOR()
  Evo::App12          = 'Gestion'
  Evo::Procedure12          = GlobalErrors.GetProcedureName()& 12
 
  FREE(QPar12)
  Q12:FieldPar  = '1,2,3,4,5,6,'
  ADD(QPar12)  !!1
  Q12:FieldPar  = ';'
  ADD(QPar12)  !!2
  Q12:FieldPar  = 'Spanish'
  ADD(QPar12)  !!3
  Q12:FieldPar  = ''
  ADD(QPar12)  !!4
  Q12:FieldPar  = true
  ADD(QPar12)  !!5
  Q12:FieldPar  = ''
  ADD(QPar12)  !!6
  Q12:FieldPar  = true
  ADD(QPar12)  !!7
 !!!! Exportaciones
  Q12:FieldPar  = 'HTML|'
   Q12:FieldPar  = CLIP( Q12:FieldPar)&'EXCEL|'
   Q12:FieldPar  = CLIP( Q12:FieldPar)&'WORD|'
  Q12:FieldPar  = CLIP( Q12:FieldPar)&'ASCII|'
   Q12:FieldPar  = CLIP( Q12:FieldPar)&'XML|'
   Q12:FieldPar  = CLIP( Q12:FieldPar)&'PRT|'
  ADD(QPar12)  !!8
  Q12:FieldPar  = 'All'
  ADD(QPar12)   !.9.
  Q12:FieldPar  = ' 0'
  ADD(QPar12)   !.10
  Q12:FieldPar  = 0
  ADD(QPar12)   !.11
  Q12:FieldPar  = '1'
  ADD(QPar12)   !.12
 
  Q12:FieldPar  = ''
  ADD(QPar12)   !.13
 
  Q12:FieldPar  = ''
  ADD(QPar12)   !.14
 
  Q12:FieldPar  = ''
  ADD(QPar12)   !.15
 
   Q12:FieldPar  = '16'
  ADD(QPar12)   !.16
 
   Q12:FieldPar  = 1
  ADD(QPar12)   !.17
   Q12:FieldPar  = 2
  ADD(QPar12)   !.18
   Q12:FieldPar  = '2'
  ADD(QPar12)   !.19
   Q12:FieldPar  = 12
  ADD(QPar12)   !.20
 
   Q12:FieldPar  = 0 !Exporta excel sin borrar
  ADD(QPar12)   !.21
 
   Q12:FieldPar  = Evo::NroPage !Nro Pag. Desde Report (BExp)
  ADD(QPar12)   !.22
 
   CLEAR(Q12:FieldPar)
  ADD(QPar12)   ! 23 Caracteres Encoding para xml
 
  Q12:FieldPar  = '0'
  ADD(QPar12)   ! 24 Use Open Office
 
   Q12:FieldPar  = 'golmedo'
  ADD(QPar12) ! 25
 
 !---------------------------------------------------------------------------------------------
 !!Registration 
  Q12:FieldPar  = ' BrowseExport'
  ADD(QPar12)   ! 26  BrowseExport
  Q12:FieldPar  = ' '
  ADD(QPar12)   ! 27  
  Q12:FieldPar  = ' ' 
  ADD(QPar12)   ! 28  
  Q12:FieldPar  = 'BEXPORT' 
  ADD(QPar12)   ! 29 Gestion022.clw
 !!!!!
 
 
  FREE(QPar212)
       Qp212:F2N  = 'FAC'
  Qp212:F2P  = '@n-7'
  Qp212:F2T  = '0'
  ADD(QPar212)
       Qp212:F2N  = 'IDSOC'
  Qp212:F2P  = '@n-7'
  Qp212:F2T  = '0'
  ADD(QPar212)
       Qp212:F2N  = 'NOMBRE'
  Qp212:F2P  = '@s100'
  Qp212:F2T  = '0'
  ADD(QPar212)
       Qp212:F2N  = 'ANO'
  Qp212:F2P  = '@n-5'
  Qp212:F2T  = '0'
  ADD(QPar212)
       Qp212:F2N  = 'MONTO'
  Qp212:F2P  = '@n$-10.2'
  Qp212:F2T  = '0'
  ADD(QPar212)
       Qp212:F2N  = 'FECHA'
  Qp212:F2P  = '@d17'
  Qp212:F2T  = '0'
  ADD(QPar212)
  SysRec# = false
  FREE(Loc::QHlist12)
  LOOP
     SysRec# += 1
     IF ?Browse:1{PROPLIST:Exists,SysRec#} = 1
         GET(QPar212,SysRec#)
         QHL12:Id      = SysRec#
         QHL12:Nombre  = Qp212:F2N
         QHL12:Longitud= ?Browse:1{PropList:Width,SysRec#}  /2
         QHL12:Pict    = Qp212:F2P
         QHL12:Tot    = Qp212:F2T
         ADD(Loc::QHlist12)
      Else
        break
     END
  END
  Loc::Titulo12 ='Administrator the INGRESOS_FACTURA'
 
 SavPath12 = PATH()
  Exportar(Loc::QHlist12,BRW1.Q,QPar12,0,Loc::Titulo12,Evo::Group12)
 IF Not EC::LoadI_12 Then  BRW1.FileLoaded=false.
 SETPATH(SavPath12)
 !!!! Fin Routina Templates Clarion

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('FACTURA_ANUAL_IND')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('ING2:IDINGRESO_FAC',ING2:IDINGRESO_FAC)            ! Added by: BrowseBox(ABC)
  BIND('SOC:IDSOCIO',SOC:IDSOCIO)                          ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:INGRESOS_FACTURA.Open                             ! File INGRESOS_FACTURA used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:INGRESOS_FACTURA,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  QBE11.Init(QBV11, INIMgr,'FACTURA_ANUAL_IND', GlobalErrors)
  QBE11.QkSupport = True
  QBE11.QkMenuIcon = 'QkQBE.ico'
  QBE11.QkIcon = 'QkLoad.ico'
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,ING2:PK_INGRESOS_FACTURA)             ! Add the sort order for ING2:PK_INGRESOS_FACTURA for sort order 1
  BRW1.AddField(ING2:IDINGRESO_FAC,BRW1.Q.ING2:IDINGRESO_FAC) ! Field ING2:IDINGRESO_FAC is a hot field or requires assignment from browse
  BRW1.AddField(ING2:IDSOCIO,BRW1.Q.ING2:IDSOCIO)          ! Field ING2:IDSOCIO is a hot field or requires assignment from browse
  BRW1.AddField(SOC:NOMBRE,BRW1.Q.SOC:NOMBRE)              ! Field SOC:NOMBRE is a hot field or requires assignment from browse
  BRW1.AddField(ING2:ANO,BRW1.Q.ING2:ANO)                  ! Field ING2:ANO is a hot field or requires assignment from browse
  BRW1.AddField(ING2:MONTO,BRW1.Q.ING2:MONTO)              ! Field ING2:MONTO is a hot field or requires assignment from browse
  BRW1.AddField(ING2:FECHA,BRW1.Q.ING2:FECHA)              ! Field ING2:FECHA is a hot field or requires assignment from browse
  BRW1.AddField(SOC:IDSOCIO,BRW1.Q.SOC:IDSOCIO)            ! Field SOC:IDSOCIO is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('FACTURA_ANUAL_IND',QuickWindow)            ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.QueryControl = ?Query
  BRW1.UpdateQuery(QBE11,1)
  BRW1.AskProcedure = 1                                    ! Will call: UpdateINGRESOS_FACTURA
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
    Relate:INGRESOS_FACTURA.Close
  END
  IF SELF.Opened
    INIMgr.Update('FACTURA_ANUAL_IND',QuickWindow)         ! Save window data to non-volatile store
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
    UpdateINGRESOS_FACTURA
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
       Do PrintExBrowse12
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
  END
  SELF.ViewControl = ?View:2                               ! Setup the control used to initiate view only mode


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Report
!!! Recibo de Pago 
!!! </summary>
IMPRIMIR_PAGO_CURSO PROCEDURE 

Progress:Thermometer BYTE                                  ! 
L:NroReg             LONG                                  ! 
LOC:LETRAS           STRING(100)                           ! 
Process:View         VIEW(INGRESOS)
                       PROJECT(ING:FECHA)
                       PROJECT(ING:IDINGRESO)
                       PROJECT(ING:IDRECIBO)
                       PROJECT(ING:MONTO)
                       PROJECT(ING:IDPROVEEDOR)
                       JOIN(PRO2:PK_PROVEEDOR,ING:IDPROVEEDOR)
                         PROJECT(PRO2:CUIT)
                         PROJECT(PRO2:DESCRIPCION)
                         PROJECT(PRO2:DIRECCION)
                       END
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

Report               REPORT,AT(16,5,182,278),PRE(RPT),PAPER(PAPER:A4),FONT('Arial',9,COLOR:Black,FONT:bold,CHARSET:ANSI), |
  MM
detail                 DETAIL,AT(,,,279),USE(?unnamed:4),FONT('Arial',10,,FONT:regular,CHARSET:ANSI)
                         STRING('Fecha:'),AT(124,24),USE(?String22),FONT(,12),TRN
                         STRING(@d17),AT(138,24),USE(ING:FECHA),FONT(,12),RIGHT(1)
                         STRING('Señor/es:'),AT(1,44),USE(?String14),TRN
                         STRING('C.U.I.T.:'),AT(137,52),USE(?String9),TRN
                         STRING(@P##-########-#P),AT(152,52),USE(PRO2:CUIT)
                         STRING(@s50),AT(23,44,94,6),USE(PRO2:DESCRIPCION)
                         STRING('La suma de:'),AT(1,63),USE(?String17),TRN
                         STRING(@n$-13.2),AT(22,63),USE(ING:MONTO)
                         STRING('Domicilio:'),AT(1,52),USE(?String16),TRN
                         STRING(@s50),AT(24,52,96,6),USE(PRO2:DIRECCION)
                         STRING('--'),AT(44,63),USE(?String34),TRN
                         STRING('En concepto de :'),AT(1,76),USE(?String18),TRN
                         TEXT,AT(30,77,143,21),USE(REPORTE_LARGO),BOXED
                         STRING(@s100),AT(49,63,127,6),USE(LOC:LETRAS),TRN
                         STRING('Aclaración:.{86}'),AT(73,126),USE(?String21),TRN
                         STRING('Fecha:'),AT(120,161),USE(?String37),FONT(,12),TRN
                         STRING(@d17),AT(134,161),USE(ING:FECHA,,?ING:FECHA:2),FONT(,12)
                         STRING('Señor/es:'),AT(1,182),USE(?String26),TRN
                         STRING(@s50),AT(20,182,115,6),USE(PRO2:DESCRIPCION,,?PRO2:DESCRIPCION:2)
                         STRING('Domicilio:'),AT(1,190),USE(?String27),TRN
                         STRING(@s50),AT(23,190,88,6),USE(PRO2:DIRECCION,,?PRO2:DIRECCION:2)
                         STRING('C.U.I.T:'),AT(125,190),USE(?String28),TRN
                         STRING(@P##-########-#P),AT(137,190),USE(PRO2:CUIT,,?PRO2:CUIT:2)
                         STRING('--'),AT(45,213),USE(?String35),TRN
                         STRING('La suma de: '),AT(1,213),USE(?String29),TRN
                         STRING(@n-13.2),AT(25,213),USE(ING:MONTO,,?ING:MONTO:3),FONT(,,,FONT:bold),LEFT(1)
                         STRING(@s100),AT(51,213,117,6),USE(LOC:LETRAS,,?LOC:LETRAS:2)
                         STRING('En concepto de:'),AT(1,228),USE(?String30),TRN
                         TEXT,AT(28,230,143,21),USE(REPORTE_LARGO,,?REPORTE_LARGO:2),BOXED
                         STRING('SON $:'),AT(6,260),USE(?String25),FONT(,12),TRN
                         STRING(@n-13.2),AT(21,260),USE(ING:MONTO,,?ING:MONTO:4),FONT(,12,,FONT:bold),LEFT(1)
                         STRING('Firma:.{92}'),AT(74,256),USE(?String23),TRN
                         STRING('Aclaración:.{86}'),AT(73,265),USE(?String24),TRN
                         STRING('Res. Carg. '),AT(1,269),USE(?String36),FONT(,8),TRN
                         STRING(@n-14),AT(15,269),USE(ING:IDRECIBO),FONT(,8),TRN
                         STRING('Firma:.{92}'),AT(74,117),USE(?String20),TRN
                         STRING('SON $:'),AT(1,120),USE(?String19),FONT(,12),TRN
                         STRING(@n$-13.2),AT(17,120),USE(ING:MONTO,,?ING:MONTO:2),FONT(,14,,FONT:bold)
                       END
                       FORM,AT(16,5,182,278),USE(?unnamed:3)
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
Previewer            PrintPreviewClass                     ! Print Previewer
TargetSelector       ReportTargetSelectorClass             ! Report Target Selector
XMLReporter          CLASS(XMLReportGenerator)             ! XML
Setup                  PROCEDURE(),DERIVED
                     END

HTMLReporter         CLASS(HTMLReportGenerator)            ! HTML
SetUp                  PROCEDURE(),DERIVED
                     END

PDFReporter          CLASS(PDFReportGenerator)             ! PDF
SetUp                  PROCEDURE(),DERIVED
                     END

TXTReporter          CLASS(TextReportGenerator)            ! TXT
Setup                  PROCEDURE(),DERIVED
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
  GlobalErrors.SetProcedureName('IMPRIMIR_PAGO_CURSO')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:INGRESOS.Open                                     ! File INGRESOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('IMPRIMIR_PAGO_CURSO',ProgressWindow)       ! Restore window settings from non-volatile store
  TargetSelector.AddItem(XMLReporter.IReportGenerator)
  TargetSelector.AddItem(HTMLReporter.IReportGenerator)
  TargetSelector.AddItem(PDFReporter.IReportGenerator)
  TargetSelector.AddItem(TXTReporter.IReportGenerator)
  SELF.AddItem(TargetSelector)
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisReport.Init(Process:View, Relate:INGRESOS, ?Progress:PctText, Progress:Thermometer, ProgressMgr, ING:IDINGRESO)
  ThisReport.AddSortOrder(ING:PK_INGRESOS)
  ThisReport.AddRange(ING:IDINGRESO,)
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:INGRESOS.SetQuickScan(1,Propagate:OneMany)
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
    Relate:INGRESOS.Close
  END
  IF SELF.Opened
    INIMgr.Update('IMPRIMIR_PAGO_CURSO',ProgressWindow)    ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.OpenReport PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  SYSTEM{PROP:PrintMode} = 3
  ReturnValue = PARENT.OpenReport()
  IF ReturnValue = Level:Benign
    SELF.Report{PROPPRINT:Extend}=True
  END
  RETURN ReturnValue


ThisWindow.SetStaticControlsAttributes PROCEDURE

  CODE
  PARENT.SetStaticControlsAttributes
  !XML STATIC
  SELF.Attribute.Set(?String22,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String22,RepGen:XML,TargetAttr:TagName,'String22')
  SELF.Attribute.Set(?String22,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?ING:FECHA,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ING:FECHA,RepGen:XML,TargetAttr:TagName,'ING:FECHA')
  SELF.Attribute.Set(?ING:FECHA,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String14,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String14,RepGen:XML,TargetAttr:TagName,'String14')
  SELF.Attribute.Set(?String14,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String9,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String9,RepGen:XML,TargetAttr:TagName,'String9')
  SELF.Attribute.Set(?String9,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PRO2:CUIT,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PRO2:CUIT,RepGen:XML,TargetAttr:TagName,'PRO2:CUIT')
  SELF.Attribute.Set(?PRO2:CUIT,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PRO2:DESCRIPCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PRO2:DESCRIPCION,RepGen:XML,TargetAttr:TagName,'PRO2:DESCRIPCION')
  SELF.Attribute.Set(?PRO2:DESCRIPCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String17,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String17,RepGen:XML,TargetAttr:TagName,'String17')
  SELF.Attribute.Set(?String17,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?ING:MONTO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ING:MONTO,RepGen:XML,TargetAttr:TagName,'ING:MONTO')
  SELF.Attribute.Set(?ING:MONTO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String16,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String16,RepGen:XML,TargetAttr:TagName,'String16')
  SELF.Attribute.Set(?String16,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PRO2:DIRECCION,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PRO2:DIRECCION,RepGen:XML,TargetAttr:TagName,'PRO2:DIRECCION')
  SELF.Attribute.Set(?PRO2:DIRECCION,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String34,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String34,RepGen:XML,TargetAttr:TagName,'String34')
  SELF.Attribute.Set(?String34,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String18,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String18,RepGen:XML,TargetAttr:TagName,'String18')
  SELF.Attribute.Set(?String18,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?REPORTE_LARGO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?REPORTE_LARGO,RepGen:XML,TargetAttr:TagName,'REPORTE_LARGO')
  SELF.Attribute.Set(?REPORTE_LARGO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?LOC:LETRAS,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?LOC:LETRAS,RepGen:XML,TargetAttr:TagName,'LOC:LETRAS')
  SELF.Attribute.Set(?LOC:LETRAS,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String21,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String21,RepGen:XML,TargetAttr:TagName,'String21')
  SELF.Attribute.Set(?String21,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String37,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String37,RepGen:XML,TargetAttr:TagName,'String37')
  SELF.Attribute.Set(?String37,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?ING:FECHA:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ING:FECHA:2,RepGen:XML,TargetAttr:TagName,'ING:FECHA:2')
  SELF.Attribute.Set(?ING:FECHA:2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String26,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String26,RepGen:XML,TargetAttr:TagName,'String26')
  SELF.Attribute.Set(?String26,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PRO2:DESCRIPCION:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PRO2:DESCRIPCION:2,RepGen:XML,TargetAttr:TagName,'PRO2:DESCRIPCION:2')
  SELF.Attribute.Set(?PRO2:DESCRIPCION:2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String27,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String27,RepGen:XML,TargetAttr:TagName,'String27')
  SELF.Attribute.Set(?String27,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PRO2:DIRECCION:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PRO2:DIRECCION:2,RepGen:XML,TargetAttr:TagName,'PRO2:DIRECCION:2')
  SELF.Attribute.Set(?PRO2:DIRECCION:2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String28,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String28,RepGen:XML,TargetAttr:TagName,'String28')
  SELF.Attribute.Set(?String28,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?PRO2:CUIT:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?PRO2:CUIT:2,RepGen:XML,TargetAttr:TagName,'PRO2:CUIT:2')
  SELF.Attribute.Set(?PRO2:CUIT:2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String35,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String35,RepGen:XML,TargetAttr:TagName,'String35')
  SELF.Attribute.Set(?String35,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String29,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String29,RepGen:XML,TargetAttr:TagName,'String29')
  SELF.Attribute.Set(?String29,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?ING:MONTO:3,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ING:MONTO:3,RepGen:XML,TargetAttr:TagName,'ING:MONTO:3')
  SELF.Attribute.Set(?ING:MONTO:3,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?LOC:LETRAS:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?LOC:LETRAS:2,RepGen:XML,TargetAttr:TagName,'LOC:LETRAS:2')
  SELF.Attribute.Set(?LOC:LETRAS:2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String30,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String30,RepGen:XML,TargetAttr:TagName,'String30')
  SELF.Attribute.Set(?String30,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?REPORTE_LARGO:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?REPORTE_LARGO:2,RepGen:XML,TargetAttr:TagName,'REPORTE_LARGO:2')
  SELF.Attribute.Set(?REPORTE_LARGO:2,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String25,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String25,RepGen:XML,TargetAttr:TagName,'String25')
  SELF.Attribute.Set(?String25,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?ING:MONTO:4,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ING:MONTO:4,RepGen:XML,TargetAttr:TagName,'ING:MONTO:4')
  SELF.Attribute.Set(?ING:MONTO:4,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String23,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String23,RepGen:XML,TargetAttr:TagName,'String23')
  SELF.Attribute.Set(?String23,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String24,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String24,RepGen:XML,TargetAttr:TagName,'String24')
  SELF.Attribute.Set(?String24,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String36,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String36,RepGen:XML,TargetAttr:TagName,'String36')
  SELF.Attribute.Set(?String36,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?ING:IDRECIBO,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ING:IDRECIBO,RepGen:XML,TargetAttr:TagName,'ING:IDRECIBO')
  SELF.Attribute.Set(?ING:IDRECIBO,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String20,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String20,RepGen:XML,TargetAttr:TagName,'String20')
  SELF.Attribute.Set(?String20,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?String19,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?String19,RepGen:XML,TargetAttr:TagName,'String19')
  SELF.Attribute.Set(?String19,RepGen:XML,TargetAttr:TagValueFromText,True)
  SELF.Attribute.Set(?ING:MONTO:2,RepGen:XML,TargetAttr:TagType,TagType:Tag)
  SELF.Attribute.Set(?ING:MONTO:2,RepGen:XML,TargetAttr:TagName,'ING:MONTO:2')
  SELF.Attribute.Set(?ING:MONTO:2,RepGen:XML,TargetAttr:TagValueFromText,True)


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  LOC:LETRAS =PKSNumTexto(ING:MONTO)
  ReturnValue = PARENT.TakeRecord()
  PRINT(RPT:detail)
  RETURN ReturnValue


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


PDFReporter.SetUp PROCEDURE

  CODE
  PARENT.SetUp
  SELF.SetFileName('')
  SELF.SetDocumentInfo('CW Report','Gestion','IMPRIMIR_PAGO','IMPRIMIR_PAGO','','')
  SELF.SetPagesAsParentBookmark(False)
  SELF.SetScanCopyMode(False)
  SELF.CompressText   = True
  SELF.CompressImages = True


TXTReporter.Setup PROCEDURE

  CODE
  PARENT.Setup
  SELF.SetFileName('')
  SELF.SetPagesAsDifferentFile(False)
  SELF.SetMargin(0,0,0,0)
  SELF.SetPageLen(0)
  SELF.SetCheckBoxString('[X]','[_]')
  SELF.SetRadioButtonString('(*)','(_)')
  SELF.SetLineString('|','|','-','-','/','\','\','/')
  SELF.SetTextFillString(' ',CHR(176),CHR(177),CHR(178),CHR(219))
  SELF.SetOmitGraph(False)

!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the CURSO_INSCRIPCION File
!!! </summary>
CURSOS_PAGOS PROCEDURE 

!--------------------------------------------------------------------------
! Tagging Data
!--------------------------------------------------------------------------
DASBRW::13:TAGFLAG         BYTE(0)
DASBRW::13:TAGMOUSE        BYTE(0)
DASBRW::13:TAGDISPSTATUS   BYTE(0)
DASBRW::13:QUEUE          QUEUE
PUNTERO                       LIKE(PUNTERO)
PUNTERO2                      LIKE(PUNTERO2)
PUNTERO3                      LIKE(PUNTERO3)
PUNTERO4                      LIKE(PUNTERO4)
                          END
!--------------------------------------------------------------------------
! Tagging Data
!--------------------------------------------------------------------------
CurrentTab           STRING(80)                            ! 
LOC:CANTIDAD         LONG                                  ! 
T                    STRING(1)                             ! 
LOC:AFECTADA         CSTRING(3)                            ! 
BRW1::View:Browse    VIEW(CURSO_INSCRIPCION)
                       PROJECT(CURI:IDINSCRIPCION)
                       PROJECT(CURI:MONTO_TOTAL)
                       PROJECT(CURI:PAGADO_TOTAL)
                       PROJECT(CURI:FECHA)
                       PROJECT(CURI:TERMINADO)
                       PROJECT(CURI:DESCUENTO)
                       PROJECT(CURI:ID_PROVEEDOR)
                       PROJECT(CURI:IDCURSO)
                       JOIN(CUR:PK_CURSO,CURI:IDCURSO)
                         PROJECT(CUR:DESCRIPCION)
                         PROJECT(CUR:IDCURSO)
                       END
                       JOIN(PRO2:PK_PROVEEDOR,CURI:ID_PROVEEDOR)
                         PROJECT(PRO2:DESCRIPCION)
                         PROJECT(PRO2:IDPROVEEDOR)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
CURI:IDINSCRIPCION     LIKE(CURI:IDINSCRIPCION)       !List box control field - type derived from field
PRO2:DESCRIPCION       LIKE(PRO2:DESCRIPCION)         !List box control field - type derived from field
CUR:DESCRIPCION        LIKE(CUR:DESCRIPCION)          !List box control field - type derived from field
CURI:MONTO_TOTAL       LIKE(CURI:MONTO_TOTAL)         !List box control field - type derived from field
CURI:PAGADO_TOTAL      LIKE(CURI:PAGADO_TOTAL)        !List box control field - type derived from field
CURI:FECHA             LIKE(CURI:FECHA)               !List box control field - type derived from field
CURI:TERMINADO         LIKE(CURI:TERMINADO)           !List box control field - type derived from field
CURI:DESCUENTO         LIKE(CURI:DESCUENTO)           !List box control field - type derived from field
CURI:ID_PROVEEDOR      LIKE(CURI:ID_PROVEEDOR)        !List box control field - type derived from field
CUR:IDCURSO            LIKE(CUR:IDCURSO)              !Related join file key field - type derived from field
PRO2:IDPROVEEDOR       LIKE(PRO2:IDPROVEEDOR)         !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW10::View:Browse   VIEW(CURSO_INSCRIPCION_DETALLE)
                       PROJECT(CURD:PAGADO)
                       PROJECT(CURD:IDINSCRIPCION)
                       PROJECT(CURD:IDCURSO)
                       PROJECT(CURD:ID_MODULO)
                       JOIN(CUR2:PK_CURSO_MODULOS,CURD:ID_MODULO)
                         PROJECT(CUR2:NUMERO_MODULO)
                         PROJECT(CUR2:DESCRIPCION)
                         PROJECT(CUR2:FECHA_FIN)
                         PROJECT(CUR2:ID_MODULO)
                       END
                     END
Queue:Browse         QUEUE                            !Queue declaration for browse/combo box using ?List
CUR2:NUMERO_MODULO     LIKE(CUR2:NUMERO_MODULO)       !List box control field - type derived from field
CUR2:DESCRIPCION       LIKE(CUR2:DESCRIPCION)         !List box control field - type derived from field
CURD:PAGADO            LIKE(CURD:PAGADO)              !List box control field - type derived from field
CUR2:FECHA_FIN         LIKE(CUR2:FECHA_FIN)           !List box control field - type derived from field
CURD:IDINSCRIPCION     LIKE(CURD:IDINSCRIPCION)       !List box control field - type derived from field
CURD:IDCURSO           LIKE(CURD:IDCURSO)             !List box control field - type derived from field
CURD:ID_MODULO         LIKE(CURD:ID_MODULO)           !List box control field - type derived from field
CUR2:ID_MODULO         LIKE(CUR2:ID_MODULO)           !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW12::View:Browse   VIEW(CURSO_CUOTA)
                       PROJECT(CUR1:IDCUOTA)
                       PROJECT(CUR1:MONTO)
                       PROJECT(CUR1:PAGADO)
                       PROJECT(CUR1:IDINSCRIPCION)
                       PROJECT(CUR1:IDCURSO)
                       PROJECT(CUR1:IDMODULO)
                     END
Queue:Browse:2       QUEUE                            !Queue declaration for browse/combo box using ?List:2
T                      LIKE(T)                        !List box control field - type derived from local data
CUR1:IDCUOTA           LIKE(CUR1:IDCUOTA)             !List box control field - type derived from field
CUR1:MONTO             LIKE(CUR1:MONTO)               !List box control field - type derived from field
CUR1:PAGADO            LIKE(CUR1:PAGADO)              !List box control field - type derived from field
CUR1:IDINSCRIPCION     LIKE(CUR1:IDINSCRIPCION)       !List box control field - type derived from field
CUR1:IDCURSO           LIKE(CUR1:IDCURSO)             !List box control field - type derived from field
CUR1:IDMODULO          LIKE(CUR1:IDMODULO)            !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Inscripción a Curso'),AT(,,527,336),FONT('MS Sans Serif',8,,FONT:regular),RESIZE,CENTER, |
  GRAY,IMM,MDI,HLP('Curso_Incripcion'),SYSTEM
                       LIST,AT(8,35,503,50),USE(?Browse:1),HSCROLL,FORMAT('34L(2)|M~Nº INSC~@n-7@200L(2)|M~INS' & |
  'CRIPTO~C(0)@s50@200L(2)|M~CURSO~C(0)@s50@66L(1)|M~MONTO_TOTAL~C(0)@n$-10.2@71L(1)|M~' & |
  'PAGADO_TOTAL~C(0)@s2@80L(2)|M~FECHA~C(0)@d17@49L(2)|M~TERMINADO~@s2@40D(12)|M~DESCUE' & |
  'NTO~C(0)@n-7.2@56L(2)|M~ID_PROVEEDOR~@n-7@'),FROM(Queue:Browse:1),IMM,MSG('Administra' & |
  'dor de CURSO_INSCRIPCION')
                       BUTTON('&Ver'),AT(462,93,49,14),USE(?View:3),LEFT,ICON('v.ico'),CURSOR('mano.cur'),FLAT,MSG('Visualizar'), |
  TIP('Visualizar')
                       BUTTON('&Cambiar'),AT(412,93,49,14),USE(?Change:4),LEFT,ICON('c.ico'),CURSOR('mano.cur'),DEFAULT, |
  DISABLE,FLAT,HIDE,MSG('Cambia Registro'),TIP('Cambia Registro')
                       GROUP('Módulos Adeudados'),AT(0,113,322,92),USE(?Group1),BOXED
                         LIST,AT(4,124,313,76),USE(?List),HVSCROLL,FORMAT('37L|M~Nº~L(2)@n-5@197L|M~MODULO~@s50@' & |
  '38L|M~PAGADO~L(2)@s2@40L|M~FECHA FIN~L(2)@d17@56L|M~IDINSCRIPCION~L(2)@n-14@56L|M~ID' & |
  'CURSO~L(2)@n-14@56L|M~ID MODULO~L(2)@n-14@'),FROM(Queue:Browse),IMM,MSG('Browsing Records')
                       END
                       GROUP,AT(326,116,196,185),USE(?Group2),BOXED
                         BUTTON('Calcular Monto'),AT(378,133,82,22),USE(?Button7),LEFT,ICON('calculator.ico'),FLAT
                         PROMPT(' Monto a Pagar:'),AT(333,168),USE(?Prompt3),FONT(,14)
                         STRING(@n$-10.2),AT(424,168),USE(GLO:MONTO),FONT(,14)
                         BUTTON('...'),AT(420,195,12,12),USE(?CallLookup:2)
                         PROMPT('Forma Pago:'),AT(338,196),USE(?GLO:IDSUBCUENTA_CURSO:Prompt)
                         ENTRY(@n-5),AT(384,196,33,10),USE(GLO:IDSUBCUENTA_CURSO),LEFT(1)
                         STRING(@s20),AT(435,196),USE(SUB:DESCRIPCION)
                         CHECK('AFECTADA'),AT(425,217),USE(LOC:AFECTADA),VALUE('SI','NO')
                         PROMPT('% DESCUENTO:'),AT(330,218),USE(?GLO:INTERES:Prompt)
                         ENTRY(@n-10.2),AT(386,218,33,10),USE(GLO:INTERES),DECIMAL(12)
                         LINE,AT(328,235,189,0),USE(?Line1),COLOR(COLOR:Black)
                         PROMPT('SUCURSAL:'),AT(332,243),USE(?GLO:SUCURSAL:Prompt)
                         ENTRY(@n-14),AT(382,242,33,10),USE(GLO:SUCURSAL),REQ
                         PROMPT('RECIBO:'),AT(418,242),USE(?GLO:IDRECIBO:Prompt)
                         ENTRY(@n-14),AT(450,242,66,10),USE(GLO:IDRECIBO),REQ
                         LINE,AT(329,263,191,0),USE(?Line2),COLOR(COLOR:Black)
                         BUTTON('PAGAR'),AT(386,270,67,26),USE(?Button13),LEFT,ICON('currency_dollar.ico'),DISABLE, |
  FLAT,HIDE
                       END
                       GROUP('Pagos'),AT(0,207,321,92),USE(?Group3),BOXED
                         LIST,AT(5,217,308,75),USE(?List:2),FORMAT('17L|M~T~L(2)@s1@38L|M~CUOTA~L(2)@n-3@40L|M~M' & |
  'ONTO~L(2)@n$-10.2@37L|M~PAGADO~L(2)@s2@56L|M~IDINSCRIPCION~L(2)@n-7@56L|M~IDCURSO~L(' & |
  '2)@n-7@56L|M~IDMODULO~L(2)@n-7@'),FROM(Queue:Browse:2),IMM,MSG('Browsing Records')
                       END
                       BUTTON('&Tag'),AT(4,306,32,13),USE(?DASTAG)
                       BUTTON('tag &All'),AT(43,306,45,13),USE(?DASTAGAll)
                       BUTTON('&Untag all'),AT(94,307,50,13),USE(?DASUNTAGALL)
                       BUTTON('&Rev tags'),AT(147,307,50,13),USE(?DASREVTAG)
                       BUTTON('sho&W tags'),AT(205,308,70,13),USE(?DASSHOWTAG)
                       SHEET,AT(0,1,520,110),USE(?CurrentTab)
                         TAB('ID INSCRIPTO'),USE(?Tab:1)
                           PROMPT('ID INSCRIPTO:'),AT(10,20),USE(?CURI:ID_PROVEEDOR:Prompt)
                           ENTRY(@n-14),AT(62,20,60,10),USE(CURI:ID_PROVEEDOR),RIGHT(1)
                           BUTTON('...'),AT(123,19,12,12),USE(?CallLookup)
                         END
                       END
                       BUTTON('&Salir'),AT(479,316,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Salir'),TIP('Salir')
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeFieldEvent         PROCEDURE(),BYTE,PROC,DERIVED
TakeNewSelection       PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
ResetFromView          PROCEDURE(),DERIVED
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW10                CLASS(BrowseClass)                    ! Browse using ?List
Q                      &Queue:Browse                  !Reference to browse queue
                     END

BRW10::Sort0:Locator StepLocatorClass                      ! Default Locator
BRW12                CLASS(BrowseClass)                    ! Browse using ?List:2
Q                      &Queue:Browse:2                !Reference to browse queue
SetQueueRecord         PROCEDURE(),DERIVED
TakeKey                PROCEDURE(),BYTE,PROC,DERIVED
ValidateRecord         PROCEDURE(),BYTE,DERIVED
                     END

BRW12::Sort0:Locator StepLocatorClass                      ! Default Locator
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END


  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!--------------------------------------------------------------------------
! DAS_Tagging
!--------------------------------------------------------------------------
DASBRW::13:DASTAGONOFF Routine
  GET(Queue:Browse:2,CHOICE(?List:2))
  BRW12.UpdateBuffer
   TAGS.PUNTERO = CUR1:IDINSCRIPCION
   TAGS.PUNTERO2 = CUR1:IDCURSO
   TAGS.PUNTERO3 = CUR1:IDMODULO
   TAGS.PUNTERO4 = CUR1:IDCUOTA
   GET(TAGS,TAGS.PUNTERO,TAGS.PUNTERO2,TAGS.PUNTERO3,TAGS.PUNTERO4)
  IF ERRORCODE()
     TAGS.PUNTERO = CUR1:IDINSCRIPCION
     TAGS.PUNTERO2 = CUR1:IDCURSO
     TAGS.PUNTERO3 = CUR1:IDMODULO
     TAGS.PUNTERO4 = CUR1:IDCUOTA
     ADD(TAGS,TAGS.PUNTERO,TAGS.PUNTERO2,TAGS.PUNTERO3,TAGS.PUNTERO4)
    T = '*'
  ELSE
    DELETE(TAGS)
    T = ''
  END
    Queue:Browse:2.T = T
  PUT(Queue:Browse:2)
  SELECT(?List:2,CHOICE(?List:2))
  IF DASBRW::13:TAGMOUSE = 1 THEN
    DASBRW::13:TAGMOUSE = 0
  ELSE
  DASBRW::13:TAGFLAG = 1
  POST(EVENT:ScrollDown,?List:2)
  END
DASBRW::13:DASTAGALL Routine
  ?List:2{PROPLIST:MouseDownField} = 2
  SETCURSOR(CURSOR:Wait)
  BRW12.Reset
  FREE(TAGS)
  LOOP
    NEXT(BRW12::View:Browse)
    IF ERRORCODE()
      BREAK
    END
     TAGS.PUNTERO = CUR1:IDINSCRIPCION
     TAGS.PUNTERO2 = CUR1:IDCURSO
     TAGS.PUNTERO3 = CUR1:IDMODULO
     TAGS.PUNTERO4 = CUR1:IDCUOTA
     ADD(TAGS,TAGS.PUNTERO,TAGS.PUNTERO2,TAGS.PUNTERO3,TAGS.PUNTERO4)
  END
  SETCURSOR
  BRW12.ResetSort(1)
  SELECT(?List:2,CHOICE(?List:2))
DASBRW::13:DASUNTAGALL Routine
  ?List:2{PROPLIST:MouseDownField} = 2
  SETCURSOR(CURSOR:Wait)
  FREE(TAGS)
  BRW12.Reset
  SETCURSOR
  BRW12.ResetSort(1)
  SELECT(?List:2,CHOICE(?List:2))
DASBRW::13:DASREVTAGALL Routine
  ?List:2{PROPLIST:MouseDownField} = 2
  SETCURSOR(CURSOR:Wait)
  FREE(DASBRW::13:QUEUE)
  LOOP QR# = 1 TO RECORDS(TAGS)
    GET(TAGS,QR#)
    DASBRW::13:QUEUE = TAGS
    ADD(DASBRW::13:QUEUE)
  END
  FREE(TAGS)
  BRW12.Reset
  LOOP
    NEXT(BRW12::View:Browse)
    IF ERRORCODE()
      BREAK
    END
     DASBRW::13:QUEUE.PUNTERO = CUR1:IDINSCRIPCION
     DASBRW::13:QUEUE.PUNTERO2 = CUR1:IDCURSO
     DASBRW::13:QUEUE.PUNTERO3 = CUR1:IDMODULO
     DASBRW::13:QUEUE.PUNTERO4 = CUR1:IDCUOTA
     GET(DASBRW::13:QUEUE,DASBRW::13:QUEUE.PUNTERO,DASBRW::13:QUEUE.PUNTERO2,DASBRW::13:QUEUE.PUNTERO3,DASBRW::13:QUEUE.PUNTERO4)
    IF ERRORCODE()
       TAGS.PUNTERO = CUR1:IDINSCRIPCION
       TAGS.PUNTERO2 = CUR1:IDCURSO
       TAGS.PUNTERO3 = CUR1:IDMODULO
       TAGS.PUNTERO4 = CUR1:IDCUOTA
       ADD(TAGS,TAGS.PUNTERO,TAGS.PUNTERO2,TAGS.PUNTERO3,TAGS.PUNTERO4)
    END
  END
  SETCURSOR
  BRW12.ResetSort(1)
  SELECT(?List:2,CHOICE(?List:2))
DASBRW::13:DASSHOWTAG Routine
   CASE DASBRW::13:TAGDISPSTATUS
   OF 0
      DASBRW::13:TAGDISPSTATUS = 1    ! display tagged
      ?DASSHOWTAG{PROP:Text} = 'Showing Tagged'
      ?DASSHOWTAG{PROP:Msg}  = 'Showing Tagged'
      ?DASSHOWTAG{PROP:Tip}  = 'Showing Tagged'
   OF 1
      DASBRW::13:TAGDISPSTATUS = 2    ! display untagged
      ?DASSHOWTAG{PROP:Text} = 'Showing UnTagged'
      ?DASSHOWTAG{PROP:Msg}  = 'Showing UnTagged'
      ?DASSHOWTAG{PROP:Tip}  = 'Showing UnTagged'
   OF 2
      DASBRW::13:TAGDISPSTATUS = 0    ! display all
      ?DASSHOWTAG{PROP:Text} = 'Show All'
      ?DASSHOWTAG{PROP:Msg}  = 'Show All'
      ?DASSHOWTAG{PROP:Tip}  = 'Show All'
   END
   DISPLAY(?DASSHOWTAG{PROP:Text})
   BRW12.ResetSort(1)
   SELECT(?List:2,CHOICE(?List:2))
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

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('CURSOS_PAGOS')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('CURI:MONTO_TOTAL',CURI:MONTO_TOTAL)                ! Added by: BrowseBox(ABC)
  BIND('CURI:PAGADO_TOTAL',CURI:PAGADO_TOTAL)              ! Added by: BrowseBox(ABC)
  BIND('CURI:ID_PROVEEDOR',CURI:ID_PROVEEDOR)              ! Added by: BrowseBox(ABC)
  BIND('CUR:IDCURSO',CUR:IDCURSO)                          ! Added by: BrowseBox(ABC)
  BIND('CUR2:NUMERO_MODULO',CUR2:NUMERO_MODULO)            ! Added by: BrowseBox(ABC)
  BIND('CUR2:FECHA_FIN',CUR2:FECHA_FIN)                    ! Added by: BrowseBox(ABC)
  BIND('CURD:ID_MODULO',CURD:ID_MODULO)                    ! Added by: BrowseBox(ABC)
  BIND('CUR2:ID_MODULO',CUR2:ID_MODULO)                    ! Added by: BrowseBox(ABC)
  BIND('T',T)                                              ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:CAJA.Open                                         ! File CAJA used by this procedure, so make sure it's RelationManager is open
  Relate:CUENTAS.Open                                      ! File CUENTAS used by this procedure, so make sure it's RelationManager is open
  Relate:CURSO_CUOTA.SetOpenRelated()
  Relate:CURSO_CUOTA.Open                                  ! File CURSO_CUOTA used by this procedure, so make sure it's RelationManager is open
  Relate:CURSO_INSCRIPCION.Open                            ! File CURSO_INSCRIPCION used by this procedure, so make sure it's RelationManager is open
  Relate:FONDOS.Open                                       ! File FONDOS used by this procedure, so make sure it's RelationManager is open
  Relate:INGRESOS.Open                                     ! File INGRESOS used by this procedure, so make sure it's RelationManager is open
  Relate:LIBDIARIO.Open                                    ! File LIBDIARIO used by this procedure, so make sure it's RelationManager is open
  Relate:PROVEEDORES.Open                                  ! File PROVEEDORES used by this procedure, so make sure it's RelationManager is open
  Relate:RANKING.Open                                      ! File RANKING used by this procedure, so make sure it's RelationManager is open
  Relate:SUBCUENTAS.Open                                   ! File SUBCUENTAS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:CURSO_INSCRIPCION,SELF) ! Initialize the browse manager
  BRW10.Init(?List,Queue:Browse.ViewPosition,BRW10::View:Browse,Queue:Browse,Relate:CURSO_INSCRIPCION_DETALLE,SELF) ! Initialize the browse manager
  BRW12.Init(?List:2,Queue:Browse:2.ViewPosition,BRW12::View:Browse,Queue:Browse:2,Relate:CURSO_CUOTA,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,CURI:FK_CURSO_INSCRIPCION_PROVEEDOR)  ! Add the sort order for CURI:FK_CURSO_INSCRIPCION_PROVEEDOR for sort order 1
  BRW1.AddRange(CURI:ID_PROVEEDOR,Relate:CURSO_INSCRIPCION,Relate:PROVEEDORES) ! Add file relationship range limit for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,CURI:ID_PROVEEDOR,,BRW1)       ! Initialize the browse locator using  using key: CURI:FK_CURSO_INSCRIPCION_PROVEEDOR , CURI:ID_PROVEEDOR
  BRW1.SetFilter('(CUR:FECHA_FIN >= TODAY())')             ! Apply filter expression to browse
  BRW1.AddField(CURI:IDINSCRIPCION,BRW1.Q.CURI:IDINSCRIPCION) ! Field CURI:IDINSCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(PRO2:DESCRIPCION,BRW1.Q.PRO2:DESCRIPCION)  ! Field PRO2:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(CUR:DESCRIPCION,BRW1.Q.CUR:DESCRIPCION)    ! Field CUR:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(CURI:MONTO_TOTAL,BRW1.Q.CURI:MONTO_TOTAL)  ! Field CURI:MONTO_TOTAL is a hot field or requires assignment from browse
  BRW1.AddField(CURI:PAGADO_TOTAL,BRW1.Q.CURI:PAGADO_TOTAL) ! Field CURI:PAGADO_TOTAL is a hot field or requires assignment from browse
  BRW1.AddField(CURI:FECHA,BRW1.Q.CURI:FECHA)              ! Field CURI:FECHA is a hot field or requires assignment from browse
  BRW1.AddField(CURI:TERMINADO,BRW1.Q.CURI:TERMINADO)      ! Field CURI:TERMINADO is a hot field or requires assignment from browse
  BRW1.AddField(CURI:DESCUENTO,BRW1.Q.CURI:DESCUENTO)      ! Field CURI:DESCUENTO is a hot field or requires assignment from browse
  BRW1.AddField(CURI:ID_PROVEEDOR,BRW1.Q.CURI:ID_PROVEEDOR) ! Field CURI:ID_PROVEEDOR is a hot field or requires assignment from browse
  BRW1.AddField(CUR:IDCURSO,BRW1.Q.CUR:IDCURSO)            ! Field CUR:IDCURSO is a hot field or requires assignment from browse
  BRW1.AddField(PRO2:IDPROVEEDOR,BRW1.Q.PRO2:IDPROVEEDOR)  ! Field PRO2:IDPROVEEDOR is a hot field or requires assignment from browse
  BRW10.Q &= Queue:Browse
  BRW10.RetainRow = 0
  BRW10.AddSortOrder(,CURD:PK_CURSO_INSCRIPCION_DETALLE)   ! Add the sort order for CURD:PK_CURSO_INSCRIPCION_DETALLE for sort order 1
  BRW10.AddRange(CURD:IDINSCRIPCION,Relate:CURSO_INSCRIPCION_DETALLE,Relate:CURSO_INSCRIPCION) ! Add file relationship range limit for sort order 1
  BRW10.AddLocator(BRW10::Sort0:Locator)                   ! Browse has a locator for sort order 1
  BRW10::Sort0:Locator.Init(,CURD:IDCURSO,,BRW10)          ! Initialize the browse locator using  using key: CURD:PK_CURSO_INSCRIPCION_DETALLE , CURD:IDCURSO
  BRW10.SetFilter('(CURD:PAGADO = '''')')                  ! Apply filter expression to browse
  BRW10.AddField(CUR2:NUMERO_MODULO,BRW10.Q.CUR2:NUMERO_MODULO) ! Field CUR2:NUMERO_MODULO is a hot field or requires assignment from browse
  BRW10.AddField(CUR2:DESCRIPCION,BRW10.Q.CUR2:DESCRIPCION) ! Field CUR2:DESCRIPCION is a hot field or requires assignment from browse
  BRW10.AddField(CURD:PAGADO,BRW10.Q.CURD:PAGADO)          ! Field CURD:PAGADO is a hot field or requires assignment from browse
  BRW10.AddField(CUR2:FECHA_FIN,BRW10.Q.CUR2:FECHA_FIN)    ! Field CUR2:FECHA_FIN is a hot field or requires assignment from browse
  BRW10.AddField(CURD:IDINSCRIPCION,BRW10.Q.CURD:IDINSCRIPCION) ! Field CURD:IDINSCRIPCION is a hot field or requires assignment from browse
  BRW10.AddField(CURD:IDCURSO,BRW10.Q.CURD:IDCURSO)        ! Field CURD:IDCURSO is a hot field or requires assignment from browse
  BRW10.AddField(CURD:ID_MODULO,BRW10.Q.CURD:ID_MODULO)    ! Field CURD:ID_MODULO is a hot field or requires assignment from browse
  BRW10.AddField(CUR2:ID_MODULO,BRW10.Q.CUR2:ID_MODULO)    ! Field CUR2:ID_MODULO is a hot field or requires assignment from browse
  BRW12.Q &= Queue:Browse:2
  BRW12.RetainRow = 0
  BRW12.AddSortOrder(,CUR1:PK_CURSO_CUOTA)                 ! Add the sort order for CUR1:PK_CURSO_CUOTA for sort order 1
  BRW12.AddRange(CUR1:IDINSCRIPCION,CURD:IDINSCRIPCION)    ! Add single value range limit for sort order 1
  BRW12.AddLocator(BRW12::Sort0:Locator)                   ! Browse has a locator for sort order 1
  BRW12::Sort0:Locator.Init(,CUR1:IDCURSO,,BRW12)          ! Initialize the browse locator using  using key: CUR1:PK_CURSO_CUOTA , CUR1:IDCURSO
  BRW12.SetFilter('(CUR1:PAGADO = '''')')                  ! Apply filter expression to browse
  BRW12.AddField(T,BRW12.Q.T)                              ! Field T is a hot field or requires assignment from browse
  BRW12.AddField(CUR1:IDCUOTA,BRW12.Q.CUR1:IDCUOTA)        ! Field CUR1:IDCUOTA is a hot field or requires assignment from browse
  BRW12.AddField(CUR1:MONTO,BRW12.Q.CUR1:MONTO)            ! Field CUR1:MONTO is a hot field or requires assignment from browse
  BRW12.AddField(CUR1:PAGADO,BRW12.Q.CUR1:PAGADO)          ! Field CUR1:PAGADO is a hot field or requires assignment from browse
  BRW12.AddField(CUR1:IDINSCRIPCION,BRW12.Q.CUR1:IDINSCRIPCION) ! Field CUR1:IDINSCRIPCION is a hot field or requires assignment from browse
  BRW12.AddField(CUR1:IDCURSO,BRW12.Q.CUR1:IDCURSO)        ! Field CUR1:IDCURSO is a hot field or requires assignment from browse
  BRW12.AddField(CUR1:IDMODULO,BRW12.Q.CUR1:IDMODULO)      ! Field CUR1:IDMODULO is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('CURSOS_PAGOS',QuickWindow)                 ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 3                                    ! Will call: UpdateCURSO_INSCRIPCION
  BRW10.AddToolbarTarget(Toolbar)                          ! Browse accepts toolbar control
  BRW12.AddToolbarTarget(Toolbar)                          ! Browse accepts toolbar control
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
  ?List:2{Prop:Alrt,239} = SpaceKey
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
    Relate:CAJA.Close
    Relate:CUENTAS.Close
    Relate:CURSO_CUOTA.Close
    Relate:CURSO_INSCRIPCION.Close
    Relate:FONDOS.Close
    Relate:INGRESOS.Close
    Relate:LIBDIARIO.Close
    Relate:PROVEEDORES.Close
    Relate:RANKING.Close
    Relate:SUBCUENTAS.Close
  END
  IF SELF.Opened
    INIMgr.Update('CURSOS_PAGOS',QuickWindow)              ! Save window data to non-volatile store
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
      SelectSUBCUENTAS_INGRESOS_SIN_FILTRO
      SelectPROVEEDORES
      UpdateCURSO_INSCRIPCION
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
    OF ?Button7
      GLO:MONTO = 0
      Loop i# = 1 to records(Tags)
          get(Tags,i#)
          CUR1:IDINSCRIPCION = tags:Puntero
          CUR1:IDCURSO       = tags:PUNTERO2
          CUR1:IDMODULO      = tags:PUNTERO3
          CUR1:IDCUOTA       = tags:PUNTERO4
          ACCESS:CURSO_CUOTA.TRYFETCH(CUR1:PK_CURSO_CUOTA)
          GLO:MONTO = GLO:MONTO + CUR1:MONTO
          GLO:IDSOLICITUD = CUR1:IDINSCRIPCION
      end
      IF CURI:DESCUENTO <> 0 THEN
          GLO:MONTO = GLO:MONTO - (GLO:MONTO*(CURI:DESCUENTO/100))
          DISABLE(?GLO:INTERES)
      END
      UNHIDE(?Button13)
      ENABLE(?Button13)
      disable(?Group1)
      disable(?Button7)
      THISWINDOW.RESET(1)
    OF ?Button13
      !!!! PAGA EL MODULO...
      GLO:DETALLE_RECIBO = ''
      CONTADOR# = 0
      CUENTA# = 0
      REPORTE_LARGO = ''
      P1# = 0
      P2# = 0
      Loop i# = 1 to records(Tags)
          get(Tags,i#)
          CUR1:IDINSCRIPCION = tags:Puntero
          CUR1:IDCURSO      = tags:Puntero2
          CUR1:IDMODULO     = tags:Puntero3
          CUR1:IDCUOTA       = tags:Puntero4
          cur# = CUR1:IDCURSO
          mod# = CUR1:IDMODULO
          GET(CURSO_CUOTA,CUR1:PK_CURSO_CUOTA)
          IF ERRORCODE() = 35 THEN
              MESSAGE('NO ENCONTRO MODULO')
          ELSE
             cuota" = clip(cuota")&','&clip(CUR1:IDCUOTA)
             CUR1:PAGADO = 'SI'
             CUR1:IDSUBCUENTA = GLO:IDSUBCUENTA_CURSO
             CUR1:FECHA   =  TODAY()
             CUR1:HORA    =  CLOCK()
             CUR1:IDUSUARIO =  GLO:IDUSUARIO
             !CURD:DESCUENTO    = GLO:INTERES
             CUR1:SUCURSAL    = GLO:SUCURSAL
             CUR1:IDRECIBO     = GLO:IDRECIBO
             CUR1:AFECTADA    = LOC:AFECTADA
             ACCESS:CURSO_CUOTA.UPDATE()
             CUR2:IDCURSO   = cur#
             CUR2:ID_MODULO = mod#
             ACCESS:CURSO_MODULOS.TRYFETCH(CUR2:IDX_CONTROL)
             GLO:DETALLE_RECIBO = clip(GLO:DETALLE_RECIBO)&CLIP(CUR2:NUMERO_MODULO)&', Cuota:'&clip(CUR1:IDCUOTA)
             !!! CONTROL PAGO DEL MODULO
             CURD:IDINSCRIPCION = tags:Puntero
             CURD:IDCURSO    = tags:Puntero2
             CURD:ID_MODULO     = tags:Puntero3
             get(CURSO_INSCRIPCION_DETALLE,CURD:PK_CURSO_INSCRIPCION_DETALLE)
             IF ERRORCODE() = 35 THEN
                  MESSAGE('NO ECONTRO PUNTERO EN INSCRIP DETALLE')
             ELSE
      
                 CURD:SALDO_CUOTAS = CURD:SALDO_CUOTAS - 1
                 IF CURD:SALDO_CUOTAS  = 0 THEN
                      CURD:PAGADO = 'SI'
                      CURD:FECHA_PAGO    =   TODAY()
                      CURD:HORA_PAGO     =   CLOCK()
                      CURD:USUARIO_PAGO  =   GLO:IDUSUARIO
                      CURD:IDSUBCUENTA   =   GLO:IDSUBCUENTA_CURSO
                      CURD:DESCUENTO     =   GLO:INTERES
                      CURD:SUCURSAL      =   GLO:SUCURSAL
                      CURD:IDRECIBO      =   GLO:IDRECIBO
                      
                      
                 END
                 ACCESS:CURSO_INSCRIPCION_DETALLE.UPDATE()
            END
      
             
         end
      end
      REPORTE_LARGO  = 'PAGO DE CUOTAS :'&clip(cuota")&', DE CURSO:'&CUR:DESCRIPCION ! 'PAGA CUOTA '&CLIP(HASTA")
      GLO:MONTO = GLO:MONTO - (GLO:MONTO*(GLO:INTERES/100))
      IF LOC:AFECTADA <> 'SI' THEN
          !! BUSCO EL ID PROVEEDOR
          CURI:IDINSCRIPCION = CURD:IDINSCRIPCION
          ACCESS:CURSO_INSCRIPCION.TRYFETCH(CURI:PK_CURSO_INSCRIPCION)
          PRO2:IDPROVEEDOR = CURI:ID_PROVEEDOR
          ACCESS:PROVEEDORES.TRYFETCH(PRO2:PK_PROVEEDOR)
          IDPROVEEDOR# = PRO2:IDPROVEEDOR
      
          !! CARGO INGRESO
          RANKING{PROP:SQL} = 'DELETE FROM RANKING'
          ING:IDUSUARIO        =   GLO:IDUSUARIO
          ING:IDSUBCUENTA      =   GLO:IDSUBCUENTA_CURSO
          ING:OBSERVACION      =   REPORTE_LARGO
          ING:MONTO            =   GLO:MONTO
          ING:FECHA            =   CUR1:FECHA
          ING:HORA             =   CUR1:HORA
          ING:MES              =   MONTH(TODAY())
          ING:ANO              =   YEAR(TODAY())
          ING:PERIODO          =   ING:ANO&(FORMAT(ING:MES,@N02))
          ING:IDPROVEEDOR      =   IDPROVEEDOR#
          ING:SUCURSAL         =   CUR1:SUCURSAL
          ING:IDRECIBO         =   CUR1:IDRECIBO
          !!! CARGA
          RANKING{PROP:SQL} = 'CALL SP_GEN_INGRESOS_ID'
          NEXT(RANKING)
          ING:IDINGRESO = RAN:C1
          GLO:IDINSCRIPCION = ING:IDINGRESO
          !MESSAGE(ING:IDINGRESO)
          ACCESS:INGRESOS.INSERT()
      
      
      
          !!! CARGO EN LA CAJA
          SUB:IDSUBCUENTA = GLO:IDSUBCUENTA_CURSO
          ACCESS:SUBCUENTAS.TRYFETCH(SUB:INTEG_113)
          IF SUB:CAJA = 'SI' THEN
              !!! CARGO CAJA
              CAJ:IDSUBCUENTA = SUB:IDSUBCUENTA
              CAJ:IDUSUARIO = GLO:IDUSUARIO
              CAJ:DEBE =  GLO:MONTO
              CAJ:OBSERVACION = REPORTE_LARGO
              CAJ:FECHA = TODAY()
              CAJ:MES       =  MONTH(TODAY())
              CAJ:ANO       =  YEAR(TODAY())
              CAJ:PERIODO   =  CAJ:ANO&(FORMAT(CAJ:MES,@N02))
              CAJ:SUCURSAL  =  CUR1:SUCURSAL
              CAJ:RECIBO  =  CUR1:IDRECIBO
              CAJ:TIPO    =   'INGRESO'
              CAJ:IDTRANSACCION = GLO:IDINSCRIPCION 
              FON:IDFONDO = SUB:IDFONDO
              ACCESS:FONDOS.TRYFETCH(FON:PK_FONDOS)
              CAJ:MONTO = FON:MONTO + GLO:MONTO
              !!! DISPARA STORE PROCEDURE
              RANKING{PROP:SQL} = 'CALL SP_GEN_CAJA_ID'
              NEXT(RANKING)
              CAJ:IDCAJA = RAN:C1
              ACCESS:CAJA.INSERT()
              RAN:C1 = 0
          END
          !!! MODIFICA EL FLUJO DE FONDOS
          FON:IDFONDO = SUB:IDFONDO
          ACCESS:FONDOS.TRYFETCH(FON:PK_FONDOS)
          FON:MONTO = FON:MONTO + GLO:MONTO
          FON:FECHA = TODAY()
          FON:HORA = CLOCK()
          ACCESS:FONDOS.UPDATE()
      
          CUE:IDCUENTA = SUB:IDCUENTA
          ACCESS:CUENTAS.TRYFETCH(CUE:PK_CUENTAS)
          IF CUE:TIPO = 'INGRESO' THEN
              LIB:IDSUBCUENTA = GLO:IDSUBCUENTA_CURSO
              LIB:DEBE = GLO:MONTO
              LIB:OBSERVACION = REPORTE_LARGO
              LIB:FECHA = TODAY()
              LIB:HORA = CLOCK()
              LIB:MES       =  MONTH(TODAY())
              LIB:ANO       =  YEAR(TODAY())
              LIB:PERIODO   =  LIB:ANO&(FORMAT(LIB:MES,@N02))
              LIB:TIPO = CUE:TIPO
              LIB:IDTRANSACCION =  GLO:IDINSCRIPCION
              LIB:SUCURSAL     =   CUR1:SUCURSAL
              LIB:RECIBO       =   CUR1:IDRECIBO
              LIB:IDPROVEEDOR =   IDPROVEEDOR#
              FON:IDFONDO = SUB:IDFONDO
              ACCESS:FONDOS.TRYFETCH(FON:PK_FONDOS)
              LIB:FONDO = FON:MONTO + GLO:MONTO
              !!! DISPARA STORE PROCEDURE
              RANKING{PROP:SQL} = 'CALL SP_GEN_LIBDIARIO_ID'
              NEXT(RANKING)
              LIB:IDLIBDIARIO = RAN:C1
              !!!!!!!!!!!
              ACCESS:LIBDIARIO.INSERT()
          END
      
          !! TERMINA
          IMPRIMIR_PAGO_CURSO
      END
      GLO:IDSOLICITUD = 0
      GLO:MONTO     = 0
      GLO:SUCURSAL  =  0
      GLO:IDRECIBO =  0
      LOC:AFECTADA = ''
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?CallLookup:2
      ThisWindow.Update()
      SUB:IDSUBCUENTA = GLO:IDSUBCUENTA_CURSO
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        GLO:IDSUBCUENTA_CURSO = SUB:IDSUBCUENTA
      END
      ThisWindow.Reset(1)
    OF ?GLO:IDSUBCUENTA_CURSO
      IF GLO:IDSUBCUENTA_CURSO OR ?GLO:IDSUBCUENTA_CURSO{PROP:Req}
        SUB:IDSUBCUENTA = GLO:IDSUBCUENTA_CURSO
        IF Access:SUBCUENTAS.TryFetch(SUB:INTEG_113)
          IF SELF.Run(1,SelectRecord) = RequestCompleted
            GLO:IDSUBCUENTA_CURSO = SUB:IDSUBCUENTA
          ELSE
            SELECT(?GLO:IDSUBCUENTA_CURSO)
            CYCLE
          END
        END
      END
      ThisWindow.Reset()
    OF ?Button13
      ThisWindow.Update()
       POST(EVENT:CloseWindow)
    OF ?DASTAG
      ThisWindow.Update()
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
        DO DASBRW::13:DASTAGONOFF
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
    OF ?DASTAGAll
      ThisWindow.Update()
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
        DO DASBRW::13:DASTAGALL
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
    OF ?DASUNTAGALL
      ThisWindow.Update()
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
        DO DASBRW::13:DASUNTAGALL
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
    OF ?DASREVTAG
      ThisWindow.Update()
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
        DO DASBRW::13:DASREVTAGALL
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
    OF ?DASSHOWTAG
      ThisWindow.Update()
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
        DO DASBRW::13:DASSHOWTAG
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
    OF ?CURI:ID_PROVEEDOR
      PRO2:IDPROVEEDOR = CURI:ID_PROVEEDOR
      IF Access:PROVEEDORES.TryFetch(PRO2:PK_PROVEEDOR)
        IF SELF.Run(2,SelectRecord) = RequestCompleted
          CURI:ID_PROVEEDOR = PRO2:IDPROVEEDOR
        ELSE
          SELECT(?CURI:ID_PROVEEDOR)
          CYCLE
        END
      END
      ThisWindow.Reset()
    OF ?CallLookup
      ThisWindow.Update()
      PRO2:IDPROVEEDOR = CURI:ID_PROVEEDOR
      IF SELF.Run(2,SelectRecord) = RequestCompleted
        CURI:ID_PROVEEDOR = PRO2:IDPROVEEDOR
      END
      ThisWindow.Reset(1)
    END
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
  OF ?Browse:1
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
  OF ?List:2
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
    OF ?List:2
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
      IF KEYCODE() = MouseLeft AND (?List:2{PROPLIST:MouseDownRow} > 0) AND (DASBRW::13:TAGFLAG = 0)
        CASE ?List:2{PROPLIST:MouseDownField}
      
          OF 1
            DASBRW::13:TAGMOUSE = 1
            POST(EVENT:Accepted,?DASTAG)
               ?List:2{PROPLIST:MouseDownField} = 2
            CYCLE
         END
      END
      DASBRW::13:TAGFLAG = 0
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
    SELF.ChangeControl=?Change:4
  END
  SELF.ViewControl = ?View:3                               ! Setup the control used to initiate view only mode


BRW1.ResetFromView PROCEDURE

LOC:CANTIDAD:Cnt     LONG                                  ! Count variable for browse totals
  CODE
  SETCURSOR(Cursor:Wait)
  Relate:CURSO_INSCRIPCION.SetQuickScan(1)
  SELF.Reset
  IF SELF.UseMRP
     IF SELF.View{PROP:IPRequestCount} = 0
          SELF.View{PROP:IPRequestCount} = 60
     END
  END
  LOOP
    IF SELF.UseMRP
       IF SELF.View{PROP:IPRequestCount} = 0
            SELF.View{PROP:IPRequestCount} = 60
       END
    END
    CASE SELF.Next()
    OF Level:Notify
      BREAK
    OF Level:Fatal
      SETCURSOR()
      RETURN
    END
    SELF.SetQueueRecord
    LOC:CANTIDAD:Cnt += 1
  END
  SELF.View{PROP:IPRequestCount} = 0
  LOC:CANTIDAD = LOC:CANTIDAD:Cnt
  PARENT.ResetFromView
  Relate:CURSO_INSCRIPCION.SetQuickScan(0)
  SETCURSOR()


BRW12.SetQueueRecord PROCEDURE

  CODE
  !--------------------------------------------------------------------------
  ! DAS_Tagging
  !--------------------------------------------------------------------------
     TAGS.PUNTERO = CUR1:IDINSCRIPCION
     TAGS.PUNTERO2 = CUR1:IDCURSO
     TAGS.PUNTERO3 = CUR1:IDMODULO
     TAGS.PUNTERO4 = CUR1:IDCUOTA
     GET(TAGS,TAGS.PUNTERO,TAGS.PUNTERO2,TAGS.PUNTERO3,TAGS.PUNTERO4)
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


BRW12.TakeKey PROCEDURE

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


BRW12.ValidateRecord PROCEDURE

ReturnValue          BYTE,AUTO

BRW12::RecordStatus  BYTE,AUTO
  CODE
  ReturnValue = PARENT.ValidateRecord()
  BRW12::RecordStatus=ReturnValue
  IF BRW12::RecordStatus NOT=Record:OK THEN RETURN BRW12::RecordStatus.
  !--------------------------------------------------------------------------
  ! DAS_Tagging
  !--------------------------------------------------------------------------
     TAGS.PUNTERO = CUR1:IDINSCRIPCION
     TAGS.PUNTERO2 = CUR1:IDCURSO
     TAGS.PUNTERO3 = CUR1:IDMODULO
     TAGS.PUNTERO4 = CUR1:IDCUOTA
     GET(TAGS,TAGS.PUNTERO,TAGS.PUNTERO2,TAGS.PUNTERO3,TAGS.PUNTERO4)
    EXECUTE DASBRW::13:TAGDISPSTATUS
       IF ERRORCODE() THEN BRW12::RecordStatus = RECORD:FILTERED END
       IF ~ERRORCODE() THEN BRW12::RecordStatus = RECORD:FILTERED END
    END
  !--------------------------------------------------------------------------
  ! DAS_Tagging
  !--------------------------------------------------------------------------
  ReturnValue=BRW12::RecordStatus
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Window
!!! Select a TIPO_PROVEEDOR Record
!!! </summary>
SelectTIPO_PROVEEDOR PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(TIPO_PROVEEDOR)
                       PROJECT(TIPP:IDTIPO_PROVEEDOR)
                       PROJECT(TIPP:DESCRIPCION)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
TIPP:IDTIPO_PROVEEDOR  LIKE(TIPP:IDTIPO_PROVEEDOR)    !List box control field - type derived from field
TIPP:DESCRIPCION       LIKE(TIPP:DESCRIPCION)         !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Elegir un  TIPO PROVEEDOR'),AT(,,226,198),FONT('MS Sans Serif',8,,FONT:regular),RESIZE, |
  CENTER,GRAY,IMM,MDI,HLP('SelectTIPO_PROVEEDOR'),SYSTEM
                       LIST,AT(8,30,204,124),USE(?Browse:1),HVSCROLL,FORMAT('20L(2)|M~ID~C(0)@n-3@200L(2)|M~DE' & |
  'SCRIPCION~@s50@'),FROM(Queue:Browse:1),IMM,MSG('Administrador de TIPO_PROVEEDOR')
                       BUTTON('&Elegir'),AT(159,159,49,14),USE(?Select:2),LEFT,ICON('e.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Seleccionar'),TIP('Seleccionar')
                       SHEET,AT(4,4,214,172),USE(?CurrentTab)
                         TAB('TIPO PROVEEDOR'),USE(?Tab:2)
                         END
                         TAB('DESCRIPCION'),USE(?Tab:3)
                         END
                       END
                       BUTTON('&Salir'),AT(159,181,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Salir'),TIP('Salir')
                       PROMPT('&Orden:'),AT(8,13),USE(?SortOrderList:Prompt)
                       LIST,AT(48,13,75,10),USE(?SortOrderList),DROP(20),FROM(''),MSG('Select the Sort Order'),TIP('Select the' & |
  ' Sort Order')
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
  GlobalErrors.SetProcedureName('SelectTIPO_PROVEEDOR')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('TIPP:IDTIPO_PROVEEDOR',TIPP:IDTIPO_PROVEEDOR)      ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:TIPO_PROVEEDOR.Open                               ! File TIPO_PROVEEDOR used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:TIPO_PROVEEDOR,SELF) ! Initialize the browse manager
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
  BRW1.AddSortOrder(,)                                     ! Add the sort order for  for sort order 1
  BRW1.AddSortOrder(,TIPP:PK_TIPO_PROVEEDOR)               ! Add the sort order for TIPP:PK_TIPO_PROVEEDOR for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(,TIPP:IDTIPO_PROVEEDOR,,BRW1)   ! Initialize the browse locator using  using key: TIPP:PK_TIPO_PROVEEDOR , TIPP:IDTIPO_PROVEEDOR
  BRW1.AddField(TIPP:IDTIPO_PROVEEDOR,BRW1.Q.TIPP:IDTIPO_PROVEEDOR) ! Field TIPP:IDTIPO_PROVEEDOR is a hot field or requires assignment from browse
  BRW1.AddField(TIPP:DESCRIPCION,BRW1.Q.TIPP:DESCRIPCION)  ! Field TIPP:DESCRIPCION is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('SelectTIPO_PROVEEDOR',QuickWindow)         ! Restore window settings from non-volatile store
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
    Relate:TIPO_PROVEEDOR.Close
  END
  IF SELF.Opened
    INIMgr.Update('SelectTIPO_PROVEEDOR',QuickWindow)      ! Save window data to non-volatile store
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
!!! Actualizacion PROVEEDORES
!!! </summary>
UpdatePROVEEDORES PROCEDURE 

CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
LOC:DOCUMENTO        LONG                                  ! 
History::PRO2:Record LIKE(PRO2:RECORD),THREAD
QuickWindow          WINDOW('Actualizacion PROVEEDORES'),AT(,,269,156),FONT('MS Sans Serif',8,,FONT:regular),RESIZE, |
  CENTER,GRAY,IMM,MDI,HLP('UpdatePROVEEDORES'),SYSTEM
                       BUTTON('&Aceptar'),AT(167,140,49,14),USE(?OK),LEFT,ICON('ok.ico'),CURSOR('mano.cur'),DEFAULT, |
  FLAT,MSG('Confirma y Actualiza el Formulario'),TIP('Confirma y Actualiza el Formulario')
                       BUTTON('&Cancelar'),AT(221,140,49,14),USE(?Cancel),LEFT,ICON('cancelar.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Cancela Operacion'),TIP('Cancela Operacion')
                       PROMPT('RAZON SOCIAL:'),AT(3,7),USE(?PRO2:DESCRIPCION:Prompt),TRN
                       ENTRY(@s50),AT(60,7,204,10),USE(PRO2:DESCRIPCION),UPR
                       PROMPT('DIRECCION:'),AT(3,21),USE(?PRO2:DIRECCION:Prompt),TRN
                       ENTRY(@s50),AT(60,21,204,10),USE(PRO2:DIRECCION)
                       PROMPT('TELEFONO:'),AT(3,35),USE(?PRO2:TELEFONO:Prompt),TRN
                       ENTRY(@s30),AT(60,35,124,10),USE(PRO2:TELEFONO)
                       PROMPT('EMAIL:'),AT(3,49),USE(?PRO2:EMAIL:Prompt),TRN
                       ENTRY(@s100),AT(60,49,205,10),USE(PRO2:EMAIL)
                       PROMPT('CUITo DNI:'),AT(3,63),USE(?PRO2:CUIT:Prompt),TRN
                       ENTRY(@P###########P),AT(60,63,55,10),USE(PRO2:CUIT)
                       PROMPT('(Cuit sin - , DNI sin .)'),AT(118,63),USE(?Prompt10)
                       PROMPT('IDTIPOIVA:'),AT(3,77),USE(?PRO2:IDTIPOIVA:Prompt),TRN
                       ENTRY(@n-14),AT(60,77,64,10),USE(PRO2:IDTIPOIVA)
                       BUTTON('...'),AT(125,75,12,12),USE(?CallLookup)
                       STRING(@s30),AT(140,76),USE(TIP7:DECRIPCION)
                       PROMPT('IDTIPO PROV:'),AT(2,91),USE(?PRO2:IDTIPO_PROVEEDOR:Prompt)
                       ENTRY(@n-14),AT(59,91,64,10),USE(PRO2:IDTIPO_PROVEEDOR),RIGHT(1)
                       BUTTON('...'),AT(125,90,12,12),USE(?CallLookup:2)
                       STRING(@s50),AT(140,92,113,10),USE(TIPP:DESCRIPCION)
                       LINE,AT(1,105,268,0),USE(?Line1),COLOR(COLOR:Black)
                       PROMPT('FECHA BAJA:'),AT(3,110),USE(?PRO2:FECHA_BAJA:Prompt)
                       ENTRY(@d17),AT(60,109,68,10),USE(PRO2:FECHA_BAJA)
                       PROMPT('OBSERVACION:'),AT(3,124),USE(?PRO2:OBSERVACION:Prompt)
                       ENTRY(@s100),AT(60,123,204,10),USE(PRO2:OBSERVACION)
                       LINE,AT(0,137,268,0),USE(?Line2),COLOR(COLOR:Black)
                     END

ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
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
  GlobalErrors.SetProcedureName('UpdatePROVEEDORES')
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
  SELF.AddHistoryFile(PRO2:Record,History::PRO2:Record)
  SELF.AddHistoryField(?PRO2:DESCRIPCION,2)
  SELF.AddHistoryField(?PRO2:DIRECCION,3)
  SELF.AddHistoryField(?PRO2:TELEFONO,4)
  SELF.AddHistoryField(?PRO2:EMAIL,5)
  SELF.AddHistoryField(?PRO2:CUIT,6)
  SELF.AddHistoryField(?PRO2:IDTIPOIVA,10)
  SELF.AddHistoryField(?PRO2:IDTIPO_PROVEEDOR,13)
  SELF.AddHistoryField(?PRO2:FECHA_BAJA,11)
  SELF.AddHistoryField(?PRO2:OBSERVACION,12)
  SELF.AddUpdateFile(Access:PROVEEDORES)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:GASTOS.Open                                       ! File GASTOS used by this procedure, so make sure it's RelationManager is open
  Relate:INGRESOS.Open                                     ! File INGRESOS used by this procedure, so make sure it's RelationManager is open
  Relate:PROVEEDORES.Open                                  ! File PROVEEDORES used by this procedure, so make sure it's RelationManager is open
  Relate:RANKING.Open                                      ! File RANKING used by this procedure, so make sure it's RelationManager is open
  Relate:TIPO_IVA.Open                                     ! File TIPO_IVA used by this procedure, so make sure it's RelationManager is open
  Relate:TIPO_PROVEEDOR.Open                               ! File TIPO_PROVEEDOR used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:PROVEEDORES
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
    ?PRO2:DESCRIPCION{PROP:ReadOnly} = True
    ?PRO2:DIRECCION{PROP:ReadOnly} = True
    ?PRO2:TELEFONO{PROP:ReadOnly} = True
    ?PRO2:EMAIL{PROP:ReadOnly} = True
    ?PRO2:CUIT{PROP:ReadOnly} = True
    ?PRO2:IDTIPOIVA{PROP:ReadOnly} = True
    DISABLE(?CallLookup)
    ?PRO2:IDTIPO_PROVEEDOR{PROP:ReadOnly} = True
    DISABLE(?CallLookup:2)
    ?PRO2:FECHA_BAJA{PROP:ReadOnly} = True
    ?PRO2:OBSERVACION{PROP:ReadOnly} = True
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdatePROVEEDORES',QuickWindow)            ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:GASTOS.Close
    Relate:INGRESOS.Close
    Relate:PROVEEDORES.Close
    Relate:RANKING.Close
    Relate:TIPO_IVA.Close
    Relate:TIPO_PROVEEDOR.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdatePROVEEDORES',QuickWindow)         ! Save window data to non-volatile store
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
      SelectTIPO_IVA
      SelectTIPO_PROVEEDOR
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
    OF ?OK
      IF SELF.REQUEST = INSERTRECORD THEN
          PRO2:FECHA        =  TODAY()
          PRO2:HORA         =  CLOCK()
          PRO2:IDUSUARIO    =  GLO:IDUSUARIO
      END
      
      
      
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?OK
      ThisWindow.Update()
      IF SELF.REQUEST = INSERTRECORD THEN
          !!! CARGA EL NRO DE PROVEEDOR POR STRORE PROCEDURE
          RANKING{PROP:SQL} = 'CALL SP_GEN_PROVEEDORES_ID'
          NEXT(RANKING)
          PRO2:IDPROVEEDOR = RAN:C1
      END
      IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing THEN
         POST(EVENT:CloseWindow)
      END
    OF ?PRO2:IDTIPOIVA
      TIP7:IDTIPOIVA = PRO2:IDTIPOIVA
      IF Access:TIPO_IVA.TryFetch(TIP7:PK_TIPO_IVA)
        IF SELF.Run(1,SelectRecord) = RequestCompleted
          PRO2:IDTIPOIVA = TIP7:IDTIPOIVA
        ELSE
          SELECT(?PRO2:IDTIPOIVA)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
      IF Access:PROVEEDORES.TryValidateField(10)           ! Attempt to validate PRO2:IDTIPOIVA in PROVEEDORES
        SELECT(?PRO2:IDTIPOIVA)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?PRO2:IDTIPOIVA
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?PRO2:IDTIPOIVA{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?CallLookup
      ThisWindow.Update()
      TIP7:IDTIPOIVA = PRO2:IDTIPOIVA
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        PRO2:IDTIPOIVA = TIP7:IDTIPOIVA
      END
      ThisWindow.Reset(1)
    OF ?PRO2:IDTIPO_PROVEEDOR
      TIPP:IDTIPO_PROVEEDOR = PRO2:IDTIPO_PROVEEDOR
      IF Access:TIPO_PROVEEDOR.TryFetch(TIPP:PK_TIPO_PROVEEDOR)
        IF SELF.Run(2,SelectRecord) = RequestCompleted
          PRO2:IDTIPO_PROVEEDOR = TIPP:IDTIPO_PROVEEDOR
        ELSE
          SELECT(?PRO2:IDTIPO_PROVEEDOR)
          CYCLE
        END
      END
      ThisWindow.Reset()
      IF Access:PROVEEDORES.TryValidateField(13)           ! Attempt to validate PRO2:IDTIPO_PROVEEDOR in PROVEEDORES
        SELECT(?PRO2:IDTIPO_PROVEEDOR)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?PRO2:IDTIPO_PROVEEDOR
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?PRO2:IDTIPO_PROVEEDOR{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?CallLookup:2
      ThisWindow.Update()
      TIPP:IDTIPO_PROVEEDOR = PRO2:IDTIPO_PROVEEDOR
      IF SELF.Run(2,SelectRecord) = RequestCompleted
        PRO2:IDTIPO_PROVEEDOR = TIPP:IDTIPO_PROVEEDOR
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


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Window
!!! Select a PROVEEDORES Record
!!! </summary>
SelectPROVEEDORES PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(PROVEEDORES)
                       PROJECT(PRO2:IDPROVEEDOR)
                       PROJECT(PRO2:DESCRIPCION)
                       PROJECT(PRO2:CUIT)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
PRO2:IDPROVEEDOR       LIKE(PRO2:IDPROVEEDOR)         !List box control field - type derived from field
PRO2:DESCRIPCION       LIKE(PRO2:DESCRIPCION)         !List box control field - type derived from field
PRO2:CUIT              LIKE(PRO2:CUIT)                !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Seleccionar  a PROVEEDORES'),AT(,,357,318),FONT('MS Sans Serif',8,,FONT:regular),RESIZE, |
  CENTER,GRAY,IMM,MDI,HLP('SelectPROVEEDORES'),SYSTEM
                       LIST,AT(8,41,342,230),USE(?Browse:1),HVSCROLL,FORMAT('56L(2)|M~IDPROVEEDOR~C(0)@n-7@200' & |
  'L(2)|M~DESCRIPCION~C(0)@s50@44L(2)|M~CUIT~C(0)@p##-########-##p@'),FROM(Queue:Browse:1), |
  IMM,MSG('Administrador de PROVEEDORES'),VCR
                       BUTTON('&Elegir'),AT(297,276,49,14),USE(?Select:2),LEFT,ICON('e.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Seleccionar'),TIP('Seleccionar')
                       BUTTON('&Agregar Proveedor'),AT(7,299,73,18),USE(?Insert),LEFT,ICON('a.ico'),FLAT
                       SHEET,AT(4,4,350,292),USE(?CurrentTab)
                         TAB('RAZON SOCIAL'),USE(?Tab:2)
                           PROMPT('RAZON SOCIAL:'),AT(7,26),USE(?PRO2:DESCRIPCION:Prompt)
                           ENTRY(@s50),AT(65,25,232,10),USE(PRO2:DESCRIPCION)
                         END
                         TAB('ID PROVEEDOR'),USE(?Tab:3)
                           PROMPT('IDPROVEEDOR:'),AT(6,27),USE(?PRO2:IDPROVEEDOR:Prompt)
                           ENTRY(@n-14),AT(63,27,66,10),USE(PRO2:IDPROVEEDOR),REQ
                         END
                       END
                       BUTTON('&Salir'),AT(307,302,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
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
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
                     END

BRW1::Sort0:Locator  FilterLocatorClass                    ! Default Locator
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
  GlobalErrors.SetProcedureName('SelectPROVEEDORES')
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
  Relate:PROVEEDORES.Open                                  ! File PROVEEDORES used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:PROVEEDORES,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,)                                     ! Add the sort order for  for sort order 1
  BRW1.AddSortOrder(,PRO2:IDX_PROVEEDORES_DESCRIPCION)     ! Add the sort order for PRO2:IDX_PROVEEDORES_DESCRIPCION for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(?PRO2:DESCRIPCION,PRO2:DESCRIPCION,,BRW1) ! Initialize the browse locator using ?PRO2:DESCRIPCION using key: PRO2:IDX_PROVEEDORES_DESCRIPCION , PRO2:DESCRIPCION
  BRW1.AddField(PRO2:IDPROVEEDOR,BRW1.Q.PRO2:IDPROVEEDOR)  ! Field PRO2:IDPROVEEDOR is a hot field or requires assignment from browse
  BRW1.AddField(PRO2:DESCRIPCION,BRW1.Q.PRO2:DESCRIPCION)  ! Field PRO2:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(PRO2:CUIT,BRW1.Q.PRO2:CUIT)                ! Field PRO2:CUIT is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('SelectPROVEEDORES',QuickWindow)            ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1                                    ! Will call: UpdatePROVEEDORES
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:PROVEEDORES.Close
  END
  IF SELF.Opened
    INIMgr.Update('SelectPROVEEDORES',QuickWindow)         ! Save window data to non-volatile store
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
    UpdatePROVEEDORES
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
    SELF.InsertControl=?Insert
  END


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
!!! Actualizacion CURSO_INSCRIPCION
!!! </summary>
UpdateCURSO_INSCRIPCION PROCEDURE 

CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
LOC:Monto            REAL                                  ! 
History::CURI:Record LIKE(CURI:RECORD),THREAD
QuickWindow          WINDOW('Actualizacion CURSO INSCRIPCION'),AT(,,287,164),FONT('MS Sans Serif',8,,FONT:regular), |
  RESIZE,CENTER,GRAY,IMM,MDI,HLP('UpdateCURSO_INSCRIPCION'),SYSTEM
                       BUTTON('&Aceptar'),AT(183,144,49,14),USE(?OK),LEFT,ICON('ok.ico'),CURSOR('mano.cur'),DEFAULT, |
  FLAT,MSG('Confirma y Actualiza el Formulario'),TIP('Confirma y Actualiza el Formulario')
                       BUTTON('&Cancelar'),AT(233,144,49,14),USE(?Cancel),LEFT,ICON('cancelar.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Cancela Operacion'),TIP('Cancela Operacion')
                       PROMPT('CUOTAS:'),AT(1,48),USE(?CURI:CUOTAS:Prompt),TRN
                       ENTRY(@n-14),AT(61,48,41,10),USE(CURI:CUOTAS),RIGHT(1)
                       PROMPT('OBSERVACION'),AT(3,63),USE(?Prompt5)
                       TEXT,AT(65,65,219,70),USE(CURI:OBSERVACION),BOXED
                       LINE,AT(3,139,286,0),USE(?Line1),COLOR(COLOR:Black)
                       PROMPT('INSCRIPTO:'),AT(1,18),USE(?CURI:ID_PROVEEDOR:Prompt),TRN
                       ENTRY(@n-14),AT(61,18,64,10),USE(CURI:ID_PROVEEDOR),RIGHT(1)
                       BUTTON('...'),AT(130,16,12,12),USE(?CallLookup:2)
                       STRING(@s50),AT(145,17),USE(PRO2:DESCRIPCION)
                       LINE,AT(0,30,284,0),USE(?Line2),COLOR(COLOR:Black)
                       PROMPT('IDCURSO:'),AT(1,2),USE(?CURI:IDCURSO:Prompt),TRN
                       ENTRY(@n-14),AT(61,2,64,10),USE(CURI:IDCURSO),RIGHT(1)
                       BUTTON('...'),AT(130,1,12,12),USE(?CallLookup)
                       STRING(@s50),AT(145,2),USE(CUR:DESCRIPCION)
                       PROMPT('DESCUENTO:'),AT(1,35),USE(?CURI:DESCUENTO:Prompt),TRN
                       ENTRY(@n-10.2),AT(61,33,40,10),USE(CURI:DESCUENTO),DECIMAL(12)
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
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
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
  GlobalErrors.SetProcedureName('UpdateCURSO_INSCRIPCION')
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
  SELF.AddHistoryFile(CURI:Record,History::CURI:Record)
  SELF.AddHistoryField(?CURI:CUOTAS,11)
  SELF.AddHistoryField(?CURI:OBSERVACION,13)
  SELF.AddHistoryField(?CURI:ID_PROVEEDOR,2)
  SELF.AddHistoryField(?CURI:IDCURSO,3)
  SELF.AddHistoryField(?CURI:DESCUENTO,9)
  SELF.AddUpdateFile(Access:CURSO_INSCRIPCION)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:CURSO.Open                                        ! File CURSO used by this procedure, so make sure it's RelationManager is open
  Relate:CURSO_CUOTA.SetOpenRelated()
  Relate:CURSO_CUOTA.Open                                  ! File CURSO_CUOTA used by this procedure, so make sure it's RelationManager is open
  Relate:CURSO_INSCRIPCION.Open                            ! File CURSO_INSCRIPCION used by this procedure, so make sure it's RelationManager is open
  Relate:CURSO_MODULOS.Open                                ! File CURSO_MODULOS used by this procedure, so make sure it's RelationManager is open
  Relate:PROVEEDORES.Open                                  ! File PROVEEDORES used by this procedure, so make sure it's RelationManager is open
  Relate:RANKING.Open                                      ! File RANKING used by this procedure, so make sure it's RelationManager is open
  Access:CURSO_INSCRIPCION_DETALLE.UseFile                 ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Primary &= Relate:CURSO_INSCRIPCION
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
    ?CURI:CUOTAS{PROP:ReadOnly} = True
    ?CURI:ID_PROVEEDOR{PROP:ReadOnly} = True
    DISABLE(?CallLookup:2)
    ?CURI:IDCURSO{PROP:ReadOnly} = True
    DISABLE(?CallLookup)
    ?CURI:DESCUENTO{PROP:ReadOnly} = True
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdateCURSO_INSCRIPCION',QuickWindow)      ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:CURSO.Close
    Relate:CURSO_CUOTA.Close
    Relate:CURSO_INSCRIPCION.Close
    Relate:CURSO_MODULOS.Close
    Relate:PROVEEDORES.Close
    Relate:RANKING.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateCURSO_INSCRIPCION',QuickWindow)   ! Save window data to non-volatile store
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
      SelectPROVEEDORES
      SelectCURSO
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
    OF ?OK
      IF SELF.REQUEST = INSERTRECORD THEN
          CURI:FECHA     = TODAY()
          CURI:HORA      = CLOCK()
          CURI:IDUSUARIO = GLO:IDUSUARIO
          !!! BUSCO MONTO DEL CURSO
          CUR:IDCURSO = CURI:IDCURSO
          ACCESS:CURSO.TRYFETCH(CUR:PK_CURSO)
          CURI:MONTO_TOTAL = CUR:MONTO_TOTAL
          IF CURI:CUOTAS <> 0 THEN
              CURI:MONTO_CUOTA = (CURI:MONTO_TOTAL-CURI:DESCUENTO)/CURI:CUOTAS
          END
          IF CURI:CUOTAS = 0 THEN
              CURI:CUOTAS = 1
          END
          !!! CARGO ID NUMERO INSCRIPCION
          RANKING{PROP:SQL} = 'CALL SP_GEN_CURSO_INSCRIPCION_ID'   
          NEXT(RANKING)
          CURI:IDINSCRIPCION = RAN:C1
          GLO:IDSOLICITUD = RAN:C1
      END
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?OK
      ThisWindow.Update()
      IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing THEN
         POST(EVENT:CloseWindow)
      END
    OF ?CURI:ID_PROVEEDOR
      PRO2:IDPROVEEDOR = CURI:ID_PROVEEDOR
      IF Access:PROVEEDORES.TryFetch(PRO2:PK_PROVEEDOR)
        IF SELF.Run(1,SelectRecord) = RequestCompleted
          CURI:ID_PROVEEDOR = PRO2:IDPROVEEDOR
        ELSE
          SELECT(?CURI:ID_PROVEEDOR)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
      IF Access:CURSO_INSCRIPCION.TryValidateField(2)      ! Attempt to validate CURI:ID_PROVEEDOR in CURSO_INSCRIPCION
        SELECT(?CURI:ID_PROVEEDOR)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?CURI:ID_PROVEEDOR
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?CURI:ID_PROVEEDOR{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?CallLookup:2
      ThisWindow.Update()
      PRO2:IDPROVEEDOR = CURI:ID_PROVEEDOR
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        CURI:ID_PROVEEDOR = PRO2:IDPROVEEDOR
      END
      ThisWindow.Reset(1)
    OF ?CURI:IDCURSO
      CUR:IDCURSO = CURI:IDCURSO
      IF Access:CURSO.TryFetch(CUR:PK_CURSO)
        IF SELF.Run(2,SelectRecord) = RequestCompleted
          CURI:IDCURSO = CUR:IDCURSO
        ELSE
          SELECT(?CURI:IDCURSO)
          CYCLE
        END
      END
      ThisWindow.Reset(0)
      IF Access:CURSO_INSCRIPCION.TryValidateField(3)      ! Attempt to validate CURI:IDCURSO in CURSO_INSCRIPCION
        SELECT(?CURI:IDCURSO)
        QuickWindow{PROP:AcceptAll} = False
        CYCLE
      ELSE
        FieldColorQueue.Feq = ?CURI:IDCURSO
        GET(FieldColorQueue, FieldColorQueue.Feq)
        IF ERRORCODE() = 0
          ?CURI:IDCURSO{PROP:FontColor} = FieldColorQueue.OldColor
          DELETE(FieldColorQueue)
        END
      END
    OF ?CallLookup
      ThisWindow.Update()
      CUR:IDCURSO = CURI:IDCURSO
      IF SELF.Run(2,SelectRecord) = RequestCompleted
        CURI:IDCURSO = CUR:IDCURSO
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
      !!! Cargo los modulos en Detalle Inscripción
      CUR2:IDCURSO = CURI:IDCURSO
      SET(CUR2:FK_CURSO_MODULOS_CURSO,CUR2:FK_CURSO_MODULOS_CURSO)
      LOOP
          IF ACCESS:CURSO_MODULOS.NEXT() THEN BREAK.
          IF CUR2:IDCURSO <> CURI:IDCURSO THEN BREAK.
          CURD:IDINSCRIPCION         = GLO:IDSOLICITUD 
          CURD:IDCURSO               = CURI:IDCURSO
          CURD:ID_MODULO             = CUR2:ID_MODULO
          CURD:FECHA_INSCRIPCION     = CURI:FECHA
          CURD:MONTO                 = CUR2:MONTO  
          CURD:PAGADO                = ''
          CURD:CANTIDAD_CUOTAS       = CURI:CUOTAS
          CURD:SALDO_CUOTAS          = CURI:CUOTAS
          ACCESS:CURSO_INSCRIPCION_DETALLE.INSERT()
          !!! CARGO CUOTAS.
          Loop i# = 1 to CURI:CUOTAS
              CUR1:IDINSCRIPCION = CURD:IDINSCRIPCION
              CUR1:IDCURSO       = CURD:IDCURSO
              CUR1:IDMODULO      = CURD:ID_MODULO
              CUR1:IDCUOTA       = i#
              CUR1:MONTO         = CURD:MONTO/CURD:CANTIDAD_CUOTAS
              CUR1:DESCUENTO = 0
              ACCESS:CURSO_CUOTA.INSERT()
              
          end
  
      END !! LOOP
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
!!! Select a CURSO Record
!!! </summary>
SelectCURSO PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(CURSO)
                       PROJECT(CUR:IDCURSO)
                       PROJECT(CUR:DESCRIPCION)
                       PROJECT(CUR:PRESENCIAL)
                       PROJECT(CUR:CANTIDAD_HORAS)
                       PROJECT(CUR:MONTO_TOTAL)
                       PROJECT(CUR:OBSERVACION)
                       PROJECT(CUR:ID_TIPO_CURSO)
                       PROJECT(CUR:CANTIDAD)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
CUR:IDCURSO            LIKE(CUR:IDCURSO)              !List box control field - type derived from field
CUR:DESCRIPCION        LIKE(CUR:DESCRIPCION)          !List box control field - type derived from field
CUR:PRESENCIAL         LIKE(CUR:PRESENCIAL)           !List box control field - type derived from field
CUR:CANTIDAD_HORAS     LIKE(CUR:CANTIDAD_HORAS)       !List box control field - type derived from field
CUR:MONTO_TOTAL        LIKE(CUR:MONTO_TOTAL)          !List box control field - type derived from field
CUR:OBSERVACION        LIKE(CUR:OBSERVACION)          !List box control field - type derived from field
CUR:ID_TIPO_CURSO      LIKE(CUR:ID_TIPO_CURSO)        !List box control field - type derived from field
CUR:CANTIDAD           LIKE(CUR:CANTIDAD)             !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Select a CURSO Record'),AT(,,358,198),FONT('MS Sans Serif',8,,FONT:regular),RESIZE, |
  CENTER,GRAY,IMM,MDI,HLP('SelectCURSO'),SYSTEM
                       LIST,AT(8,39,342,115),USE(?Browse:1),HVSCROLL,FORMAT('43L(2)|M~Nº~C(0)@n-7@206L(2)|M~DE' & |
  'SCRIPCION~@s50@52L(2)|M~PRESENCIAL~@s2@81L(12)|M~CANTIDAD HORAS~C(0)@n-7.2@69L(1)|M~' & |
  'MONTO TOTAL~C(0)@n$-10.2@153L(2)|M~OBSERVACION~@s100@64R(2)|M~ID TIPO CURSO~C(0)@n-1' & |
  '4@64L(2)|M~CANTIDAD~C(0)@n-5@'),FROM(Queue:Browse:1),IMM,MSG('Administrador de CURSO')
                       BUTTON('&Elegir'),AT(301,158,49,14),USE(?Select:2),LEFT,ICON('e.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Seleccionar'),TIP('Seleccionar')
                       SHEET,AT(4,4,350,172),USE(?CurrentTab)
                         TAB('Id Curso'),USE(?Tab:1)
                         END
                         TAB('Descripción'),USE(?Tab:2)
                           PROMPT('DESCRIPCION:'),AT(8,25),USE(?CUR:DESCRIPCION:Prompt)
                           ENTRY(@s50),AT(60,25,148,10),USE(CUR:DESCRIPCION)
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
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::Sort1:Locator  FilterLocatorClass                    ! Conditional Locator - CHOICE(?CurrentTab) = 2
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
  GlobalErrors.SetProcedureName('SelectCURSO')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('CUR:IDCURSO',CUR:IDCURSO)                          ! Added by: BrowseBox(ABC)
  BIND('CUR:CANTIDAD_HORAS',CUR:CANTIDAD_HORAS)            ! Added by: BrowseBox(ABC)
  BIND('CUR:MONTO_TOTAL',CUR:MONTO_TOTAL)                  ! Added by: BrowseBox(ABC)
  BIND('CUR:ID_TIPO_CURSO',CUR:ID_TIPO_CURSO)              ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:CURSO.Open                                        ! File CURSO used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:CURSO,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,CUR:IDX_CURSO_DESCRIPCION)            ! Add the sort order for CUR:IDX_CURSO_DESCRIPCION for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(?CUR:DESCRIPCION,CUR:DESCRIPCION,,BRW1) ! Initialize the browse locator using ?CUR:DESCRIPCION using key: CUR:IDX_CURSO_DESCRIPCION , CUR:DESCRIPCION
  BRW1.AddSortOrder(,CUR:PK_CURSO)                         ! Add the sort order for CUR:PK_CURSO for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(,CUR:IDCURSO,,BRW1)             ! Initialize the browse locator using  using key: CUR:PK_CURSO , CUR:IDCURSO
  BRW1.AddField(CUR:IDCURSO,BRW1.Q.CUR:IDCURSO)            ! Field CUR:IDCURSO is a hot field or requires assignment from browse
  BRW1.AddField(CUR:DESCRIPCION,BRW1.Q.CUR:DESCRIPCION)    ! Field CUR:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(CUR:PRESENCIAL,BRW1.Q.CUR:PRESENCIAL)      ! Field CUR:PRESENCIAL is a hot field or requires assignment from browse
  BRW1.AddField(CUR:CANTIDAD_HORAS,BRW1.Q.CUR:CANTIDAD_HORAS) ! Field CUR:CANTIDAD_HORAS is a hot field or requires assignment from browse
  BRW1.AddField(CUR:MONTO_TOTAL,BRW1.Q.CUR:MONTO_TOTAL)    ! Field CUR:MONTO_TOTAL is a hot field or requires assignment from browse
  BRW1.AddField(CUR:OBSERVACION,BRW1.Q.CUR:OBSERVACION)    ! Field CUR:OBSERVACION is a hot field or requires assignment from browse
  BRW1.AddField(CUR:ID_TIPO_CURSO,BRW1.Q.CUR:ID_TIPO_CURSO) ! Field CUR:ID_TIPO_CURSO is a hot field or requires assignment from browse
  BRW1.AddField(CUR:CANTIDAD,BRW1.Q.CUR:CANTIDAD)          ! Field CUR:CANTIDAD is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('SelectCURSO',QuickWindow)                  ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:CURSO.Close
  END
  IF SELF.Opened
    INIMgr.Update('SelectCURSO',QuickWindow)               ! Save window data to non-volatile store
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
!!! Select a SUBCUENTAS Record
!!! </summary>
SelectSUBCUENTAS_INGRESOS_SIN_FILTRO PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(SUBCUENTAS)
                       PROJECT(SUB:DESCRIPCION)
                       PROJECT(SUB:IDSUBCUENTA)
                       PROJECT(SUB:IDCUENTA)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
SUB:DESCRIPCION        LIKE(SUB:DESCRIPCION)          !List box control field - type derived from field
SUB:IDSUBCUENTA        LIKE(SUB:IDSUBCUENTA)          !List box control field - type derived from field
SUB:IDCUENTA           LIKE(SUB:IDCUENTA)             !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Select a SUBCUENTAS Record'),AT(,,236,198),FONT('MS Sans Serif',8,,FONT:regular),RESIZE, |
  CENTER,GRAY,IMM,MDI,HLP('SelectSUBCUENTAS'),SYSTEM
                       LIST,AT(8,30,220,124),USE(?Browse:1),HVSCROLL,FORMAT('163L(2)|M~DESCRIPCION~@s50@64L(2)' & |
  '|M~IDSUBCUENTA~C(0)@n-5@56L(2)|M~IDCUENTA~C(0)@n-5@'),FROM(Queue:Browse:1),IMM,MSG('Administra' & |
  'dor de SUBCUENTAS')
                       BUTTON('&Elegir'),AT(179,158,49,14),USE(?Select:2),LEFT,ICON('e.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Seleccionar'),TIP('Seleccionar')
                       SHEET,AT(4,4,228,172),USE(?CurrentTab)
                         TAB('CUENTA'),USE(?Tab:2)
                         END
                       END
                       BUTTON('&Salir'),AT(183,180,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
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
  GlobalErrors.SetProcedureName('SelectSUBCUENTAS_INGRESOS_SIN_FILTRO')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('SUB:IDSUBCUENTA',SUB:IDSUBCUENTA)                  ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:SUBCUENTAS.Open                                   ! File SUBCUENTAS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:SUBCUENTAS,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,SUB:INTEG_113)                        ! Add the sort order for SUB:INTEG_113 for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,SUB:IDSUBCUENTA,,BRW1)         ! Initialize the browse locator using  using key: SUB:INTEG_113 , SUB:IDSUBCUENTA
  BRW1.AddField(SUB:DESCRIPCION,BRW1.Q.SUB:DESCRIPCION)    ! Field SUB:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(SUB:IDSUBCUENTA,BRW1.Q.SUB:IDSUBCUENTA)    ! Field SUB:IDSUBCUENTA is a hot field or requires assignment from browse
  BRW1.AddField(SUB:IDCUENTA,BRW1.Q.SUB:IDCUENTA)          ! Field SUB:IDCUENTA is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('SelectSUBCUENTAS_INGRESOS_SIN_FILTRO',QuickWindow) ! Restore window settings from non-volatile store
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
    Relate:SUBCUENTAS.Close
  END
  IF SELF.Opened
    INIMgr.Update('SelectSUBCUENTAS_INGRESOS_SIN_FILTRO',QuickWindow) ! Save window data to non-volatile store
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


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window


!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the CURSO_INSCRIPCION File
!!! </summary>
CURSOS_INSCRIPCION PROCEDURE 

!--------------------------------------------------------------------------
! Tagging Data
!--------------------------------------------------------------------------
DASBRW::11:TAGFLAG         BYTE(0)
DASBRW::11:TAGMOUSE        BYTE(0)
DASBRW::11:TAGDISPSTATUS   BYTE(0)
DASBRW::11:QUEUE          QUEUE
PUNTERO                       LIKE(PUNTERO)
                          END
!--------------------------------------------------------------------------
! Tagging Data
!--------------------------------------------------------------------------
CurrentTab           STRING(80)                            ! 
LOC:CANTIDAD         LONG                                  ! 
T                    STRING(1)                             ! 
LOC:NOMBRE           CSTRING(51)                           ! 
BRW1::View:Browse    VIEW(CURSO_INSCRIPCION)
                       PROJECT(CURI:IDINSCRIPCION)
                       PROJECT(CURI:MONTO_TOTAL)
                       PROJECT(CURI:PAGADO_TOTAL)
                       PROJECT(CURI:FECHA)
                       PROJECT(CURI:TERMINADO)
                       PROJECT(CURI:DESCUENTO)
                       PROJECT(CURI:IDCURSO)
                       PROJECT(CURI:ID_PROVEEDOR)
                       JOIN(CUR:PK_CURSO,CURI:IDCURSO)
                         PROJECT(CUR:DESCRIPCION)
                         PROJECT(CUR:FECHA_FIN)
                         PROJECT(CUR:IDCURSO)
                       END
                       JOIN(PRO2:PK_PROVEEDOR,CURI:ID_PROVEEDOR)
                         PROJECT(PRO2:DESCRIPCION)
                         PROJECT(PRO2:IDPROVEEDOR)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
T                      LIKE(T)                        !List box control field - type derived from local data
CURI:IDINSCRIPCION     LIKE(CURI:IDINSCRIPCION)       !List box control field - type derived from field
PRO2:DESCRIPCION       LIKE(PRO2:DESCRIPCION)         !List box control field - type derived from field
CUR:DESCRIPCION        LIKE(CUR:DESCRIPCION)          !List box control field - type derived from field
CURI:MONTO_TOTAL       LIKE(CURI:MONTO_TOTAL)         !List box control field - type derived from field
CURI:PAGADO_TOTAL      LIKE(CURI:PAGADO_TOTAL)        !List box control field - type derived from field
CURI:FECHA             LIKE(CURI:FECHA)               !List box control field - type derived from field
CURI:TERMINADO         LIKE(CURI:TERMINADO)           !List box control field - type derived from field
CURI:DESCUENTO         LIKE(CURI:DESCUENTO)           !List box control field - type derived from field
CUR:FECHA_FIN          LIKE(CUR:FECHA_FIN)            !List box control field - type derived from field
CURI:IDCURSO           LIKE(CURI:IDCURSO)             !Browse key field - type derived from field
CURI:ID_PROVEEDOR      LIKE(CURI:ID_PROVEEDOR)        !Browse key field - type derived from field
CUR:IDCURSO            LIKE(CUR:IDCURSO)              !Related join file key field - type derived from field
PRO2:IDPROVEEDOR       LIKE(PRO2:IDPROVEEDOR)         !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW10::View:Browse   VIEW(CURSO_INSCRIPCION_DETALLE)
                       PROJECT(CURD:PRESENTE)
                       PROJECT(CURD:PAGADO)
                       PROJECT(CURD:FECHA_INSCRIPCION)
                       PROJECT(CURD:NOTA)
                       PROJECT(CURD:FECHA_PAGO)
                       PROJECT(CURD:IDINSCRIPCION)
                       PROJECT(CURD:IDCURSO)
                       PROJECT(CURD:ID_MODULO)
                       JOIN(CUR2:PK_CURSO_MODULOS,CURD:ID_MODULO)
                         PROJECT(CUR2:NUMERO_MODULO)
                         PROJECT(CUR2:DESCRIPCION)
                         PROJECT(CUR2:ID_MODULO)
                       END
                     END
Queue:Browse         QUEUE                            !Queue declaration for browse/combo box using ?List
CUR2:NUMERO_MODULO     LIKE(CUR2:NUMERO_MODULO)       !List box control field - type derived from field
CUR2:NUMERO_MODULO_Icon LONG                          !Entry's icon ID
CUR2:DESCRIPCION       LIKE(CUR2:DESCRIPCION)         !List box control field - type derived from field
CURD:PRESENTE          LIKE(CURD:PRESENTE)            !List box control field - type derived from field
CURD:PAGADO            LIKE(CURD:PAGADO)              !List box control field - type derived from field
CURD:FECHA_INSCRIPCION LIKE(CURD:FECHA_INSCRIPCION)   !List box control field - type derived from field
CURD:NOTA              LIKE(CURD:NOTA)                !List box control field - type derived from field
CURD:FECHA_PAGO        LIKE(CURD:FECHA_PAGO)          !List box control field - type derived from field
CURD:IDINSCRIPCION     LIKE(CURD:IDINSCRIPCION)       !List box control field - type derived from field
CURD:IDCURSO           LIKE(CURD:IDCURSO)             !Primary key field - type derived from field
CURD:ID_MODULO         LIKE(CURD:ID_MODULO)           !Primary key field - type derived from field
CUR2:ID_MODULO         LIKE(CUR2:ID_MODULO)           !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Inscripción a Curso'),AT(,,527,336),FONT('MS Sans Serif',8,,FONT:regular),RESIZE,CENTER, |
  GRAY,IMM,MDI,HLP('Curso_Incripcion'),SYSTEM
                       LIST,AT(8,38,503,131),USE(?Browse:1),HVSCROLL,FORMAT('13L(2)|M@s1@34L(2)|M~Nº INSC~@n-7' & |
  '@200L(2)|M~INSCRIPTO~C(0)@s50@200L(2)|M~CURSO~C(0)@s50@66L(1)|M~MONTO_TOTAL~C(0)@n$-' & |
  '10.2@71L(1)|M~PAGADO_TOTAL~C(0)@s2@80L(2)|M~FECHA~C(0)@d17@49L(2)|M~TERMINADO~@s2@40' & |
  'D(12)|M~DESCUENTO~C(0)@n-7.2@40L(1)|M~FECHA FIN~C(0)@d17@'),FROM(Queue:Browse:1),IMM,MSG('Administra' & |
  'dor de CURSO_INSCRIPCION')
                       BUTTON('&Elegir'),AT(254,173,49,14),USE(?Select:2),LEFT,ICON('e.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Seleccionar'),TIP('Seleccionar')
                       BUTTON('&Ver'),AT(306,173,49,14),USE(?View:3),LEFT,ICON('v.ico'),CURSOR('mano.cur'),FLAT,MSG('Visualizar'), |
  TIP('Visualizar')
                       BUTTON('&Agregar'),AT(360,173,49,14),USE(?Insert:4),LEFT,ICON('a.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Agrega Registro'),TIP('Agrega Registro')
                       BUTTON('&Cambiar'),AT(412,173,49,14),USE(?Change:4),LEFT,ICON('c.ico'),CURSOR('mano.cur'), |
  DEFAULT,FLAT,MSG('Cambia Registro'),TIP('Cambia Registro')
                       BUTTON('&Borrar'),AT(466,173,49,14),USE(?Delete:4),LEFT,ICON('b.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Borra Registro'),TIP('Borra Registro')
                       GROUP('Módulos Inscriptos'),AT(1,194,519,111),USE(?Group1),BOXED
                         LIST,AT(5,205,510,94),USE(?List),FORMAT('37L|MI~Nº~L(2)@n-5@197L|M~MODULO~@s50@46L|M~PR' & |
  'ESENTE~L(2)@s2@38L|M~PAGADO~L(2)@s2@77L|M~FECHA INSCRIPCION~L(2)@d17@43L|M~NOTA~L(2)' & |
  '@n-7.2@40R|M~FECHA_PAGO~L(2)@d17@56R|M~IDINSCRIPCION~L(2)@n-14@'),FROM(Queue:Browse),IMM, |
  MSG('Browsing Records')
                       END
                       BUTTON('&Marcar'),AT(3,307,68,14),USE(?DASTAG)
                       BUTTON('Todo'),AT(71,307,68,14),USE(?DASTAGAll)
                       BUTTON('Identificación'),AT(391,312,82,22),USE(?Button7),LEFT,ICON('id_card.ico'),FLAT
                       BUTTON('Desmarcar Todo'),AT(139,307,68,14),USE(?DASUNTAGALL)
                       BUTTON('&Rev tags'),AT(83,323,50,13),USE(?DASREVTAG),DISABLE,HIDE
                       BUTTON('Ver Marcados'),AT(207,307,68,14),USE(?DASSHOWTAG)
                       BUTTON('E&xportar'),AT(53,173,52,15),USE(?EvoExportar),LEFT,ICON('export.ico'),FLAT
                       BUTTON('&Filtro'),AT(3,173,49,14),USE(?Query),LEFT,ICON('qbe.ico'),FLAT
                       PROMPT('Cantidad:'),AT(181,176),USE(?Prompt1)
                       STRING(@n-5),AT(213,176),USE(LOC:CANTIDAD)
                       SHEET,AT(0,2,520,190),USE(?CurrentTab)
                         TAB('ID INSCRIPCION'),USE(?Tab:1)
                           PROMPT('NOMBRE:'),AT(4,22),USE(?LOC:NOMBRE:Prompt)
                           ENTRY(@s50),AT(47,22,173,10),USE(LOC:NOMBRE),UPR
                           BUTTON('Buscar Nombre que comience con...'),AT(225,21,146,14),USE(?Button16),LEFT,ICON(ICON:Zoom), |
  FLAT
                         END
                         TAB('CURSO'),USE(?Tab:2)
                         END
                         TAB('INSCRIPTO'),USE(?Tab:3)
                         END
                         TAB('CERTIFICADO TOTAL CURSO'),USE(?Tab:4)
                           BUTTON('Imprimir Certificado'),AT(109,173,67,17),USE(?Button15),LEFT,ICON(ICON:Print1),FLAT
                         END
                       END
                       BUTTON('&Salir'),AT(479,316,49,14),USE(?Close),LEFT,ICON('salir.ico'),CURSOR('mano.cur'),FLAT, |
  MSG('Salir'),TIP('Salir')
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
TakeFieldEvent         PROCEDURE(),BYTE,PROC,DERIVED
TakeNewSelection       PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
QBE8                 QueryListClass                        ! QBE List Class. 
QBV8                 QueryListVisual                       ! QBE Visual Class
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
ResetFromView          PROCEDURE(),DERIVED
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
SetQueueRecord         PROCEDURE(),DERIVED
TakeKey                PROCEDURE(),BYTE,PROC,DERIVED
ValidateRecord         PROCEDURE(),BYTE,DERIVED
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::Sort1:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 2
BRW1::Sort2:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 3
BRW1::Sort3:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 4
BRW10                CLASS(BrowseClass)                    ! Browse using ?List
Q                      &Queue:Browse                  !Reference to browse queue
SetQueueRecord         PROCEDURE(),DERIVED
                     END

BRW10::Sort0:Locator StepLocatorClass                      ! Default Locator
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

!--------------------------------------------------------------------------
! DAS_Tagging
!--------------------------------------------------------------------------
DASBRW::11:DASTAGONOFF Routine
  GET(Queue:Browse:1,CHOICE(?Browse:1))
  BRW1.UpdateBuffer
   TAGS.PUNTERO = CURI:IDINSCRIPCION
   GET(TAGS,TAGS.PUNTERO)
  IF ERRORCODE()
     TAGS.PUNTERO = CURI:IDINSCRIPCION
     ADD(TAGS,TAGS.PUNTERO)
    T = '*'
  ELSE
    DELETE(TAGS)
    T = ''
  END
    Queue:Browse:1.T = T
  PUT(Queue:Browse:1)
  ThisWindow.Reset(1)
  SELECT(?Browse:1,CHOICE(?Browse:1))
  IF DASBRW::11:TAGMOUSE = 1 THEN
    DASBRW::11:TAGMOUSE = 0
  ELSE
  DASBRW::11:TAGFLAG = 1
  POST(EVENT:ScrollDown,?Browse:1)
  END
DASBRW::11:DASTAGALL Routine
  ?Browse:1{PROPLIST:MouseDownField} = 2
  SETCURSOR(CURSOR:Wait)
  BRW1.Reset
  FREE(TAGS)
  LOOP
    NEXT(BRW1::View:Browse)
    IF ERRORCODE()
      BREAK
    END
     TAGS.PUNTERO = CURI:IDINSCRIPCION
     ADD(TAGS,TAGS.PUNTERO)
  END
  SETCURSOR
  BRW1.ResetSort(1)
  ThisWindow.Reset(1)
  SELECT(?Browse:1,CHOICE(?Browse:1))
DASBRW::11:DASUNTAGALL Routine
  ?Browse:1{PROPLIST:MouseDownField} = 2
  SETCURSOR(CURSOR:Wait)
  FREE(TAGS)
  BRW1.Reset
  SETCURSOR
  BRW1.ResetSort(1)
  ThisWindow.Reset(1)
  SELECT(?Browse:1,CHOICE(?Browse:1))
DASBRW::11:DASREVTAGALL Routine
  ?Browse:1{PROPLIST:MouseDownField} = 2
  SETCURSOR(CURSOR:Wait)
  FREE(DASBRW::11:QUEUE)
  LOOP QR# = 1 TO RECORDS(TAGS)
    GET(TAGS,QR#)
    DASBRW::11:QUEUE = TAGS
    ADD(DASBRW::11:QUEUE)
  END
  FREE(TAGS)
  BRW1.Reset
  LOOP
    NEXT(BRW1::View:Browse)
    IF ERRORCODE()
      BREAK
    END
     DASBRW::11:QUEUE.PUNTERO = CURI:IDINSCRIPCION
     GET(DASBRW::11:QUEUE,DASBRW::11:QUEUE.PUNTERO)
    IF ERRORCODE()
       TAGS.PUNTERO = CURI:IDINSCRIPCION
       ADD(TAGS,TAGS.PUNTERO)
    END
  END
  SETCURSOR
  BRW1.ResetSort(1)
  ThisWindow.Reset(1)
  SELECT(?Browse:1,CHOICE(?Browse:1))
DASBRW::11:DASSHOWTAG Routine
   CASE DASBRW::11:TAGDISPSTATUS
   OF 0
      DASBRW::11:TAGDISPSTATUS = 1    ! display tagged
      ?DASSHOWTAG{PROP:Text} = 'Showing Tagged'
      ?DASSHOWTAG{PROP:Msg}  = 'Showing Tagged'
      ?DASSHOWTAG{PROP:Tip}  = 'Showing Tagged'
   OF 1
      DASBRW::11:TAGDISPSTATUS = 2    ! display untagged
      ?DASSHOWTAG{PROP:Text} = 'Showing UnTagged'
      ?DASSHOWTAG{PROP:Msg}  = 'Showing UnTagged'
      ?DASSHOWTAG{PROP:Tip}  = 'Showing UnTagged'
   OF 2
      DASBRW::11:TAGDISPSTATUS = 0    ! display all
      ?DASSHOWTAG{PROP:Text} = 'Show All'
      ?DASSHOWTAG{PROP:Msg}  = 'Show All'
      ?DASSHOWTAG{PROP:Tip}  = 'Show All'
   END
   DISPLAY(?DASSHOWTAG{PROP:Text})
   BRW1.ResetSort(1)
   SELECT(?Browse:1,CHOICE(?Browse:1))
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
  Q9:FieldPar  = '1,2,3,4,5,6,7,8,9,10,'
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
  ADD(QPar9)   ! 29 Gestion022.clw
 !!!!!
 
 
  FREE(QPar29)
       Qp29:F2N  = ''
  Qp29:F2P  = '@s1'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'Nº INSC'
  Qp29:F2P  = '@n-7'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'INSCRIPTO'
  Qp29:F2P  = '@s50'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'CURSO'
  Qp29:F2P  = '@s50'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'MONTO_TOTAL'
  Qp29:F2P  = '@n$-10.2'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'PAGADO_TOTAL'
  Qp29:F2P  = '@s2'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'FECHA'
  Qp29:F2P  = '@d17'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'TERMINADO'
  Qp29:F2P  = '@s2'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'DESCUENTO'
  Qp29:F2P  = '@n-7.2'
  Qp29:F2T  = '0'
  ADD(QPar29)
       Qp29:F2N  = 'FECHA FIN'
  Qp29:F2P  = '@d17'
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
  Loc::Titulo9 ='Administrator the CURSO_INSCRIPCION'
 
 SavPath9 = PATH()
  Exportar(Loc::QHlist9,BRW1.Q,QPar9,0,Loc::Titulo9,Evo::Group9)
 IF Not EC::LoadI_9 Then  BRW1.FileLoaded=false.
 SETPATH(SavPath9)
 !!!! Fin Routina Templates Clarion

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('CURSOS_INSCRIPCION')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('T',T)                                              ! Added by: BrowseBox(ABC)
  BIND('CURI:MONTO_TOTAL',CURI:MONTO_TOTAL)                ! Added by: BrowseBox(ABC)
  BIND('CURI:PAGADO_TOTAL',CURI:PAGADO_TOTAL)              ! Added by: BrowseBox(ABC)
  BIND('CUR:FECHA_FIN',CUR:FECHA_FIN)                      ! Added by: BrowseBox(ABC)
  BIND('CURI:ID_PROVEEDOR',CURI:ID_PROVEEDOR)              ! Added by: BrowseBox(ABC)
  BIND('CUR:IDCURSO',CUR:IDCURSO)                          ! Added by: BrowseBox(ABC)
  BIND('CUR2:NUMERO_MODULO',CUR2:NUMERO_MODULO)            ! Added by: BrowseBox(ABC)
  BIND('CURD:FECHA_INSCRIPCION',CURD:FECHA_INSCRIPCION)    ! Added by: BrowseBox(ABC)
  BIND('CURD:FECHA_PAGO',CURD:FECHA_PAGO)                  ! Added by: BrowseBox(ABC)
  BIND('CURD:ID_MODULO',CURD:ID_MODULO)                    ! Added by: BrowseBox(ABC)
  BIND('CUR2:ID_MODULO',CUR2:ID_MODULO)                    ! Added by: BrowseBox(ABC)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:CURSO_INSCRIPCION.Open                            ! File CURSO_INSCRIPCION used by this procedure, so make sure it's RelationManager is open
  Relate:CURSO_INSCRIPCION_DETALLE.SetOpenRelated()
  Relate:CURSO_INSCRIPCION_DETALLE.Open                    ! File CURSO_INSCRIPCION_DETALLE used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:CURSO_INSCRIPCION,SELF) ! Initialize the browse manager
  BRW10.Init(?List,Queue:Browse.ViewPosition,BRW10::View:Browse,Queue:Browse,Relate:CURSO_INSCRIPCION_DETALLE,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  QBE8.Init(QBV8, INIMgr,'CURSOS_INSCRIPCION', GlobalErrors)
  QBE8.QkSupport = True
  QBE8.QkMenuIcon = 'QkQBE.ico'
  QBE8.QkIcon = 'QkLoad.ico'
  BRW1.Q &= Queue:Browse:1
  BRW1.RetainRow = 0
  BRW1.AddSortOrder(,CURI:FK_CURSO_INSCRIPCION_CURSO)      ! Add the sort order for CURI:FK_CURSO_INSCRIPCION_CURSO for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,CURI:IDCURSO,,BRW1)            ! Initialize the browse locator using  using key: CURI:FK_CURSO_INSCRIPCION_CURSO , CURI:IDCURSO
  BRW1.SetFilter('(CUR:FECHA_FIN >= TODAY())')             ! Apply filter expression to browse
  BRW1.AddSortOrder(,CURI:FK_CURSO_INSCRIPCION_PROVEEDOR)  ! Add the sort order for CURI:FK_CURSO_INSCRIPCION_PROVEEDOR for sort order 2
  BRW1.AddLocator(BRW1::Sort2:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort2:Locator.Init(,CURI:ID_PROVEEDOR,,BRW1)       ! Initialize the browse locator using  using key: CURI:FK_CURSO_INSCRIPCION_PROVEEDOR , CURI:ID_PROVEEDOR
  BRW1.SetFilter('(CUR:FECHA_FIN >= TODAY())')             ! Apply filter expression to browse
  BRW1.AddSortOrder(,CURI:FK_CURSO_INSCRIPCION_CURSO)      ! Add the sort order for CURI:FK_CURSO_INSCRIPCION_CURSO for sort order 3
  BRW1.AddLocator(BRW1::Sort3:Locator)                     ! Browse has a locator for sort order 3
  BRW1::Sort3:Locator.Init(,CURI:IDCURSO,,BRW1)            ! Initialize the browse locator using  using key: CURI:FK_CURSO_INSCRIPCION_CURSO , CURI:IDCURSO
  BRW1.SetFilter('(CUR:FECHA_FIN << TODAY())')             ! Apply filter expression to browse
  BRW1.AddSortOrder(,CURI:PK_CURSO_INSCRIPCION)            ! Add the sort order for CURI:PK_CURSO_INSCRIPCION for sort order 4
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 4
  BRW1::Sort0:Locator.Init(,CURI:IDINSCRIPCION,,BRW1)      ! Initialize the browse locator using  using key: CURI:PK_CURSO_INSCRIPCION , CURI:IDINSCRIPCION
  BRW1.SetFilter('(CUR:FECHA_FIN >= TODAY())')             ! Apply filter expression to browse
  BRW1.AddField(T,BRW1.Q.T)                                ! Field T is a hot field or requires assignment from browse
  BRW1.AddField(CURI:IDINSCRIPCION,BRW1.Q.CURI:IDINSCRIPCION) ! Field CURI:IDINSCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(PRO2:DESCRIPCION,BRW1.Q.PRO2:DESCRIPCION)  ! Field PRO2:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(CUR:DESCRIPCION,BRW1.Q.CUR:DESCRIPCION)    ! Field CUR:DESCRIPCION is a hot field or requires assignment from browse
  BRW1.AddField(CURI:MONTO_TOTAL,BRW1.Q.CURI:MONTO_TOTAL)  ! Field CURI:MONTO_TOTAL is a hot field or requires assignment from browse
  BRW1.AddField(CURI:PAGADO_TOTAL,BRW1.Q.CURI:PAGADO_TOTAL) ! Field CURI:PAGADO_TOTAL is a hot field or requires assignment from browse
  BRW1.AddField(CURI:FECHA,BRW1.Q.CURI:FECHA)              ! Field CURI:FECHA is a hot field or requires assignment from browse
  BRW1.AddField(CURI:TERMINADO,BRW1.Q.CURI:TERMINADO)      ! Field CURI:TERMINADO is a hot field or requires assignment from browse
  BRW1.AddField(CURI:DESCUENTO,BRW1.Q.CURI:DESCUENTO)      ! Field CURI:DESCUENTO is a hot field or requires assignment from browse
  BRW1.AddField(CUR:FECHA_FIN,BRW1.Q.CUR:FECHA_FIN)        ! Field CUR:FECHA_FIN is a hot field or requires assignment from browse
  BRW1.AddField(CURI:IDCURSO,BRW1.Q.CURI:IDCURSO)          ! Field CURI:IDCURSO is a hot field or requires assignment from browse
  BRW1.AddField(CURI:ID_PROVEEDOR,BRW1.Q.CURI:ID_PROVEEDOR) ! Field CURI:ID_PROVEEDOR is a hot field or requires assignment from browse
  BRW1.AddField(CUR:IDCURSO,BRW1.Q.CUR:IDCURSO)            ! Field CUR:IDCURSO is a hot field or requires assignment from browse
  BRW1.AddField(PRO2:IDPROVEEDOR,BRW1.Q.PRO2:IDPROVEEDOR)  ! Field PRO2:IDPROVEEDOR is a hot field or requires assignment from browse
  BRW10.Q &= Queue:Browse
  BRW10.RetainRow = 0
  BRW10.AddSortOrder(,CURD:PK_CURSO_INSCRIPCION_DETALLE)   ! Add the sort order for CURD:PK_CURSO_INSCRIPCION_DETALLE for sort order 1
  BRW10.AddRange(CURD:IDINSCRIPCION,Relate:CURSO_INSCRIPCION_DETALLE,Relate:CURSO_INSCRIPCION) ! Add file relationship range limit for sort order 1
  BRW10.AddLocator(BRW10::Sort0:Locator)                   ! Browse has a locator for sort order 1
  BRW10::Sort0:Locator.Init(,CURD:IDCURSO,,BRW10)          ! Initialize the browse locator using  using key: CURD:PK_CURSO_INSCRIPCION_DETALLE , CURD:IDCURSO
  ?List{PROP:IconList,1} = '~aceptar.ico'
  ?List{PROP:IconList,2} = '~cancelar.ico'
  BRW10.AddField(CUR2:NUMERO_MODULO,BRW10.Q.CUR2:NUMERO_MODULO) ! Field CUR2:NUMERO_MODULO is a hot field or requires assignment from browse
  BRW10.AddField(CUR2:DESCRIPCION,BRW10.Q.CUR2:DESCRIPCION) ! Field CUR2:DESCRIPCION is a hot field or requires assignment from browse
  BRW10.AddField(CURD:PRESENTE,BRW10.Q.CURD:PRESENTE)      ! Field CURD:PRESENTE is a hot field or requires assignment from browse
  BRW10.AddField(CURD:PAGADO,BRW10.Q.CURD:PAGADO)          ! Field CURD:PAGADO is a hot field or requires assignment from browse
  BRW10.AddField(CURD:FECHA_INSCRIPCION,BRW10.Q.CURD:FECHA_INSCRIPCION) ! Field CURD:FECHA_INSCRIPCION is a hot field or requires assignment from browse
  BRW10.AddField(CURD:NOTA,BRW10.Q.CURD:NOTA)              ! Field CURD:NOTA is a hot field or requires assignment from browse
  BRW10.AddField(CURD:FECHA_PAGO,BRW10.Q.CURD:FECHA_PAGO)  ! Field CURD:FECHA_PAGO is a hot field or requires assignment from browse
  BRW10.AddField(CURD:IDINSCRIPCION,BRW10.Q.CURD:IDINSCRIPCION) ! Field CURD:IDINSCRIPCION is a hot field or requires assignment from browse
  BRW10.AddField(CURD:IDCURSO,BRW10.Q.CURD:IDCURSO)        ! Field CURD:IDCURSO is a hot field or requires assignment from browse
  BRW10.AddField(CURD:ID_MODULO,BRW10.Q.CURD:ID_MODULO)    ! Field CURD:ID_MODULO is a hot field or requires assignment from browse
  BRW10.AddField(CUR2:ID_MODULO,BRW10.Q.CUR2:ID_MODULO)    ! Field CUR2:ID_MODULO is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('CURSOS_INSCRIPCION',QuickWindow)           ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.QueryControl = ?Query
  BRW1.UpdateQuery(QBE8,1)
  BRW1.AskProcedure = 1                                    ! Will call: UpdateCURSO_INSCRIPCION
  BRW10.AddToolbarTarget(Toolbar)                          ! Browse accepts toolbar control
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
  ?Browse:1{Prop:Alrt,239} = SpaceKey
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
    Relate:CURSO_INSCRIPCION.Close
    Relate:CURSO_INSCRIPCION_DETALLE.Close
  END
  IF SELF.Opened
    INIMgr.Update('CURSOS_INSCRIPCION',QuickWindow)        ! Save window data to non-volatile store
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
    UpdateCURSO_INSCRIPCION
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
      FREE(CARNET)
      
      Loop i# = 1 to records(Tags)
          get(Tags,i#)
          CURI:IDINSCRIPCION = tags:Puntero
          LOCALI       = CUR:DESCRIPCION
          ACCESS:CURSO_INSCRIPCION.TRYFETCH(CURI:PK_CURSO_INSCRIPCION)
          PRO2:IDPROVEEDOR = CURI:ID_PROVEEDOR
          If NOT Access:PROVEEDORES.Fetch(PRO2:PK_PROVEEDOR)
                  NOMBRE       = PRO2:DESCRIPCION
                  DIRECCION    = PRO2:DIRECCION
                  
                  Add(carnet)
          end
      end
      
      
    OF ?Button16
      IF Loc:Nombre <> '' THEN
          BRW1.VIEW{PROP:SQLFILTER}= 'C.DESCRIPCION LIKE'''&CLIP(Loc:Nombre)&'%'''
          
      ELSE
          BRW1.VIEW{PROP:SQLFILTER}= ''
      END
      THISWINDOW.RESET(1)
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?DASTAG
      ThisWindow.Update()
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
        DO DASBRW::11:DASTAGONOFF
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
    OF ?DASTAGAll
      ThisWindow.Update()
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
        DO DASBRW::11:DASTAGALL
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
    OF ?Button7
      ThisWindow.Update()
      START(IDENTIFICACION_TAGS, 25000)
      ThisWindow.Reset
    OF ?DASUNTAGALL
      ThisWindow.Update()
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
        DO DASBRW::11:DASUNTAGALL
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
    OF ?DASREVTAG
      ThisWindow.Update()
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
        DO DASBRW::11:DASREVTAGALL
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
    OF ?DASSHOWTAG
      ThisWindow.Update()
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
        DO DASBRW::11:DASSHOWTAG
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
    OF ?EvoExportar
      ThisWindow.Update()
       Do PrintExBrowse9
    END
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
  OF ?Browse:1
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
    OF ?Browse:1
      !--------------------------------------------------------------------------
      ! DAS_Tagging
      !--------------------------------------------------------------------------
      IF KEYCODE() = MouseLeft AND (?Browse:1{PROPLIST:MouseDownRow} > 0) AND (DASBRW::11:TAGFLAG = 0)
        CASE ?Browse:1{PROPLIST:MouseDownField}
      
          OF 1
            DASBRW::11:TAGMOUSE = 1
            POST(EVENT:Accepted,?DASTAG)
               ?Browse:1{PROPLIST:MouseDownField} = 2
            CYCLE
         END
      END
      DASBRW::11:TAGFLAG = 0
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


BRW1.ResetFromView PROCEDURE

LOC:CANTIDAD:Cnt     LONG                                  ! Count variable for browse totals
  CODE
  SETCURSOR(Cursor:Wait)
  Relate:CURSO_INSCRIPCION.SetQuickScan(1)
  SELF.Reset
  IF SELF.UseMRP
     IF SELF.View{PROP:IPRequestCount} = 0
          SELF.View{PROP:IPRequestCount} = 60
     END
  END
  LOOP
    IF SELF.UseMRP
       IF SELF.View{PROP:IPRequestCount} = 0
            SELF.View{PROP:IPRequestCount} = 60
       END
    END
    CASE SELF.Next()
    OF Level:Notify
      BREAK
    OF Level:Fatal
      SETCURSOR()
      RETURN
    END
    SELF.SetQueueRecord
    LOC:CANTIDAD:Cnt += 1
  END
  SELF.View{PROP:IPRequestCount} = 0
  LOC:CANTIDAD = LOC:CANTIDAD:Cnt
  PARENT.ResetFromView
  Relate:CURSO_INSCRIPCION.SetQuickScan(0)
  SETCURSOR()


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
  !--------------------------------------------------------------------------
  ! DAS_Tagging
  !--------------------------------------------------------------------------
     TAGS.PUNTERO = CURI:IDINSCRIPCION
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


BRW1.TakeKey PROCEDURE

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


BRW1.ValidateRecord PROCEDURE

ReturnValue          BYTE,AUTO

BRW1::RecordStatus   BYTE,AUTO
  CODE
  ReturnValue = PARENT.ValidateRecord()
  BRW1::RecordStatus=ReturnValue
  IF BRW1::RecordStatus NOT=Record:OK THEN RETURN BRW1::RecordStatus.
  !--------------------------------------------------------------------------
  ! DAS_Tagging
  !--------------------------------------------------------------------------
     TAGS.PUNTERO = CURI:IDINSCRIPCION
     GET(TAGS,TAGS.PUNTERO)
    EXECUTE DASBRW::11:TAGDISPSTATUS
       IF ERRORCODE() THEN BRW1::RecordStatus = RECORD:FILTERED END
       IF ~ERRORCODE() THEN BRW1::RecordStatus = RECORD:FILTERED END
    END
  !--------------------------------------------------------------------------
  ! DAS_Tagging
  !--------------------------------------------------------------------------
  ReturnValue=BRW1::RecordStatus
  RETURN ReturnValue


BRW10.SetQueueRecord PROCEDURE

  CODE
  PARENT.SetQueueRecord
  
  IF (CURD:PAGADO = 'SI')
    SELF.Q.CUR2:NUMERO_MODULO_Icon = 1                     ! Set icon from icon list
  ELSIF (CURD:PAGADO = '')
    SELF.Q.CUR2:NUMERO_MODULO_Icon = 2                     ! Set icon from icon list
  ELSE
    SELF.Q.CUR2:NUMERO_MODULO_Icon = 0
  END


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

