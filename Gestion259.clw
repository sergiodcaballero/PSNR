

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('GESTION259.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION165.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION261.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION263.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Generar Cupon de Pagos
!!! </summary>
CUPON_DE_PAGO PROCEDURE 

Window               WINDOW('Generación de Cupon de Pago'),AT(,,199,75),FONT('Arial',10,,FONT:regular),CENTER,GRAY, |
  IMM,MDI,SYSTEM
                       BUTTON('&Generar Cupón'),AT(55,10,87,22),USE(?OkButton),LEFT,ICON(ICON:NextPage),DEFAULT,FLAT
                       BUTTON('&Cancelar'),AT(68,52,51,14),USE(?CancelButton),LEFT,ICON(ICON:Cross),FLAT
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
  GlobalErrors.SetProcedureName('CUPON_DE_PAGO')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?OkButton
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:LOTE.Open                                         ! File LOTE used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(Window)                                        ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('CUPON_DE_PAGO',Window)                     ! Restore window settings from non-volatile store
  SELF.SetAlerts()
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
    Relate:LOTE.Close
  END
  IF SELF.Opened
    INIMgr.Update('CUPON_DE_PAGO',Window)                  ! Save window data to non-volatile store
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
    OF ?OkButton
      OPEN(RANKING)
      EMPTY(RANKING)
      IF ERRORCODE() THEN
          MESSAGE(ERROR())
          CYCLE
      END
      CLOSE(RANKING)
      
      
      !!! CARGAR LOTE
      n# = 0
      CLEAR(LOT:RECORD,1)
      SET(LOT:PK_LOTE,LOT:PK_LOTE)
      PREVIOUS(LOTE)
      IF ERRORCODE()
          N# = 1
      ELSE
          N# = LOT:IDLOTE + 1
      END
      CLEAR(LOT:RECORD)
      LOT:IDLOTE = N#
      LOT:FECHA = TODAY()
      LOT:HORA  = CLOCK()
      LOT:IDUSUARIO = GLO:IDUSUARIO
      ADD(LOTE)
      IF ERRORCODE() THEN MESSAGE(ERROR()).
      GLO:IDLOTE = LOT:IDLOTE
      
      GLO:IDSOLICITUD = 0
      
      !!!
      
      CUPON_DE_PAGO1()
    OF ?CancelButton
       POST(EVENT:CloseWindow)
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?OkButton
      ThisWindow.Update()
      CUPON_DE_PAGO2()
      CUPON_DE_PAGO4:IMPRIMIR()
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

