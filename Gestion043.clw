

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('GESTION043.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION042.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION044.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Exportar Datos al Ministerio de Salud
!!! </summary>
Export_Ministerio PROCEDURE 

Window               WINDOW('Exportar Datos al Ministerio de Salud '),AT(,,181,64),FONT('MS Sans Serif',8,,FONT:regular), |
  CENTER,GRAY
                       BUTTON('&Generar Archivo'),AT(41,6,100,18),USE(?OkButton),LEFT,ICON(ICON:Save),DEFAULT,FLAT
                       BUTTON('&Cancelar'),AT(53,41,63,14),USE(?CancelButton),LEFT,ICON('cancelar.ico'),FLAT
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
  GlobalErrors.SetProcedureName('Export_Ministerio')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?OkButton
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.Open(Window)                                        ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('Export_Ministerio',Window)                 ! Restore window settings from non-volatile store
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.Opened
    INIMgr.Update('Export_Ministerio',Window)              ! Save window data to non-volatile store
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
      MESSAGE('Se generará los archivos para ser enviados al | Ministerio de Salud de la Pcia. de Río Negro')
      open(minsalud)
      empty(minsalud)
      if errorcode() then
          Message('Ocurrio un error en Exportar Padron al Ministerio')
          cycle
      end
      close(minesp)
      open(minesp)
      empty(minesp)
      if errorcode() then
          Message('Ocurrio un error en Exportar Padron al Ministerio')
          cycle
      end
      close(minesp)
      
      EXPORT_PADRON_MINISTERIO()
      EXPORT_ESPECIALIDAD_MINISTERIO()
    OF ?CancelButton
       POST(EVENT:CloseWindow)
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?OkButton
      ThisWindow.Update()
      !!! CAMBIO DE NOMBRE
      A"= 'PASICOLOGOS_'
      B" = YEAR(TODAY())
      C" = MONTH(TODAY())
      SS" = clip(A")&clip(B")&'_'&clip(C")&'.msm'
      copy ('MINSALUD.TXT', 'PROFE.TXT')
      COPY ('MINESP.TXT', 'ESP.TXT')
      RENAME ('PROFE.TXT', SS")
      
      AA"= '`PSICOLOGOS_ESPE_'
      B" = YEAR(TODAY())
      C" = MONTH(TODAY())
      SSS" = clip(AA")&clip(B")&'_'&clip(C")&'.msm'
      rename ('ESP.TXT',SSS")
      
      MESSAGE('Se realizó exportación  con Exito| El archivo generado se llama '&clip(SS")&' y '&clip(SSS")&' | Los mismos se encuentran ubicados en  '&PATH()&'| Copielo en un diskette ','Exportación de Padrón',ICON:EXCLAMATION)
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

