

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('GESTION257.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION013.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION256.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION258.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Facturacion Total
!!! </summary>
FACTURACION_INDIVIDUAL PROCEDURE 

Window               WINDOW('Facturacion Individual'),AT(,,250,91),FONT('Arial',8,,FONT:regular),CENTER,GRAY,IMM, |
  MDI,SYSTEM
                       PROMPT('IDSOCIO:'),AT(8,10),USE(?GLO:IDSOCIO:Prompt)
                       ENTRY(@n-14),AT(43,10,60,10),USE(GLO:IDSOCIO),REQ
                       BUTTON('...'),AT(106,9,12,12),USE(?CallLookup)
                       STRING(@s30),AT(123,10),USE(SOC:NOMBRE)
                       STRING(@n-14),AT(159,27),USE(SOC:MATRICULA)
                       LINE,AT(1,38,249,0),USE(?Line1),COLOR(COLOR:Black)
                       PROMPT('Matricula:'),AT(124,27),USE(?Prompt2)
                       BUTTON('FACTURAR SOCIO'),AT(82,45,86,14),USE(?OkButton),LEFT,ICON(ICON:NextPage),DEFAULT,FLAT
                       BUTTON('Cancelar'),AT(94,71,59,14),USE(?CancelButton),LEFT,ICON('cancelar.ico'),FLAT
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
  GlobalErrors.SetProcedureName('FACTURACION_INDIVIDUAL')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?GLO:IDSOCIO:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:COBERTURA.Open                                    ! File COBERTURA used by this procedure, so make sure it's RelationManager is open
  Relate:CONTROL_FACTURA.Open                              ! File CONTROL_FACTURA used by this procedure, so make sure it's RelationManager is open
  Relate:PERIODO_FACTURA.Open                              ! File PERIODO_FACTURA used by this procedure, so make sure it's RelationManager is open
  Relate:SOCIOS.Open                                       ! File SOCIOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(Window)                                        ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('FACTURACION_INDIVIDUAL',Window)            ! Restore window settings from non-volatile store
  SELF.SetAlerts()
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
    Relate:COBERTURA.Close
    Relate:CONTROL_FACTURA.Close
    Relate:PERIODO_FACTURA.Close
    Relate:SOCIOS.Close
  END
  IF SELF.Opened
    INIMgr.Update('FACTURACION_INDIVIDUAL',Window)         ! Save window data to non-volatile store
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
    SelectSOCIOS
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
    OF ?OkButton
      IF SOC:NOMBRE = '' THEN
          SELECT(?GLO:IDSOCIO)
          CYCLE
      ELSE
      !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          !!!  RECORRE COBERTURA POR SOCIOS
          COB:IDCOBERTURA = SOC:IDCOBERTURA
          GET(COBERTURA,COB:PK_COBERTURA)
          IF ERRORCODE() = 35 THEN
              MESSAGE ('NO ENCONTRO COBERTURA')
          ELSE
              IF COB:FORMA_PAGO = 'ANUAL' THEN
                  COBERTURA" = 'ANUAL'
              END
          END
      
          CON3:IDSOCIO = GLO:IDSOCIO
          GET (CONTROL_FACTURA,CON3:PK_CONTROL_FACTURA)
          IF ERRORCODE() = 35 THEN
              MESSAGE ('ES LA 1º FACTURA QUE SE EMITE PARA EL COLEGIADO')
              GLO:MES = MONTH(TODAY())
              GLO:ANO = YEAR(TODAY())
              GLO:PERIODO = GLO:ANO&(FORMAT(GLO:MES,@N02))
          ELSE
              IF COBERTURA" = 'ANUAL' THEN
                  GLO:MES = CON3:MES
                  GLO:ANO = CON3:ANO
                  PERIODO2# = CON3:PEDIODO
                  GLO:ANO = GLO:ANO + 1 !! SOLO AUMENTA EL AÑO
               ELSE
                  !! ES MENSUAL
                  COBERTURA" = 'MENSUAL'
                  GLO:MES = CON3:MES
                  GLO:ANO = CON3:ANO
                  PERIODO2# = CON3:PEDIODO
                  IF CON3:MES = 12 THEN
                      GLO:MES = 1
                      GLO:ANO = GLO:ANO + 1
                  ELSE
                       GLO:MES = GLO:MES + 1
                  END
              END
          END
      !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
      
          GLO:ESTADO = 'SIN DETALLE'
          GLO:PERIODO = GLO:ANO&(FORMAT(GLO:MES,@N02))
      
          !!! BORRAR
          
      
          CASE MESSAGE('SE FACTURARA EL PERIODO MES--> '&GLO:MES&' AÑO-->'&GLO:ANO,'FACTURACION'&COBERTURA",ICON:Question,BUTTON:Yes+BUTTON:No,BUTTON:No,1)
      
                                                          !A ? icon with Yes and No buttons, the default button is No
          OF BUTTON:No                            !    the window is System Modal
      
          OF BUTTON:Yes
              COBERTURA" = ''
              FACTURAR_CABECERA1
              FACTURAR_DETALLE1
              !!!GUARDA PERIODO FACTURA ACTUAL
      
              GLO:MES = 0
              GLO:ANO = 0
              GLO:PERIODO = ''
      
          END
      END
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
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

