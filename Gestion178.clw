

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('GESTION178.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION034.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION176.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION177.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION179.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION180.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION181.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! DEUDA POR CIRUCLO
!!! </summary>
INFORME_ESTADO_DEUDA_CIRCULO PROCEDURE 

Window               WINDOW('Nº CIRCULO:'),AT(,,324,142),FONT('Arial',8,,FONT:regular),CENTER,GRAY,IMM,MDI,SYSTEM
                       PROMPT('MESDESDE:'),AT(9,2),USE(?GLO:MES:Prompt)
                       COMBO(@n-14),AT(59,2,60,10),USE(GLO:MES),DROP(10),FROM('1|2|3|4|5|6|7|8|9|10|11|12')
                       PROMPT('MES HASTA:'),AT(179,2),USE(?GLO:MES_HASTA:Prompt)
                       COMBO(@n-14),AT(229,2,60,10),USE(GLO:MES_HASTA),RIGHT(1),DROP(10),FROM('1|2|3|4|5|6|7|8' & |
  '|9|10|11|12')
                       PROMPT('ANO DESDE:'),AT(9,16),USE(?GLO:ANO:Prompt)
                       COMBO(@n-14),AT(59,16,60,10),USE(GLO:ANO),DROP(10),FROM('2005|2006|2007|2008|2009|2010|' & |
  '2011|2012|2015|2016')
                       PROMPT('AÑO HASTA:'),AT(179,16),USE(?GLO:ANO_HASTA:Prompt)
                       COMBO(@n-14),AT(229,17,60,10),USE(GLO:ANO_HASTA),RIGHT(1),DROP(10),FROM('2005|2006|2007' & |
  '|2008|2009|2010|2011|2012|2015|2016')
                       ENTRY(@n-14),AT(77,39,60,10),USE(GLO:IDSOCIO),REQ
                       BUTTON('...'),AT(137,38,12,12),USE(?CallLookup)
                       STRING(@s50),AT(157,39),USE(CIR:DESCRIPCION)
                       BUTTON('&Cancelar'),AT(126,121,59,14),USE(?CancelButton),LEFT,ICON('cancelar.ico'),FLAT
                       PROMPT('Nº DISTRITO:'),AT(34,39),USE(?GLO:IDSOCIO:Prompt)
                       LINE,AT(2,58,322,0),USE(?Line2),COLOR(COLOR:Black)
                       GROUP('Impagos'),AT(40,63,85,48),USE(?Group1),BOXED
                         BUTTON('&Detallado'),AT(50,75,59,13),USE(?OkButton),LEFT,ICON(ICON:Print1),DEFAULT,FLAT
                         BUTTON('Totales'),AT(50,91,59,13),USE(?Button6),LEFT,ICON(ICON:Print1),FLAT
                       END
                       GROUP('Pagos'),AT(199,63,85,48),USE(?Group2),BOXED
                         BUTTON('Detallado'),AT(209,75,59,13),USE(?Button4),LEFT,ICON(ICON:Print1),FLAT
                         BUTTON('Totales'),AT(209,91,59,13),USE(?Button7),LEFT,ICON(ICON:Print1),FLAT
                       END
                       LINE,AT(0,33,324,0),USE(?Line1),COLOR(COLOR:Black)
                       LINE,AT(3,116,321,0),USE(?Line3),COLOR(COLOR:Black)
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
  GlobalErrors.SetProcedureName('INFORME_ESTADO_DEUDA_CIRCULO')
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
  INIMgr.Fetch('INFORME_ESTADO_DEUDA_CIRCULO',Window)      ! Restore window settings from non-volatile store
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
    INIMgr.Update('INFORME_ESTADO_DEUDA_CIRCULO',Window)   ! Save window data to non-volatile store
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
    SelectCIRCULO
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
    OF ?GLO:IDSOCIO
      IF GLO:IDSOCIO OR ?GLO:IDSOCIO{PROP:Req}
        CIR:IDCIRCULO = GLO:IDSOCIO
        IF Access:CIRCULO.TryFetch(CIR:PK_CIRCULO)
          IF SELF.Run(1,SelectRecord) = RequestCompleted
            GLO:IDSOCIO = CIR:IDCIRCULO
          ELSE
            SELECT(?GLO:IDSOCIO)
            CYCLE
          END
        END
      END
      ThisWindow.Reset()
    OF ?CallLookup
      ThisWindow.Update()
      CIR:IDCIRCULO = GLO:IDSOCIO
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        GLO:IDSOCIO = CIR:IDCIRCULO
      END
      ThisWindow.Reset(1)
    OF ?OkButton
      ThisWindow.Update()
      IMPRIMIR_ESTADO_DEUDA_CIRCULO_IMPAGOS()
    OF ?Button6
      ThisWindow.Update()
      IMPRIMIR_ESTADO_DEUDA_CIRCULO_IMPAGOS_TOTALES()
    OF ?Button4
      ThisWindow.Update()
      IMPRIMIR_ESTADO_DEUDA_CIRCULO_PAGOS()
    OF ?Button7
      ThisWindow.Update()
      IMPRIMIR_ESTADO_DEUDA_CIRCULO_PAGOS_TOTALES()
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

