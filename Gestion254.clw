

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('GESTION254.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION253.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION255.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Facturacion Total
!!! </summary>
FACTURACION_TOTAL PROCEDURE 

Window               WINDOW('Facturacion Total '),AT(,,185,70),FONT('MS Sans Serif',8,,FONT:regular),CENTER,GRAY
                       BUTTON('FACTURAR TOTAL SOCIOS'),AT(31,16,121,14),USE(?OkButton),LEFT,ICON(ICON:NextPage),DEFAULT, |
  FLAT
                       BUTTON('Cancelar'),AT(61,44,59,14),USE(?CancelButton),LEFT,ICON('cancelar.ico'),FLAT
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
  GlobalErrors.SetProcedureName('FACTURACION_TOTAL')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?OkButton
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:PERIODO_FACTURA.Open                              ! File PERIODO_FACTURA used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(Window)                                        ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('FACTURACION_TOTAL',Window)                 ! Restore window settings from non-volatile store
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
    Relate:PERIODO_FACTURA.Close
  END
  IF SELF.Opened
    INIMgr.Update('FACTURACION_TOTAL',Window)              ! Save window data to non-volatile store
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
      CLEAR (PER:RECORD,1)                                                !Point to first record
      SET (PER:IDX_PERIODO_FACTURA_PERIODO,PER:IDX_PERIODO_FACTURA_PERIODO)
      PREVIOUS(PERIODO_FACTURA)
      IF ERRORCODE()
          GLO:MES = MONTH (TODAY())
          GLO:ANO = YEAR (TODAY())
      ELSE
          GLO:MES     = PER:MES
          GLO:ANO     = PER:ANO
          IF PER:MES = 12 THEN
             GLO:MES = 1
             GLO:ANO = GLO:ANO + 1
          ELSE
             GLO:MES = GLO:MES + 1
          END
      END
      CLEAR(PERIODO_FACTURA)
      
      GLO:ESTADO = 'SIN DETALLE'
      GLO:PERIODO = GLO:ANO&(FORMAT(GLO:MES,@N02))
      
      
      CASE MESSAGE('SE FACTURARA EL PERIODO MES--> '&GLO:MES&' AÑO-->'&GLO:ANO,'FACTURACION TOTAL',ICON:Question,BUTTON:Yes+BUTTON:No,BUTTON:No,1)
      
                                                      !A ? icon with Yes and No buttons, the default button is No
      OF BUTTON:No                            !    the window is System Modal
      
      OF BUTTON:Yes
          
          !!!GUARDA PERIODO FACTURA ACTUAL
          PER:MES         = GLO:MES
          PER:ANO         = GLO:ANO
          PER:PERIODO     = PER:ANO&(FORMAT(PER:MES,@N02))
          PER:FECHA       = TODAY()
          PER:HORA        = CLOCK()
          PER:IDUSUARIO   = GLO:IDUSUARIO
          ADD(PERIODO_FACTURA)
          IF ERRORCODE() THEN MESSAGE(ERROR()).
      
          FACTURAR_CABECERA
          FACTURAR_DETALLE
      
          
      
          GLO:MES = 0
          GLO:ANO = 0
          GLO:PERIODO = ''
      
      END
      
      
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?OkButton
      ThisWindow.Update()
       POST(EVENT:CloseWindow)
    OF ?CancelButton
      ThisWindow.Update()
       POST(EVENT:CloseWindow)
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

