

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABQUERY.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('GESTION211.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION210.INC'),ONCE        !Req'd for module callout resolution
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
  ADD(QPar12)   ! 29 Gestion211.clw
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
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
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

