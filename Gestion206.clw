

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('GESTION206.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Splash
!!! The About Window
!!! </summary>
AboutWindow PROCEDURE 

Window               WINDOW('Acerca de ...'),AT(,,235,118),FONT('MS Sans Serif',8,,FONT:regular),DOUBLE,TILED,CENTER, |
  GRAY,HLP('~AboutWindow'),PALETTE(256)
                       STRING('Copyright 2010'),AT(91,22,53,10),USE(?CopyrightDate),TRN
                       STRING('Produced by ASC Sergio Daniel Caballero'),AT(16,44,203,10),USE(?Developer),FONT('Arial', |
  11,COLOR:Black,FONT:bold,CHARSET:ANSI),TRN
                       STRING('sergiodcaballero@gmail.com'),AT(54,61,133,10),USE(?AboutHeading),FONT('Arial',10,COLOR:Black, |
  FONT:bold,CHARSET:ANSI),TRN
                       PANEL,AT(20,76,215,4),USE(?Panel:6),BEVEL(1,0,1536)
                       PROMPT('Cuidado:  este programa  es protegido por Derecho de Autor.  Prohibida si repro' & |
  'ducción o Distribución de este programa, o parte de el, su violación conlleva severa' & |
  's penalidades crimilaes y civiles.'),AT(8,91,163,21),USE(?PromptCopyright),FONT('Small Fonts', |
  6),TRN
                       BUTTON,AT(207,84,19,21),USE(?Close),LEFT,ICON('salir.ico'),FLAT
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
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

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('AboutWindow')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?CopyrightDate
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  SELF.Open(Window)                                        ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('AboutWindow',Window)                       ! Restore window settings from non-volatile store
  TARGET{Prop:Timer} = 0                                   ! Close window on timer event, so configure timer
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.Opened
    INIMgr.Update('AboutWindow',Window)                    ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
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
  ReturnValue = PARENT.TakeWindowEvent()
    CASE EVENT()
    OF EVENT:LoseFocus
        POST(Event:CloseWindow)                            ! Splash window will close when focus is lost
    OF Event:Timer
      POST(Event:CloseWindow)                              ! Splash window will close on event timer
    ELSE
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue

