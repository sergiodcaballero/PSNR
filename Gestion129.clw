

   MEMBER('Gestion.clw')                                   ! This is a MEMBER module


   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('GESTION129.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('GESTION035.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION115.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION131.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('GESTION133.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Window
!!! </summary>
GENERAR_DISKETTE PROCEDURE 

QuickWindow          WINDOW('Generar Diskette al Banco'),AT(,,202,220),FONT('Arial',8,COLOR:Black,FONT:bold),RESIZE, |
  CENTER,GRAY,IMM,MDI,HLP('LIQUIDACION_PRESENTACION0'),SYSTEM
                       PROMPT('MES:'),AT(5,5),USE(?GLO:MES:Prompt)
                       COMBO(@n-14),AT(55,4,38,10),USE(GLO:MES),DROP(10),FROM('1|2|3|4|5|6|7|8|9|10|11|12')
                       PROMPT('ANO:'),AT(5,21),USE(?GLO:ANO:Prompt)
                       COMBO(@n-14),AT(55,20,39,10),USE(GLO:ANO),DROP(10),FROM('2005|2006|2007|2008|2009|2010|' & |
  '2011|2012|2015|2016')
                       PROMPT('OBRA SOCIAL:'),AT(5,37),USE(?Glo:IDOS:Prompt)
                       ENTRY(@n-7),AT(55,36,22,10),USE(Glo:IDOS),REQ
                       BUTTON('...'),AT(80,36,12,12),USE(?CallLookup)
                       STRING(@s30),AT(93,38),USE(OBR:NOMPRE_CORTO)
                       PROMPT('FECHA ACRED:'),AT(0,55),USE(?FECHA_DESDE:Prompt)
                       ENTRY(@D6),AT(54,53,46,10),USE(FECHA_DESDE),RIGHT(1),REQ
                       PROMPT('BANCO:'),AT(1,69),USE(?GLO:BANCO:Prompt)
                       ENTRY(@n-14),AT(53,69,22,10),USE(GLO:BANCO),REQ
                       BUTTON('...'),AT(78,69,12,12),USE(?CallLookup:2)
                       STRING(@s50),AT(91,71,107,10),USE(BAN2:DESCRIPCION)
                       PROMPT('Convenio: '),AT(51,84),USE(?Prompt6)
                       STRING(@n-11.0),AT(89,84),USE(BAN2:SUBEMPRESA)
                       STRING(@n-14),AT(132,84),USE(BAN2:CODIGO_BANCO)
                       LINE,AT(0,96,202,0),USE(?Line2),COLOR(COLOR:Black)
                       OPTION('GENERAR'),AT(43,97,116,25),USE(GLO:TIPO),BOXED
                         RADIO('NUEVO'),AT(47,108),USE(?GLO:TIPO:Radio1),VALUE('N')
                         RADIO('RECTIFICATORIA'),AT(87,108),USE(?GLO:TIPO:Radio2),VALUE('R')
                       END
                       LINE,AT(1,126,199,0),USE(?Line1),COLOR(COLOR:Black)
                       BUTTON('&Generar Diskette'),AT(118,133,80,26),USE(?Ok),LEFT,ICON(ICON:Save),CURSOR('mano.cur'), |
  FLAT,MSG('Acepta Operacion'),TIP('Acepta Operacion')
                       BUTTON('Simular Liquidación'),AT(6,131,80,26),USE(?Button4),LEFT,ICON(ICON:Help),FLAT
                       BUTTON('&Cancelar'),AT(77,170,49,14),USE(?Cancel),LEFT,ICON('cancelar.ico'),CURSOR('mano.cur'), |
  FLAT,MSG('Cancela Operacion'),TIP('Cancela Operacion')
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
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
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
  GlobalErrors.SetProcedureName('GENERAR_DISKETTE')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?GLO:MES:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Ok,RequestCancelled)                    ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Ok,RequestCompleted)                    ! Add the close control to the window manger
  END
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:BANCO.Open                                        ! File BANCO used by this procedure, so make sure it's RelationManager is open
  Relate:LIQUIDACION_ENTREGA_BANCO.Open                    ! File LIQUIDACION_ENTREGA_BANCO used by this procedure, so make sure it's RelationManager is open
  Relate:OBRA_SOCIAL.Open                                  ! File OBRA_SOCIAL used by this procedure, so make sure it's RelationManager is open
  Relate:RANKING.Open                                      ! File RANKING used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('GENERAR_DISKETTE',QuickWindow)             ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:BANCO.Close
    Relate:LIQUIDACION_ENTREGA_BANCO.Close
    Relate:OBRA_SOCIAL.Close
    Relate:RANKING.Close
  END
  IF SELF.Opened
    INIMgr.Update('GENERAR_DISKETTE',QuickWindow)          ! Save window data to non-volatile store
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
    EXECUTE Number
      SelectOBRA_SOCIAL
      SelectBANCO
    END
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
    OF ?Ok
      GLO:SUBEMPRESA= BAN2:SUBEMPRESA
      GLO:CODIGO_BANCO = BAN2:CODIGO_BANCO
      IF FECHA_DESDE <> 0 THEN
          IF GLO:TIPO <> ''  THEN
              GLO:PERIODO =  GLO:ANO&(FORMAT(GLO:MES,@N02))
              Glo:IDOS = OBR:IDOS
              GLO:ESTADO = ''
              !!!
              RANKING{PROP:SQL} = 'DELETE FROM RANKING'
              IF GLO:TIPO = 'N' THEN
                  BCO:DESCRIPCION   = 'NUEVA LIQUIDACION'
                  BCO:FECHA         = TODAY()
                  BCO:HORA          = CLOCK()
                  BCO:IDUSUARIO     = GLO:IDUSUARIO
                  BCO:MES           = GLO:MES
                  BCO:ANO           = GLO:ANO
                  BCO:PERIODO       = GLO:PERIODO
                  BCO:IDOS          = Glo:IDOS
                  BCO:TIPO          = 'N'
                  !!! CARGA
                  RANKING{PROP:SQL} = 'CALL sp_gen_liqu_banco_id'
                  NEXT(RANKING)
                  BCO:IDENTREGABNCO = RAN:C1
                  BCO:SECUENCIA     = RAN:C1
                  GLO:SECUENCIA =     RAN:C1 !! SE UTILIZA EN LA CARGA DEL DISKETTE
                  ACCESS:LIQUIDACION_ENTREGA_BANCO.INSERT()
              ELSE
                  BCO:DESCRIPCION   = 'RECTIFICATIVA LIQUIDACION'
                  BCO:FECHA         = TODAY()
                  BCO:HORA          = CLOCK()
                  BCO:IDUSUARIO     = GLO:IDUSUARIO
                  BCO:MES           = GLO:MES
                  BCO:ANO           = GLO:ANO
                  BCO:PERIODO       = GLO:PERIODO
                  BCO:IDOS          = Glo:IDOS
                  BCO:TIPO          = 'R'
                  !!! CARGA
                  RANKING{PROP:SQL} = 'CALL sp_gen_liqu_banco_id'
                  NEXT(RANKING)
                  BCO:IDENTREGABNCO = RAN:C1
                  BCO:SECUENCIA     = RAN:C1
                  GLO:SECUENCIA =     RAN:C1 !! SE UTILIZA EN LA CARGA DEL DISKETTE
                  ACCESS:LIQUIDACION_ENTREGA_BANCO.INSERT()
              END
              !!! LIMPIA RANKING
              RANKING{PROP:SQL} = 'DELETE FROM RANKING'
              OPEN(LIQUIDACION_DISKETTE)
              EMPTY(LIQUIDACION_DISKETTE)
              IF ERRORCODE() THEN
                  MESSAGE(ERROR())
                  CYCLE
              ELSE
                  CLOSE(LIQUIDACION_DISKETTE)
              END
          ELSE
              MESSAGE('Se debe incoporar un tipo de generación')
              select(?Glo:IDOS)
              cycle
          end
      ELSE
          MESSAGE('La fecha de ACREDITACIÓN es obligatoria')
      end
    OF ?Button4
      GLO:SUBEMPRESA= BAN2:SUBEMPRESA
      GLO:CODIGO_BANCO = BAN2:CODIGO_BANCO
      IF FECHA_DESDE <> 0 THEN
          IF GLO:TIPO <> ''  THEN
              GLO:PERIODO =  GLO:ANO&(FORMAT(GLO:MES,@N02))
              Glo:IDOS = OBR:IDOS
              GLO:ESTADO = ''
              !!! LIMPIA RANKING
              RANKING{PROP:SQL} = 'DELETE FROM RANKING'
              OPEN(LIQUIDACION_DISKETTE)
              EMPTY(LIQUIDACION_DISKETTE)
              IF ERRORCODE() THEN
                  MESSAGE(ERROR())
                  CYCLE
              ELSE
                  CLOSE(LIQUIDACION_DISKETTE)
              END
          END
      END
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Glo:IDOS
      IF Glo:IDOS OR ?Glo:IDOS{PROP:Req}
        OBR:IDOS = Glo:IDOS
        IF Access:OBRA_SOCIAL.TryFetch(OBR:PK_OBRA_SOCIAL)
          IF SELF.Run(1,SelectRecord) = RequestCompleted
            Glo:IDOS = OBR:IDOS
          ELSE
            SELECT(?Glo:IDOS)
            CYCLE
          END
        END
      END
      ThisWindow.Reset()
    OF ?CallLookup
      ThisWindow.Update()
      OBR:IDOS = Glo:IDOS
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        Glo:IDOS = OBR:IDOS
      END
      ThisWindow.Reset(1)
    OF ?GLO:BANCO
      IF GLO:BANCO OR ?GLO:BANCO{PROP:Req}
        BAN2:IDBANCO = GLO:BANCO
        IF Access:BANCO.TryFetch(BAN2:PK_BANCO)
          IF SELF.Run(2,SelectRecord) = RequestCompleted
            GLO:BANCO = BAN2:IDBANCO
          ELSE
            SELECT(?GLO:BANCO)
            CYCLE
          END
        END
      END
      ThisWindow.Reset()
    OF ?CallLookup:2
      ThisWindow.Update()
      BAN2:IDBANCO = GLO:BANCO
      IF SELF.Run(2,SelectRecord) = RequestCompleted
        GLO:BANCO = BAN2:IDBANCO
      END
      ThisWindow.Reset(1)
    OF ?Ok
      ThisWindow.Update()
      START(LIQUIDACION_GENERAR_CONTROL_CBU, 25000)
      ThisWindow.Reset
    OF ?Button4
      ThisWindow.Update()
      START(LIQUIDACION_GENERAR_CONTROL_CBU_2, 25000)
      ThisWindow.Reset
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


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

