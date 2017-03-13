

   MEMBER('TRANS_NOMBRE.clw')                              ! This is a MEMBER module


   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('TRANS_NOMBRE001.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('TRANS_NOMBRE002.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('TRANS_NOMBRE004.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Frame
!!! Wizard Application for D:\bajados\BORRAR\medicina\TRANS_NOMBRE.dct
!!! </summary>
Main PROCEDURE 

SQLOpenWindow        WINDOW('Initializing Database'),AT(,,208,26),FONT('MS Sans Serif',8,,FONT:regular),CENTER,GRAY,DOUBLE
                       STRING('This process could take several seconds.'),AT(27,12)
                       IMAGE(Icon:Connect),AT(4,4,23,17)
                       STRING('Please wait while the program connects to the database.'),AT(27,3)
                     END

AppFrame             APPLICATION('Application'),AT(,,505,319),FONT('Arial',8,COLOR:Black,FONT:bold),RESIZE,CENTER, |
  ICON('WAFRAME.ICO'),MAX,STATUS(-1,80,120,45),SYSTEM,IMM
                       MENUBAR,USE(?Menubar)
                         MENU('&Archivo'),USE(?FileMenu)
                           ITEM('&Configuracion Impresora'),USE(?PrintSetup),MSG('Configuracion Impresora'),STD(STD:PrintSetup)
                           ITEM,SEPARATOR
                           ITEM('&Salir'),USE(?Exit),MSG('Salir de la Aplicacion'),STD(STD:Close)
                         END
                         MENU('&Browse'),USE(?BrowseMenu)
                           ITEM('Browse the SOCIOS file'),USE(?ListaSOCIOS),MSG('Browse SOCIOS')
                           ITEM('Separar Nombre'),USE(?BrowseSepararNombre)
                         END
                       END
                       TOOLBAR,AT(0,0,400,16),USE(?Toolbar)
                         BUTTON,AT(4,2,14,14),USE(?Toolbar:Top,Toolbar:Top),ICON('WAVCRFIRST.ICO'),DISABLE,FLAT,TIP('Go to the ' & |
  'First Page')
                         BUTTON,AT(18,2,14,14),USE(?Toolbar:PageUp,Toolbar:PageUp),ICON('WAVCRPRIOR.ICO'),DISABLE,FLAT, |
  TIP('Go to the Prior Page')
                         BUTTON,AT(32,2,14,14),USE(?Toolbar:Up,Toolbar:Up),ICON('WAVCRUP.ICO'),DISABLE,FLAT,TIP('Go to the ' & |
  'Prior Record')
                         BUTTON,AT(46,2,14,14),USE(?Toolbar:Locate,Toolbar:Locate),ICON('WAFIND.ICO'),DISABLE,FLAT, |
  TIP('Locate record')
                         BUTTON,AT(60,2,14,14),USE(?Toolbar:Down,Toolbar:Down),ICON('WAVCRDOWN.ICO'),DISABLE,FLAT,TIP('Go to the ' & |
  'Next Record')
                         BUTTON,AT(74,2,14,14),USE(?Toolbar:PageDown,Toolbar:PageDown),ICON('WAVCRNEXT.ICO'),DISABLE, |
  FLAT,TIP('Go to the Next Page')
                         BUTTON,AT(88,2,14,14),USE(?Toolbar:Bottom,Toolbar:Bottom),ICON('WAVCRLAST.ICO'),DISABLE,FLAT, |
  TIP('Go to the Last Page')
                         BUTTON,AT(102,2,14,14),USE(?Toolbar:Select,Toolbar:Select),ICON('WAMARK.ICO'),DISABLE,FLAT, |
  TIP('Select This Record')
                         BUTTON,AT(116,2,14,14),USE(?Toolbar:Insert,Toolbar:Insert),ICON('WAINSERT.ICO'),DISABLE,FLAT, |
  TIP('Insert a New Record')
                         BUTTON,AT(130,2,14,14),USE(?Toolbar:Change,Toolbar:Change),ICON('WACHANGE.ICO'),DISABLE,FLAT, |
  TIP('Edit This Record')
                         BUTTON,AT(144,2,14,14),USE(?Toolbar:Delete,Toolbar:Delete),ICON('WADELETE.ICO'),DISABLE,FLAT, |
  TIP('Delete This Record')
                         BUTTON,AT(158,2,14,14),USE(?Toolbar:History,Toolbar:History),ICON('WADITTO.ICO'),DISABLE,FLAT, |
  TIP('Previous value')
                         BUTTON,AT(172,2,14,14),USE(?Toolbar:Help,Toolbar:Help),ICON('WAVCRHELP.ICO'),DISABLE,FLAT, |
  TIP('Get Help')
                       END
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass

  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
!---------------------------------------------------------------------------
Menu::Menubar ROUTINE                                      ! Code for menu items on ?Menubar
Menu::FileMenu ROUTINE                                     ! Code for menu items on ?FileMenu
Menu::BrowseMenu ROUTINE                                   ! Code for menu items on ?BrowseMenu
  CASE ACCEPTED()
  OF ?ListaSOCIOS
    START(ListaSOCIOS, 050000)
  OF ?BrowseSepararNombre
    START(SEPARAR_NOMBRE, 25000)
  END

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('Main')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = 1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  SETCURSOR(Cursor:Wait)
  OPEN(SQLOpenWindow)
  ACCEPT
    IF EVENT() = Event:OpenWindow
  Relate:SOCIOS.Open                                       ! File SOCIOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
      POST(EVENT:CloseWindow)
    END
  END
  CLOSE(SQLOpenWindow)
  SETCURSOR()
  SELF.Open(AppFrame)                                      ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('Main',AppFrame)                            ! Restore window settings from non-volatile store
  SELF.SetAlerts()
      AppFrame{PROP:TabBarVisible}  = False
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:SOCIOS.Close
  END
  IF SELF.Opened
    INIMgr.Update('Main',AppFrame)                         ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


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
    OF ?Toolbar:Top
    OROF ?Toolbar:PageUp
    OROF ?Toolbar:Up
    OROF ?Toolbar:Locate
    OROF ?Toolbar:Down
    OROF ?Toolbar:PageDown
    OROF ?Toolbar:Bottom
    OROF ?Toolbar:Select
    OROF ?Toolbar:Insert
    OROF ?Toolbar:Change
    OROF ?Toolbar:Delete
    OROF ?Toolbar:History
    OROF ?Toolbar:Help
      IF SYSTEM{PROP:Active} <> THREAD()
        POST(EVENT:Accepted,ACCEPTED(),SYSTEM{Prop:Active} )
        CYCLE
      END
    ELSE
      DO Menu::Menubar                                     ! Process menu items on ?Menubar menu
      DO Menu::FileMenu                                    ! Process menu items on ?FileMenu menu
      DO Menu::BrowseMenu                                  ! Process menu items on ?BrowseMenu menu
    END
  ReturnValue = PARENT.TakeAccepted()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue

