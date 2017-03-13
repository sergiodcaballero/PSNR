

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('GESTION169.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! </summary>
INFORMES PROCEDURE 

LOC:TAREA            BYTE                                  ! 
BRW2::View:Browse    VIEW(INFORME)
                       PROJECT(INF:INFORME)
                       PROJECT(INF:FECHA)
                       PROJECT(INF:TERMINADO)
                       PROJECT(INF:IDINFORME)
                     END
Queue:Browse         QUEUE                            !Queue declaration for browse/combo box using ?List
INF:INFORME            LIKE(INF:INFORME)              !List box control field - type derived from field
INF:FECHA              LIKE(INF:FECHA)                !List box control field - type derived from field
INF:TERMINADO          LIKE(INF:TERMINADO)            !List box control field - type derived from field
INF:IDINFORME          LIKE(INF:IDINFORME)            !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Window               WINDOW('Informes'),AT(,,395,214),FONT('MS Sans Serif',8,,FONT:regular),CENTER,GRAY
                       LIST,AT(3,5,385,159),USE(?List),HVSCROLL,FORMAT('279L(2)|M~INFORME~@s255@40L(2)|M~FECHA' & |
  '~@d17@8L(2)|M~TERMINADO~@s2@56L(2)|M~IDINFORME~@n-14@'),FROM(Queue:Browse),IMM,MSG('Browsing Records'), |
  VCR
                       PROMPT('Tareas Pendientes:'),AT(7,169),USE(?Prompt1),FONT(,,,FONT:bold)
                       STRING(@n3),AT(87,169),USE(LOC:TAREA),FONT(,,,FONT:bold)
                       BUTTON('Tarea Realizada'),AT(6,185,85,18),USE(?Button2),LEFT,ICON(ICON:Tick),FLAT
                       BUTTON('&Salir'),AT(296,185,57,18),USE(?CancelButton),LEFT,ICON('salir.ico'),FLAT
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW2                 CLASS(BrowseClass)                    ! Browse using ?List
Q                      &Queue:Browse                  !Reference to browse queue
ResetFromView          PROCEDURE(),DERIVED
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
  GlobalErrors.SetProcedureName('INFORMES')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?List
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('INF:IDINFORME',INF:IDINFORME)                      ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:INFORME.Open                                      ! File INFORME used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW2.Init(?List,Queue:Browse.ViewPosition,BRW2::View:Browse,Queue:Browse,Relate:INFORME,SELF) ! Initialize the browse manager
  SELF.Open(Window)                                        ! Open window
  Do DefineListboxStyle
  BRW2.Q &= Queue:Browse
  BRW2.RetainRow = 0
  BRW2.AddSortOrder(,)                                     ! Add the sort order for  for sort order 1
  BRW2.SetFilter('(INF:TERMINADO = '''')')                 ! Apply filter expression to browse
  BRW2.AddField(INF:INFORME,BRW2.Q.INF:INFORME)            ! Field INF:INFORME is a hot field or requires assignment from browse
  BRW2.AddField(INF:FECHA,BRW2.Q.INF:FECHA)                ! Field INF:FECHA is a hot field or requires assignment from browse
  BRW2.AddField(INF:TERMINADO,BRW2.Q.INF:TERMINADO)        ! Field INF:TERMINADO is a hot field or requires assignment from browse
  BRW2.AddField(INF:IDINFORME,BRW2.Q.INF:IDINFORME)        ! Field INF:IDINFORME is a hot field or requires assignment from browse
  INIMgr.Fetch('INFORMES',Window)                          ! Restore window settings from non-volatile store
  BRW2.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:INFORME.Close
  END
  IF SELF.Opened
    INIMgr.Update('INFORMES',Window)                       ! Save window data to non-volatile store
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
    OF ?Button2
      A# = INF:IDINFORME
      INF:IDINFORME = A#
      ACCESS:INFORME.TRYFETCH(INF:PK_INFORME)
      INF:TERMINADO = 'SI'
      ACCEsS:INFORME.UPDATE()
      thiswindow.reset(1)
    OF ?CancelButton
       POST(EVENT:CloseWindow)
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


BRW2.ResetFromView PROCEDURE

LOC:TAREA:Cnt        LONG                                  ! Count variable for browse totals
  CODE
  SETCURSOR(Cursor:Wait)
  Relate:INFORME.SetQuickScan(1)
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
    LOC:TAREA:Cnt += 1
  END
  SELF.View{PROP:IPRequestCount} = 0
  LOC:TAREA = LOC:TAREA:Cnt
  PARENT.ResetFromView
  Relate:INFORME.SetQuickScan(0)
  SETCURSOR()

