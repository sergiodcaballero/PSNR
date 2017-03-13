

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('GESTION172.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION171.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION173.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION174.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION175.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION176.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! DEUDA TOTAL PARA TODOS LOS SOCIOS 
!!! </summary>
INFORME_ESTADO_DEUDA_TOTAL PROCEDURE 

Window               WINDOW('ESTADO DE DEUDA TOTAL'),AT(,,324,121),FONT('Arial',8,,FONT:regular),CENTER,GRAY,IMM, |
  MDI,SYSTEM
                       PROMPT('MES DESDE:'),AT(5,3),USE(?GLO:MES:Prompt)
                       COMBO(@n-14),AT(55,3,60,10),USE(GLO:MES),DROP(10),FROM('1|2|3|4|5|6|7|8|9|10|11|12')
                       PROMPT('MES HASTA:'),AT(191,3),USE(?GLO:MES_HASTA:Prompt)
                       COMBO(@n-14),AT(241,3,60,10),USE(GLO:MES_HASTA),RIGHT(1),DROP(10),FROM('1|2|3|4|5|6|7|8' & |
  '|9|10|11|12')
                       PROMPT('AÑO DESDE:'),AT(3,20),USE(?GLO:ANO:Prompt)
                       COMBO(@n-14),AT(53,20,60,10),USE(GLO:ANO),DROP(10),FROM('2005|2006|2007|2008|2009|2010|' & |
  '2011|2012|2015|2016')
                       PROMPT('AÑO HASTA:'),AT(190,20),USE(?GLO:ANO_HASTA:Prompt)
                       COMBO(@n-14),AT(240,20,60,10),USE(GLO:ANO_HASTA),RIGHT(1),DROP(10),FROM('2005|2006|2007' & |
  '|2008|2009|2010|2011|2012|2015|2016')
                       BUTTON('&Cancelar'),AT(129,99,59,14),USE(?CancelButton),LEFT,ICON('cancelar.ico'),FLAT
                       GROUP('Impagos'),AT(40,37,85,48),USE(?Group1),BOXED
                         BUTTON('&Detallado'),AT(50,49,59,13),USE(?OkButton),LEFT,ICON(ICON:Print1),DEFAULT,FLAT
                         BUTTON('Totales'),AT(50,65,59,13),USE(?Button6),LEFT,ICON(ICON:Print1),FLAT
                       END
                       GROUP('Pagos'),AT(199,37,85,48),USE(?Group2),BOXED
                         BUTTON('Detallado'),AT(209,49,59,13),USE(?Button4),LEFT,ICON(ICON:Print1),FLAT
                         BUTTON('Totales'),AT(209,65,59,13),USE(?Button7),LEFT,ICON(ICON:Print1),FLAT
                       END
                       LINE,AT(0,34,324,0),USE(?Line1),COLOR(COLOR:Black)
                       LINE,AT(3,93,321,0),USE(?Line3),COLOR(COLOR:Black)
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
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
  GlobalErrors.SetProcedureName('INFORME_ESTADO_DEUDA_TOTAL')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?GLO:MES:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:CIRCULO.Open                                      ! File CIRCULO used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(Window)                                        ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('INFORME_ESTADO_DEUDA_TOTAL',Window)        ! Restore window settings from non-volatile store
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
    INIMgr.Update('INFORME_ESTADO_DEUDA_TOTAL',Window)     ! Save window data to non-volatile store
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
    OF ?CancelButton
       POST(EVENT:CloseWindow)
    OF ?OkButton
      CARGO_VARIABLE_PERIDOS()
    OF ?Button6
      CARGO_VARIABLE_PERIDOS()
    OF ?Button4
      CARGO_VARIABLE_PERIDOS()
    OF ?Button7
      CARGO_VARIABLE_PERIDOS()
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?OkButton
      ThisWindow.Update()
      IMPRIMIR_ESTADO_DEUDA_IMPAGOS()
    OF ?Button6
      ThisWindow.Update()
      IMPRIMIR_ESTADO_DEUDA_IMPAGOS_TOTALES()
    OF ?Button4
      ThisWindow.Update()
      IMPRIMIR_ESTADO_DEUDA_PAGOS()
    OF ?Button7
      ThisWindow.Update()
      IMPRIMIR_ESTADO_DEUDA_PAGOS_TOTALES()
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

