

   MEMBER('TRANS_NOMBRE.clw')                              ! This is a MEMBER module


   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('TRANS_NOMBRE003.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Actualizacion SOCIOS
!!! </summary>
ActualizarSOCIOS PROCEDURE 

CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
History::SOC:Record  LIKE(SOC:RECORD),THREAD
QuickWindow          WINDOW('Actualizacion SOCIOS'),AT(,,358,238),FONT('Arial',8,COLOR:Black,FONT:bold),RESIZE, |
  CENTER,GRAY,IMM,MDI,HLP('ActualizarSOCIOS'),SYSTEM
                       SHEET,AT(4,4,350,153),USE(?CurrentTab)
                         TAB('General'),USE(?Tab:1)
                           PROMPT('IDSOCIO:'),AT(8,20),USE(?SOC:IDSOCIO:Prompt),TRN
                           ENTRY(@n-14),AT(100,20,64,10),USE(SOC:IDSOCIO),RIGHT(1)
                           PROMPT('MATRICULA:'),AT(8,34),USE(?SOC:MATRICULA:Prompt),TRN
                           ENTRY(@n-14),AT(100,34,64,10),USE(SOC:MATRICULA),RIGHT(1)
                           PROMPT('IDZONA:'),AT(8,48),USE(?SOC:IDZONA:Prompt),TRN
                           ENTRY(@n-14),AT(100,48,64,10),USE(SOC:IDZONA),RIGHT(1)
                           PROMPT('IDCOBERTURA:'),AT(8,62),USE(?SOC:IDCOBERTURA:Prompt),TRN
                           ENTRY(@n-14),AT(100,62,64,10),USE(SOC:IDCOBERTURA),RIGHT(1)
                           PROMPT('IDLOCALIDAD:'),AT(8,76),USE(?SOC:IDLOCALIDAD:Prompt),TRN
                           ENTRY(@n-14),AT(100,76,64,10),USE(SOC:IDLOCALIDAD),RIGHT(1)
                           PROMPT('IDUSUARIO:'),AT(8,90),USE(?SOC:IDUSUARIO:Prompt),TRN
                           ENTRY(@n-14),AT(100,90,64,10),USE(SOC:IDUSUARIO),RIGHT(1)
                           PROMPT('NOMBRE:'),AT(8,104),USE(?SOC:NOMBRE:Prompt),TRN
                           ENTRY(@s50),AT(100,104,204,10),USE(SOC:NOMBRE)
                           PROMPT('N_DOCUMENTO:'),AT(8,118),USE(?SOC:N_DOCUMENTO:Prompt),TRN
                           ENTRY(@n-14),AT(100,118,64,10),USE(SOC:N_DOCUMENTO),RIGHT(1)
                           PROMPT('DIRECCION:'),AT(8,132),USE(?SOC:DIRECCION:Prompt),TRN
                           ENTRY(@s100),AT(100,132,250,10),USE(SOC:DIRECCION)
                           PROMPT('FECHA_ALTA:'),AT(8,146),USE(?SOC:FECHA_ALTA:Prompt),TRN
                           ENTRY(@d17),AT(100,146,104,10),USE(SOC:FECHA_ALTA),RIGHT(1)
                         END
                         TAB('General (cont.)'),USE(?Tab:2)
                           PROMPT('EMAIL:'),AT(8,20),USE(?SOC:EMAIL:Prompt),TRN
                           ENTRY(@s50),AT(100,20,204,10),USE(SOC:EMAIL)
                           PROMPT('FECHA_NACIMIENTO:'),AT(8,34),USE(?SOC:FECHA_NACIMIENTO:Prompt),TRN
                           ENTRY(@d17),AT(100,34,104,10),USE(SOC:FECHA_NACIMIENTO),RIGHT(1)
                           PROMPT('NRO_VIEJO:'),AT(8,48),USE(?SOC:NRO_VIEJO:Prompt),TRN
                           ENTRY(@n-14),AT(100,48,64,10),USE(SOC:NRO_VIEJO),RIGHT(1)
                           PROMPT('BENEF:'),AT(8,62),USE(?SOC:BENEF:Prompt),TRN
                           ENTRY(@n-14),AT(100,62,64,10),USE(SOC:BENEF),RIGHT(1)
                           PROMPT('FECHA_BAJA:'),AT(8,76),USE(?SOC:FECHA_BAJA:Prompt),TRN
                           ENTRY(@d17),AT(100,76,104,10),USE(SOC:FECHA_BAJA),RIGHT(1)
                           PROMPT('OBSERVACION:'),AT(8,90),USE(?SOC:OBSERVACION:Prompt),TRN
                           ENTRY(@s100),AT(100,90,250,10),USE(SOC:OBSERVACION)
                           PROMPT('IDVENDEDOR:'),AT(8,104),USE(?SOC:IDVENDEDOR:Prompt),TRN
                           ENTRY(@n-14),AT(100,104,64,10),USE(SOC:IDVENDEDOR),RIGHT(1)
                           PROMPT('INGRESO:'),AT(8,118),USE(?SOC:INGRESO:Prompt),TRN
                           ENTRY(@n-14),AT(100,118,64,10),USE(SOC:INGRESO),RIGHT(1)
                           PROMPT('DESCUENTO:'),AT(8,132),USE(?SOC:DESCUENTO:Prompt),TRN
                           ENTRY(@n-14),AT(100,132,64,10),USE(SOC:DESCUENTO),RIGHT(1)
                           PROMPT('MES:'),AT(8,146),USE(?SOC:MES:Prompt),TRN
                           ENTRY(@n-14),AT(100,146,64,10),USE(SOC:MES),RIGHT(1)
                         END
                         TAB('General (cont. 2)'),USE(?Tab:3)
                           PROMPT('ANO:'),AT(8,20),USE(?SOC:ANO:Prompt),TRN
                           ENTRY(@n-14),AT(100,20,64,10),USE(SOC:ANO),RIGHT(1)
                           PROMPT('PERIODO_ALTA:'),AT(8,34),USE(?SOC:PERIODO_ALTA:Prompt),TRN
                           ENTRY(@n-14),AT(100,34,64,10),USE(SOC:PERIODO_ALTA),RIGHT(1)
                           PROMPT('SEXO:'),AT(8,48),USE(?SOC:SEXO:Prompt),TRN
                           ENTRY(@s1),AT(100,48,40,10),USE(SOC:SEXO)
                           PROMPT('CANTIDAD:'),AT(8,62),USE(?SOC:CANTIDAD:Prompt),TRN
                           ENTRY(@n-14),AT(100,62,64,10),USE(SOC:CANTIDAD),RIGHT(1)
                           PROMPT('HORA_ALTA:'),AT(8,76),USE(?SOC:HORA_ALTA:Prompt),TRN
                           ENTRY(@t7),AT(100,76,104,10),USE(SOC:HORA_ALTA),RIGHT(1)
                           PROMPT('TELEFONO:'),AT(8,90),USE(?SOC:TELEFONO:Prompt),TRN
                           ENTRY(@s30),AT(100,90,124,10),USE(SOC:TELEFONO)
                           PROMPT('DIRECCION_LABORAL:'),AT(8,104),USE(?SOC:DIRECCION_LABORAL:Prompt),TRN
                           ENTRY(@s50),AT(100,104,204,10),USE(SOC:DIRECCION_LABORAL)
                           PROMPT('TELEFONO_LABORAL:'),AT(8,118),USE(?SOC:TELEFONO_LABORAL:Prompt),TRN
                           ENTRY(@s30),AT(100,118,124,10),USE(SOC:TELEFONO_LABORAL)
                           PROMPT('FIN_COBERTURA:'),AT(8,132),USE(?SOC:FIN_COBERTURA:Prompt),TRN
                           ENTRY(@d17),AT(100,132,104,10),USE(SOC:FIN_COBERTURA),RIGHT(1)
                           PROMPT('BAJA:'),AT(8,146),USE(?SOC:BAJA:Prompt),TRN
                           ENTRY(@s2),AT(100,146,40,10),USE(SOC:BAJA)
                         END
                         TAB('General (cont. 3)'),USE(?Tab:4)
                           PROMPT('ID_TIPO_DOC:'),AT(8,20),USE(?SOC:ID_TIPO_DOC:Prompt),TRN
                           ENTRY(@n-14),AT(100,20,64,10),USE(SOC:ID_TIPO_DOC),RIGHT(1)
                           PROMPT('IDCIRCULO:'),AT(8,34),USE(?SOC:IDCIRCULO:Prompt),TRN
                           ENTRY(@n-14),AT(100,34,64,10),USE(SOC:IDCIRCULO),RIGHT(1)
                           PROMPT('LIBRO:'),AT(8,48),USE(?SOC:LIBRO:Prompt),TRN
                           ENTRY(@n-14),AT(100,48,64,10),USE(SOC:LIBRO),RIGHT(1)
                           PROMPT('FOLIO:'),AT(8,62),USE(?SOC:FOLIO:Prompt),TRN
                           ENTRY(@n-14),AT(100,62,64,10),USE(SOC:FOLIO),RIGHT(1)
                           PROMPT('ACTA:'),AT(8,76),USE(?SOC:ACTA:Prompt),TRN
                           ENTRY(@s20),AT(100,76,84,10),USE(SOC:ACTA)
                           PROMPT('PROVISORIO:'),AT(8,90),USE(?SOC:PROVISORIO:Prompt),TRN
                           ENTRY(@s1),AT(100,90,40,10),USE(SOC:PROVISORIO)
                           PROMPT('IDINSTITUCION:'),AT(8,104),USE(?SOC:IDINSTITUCION:Prompt),TRN
                           ENTRY(@n-14),AT(100,104,64,10),USE(SOC:IDINSTITUCION),RIGHT(1)
                           PROMPT('FECHA_EGRESO:'),AT(8,118),USE(?SOC:FECHA_EGRESO:Prompt),TRN
                           ENTRY(@d17),AT(100,118,104,10),USE(SOC:FECHA_EGRESO),RIGHT(1)
                           PROMPT('BAJA_TEMPORARIA:'),AT(8,132),USE(?SOC:BAJA_TEMPORARIA:Prompt),TRN
                           ENTRY(@s2),AT(100,132,40,10),USE(SOC:BAJA_TEMPORARIA)
                           PROMPT('OTRAS_MATRICULAS:'),AT(8,146),USE(?SOC:OTRAS_MATRICULAS:Prompt),TRN
                           ENTRY(@s50),AT(100,146,204,10),USE(SOC:OTRAS_MATRICULAS)
                         END
                         TAB('General (cont. 4)'),USE(?Tab:5)
                           PROMPT('OTRAS_CERTIFICACIONES:'),AT(8,20),USE(?SOC:OTRAS_CERTIFICACIONES:Prompt),TRN
                           ENTRY(@s50),AT(100,20,204,10),USE(SOC:OTRAS_CERTIFICACIONES)
                           PROMPT('FECHA_TITULO:'),AT(8,34),USE(?SOC:FECHA_TITULO:Prompt),TRN
                           ENTRY(@d17),AT(100,34,104,10),USE(SOC:FECHA_TITULO),RIGHT(1)
                           PROMPT('LUGAR_NACIMIENTO:'),AT(8,48),USE(?SOC:LUGAR_NACIMIENTO:Prompt),TRN
                           ENTRY(@s50),AT(100,48,204,10),USE(SOC:LUGAR_NACIMIENTO)
                           PROMPT('CELULAR:'),AT(8,62),USE(?SOC:CELULAR:Prompt),TRN
                           ENTRY(@s50),AT(100,62,204,10),USE(SOC:CELULAR)
                           PROMPT('IDPROVEEDOR:'),AT(8,76),USE(?SOC:IDPROVEEDOR:Prompt),TRN
                           ENTRY(@n-14),AT(100,76,64,10),USE(SOC:IDPROVEEDOR),RIGHT(1)
                           PROMPT('TIPOIVA:'),AT(8,90),USE(?SOC:TIPOIVA:Prompt),TRN
                           ENTRY(@n-14),AT(100,90,64,10),USE(SOC:TIPOIVA),RIGHT(1)
                           PROMPT('CUIT:'),AT(8,104),USE(?SOC:CUIT:Prompt),TRN
                           ENTRY(@s11),AT(100,104,48,10),USE(SOC:CUIT)
                           PROMPT('APELLIDO:'),AT(8,118),USE(?SOC:APELLIDO:Prompt),TRN
                           ENTRY(@s50),AT(100,118,204,10),USE(SOC:APELLIDO)
                           PROMPT('NOMBRES:'),AT(8,132),USE(?SOC:NOMBRES:Prompt),TRN
                           ENTRY(@s50),AT(100,132,204,10),USE(SOC:NOMBRES)
                         END
                       END
                       STRING(@s50),AT(67,193),USE(APELLIDO)
                       BUTTON('pROCESO '),AT(9,181,49,14),USE(?Button3)
                       STRING(@s50),AT(67,206),USE(NOMBRES)
                       BUTTON('&Aceptar'),AT(253,213,49,14),USE(?OK),LEFT,ICON('ok.ico'),CURSOR('mano.cur'),DEFAULT, |
  FLAT,MSG('Confirma y Actualiza el Formulario'),TIP('Confirma y Actualiza el Formulario')
                       BUTTON('&Cancelar'),AT(306,213,49,14),USE(?Cancel),LEFT,ICON('cancelar.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Cancela Operacion'),TIP('Cancela Operacion')
                     END

ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
ToolbarForm          ToolbarUpdateClass                    ! Form Toolbar Manager
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

CurCtrlFeq          LONG
FieldColorQueue     QUEUE
Feq                   LONG
OldColor              LONG
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

ThisWindow.Ask PROCEDURE

  CODE
  CASE SELF.Request                                        ! Configure the action message text
  OF ViewRecord
    ActionMessage = 'Visualizando Registro'
  OF InsertRecord
    ActionMessage = 'Insertando Registro'
  OF ChangeRecord
    ActionMessage = 'Cambiando Registro'
  END
  QuickWindow{PROP:Text} = ActionMessage                   ! Display status message in title bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('ActualizarSOCIOS')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?SOC:IDSOCIO:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  SELF.AddUpdateFile(Access:SOCIOS)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(SOC:Record,History::SOC:Record)
  SELF.AddHistoryField(?SOC:IDSOCIO,1)
  SELF.AddHistoryField(?SOC:MATRICULA,2)
  SELF.AddHistoryField(?SOC:IDZONA,3)
  SELF.AddHistoryField(?SOC:IDCOBERTURA,4)
  SELF.AddHistoryField(?SOC:IDLOCALIDAD,5)
  SELF.AddHistoryField(?SOC:IDUSUARIO,6)
  SELF.AddHistoryField(?SOC:NOMBRE,7)
  SELF.AddHistoryField(?SOC:N_DOCUMENTO,8)
  SELF.AddHistoryField(?SOC:DIRECCION,9)
  SELF.AddHistoryField(?SOC:FECHA_ALTA,10)
  SELF.AddHistoryField(?SOC:EMAIL,11)
  SELF.AddHistoryField(?SOC:FECHA_NACIMIENTO,12)
  SELF.AddHistoryField(?SOC:NRO_VIEJO,13)
  SELF.AddHistoryField(?SOC:BENEF,14)
  SELF.AddHistoryField(?SOC:FECHA_BAJA,15)
  SELF.AddHistoryField(?SOC:OBSERVACION,16)
  SELF.AddHistoryField(?SOC:IDVENDEDOR,17)
  SELF.AddHistoryField(?SOC:INGRESO,18)
  SELF.AddHistoryField(?SOC:DESCUENTO,19)
  SELF.AddHistoryField(?SOC:MES,20)
  SELF.AddHistoryField(?SOC:ANO,21)
  SELF.AddHistoryField(?SOC:PERIODO_ALTA,22)
  SELF.AddHistoryField(?SOC:SEXO,23)
  SELF.AddHistoryField(?SOC:CANTIDAD,24)
  SELF.AddHistoryField(?SOC:HORA_ALTA,25)
  SELF.AddHistoryField(?SOC:TELEFONO,26)
  SELF.AddHistoryField(?SOC:DIRECCION_LABORAL,27)
  SELF.AddHistoryField(?SOC:TELEFONO_LABORAL,28)
  SELF.AddHistoryField(?SOC:FIN_COBERTURA,29)
  SELF.AddHistoryField(?SOC:BAJA,30)
  SELF.AddHistoryField(?SOC:ID_TIPO_DOC,31)
  SELF.AddHistoryField(?SOC:IDCIRCULO,32)
  SELF.AddHistoryField(?SOC:LIBRO,33)
  SELF.AddHistoryField(?SOC:FOLIO,34)
  SELF.AddHistoryField(?SOC:ACTA,35)
  SELF.AddHistoryField(?SOC:PROVISORIO,36)
  SELF.AddHistoryField(?SOC:IDINSTITUCION,37)
  SELF.AddHistoryField(?SOC:FECHA_EGRESO,38)
  SELF.AddHistoryField(?SOC:BAJA_TEMPORARIA,39)
  SELF.AddHistoryField(?SOC:OTRAS_MATRICULAS,40)
  SELF.AddHistoryField(?SOC:OTRAS_CERTIFICACIONES,41)
  SELF.AddHistoryField(?SOC:FECHA_TITULO,42)
  SELF.AddHistoryField(?SOC:LUGAR_NACIMIENTO,43)
  SELF.AddHistoryField(?SOC:CELULAR,44)
  SELF.AddHistoryField(?SOC:IDPROVEEDOR,45)
  SELF.AddHistoryField(?SOC:TIPOIVA,46)
  SELF.AddHistoryField(?SOC:CUIT,47)
  SELF.AddHistoryField(?SOC:APELLIDO,48)
  SELF.AddHistoryField(?SOC:NOMBRES,49)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:SOCIOS.Open                                       ! File SOCIOS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:SOCIOS
  IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing ! Setup actions for ViewOnly Mode
    SELF.InsertAction = Insert:None
    SELF.DeleteAction = Delete:None
    SELF.ChangeAction = Change:None
    SELF.CancelAction = Cancel:Cancel
    SELF.OkControl = 0
  ELSE
    SELF.ChangeAction = Change:Caller                      ! Changes allowed
    SELF.CancelAction = Cancel:Cancel+Cancel:Query         ! Confirm cancel
    SELF.OkControl = ?OK
    IF SELF.PrimeUpdate() THEN RETURN Level:Notify.
  END
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    ?SOC:IDSOCIO{PROP:ReadOnly} = True
    ?SOC:MATRICULA{PROP:ReadOnly} = True
    ?SOC:IDZONA{PROP:ReadOnly} = True
    ?SOC:IDCOBERTURA{PROP:ReadOnly} = True
    ?SOC:IDLOCALIDAD{PROP:ReadOnly} = True
    ?SOC:IDUSUARIO{PROP:ReadOnly} = True
    ?SOC:NOMBRE{PROP:ReadOnly} = True
    ?SOC:N_DOCUMENTO{PROP:ReadOnly} = True
    ?SOC:DIRECCION{PROP:ReadOnly} = True
    ?SOC:FECHA_ALTA{PROP:ReadOnly} = True
    ?SOC:EMAIL{PROP:ReadOnly} = True
    ?SOC:FECHA_NACIMIENTO{PROP:ReadOnly} = True
    ?SOC:NRO_VIEJO{PROP:ReadOnly} = True
    ?SOC:BENEF{PROP:ReadOnly} = True
    ?SOC:FECHA_BAJA{PROP:ReadOnly} = True
    ?SOC:OBSERVACION{PROP:ReadOnly} = True
    ?SOC:IDVENDEDOR{PROP:ReadOnly} = True
    ?SOC:INGRESO{PROP:ReadOnly} = True
    ?SOC:DESCUENTO{PROP:ReadOnly} = True
    ?SOC:MES{PROP:ReadOnly} = True
    ?SOC:ANO{PROP:ReadOnly} = True
    ?SOC:PERIODO_ALTA{PROP:ReadOnly} = True
    ?SOC:SEXO{PROP:ReadOnly} = True
    ?SOC:CANTIDAD{PROP:ReadOnly} = True
    ?SOC:HORA_ALTA{PROP:ReadOnly} = True
    ?SOC:TELEFONO{PROP:ReadOnly} = True
    ?SOC:DIRECCION_LABORAL{PROP:ReadOnly} = True
    ?SOC:TELEFONO_LABORAL{PROP:ReadOnly} = True
    ?SOC:FIN_COBERTURA{PROP:ReadOnly} = True
    ?SOC:BAJA{PROP:ReadOnly} = True
    ?SOC:ID_TIPO_DOC{PROP:ReadOnly} = True
    ?SOC:IDCIRCULO{PROP:ReadOnly} = True
    ?SOC:LIBRO{PROP:ReadOnly} = True
    ?SOC:FOLIO{PROP:ReadOnly} = True
    ?SOC:ACTA{PROP:ReadOnly} = True
    ?SOC:PROVISORIO{PROP:ReadOnly} = True
    ?SOC:IDINSTITUCION{PROP:ReadOnly} = True
    ?SOC:FECHA_EGRESO{PROP:ReadOnly} = True
    ?SOC:BAJA_TEMPORARIA{PROP:ReadOnly} = True
    ?SOC:OTRAS_MATRICULAS{PROP:ReadOnly} = True
    ?SOC:OTRAS_CERTIFICACIONES{PROP:ReadOnly} = True
    ?SOC:FECHA_TITULO{PROP:ReadOnly} = True
    ?SOC:LUGAR_NACIMIENTO{PROP:ReadOnly} = True
    ?SOC:CELULAR{PROP:ReadOnly} = True
    ?SOC:IDPROVEEDOR{PROP:ReadOnly} = True
    ?SOC:TIPOIVA{PROP:ReadOnly} = True
    ?SOC:CUIT{PROP:ReadOnly} = True
    ?SOC:APELLIDO{PROP:ReadOnly} = True
    ?SOC:NOMBRES{PROP:ReadOnly} = True
    DISABLE(?Button3)
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('ActualizarSOCIOS',QuickWindow)             ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  SELF.AddItem(ToolbarForm)
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
    INIMgr.Update('ActualizarSOCIOS',QuickWindow)          ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Run PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run()
  IF SELF.Request = ViewRecord                             ! In View Only mode always signal RequestCancelled
    ReturnValue = RequestCancelled
  END
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
    OF ?Button3
      n#=1
      gg1# =  LEN(CLIP(SOC:NOMBRE))
      loop
          if  n# > LEN(SOC:NOMBRE) THEN BREAK.
          if  SOC:NOMBRE[n#]=''
              APELLIDO = LEFT (CLIP(SOC:NOMBRE),n#-1)
              GG# = GG1# - n#
              NOMBRES  = RIGHT(CLIP(SOC:NOMBRE),GG#)
              message('entro con Nombre --> '&CLIP(SOC:NOMBRE)&', Apellido -->'&APELLIDO&', Nombres -->'&NOMBRES&', y len ='&n#&', LEN NOMBRE -1  -->'&gg#)
              BREAK
          END
          n#= n# + 1
          
      END
      THISWINDOW.RESET(1)
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?OK
      ThisWindow.Update()
      IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing THEN
         POST(EVENT:CloseWindow)
      END
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

