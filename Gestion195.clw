

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('GESTION195.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION013.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION162.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION176.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION194.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION196.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION197.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION198.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION199.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION200.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! DEUDA POR SOCIO 
!!! </summary>
INFORME_ESTADO_DEUDA_SOCIO PROCEDURE 

Window               WINDOW('ESTADO DE DEUDA POR SOCIO'),AT(,,324,155),FONT('Arial',8,,FONT:regular),CENTER,GRAY, |
  IMM,MDI,SYSTEM
                       PROMPT('MES DESDE:'),AT(11,3),USE(?GLO:MES:Prompt)
                       COMBO(@n-14),AT(60,3,60,10),USE(GLO:MES),DROP(10),FROM('1|2|3|4|5|6|7|8|9|10|11|12')
                       PROMPT('MES HASTA:'),AT(164,3),USE(?GLO:MES_HASTA:Prompt)
                       COMBO(@n-14),AT(215,3,60,10),USE(GLO:MES_HASTA),RIGHT(1),DROP(10),FROM('1|2|3|4|5|6|7|8' & |
  '|9|10|11|12')
                       PROMPT('AÑO HASTA:'),AT(10,17),USE(?GLO:ANO:Prompt)
                       COMBO(@n-14),AT(60,17,60,10),USE(GLO:ANO),DROP(10),FROM('2005|2006|2007|2008|2009|2010|' & |
  '2011|2012|2015|2016')
                       PROMPT('AÑO HASTA:'),AT(165,17),USE(?GLO:ANO_HASTA:Prompt)
                       COMBO(@n-14),AT(215,17,60,10),USE(GLO:ANO_HASTA),RIGHT(1),DROP(10),FROM('2005|2006|2007' & |
  '|2008|2009|2010|2011|2012|2015|2016')
                       PROMPT('IDSOCIO:'),AT(6,36),USE(?GLO:IDSOCIO:Prompt)
                       ENTRY(@n-14),AT(39,36,60,10),USE(GLO:IDSOCIO),REQ
                       BUTTON('...'),AT(100,35,12,12),USE(?CallLookup)
                       STRING(@s30),AT(121,36),USE(SOC:NOMBRE)
                       PROMPT('Matric.'),AT(245,36),USE(?Prompt2)
                       STRING(@n-14),AT(267,36),USE(SOC:MATRICULA)
                       BUTTON('&Listar Impagos'),AT(23,63,63,23),USE(?OkButton),LEFT,ICON(ICON:Print1),DEFAULT,FLAT
                       BUTTON('Listar Pagos'),AT(130,63,63,23),USE(?Button4),LEFT,ICON(ICON:Print1),FLAT
                       BUTTON('Listar Totales'),AT(237,63,63,23),USE(?Button5),LEFT,ICON(ICON:Print1),FLAT
                       BUTTON('Listar Impagos Legal'),AT(23,94,63,26),USE(?Button6),FONT(,,,FONT:underline),LEFT, |
  ICON(ICON:Print1),FLAT
                       BUTTON('Listador Pagos Legal'),AT(130,94,63,26),USE(?Button7),LEFT,ICON(ICON:Print1),FLAT
                       BUTTON('Listado de Totales'),AT(237,94,63,26),USE(?Button8),LEFT,ICON(ICON:Print1),FLAT
                       BUTTON('&Cancelar'),AT(125,132,59,14),USE(?CancelButton),LEFT,ICON('cancelar.ico'),FLAT
                       LINE,AT(2,55,322,0),USE(?Line2),COLOR(COLOR:Black)
                       LINE,AT(0,30,324,0),USE(?Line1),COLOR(COLOR:Black)
                       LINE,AT(0,126,324,0),USE(?Line3),COLOR(COLOR:Black)
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
  GlobalErrors.SetProcedureName('INFORME_ESTADO_DEUDA_SOCIO')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?GLO:MES:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:SOCIOS.Open                                       ! File SOCIOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(Window)                                        ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('INFORME_ESTADO_DEUDA_SOCIO',Window)        ! Restore window settings from non-volatile store
  SELF.SetAlerts()
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
    INIMgr.Update('INFORME_ESTADO_DEUDA_SOCIO',Window)     ! Save window data to non-volatile store
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
      CARGO_VARIABLE_PERIDOS()
      CARGA_EMAIL()
    OF ?Button4
      CARGO_VARIABLE_PERIDOS()
      CARGA_EMAIL()
    OF ?Button5
      CARGO_VARIABLE_PERIDOS()
      CARGA_EMAIL()
    OF ?Button6
      CARGO_VARIABLE_PERIDOS()
      CARGA_EMAIL()
    OF ?Button7
      CARGO_VARIABLE_PERIDOS()
      CARGA_EMAIL()
    OF ?Button8
      CARGO_VARIABLE_PERIDOS()
      CARGA_EMAIL()
    OF ?CancelButton
       POST(EVENT:CloseWindow)
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
      IMPRIMIR_ESTADO_DEUDA_SOCIO_IMPAGOS()
    OF ?Button4
      ThisWindow.Update()
      IMPRIMIR_ESTADO_DEUDA_SOCIO_PAGOS()
    OF ?Button5
      ThisWindow.Update()
      IMPRIMIR_ESTADO_DEUDA_SOCIO_TOTALES()
    OF ?Button6
      ThisWindow.Update()
      IMPRIMIR_ESTADO_DEUDA_SOCIO_IMPAGOS_LEGAL()
    OF ?Button7
      ThisWindow.Update()
      IMPRIMIR_ESTADO_DEUDA_SOCIO_PAGOS_LEGAL()
    OF ?Button8
      ThisWindow.Update()
      IMPRIMIR_ESTADO_DEUDA_SOCIO_TOTAL_LEGAL()
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

